Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61FC3CCC09
	for <lists+linux-media@lfdr.de>; Sat,  5 Oct 2019 20:31:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387990AbfJESbV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 5 Oct 2019 14:31:21 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:40077 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387486AbfJESbU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 5 Oct 2019 14:31:20 -0400
Received: by mail-qk1-f196.google.com with SMTP id y144so8935660qkb.7;
        Sat, 05 Oct 2019 11:31:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=UqlZc/J7WTaej7Rap29JknxjoHIS0JTCIJZsHjEmgus=;
        b=hlIzv+CI6hZUuNBJOf6E9rkacHbu8trpA3Ti/bN6Mb9yCAKdvIkvQrWQHLYkmzTTTd
         bNDU9zmsY86uM/gVFRJx5sp0jxF8kF3qNUCN49Abqs4VKKXAmJKKJUjFE+57Vuqd8j91
         EziwXoUCCqVWKrojrGcIBg8LYBVkk75Gf3MJCJUPC7gvJw1Yw0bw2beAvEwAGyBKYU9N
         EdXt51uKuBNxb5K3kDMoOrWnVX/NlDu/QcTpYkS7fduXWLDJPTFVy10dScY+xLhjFXU6
         ak+PxfIkhtEOdeo1jI5ZqEydlkS3yy4pyzO+pzXLIuhl4hVpd4+BVDdDiu6/7WB5jGfr
         6/Aw==
X-Gm-Message-State: APjAAAXlV+VMl9pKW4nSgY4j1wJ+UkBxP8NCv4ujci9oHFKqMpug2LpE
        D/V7ekCdJsosw/iomrDnxq8Xxh6ZLx8=
X-Google-Smtp-Source: APXvYqzK9ZI0qsjOv3BlgYAE2QPGySjScJV7JsNrlFAtSTRg+LUSG39oSEQ3hnCoPLOuaTKwzAVGug==
X-Received: by 2002:ae9:e210:: with SMTP id c16mr8167608qkc.164.1570300278848;
        Sat, 05 Oct 2019 11:31:18 -0700 (PDT)
Received: from [172.16.0.213] ([177.103.155.130])
        by smtp.gmail.com with ESMTPSA id p199sm4944522qke.18.2019.10.05.11.31.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Oct 2019 11:31:18 -0700 (PDT)
Subject: Re: [Lkcamp] [PATCH v4] media: vimc: Implement debayer control for
 mean window size
To:     Arthur Moraes do Lago <arthurmoraeslago@gmail.com>,
        lkcamp@lists.libreplanetbr.org, mchehab@kernel.org,
        skhan@linuxfoundation.org, hverkuil-cisco@xs4all.nl,
        andrealmeid@collabora.com, laispc19@gmail.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191002004633.21490-1-arthurmoraeslago@gmail.com>
From:   Helen Koike <helen@koikeco.de>
Openpgp: preference=signencrypt
Autocrypt: addr=helen@koikeco.de; keydata=
 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
Message-ID: <e0376186-1083-7f6e-0d57-748fab8a6182@koikeco.de>
Date:   Sat, 5 Oct 2019 15:31:14 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20191002004633.21490-1-arthurmoraeslago@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 10/1/19 9:46 PM, Arthur Moraes do Lago wrote:
> Add mean window size parameter for debayer filter as a control in
> vimc-debayer.
> 
> vimc-debayer was patched to allow changing mean window parameter
> of the filter without needing to reload the driver. The parameter
> can now be set using a v4l2-ctl control(mean_window_size).
> 
> Co-developed-by: Laís Pessine do Carmo <laispc19@gmail.com>
> Signed-off-by: Laís Pessine do Carmo <laispc19@gmail.com>
> Signed-off-by: Arthur Moraes do Lago <arthurmoraeslago@gmail.com>

Now the right one.
lgtm

Acked-by: Helen Koike <helen.koike@collabora.com>

> ---
> Changes in V2:
>  - Updated documentation
>  - Added v4l2_subev_core_ops to solve errors in v4l2-ctl compliance test
>  - Changed control naming to follow English capitalization rules
>  - Rebased to Shuah Khan's newest patch series 171283
>     ("Collapse vimc single monolithic driver")
>  - Change maximum value for mean window size
> Changes in V3:
>  - Renamed debayer control
>  - Fixed typo in documentation
>  - Freed control handler in vimc_deb_release
> Changes in V4:
>  - Removed unecessary function and checking for setting the control
> 
> We had originally intended to leave that bit of code checking if the
> value is being set to make it similar to what's done in vimc-sensor,
> and in case some extra caution is needed when chaging control in the
> future. But I guess they really were not necessary.
> 
> Thanks!
> 
> ---
>  Documentation/media/v4l-drivers/vimc.rst   | 10 +--
>  drivers/media/platform/vimc/vimc-common.h  |  1 +
>  drivers/media/platform/vimc/vimc-debayer.c | 81 ++++++++++++++++++----
>  3 files changed, 71 insertions(+), 21 deletions(-)
> 
> diff --git a/Documentation/media/v4l-drivers/vimc.rst b/Documentation/media/v4l-drivers/vimc.rst
> index a582af0509ee..28646c76dad5 100644
> --- a/Documentation/media/v4l-drivers/vimc.rst
> +++ b/Documentation/media/v4l-drivers/vimc.rst
> @@ -80,9 +80,7 @@ vimc-capture:
>          Module options
>  ---------------
>  
> -Vimc has a few module parameters to configure the driver.
> -
> -        param=value
> +Vimc has a module parameter to configure the driver.
>  
>  * ``sca_mult=<unsigned int>``
>  
> @@ -91,12 +89,6 @@ Vimc has a few module parameters to configure the driver.
>          original one. Currently, only supports scaling up (the default value
>          is 3).
>  
> -* ``deb_mean_win_size=<unsigned int>``
> -
> -        Window size to calculate the mean. Note: the window size needs to be an
> -        odd number, as the main pixel stays in the center of the window,
> -        otherwise the next odd number is considered (the default value is 3).
> -
>  Source code documentation
>  -------------------------
>  
> diff --git a/drivers/media/platform/vimc/vimc-common.h b/drivers/media/platform/vimc/vimc-common.h
> index 236412ad7548..3a5102ddf794 100644
> --- a/drivers/media/platform/vimc/vimc-common.h
> +++ b/drivers/media/platform/vimc/vimc-common.h
> @@ -19,6 +19,7 @@
>  #define VIMC_CID_VIMC_BASE		(0x00f00000 | 0xf000)
>  #define VIMC_CID_VIMC_CLASS		(0x00f00000 | 1)
>  #define VIMC_CID_TEST_PATTERN		(VIMC_CID_VIMC_BASE + 0)
> +#define VIMC_CID_MEAN_WIN_SIZE		(VIMC_CID_VIMC_BASE + 1)
>  
>  #define VIMC_FRAME_MAX_WIDTH 4096
>  #define VIMC_FRAME_MAX_HEIGHT 2160
> diff --git a/drivers/media/platform/vimc/vimc-debayer.c b/drivers/media/platform/vimc/vimc-debayer.c
> index 37f3767db469..ba0af4b2fb9b 100644
> --- a/drivers/media/platform/vimc/vimc-debayer.c
> +++ b/drivers/media/platform/vimc/vimc-debayer.c
> @@ -11,17 +11,12 @@
>  #include <linux/platform_device.h>
>  #include <linux/vmalloc.h>
>  #include <linux/v4l2-mediabus.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-event.h>
>  #include <media/v4l2-subdev.h>
>  
>  #include "vimc-common.h"
>  
> -static unsigned int deb_mean_win_size = 3;
> -module_param(deb_mean_win_size, uint, 0000);
> -MODULE_PARM_DESC(deb_mean_win_size, " the window size to calculate the mean.\n"
> -	"NOTE: the window size needs to be an odd number, as the main pixel "
> -	"stays in the center of the window, otherwise the next odd number "
> -	"is considered");
> -
>  enum vimc_deb_rgb_colors {
>  	VIMC_DEB_RED = 0,
>  	VIMC_DEB_GREEN = 1,
> @@ -46,6 +41,8 @@ struct vimc_deb_device {
>  	u8 *src_frame;
>  	const struct vimc_deb_pix_map *sink_pix_map;
>  	unsigned int sink_bpp;
> +	unsigned int mean_win_size;
> +	struct v4l2_ctrl_handler hdl;
>  };
>  
>  static const struct v4l2_mbus_framefmt sink_fmt_default = {
> @@ -346,11 +343,18 @@ static int vimc_deb_s_stream(struct v4l2_subdev *sd, int enable)
>  	return 0;
>  }
>  
> +static const struct v4l2_subdev_core_ops vimc_deb_core_ops = {
> +	.log_status = v4l2_ctrl_subdev_log_status,
> +	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
> +	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
> +};
> +
>  static const struct v4l2_subdev_video_ops vimc_deb_video_ops = {
>  	.s_stream = vimc_deb_s_stream,
>  };
>  
>  static const struct v4l2_subdev_ops vimc_deb_ops = {
> +	.core = &vimc_deb_core_ops,
>  	.pad = &vimc_deb_pad_ops,
>  	.video = &vimc_deb_video_ops,
>  };
> @@ -384,7 +388,7 @@ static void vimc_deb_calc_rgb_sink(struct vimc_deb_device *vdeb,
>  	 * the top left corner of the mean window (considering the current
>  	 * pixel as the center)
>  	 */
> -	seek = deb_mean_win_size / 2;
> +	seek = vdeb->mean_win_size / 2;
>  
>  	/* Sum the values of the colors in the mean window */
>  
> @@ -471,14 +475,33 @@ static void *vimc_deb_process_frame(struct vimc_ent_device *ved,
>  		}
>  
>  	return vdeb->src_frame;
> +}
> +
> +static int vimc_deb_s_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct vimc_deb_device *vdeb =
> +		container_of(ctrl->handler, struct vimc_deb_device, hdl);
>  
> +	switch (ctrl->id) {
> +	case VIMC_CID_MEAN_WIN_SIZE:
> +		vdeb->mean_win_size = ctrl->val;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +	return 0;
>  }
>  
> +static const struct v4l2_ctrl_ops vimc_deb_ctrl_ops = {
> +	.s_ctrl = vimc_deb_s_ctrl,
> +};
> +
>  static void vimc_deb_release(struct v4l2_subdev *sd)
>  {
>  	struct vimc_deb_device *vdeb =
>  				container_of(sd, struct vimc_deb_device, sd);
>  
> +	v4l2_ctrl_handler_free(&vdeb->hdl);
>  	vimc_pads_cleanup(vdeb->ved.pads);
>  	kfree(vdeb);
>  }
> @@ -495,6 +518,24 @@ void vimc_deb_rm(struct vimc_device *vimc, struct vimc_ent_device *ved)
>  	vimc_ent_sd_unregister(ved, &vdeb->sd);
>  }
>  
> +static const struct v4l2_ctrl_config vimc_deb_ctrl_class = {
> +	.flags = V4L2_CTRL_FLAG_READ_ONLY | V4L2_CTRL_FLAG_WRITE_ONLY,
> +	.id = VIMC_CID_VIMC_CLASS,
> +	.name = "VIMC Controls",
> +	.type = V4L2_CTRL_TYPE_CTRL_CLASS,
> +};
> +
> +static const struct v4l2_ctrl_config vimc_deb_ctrl_mean_win_size = {
> +	.ops = &vimc_deb_ctrl_ops,
> +	.id = VIMC_CID_MEAN_WIN_SIZE,
> +	.name = "Debayer Mean Window Size",
> +	.type = V4L2_CTRL_TYPE_INTEGER,
> +	.min = 1,
> +	.max = 25,
> +	.step = 2,
> +	.def = 3,
> +};
> +
>  struct vimc_ent_device *vimc_deb_add(struct vimc_device *vimc,
>  				     const char *vcfg_name)
>  {
> @@ -507,6 +548,16 @@ struct vimc_ent_device *vimc_deb_add(struct vimc_device *vimc,
>  	if (!vdeb)
>  		return NULL;
>  
> +	/* Create controls: */
> +	v4l2_ctrl_handler_init(&vdeb->hdl, 2);
> +	v4l2_ctrl_new_custom(&vdeb->hdl, &vimc_deb_ctrl_class, NULL);
> +	v4l2_ctrl_new_custom(&vdeb->hdl, &vimc_deb_ctrl_mean_win_size, NULL);
> +	vdeb->sd.ctrl_handler = &vdeb->hdl;
> +	if (vdeb->hdl.error) {
> +		ret = vdeb->hdl.error;
> +		goto err_free_vdeb;
> +	}
> +
>  	/* Initialize ved and sd */
>  	ret = vimc_ent_sd_register(&vdeb->ved, &vdeb->sd, v4l2_dev,
>  				   vcfg_name,
> @@ -514,13 +565,12 @@ struct vimc_ent_device *vimc_deb_add(struct vimc_device *vimc,
>  				   (const unsigned long[2]) {MEDIA_PAD_FL_SINK,
>  				   MEDIA_PAD_FL_SOURCE},
>  				   &vimc_deb_int_ops, &vimc_deb_ops);
> -	if (ret) {
> -		kfree(vdeb);
> -		return NULL;
> -	}
> +	if (ret)
> +		goto err_free_hdl;
>  
>  	vdeb->ved.process_frame = vimc_deb_process_frame;
>  	vdeb->dev = &vimc->pdev.dev;
> +	vdeb->mean_win_size = vimc_deb_ctrl_mean_win_size.def;
>  
>  	/* Initialize the frame format */
>  	vdeb->sink_fmt = sink_fmt_default;
> @@ -534,4 +584,11 @@ struct vimc_ent_device *vimc_deb_add(struct vimc_device *vimc,
>  	vdeb->set_rgb_src = vimc_deb_set_rgb_mbus_fmt_rgb888_1x24;
>  
>  	return &vdeb->ved;
> +
> +err_free_hdl:
> +	v4l2_ctrl_handler_free(&vdeb->hdl);
> +err_free_vdeb:
> +	kfree(vdeb);
> +
> +	return NULL;
>  }
> 
