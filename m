Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DCCC4BCE7E
	for <lists+linux-media@lfdr.de>; Sun, 20 Feb 2022 13:44:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237496AbiBTMpL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Feb 2022 07:45:11 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:35762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236307AbiBTMpK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Feb 2022 07:45:10 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4947932EF1
        for <linux-media@vger.kernel.org>; Sun, 20 Feb 2022 04:44:48 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 49CD725B;
        Sun, 20 Feb 2022 13:44:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1645361086;
        bh=qk+RH2DiMs+zk44vMyk5fnF5qrsq4gUFZC16vJmj31k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DLq4eLctu7tC9xEc2QCW5IV/gjYjHsnjQpKHH+dMdmVVQiuPa9aWTmzHVLIVQbyZa
         ebrI1XfUd/T3YnIFb6Maa7sN/fly9a/XBxVKoV+ki/agt9NJvINvghiKcJRcX0vfJ4
         4SYCY7Agjz9AwopX6+5qj/NA3XoZF4tM4cXv2Clc=
Date:   Sun, 20 Feb 2022 14:44:36 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>, sakari.ailus@iki.fi,
        hverkuil-cisco@xs4all.nl, mirela.rabulea@nxp.com,
        xavier.roumegue@oss.nxp.com, tomi.valkeinen@ideasonboard.com,
        hugues.fruchet@st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        aford173@gmail.com, festevam@gmail.com,
        Eugen.Hristev@microchip.com, jbrunet@baylibre.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2 08/23] media: ov5640: Rework timings programming
Message-ID: <YhI3tH9CSgduz0z1@pendragon.ideasonboard.com>
References: <20220210110458.152494-1-jacopo@jmondi.org>
 <20220210110458.152494-9-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220210110458.152494-9-jacopo@jmondi.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Thu, Feb 10, 2022 at 12:04:43PM +0100, Jacopo Mondi wrote:
> The current definition of a sensor mode defines timings as follows:
> 
> - hact, vact: Visible width and height
> - htot, vtot: Total sizes including blankings
> 
> This makes difficult to clearly separate the visible sizes from the
> blankings and to make the vertical blanking programmable.
> 
> Rework the sensor modes sizes definition to:
> - Report the analog crop sizes
> - Report the visible crop size
> - Report the total pixels per line as HBLANK is fixed
> - Report the VBLANK value to make it programmable
> 
> Also modify the ov5640_set_timings() function to program all the
> windowing registers are remove them from the per-mode register-value
> tables.
> 
> Do not change the timing values from the ones reported in the register
> tables to maintain bisectability.

That's the way to go, but ... (see below)

> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/i2c/ov5640.c | 441 +++++++++++++++++++++++++------------
>  1 file changed, 296 insertions(+), 145 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index eb4789ae6abf..9ba1b44d21f7 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -61,10 +61,16 @@
>  #define OV5640_REG_AEC_PK_MANUAL	0x3503
>  #define OV5640_REG_AEC_PK_REAL_GAIN	0x350a
>  #define OV5640_REG_AEC_PK_VTS		0x350c
> +#define OV5640_REG_TIMING_HS		0x3800
> +#define OV5640_REG_TIMING_VS		0x3802
> +#define OV5640_REG_TIMING_HW		0x3804
> +#define OV5640_REG_TIMING_VH		0x3806
>  #define OV5640_REG_TIMING_DVPHO		0x3808
>  #define OV5640_REG_TIMING_DVPVO		0x380a
>  #define OV5640_REG_TIMING_HTS		0x380c
>  #define OV5640_REG_TIMING_VTS		0x380e
> +#define OV5640_REG_TIMING_HOFFS		0x3810
> +#define OV5640_REG_TIMING_VOFFS		0x3812
>  #define OV5640_REG_TIMING_TC_REG20	0x3820
>  #define OV5640_REG_TIMING_TC_REG21	0x3821
>  #define OV5640_REG_AEC_CTRL00		0x3a00
> @@ -276,12 +282,17 @@ struct ov5640_mode_info {
>  	enum ov5640_mode_id id;
>  	enum ov5640_downsize_mode dn_mode;
>  	enum ov5640_pixel_rate_id pixel_rate;
> -	u32 hact;
> +	/* Analog crop rectangle. */
> +	struct v4l2_rect analog_crop;
> +	/* Visibile crop: from analog crop top-left corner. */
> +	struct v4l2_rect crop;
> +	/* Total pixels per line: crop.width + fixed hblank. */
>  	u32 htot;
> -	u32 vact;
> -	u32 vtot;
> +	/* Default vertical blanking: frame height = crop.height + vblank. */
> +	u32 vblank_def;
>  	const struct reg_value *reg_data;
>  	u32 reg_data_size;
> +	/* DVP only; ignored in MIPI mode. */
>  	u32 max_fps;
>  };
>  
> @@ -387,11 +398,7 @@ static const struct reg_value ov5640_init_setting_30fps_VGA[] = {
>  	{0x3c06, 0x00, 0, 0}, {0x3c07, 0x08, 0, 0}, {0x3c08, 0x00, 0, 0},
>  	{0x3c09, 0x1c, 0, 0}, {0x3c0a, 0x9c, 0, 0}, {0x3c0b, 0x40, 0, 0},
>  	{0x3820, 0x41, 0, 0}, {0x3821, 0x07, 0, 0}, {0x3814, 0x31, 0, 0},
> -	{0x3815, 0x31, 0, 0}, {0x3800, 0x00, 0, 0}, {0x3801, 0x00, 0, 0},
> -	{0x3802, 0x00, 0, 0}, {0x3803, 0x04, 0, 0}, {0x3804, 0x0a, 0, 0},
> -	{0x3805, 0x3f, 0, 0}, {0x3806, 0x07, 0, 0}, {0x3807, 0x9b, 0, 0},
> -	{0x3810, 0x00, 0, 0},
> -	{0x3811, 0x10, 0, 0}, {0x3812, 0x00, 0, 0}, {0x3813, 0x06, 0, 0},
> +	{0x3815, 0x31, 0, 0},
>  	{0x3618, 0x00, 0, 0}, {0x3612, 0x29, 0, 0}, {0x3708, 0x64, 0, 0},
>  	{0x3709, 0x52, 0, 0}, {0x370c, 0x03, 0, 0}, {0x3a02, 0x03, 0, 0},
>  	{0x3a03, 0xd8, 0, 0}, {0x3a08, 0x01, 0, 0}, {0x3a09, 0x27, 0, 0},
> @@ -459,11 +466,7 @@ static const struct reg_value ov5640_setting_VGA_640_480[] = {
>  	{0x3c07, 0x08, 0, 0},
>  	{0x3c09, 0x1c, 0, 0}, {0x3c0a, 0x9c, 0, 0}, {0x3c0b, 0x40, 0, 0},
>  	{0x3814, 0x31, 0, 0},
> -	{0x3815, 0x31, 0, 0}, {0x3800, 0x00, 0, 0}, {0x3801, 0x00, 0, 0},
> -	{0x3802, 0x00, 0, 0}, {0x3803, 0x04, 0, 0}, {0x3804, 0x0a, 0, 0},
> -	{0x3805, 0x3f, 0, 0}, {0x3806, 0x07, 0, 0}, {0x3807, 0x9b, 0, 0},
> -	{0x3810, 0x00, 0, 0},
> -	{0x3811, 0x10, 0, 0}, {0x3812, 0x00, 0, 0}, {0x3813, 0x06, 0, 0},
> +	{0x3815, 0x31, 0, 0},
>  	{0x3618, 0x00, 0, 0}, {0x3612, 0x29, 0, 0}, {0x3708, 0x64, 0, 0},
>  	{0x3709, 0x52, 0, 0}, {0x370c, 0x03, 0, 0}, {0x3a02, 0x03, 0, 0},
>  	{0x3a03, 0xd8, 0, 0}, {0x3a08, 0x01, 0, 0}, {0x3a09, 0x27, 0, 0},
> @@ -478,11 +481,7 @@ static const struct reg_value ov5640_setting_XGA_1024_768[] = {
>  	{0x3c07, 0x08, 0, 0},
>  	{0x3c09, 0x1c, 0, 0}, {0x3c0a, 0x9c, 0, 0}, {0x3c0b, 0x40, 0, 0},
>  	{0x3814, 0x31, 0, 0},
> -	{0x3815, 0x31, 0, 0}, {0x3800, 0x00, 0, 0}, {0x3801, 0x00, 0, 0},
> -	{0x3802, 0x00, 0, 0}, {0x3803, 0x04, 0, 0}, {0x3804, 0x0a, 0, 0},
> -	{0x3805, 0x3f, 0, 0}, {0x3806, 0x07, 0, 0}, {0x3807, 0x9b, 0, 0},
> -	{0x3810, 0x00, 0, 0},
> -	{0x3811, 0x10, 0, 0}, {0x3812, 0x00, 0, 0}, {0x3813, 0x06, 0, 0},
> +	{0x3815, 0x31, 0, 0},
>  	{0x3618, 0x00, 0, 0}, {0x3612, 0x29, 0, 0}, {0x3708, 0x64, 0, 0},
>  	{0x3709, 0x52, 0, 0}, {0x370c, 0x03, 0, 0}, {0x3a02, 0x03, 0, 0},
>  	{0x3a03, 0xd8, 0, 0}, {0x3a08, 0x01, 0, 0}, {0x3a09, 0x27, 0, 0},
> @@ -497,11 +496,7 @@ static const struct reg_value ov5640_setting_QVGA_320_240[] = {
>  	{0x3c07, 0x08, 0, 0},
>  	{0x3c09, 0x1c, 0, 0}, {0x3c0a, 0x9c, 0, 0}, {0x3c0b, 0x40, 0, 0},
>  	{0x3814, 0x31, 0, 0},
> -	{0x3815, 0x31, 0, 0}, {0x3800, 0x00, 0, 0}, {0x3801, 0x00, 0, 0},
> -	{0x3802, 0x00, 0, 0}, {0x3803, 0x04, 0, 0}, {0x3804, 0x0a, 0, 0},
> -	{0x3805, 0x3f, 0, 0}, {0x3806, 0x07, 0, 0}, {0x3807, 0x9b, 0, 0},
> -	{0x3810, 0x00, 0, 0},
> -	{0x3811, 0x10, 0, 0}, {0x3812, 0x00, 0, 0}, {0x3813, 0x06, 0, 0},
> +	{0x3815, 0x31, 0, 0},
>  	{0x3618, 0x00, 0, 0}, {0x3612, 0x29, 0, 0}, {0x3708, 0x64, 0, 0},
>  	{0x3709, 0x52, 0, 0}, {0x370c, 0x03, 0, 0}, {0x3a02, 0x03, 0, 0},
>  	{0x3a03, 0xd8, 0, 0}, {0x3a08, 0x01, 0, 0}, {0x3a09, 0x27, 0, 0},
> @@ -516,11 +511,7 @@ static const struct reg_value ov5640_setting_QQVGA_160_120[] = {
>  	{0x3c07, 0x08, 0, 0},
>  	{0x3c09, 0x1c, 0, 0}, {0x3c0a, 0x9c, 0, 0}, {0x3c0b, 0x40, 0, 0},
>  	{0x3814, 0x31, 0, 0},
> -	{0x3815, 0x31, 0, 0}, {0x3800, 0x00, 0, 0}, {0x3801, 0x00, 0, 0},
> -	{0x3802, 0x00, 0, 0}, {0x3803, 0x04, 0, 0}, {0x3804, 0x0a, 0, 0},
> -	{0x3805, 0x3f, 0, 0}, {0x3806, 0x07, 0, 0}, {0x3807, 0x9b, 0, 0},
> -	{0x3810, 0x00, 0, 0},
> -	{0x3811, 0x10, 0, 0}, {0x3812, 0x00, 0, 0}, {0x3813, 0x06, 0, 0},
> +	{0x3815, 0x31, 0, 0},
>  	{0x3618, 0x00, 0, 0}, {0x3612, 0x29, 0, 0}, {0x3708, 0x64, 0, 0},
>  	{0x3709, 0x52, 0, 0}, {0x370c, 0x03, 0, 0}, {0x3a02, 0x03, 0, 0},
>  	{0x3a03, 0xd8, 0, 0}, {0x3a08, 0x01, 0, 0}, {0x3a09, 0x27, 0, 0},
> @@ -534,11 +525,7 @@ static const struct reg_value ov5640_setting_QCIF_176_144[] = {
>  	{0x3c07, 0x08, 0, 0},
>  	{0x3c09, 0x1c, 0, 0}, {0x3c0a, 0x9c, 0, 0}, {0x3c0b, 0x40, 0, 0},
>  	{0x3814, 0x31, 0, 0},
> -	{0x3815, 0x31, 0, 0}, {0x3800, 0x00, 0, 0}, {0x3801, 0x00, 0, 0},
> -	{0x3802, 0x00, 0, 0}, {0x3803, 0x04, 0, 0}, {0x3804, 0x0a, 0, 0},
> -	{0x3805, 0x3f, 0, 0}, {0x3806, 0x07, 0, 0}, {0x3807, 0x9b, 0, 0},
> -	{0x3810, 0x00, 0, 0},
> -	{0x3811, 0x10, 0, 0}, {0x3812, 0x00, 0, 0}, {0x3813, 0x06, 0, 0},
> +	{0x3815, 0x31, 0, 0},
>  	{0x3618, 0x00, 0, 0}, {0x3612, 0x29, 0, 0}, {0x3708, 0x64, 0, 0},
>  	{0x3709, 0x52, 0, 0}, {0x370c, 0x03, 0, 0}, {0x3a02, 0x03, 0, 0},
>  	{0x3a03, 0xd8, 0, 0}, {0x3a08, 0x01, 0, 0}, {0x3a09, 0x27, 0, 0},
> @@ -553,11 +540,7 @@ static const struct reg_value ov5640_setting_NTSC_720_480[] = {
>  	{0x3c07, 0x08, 0, 0},
>  	{0x3c09, 0x1c, 0, 0}, {0x3c0a, 0x9c, 0, 0}, {0x3c0b, 0x40, 0, 0},
>  	{0x3814, 0x31, 0, 0},
> -	{0x3815, 0x31, 0, 0}, {0x3800, 0x00, 0, 0}, {0x3801, 0x00, 0, 0},
> -	{0x3802, 0x00, 0, 0}, {0x3803, 0x04, 0, 0}, {0x3804, 0x0a, 0, 0},
> -	{0x3805, 0x3f, 0, 0}, {0x3806, 0x07, 0, 0}, {0x3807, 0x9b, 0, 0},
> -	{0x3810, 0x00, 0, 0},
> -	{0x3811, 0x10, 0, 0}, {0x3812, 0x00, 0, 0}, {0x3813, 0x3c, 0, 0},
> +	{0x3815, 0x31, 0, 0},
>  	{0x3618, 0x00, 0, 0}, {0x3612, 0x29, 0, 0}, {0x3708, 0x64, 0, 0},
>  	{0x3709, 0x52, 0, 0}, {0x370c, 0x03, 0, 0}, {0x3a02, 0x03, 0, 0},
>  	{0x3a03, 0xd8, 0, 0}, {0x3a08, 0x01, 0, 0}, {0x3a09, 0x27, 0, 0},
> @@ -572,11 +555,7 @@ static const struct reg_value ov5640_setting_PAL_720_576[] = {
>  	{0x3c07, 0x08, 0, 0},
>  	{0x3c09, 0x1c, 0, 0}, {0x3c0a, 0x9c, 0, 0}, {0x3c0b, 0x40, 0, 0},
>  	{0x3814, 0x31, 0, 0},
> -	{0x3815, 0x31, 0, 0}, {0x3800, 0x00, 0, 0}, {0x3801, 0x00, 0, 0},
> -	{0x3802, 0x00, 0, 0}, {0x3803, 0x04, 0, 0}, {0x3804, 0x0a, 0, 0},
> -	{0x3805, 0x3f, 0, 0}, {0x3806, 0x07, 0, 0}, {0x3807, 0x9b, 0, 0},
> -	{0x3810, 0x00, 0, 0},
> -	{0x3811, 0x38, 0, 0}, {0x3812, 0x00, 0, 0}, {0x3813, 0x06, 0, 0},
> +	{0x3815, 0x31, 0, 0},
>  	{0x3618, 0x00, 0, 0}, {0x3612, 0x29, 0, 0}, {0x3708, 0x64, 0, 0},
>  	{0x3709, 0x52, 0, 0}, {0x370c, 0x03, 0, 0}, {0x3a02, 0x03, 0, 0},
>  	{0x3a03, 0xd8, 0, 0}, {0x3a08, 0x01, 0, 0}, {0x3a09, 0x27, 0, 0},
> @@ -591,11 +570,7 @@ static const struct reg_value ov5640_setting_720P_1280_720[] = {
>  	{0x3c07, 0x07, 0, 0},
>  	{0x3c09, 0x1c, 0, 0}, {0x3c0a, 0x9c, 0, 0}, {0x3c0b, 0x40, 0, 0},
>  	{0x3814, 0x31, 0, 0},
> -	{0x3815, 0x31, 0, 0}, {0x3800, 0x00, 0, 0}, {0x3801, 0x00, 0, 0},
> -	{0x3802, 0x00, 0, 0}, {0x3803, 0xfa, 0, 0}, {0x3804, 0x0a, 0, 0},
> -	{0x3805, 0x3f, 0, 0}, {0x3806, 0x06, 0, 0}, {0x3807, 0xa9, 0, 0},
> -	{0x3810, 0x00, 0, 0},
> -	{0x3811, 0x10, 0, 0}, {0x3812, 0x00, 0, 0}, {0x3813, 0x04, 0, 0},
> +	{0x3815, 0x31, 0, 0},
>  	{0x3618, 0x00, 0, 0}, {0x3612, 0x29, 0, 0}, {0x3708, 0x64, 0, 0},
>  	{0x3709, 0x52, 0, 0}, {0x370c, 0x03, 0, 0}, {0x3a02, 0x02, 0, 0},
>  	{0x3a03, 0xe4, 0, 0}, {0x3a08, 0x01, 0, 0}, {0x3a09, 0xbc, 0, 0},
> @@ -610,11 +585,7 @@ static const struct reg_value ov5640_setting_1080P_1920_1080[] = {
>  	{0x3c07, 0x08, 0, 0},
>  	{0x3c09, 0x1c, 0, 0}, {0x3c0a, 0x9c, 0, 0}, {0x3c0b, 0x40, 0, 0},
>  	{0x3814, 0x11, 0, 0},
> -	{0x3815, 0x11, 0, 0}, {0x3800, 0x00, 0, 0}, {0x3801, 0x00, 0, 0},
> -	{0x3802, 0x00, 0, 0}, {0x3803, 0x00, 0, 0}, {0x3804, 0x0a, 0, 0},
> -	{0x3805, 0x3f, 0, 0}, {0x3806, 0x07, 0, 0}, {0x3807, 0x9f, 0, 0},
> -	{0x3810, 0x00, 0, 0},
> -	{0x3811, 0x10, 0, 0}, {0x3812, 0x00, 0, 0}, {0x3813, 0x04, 0, 0},
> +	{0x3815, 0x11, 0, 0},
>  	{0x3618, 0x04, 0, 0}, {0x3612, 0x29, 0, 0}, {0x3708, 0x21, 0, 0},
>  	{0x3709, 0x12, 0, 0}, {0x370c, 0x00, 0, 0}, {0x3a02, 0x03, 0, 0},
>  	{0x3a03, 0xd8, 0, 0}, {0x3a08, 0x01, 0, 0}, {0x3a09, 0x27, 0, 0},
> @@ -625,9 +596,6 @@ static const struct reg_value ov5640_setting_1080P_1920_1080[] = {
>  	{0x3824, 0x02, 0, 0}, {0x5001, 0x83, 0, 0},
>  	{0x3c07, 0x07, 0, 0}, {0x3c08, 0x00, 0, 0},
>  	{0x3c09, 0x1c, 0, 0}, {0x3c0a, 0x9c, 0, 0}, {0x3c0b, 0x40, 0, 0},
> -	{0x3800, 0x01, 0, 0}, {0x3801, 0x50, 0, 0}, {0x3802, 0x01, 0, 0},
> -	{0x3803, 0xb2, 0, 0}, {0x3804, 0x08, 0, 0}, {0x3805, 0xef, 0, 0},
> -	{0x3806, 0x05, 0, 0}, {0x3807, 0xf1, 0, 0},
>  	{0x3612, 0x2b, 0, 0}, {0x3708, 0x64, 0, 0},
>  	{0x3a02, 0x04, 0, 0}, {0x3a03, 0x60, 0, 0}, {0x3a08, 0x01, 0, 0},
>  	{0x3a09, 0x50, 0, 0}, {0x3a0a, 0x01, 0, 0}, {0x3a0b, 0x18, 0, 0},
> @@ -641,11 +609,7 @@ static const struct reg_value ov5640_setting_QSXGA_2592_1944[] = {
>  	{0x3c07, 0x08, 0, 0},
>  	{0x3c09, 0x1c, 0, 0}, {0x3c0a, 0x9c, 0, 0}, {0x3c0b, 0x40, 0, 0},
>  	{0x3814, 0x11, 0, 0},
> -	{0x3815, 0x11, 0, 0}, {0x3800, 0x00, 0, 0}, {0x3801, 0x00, 0, 0},
> -	{0x3802, 0x00, 0, 0}, {0x3803, 0x00, 0, 0}, {0x3804, 0x0a, 0, 0},
> -	{0x3805, 0x3f, 0, 0}, {0x3806, 0x07, 0, 0}, {0x3807, 0x9f, 0, 0},
> -	{0x3810, 0x00, 0, 0},
> -	{0x3811, 0x10, 0, 0}, {0x3812, 0x00, 0, 0}, {0x3813, 0x04, 0, 0},
> +	{0x3815, 0x11, 0, 0},
>  	{0x3618, 0x04, 0, 0}, {0x3612, 0x29, 0, 0}, {0x3708, 0x21, 0, 0},
>  	{0x3709, 0x12, 0, 0}, {0x370c, 0x00, 0, 0}, {0x3a02, 0x03, 0, 0},
>  	{0x3a03, 0xd8, 0, 0}, {0x3a08, 0x01, 0, 0}, {0x3a09, 0x27, 0, 0},
> @@ -658,96 +622,250 @@ static const struct reg_value ov5640_setting_QSXGA_2592_1944[] = {
>  
>  /* power-on sensor init reg table */
>  static const struct ov5640_mode_info ov5640_mode_init_data = {
> -	0, SUBSAMPLING,
> -	OV5640_PIXEL_RATE_96M,
> -	640, 1896, 480, 984,
> -	ov5640_init_setting_30fps_VGA,
> -	ARRAY_SIZE(ov5640_init_setting_30fps_VGA),
> -	OV5640_30_FPS,
> +		.id		= 0,
> +		.dn_mode	= SUBSAMPLING,
> +		.pixel_rate	= OV5640_PIXEL_RATE_96M,
> +		.analog_crop = {
> +			.left	= 0,
> +			.top	= 4,
> +			.width	= 2623,
> +			.height	= 1947,

The values here match the above tables given that you write

	OV5640_REG_TIMING_HW = analog_crop->width
	OV5640_REG_TIMING_VH = analog_crop->height

below. However, that's not correct. The HW and VH registers store the X
address end and Y address end respectively, which are equal to left +
width - 1 and top + height - 1. You should thus update the code below to
read

	ret = ov5640_write_reg16(sensor, OV5640_REG_TIMING_HW,
				 analog_crop->left + analog_crop->width - 1);
	if (ret < 0)
		return ret;

	ret = ov5640_write_reg16(sensor, OV5640_REG_TIMING_VH,
				 analog_crop->top + analog_crop->height - 1);
	if (ret < 0)
		return ret;

and update the analog_crop width and height values in this table
accordingly. All but the last three entries should be

		.analog_crop = {
			.left	= 0,
			.top	= 4,
			.width	= 2624,
			.height	= 1944,
		},

> +		},
> +		.crop = {
> +			.left	= 16,
> +			.top	= 6,
> +			.width	= 640,
> +			.height	= 480,
> +		},
> +		.htot		= 1896,
> +		.vblank_def	= 504,
> +		.reg_data	= ov5640_init_setting_30fps_VGA,
> +		.reg_data_size	= ARRAY_SIZE(ov5640_init_setting_30fps_VGA),
> +		.max_fps	= OV5640_30_FPS
>  };
>  
>  static const struct ov5640_mode_info
>  ov5640_mode_data[OV5640_NUM_MODES] = {
>  	{
>  		/* 160x120 */
> -		OV5640_MODE_QQVGA_160_120, SUBSAMPLING,
> -		OV5640_PIXEL_RATE_48M,
> -		160, 1896, 120, 984,
> -		ov5640_setting_QQVGA_160_120,
> -		ARRAY_SIZE(ov5640_setting_QQVGA_160_120),
> -		OV5640_30_FPS
> +		.id		= OV5640_MODE_QQVGA_160_120,
> +		.dn_mode	= SUBSAMPLING,
> +		.pixel_rate	= OV5640_PIXEL_RATE_48M,
> +		.analog_crop = {
> +			.left	= 0,
> +			.top	= 4,
> +			.width	= 2623,
> +			.height	= 1947,
> +		},
> +		.crop = {
> +			.left	= 16,
> +			.top	= 6,
> +			.width	= 160,
> +			.height	= 120,
> +		},
> +		.htot		= 1896,
> +		.vblank_def	= 864,
> +		.reg_data	= ov5640_setting_QQVGA_160_120,
> +		.reg_data_size	= ARRAY_SIZE(ov5640_setting_QQVGA_160_120),
> +		.max_fps	= OV5640_30_FPS
>  	}, {
>  		/* 176x144 */
> -		OV5640_MODE_QCIF_176_144, SUBSAMPLING,
> -		OV5640_PIXEL_RATE_48M,
> -		176, 1896, 144, 984,
> -		ov5640_setting_QCIF_176_144,
> -		ARRAY_SIZE(ov5640_setting_QCIF_176_144),
> -		OV5640_30_FPS
> +		.id		= OV5640_MODE_QCIF_176_144,
> +		.dn_mode	= SUBSAMPLING,
> +		.pixel_rate	= OV5640_PIXEL_RATE_48M,
> +		.analog_crop = {
> +			.left	= 0,
> +			.top	= 4,
> +			.width	= 2623,
> +			.height	= 1947,
> +		},
> +		.crop = {
> +			.left	= 16,
> +			.top	= 6,
> +			.width	= 176,
> +			.height	= 144,
> +		},
> +		.htot		= 1896,
> +		.vblank_def	= 840,
> +		.reg_data	= ov5640_setting_QCIF_176_144,
> +		.reg_data_size	= ARRAY_SIZE(ov5640_setting_QCIF_176_144),
> +		.max_fps	= OV5640_30_FPS
>  	}, {
>  		/* 320x240 */
> -		OV5640_MODE_QVGA_320_240, SUBSAMPLING,
> -		OV5640_PIXEL_RATE_48M,
> -		320, 1896, 240, 984,
> -		ov5640_setting_QVGA_320_240,
> -		ARRAY_SIZE(ov5640_setting_QVGA_320_240),
> -		OV5640_30_FPS
> +		.id		= OV5640_MODE_QVGA_320_240,
> +		.dn_mode	= SUBSAMPLING,
> +		.pixel_rate	= OV5640_PIXEL_RATE_48M,
> +		.analog_crop = {
> +			.left	= 0,
> +			.top	= 4,
> +			.width	= 2623,
> +			.height	= 1947,
> +		},
> +		.crop = {
> +			.left	= 16,
> +			.top	= 6,
> +			.width	= 320,
> +			.height	= 240,
> +		},
> +		.htot		= 1896,
> +		.vblank_def	= 744,
> +		.reg_data	= ov5640_setting_QVGA_320_240,
> +		.reg_data_size	= ARRAY_SIZE(ov5640_setting_QVGA_320_240),
> +		.max_fps	= OV5640_30_FPS
>  	}, {
>  		/* 640x480 */
> -		OV5640_MODE_VGA_640_480, SUBSAMPLING,
> -		OV5640_PIXEL_RATE_48M,
> -		640, 1896, 480, 1080,
> -		ov5640_setting_VGA_640_480,
> -		ARRAY_SIZE(ov5640_setting_VGA_640_480),
> -		OV5640_60_FPS
> +		.id		= OV5640_MODE_VGA_640_480,
> +		.dn_mode	= SUBSAMPLING,
> +		.pixel_rate	= OV5640_PIXEL_RATE_48M,
> +		.analog_crop = {
> +			.left	= 0,
> +			.top	= 4,
> +			.width	= 2623,
> +			.height	= 1947,
> +		},
> +		.crop = {
> +			.left	= 16,
> +			.top	= 6,
> +			.width	= 640,
> +			.height	= 480,
> +		},
> +		.htot		= 1896,
> +		.vblank_def	= 600,
> +		.reg_data	= ov5640_setting_VGA_640_480,
> +		.reg_data_size	= ARRAY_SIZE(ov5640_setting_VGA_640_480),
> +		.max_fps	= OV5640_60_FPS
>  	}, {
>  		/* 720x480 */
> -		OV5640_MODE_NTSC_720_480, SUBSAMPLING,
> -		OV5640_PIXEL_RATE_96M,
> -		720, 1896, 480, 984,
> -		ov5640_setting_NTSC_720_480,
> -		ARRAY_SIZE(ov5640_setting_NTSC_720_480),
> -		OV5640_30_FPS
> +		.id		= OV5640_MODE_NTSC_720_480,
> +		.dn_mode	= SUBSAMPLING,
> +		.pixel_rate	= OV5640_PIXEL_RATE_96M,
> +		.analog_crop = {
> +			.left	= 0,
> +			.top	= 4,
> +			.width	= 2623,
> +			.height	= 1947,
> +		},
> +		.crop = {
> +			.left	= 16,
> +			.top	= 60,
> +			.width	= 720,
> +			.height	= 480,
> +		},
> +		.htot		= 1896,
> +		.vblank_def	= 504,
> +		.reg_data	= ov5640_setting_NTSC_720_480,
> +		.reg_data_size	= ARRAY_SIZE(ov5640_setting_NTSC_720_480),
> +		.max_fps	= OV5640_30_FPS
>  	}, {
>  		/* 720x576 */
> -		OV5640_MODE_PAL_720_576, SUBSAMPLING,
> -		OV5640_PIXEL_RATE_96M,
> -		720, 1896, 576, 984,
> -		ov5640_setting_PAL_720_576,
> -		ARRAY_SIZE(ov5640_setting_PAL_720_576),
> -		OV5640_30_FPS
> +		.id		= OV5640_MODE_PAL_720_576,
> +		.dn_mode	= SUBSAMPLING,
> +		.pixel_rate	= OV5640_PIXEL_RATE_96M,
> +		.analog_crop = {
> +			.left	= 0,
> +			.top	= 4,
> +			.width	= 2623,
> +			.height	= 1947,
> +		},
> +		.crop = {
> +			.left	= 56,
> +			.top	= 6,
> +			.width	= 720,
> +			.height	= 576,
> +		},
> +		.htot		= 1896,
> +		.vblank_def	= 408,
> +		.reg_data	= ov5640_setting_PAL_720_576,
> +		.reg_data_size	= ARRAY_SIZE(ov5640_setting_PAL_720_576),
> +		.max_fps	= OV5640_30_FPS
>  	}, {
>  		/* 1024x768 */
> -		OV5640_MODE_XGA_1024_768, SUBSAMPLING,
> -		OV5640_PIXEL_RATE_96M,
> -		1024, 1896, 768, 1080,
> -		ov5640_setting_XGA_1024_768,
> -		ARRAY_SIZE(ov5640_setting_XGA_1024_768),
> -		OV5640_30_FPS
> +		.id		= OV5640_MODE_XGA_1024_768,
> +		.dn_mode	= SUBSAMPLING,
> +		.pixel_rate	= OV5640_PIXEL_RATE_96M,
> +		.analog_crop = {
> +			.left	= 0,
> +			.top	= 4,
> +			.width	= 2623,
> +			.height	= 1947,
> +		},
> +		.crop = {
> +			.left	= 16,
> +			.top	= 6,
> +			.width	= 1024,
> +			.height	= 768,
> +		},
> +		.htot		= 1896,
> +		.vblank_def	= 312,
> +		.reg_data	= ov5640_setting_XGA_1024_768,
> +		.reg_data_size	= ARRAY_SIZE(ov5640_setting_XGA_1024_768),
> +		.max_fps	= OV5640_30_FPS
>  	}, {
>  		/* 1280x720 */
> -		OV5640_MODE_720P_1280_720, SUBSAMPLING,
> -		OV5640_PIXEL_RATE_124M,
> -		1280, 1892, 720, 740,
> -		ov5640_setting_720P_1280_720,
> -		ARRAY_SIZE(ov5640_setting_720P_1280_720),
> -		OV5640_30_FPS
> +		.id		= OV5640_MODE_720P_1280_720,
> +		.dn_mode	= SUBSAMPLING,
> +		.pixel_rate	= OV5640_PIXEL_RATE_124M,
> +		.analog_crop = {
> +			.left	= 0,
> +			.top	= 250,
> +			.width	= 2623,
> +			.height	= 1705,
> +		},

		.analog_crop = {
			.left	= 0,
			.top	= 250,
			.width	= 2624,
			.height	= 1456,
		},

> +		.crop = {
> +			.left	= 16,
> +			.top	= 4,
> +			.width	= 1280,
> +			.height	= 720,
> +		},
> +		.htot		= 1892,
> +		.vblank_def	= 20,
> +		.reg_data	= ov5640_setting_720P_1280_720,
> +		.reg_data_size	= ARRAY_SIZE(ov5640_setting_720P_1280_720),
> +		.max_fps	= OV5640_30_FPS
>  	}, {
>  		/* 1920x1080 */
> -		OV5640_MODE_1080P_1920_1080, SCALING,
> -		OV5640_PIXEL_RATE_148M,
> -		1920, 2500, 1080, 1120,
> -		ov5640_setting_1080P_1920_1080,
> -		ARRAY_SIZE(ov5640_setting_1080P_1920_1080),
> -		OV5640_30_FPS
> +		.id		= OV5640_MODE_1080P_1920_1080,
> +		.dn_mode	= SCALING,
> +		.pixel_rate	= OV5640_PIXEL_RATE_148M,
> +		.analog_crop = {
> +			.left	= 336,
> +			.top	= 434,
> +			.width	= 2287,
> +			.height	= 1521,
> +		},

		.analog_crop = {
			.left	= 336,
			.top	= 434,
			.width	= 1952,
			.height	= 1088,
		},

> +		.crop = {
> +			.left	= 16,
> +			.top	= 4,
> +			.width	= 1920,
> +			.height	= 1080,
> +		},
> +		.htot		= 2500,
> +		.vblank_def	= 40,
> +		.reg_data	= ov5640_setting_1080P_1920_1080,
> +		.reg_data_size	= ARRAY_SIZE(ov5640_setting_1080P_1920_1080),
> +		.max_fps	= OV5640_30_FPS
>  	}, {
>  		/* 2592x1944 */
> -		OV5640_MODE_QSXGA_2592_1944, SCALING,
> -		OV5640_PIXEL_RATE_168M,
> -		2592, 2844, 1944, 1968,
> -		ov5640_setting_QSXGA_2592_1944,
> -		ARRAY_SIZE(ov5640_setting_QSXGA_2592_1944),
> -		OV5640_15_FPS
> +		.id		= OV5640_MODE_QSXGA_2592_1944,
> +		.dn_mode	= SCALING,
> +		.pixel_rate	= OV5640_PIXEL_RATE_168M,
> +		.analog_crop = {
> +			.left	= 0,
> +			.top	= 0,
> +			.width	= 2623,
> +			.height	= 1951,
> +		},

		.analog_crop = {
			.left	= 0,
			.top	= 0,
			.width	= 2624,
			.height	= 1952,
		},

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +		.crop = {
> +			.left	= 16,
> +			.top	= 4,
> +			.width	= 2592,
> +			.height	= 1944,
> +		},
> +		.htot		= 2844,
> +		.vblank_def	= 24,
> +		.reg_data	= ov5640_setting_QSXGA_2592_1944,
> +		.reg_data_size	= ARRAY_SIZE(ov5640_setting_QSXGA_2592_1944),
> +		.max_fps	= OV5640_15_FPS
>  	},
>  };
>  
> @@ -1150,7 +1268,8 @@ static u32 ov5640_calc_pixel_rate(struct ov5640_dev *sensor)
>  {
>  	u32 rate;
>  
> -	rate = sensor->current_mode->vtot * sensor->current_mode->htot;
> +	rate = sensor->current_mode->htot
> +	     * (sensor->current_mode->crop.height + sensor->current_mode->vblank_def);
>  	rate *= ov5640_framerates[sensor->current_fr];
>  
>  	return rate;
> @@ -1234,17 +1353,21 @@ static int ov5640_set_jpeg_timings(struct ov5640_dev *sensor,
>  	if (ret < 0)
>  		return ret;
>  
> -	ret = ov5640_write_reg16(sensor, OV5640_REG_VFIFO_HSIZE, mode->hact);
> +	ret = ov5640_write_reg16(sensor, OV5640_REG_VFIFO_HSIZE,
> +				 mode->crop.width);
>  	if (ret < 0)
>  		return ret;
>  
> -	return ov5640_write_reg16(sensor, OV5640_REG_VFIFO_VSIZE, mode->vact);
> +	return ov5640_write_reg16(sensor, OV5640_REG_VFIFO_VSIZE,
> +				  mode->crop.height);
>  }
>  
>  /* download ov5640 settings to sensor through i2c */
>  static int ov5640_set_timings(struct ov5640_dev *sensor,
>  			      const struct ov5640_mode_info *mode)
>  {
> +	const struct v4l2_rect *analog_crop = &mode->analog_crop;
> +	const struct v4l2_rect *crop = &mode->crop;
>  	int ret;
>  
>  	if (sensor->fmt.code == MEDIA_BUS_FMT_JPEG_1X8) {
> @@ -1253,11 +1376,35 @@ static int ov5640_set_timings(struct ov5640_dev *sensor,
>  			return ret;
>  	}
>  
> -	ret = ov5640_write_reg16(sensor, OV5640_REG_TIMING_DVPHO, mode->hact);
> +	ret = ov5640_write_reg16(sensor, OV5640_REG_TIMING_HS, analog_crop->left);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = ov5640_write_reg16(sensor, OV5640_REG_TIMING_VS, analog_crop->top);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = ov5640_write_reg16(sensor, OV5640_REG_TIMING_HW, analog_crop->width);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = ov5640_write_reg16(sensor, OV5640_REG_TIMING_VH, analog_crop->height);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = ov5640_write_reg16(sensor, OV5640_REG_TIMING_HOFFS, crop->left);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = ov5640_write_reg16(sensor, OV5640_REG_TIMING_VOFFS, crop->top);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = ov5640_write_reg16(sensor, OV5640_REG_TIMING_DVPHO, crop->width);
>  	if (ret < 0)
>  		return ret;
>  
> -	ret = ov5640_write_reg16(sensor, OV5640_REG_TIMING_DVPVO, mode->vact);
> +	ret = ov5640_write_reg16(sensor, OV5640_REG_TIMING_DVPVO, crop->height);
>  	if (ret < 0)
>  		return ret;
>  
> @@ -1265,7 +1412,12 @@ static int ov5640_set_timings(struct ov5640_dev *sensor,
>  	if (ret < 0)
>  		return ret;
>  
> -	return ov5640_write_reg16(sensor, OV5640_REG_TIMING_VTS, mode->vtot);
> +	ret = ov5640_write_reg16(sensor, OV5640_REG_TIMING_VTS,
> +				 crop->height + mode->vblank_def);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
>  }
>  
>  static int ov5640_load_regs(struct ov5640_dev *sensor,
> @@ -1693,11 +1845,11 @@ ov5640_find_mode(struct ov5640_dev *sensor, enum ov5640_frame_rate fr,
>  
>  	mode = v4l2_find_nearest_size(ov5640_mode_data,
>  				      ARRAY_SIZE(ov5640_mode_data),
> -				      hact, vact,
> -				      width, height);
> +				      crop.width, crop.height, width, height);
>  
>  	if (!mode ||
> -	    (!nearest && (mode->hact != width || mode->vact != height)))
> +	    (!nearest &&
> +	     (mode->crop.width != width || mode->crop.height != height)))
>  		return NULL;
>  
>  	/* Check to see if the current mode exceeds the max frame rate */
> @@ -2381,8 +2533,8 @@ static int ov5640_try_fmt_internal(struct v4l2_subdev *sd,
>  	mode = ov5640_find_mode(sensor, fr, fmt->width, fmt->height, true);
>  	if (!mode)
>  		return -EINVAL;
> -	fmt->width = mode->hact;
> -	fmt->height = mode->vact;
> +	fmt->width = mode->crop.width;
> +	fmt->height = mode->crop.height;
>  
>  	if (new_mode)
>  		*new_mode = mode;
> @@ -3014,11 +3166,9 @@ static int ov5640_enum_frame_size(struct v4l2_subdev *sd,
>  	if (fse->index >= OV5640_NUM_MODES)
>  		return -EINVAL;
>  
> -	fse->min_width =
> -		ov5640_mode_data[fse->index].hact;
> +	fse->min_width = ov5640_mode_data[fse->index].crop.width;
>  	fse->max_width = fse->min_width;
> -	fse->min_height =
> -		ov5640_mode_data[fse->index].vact;
> +	fse->min_height = ov5640_mode_data[fse->index].crop.height;
>  	fse->max_height = fse->min_height;
>  
>  	return 0;
> @@ -3082,15 +3232,16 @@ static int ov5640_s_frame_interval(struct v4l2_subdev *sd,
>  	mode = sensor->current_mode;
>  
>  	frame_rate = ov5640_try_frame_interval(sensor, &fi->interval,
> -					       mode->hact, mode->vact);
> +					       mode->crop.width,
> +					       mode->crop.height);
>  	if (frame_rate < 0) {
>  		/* Always return a valid frame interval value */
>  		fi->interval = sensor->frame_interval;
>  		goto out;
>  	}
>  
> -	mode = ov5640_find_mode(sensor, frame_rate, mode->hact,
> -				mode->vact, true);
> +	mode = ov5640_find_mode(sensor, frame_rate, mode->crop.width,
> +				mode->crop.height, true);
>  	if (!mode) {
>  		ret = -EINVAL;
>  		goto out;

-- 
Regards,

Laurent Pinchart
