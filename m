Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D53AF4A64A3
	for <lists+linux-media@lfdr.de>; Tue,  1 Feb 2022 20:08:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239766AbiBATID (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Feb 2022 14:08:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242445AbiBATIB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Feb 2022 14:08:01 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EDDAC061714
        for <linux-media@vger.kernel.org>; Tue,  1 Feb 2022 11:08:01 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9A8F0332;
        Tue,  1 Feb 2022 20:07:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1643742478;
        bh=R6n2i+WvSg3njRjBcQi0Qjz3LimrCrhR9oU0lEIWQto=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bOVVC8EZKeuf/V0QXSRVWzF8FMVCYNRNFw9awnzFUa4Y+Ixp9kp6l1mnz355Pdpg2
         qA4VdXQixmmRyNTo0yxhVgwHr3xhQd1+wcFLuyObYxMWqYQ8dF+KjEcj3ja0p2CInn
         4sKreMkYCzdgUiftOt02w7szDqK2i0lUvZaJU6+o=
Date:   Tue, 1 Feb 2022 21:07:35 +0200
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
Subject: Re: [PATCH 09/21] media: ov5640: Remove ov5640_mode_init_data
Message-ID: <YfmE9347BH1aWpUH@pendragon.ideasonboard.com>
References: <20220131143245.128089-1-jacopo@jmondi.org>
 <20220131143245.128089-10-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220131143245.128089-10-jacopo@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Mon, Jan 31, 2022 at 03:32:33PM +0100, Jacopo Mondi wrote:
> The ov5640_mode_init_data is a fictional sensor more which is used to
> program the initial sensor settings.
> 
> It is only used to initialize the sensor and can be replaced
> it with a throw-away mode which just wraps the register table.
> 
> Also rename the register table to drop the format from the name to make
> it clear an actual sensor mode has to be applied after the initial
> programming.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/i2c/ov5640.c | 32 +++++---------------------------
>  1 file changed, 5 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index d966cca78e92..1e2f37c93f0d 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -348,7 +348,7 @@ static inline bool ov5640_is_mipi(struct ov5640_dev *sensor)
>   * over i2c.
>   */
>  /* YUV422 UYVY VGA@30fps */
> -static const struct reg_value ov5640_init_setting_30fps_VGA[] = {
> +static const struct reg_value ov5640_init_setting[] = {
>  	{0x3103, 0x11, 0, 0}, {0x3008, 0x82, 0, 5}, {0x3008, 0x42, 0, 0},
>  	{0x3103, 0x03, 0, 0}, {0x3630, 0x36, 0, 0},
>  	{0x3631, 0x0e, 0, 0}, {0x3632, 0xe2, 0, 0}, {0x3633, 0x12, 0, 0},
> @@ -586,30 +586,6 @@ static const struct reg_value ov5640_setting_QSXGA_2592_1944[] = {
>  	{0x3824, 0x02, 0, 0}, {0x5001, 0x83, 0, 70},
>  };
>  
> -/* power-on sensor init reg table */
> -static const struct ov5640_mode_info ov5640_mode_init_data = {
> -		.id		= 0,
> -		.dn_mode	= SUBSAMPLING,
> -		.pixel_rate	= OV5640_PIXEL_RATE_96M,
> -		.analog_crop = {
> -			.left	= 0,
> -			.top	= 4,
> -			.width	= 2623,
> -			.height	= 1947,
> -		},
> -		.crop = {
> -			.left	= 16,
> -			.top	= 6,
> -			.width	= 640,
> -			.height	= 480,
> -		},
> -		.ppl		= 1896,
> -		.vblank_def	= 504,
> -		.reg_data	= ov5640_init_setting_30fps_VGA,
> -		.reg_data_size	= ARRAY_SIZE(ov5640_init_setting_30fps_VGA),
> -		.max_fps	= OV5640_30_FPS
> -};
> -
>  static const struct ov5640_mode_info
>  ov5640_mode_data[OV5640_NUM_MODES] = {
>  	{
> @@ -2117,13 +2093,15 @@ static int ov5640_set_framefmt(struct ov5640_dev *sensor,
>  /* restore the last set video mode after chip power-on */
>  static int ov5640_restore_mode(struct ov5640_dev *sensor)
>  {
> +	struct ov5640_mode_info init_data = {};
>  	int ret;
>  
>  	/* first load the initial register values */
> -	ret = ov5640_load_regs(sensor, &ov5640_mode_init_data);
> +	init_data.reg_data = ov5640_init_setting;
> +	init_data.reg_data_size = ARRAY_SIZE(ov5640_init_setting);
> +	ret = ov5640_load_regs(sensor, &init_data);

Could we change ov5640_load_regs() to take a reg_value array and size as
parameters, to avoid the local init_data variable ?

>  	if (ret < 0)
>  		return ret;
> -	sensor->last_mode = &ov5640_mode_init_data;
>  
>  	ret = ov5640_mod_reg(sensor, OV5640_REG_SYS_ROOT_DIVIDER, 0x3f,
>  			     (ilog2(OV5640_SCLK2X_ROOT_DIV) << 2) |

-- 
Regards,

Laurent Pinchart
