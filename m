Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D99E34A5E25
	for <lists+linux-media@lfdr.de>; Tue,  1 Feb 2022 15:20:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239203AbiBAOUd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Feb 2022 09:20:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239200AbiBAOUc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Feb 2022 09:20:32 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 276B5C061714
        for <linux-media@vger.kernel.org>; Tue,  1 Feb 2022 06:20:32 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0A1E6332;
        Tue,  1 Feb 2022 15:20:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1643725229;
        bh=sVMqaR9L2FwCTAVKES7ReI8eHmlsmsr1s4x3qwudn3A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=d8TVpP6bCLRwTrk/xBu5yAeSh0+I0apmiOGZVK1L/iF5mTNnsbqD0KgGWg/INm4ar
         mwL7iI7KcMCsHgI8f/4wpOGiAbzr+kaotCdwd7Kk6TbHQXtA+sXt8XGUDKD+TBPxE8
         Iy87Gss8tFdXD5SnlQgEHlgbzai5ywnqqcbQXWrY=
Date:   Tue, 1 Feb 2022 16:20:06 +0200
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
Subject: Re: [PATCH 02/21] media: ov5604: Re-arrange modes definition
Message-ID: <YflBlm7aeslZW4es@pendragon.ideasonboard.com>
References: <20220131143245.128089-1-jacopo@jmondi.org>
 <20220131143245.128089-3-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220131143245.128089-3-jacopo@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Mon, Jan 31, 2022 at 03:32:26PM +0100, Jacopo Mondi wrote:
> The array of supported modes is close to unreadable.
> Re-arrange it giving it some room to breath.
> 
> Cosmetic change only.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/i2c/ov5640.c | 141 +++++++++++++++++++++----------------
>  1 file changed, 81 insertions(+), 60 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index d915c9652302..7e7732f30486 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -615,66 +615,87 @@ static const struct ov5640_mode_info ov5640_mode_init_data = {
>  
>  static const struct ov5640_mode_info
>  ov5640_mode_data[OV5640_NUM_MODES] = {
> -	{OV5640_MODE_QQVGA_160_120, SUBSAMPLING,
> -	 OV5640_PIXEL_RATE_48M,
> -	 160, 1896, 120, 984,
> -	 ov5640_setting_QQVGA_160_120,
> -	 ARRAY_SIZE(ov5640_setting_QQVGA_160_120),
> -	 OV5640_30_FPS},
> -	{OV5640_MODE_QCIF_176_144, SUBSAMPLING,
> -	 OV5640_PIXEL_RATE_48M,
> -	 176, 1896, 144, 984,
> -	 ov5640_setting_QCIF_176_144,
> -	 ARRAY_SIZE(ov5640_setting_QCIF_176_144),
> -	 OV5640_30_FPS},
> -	{OV5640_MODE_QVGA_320_240, SUBSAMPLING,
> -	 OV5640_PIXEL_RATE_48M,
> -	 320, 1896, 240, 984,
> -	 ov5640_setting_QVGA_320_240,
> -	 ARRAY_SIZE(ov5640_setting_QVGA_320_240),
> -	 OV5640_30_FPS},
> -	{OV5640_MODE_VGA_640_480, SUBSAMPLING,
> -	 OV5640_PIXEL_RATE_48M,
> -	 640, 1896, 480, 1080,
> -	 ov5640_setting_VGA_640_480,
> -	 ARRAY_SIZE(ov5640_setting_VGA_640_480),
> -	 OV5640_60_FPS},
> -	{OV5640_MODE_NTSC_720_480, SUBSAMPLING,
> -	 OV5640_PIXEL_RATE_96M,
> -	 720, 1896, 480, 984,
> -	 ov5640_setting_NTSC_720_480,
> -	 ARRAY_SIZE(ov5640_setting_NTSC_720_480),
> -	OV5640_30_FPS},
> -	{OV5640_MODE_PAL_720_576, SUBSAMPLING,
> -	 OV5640_PIXEL_RATE_96M,
> -	 720, 1896, 576, 984,
> -	 ov5640_setting_PAL_720_576,
> -	 ARRAY_SIZE(ov5640_setting_PAL_720_576),
> -	 OV5640_30_FPS},
> -	{OV5640_MODE_XGA_1024_768, SUBSAMPLING,
> -	 OV5640_PIXEL_RATE_96M,
> -	 1024, 1896, 768, 1080,
> -	 ov5640_setting_XGA_1024_768,
> -	 ARRAY_SIZE(ov5640_setting_XGA_1024_768),
> -	 OV5640_30_FPS},
> -	{OV5640_MODE_720P_1280_720, SUBSAMPLING,
> -	 OV5640_PIXEL_RATE_124M,
> -	 1280, 1892, 720, 740,
> -	 ov5640_setting_720P_1280_720,
> -	 ARRAY_SIZE(ov5640_setting_720P_1280_720),
> -	 OV5640_30_FPS},
> -	{OV5640_MODE_1080P_1920_1080, SCALING,
> -	 OV5640_PIXEL_RATE_148M,
> -	 1920, 2500, 1080, 1120,
> -	 ov5640_setting_1080P_1920_1080,
> -	 ARRAY_SIZE(ov5640_setting_1080P_1920_1080),
> -	 OV5640_30_FPS},
> -	{OV5640_MODE_QSXGA_2592_1944, SCALING,
> -	 OV5640_PIXEL_RATE_168M,
> -	 2592, 2844, 1944, 1968,
> -	 ov5640_setting_QSXGA_2592_1944,
> -	 ARRAY_SIZE(ov5640_setting_QSXGA_2592_1944),
> -	 OV5640_15_FPS},
> +	{
> +		/* 160x120 */
> +		OV5640_MODE_QQVGA_160_120, SUBSAMPLING,
> +		OV5640_PIXEL_RATE_48M,
> +		160, 1896, 120, 984,
> +		ov5640_setting_QQVGA_160_120,
> +		ARRAY_SIZE(ov5640_setting_QQVGA_160_120),
> +		OV5640_30_FPS

You can add a comma at the end here while at it.

That's definitely more readable. Should we go one step further?

		.id = OV5640_MODE_QQVGA_160_120,
		.dn_mode = SUBSAMPLING,
		.pixel_rate = OV5640_PIXEL_RATE_48M,
		.hact = 160,
		.htot = 1896,
		.vact = 120,
		.vtot = 984,
		.reg_data = ov5640_setting_QQVGA_160_120,
		.reg_data_szize = ARRAY_SIZE(ov5640_setting_QQVGA_160_120),
		.max_fps = OV5640_30_FPS,

Up to you.

I trust that you've automated this change and that if the first entry is
correct, all the other ones are as well :-)

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +	}, {
> +		/* 176x144 */
> +		OV5640_MODE_QCIF_176_144, SUBSAMPLING,
> +		OV5640_PIXEL_RATE_48M,
> +		176, 1896, 144, 984,
> +		ov5640_setting_QCIF_176_144,
> +		ARRAY_SIZE(ov5640_setting_QCIF_176_144),
> +		OV5640_30_FPS
> +	}, {
> +		/* 320x240 */
> +		OV5640_MODE_QVGA_320_240, SUBSAMPLING,
> +		OV5640_PIXEL_RATE_48M,
> +		320, 1896, 240, 984,
> +		ov5640_setting_QVGA_320_240,
> +		ARRAY_SIZE(ov5640_setting_QVGA_320_240),
> +		OV5640_30_FPS
> +	}, {
> +		/* 640x480 */
> +		OV5640_MODE_VGA_640_480, SUBSAMPLING,
> +		OV5640_PIXEL_RATE_48M,
> +		640, 1896, 480, 1080,
> +		ov5640_setting_VGA_640_480,
> +		ARRAY_SIZE(ov5640_setting_VGA_640_480),
> +		OV5640_60_FPS
> +	}, {
> +		/* 720x480 */
> +		OV5640_MODE_NTSC_720_480, SUBSAMPLING,
> +		OV5640_PIXEL_RATE_96M,
> +		720, 1896, 480, 984,
> +		ov5640_setting_NTSC_720_480,
> +		ARRAY_SIZE(ov5640_setting_NTSC_720_480),
> +		OV5640_30_FPS
> +	}, {
> +		/* 720x576 */
> +		OV5640_MODE_PAL_720_576, SUBSAMPLING,
> +		OV5640_PIXEL_RATE_96M,
> +		720, 1896, 576, 984,
> +		ov5640_setting_PAL_720_576,
> +		ARRAY_SIZE(ov5640_setting_PAL_720_576),
> +		OV5640_30_FPS
> +	}, {
> +		/* 1024x768 */
> +		OV5640_MODE_XGA_1024_768, SUBSAMPLING,
> +		OV5640_PIXEL_RATE_96M,
> +		1024, 1896, 768, 1080,
> +		ov5640_setting_XGA_1024_768,
> +		ARRAY_SIZE(ov5640_setting_XGA_1024_768),
> +		OV5640_30_FPS
> +	}, {
> +		/* 1280x720 */
> +		OV5640_MODE_720P_1280_720, SUBSAMPLING,
> +		OV5640_PIXEL_RATE_124M,
> +		1280, 1892, 720, 740,
> +		ov5640_setting_720P_1280_720,
> +		ARRAY_SIZE(ov5640_setting_720P_1280_720),
> +		OV5640_30_FPS
> +	}, {
> +		/* 1920x1080 */
> +		OV5640_MODE_1080P_1920_1080, SCALING,
> +		OV5640_PIXEL_RATE_148M,
> +		1920, 2500, 1080, 1120,
> +		ov5640_setting_1080P_1920_1080,
> +		ARRAY_SIZE(ov5640_setting_1080P_1920_1080),
> +		OV5640_30_FPS
> +	}, {
> +		/* 2592x1944 */
> +		OV5640_MODE_QSXGA_2592_1944, SCALING,
> +		OV5640_PIXEL_RATE_168M,
> +		2592, 2844, 1944, 1968,
> +		ov5640_setting_QSXGA_2592_1944,
> +		ARRAY_SIZE(ov5640_setting_QSXGA_2592_1944),
> +		OV5640_15_FPS
> +	},
>  };
>  
>  static int ov5640_init_slave_id(struct ov5640_dev *sensor)

-- 
Regards,

Laurent Pinchart
