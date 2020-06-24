Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D1872074E6
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2020 15:51:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391075AbgFXNvt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jun 2020 09:51:49 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:45301 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2391067AbgFXNvs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jun 2020 09:51:48 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id o5oUjhZcINb6lo5oXjtbkZ; Wed, 24 Jun 2020 15:51:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1593006705; bh=HxQAeRhVoQwn+m5aHodWTIPViMzpa+vjSNJRDVmJFhs=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=aKsabX9qBbNe3TiCqiUL3xe7rXBwAduI27s3LX4vOI+jfyWL4eoIm0EMTc/gFB+no
         fbZKbjM5mSYSfANo5q6yUdBxNqqDM0yyHSn5TPmlbAU0/Mm9Beb11+zKjCku7h9zHP
         CrgWqOySsO2AvO6EZenh487lOREOi3DpDaSKW8gOqQ5kNLjt9w5M+F4JSTbjoamoDI
         7GmdoxZf6i3oUV1JcgNi1r05PVkfxiu3iG0Hc/JyqnJkNb85gKDfMM9O2iv8EXIXzb
         u//gfvIjmUoGtRPEA9orztINOhpYTnxKKI3iql0FNmh4WYguj35uM4mSnw2WZOzaLF
         3gZsytS0uLesg==
Subject: Re: [PATCH v5 3/3] media: vimc: Add a control to display info on test
 image
To:     Kaaira Gupta <kgupta@es.iitr.ac.in>,
        Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <20200624134354.7023-1-kgupta@es.iitr.ac.in>
 <20200624134354.7023-4-kgupta@es.iitr.ac.in>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <f913db5f-7a81-50cf-73cd-ef258a370a17@xs4all.nl>
Date:   Wed, 24 Jun 2020 15:51:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200624134354.7023-4-kgupta@es.iitr.ac.in>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfNG/S+/ZjBe3phDQQHSj1gKqlizK8LbxwU8fz/FWvCtsMZfIuK9xwMfBcuH+6VXKW09ICHI9RJVuAO56IwuTrsZkFv0uwXK9jqWJwnOksgkPVSzoTsD2
 L6En4Fg7mqfFaTxo81uwMm11mQJUuPChYIm1wIZlaIACWPJUt4SO1oZRSMVqNKbtfDe3zL9AG6tzK0Tr6pxGwxf5FwPx2PeB/NVWdzkgW5ujFfeHWuXdd89R
 Ih35+cwNVJePhdK0U8iyB5/yPTazjmmZIKgybhRlpLplhxXfGJVhwFfTD+qC/7GEInb4kHqNo6oCgR5g9rAYSXzUZMOcGyBCbO+LB2e91VvTsAymevAgwEsZ
 2EBgoR/7r6+J/9Inf1IOXsEwI3NYrj4m4TJ1brNXKrmh11BS0p8=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 24/06/2020 15:43, Kaaira Gupta wrote:
> Add a control in VIMC to display information such as the correct order of
> colors for a given test pattern, brightness, hue, saturation, contrast,
> width and height at sensor over test image.
> 
> Signed-off-by: Kaaira Gupta <kgupta@es.iitr.ac.in>
> ---
>  drivers/media/test-drivers/vimc/Kconfig       |  2 +
>  drivers/media/test-drivers/vimc/vimc-common.h |  1 +
>  drivers/media/test-drivers/vimc/vimc-core.c   | 10 ++++
>  drivers/media/test-drivers/vimc/vimc-sensor.c | 57 +++++++++++++++++++
>  4 files changed, 70 insertions(+)
> 
> diff --git a/drivers/media/test-drivers/vimc/Kconfig b/drivers/media/test-drivers/vimc/Kconfig
> index 4068a67585f9..da4b2ad6e40c 100644
> --- a/drivers/media/test-drivers/vimc/Kconfig
> +++ b/drivers/media/test-drivers/vimc/Kconfig
> @@ -2,6 +2,8 @@
>  config VIDEO_VIMC
>  	tristate "Virtual Media Controller Driver (VIMC)"
>  	depends on VIDEO_DEV && VIDEO_V4L2
> +	select FONT_SUPPORT
> +	select FONT_8x16
>  	select MEDIA_CONTROLLER
>  	select VIDEO_V4L2_SUBDEV_API
>  	select VIDEOBUF2_VMALLOC
> diff --git a/drivers/media/test-drivers/vimc/vimc-common.h b/drivers/media/test-drivers/vimc/vimc-common.h
> index ae163dec2459..afda52253402 100644
> --- a/drivers/media/test-drivers/vimc/vimc-common.h
> +++ b/drivers/media/test-drivers/vimc/vimc-common.h
> @@ -20,6 +20,7 @@
>  #define VIMC_CID_VIMC_CLASS		(0x00f00000 | 1)
>  #define VIMC_CID_TEST_PATTERN		(VIMC_CID_VIMC_BASE + 0)
>  #define VIMC_CID_MEAN_WIN_SIZE		(VIMC_CID_VIMC_BASE + 1)
> +#define VIMC_CID_SHOW_INFO		(VIMC_CID_VIMC_BASE + 2)
>  
>  #define VIMC_FRAME_MAX_WIDTH 4096
>  #define VIMC_FRAME_MAX_HEIGHT 2160
> diff --git a/drivers/media/test-drivers/vimc/vimc-core.c b/drivers/media/test-drivers/vimc/vimc-core.c
> index 11210aaa2551..461320ae965c 100644
> --- a/drivers/media/test-drivers/vimc/vimc-core.c
> +++ b/drivers/media/test-drivers/vimc/vimc-core.c
> @@ -5,10 +5,12 @@
>   * Copyright (C) 2015-2017 Helen Koike <helen.fornazier@gmail.com>
>   */
>  
> +#include <linux/font.h>
>  #include <linux/init.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <media/media-device.h>
> +#include <media/tpg/v4l2-tpg.h>
>  #include <media/v4l2-device.h>
>  
>  #include "vimc-common.h"
> @@ -263,6 +265,7 @@ static int vimc_register_devices(struct vimc_device *vimc)
>  
>  static int vimc_probe(struct platform_device *pdev)
>  {
> +	const struct font_desc *font = find_font("VGA8x16");
>  	struct vimc_device *vimc;
>  	int ret;
>  
> @@ -272,6 +275,13 @@ static int vimc_probe(struct platform_device *pdev)
>  	if (!vimc)
>  		return -ENOMEM;
>  
> +	if (!font) {
> +		dev_err(&pdev->dev, "vimc: could not find font\n");
> +		return -ENODEV;
> +	}
> +
> +	tpg_set_font(font->data);
> +
>  	vimc->pipe_cfg = &pipe_cfg;
>  
>  	/* Link the media device within the v4l2_device */
> diff --git a/drivers/media/test-drivers/vimc/vimc-sensor.c b/drivers/media/test-drivers/vimc/vimc-sensor.c
> index a2f09ac9a360..d776fdcdc3bf 100644
> --- a/drivers/media/test-drivers/vimc/vimc-sensor.c
> +++ b/drivers/media/test-drivers/vimc/vimc-sensor.c
> @@ -19,6 +19,8 @@ struct vimc_sen_device {
>  	struct v4l2_subdev sd;
>  	struct tpg_data tpg;
>  	u8 *frame;
> +	unsigned show_info;
> +	unsigned ns;

That name is a bit vague. How about 'start_stream_ts' (ts == timestamp)?

Note also that ktime_get_ns() returns a u64, not an unsigned.

Regards,

	Hans

>  	/* The active format */
>  	struct v4l2_mbus_framefmt mbus_format;
>  	struct v4l2_ctrl_handler hdl;
> @@ -185,10 +187,43 @@ static const struct v4l2_subdev_pad_ops vimc_sen_pad_ops = {
>  static void *vimc_sen_process_frame(struct vimc_ent_device *ved,
>  				    const void *sink_frame)
>  {
> +	u8 *basep[TPG_MAX_PLANES][2];
> +	char str[100];
> +	int line = 1;
>  	struct vimc_sen_device *vsen = container_of(ved, struct vimc_sen_device,
>  						    ved);
>  
>  	tpg_fill_plane_buffer(&vsen->tpg, 0, 0, vsen->frame);
> +	tpg_calc_text_basep(&vsen->tpg, basep, 0, vsen->frame);
> +
> +	if (vsen->show_info <= 1) {
> +		unsigned ms;
> +
> +		ms = (ktime_get_ns() - vsen->ns) / 1000000;
> +		snprintf(str, sizeof(str), "%02d:%02d:%02d:%03d",
> +			 (ms / (60 * 60 * 1000)) % 24,
> +			 (ms / (60 * 1000)) % 60,
> +			 (ms / 1000) % 60,
> +			 ms % 1000);
> +		tpg_gen_text(&vsen->tpg, basep, line++ * 16, 16, str);
> +	}
> +
> +	if (vsen->show_info == 0) {
> +		const char *order = tpg_g_color_order(&vsen->tpg);
> +
> +		tpg_gen_text(&vsen->tpg, basep, line++ * 16, 16, order);
> +		snprintf(str, sizeof(str),
> +			 "brightness %3d, contrast %3d, saturation %3d, hue %d ",
> +			 vsen->tpg.brightness,
> +			 vsen->tpg.contrast,
> +			 vsen->tpg.saturation,
> +			 vsen->tpg.hue);
> +		tpg_gen_text(&vsen->tpg, basep, line++ * 16, 16, str);
> +		snprintf(str, sizeof(str), "sensor size: %dx%d",
> +			 vsen->mbus_format.width, vsen->mbus_format.height);
> +		tpg_gen_text(&vsen->tpg, basep, line++ * 16, 16, str);
> +	}
> +
>  	return vsen->frame;
>  }
>  
> @@ -201,6 +236,8 @@ static int vimc_sen_s_stream(struct v4l2_subdev *sd, int enable)
>  		const struct vimc_pix_map *vpix;
>  		unsigned int frame_size;
>  
> +		vsen->ns = ktime_get_ns();
> +
>  		/* Calculate the frame size */
>  		vpix = vimc_pix_map_by_code(vsen->mbus_format.code);
>  		frame_size = vsen->mbus_format.width * vpix->bpp *
> @@ -269,6 +306,9 @@ static int vimc_sen_s_ctrl(struct v4l2_ctrl *ctrl)
>  	case V4L2_CID_SATURATION:
>  		tpg_s_saturation(&vsen->tpg, ctrl->val);
>  		break;
> +	case VIMC_CID_SHOW_INFO:
> +		vsen->show_info = ctrl->val;
> +		break;
>  	default:
>  		return -EINVAL;
>  	}
> @@ -307,6 +347,22 @@ static const struct v4l2_ctrl_config vimc_sen_ctrl_test_pattern = {
>  	.qmenu = tpg_pattern_strings,
>  };
>  
> +static const char * const vimc_ctrl_show_info_strings[] = {
> +	"All",
> +	"Counters Only",
> +	"None",
> +	NULL,
> +};
> +
> +static const struct v4l2_ctrl_config vimc_sen_ctrl_show_info = {
> +	.ops = &vimc_sen_ctrl_ops,
> +	.id = VIMC_CID_SHOW_INFO,
> +	.name = "Show Information",
> +	.type = V4L2_CTRL_TYPE_MENU,
> +	.max = ARRAY_SIZE(vimc_ctrl_show_info_strings) - 2,
> +	.qmenu = vimc_ctrl_show_info_strings,
> +};
> +
>  static struct vimc_ent_device *vimc_sen_add(struct vimc_device *vimc,
>  					    const char *vcfg_name)
>  {
> @@ -323,6 +379,7 @@ static struct vimc_ent_device *vimc_sen_add(struct vimc_device *vimc,
>  
>  	v4l2_ctrl_new_custom(&vsen->hdl, &vimc_sen_ctrl_class, NULL);
>  	v4l2_ctrl_new_custom(&vsen->hdl, &vimc_sen_ctrl_test_pattern, NULL);
> +	v4l2_ctrl_new_custom(&vsen->hdl, &vimc_sen_ctrl_show_info, NULL);
>  	v4l2_ctrl_new_std(&vsen->hdl, &vimc_sen_ctrl_ops,
>  			  V4L2_CID_VFLIP, 0, 1, 1, 0);
>  	v4l2_ctrl_new_std(&vsen->hdl, &vimc_sen_ctrl_ops,
> 

