import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:magueyapp/presentation/widgets/custom_bottom_navigation_bar.dart';
import 'package:magueyapp/theme/my_colors.dart';

import '../../../../theme/my_icons.dart';
import '../../../../theme/text_styling.dart';

final textStyles = TextStyleCustom();

class ProductSelectScreen extends StatelessWidget {
  static const String route = 'brand-select';

  const ProductSelectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2B2B2B),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Image.asset(
                MyIcons.brandIcon, // Replace with your logo
                height: 50,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          spacing: 10,
                          children: [
                            Text(
                              'MEZCAL',
                              style: textStyles.font_10w400Black.copyWith(
                                color: MyColors.brown97805F,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.5,
                                decoration: TextDecoration.underline,
                                decorationColor: MyColors.brown97805F,
                              ),
                            ),
                            Text(
                              '|',
                              style: textStyles.font_10w400Black.copyWith(
                                color: MyColors.brown97805F,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'AGUA MAGICA',
                              style: textStyles.font_10w400Black.copyWith(
                                color: MyColors.brown97805F,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.5,
                                decoration: TextDecoration.underline,
                                decorationColor: MyColors.brown97805F,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Enchanted Ensamble',
                          style: textStyles.font_28w700Black.copyWith(
                            color: const Color(0xFFE3FF0A),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 20),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/images/temp/enchanted_ensamble.jpeg', // Replace with your actual image
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Wrap(
                              spacing: 15,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Text(
                                  'Add to Favorites',
                                  style: textStyles.font_14w400.copyWith(
                                    color: MyColors.brown97805F,
                                    decoration: TextDecoration.underline,
                                    decorationColor: MyColors.brown97805F,
                                  ),
                                ),
                                Text(
                                  'Leave A Review',
                                  style: textStyles.font_14w400.copyWith(
                                    color: MyColors.brown97805F,
                                    decoration: TextDecoration.underline,
                                    decorationColor: MyColors.brown97805F,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '\$\$\$',
                              style: textStyles.font_14w400.copyWith(
                                color: MyColors.green908C00,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Wrap(
                          spacing: 10,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            AnimatedRatingStars(
                              initialRating: 4,
                              minRating: 0.0,
                              maxRating: 5.0,
                              filledColor: MyColors.orangeFD5944,
                              emptyColor: MyColors.grey3F3F3F,
                              filledIcon: Icons.star,
                              halfFilledIcon: Icons.star_half,
                              emptyIcon: Icons.star,
                              onChanged: (double rating) {},
                              displayRatingValue: true,
                              interactiveTooltips: true,
                              customFilledIcon: Icons.star,
                              customHalfFilledIcon: Icons.star_half,
                              customEmptyIcon: Icons.star,
                              starSize: 20.0,
                              animationDuration:
                                  const Duration(milliseconds: 100),
                              animationCurve: Curves.easeInOut,
                              readOnly: false,
                            ),
                            Text(
                              'REVIEWS (200+)',
                              style: textStyles.font_12w500.copyWith(
                                color: MyColors.greyEBEBEB.withOpacity(0.2),
                                decoration: TextDecoration.underline,
                                decorationColor:
                                    MyColors.greyEBEBEB.withOpacity(0.2),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'An award-winning and ultra-premium sipping mezcal handcrafted from 7-15 year old agaves, that offers a crisp, smooth, and flavorful experience, inspiring the palate with its complex layers.',
                          style: textStyles.font_15w700.copyWith(
                            color: const Color(0xFFE2D7C1),
                            fontWeight: FontWeight.w500,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Nose: Unique blend of cooked maguey, with vague notes of smoke, bananas, and almonds.',
                          style: textStyles.font_15w700.copyWith(
                            color: const Color(0xFFE2D7C1),
                            fontWeight: FontWeight.w500,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Taste: Smooth on the palate. Feels fresh with a slightly spicy flavor, as if drinking water from the river. Sweet notes with clove, caramel, banana, almonds, and peach essence.',
                          style: textStyles.font_15w700.copyWith(
                            color: const Color(0xFFE2D7C1),
                            fontWeight: FontWeight.w500,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 26),
                        Center(
                          child: SvgPicture.string(
                            '''
                              <svg width="57" height="51" viewBox="0 0 57 51" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <g clip-path="url(#clip0_489_190)">
                                <path d="M23.2855 38.6555C25.0565 39.8084 27.7885 39.1361 29.6003 38.4148C32.122 37.4011 34.1484 35.2371 34.7777 32.739C39.8159 33.3927 44.5821 35.9899 47.7752 39.9775C48.0173 39.6302 48.244 39.2651 48.4479 38.8949C45.5021 35.3312 41.3398 32.879 36.8219 31.8889C36.2105 31.7566 35.594 31.6472 34.9687 31.5671C35.0554 30.4106 34.8359 29.2178 34.2288 28.0525C33.1665 26.0024 31.2625 24.4075 29.1178 23.1866C32.7027 20.6677 35.8836 17.5104 38.5962 14.0388C38.2857 13.7929 37.9651 13.5496 37.6469 13.3164C34.8899 16.8477 31.6355 20.056 27.9324 22.5561C26.3082 21.7497 24.6132 21.1341 23.0773 20.6567C18.6439 19.2941 13.8948 18.9943 9.3295 19.7883C7.05701 20.1827 4.38454 20.7265 2.51044 22.1443C1.10836 23.2054 0.445996 25.0365 1.68771 26.5119C3.00582 28.0762 5.5314 28.4716 7.4291 28.7768C9.76403 29.1447 12.1365 29.1897 14.4855 28.9273C19.4248 28.3741 23.9424 26.5764 27.9769 23.955C29.7361 24.911 31.3483 26.0986 32.5049 27.6009C33.459 28.8354 33.8173 30.1715 33.7346 31.4512C32.4358 31.3571 31.1182 31.3812 29.8237 31.54C27.5471 31.8111 24.5316 32.3658 22.9594 34.1884C21.8386 35.4866 21.7194 37.6508 23.2881 38.6656L23.2855 38.6555ZM26.7483 23.3245C23.2707 25.476 19.4374 27.0094 15.2822 27.6081C13.3539 27.8888 11.3946 27.9611 9.45271 27.8022C7.54386 27.6457 5.30186 27.3678 3.57962 26.4511C2.46793 25.856 1.72367 24.7037 2.69868 23.5773C3.38969 22.7818 4.45878 22.3503 5.42767 22.0143C7.24864 21.3933 9.13478 20.9665 11.0493 20.738C14.9684 20.2744 18.9908 20.6492 22.7618 21.806C24.0511 22.2051 25.423 22.6968 26.7457 23.3144L26.7483 23.3245ZM23.6185 35.3244C24.5962 33.63 27.3311 33.1407 29.1183 32.8361C30.5791 32.5869 32.0632 32.5154 33.531 32.6156C32.9049 34.8049 31.0114 36.703 28.6329 37.4915C27.6309 37.8251 26.5132 38.0636 25.4496 38.0236C23.9221 37.9655 22.7382 36.8267 23.6121 35.3206L23.6185 35.3244Z" fill="#E3FF0A"/>
                                </g>
                                <defs>
                                <clipPath id="clip0_489_190">
                                <rect width="30" height="48.3379" fill="white" transform="translate(56.8826 24.791) rotate(120.855)"/>
                                </clipPath>
                                </defs>
                              </svg>
                            ''',
                          ),
                        ),
                        const SizedBox(height: 26),
                        Center(
                          child: Text(
                            'FLAVOR PROFILE',
                            textAlign: TextAlign.center,
                            style: textStyles.font_13w300.copyWith(
                              color: MyColors.brown97805F,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(height: 26),
                        Center(
                          child: Wrap(
                            spacing: 20,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            alignment: WrapAlignment.center,
                            children: [
                              Text(
                                'CITRUS',
                                textAlign: TextAlign.center,
                                style: textStyles.font_17w400Black.copyWith(
                                  color: MyColors.green908C00,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                'CHOCOLATE',
                                textAlign: TextAlign.center,
                                style: textStyles.font_17w400Black.copyWith(
                                  color: MyColors.green908C00,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                'SMOKE',
                                textAlign: TextAlign.center,
                                style: textStyles.font_17w400Black.copyWith(
                                  color: MyColors.green908C00,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 26),
                        Center(
                          child: Text(
                            'SPECIFICATIONS',
                            textAlign: TextAlign.center,
                            style: textStyles.font_14w400.copyWith(
                              color: MyColors.brown97805F,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(height: 26),
                        buildSpecification(
                            specification: 'Region',
                            value: 'San Juan del Rio, Oaxaca'),
                        buildSpecification(
                            specification: 'Mezcalero',
                            value: 'Rogelio Juan Hernandez'),
                        buildSpecification(
                            specification: 'Spirit Type', value: 'Ensamble'),
                        buildSpecification(
                            specification: 'Category',
                            value: 'Mezcal Artesanal'),
                        buildSpecification(
                            specification: 'Agave', value: 'Espadín / Tobalá'),
                        buildSpecification(
                            specification: 'Age', value: 'Joven'),
                        buildSpecification(
                            specification: 'Fermentation',
                            value: 'Wooden Vats'),
                        buildSpecification(
                            specification: 'Grind', value: 'Stone Tahona'),
                        buildSpecification(
                            specification: 'Distillation',
                            value: 'Double / Copper'),
                        buildSpecification(
                            specification: 'Proof',
                            value: '80 (40% Alc. Vol.)'),
                        buildSpecification(
                            specification: 'Year', value: '2020'),
                        const SizedBox(height: 26),
                        Center(
                          child: SvgPicture.string(
                            '''
                              <svg width="60" height="60" viewBox="0 0 60 60" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <g clip-path="url(#clip0_489_194)">
                                <path d="M35.8454 50.9339C37.6859 48.6985 36.9306 46.0362 35.2621 43.7047C37.3633 43.5684 39.5462 43.1132 41.1411 41.8699C43.8291 39.7755 43.0892 36.6834 41.3439 33.9141C41.6954 33.9358 42.047 33.9433 42.3987 33.9508C47.1019 34.0035 54.7417 32.2879 54.5399 26.1963C54.4438 23.3601 52.3769 21.0739 50.2928 19.3737C47.6066 17.1799 44.6213 15.3701 41.4648 13.9385C36.5975 11.7275 31.4005 10.4009 26.1147 9.71639C24.7488 9.54121 23.3754 9.40858 21.998 9.31498C22.0529 9.80942 22.1041 10.3074 22.159 10.8018C23.6216 10.9035 25.0836 11.0549 26.5415 11.2595C33.6713 12.2489 40.6487 14.4765 46.6539 18.5051C49.8062 20.6223 55.0912 24.554 52.261 28.8815C49.8933 32.5036 44.2239 32.7633 40.2353 32.3491C38.9532 30.7218 37.4626 29.3195 36.353 28.4722C34.2149 26.8318 30.9798 24.8024 28.1611 24.9236C27.4929 24.9517 26.9219 25.1797 26.4916 25.5302C25.7745 26.119 25.4549 27.0569 25.7319 28.0157C25.8175 28.3044 25.9492 28.5972 26.1486 28.8801C26.8655 29.8935 28.0505 30.3509 29.1609 30.811C30.6744 31.439 32.2099 32.0105 33.7748 32.4899C35.6018 33.0504 37.4798 33.4906 39.3777 33.7357C39.3987 33.7644 39.4232 33.7966 39.4442 33.8253C40.6886 35.644 42.485 38.6093 40.4563 40.5228C38.9087 41.9799 36.2058 42.2338 34.0737 42.2809C32.5153 40.5866 30.6124 39.1939 29.1887 38.4781C27.4117 37.5806 23.9447 35.9608 22.1743 37.6498C20.1525 39.5776 23.0207 41.3755 24.5908 42.0254C27.2571 43.1353 30.1281 43.7288 33.0161 43.7648C33.1369 43.7661 33.2647 43.7676 33.3855 43.7689C34.7276 45.4289 36.0583 47.7886 34.9287 49.6731C33.5312 52.0093 29.7147 52.0873 27.3359 51.9541C25.5926 51.8528 23.8732 51.5316 22.1687 51.1394C21.7981 51.558 21.4275 51.9766 21.0533 52.3917C23.4911 52.9732 25.9688 53.4735 28.4807 53.4626C31.0068 53.4518 34.1132 53.0212 35.8204 50.9443L35.8454 50.9339ZM33.2789 30.7755C32.3161 30.4591 31.3608 30.1074 30.42 29.7344C29.9001 29.5261 29.373 29.3248 28.8676 29.0882C28.592 28.9572 28.2773 28.8222 28.0199 28.6453C27.7061 28.4321 26.9152 27.6808 27.0764 27.242C27.1863 26.9448 28.08 26.4504 28.3506 26.4037C28.6888 26.34 29.0638 26.4792 29.3933 26.5575C29.8646 26.6729 30.3245 26.8415 30.7738 27.0135C31.9624 27.4673 33.0999 28.0485 34.1722 28.7356C35.5973 29.6468 36.9028 30.7663 38.0361 32.0331C36.4195 31.7308 34.8292 31.2902 33.2753 30.779L33.2789 30.7755ZM26.9826 41.3168C25.9736 41.0035 24.9081 40.6541 23.9904 40.118C23.8281 40.0238 23.5842 39.9109 23.4687 39.7569C23.3148 39.542 23.296 38.682 23.6323 38.4726C24.1332 38.1585 25.3716 38.6058 25.9099 38.7611C28.1836 39.3976 30.2767 40.6183 31.9887 42.2398C30.2881 42.1319 28.6076 41.8218 26.9755 41.3168L26.9826 41.3168Z" fill="#FB5944"/>
                                </g>
                                <defs>
                                <clipPath id="clip0_489_194">
                                <rect width="39.4684" height="44.0904" fill="white" transform="translate(31.5242) rotate(45.6422)"/>
                                </clipPath>
                                </defs>
                              </svg>
                            ''',
                          ),
                        ),
                        const SizedBox(height: 26),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }

  Widget buildSpecification({
    required final String specification,
    required final String value,
  }) {
    return Row(
      children: [
        Text(
          specification,
          textAlign: TextAlign.start,
          style: textStyles.font_15w700.copyWith(
            color: const Color(0xFFE2D7C1),
            fontWeight: FontWeight.w500,
            height: 1.5,
          ),
        ),
        const SizedBox(width: 20),
        Text(
          '......................',
          textAlign: TextAlign.center,
          style: textStyles.font_15w700.copyWith(
            color: const Color(0xFFE3FF0A),
            fontWeight: FontWeight.w500,
            height: 1.5,
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Text(
            value,
            textAlign: TextAlign.end,
            style: textStyles.font_15w700.copyWith(
              color: const Color(0xFFE2D7C1),
              fontWeight: FontWeight.w500,
              height: 1.5,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
