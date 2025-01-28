Return-Path: <linux-media+bounces-25385-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88982A2107C
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 19:11:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E26F43A70CE
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 18:08:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88E261DE3DD;
	Tue, 28 Jan 2025 18:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="q+lLSc3I"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3FD19F11B
	for <linux-media@vger.kernel.org>; Tue, 28 Jan 2025 18:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738087723; cv=none; b=c3fjGwBv1PlyyDMThVUo2PJfsitEMYL4saNRuRZzKb1/tipw/ge7rLlWOm0J7AhM2Vb8vNUkvvFtIukiXLfVVge1pP/raA7kPvRh8XR0n+n0LDGx/X7C3aqOjnY0iPvz5kWDYCCezKzXY2HXKoRHED9tDsB91vrstQOjkYAQT0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738087723; c=relaxed/simple;
	bh=jGOODq6sR/tqiacZB0SpI4IX5TH5gkP8EgCNZ7R0Eao=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KJnfuxgmlRM16i3/s4frNo1zjYi7mueHw7xc6QxdWXuwDhKbQtv5ufP8jKt3gSEr7kK9IbaNlvciV/OztvzaDlDCOuIRunTgK8EzY1aDT2N6rui8ZFBAi7m6v56qXl97Y1pukKjyRrBIXrB8g4M0z6oldfGVnReMJQaBLOuRPsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=q+lLSc3I; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e46ebe19368so8600052276.0
        for <linux-media@vger.kernel.org>; Tue, 28 Jan 2025 10:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1738087720; x=1738692520; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1Y7BtUc6CrG8SLVEU03FiN8jvuNVlHb2hf+Hh6Whzew=;
        b=q+lLSc3IQjTTA+XXrHhQSK4RrY+k53njLwETU3AzezqwUK4lyH39mksJyQorZQ1zDY
         hjcJJvnu8E5onyd/glT9GLx40MefAO/WLdeWmWK3uryd4al7iGBGP+TnNrJg4TKwMV+O
         6gnwLikNSrRh7TE9flXBjSHM9jINtwfG6bQU/Iva2va4NJaUebrtN62E9zv5FmKJs5kR
         mduRykkueyHKeiXEXavQ5lvTqgvjNJ9unFmsfUi8OypPiu7Q7wcXnUUk9JdMgni7PXJn
         Lg0CtGAsLAX/e4h2lRcdlECrKnjemW5meFc8knMZvhQrpLnCeeP2KoqtyPdyFTSTSQzw
         SMWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738087720; x=1738692520;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Y7BtUc6CrG8SLVEU03FiN8jvuNVlHb2hf+Hh6Whzew=;
        b=hg+Vrni2VVyCSJF4JI5Xs3qPTI1uA+9ECeerRVTZ4q9xeq1oKdd5w/jdaE/Qhy76ig
         Qd72AVC7cOfuMJIDg5prUfJoinUd/NeHaGi5RDdba5bM7eRHWK3eEWKdVc7r/lJfXpWK
         Qx0pb1rFgZ+eLycrsHVHn/qj6GiINeYtoBOFdimeiKo+xRUl1VBs9EX64/zMrfxmB9Hf
         XLCXA0AjhAYx6lph5WVY+8TUBHeD6d5xONHmrQTMswoX1wvxxWkxAcdIqTH9Ht1f0ido
         poWxtjbQIofaarOWIq0gJNM2JvDRz/fqhB/U4Bpbn4GfxSPcJwQQqSakezQTqkJLLGQ2
         ofgg==
X-Forwarded-Encrypted: i=1; AJvYcCXpK1yBl2YQJOL0xCBaq+gzPnMHmFAhAhHKGaCEBk3XRkTmQRCjRujwjZycPdjS6GqWFitXZq8vXCMGog==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLeaYlUvO34XVfAshAl0JhllUUN6C+Kq8bsHFc5oZcUBvYNIcl
	ofgGP1U02Vj2AOaoU0MKc+KyzzlRO9jSu4/J4YE16Gd6/JQ2pqLlH0e4ZOug09DjmedLnod+BKL
	OOd7HAoA0H7k5RHw10sBz8+WLnD9roLrZyDNmiQ==
X-Gm-Gg: ASbGnctl3LOsqRoBEvy3b+Ev8iQlM1Hgkeu1c+8xGL79OLeh56dhfEz+gdGt1nmv8+T
	vz+5qQy/s92DNmvz9CD0/wK9zUzM2V5VM3AwOfJwy3X5rAMRcDk31fKrB18MA7ewJlQSpJlBA
X-Google-Smtp-Source: AGHT+IGq/XbKGtpKxz+lOPuTVIdMeP2zRZgtJQFfQswSSZe+CSLkCN+7qfZNPpd95LWLMI3d3hZ0SFYkHwSx+qrgSAc=
X-Received: by 2002:a05:6902:1005:b0:e57:fc0a:fae9 with SMTP id
 3f1490d57ef6-e57fc0afcacmr25800087276.5.1738087720025; Tue, 28 Jan 2025
 10:08:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250116-media-imx415-v2-0-735263f04652@raspberrypi.com> <20250116-media-imx415-v2-2-735263f04652@raspberrypi.com>
In-Reply-To: <20250116-media-imx415-v2-2-735263f04652@raspberrypi.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 28 Jan 2025 18:08:19 +0000
X-Gm-Features: AWEUYZn5TFyckecwnEuJp6pijrd6sEPYojCCx4bMEdkOsj1dN-4yGx3KtCBcQYM
Message-ID: <CAPY8ntCy94L+5vCu20Ed_dV3nchaxF4Qmy1BZ_HD7sWnaQmy5w@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] media: i2c: imx415: Make HBLANK controllable and
 in consistent units
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Michael Riesch <michael.riesch@wolfvision.net>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Gerald Loacker <Gerald.Loacker@wolfvision.net>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 16 Jan 2025 at 17:43, Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> The control of HMAX documented in the datasheet is consistent
> with being in terms of a scaled INCK, being always 72MHz or
> 74.25MHz. It is NOT link frequency dependent, but the minimum
> value for HMAX is dictated by the link frequency.
>
> If PIXEL_RATE is defined as being 12 times the 72 or 74.25MHz,
> and all values are scaled down again when writing HMAX, then
> the numbers all work out regardless of INCK or link frequency.
> Retain an hmax_min (set to the same value as the previous fixed
> hmax register value) to set as the default value to avoid changing
> the behaviour for existing users.
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/media/i2c/imx415.c | 87 +++++++++++++++++++++-------------------------
>  1 file changed, 39 insertions(+), 48 deletions(-)
>
> diff --git a/drivers/media/i2c/imx415.c b/drivers/media/i2c/imx415.c
> index fa7ffb9220e5..24633d17cb09 100644
> --- a/drivers/media/i2c/imx415.c
> +++ b/drivers/media/i2c/imx415.c
> @@ -28,6 +28,9 @@
>  #define IMX415_PIXEL_ARRAY_VBLANK 58
>  #define IMX415_EXPOSURE_OFFSET   8
>
> +#define IMX415_PIXEL_RATE_74_25MHZ     891000000
> +#define IMX415_PIXEL_RATE_72MHZ                864000000
> +
>  #define IMX415_NUM_CLK_PARAM_REGS 11
>
>  #define IMX415_MODE              CCI_REG8(0x3000)
> @@ -54,6 +57,8 @@
>  #define IMX415_VMAX              CCI_REG24_LE(0x3024)
>  #define IMX415_VMAX_MAX                  0xfffff
>  #define IMX415_HMAX              CCI_REG16_LE(0x3028)
> +#define IMX415_HMAX_MAX                  0xffff
> +#define IMX415_HMAX_MULTIPLIER   12
>  #define IMX415_SHR0              CCI_REG24_LE(0x3050)
>  #define IMX415_GAIN_PCG_0        CCI_REG16_LE(0x3090)
>  #define IMX415_AGAIN_MIN         0
> @@ -449,7 +454,6 @@ static const struct imx415_clk_params imx415_clk_params[] = {
>
>  /* all-pixel 2-lane 720 Mbps 15.74 Hz mode */
>  static const struct cci_reg_sequence imx415_mode_2_720[] = {
> -       { IMX415_HMAX, 0x07F0 },
>         { IMX415_LANEMODE, IMX415_LANEMODE_2 },
>         { IMX415_TCLKPOST, 0x006F },
>         { IMX415_TCLKPREPARE, 0x002F },
> @@ -464,7 +468,6 @@ static const struct cci_reg_sequence imx415_mode_2_720[] = {
>
>  /* all-pixel 2-lane 1440 Mbps 30.01 Hz mode */
>  static const struct cci_reg_sequence imx415_mode_2_1440[] = {
> -       { IMX415_HMAX, 0x042A },
>         { IMX415_LANEMODE, IMX415_LANEMODE_2 },
>         { IMX415_TCLKPOST, 0x009F },
>         { IMX415_TCLKPREPARE, 0x0057 },
> @@ -479,7 +482,6 @@ static const struct cci_reg_sequence imx415_mode_2_1440[] = {
>
>  /* all-pixel 4-lane 891 Mbps 30 Hz mode */
>  static const struct cci_reg_sequence imx415_mode_4_891[] = {
> -       { IMX415_HMAX, 0x044C },
>         { IMX415_LANEMODE, IMX415_LANEMODE_4 },
>         { IMX415_TCLKPOST, 0x007F },
>         { IMX415_TCLKPREPARE, 0x0037 },
> @@ -497,39 +499,10 @@ struct imx415_mode_reg_list {
>         const struct cci_reg_sequence *regs;
>  };
>
> -/*
> - * Mode : number of lanes, lane rate and frame rate dependent settings
> - *
> - * pixel_rate and hmax_pix are needed to calculate hblank for the v4l2 ctrl
> - * interface. These values can not be found in the data sheet and should be
> - * treated as virtual values. Use following table when adding new modes.
> - *
> - * lane_rate  lanes    fps     hmax_pix   pixel_rate
> - *
> - *     594      2     10.000     4400       99000000
> - *     891      2     15.000     4400      148500000
> - *     720      2     15.748     4064      144000000
> - *    1782      2     30.000     4400      297000000
> - *    2079      2     30.000     4400      297000000
> - *    1440      2     30.019     4510      304615385
> - *
> - *     594      4     20.000     5500      247500000
> - *     594      4     25.000     4400      247500000
> - *     720      4     25.000     4400      247500000
> - *     720      4     30.019     4510      304615385
> - *     891      4     30.000     4400      297000000
> - *    1440      4     30.019     4510      304615385
> - *    1440      4     60.038     4510      609230769
> - *    1485      4     60.000     4400      594000000
> - *    1782      4     60.000     4400      594000000
> - *    2079      4     60.000     4400      594000000
> - *    2376      4     90.164     4392      891000000
> - */
>  struct imx415_mode {
>         u64 lane_rate;
>         u32 lanes;
> -       u32 hmax_pix;
> -       u64 pixel_rate;
> +       u32 hmax_min;
>         struct imx415_mode_reg_list reg_list;
>  };
>
> @@ -538,8 +511,7 @@ static const struct imx415_mode supported_modes[] = {
>         {
>                 .lane_rate = 720000000,
>                 .lanes = 2,
> -               .hmax_pix = 4064,
> -               .pixel_rate = 144000000,
> +               .hmax_min = 2032,
>                 .reg_list = {
>                         .num_of_regs = ARRAY_SIZE(imx415_mode_2_720),
>                         .regs = imx415_mode_2_720,
> @@ -548,8 +520,7 @@ static const struct imx415_mode supported_modes[] = {
>         {
>                 .lane_rate = 1440000000,
>                 .lanes = 2,
> -               .hmax_pix = 4510,
> -               .pixel_rate = 304615385,
> +               .hmax_min = 1066,
>                 .reg_list = {
>                         .num_of_regs = ARRAY_SIZE(imx415_mode_2_1440),
>                         .regs = imx415_mode_2_1440,
> @@ -558,8 +529,7 @@ static const struct imx415_mode supported_modes[] = {
>         {
>                 .lane_rate = 891000000,
>                 .lanes = 4,
> -               .hmax_pix = 4400,
> -               .pixel_rate = 297000000,
> +               .hmax_min = 1100,
>                 .reg_list = {
>                         .num_of_regs = ARRAY_SIZE(imx415_mode_4_891),
>                         .regs = imx415_mode_4_891,
> @@ -586,6 +556,7 @@ static const char *const imx415_test_pattern_menu[] = {
>  struct imx415 {
>         struct device *dev;
>         struct clk *clk;
> +       unsigned long pixel_rate;
>         struct regulator_bulk_data supplies[ARRAY_SIZE(imx415_supply_names)];
>         struct gpio_desc *reset;
>         struct regmap *regmap;
> @@ -597,6 +568,7 @@ struct imx415 {
>
>         struct v4l2_ctrl_handler ctrls;
>         struct v4l2_ctrl *vblank;
> +       struct v4l2_ctrl *hblank;
>         struct v4l2_ctrl *hflip;
>         struct v4l2_ctrl *vflip;
>         struct v4l2_ctrl *exposure;
> @@ -787,6 +759,12 @@ static int imx415_s_ctrl(struct v4l2_ctrl *ctrl)
>                 ret = imx415_set_testpattern(sensor, ctrl->val);
>                 break;
>
> +       case V4L2_CID_HBLANK:
> +               return cci_write(sensor->regmap, IMX415_HMAX,
> +                                (format->width + ctrl->val) /
> +                                               IMX415_HMAX_MULTIPLIER,
> +                                NULL);
> +

Come back to a patch and the obvious errors jump out.
This function has a pm_runtime_put at the end, so we can't just return.

v3 tomorrow.

  Dave

>         default:
>                 ret = -EINVAL;
>                 break;
> @@ -805,12 +783,11 @@ static int imx415_ctrls_init(struct imx415 *sensor)
>  {
>         struct v4l2_fwnode_device_properties props;
>         struct v4l2_ctrl *ctrl;
> -       u64 pixel_rate = supported_modes[sensor->cur_mode].pixel_rate;
>         u64 lane_rate = supported_modes[sensor->cur_mode].lane_rate;
>         u32 exposure_max = IMX415_PIXEL_ARRAY_HEIGHT +
>                            IMX415_PIXEL_ARRAY_VBLANK -
>                            IMX415_EXPOSURE_OFFSET;
> -       u32 hblank;
> +       u32 hblank_min, hblank_max;
>         unsigned int i;
>         int ret;
>
> @@ -847,12 +824,14 @@ static int imx415_ctrls_init(struct imx415 *sensor)
>                           IMX415_AGAIN_MAX, IMX415_AGAIN_STEP,
>                           IMX415_AGAIN_MIN);
>
> -       hblank = supported_modes[sensor->cur_mode].hmax_pix -
> -                IMX415_PIXEL_ARRAY_WIDTH;
> +       hblank_min = (supported_modes[sensor->cur_mode].hmax_min *
> +                     IMX415_HMAX_MULTIPLIER) - IMX415_PIXEL_ARRAY_WIDTH;
> +       hblank_max = (IMX415_HMAX_MAX * IMX415_HMAX_MULTIPLIER) -
> +                    IMX415_PIXEL_ARRAY_WIDTH;
>         ctrl = v4l2_ctrl_new_std(&sensor->ctrls, &imx415_ctrl_ops,
> -                                V4L2_CID_HBLANK, hblank, hblank, 1, hblank);
> -       if (ctrl)
> -               ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +                                V4L2_CID_HBLANK, hblank_min,
> +                                hblank_max, IMX415_HMAX_MULTIPLIER,
> +                                hblank_min);
>
>         sensor->vblank = v4l2_ctrl_new_std(&sensor->ctrls, &imx415_ctrl_ops,
>                                            V4L2_CID_VBLANK,
> @@ -860,8 +839,9 @@ static int imx415_ctrls_init(struct imx415 *sensor)
>                                            IMX415_VMAX_MAX - IMX415_PIXEL_ARRAY_HEIGHT,
>                                            1, IMX415_PIXEL_ARRAY_VBLANK);
>
> -       v4l2_ctrl_new_std(&sensor->ctrls, NULL, V4L2_CID_PIXEL_RATE, pixel_rate,
> -                         pixel_rate, 1, pixel_rate);
> +       v4l2_ctrl_new_std(&sensor->ctrls, NULL, V4L2_CID_PIXEL_RATE,
> +                         sensor->pixel_rate, sensor->pixel_rate, 1,
> +                         sensor->pixel_rate);
>
>         sensor->hflip = v4l2_ctrl_new_std(&sensor->ctrls, &imx415_ctrl_ops,
>                                           V4L2_CID_HFLIP, 0, 1, 1, 0);
> @@ -1333,6 +1313,17 @@ static int imx415_parse_hw_config(struct imx415 *sensor)
>                                     "no valid sensor mode defined\n");
>                 goto done_endpoint_free;
>         }
> +       switch (inck) {
> +       case 27000000:
> +       case 37125000:
> +       case 74250000:
> +               sensor->pixel_rate = IMX415_PIXEL_RATE_74_25MHZ;
> +               break;
> +       case 24000000:
> +       case 72000000:
> +               sensor->pixel_rate = IMX415_PIXEL_RATE_72MHZ;
> +               break;
> +       }
>
>         lane_rate = supported_modes[sensor->cur_mode].lane_rate;
>         for (i = 0; i < ARRAY_SIZE(imx415_clk_params); ++i) {
>
> --
> 2.34.1
>

