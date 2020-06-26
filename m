Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2B8020AA20
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 03:18:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727017AbgFZBS5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jun 2020 21:18:57 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:36199 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726908AbgFZBS5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jun 2020 21:18:57 -0400
Received: by mail-qk1-f196.google.com with SMTP id e11so7466302qkm.3;
        Thu, 25 Jun 2020 18:18:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ec8A4N+Jq3oL4Ax3vxG1KXFiOR9fTqC6rq5WpMDA2qE=;
        b=VgE+XXNTUpwGR3eHA2cJtASrBfk3IBDt/EWrYS620+oqIwl0+wEFhVl5eyw9XhFgQF
         i5jaodqYl7v+dDyCeIyqVwLtftgX/SG3y20p41oJcHwZCPJ6fzFnlppde/cTsvX6+76q
         DufqOwfWspRE3OpkMu5z5Na9YfFUhK9pIR3lVNTAA1Lm/IYTQZgDc99OAwQnyyjT66y1
         01Fyonuiaf9H7mMzQRMXHOw6sS/y8s6QQ1MN5K/u+iIMlX3Yp28FZvX1tL9r6qosRJcs
         8EMRtEALV0NUurE/0j2pSf2poAjyJiBq506uH1UJ9Xw/3Vg2v5EGB8zDS59FfObtXKZN
         LedQ==
X-Gm-Message-State: AOAM5322hAmw4zbIeQmDXM+iU+0i/8CaMcRRxG1br9/MYPJX3bfMdG2/
        gu1DMJoLH8l5WJeYNhM8tavR9nO6gBo=
X-Google-Smtp-Source: ABdhPJzKTfdXow0Dzwa5zjg9T/skdudWYK8b1eCv+5uwQG0hE67gNfeAs0k4Am86l+7LShNemEbUCg==
X-Received: by 2002:a37:b701:: with SMTP id h1mr461414qkf.335.1593134335197;
        Thu, 25 Jun 2020 18:18:55 -0700 (PDT)
Received: from [192.168.1.113] ([179.159.57.232])
        by smtp.gmail.com with ESMTPSA id y54sm7763608qtj.28.2020.06.25.18.18.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2020 18:18:54 -0700 (PDT)
Subject: Re: [PATCH v5 3/3] media: vimc: Add a control to display info on test
 image
To:     Kaaira Gupta <kgupta@es.iitr.ac.in>,
        Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        hverkuil@xs4all.nl
References: <20200624134354.7023-1-kgupta@es.iitr.ac.in>
 <20200624134354.7023-4-kgupta@es.iitr.ac.in>
From:   Helen Koike <helen@koikeco.de>
Message-ID: <df178c12-f172-90a8-8041-7a8bb67ebb6f@koikeco.de>
Date:   Thu, 25 Jun 2020 22:18:50 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200624134354.7023-4-kgupta@es.iitr.ac.in>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kaaira,

Thanks for your patch, I tested and it works great, just some other comments below.

On 6/24/20 10:43 AM, Kaaira Gupta wrote:
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

Move this check above the kzalloc(), otherwise there is a memory leak.

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

Vivid calls is "OSD Text Mode", maybe we could do the same.
And rename the id to VIMC_CID_OSD_TEXT_MODE and all the show_info to osd_mode.

Regards,
Helen

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
