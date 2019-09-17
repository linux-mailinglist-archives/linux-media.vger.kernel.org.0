Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82738B5871
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2019 01:12:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728532AbfIQXMf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Sep 2019 19:12:35 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:37006 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727966AbfIQXMf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Sep 2019 19:12:35 -0400
Received: by mail-io1-f65.google.com with SMTP id b19so11738060iob.4
        for <linux-media@vger.kernel.org>; Tue, 17 Sep 2019 16:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=yqGgBojIZyVHVy1krOvbhQKaEfiFOGw5rhz3fKPGEaA=;
        b=OZZgJfUSr3+vfbhngvDVpU753l8In96gprFSlB6dqNTivYS/439DQlnVa8qjZ+Ls64
         HaBo2fzH2lrKAuL0eAXDHknFX2TINolbzYVKxbuXzjXUxbCnANK4pE/YIDh19IK4/M7M
         EkC76eTtz1HkpbZjCTlpR4Bsnts6f0gVrvIzg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yqGgBojIZyVHVy1krOvbhQKaEfiFOGw5rhz3fKPGEaA=;
        b=hYZJOj88jDFdDw73+SP6VIO0UXro8JqEB9xLAs93BZtjrh/x9gCb0/04UkuaNruTKs
         Yv3KYtnKpo1rBmp8pfS0o1TXrKtVQWs0kR4Kvf33SoyNCVn+m9hi10QSpZgVX2e43ZOU
         M0S15BMXkTP6LhbmlW848hN0Xm32x6Zc9TY4MrTG+j5ZEEafaT7Loq8LbnPr87hldqct
         ahaMRSe55gbv5a/8FsNa9qOw0aReYZt3WxpV1/E9fZqQ97gQ6fiimz6CKKQbCEGFk4Vy
         DVrjhZWx2cnVN8eJV8Xn8fsVtJNdWWYOsGHFNDAAVNx1Pc23ZghJZ853LH+oioctEW5j
         61QQ==
X-Gm-Message-State: APjAAAWLZVMrSzNafg+2H3xCLIvURhomKoWCU5Ed051mUGjyrYZjG+C/
        ftZ2MBqdb5bRaIu2ELmyRAD5AQ==
X-Google-Smtp-Source: APXvYqwZqc4YmgGMXhuTArUpNJFTe5Nh6XUSxRt8U66ZmSINMRpYohUQ2oaktvY64awyt0Pbi1Tgmg==
X-Received: by 2002:a6b:d208:: with SMTP id q8mr1694483iob.47.1568761953963;
        Tue, 17 Sep 2019 16:12:33 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id m67sm3241954iof.21.2019.09.17.16.12.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Sep 2019 16:12:33 -0700 (PDT)
Subject: Re: [PATCH v2] media: vimc: Implement debayer control for mean window
 size
To:     Arthur Moraes do Lago <arthurmoraeslago@gmail.com>,
        mchehab@kernel.org, helen.koike@collabora.com,
        hverkuil-cisco@xs4all.nl, andrealmeid@collabora.com,
        laispc19@gmail.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20190917225317.5872-1-arthurmoraeslago@gmail.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <39078cb4-1ea5-e97e-0323-0318b42910c6@linuxfoundation.org>
Date:   Tue, 17 Sep 2019 17:12:32 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190917225317.5872-1-arthurmoraeslago@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/17/19 4:53 PM, Arthur Moraes do Lago wrote:
> Add mean window size parameter for debayer filter as a control in
> vimc-debayer.
> 
> vimc-debayer was patched to allow changing mean windows parameter
> of the filter without needing to reload the driver. The parameter
> can now be set using a v4l2-ctl control(mean_window_size).
> 
> Co-developed-by: Laís Pessine do Carmo <laispc19@gmail.com>
> Signed-off-by: Laís Pessine do Carmo <laispc19@gmail.com>
> Signed-off-by: Arthur Moraes do Lago <arthurmoraeslago@gmail.com>
> 
> Small fixes to vimc debayer mean window size patch
> ---
> Changes in V2:
>   - Updated documentation
>   - Added v4l2_subev_core_ops to solve errors in v4l2-ctl compliance test
>   - Changed control naming to follow English capitalization rules
>   - Rebased to Shuah Khan's newest patch series 171283
>      ("Collapse vimc single monolithic driver")
>   - Change maximum value for mean window size
> 
> We did run streaming tests, the value of 1 for mean window size has a
> nice side effect of not applying any filter, so we can see the original
> pattern. The value of 99 for mean window size worked, but was very slow.
> We wanted to find a way to show that higher values for mean window size
> yielded very similar results to just blurring the image, but we could
> not find any way to show this, so we just made the maximum value 25,
> which runs faster, but is still probably a little high.
> ---
>   Documentation/media/v4l-drivers/vimc.rst   | 10 +--
>   drivers/media/platform/vimc/vimc-common.h  |  1 +
>   drivers/media/platform/vimc/vimc-debayer.c | 89 +++++++++++++++++++---
>   3 files changed, 79 insertions(+), 21 deletions(-)
> 
> diff --git a/Documentation/media/v4l-drivers/vimc.rst b/Documentation/media/v4l-drivers/vimc.rst
> index a582af0509ee..91c909904b87 100644
> --- a/Documentation/media/v4l-drivers/vimc.rst
> +++ b/Documentation/media/v4l-drivers/vimc.rst
> @@ -80,9 +80,7 @@ vimc-capture:
>           Module options
>   ---------------
>   
> -Vimc has a few module parameters to configure the driver.
> -
> -        param=value
> +Vimc has a module parameters to configure the driver.

parameter

>   
>   * ``sca_mult=<unsigned int>``
>   
> @@ -91,12 +89,6 @@ Vimc has a few module parameters to configure the driver.
>           original one. Currently, only supports scaling up (the default value
>           is 3).
>   
> -* ``deb_mean_win_size=<unsigned int>``
> -
> -        Window size to calculate the mean. Note: the window size needs to be an
> -        odd number, as the main pixel stays in the center of the window,
> -        otherwise the next odd number is considered (the default value is 3).
> -
>   Source code documentation
>   -------------------------
>   
> diff --git a/drivers/media/platform/vimc/vimc-common.h b/drivers/media/platform/vimc/vimc-common.h
> index 236412ad7548..3a5102ddf794 100644
> --- a/drivers/media/platform/vimc/vimc-common.h
> +++ b/drivers/media/platform/vimc/vimc-common.h
> @@ -19,6 +19,7 @@
>   #define VIMC_CID_VIMC_BASE		(0x00f00000 | 0xf000)
>   #define VIMC_CID_VIMC_CLASS		(0x00f00000 | 1)
>   #define VIMC_CID_TEST_PATTERN		(VIMC_CID_VIMC_BASE + 0)
> +#define VIMC_CID_MEAN_WIN_SIZE		(VIMC_CID_VIMC_BASE + 1)
>   
>   #define VIMC_FRAME_MAX_WIDTH 4096
>   #define VIMC_FRAME_MAX_HEIGHT 2160
> diff --git a/drivers/media/platform/vimc/vimc-debayer.c b/drivers/media/platform/vimc/vimc-debayer.c
> index 37f3767db469..76df2ac110c0 100644
> --- a/drivers/media/platform/vimc/vimc-debayer.c
> +++ b/drivers/media/platform/vimc/vimc-debayer.c
> @@ -11,17 +11,12 @@
>   #include <linux/platform_device.h>
>   #include <linux/vmalloc.h>
>   #include <linux/v4l2-mediabus.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-event.h>
>   #include <media/v4l2-subdev.h>
>   
>   #include "vimc-common.h"
>   
> -static unsigned int deb_mean_win_size = 3;
> -module_param(deb_mean_win_size, uint, 0000);
> -MODULE_PARM_DESC(deb_mean_win_size, " the window size to calculate the mean.\n"
> -	"NOTE: the window size needs to be an odd number, as the main pixel "
> -	"stays in the center of the window, otherwise the next odd number "
> -	"is considered");
> -
>   enum vimc_deb_rgb_colors {
>   	VIMC_DEB_RED = 0,
>   	VIMC_DEB_GREEN = 1,
> @@ -46,6 +41,8 @@ struct vimc_deb_device {
>   	u8 *src_frame;
>   	const struct vimc_deb_pix_map *sink_pix_map;
>   	unsigned int sink_bpp;
> +	unsigned int mean_win_size;
> +	struct v4l2_ctrl_handler hdl;
>   };
>   
>   static const struct v4l2_mbus_framefmt sink_fmt_default = {
> @@ -346,11 +343,18 @@ static int vimc_deb_s_stream(struct v4l2_subdev *sd, int enable)
>   	return 0;
>   }
>   
> +static const struct v4l2_subdev_core_ops vimc_deb_core_ops = {
> +	.log_status = v4l2_ctrl_subdev_log_status,
> +	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
> +	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
> +};
> +
>   static const struct v4l2_subdev_video_ops vimc_deb_video_ops = {
>   	.s_stream = vimc_deb_s_stream,
>   };
>   
>   static const struct v4l2_subdev_ops vimc_deb_ops = {
> +	.core = &vimc_deb_core_ops,
>   	.pad = &vimc_deb_pad_ops,
>   	.video = &vimc_deb_video_ops,
>   };
> @@ -384,7 +388,7 @@ static void vimc_deb_calc_rgb_sink(struct vimc_deb_device *vdeb,
>   	 * the top left corner of the mean window (considering the current
>   	 * pixel as the center)
>   	 */
> -	seek = deb_mean_win_size / 2;
> +	seek = vdeb->mean_win_size / 2;
>   
>   	/* Sum the values of the colors in the mean window */
>   
> @@ -474,6 +478,33 @@ static void *vimc_deb_process_frame(struct vimc_ent_device *ved,
>   
>   }
>   
> +static inline void vimc_deb_s_mean_win_size(struct vimc_deb_device *vdeb,
> +					    unsigned int mean_win_size)
> +{
> +	if (vdeb->mean_win_size == mean_win_size)
> +		return;
> +	vdeb->mean_win_size = mean_win_size;
> +}
> +
> +static int vimc_deb_s_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct vimc_deb_device *vdeb =
> +		container_of(ctrl->handler, struct vimc_deb_device, hdl);
> +
> +	switch (ctrl->id) {
> +	case VIMC_CID_MEAN_WIN_SIZE:
> +		vimc_deb_s_mean_win_size(vdeb, ctrl->val);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +	return 0;
> +}
> +
> +static const struct v4l2_ctrl_ops vimc_deb_ctrl_ops = {
> +	.s_ctrl = vimc_deb_s_ctrl,
> +};
> +
>   static void vimc_deb_release(struct v4l2_subdev *sd)
>   {
>   	struct vimc_deb_device *vdeb =
> @@ -495,6 +526,24 @@ void vimc_deb_rm(struct vimc_device *vimc, struct vimc_ent_device *ved)
>   	vimc_ent_sd_unregister(ved, &vdeb->sd);
>   }
>   
> +static const struct v4l2_ctrl_config vimc_deb_ctrl_class = {
> +	.flags = V4L2_CTRL_FLAG_READ_ONLY | V4L2_CTRL_FLAG_WRITE_ONLY,
> +	.id = VIMC_CID_VIMC_CLASS,
> +	.name = "VIMC Controls",

Make this VIMC Debayer Controls?

> +	.type = V4L2_CTRL_TYPE_CTRL_CLASS,
> +};
> +
> +static const struct v4l2_ctrl_config vimc_deb_ctrl_mean_win_size = {
> +	.ops = &vimc_deb_ctrl_ops,
> +	.id = VIMC_CID_MEAN_WIN_SIZE,
> +	.name = "Mean Window Size",
> +	.type = V4L2_CTRL_TYPE_INTEGER,
> +	.min = 1,
> +	.max = 25,
> +	.step = 2,
> +	.def = 3,
> +};
> +
>   struct vimc_ent_device *vimc_deb_add(struct vimc_device *vimc,
>   				     const char *vcfg_name)
>   {
> @@ -507,6 +556,16 @@ struct vimc_ent_device *vimc_deb_add(struct vimc_device *vimc,
>   	if (!vdeb)
>   		return NULL;
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
>   	/* Initialize ved and sd */
>   	ret = vimc_ent_sd_register(&vdeb->ved, &vdeb->sd, v4l2_dev,
>   				   vcfg_name,
> @@ -514,13 +573,12 @@ struct vimc_ent_device *vimc_deb_add(struct vimc_device *vimc,
>   				   (const unsigned long[2]) {MEDIA_PAD_FL_SINK,
>   				   MEDIA_PAD_FL_SOURCE},
>   				   &vimc_deb_int_ops, &vimc_deb_ops);
> -	if (ret) {
> -		kfree(vdeb);
> -		return NULL;
> -	}
> +	if (ret)
> +		goto err_free_hdl;
>   
>   	vdeb->ved.process_frame = vimc_deb_process_frame;
>   	vdeb->dev = &vimc->pdev.dev;
> +	vdeb->mean_win_size = vimc_deb_ctrl_mean_win_size.def;
>   
>   	/* Initialize the frame format */
>   	vdeb->sink_fmt = sink_fmt_default;
> @@ -534,4 +592,11 @@ struct vimc_ent_device *vimc_deb_add(struct vimc_device *vimc,
>   	vdeb->set_rgb_src = vimc_deb_set_rgb_mbus_fmt_rgb888_1x24;
>   
>   	return &vdeb->ved;
> +
> +err_free_hdl:
> +	v4l2_ctrl_handler_free(&vdeb->hdl);

Free the handle from vimc_deb_release()

> +err_free_vdeb:
> +	kfree(vdeb);
> +
> +	return NULL;
>   }
> 

thanks,
-- Shuah
