Return-Path: <linux-media+bounces-2168-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBDC80DDE2
	for <lists+linux-media@lfdr.de>; Mon, 11 Dec 2023 23:08:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04EA42824FA
	for <lists+linux-media@lfdr.de>; Mon, 11 Dec 2023 22:08:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF82355787;
	Mon, 11 Dec 2023 22:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Ixj4kEoN"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5025CA6;
	Mon, 11 Dec 2023 14:08:09 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F09DC922;
	Mon, 11 Dec 2023 23:07:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1702332443;
	bh=OGGjmvt7t8Zrpu5flQgJGLONHAQUCWanMmv4maIIF5M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ixj4kEoN5o83f3UJxVYoNiHdbykFsYDkJQDS/pUcDGEXNoIZFvyDxmPl+69ah0TIh
	 fncxNU3ji9A6OWbajw8AVous8AXF53V/QoKkhREulg7GS0pUidsHnyqSyYvka1l31f
	 NiscOKlLK01jb8roY/G2lhF8+zC68Pa3zhMLByUg=
Date: Tue, 12 Dec 2023 00:08:13 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mikhail Rudenko <mike.rudenko@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 10/19] media: i2c: ov4689: Make horizontal blanking
 configurable
Message-ID: <20231211220813.GI27535@pendragon.ideasonboard.com>
References: <20231211175023.1680247-1-mike.rudenko@gmail.com>
 <20231211175023.1680247-11-mike.rudenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231211175023.1680247-11-mike.rudenko@gmail.com>

Hi Mikhail,

Thank you for the patch.

On Mon, Dec 11, 2023 at 08:50:13PM +0300, Mikhail Rudenko wrote:
> Make horizontal blanking configurable. To do so, set HTS register
> according to the requested horizontal blanking in ov4689_set_ctrl
> instead of the register table. Default HTS value is not changed by
> this patch. Minimal HTS value is found experimentally and corresponds
> to 90 fps framerate at minimum vertical blanking. Real HTS value is
> the register value multiplied by 4.
> 
> Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>
> ---
>  drivers/media/i2c/ov4689.c | 33 +++++++++++++++++++++------------
>  1 file changed, 21 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov4689.c b/drivers/media/i2c/ov4689.c
> index 9fa06941a0e5..67d4004bdcfb 100644
> --- a/drivers/media/i2c/ov4689.c
> +++ b/drivers/media/i2c/ov4689.c
> @@ -30,7 +30,6 @@
>  #define OV4689_REG_EXPOSURE		CCI_REG24(0x3500)
>  #define OV4689_EXPOSURE_MIN		4
>  #define OV4689_EXPOSURE_STEP		1
> -#define OV4689_VTS_MAX			0x7fff
>  
>  #define OV4689_REG_GAIN			CCI_REG16(0x3508)
>  #define OV4689_GAIN_STEP		1
> @@ -41,6 +40,11 @@
>  #define OV4689_TEST_PATTERN_DISABLE	0x0
>  
>  #define OV4689_REG_VTS			CCI_REG16(0x380e)
> +#define OV4689_VTS_MAX			0x7fff
> +
> +#define OV4689_REG_HTS			CCI_REG16(0x380c)
> +#define OV4689_HTS_DIVIDER		4
> +#define OV4689_HTS_MAX			0x7fff

Could you move this just before REG_VTS to keep registers sorted by
address ?

>  
>  #define OV4689_LANES			4
>  #define OV4689_XVCLK_FREQ		24000000
> @@ -61,6 +65,7 @@ struct ov4689_mode {
>  	u32 width;
>  	u32 height;
>  	u32 hts_def;
> +	u32 hts_min;
>  	u32 vts_def;
>  	u32 exp_def;
>  	u32 pixel_rate;
> @@ -104,7 +109,7 @@ struct ov4689_gain_range {
>  
>  /*
>   * Xclk 24Mhz
> - * max_framerate 30fps
> + * max_framerate 90fps
>   * mipi_datarate per lane 1008Mbps
>   */
>  static const struct cci_reg_sequence ov4689_2688x1520_regs[] = {
> @@ -175,8 +180,6 @@ static const struct cci_reg_sequence ov4689_2688x1520_regs[] = {
>  	/* Timing control */
>  	{CCI_REG8(0x3801), 0x08}, /* H_CROP_START_L h_crop_start[7:0] = 0x08 */
>  	{CCI_REG8(0x3805), 0x97}, /* H_CROP_END_L h_crop_end[7:0] = 0x97 */
> -	{CCI_REG8(0x380c), 0x0a}, /* TIMING_HTS_H hts[14:8] = 0x0a */
> -	{CCI_REG8(0x380d), 0x0e}, /* TIMING_HTS_L hts[7:0] = 0x0e */
>  	{CCI_REG8(0x3811), 0x08}, /* H_WIN_OFF_L h_win_off[7:0] = 0x08*/
>  	{CCI_REG8(0x3813), 0x04}, /* V_WIN_OFF_L v_win_off[7:0] = 0x04 */
>  	{CCI_REG8(0x3819), 0x01}, /* VSYNC_END_L vsync_end_point[7:0] = 0x01 */
> @@ -237,7 +240,8 @@ static const struct ov4689_mode supported_modes[] = {
>  		.crop_top = 8,
>  		.crop_left = 16,
>  		.exp_def = 1536,
> -		.hts_def = 4 * 2574,
> +		.hts_def = 10296,
> +		.hts_min = 3432,
>  		.vts_def = 1554,
>  		.pixel_rate = 480000000,
>  		.reg_list = ov4689_2688x1520_regs,
> @@ -596,6 +600,11 @@ static int ov4689_set_ctrl(struct v4l2_ctrl *ctrl)
>  	case V4L2_CID_TEST_PATTERN:
>  		ret = ov4689_enable_test_pattern(ov4689, val);
>  		break;
> +	case V4L2_CID_HBLANK:
> +		cci_write(regmap, OV4689_REG_HTS,
> +			  (val + ov4689->cur_mode->width) /
> +			  OV4689_HTS_DIVIDER, &ret);
> +		break;
>  	default:
>  		dev_warn(dev, "%s Unhandled id:0x%x, val:0x%x\n",
>  			 __func__, ctrl->id, val);
> @@ -618,13 +627,13 @@ static int ov4689_initialize_controls(struct ov4689 *ov4689)
>  	struct v4l2_ctrl_handler *handler;
>  	const struct ov4689_mode *mode;
>  	s64 exposure_max, vblank_def;
> +	s64 hblank_def, hblank_min;
>  	struct v4l2_ctrl *ctrl;
> -	s64 h_blank_def;
>  	int ret;
>  
>  	handler = &ov4689->ctrl_handler;
>  	mode = ov4689->cur_mode;
> -	ret = v4l2_ctrl_handler_init(handler, 10);
> +	ret = v4l2_ctrl_handler_init(handler, 11);

The HBLANK control already exists, you're only changing how it is
initialized. I see 8 controls being created by the driver directly,
plus 2 created by v4l2_ctrl_new_fwnode_properties(), so I think 10 is a
correct value here.

With these small issues addressed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	if (ret)
>  		return ret;
>  
> @@ -636,11 +645,11 @@ static int ov4689_initialize_controls(struct ov4689 *ov4689)
>  	v4l2_ctrl_new_std(handler, NULL, V4L2_CID_PIXEL_RATE, 0,
>  			  mode->pixel_rate, 1, mode->pixel_rate);
>  
> -	h_blank_def = mode->hts_def - mode->width;
> -	ctrl = v4l2_ctrl_new_std(handler, NULL, V4L2_CID_HBLANK, h_blank_def,
> -				 h_blank_def, 1, h_blank_def);
> -	if (ctrl)
> -		ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +	hblank_def = mode->hts_def - mode->width;
> +	hblank_min = mode->hts_min - mode->width;
> +	v4l2_ctrl_new_std(handler, &ov4689_ctrl_ops, V4L2_CID_HBLANK,
> +			  hblank_min, OV4689_HTS_MAX - mode->width,
> +			  OV4689_HTS_DIVIDER, hblank_def);
>  
>  	vblank_def = mode->vts_def - mode->height;
>  	v4l2_ctrl_new_std(handler, &ov4689_ctrl_ops, V4L2_CID_VBLANK,

-- 
Regards,

Laurent Pinchart

