Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5032A20B58A
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 18:01:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725997AbgFZQBN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 12:01:13 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:51418 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725807AbgFZQBM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 12:01:12 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id DBD412A5DA0
Subject: Re: [PATCH v7 3/3] media: vimc: Add a control to display info on test
 image
To:     Kaaira Gupta <kgupta@es.iitr.ac.in>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        hverkuil@xs4all.nl
References: <20200626130700.2453-1-kgupta@es.iitr.ac.in>
 <20200626130700.2453-4-kgupta@es.iitr.ac.in>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <1409b37e-f03d-cca8-c4a7-e1454f1da910@collabora.com>
Date:   Fri, 26 Jun 2020 13:01:03 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200626130700.2453-4-kgupta@es.iitr.ac.in>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kaaira,

On 6/26/20 10:07 AM, Kaaira Gupta wrote:
> Add a control in VIMC to display information such as the correct order of
> colors for a given test pattern, brightness, hue, saturation, contrast,
> width and height at sensor over test image.
> 
> Signed-off-by: Kaaira Gupta <kgupta@es.iitr.ac.in>
> ---
>  drivers/media/test-drivers/vimc/Kconfig       |  2 +
>  drivers/media/test-drivers/vimc/vimc-common.h |  1 +
>  drivers/media/test-drivers/vimc/vimc-core.c   | 10 +++
>  drivers/media/test-drivers/vimc/vimc-sensor.c | 70 +++++++++++++++++++
>  4 files changed, 83 insertions(+)
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
> index ae163dec2459..a289434e75ba 100644
> --- a/drivers/media/test-drivers/vimc/vimc-common.h
> +++ b/drivers/media/test-drivers/vimc/vimc-common.h
> @@ -20,6 +20,7 @@
>  #define VIMC_CID_VIMC_CLASS		(0x00f00000 | 1)
>  #define VIMC_CID_TEST_PATTERN		(VIMC_CID_VIMC_BASE + 0)
>  #define VIMC_CID_MEAN_WIN_SIZE		(VIMC_CID_VIMC_BASE + 1)
> +#define VIMC_CID_OSD_TEXT_MODE		(VIMC_CID_VIMC_BASE + 2)
>  
>  #define VIMC_FRAME_MAX_WIDTH 4096
>  #define VIMC_FRAME_MAX_HEIGHT 2160
> diff --git a/drivers/media/test-drivers/vimc/vimc-core.c b/drivers/media/test-drivers/vimc/vimc-core.c
> index 11210aaa2551..4b0ae6f51d76 100644
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
> @@ -263,11 +265,19 @@ static int vimc_register_devices(struct vimc_device *vimc)
>  
>  static int vimc_probe(struct platform_device *pdev)
>  {
> +	const struct font_desc *font = find_font("VGA8x16");
>  	struct vimc_device *vimc;
>  	int ret;
>  
>  	dev_dbg(&pdev->dev, "probe");
>  
> +	if (!font) {
> +		dev_err(&pdev->dev, "could not find font\n");
> +		return -ENODEV;
> +	}
> +
> +	tpg_set_font(font->data);
> +
>  	vimc = kzalloc(sizeof(*vimc), GFP_KERNEL);
>  	if (!vimc)
>  		return -ENOMEM;
> diff --git a/drivers/media/test-drivers/vimc/vimc-sensor.c b/drivers/media/test-drivers/vimc/vimc-sensor.c
> index a2f09ac9a360..9e4fb3f4d60d 100644
> --- a/drivers/media/test-drivers/vimc/vimc-sensor.c
> +++ b/drivers/media/test-drivers/vimc/vimc-sensor.c
> @@ -19,6 +19,8 @@ struct vimc_sen_device {
>  	struct v4l2_subdev sd;
>  	struct tpg_data tpg;
>  	u8 *frame;
> +	unsigned int osd_mode;

If you declare the enum outside the below function, this could be type osd_mode instead of unsigned int, what do you think?

> +	u64 start_stream_ts;
>  	/* The active format */
>  	struct v4l2_mbus_framefmt mbus_format;
>  	struct v4l2_ctrl_handler hdl;
> @@ -187,8 +189,54 @@ static void *vimc_sen_process_frame(struct vimc_ent_device *ved,
>  {
>  	struct vimc_sen_device *vsen = container_of(ved, struct vimc_sen_device,
>  						    ved);
> +	enum osd_mode {OSD_SHOW_ALL = 0, OSD_SHOW_COUNTERS = 1, OSD_SHOW_NONE = 2};
> +	const unsigned int line_height = 16;
> +	u8 *basep[TPG_MAX_PLANES][2];
> +	unsigned int line = 1;
> +	char str[100];
>  
>  	tpg_fill_plane_buffer(&vsen->tpg, 0, 0, vsen->frame);
> +	tpg_calc_text_basep(&vsen->tpg, basep, 0, vsen->frame);
> +	switch (vsen->osd_mode) {
> +	case OSD_SHOW_ALL:
> +		{

Usually we don't use this curly braces in a case statement, please, check other examples in the code,

> +			const char *order = tpg_g_color_order(&vsen->tpg);

You also don't need this level of identation.

> +
> +			tpg_gen_text(&vsen->tpg, basep,
> +				     line++ * line_height, 16, order);
> +			snprintf(str, sizeof(str),
> +				 "brightness %3d, contrast %3d, saturation %3d, hue %d ",
> +				 vsen->tpg.brightness,
> +				 vsen->tpg.contrast,
> +				 vsen->tpg.saturation,
> +				 vsen->tpg.hue);
> +			tpg_gen_text(&vsen->tpg, basep, line++ * line_height,
> +				     16, str);
> +			snprintf(str, sizeof(str), "sensor size: %dx%d",
> +				 vsen->mbus_format.width,
> +				 vsen->mbus_format.height);
> +			tpg_gen_text(&vsen->tpg, basep, line++ * line_height,
> +				     16, str);
> +		}
> +	case OSD_SHOW_COUNTERS:

Checkpatch gives this error:

WARNING: Possible switch case/default not preceded by break or fallthrough comment

You need to add a fallthrough comment (grep for fallthrough to find other examples)

> +		{
> +			unsigned int ms;
> +
> +			ms = (ktime_get_ns() - vsen->start_stream_ts) / 1000000;
> +			snprintf(str, sizeof(str), "%02d:%02d:%02d:%03d",
> +				 (ms / (60 * 60 * 1000)) % 24,
> +				 (ms / (60 * 1000)) % 60,
> +				 (ms / 1000) % 60,
> +				 ms % 1000);
> +			tpg_gen_text(&vsen->tpg, basep, line++ * line_height,
> +				     16, str);
> +			break;
> +		}
> +	case OSD_SHOW_NONE:

No need this case statement if you have the default below.

Regards,
Helen

> +	default:
> +		break;
> +	}
> +
>  	return vsen->frame;
>  }
>  
> @@ -201,6 +249,8 @@ static int vimc_sen_s_stream(struct v4l2_subdev *sd, int enable)
>  		const struct vimc_pix_map *vpix;
>  		unsigned int frame_size;
>  
> +		vsen->start_stream_ts = ktime_get_ns();
> +
>  		/* Calculate the frame size */
>  		vpix = vimc_pix_map_by_code(vsen->mbus_format.code);
>  		frame_size = vsen->mbus_format.width * vpix->bpp *
> @@ -269,6 +319,9 @@ static int vimc_sen_s_ctrl(struct v4l2_ctrl *ctrl)
>  	case V4L2_CID_SATURATION:
>  		tpg_s_saturation(&vsen->tpg, ctrl->val);
>  		break;
> +	case VIMC_CID_OSD_TEXT_MODE:
> +		vsen->osd_mode = ctrl->val;
> +		break;
>  	default:
>  		return -EINVAL;
>  	}
> @@ -307,6 +360,22 @@ static const struct v4l2_ctrl_config vimc_sen_ctrl_test_pattern = {
>  	.qmenu = tpg_pattern_strings,
>  };
>  
> +static const char * const vimc_ctrl_osd_mode_strings[] = {
> +	"All",
> +	"Counters Only",
> +	"None",
> +	NULL,
> +};
> +
> +static const struct v4l2_ctrl_config vimc_sen_ctrl_osd_mode = {
> +	.ops = &vimc_sen_ctrl_ops,
> +	.id = VIMC_CID_OSD_TEXT_MODE,
> +	.name = "Show Information",
> +	.type = V4L2_CTRL_TYPE_MENU,
> +	.max = ARRAY_SIZE(vimc_ctrl_osd_mode_strings) - 2,
> +	.qmenu = vimc_ctrl_osd_mode_strings,
> +};
> +
>  static struct vimc_ent_device *vimc_sen_add(struct vimc_device *vimc,
>  					    const char *vcfg_name)
>  {
> @@ -323,6 +392,7 @@ static struct vimc_ent_device *vimc_sen_add(struct vimc_device *vimc,
>  
>  	v4l2_ctrl_new_custom(&vsen->hdl, &vimc_sen_ctrl_class, NULL);
>  	v4l2_ctrl_new_custom(&vsen->hdl, &vimc_sen_ctrl_test_pattern, NULL);
> +	v4l2_ctrl_new_custom(&vsen->hdl, &vimc_sen_ctrl_osd_mode, NULL);
>  	v4l2_ctrl_new_std(&vsen->hdl, &vimc_sen_ctrl_ops,
>  			  V4L2_CID_VFLIP, 0, 1, 1, 0);
>  	v4l2_ctrl_new_std(&vsen->hdl, &vimc_sen_ctrl_ops,
> 
