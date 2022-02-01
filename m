Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 540B24A5E90
	for <lists+linux-media@lfdr.de>; Tue,  1 Feb 2022 15:52:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239457AbiBAOwh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Feb 2022 09:52:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236688AbiBAOwg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Feb 2022 09:52:36 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB9A9C061714
        for <linux-media@vger.kernel.org>; Tue,  1 Feb 2022 06:52:36 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 13CF2332;
        Tue,  1 Feb 2022 15:52:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1643727155;
        bh=onZn096m8OYlHL30pWrqCTJ8gydGv+acrn9+UbX8ISM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wgTe/iA37v+TR+W0HnlzS2xd27X1dw5LsTcyFrCcM1aUWy31oz6VUw9m5rnVqBAZE
         KuJyh5fdnoqxKlW4idB1cRDHPab2SX19Nm8DV3HehbAjfwd/YjHqhLL8annPcuozFz
         AYqCKGu+dGL7kgJkpn7+V88VEOwHK2cDlb7s6b+M=
Date:   Tue, 1 Feb 2022 16:52:12 +0200
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
Subject: Re: [PATCH 01/21] media: ov5640: Add pixel rate to modes
Message-ID: <YflJHNylTQGm4eRz@pendragon.ideasonboard.com>
References: <20220131143245.128089-1-jacopo@jmondi.org>
 <20220131143245.128089-2-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220131143245.128089-2-jacopo@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Mon, Jan 31, 2022 at 03:32:25PM +0100, Jacopo Mondi wrote:
> Add to each mode supported by the sensor the ideal pixel rate, as
> defined by Table 2.1 in the chip manual.
> 
> The ideal pixel rate will be used to compute the MIPI CSI-2 clock tree.
> 
> Create the V4L2_CID_LINK_FREQ control and define the enumeration
> of possible MIPI CSI-2 link frequencies from the list of supported
> pixel clocks.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/i2c/ov5640.c | 66 ++++++++++++++++++++++++++++++++++++--
>  1 file changed, 63 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index db5a19babe67..d915c9652302 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -118,6 +118,44 @@ enum ov5640_frame_rate {
>  	OV5640_NUM_FRAMERATES,
>  };
>  
> +enum ov5640_pixel_rate_id {
> +	OV5640_PIXEL_RATE_168M,
> +	OV5640_PIXEL_RATE_148M,
> +	OV5640_PIXEL_RATE_124M,
> +	OV5640_PIXEL_RATE_96M,
> +	OV5640_PIXEL_RATE_48M,
> +	OV5640_NUM_PIXEL_RATES,
> +};
> +
> +/*
> + * The chip manual suggests 24/48/96/192 MHz pixel clocks.
> + *
> + * 192MHz exceeds the sysclk limits; use 168MHz as maximum pixel rate for
> + * full resolution mode @15 FPS.
> + */
> +static const u32 ov5640_pixel_rates[] = {
> +	[OV5640_PIXEL_RATE_168M] = 168000000,
> +	[OV5640_PIXEL_RATE_148M] = 148000000,
> +	[OV5640_PIXEL_RATE_124M] = 124000000,
> +	[OV5640_PIXEL_RATE_96M] = 96000000,
> +	[OV5640_PIXEL_RATE_48M] = 48000000,
> +};
> +
> +/*
> + * MIPI CSI-2 link frequencies.
> + *
> + * Derived from the above defined pixel rate for bpp = (8, 16, 24) and
> + * data_lanes = (1, 2)
> + *
> + * link_freq = (pixel_rate * bpp) / (2 * data_lanes)
> + */
> +static const s64 ov5640_csi2_link_freqs[] = {
> +	992000000, 888000000, 768000000, 744000000, 672000000, 672000000,
> +	592000000, 592000000, 576000000, 576000000, 496000000, 496000000,
> +	384000000, 384000000, 384000000, 336000000, 296000000, 288000000,
> +	248000000, 192000000, 192000000, 192000000, 96000000,
> +};
> +
>  enum ov5640_format_mux {
>  	OV5640_FMT_MUX_YUV422 = 0,
>  	OV5640_FMT_MUX_RGB,
> @@ -189,6 +227,7 @@ struct reg_value {
>  struct ov5640_mode_info {
>  	enum ov5640_mode_id id;
>  	enum ov5640_downsize_mode dn_mode;
> +	enum ov5640_pixel_rate_id pixel_rate;
>  	u32 hact;
>  	u32 htot;
>  	u32 vact;
> @@ -201,6 +240,7 @@ struct ov5640_mode_info {
>  struct ov5640_ctrls {
>  	struct v4l2_ctrl_handler handler;
>  	struct v4l2_ctrl *pixel_rate;
> +	struct v4l2_ctrl *link_freq;
>  	struct {
>  		struct v4l2_ctrl *auto_exp;
>  		struct v4l2_ctrl *exposure;
> @@ -565,7 +605,9 @@ static const struct reg_value ov5640_setting_QSXGA_2592_1944[] = {
>  
>  /* power-on sensor init reg table */
>  static const struct ov5640_mode_info ov5640_mode_init_data = {
> -	0, SUBSAMPLING, 640, 1896, 480, 984,
> +	0, SUBSAMPLING,
> +	OV5640_PIXEL_RATE_96M,
> +	640, 1896, 480, 984,
>  	ov5640_init_setting_30fps_VGA,
>  	ARRAY_SIZE(ov5640_init_setting_30fps_VGA),
>  	OV5640_30_FPS,
> @@ -574,51 +616,61 @@ static const struct ov5640_mode_info ov5640_mode_init_data = {
>  static const struct ov5640_mode_info
>  ov5640_mode_data[OV5640_NUM_MODES] = {
>  	{OV5640_MODE_QQVGA_160_120, SUBSAMPLING,
> +	 OV5640_PIXEL_RATE_48M,

I would have moved this after 02/21 :-) No need to change that though,
the rebase conflict isn't worth it.

>  	 160, 1896, 120, 984,
>  	 ov5640_setting_QQVGA_160_120,
>  	 ARRAY_SIZE(ov5640_setting_QQVGA_160_120),
>  	 OV5640_30_FPS},
>  	{OV5640_MODE_QCIF_176_144, SUBSAMPLING,
> +	 OV5640_PIXEL_RATE_48M,
>  	 176, 1896, 144, 984,
>  	 ov5640_setting_QCIF_176_144,
>  	 ARRAY_SIZE(ov5640_setting_QCIF_176_144),
>  	 OV5640_30_FPS},
>  	{OV5640_MODE_QVGA_320_240, SUBSAMPLING,
> +	 OV5640_PIXEL_RATE_48M,
>  	 320, 1896, 240, 984,
>  	 ov5640_setting_QVGA_320_240,
>  	 ARRAY_SIZE(ov5640_setting_QVGA_320_240),
>  	 OV5640_30_FPS},
>  	{OV5640_MODE_VGA_640_480, SUBSAMPLING,
> +	 OV5640_PIXEL_RATE_48M,
>  	 640, 1896, 480, 1080,
>  	 ov5640_setting_VGA_640_480,
>  	 ARRAY_SIZE(ov5640_setting_VGA_640_480),
>  	 OV5640_60_FPS},
>  	{OV5640_MODE_NTSC_720_480, SUBSAMPLING,
> +	 OV5640_PIXEL_RATE_96M,
>  	 720, 1896, 480, 984,
>  	 ov5640_setting_NTSC_720_480,
>  	 ARRAY_SIZE(ov5640_setting_NTSC_720_480),
>  	OV5640_30_FPS},
>  	{OV5640_MODE_PAL_720_576, SUBSAMPLING,
> +	 OV5640_PIXEL_RATE_96M,
>  	 720, 1896, 576, 984,
>  	 ov5640_setting_PAL_720_576,
>  	 ARRAY_SIZE(ov5640_setting_PAL_720_576),
>  	 OV5640_30_FPS},
>  	{OV5640_MODE_XGA_1024_768, SUBSAMPLING,
> +	 OV5640_PIXEL_RATE_96M,
>  	 1024, 1896, 768, 1080,
>  	 ov5640_setting_XGA_1024_768,
>  	 ARRAY_SIZE(ov5640_setting_XGA_1024_768),
>  	 OV5640_30_FPS},
>  	{OV5640_MODE_720P_1280_720, SUBSAMPLING,
> +	 OV5640_PIXEL_RATE_124M,
>  	 1280, 1892, 720, 740,
>  	 ov5640_setting_720P_1280_720,
>  	 ARRAY_SIZE(ov5640_setting_720P_1280_720),
>  	 OV5640_30_FPS},
>  	{OV5640_MODE_1080P_1920_1080, SCALING,
> +	 OV5640_PIXEL_RATE_148M,
>  	 1920, 2500, 1080, 1120,
>  	 ov5640_setting_1080P_1920_1080,
>  	 ARRAY_SIZE(ov5640_setting_1080P_1920_1080),
>  	 OV5640_30_FPS},
>  	{OV5640_MODE_QSXGA_2592_1944, SCALING,
> +	 OV5640_PIXEL_RATE_168M,
>  	 2592, 2844, 1944, 1968,
>  	 ov5640_setting_QSXGA_2592_1944,
>  	 ARRAY_SIZE(ov5640_setting_QSXGA_2592_1944),
> @@ -2743,6 +2795,7 @@ static const struct v4l2_ctrl_ops ov5640_ctrl_ops = {
>  
>  static int ov5640_init_controls(struct ov5640_dev *sensor)
>  {
> +	const struct ov5640_mode_info *mode = sensor->current_mode;
>  	const struct v4l2_ctrl_ops *ops = &ov5640_ctrl_ops;
>  	struct ov5640_ctrls *ctrls = &sensor->ctrls;
>  	struct v4l2_ctrl_handler *hdl = &ctrls->handler;
> @@ -2755,8 +2808,14 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
>  
>  	/* Clock related controls */
>  	ctrls->pixel_rate = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_PIXEL_RATE,
> -					      0, INT_MAX, 1,
> -					      ov5640_calc_pixel_rate(sensor));
> +				      ov5640_pixel_rates[OV5640_NUM_PIXEL_RATES - 1],
> +				      ov5640_pixel_rates[0], 1,
> +				      ov5640_pixel_rates[mode->pixel_rate]);
> +
> +	ctrls->link_freq = v4l2_ctrl_new_int_menu(hdl, ops,
> +					V4L2_CID_LINK_FREQ,
> +					ARRAY_SIZE(ov5640_csi2_link_freqs) - 1,
> +					4, ov5640_csi2_link_freqs);

I'd add the control in patch 05/21, as it's not very usable until then.

>  
>  	/* Auto/manual white balance */
>  	ctrls->auto_wb = v4l2_ctrl_new_std(hdl, ops,
> @@ -2806,6 +2865,7 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
>  	}
>  
>  	ctrls->pixel_rate->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +	ctrls->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;

While a read-only control isn't optimal, I think the series goes in the
right direction, so I'm OK with it.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	ctrls->gain->flags |= V4L2_CTRL_FLAG_VOLATILE;
>  	ctrls->exposure->flags |= V4L2_CTRL_FLAG_VOLATILE;
>  

-- 
Regards,

Laurent Pinchart
