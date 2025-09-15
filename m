Return-Path: <linux-media+bounces-42557-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED5CB57C6D
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 15:10:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E1F3188F897
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 13:10:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C7632FFDE8;
	Mon, 15 Sep 2025 13:10:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from rmisp-mx-out1.tele.net (rmisp-mx-out1.tele.net [194.208.23.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A997212548;
	Mon, 15 Sep 2025 13:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.208.23.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757941806; cv=none; b=SYATfjp5rEA97lCtYs59xxIJNXoI8L6zEZizVsZiQ1RePo3VVJ9ED55MAKx02xjTBx6CsAtH8ebYLi/G2YWnfJO6o23pLhBXxCbzvyLG4GNbZ9Z6DHuMlVL72W4a3/hvIFw1ZwIkIEk7Q/KjBO/QGfCer68ii2yPZIFE5mYongs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757941806; c=relaxed/simple;
	bh=CXQVMAK6wEPTYUqEqUayqaP1g51cyGb6XxmZLm7a2uE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CqQPSyIbgthJCosb8vOWVFna/w6ieK8+1Fo46ue8kffTyjMD2vtaDWeF9ENI2g0NbRDL1BTkBFe9nTOz5SY2laWpgNW3T9C1zKpnosIJRgwrWD2H/mYfSk6DTIKEFl9SXu2jdB6XL0Rrt87TMPbrqlcS/TgIKKZHeNI4thjqPOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=fail smtp.mailfrom=emfend.at; arc=none smtp.client-ip=194.208.23.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=emfend.at
Received: from [192.168.0.207] (194-208-208-245.tele.net [194.208.208.245])
	by rmisp-mx-out1.tele.net (Postfix) with ESMTPA id 7848510E2A8A;
	Mon, 15 Sep 2025 15:01:41 +0200 (CEST)
Message-ID: <2b8b3ff9-43c8-44ba-b5b9-586409448de0@emfend.at>
Date: Mon, 15 Sep 2025 15:01:41 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] media: i2c: add Himax HM1246 image sensor driver
To: Tarang Raval <tarang.raval@siliconsignals.io>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hans Verkuil <hverkuil@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Hans de Goede
 <hansg@kernel.org>, Ricardo Ribalda <ribalda@chromium.org>,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Dongcheng Yan <dongcheng.yan@intel.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Alan Stern <stern@rowland.harvard.edu>,
 Jingjing Xiong <jingjing.xiong@intel.com>,
 Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Hao Yao <hao.yao@intel.com>,
 "bsp-development.geo@leica-geosystems.com"
 <bsp-development.geo@leica-geosystems.com>
References: <20250912-hm1246-v3-0-3b89f47dfa43@emfend.at>
 <20250912-hm1246-v3-2-3b89f47dfa43@emfend.at>
 <PN3P287MB18290018941BE6A227431C818B0BA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
Content-Language: de-DE
From: Matthias Fend <matthias.fend@emfend.at>
In-Reply-To: <PN3P287MB18290018941BE6A227431C818B0BA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Tarang,

thank you very much for your further very helpful feedback.

Am 13.09.2025 um 11:11 schrieb Tarang Raval:
> Hi Matthias,
> 
>> Add a V4L2 sub-device driver for Himax HM1246 image sensor.
>>   
>> The Himax HM1246-AWD is a 1/3.7-Inch CMOS image sensor SoC with an active
>> array size of 1296 x 976. It is programmable through an I2C interface and
>> connected via parallel bus.
>>   
>> The sensor has an internal ISP with a complete image processing pipeline
>> including control loops. However, this driver uses the sensor in raw mode
>> and the entire ISP is bypassed.
>>   
>> Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
>> ---
>>   MAINTAINERS                |    8 +
>>   drivers/media/i2c/Kconfig  |   10 +
>>   drivers/media/i2c/Makefile |    1 +
>>   drivers/media/i2c/hm1246.c | 1427 ++++++++++++++++++++++++++++++++++++++++++++
>>   4 files changed, 1446 insertions(+)
>>   
> 
> ...
> 
>> +#define FLIP_FORMAT_INDEX(v, h) ((v ? 2 : 0) | (h ? 1 : 0))
>> +
>> +/* Get the format code of the mode considering current flip setting. */
>> +static u32 hm1246_get_format_code(struct hm1246 *hm1246,
>> +                                 const struct hm1246_mode *hm1246_mode)
>> +{
>> +       return hm1246_mode->codes[FLIP_FORMAT_INDEX(hm1246->vflip_ctrl->val,
>> +                                                   hm1246->hflip_ctrl->val)];
>> +}
>> +
>> +static const struct hm1246_mode hm1246_modes[] = {
>> +       {
>> +               .codes = {
>> +                       [FLIP_FORMAT_INDEX(0, 0)] = MEDIA_BUS_FMT_SBGGR10_1X10,
>> +                       [FLIP_FORMAT_INDEX(0, 1)] = MEDIA_BUS_FMT_SGBRG10_1X10,
>> +                       [FLIP_FORMAT_INDEX(1, 0)] = MEDIA_BUS_FMT_SGRBG10_1X10,
>> +                       [FLIP_FORMAT_INDEX(1, 1)] = MEDIA_BUS_FMT_SRGGB10_1X10,
> 
> Instead of defining four mbus codes per mode, you can keep a single
> global Bayer-format table and derive the active code based on the
> H/V flip controls. This makes the code simpler and easier to maintain.
> 
> You can refer to the imx319 or imx219  driver for implementation.

I copied it from there at first.
But since I didn't like the implied assignment (calculated index but 
required order is only a comment), I decided on this explicit 
implementation. So that is at least the intention behind the current 
code. Do you seed that as an issue?

> 
>> +               },
>> +               .link_freq_index = 0,
>> +               .clocks_per_pixel = 1,
>> +               .top = 0,
>> +               .left = 0,
>> +               .width = 1296,
>> +               .height = 976,
>> +               .hts = 1420,
>> +               .vts_min = 990,
>> +               .reg_list = {
>> +                       .num_of_regs = ARRAY_SIZE(mode_1296x976_raw),
>> +                       .regs = mode_1296x976_raw,
>> +               },
>> +       },
>> +};
> 
> ...
> 
>> +static int hm1246_update_controls(struct hm1246 *hm1246,
>> +                                 const struct hm1246_mode *mode)
>> +{
>> +       s64 pixel_rate, exposure_max, vblank, hblank;
>> +       int ret;
>> +
>> +       ret = __v4l2_ctrl_s_ctrl(hm1246->link_freq_ctrl, mode->link_freq_index);
>> +       if (ret) {
>> +               dev_err(hm1246->dev, "link_freq ctrl range update failed\n");
>> +               return ret;
>> +       }
>> +
>> +       pixel_rate = div_u64(hm1246_link_freqs[mode->link_freq_index],
>> +                            mode->clocks_per_pixel);
>> +       ret = __v4l2_ctrl_modify_range(hm1246->pixel_rate_ctrl, pixel_rate,
>> +                                      pixel_rate, 1, pixel_rate);
>> +       if (ret) {
>> +               dev_err(hm1246->dev, "pixel_rate ctrl range update failed\n");
>> +               return ret;
>> +       }
>> +
>> +       vblank = mode->vts_min - mode->height,
> 
> With the comma, the driver won’t compile.

Huh. That actually compiles without errors. But you're right, of course, 
that it's not intended to be that way.

> 
>> +       ret = __v4l2_ctrl_modify_range(hm1246->vblank_ctrl, vblank,
>> +                                      HM1246_VTS_MAX - mode->height, 1,
>> +                                      vblank);
>> +       if (ret) {
>> +               dev_err(hm1246->dev, "vblank ctrl range update failed\n");
>> +               return ret;
>> +       }
>> +
>> +       hblank = mode->hts - mode->width;
>> +       ret = __v4l2_ctrl_modify_range(hm1246->hblank_ctrl, hblank, hblank, 1,
>> +                                      hblank);
>> +       if (ret) {
>> +               dev_err(hm1246->dev, "hblank ctrl range update failed\n");
>> +               return ret;
>> +       }
>> +
>> +       exposure_max = mode->vts_min - HM1246_COARSE_INTG_MARGIN;
>> +       ret = __v4l2_ctrl_modify_range(hm1246->exposure_ctrl,
>> +                                      HM1246_COARSE_INTG_MIN, exposure_max,
>> +                                      HM1246_COARSE_INTG_STEP, exposure_max);
>> +       if (ret) {
>> +               dev_err(hm1246->dev, "exposure ctrl range update failed\n");
>> +               return ret;
>> +       }
>> +
>> +       return 0;
>> +}
> 
> ...
> 
>> +static int hm1246_calc_pll(struct hm1246 *hm1246, u32 xclk, u32 link_freq,
>> +                          u32 clocks_per_pixel, u8 *pll1, u8 *pll2, u8 *pll3)
>> +{
>> +       const u8 pclk_div_table[] = { 4, 5, 6, 7, 8, 12, 14, 16 };
>> +       const u8 sysclk_div_table[] = { 1, 2, 3, 4 };
>> +       const u8 post_div_table[] = { 1, 2, 4, 8 };
>> +       const int sysclk_pclk_ratio = 3; /* Recommended value */
>> +       u32 pclk, vco_out, best_vco_diff;
>> +       int pclk_div_index, sysclk_div_index, post_div_index;
>> +       u8 pre_div = 0, multiplier_h = 0, multiplier_l = 0;
>> +       bool sysclk_pclk_ratio_found = false;
>> +
>> +       if (link_freq < HM1246_PCLK_MIN || link_freq > HM1246_PCLK_MAX)
>> +               return -EINVAL;
>> +
>> +       /*
>> +        * In raw mode (1 pixel per clock) the pixel clock is internally
>> +        * divided by two.
>> +        */
>> +       pclk = (2 * link_freq) / clocks_per_pixel;
>> +
>> +       /* Find suitable PCLK and SYSCLK dividers. */
>> +       for (pclk_div_index = 0; pclk_div_index < ARRAY_SIZE(pclk_div_table);
>> +            pclk_div_index++) {
>> +               for (sysclk_div_index = 0;
>> +                    sysclk_div_index < ARRAY_SIZE(sysclk_div_table);
>> +                    sysclk_div_index++) {
>> +                       if (sysclk_div_table[sysclk_div_index] *
>> +                                   sysclk_pclk_ratio ==
>> +                           pclk_div_table[pclk_div_index]) {
>> +                               sysclk_pclk_ratio_found = true;
>> +                               break;
>> +                       }
>> +               }
>> +               if (sysclk_pclk_ratio_found)
>> +                       break;
>> +       }
>> +
>> +       if (!sysclk_pclk_ratio_found)
>> +               return -EINVAL;
>> +
>> +       /* Determine an appropriate post divider. */
>> +       for (post_div_index = 0; post_div_index < ARRAY_SIZE(post_div_table);
>> +            post_div_index++) {
>> +               vco_out = pclk * (pclk_div_table[pclk_div_index] *
>> +                                 post_div_table[post_div_index]);
>> +
>> +               if (vco_out >= HM1246_PLL_VCO_MIN &&
>> +                   vco_out <= HM1246_PLL_VCO_MAX)
>> +                       break;
>> +       }
>> +       if (post_div_index >= ARRAY_SIZE(post_div_table))
>> +               return -EINVAL;
>> +
>> +       /* Find best pre-divider and multiplier values. */
>> +       best_vco_diff = U32_MAX;
>> +       for (u32 div = DIV_ROUND_UP(xclk, HM1246_PLL_INCLK_MAX);
>> +            div <= (xclk / HM1246_PLL_INCLK_MIN); div++) {
>> +               u32 multi, multi_h, multi_l, vco, diff;
>> +
>> +               multi = DIV_ROUND_CLOSEST_ULL((u64)vco_out * div, xclk);
>> +               if (multi < HM1246_PLL_MULTI_MIN ||
>> +                   multi > HM1246_PLL_MULTI_MAX)
>> +                       continue;
>> +
>> +               multi_h = multi / (HM1246_PLL_MULTI_H_MIN *
>> +                                  HM1246_PLL_MULTI_L_MAX) +
>> +                         2;
>> +               multi_l = multi / multi_h;
>> +               vco = div_u64((u64)xclk * multi_h * multi_l, div);
>> +
>> +               diff = abs(vco_out - vco);
> 
> Here vco_out is always higher than vco??
> 
> because vco_out & vco are u32.
> 
> abs is for signed int so if vco is higher than vco_out abs()
> can misbehave on wrap.

No, the difference can also be negative.
Although this works on my test system at least, it is of course better 
to replace abs() with abs_diff() here.

> 
>> +               if (diff < best_vco_diff) {
>> +                       best_vco_diff = diff;
>> +                       pre_div = div;
>> +                       multiplier_h = multi_h;
>> +                       multiplier_l = multi_l;
>> +               }
>> +
>> +               if (!diff)
>> +                       break;
>> +       }
>> +
>> +       if (best_vco_diff == U32_MAX)
>> +               return -EINVAL;
>> +
>> +       *pll1 = HM1246_PLL1CFG_MULTIPLIER(multiplier_l - 1);
>> +       *pll2 = HM1246_PLL2CFG_PRE_DIV(pre_div - 1) |
>> +               HM1246_PLL2CFG_MULTIPLIER(multiplier_h - 2);
>> +       *pll3 = HM1246_PLL3CFG_POST_DIV(post_div_index) |
>> +               HM1246_PLL3CFG_SYSCLK_DIV(sysclk_div_index) |
>> +               HM1246_PLL3CFG_PCLK_DIV(pclk_div_index);
>> +
>> +       return 0;
>> +}
> 
> ...
> 
>> +static int hm1246_set_ctrl(struct v4l2_ctrl *ctrl)
>> +{
>> +       struct hm1246 *hm1246 = container_of_const(ctrl->handler, struct hm1246,
>> +                                                  ctrls);
>> +       struct v4l2_subdev_state *state;
>> +       const struct v4l2_mbus_framefmt *format;
>> +       const struct hm1246_mode *mode;
>> +       u32 val;
>> +       bool needs_cmu_update = false;
> 
> I think you missed my last response here.

Yes, I missed that. I will invert the logic accordingly.

> 
>> +       int ret = 0;
>> +
>> +       state = v4l2_subdev_get_locked_active_state(&hm1246->sd);
>> +       format = v4l2_subdev_state_get_format(state, 0);
>> +       mode = v4l2_find_nearest_size(hm1246_modes, ARRAY_SIZE(hm1246_modes),
>> +                                     width, height, format->width,
>> +                                     format->height);
> 
> No need for mode. In vblank you can directly use format->height.
> 
>> +
>> +       if (ctrl->id == V4L2_CID_VBLANK) {
>> +               s64 exposure_max;
>> +
>> +               exposure_max =
>> +                       format->height + ctrl->val - HM1246_COARSE_INTG_MARGIN;
>> +               ret = __v4l2_ctrl_modify_range(hm1246->exposure_ctrl,
>> +                                              hm1246->exposure_ctrl->minimum,
>> +                                              exposure_max,
>> +                                              hm1246->exposure_ctrl->step,
>> +                                              exposure_max);
>> +
>> +               if (ret) {
>> +                       dev_err(hm1246->dev, "exposure ctrl range update failed\n");
>> +                       return ret;
>> +               }
>> +       }
>> +
>> +       if (!pm_runtime_get_if_active(hm1246->dev))
>> +               return 0;
>> +
>> +       switch (ctrl->id) {
>> +       case V4L2_CID_EXPOSURE:
>> +               cci_write(hm1246->regmap, HM1246_COARSE_INTG_REG, ctrl->val,
>> +                         &ret);
>> +               needs_cmu_update = true;
>> +               break;
>> +
>> +       case V4L2_CID_ANALOGUE_GAIN:
>> +               cci_write(hm1246->regmap, HM1246_ANALOG_GLOBAL_GAIN_REG,
>> +                         ctrl->val, &ret);
>> +               needs_cmu_update = true;
>> +               break;
>> +
>> +       case V4L2_CID_VBLANK:
>> +               val = mode->height + ctrl->val;
>> +               cci_write(hm1246->regmap, HM1246_FRAME_LENGTH_LINES_REG, val,
>> +                         &ret);
>> +               needs_cmu_update = true;
>> +               break;
>> +
>> +       case V4L2_CID_HFLIP:
>> +       case V4L2_CID_VFLIP:
>> +               val = 0;
>> +               if (hm1246->hflip_ctrl->val)
>> +                       val |= HM1246_IMAGE_ORIENTATION_HFLIP;
>> +               if (hm1246->vflip_ctrl->val)
>> +                       val |= HM1246_IMAGE_ORIENTATION_VFLIP;
>> +
>> +               cci_write(hm1246->regmap, HM1246_IMAGE_ORIENTATION_REG, val,
>> +                         &ret);
>> +               needs_cmu_update = true;
>> +               break;
>> +
>> +       case V4L2_CID_TEST_PATTERN:
>> +               ret = hm1246_test_pattern(hm1246, ctrl->val);
>> +               break;
>> +
>> +       default:
>> +               ret = -EINVAL;
>> +               break;
>> +       }
>> +
>> +       if (needs_cmu_update)
>> +               cci_write(hm1246->regmap, HM1246_CMU_UPDATE_REG, 0, &ret);
>> +
>> +       pm_runtime_put(hm1246->dev);
>> +
>> +       return ret;
>> +}
> 
> ...
> 
>> +static int __maybe_unused hm1246_g_register(struct v4l2_subdev *sd,
>> +                                           struct v4l2_dbg_register *reg)
>> +{
>> +       struct hm1246 *hm1246 = to_hm1246(sd);
>> +       u64 val;
>> +       int ret;
>> +
>> +       if (!pm_runtime_get_if_in_use(hm1246->dev))
>> +               return 0;
>> +
>> +       ret = cci_read(hm1246->regmap, CCI_REG8(reg->reg), &val, NULL);
> 
> Many of your registers are 16-bit, so is it fine to use CCI_REG8?
> I think you should use simple regmap_read.

Yes, that's fine. Even if values are distributed across multiple 8-bit 
registers, they can be addressed individually.
If I haven't made a mistake, there are two drivers that implement 
VIDEO_ADV_DEBUG and use CCI (gc0308 and imx214).
One uses cci_read and one uses regmap_read.

At the moment, I don't see the problem with cci_read here. Do you have 
any specific concerns?

Best regards
  ~Matthias

> 
>> +       reg->val = val;
>> +
>> +       pm_runtime_put(hm1246->dev);
>> +
>> +       return ret;
>> +}
>> +
>> +static int __maybe_unused hm1246_s_register(struct v4l2_subdev *sd,
>> +                                           const struct v4l2_dbg_register *reg)
>> +{
>> +       struct hm1246 *hm1246 = to_hm1246(sd);
>> +       int ret;
>> +
>> +       if (!pm_runtime_get_if_in_use(hm1246->dev))
>> +               return 0;
>> +
>> +       ret = cci_write(hm1246->regmap, CCI_REG8(reg->reg), (u64)reg->val,
>> +                       NULL);
> 
> same here.
> 
>> +
>> +       pm_runtime_put(hm1246->dev);
>> +
>> +       return ret;
>> +}
>> +
>> +static const struct v4l2_subdev_core_ops hm1246_core_ops = {
>> +#ifdef CONFIG_VIDEO_ADV_DEBUG
>> +       .g_register = hm1246_g_register,
>> +       .s_register = hm1246_s_register,
>> +#endif
>> +};
> 
> ...
> 
>> +static int hm1246_probe(struct i2c_client *client)
>> +{
>> +       struct hm1246 *hm1246;
>> +       int ret;
>> +
>> +       hm1246 = devm_kzalloc(&client->dev, sizeof(*hm1246), GFP_KERNEL);
>> +       if (!hm1246)
>> +               return -ENOMEM;
>> +
>> +       hm1246->dev = &client->dev;
>> +
>> +       ret = hm1246_parse_fwnode(hm1246);
>> +       if (ret)
>> +               return ret;
>> +
>> +       hm1246->regmap = devm_cci_regmap_init_i2c(client, 16);
>> +       if (IS_ERR(hm1246->regmap))
>> +               return dev_err_probe(hm1246->dev, PTR_ERR(hm1246->regmap),
>> +                                    "failed to init CCI\n");
>> +
>> +       hm1246->xclk = devm_v4l2_sensor_clk_get(hm1246->dev, NULL);
>> +       if (IS_ERR(hm1246->xclk))
>> +               return dev_err_probe(hm1246->dev, PTR_ERR(hm1246->xclk),
>> +                                    "failed to get xclk\n");
>> +
>> +       hm1246->xclk_freq = clk_get_rate(hm1246->xclk);
>> +       if (hm1246->xclk_freq < HM1246_XCLK_MIN ||
>> +           hm1246->xclk_freq > HM1246_XCLK_MAX)
>> +               dev_err_probe(hm1246->dev, -EINVAL,
>> +                             "xclk frequency out of range: %luHz\n",
>> +                             hm1246->xclk_freq);
> 
> return dev_err_probe(...)
> 
>> +
>> +       ret = hm1246_get_regulators(hm1246->dev, hm1246);
>> +       if (ret)
>> +               return dev_err_probe(hm1246->dev, ret,
>> +                                    "failed to get regulators\n");
>> +
>> +       hm1246->reset_gpio =
>> +               devm_gpiod_get_optional(hm1246->dev, "reset", GPIOD_OUT_HIGH);
>> +       if (IS_ERR(hm1246->reset_gpio))
>> +               return dev_err_probe(hm1246->dev, ret,
> 
> error code ret ??
> I think it should be PTR_ERR(hm1246->reset_gpio).
> 
>> +                                    "failed to get reset GPIO\n");
>> +
>> +       v4l2_i2c_subdev_init(&hm1246->sd, client, &hm1246_subdev_ops);
>> +       hm1246->sd.internal_ops = &hm1246_internal_ops;
>> +
>> +       ret = hm1246_init_controls(hm1246);
>> +       if (ret)
>> +               return dev_err_probe(hm1246->dev, ret,
>> +                                    "failed to init controls\n");
>> +
>> +       hm1246->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
>> +       hm1246->pad.flags = MEDIA_PAD_FL_SOURCE;
>> +       hm1246->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
>> +
>> +       ret = media_entity_pads_init(&hm1246->sd.entity, 1, &hm1246->pad);
>> +       if (ret) {
>> +               dev_err_probe(hm1246->dev, ret, "failed to init media pads\n");
>> +               goto err_v4l2_ctrl_handler_free;
>> +       }
>> +
>> +       hm1246->sd.state_lock = hm1246->ctrls.lock;
>> +       ret = v4l2_subdev_init_finalize(&hm1246->sd);
>> +       if (ret) {
>> +               dev_err_probe(hm1246->dev, ret, "failed to init v4l2 subdev\n");
>> +               goto err_media_entity_cleanup;
>> +       }
>> +
>> +       pm_runtime_enable(hm1246->dev);
>> +       pm_runtime_set_autosuspend_delay(hm1246->dev, 1000);
>> +       pm_runtime_use_autosuspend(hm1246->dev);
>> +       pm_runtime_idle(hm1246->dev);
>> +
>> +       ret = v4l2_async_register_subdev_sensor(&hm1246->sd);
>> +       if (ret) {
>> +               dev_err_probe(hm1246->dev, ret,
>> +                             "failed to register v4l2 subdev\n");
>> +               goto err_subdev_cleanup;
>> +       }
>> +
>> +       return 0;
>> +
>> +err_subdev_cleanup:
>> +       v4l2_subdev_cleanup(&hm1246->sd);
>> +       pm_runtime_disable(hm1246->dev);
>> +       pm_runtime_set_suspended(hm1246->dev);
>> +
>> +err_media_entity_cleanup:
>> +       media_entity_cleanup(&hm1246->sd.entity);
>> +
>> +err_v4l2_ctrl_handler_free:
>> +       v4l2_ctrl_handler_free(&hm1246->ctrls);
>> +
>> +       return ret;
>> +}
> 
> ...
> 
>> +static struct i2c_driver hm1246_i2c_driver = {
>> +       .driver = {
>> +               .of_match_table = hm1246_of_match,
>> +               .pm = pm_ptr(&hm1246_pm_ops),
>> +               .name = "hm1246",
>> +       },
>> +       .probe = hm1246_probe,
>> +       .remove = hm1246_remove,
>> +};
>> +module_i2c_driver(hm1246_i2c_driver);
>> +
>> +MODULE_DESCRIPTION("Himax HM1246 camera driver");
>> +MODULE_AUTHOR("Matthias Fend <matthias.fend@emfend.at>");
>> +MODULE_LICENSE("GPL");
>>   
>> --
>> 2.34.1
> 
> Best Regards,
> Tarang


