Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34FDCE13EB
	for <lists+linux-media@lfdr.de>; Wed, 23 Oct 2019 10:19:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390144AbfJWITi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Oct 2019 04:19:38 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:54883 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389987AbfJWITh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Oct 2019 04:19:37 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id NBrciLNKnHfodNBrfizN6X; Wed, 23 Oct 2019 10:19:32 +0200
Subject: Re: [PATCH v4] media: vimc: Implement debayer control for mean window
 size
To:     Arthur Moraes do Lago <arthurmoraeslago@gmail.com>,
        lkcamp@lists.libreplanetbr.org, mchehab@kernel.org,
        skhan@linuxfoundation.org, andrealmeid@collabora.com,
        laispc19@gmail.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20191002004633.21490-1-arthurmoraeslago@gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <226800d6-6bac-27e2-9812-9de0cb9bf80f@xs4all.nl>
Date:   Wed, 23 Oct 2019 10:19:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191002004633.21490-1-arthurmoraeslago@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfJMpW7J90PZF9AqMkRsVJPKEhFMsreJk9hf91+7JtpbQewuieVtqmvodzW3KzS0imJe5iceGzAz5OkWbFwqN8837MBdodUeKWytAAe9JhE0b4SLspH56
 PfMybgYJb7hD2i101DM9EgH4qTuY1wNFoPfBupHO92ipDT/QM08WfIvT9RN1eE16RvEkeOkh7vIq3zP9b/+vttuE/IVFpOG8dhuyZLFrWVihDaN212UUF/qL
 rOxE7BA37h7Eh7BbAlTMbCfTokW4Zk8HOnPIGQuhLMcc8gr1mSpa8OusXM8PHaeoMZ5xORnv6t+npWRXqXc3N/oOkkWVnEn2Q1vTFXcNqdwm8ulUf42aMbBH
 KgoM7izIoVt6vEvDQ+lRKAGVT4OvaLkPDTvhrXalZnTPuJ/UCr21uFgi5kiHMvpIjLVw3jBIm8VSm57e3pVmp2tKcLD4tw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Arthur,

I added this patch to my pull request, but I have a request for a follow-up
patch:

On 10/2/19 2:46 AM, Arthur Moraes do Lago wrote:
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

This is identical to the control class in vimc-sensor.c.

Since this is now a monolithic driver it is possible to move this to vimc-common.c
and have both vimc-debayer.c and vimc-sensor.c use the same struct v4l2_ctrl_config
for this.

This ensures both subdevs use the same control class definition.

Regards,

	Hans

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

