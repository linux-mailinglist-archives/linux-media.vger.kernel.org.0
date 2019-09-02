Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD298A55C7
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2019 14:20:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731450AbfIBMUG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Sep 2019 08:20:06 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:38665 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731362AbfIBMUG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 2 Sep 2019 08:20:06 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 4lJPidnY3zaKO4lJTiXfJA; Mon, 02 Sep 2019 14:20:03 +0200
Subject: Re: [PATCH] media: vimc: Implement debayer control for mean window
 size
To:     Arthur Moraes do Lago <arthurmoraeslago@gmail.com>,
        helen.koike@collabora.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        lkcamp@lists.libreplanetbr.org
References: <20190901194032.16207-1-arthurmoraeslago@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <1f8d96c2-d722-9c95-2430-0e682ee39be7@xs4all.nl>
Date:   Mon, 2 Sep 2019 14:19:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190901194032.16207-1-arthurmoraeslago@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfL+tFWScq3neTRYZZcX9g3aAPOh411yY376aOszh+CUvHUKx/6NVGdDv9SGRK/HG8RMoSfvvHuFu0U6MLr9/l8RQv7E3gMmljtyr/hI3bxgkQRv0EFEf
 fhw1vSJjsLv+Or310qyCmrZWNoz9CZcNU1b3ClxdyXB6KXfVEBFDejl17twGbdDCa97PI2420KjumpqmDMWJ6YoK5gSed5VnLOk51eD+GqnlY0GKvmMSyJgi
 3+/8uj2ilqpL+fKwIX7+iW3T0cu3SbLjgqUh7yg7wAaXgsRUlCXDOrhLCjmq2hmct53m8nB90pRyWWLdbT8JCsH3BFJSjA0mTNipvIAL5fpxLabNvOTsw4/p
 RogTPsZf9CE41J91scBDECm+qr5yTQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/1/19 9:40 PM, Arthur Moraes do Lago wrote:
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
> ---
> This patch was made on top of Shuah Khan's patch (162623).
> Thanks.
> ---
>  drivers/media/platform/vimc/vimc-common.h  |  1 +
>  drivers/media/platform/vimc/vimc-debayer.c | 81 ++++++++++++++++++----
>  2 files changed, 70 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/platform/vimc/vimc-common.h b/drivers/media/platform/vimc/vimc-common.h
> index 5b2282de395c..547ff04a415e 100644
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
> index 6cee911bf149..aa3edeed96bc 100644
> --- a/drivers/media/platform/vimc/vimc-debayer.c
> +++ b/drivers/media/platform/vimc/vimc-debayer.c
> @@ -11,17 +11,11 @@
>  #include <linux/platform_device.h>
>  #include <linux/vmalloc.h>
>  #include <linux/v4l2-mediabus.h>
> +#include <media/v4l2-ctrls.h>
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
>  #define IS_SINK(pad) (!pad)
>  #define IS_SRC(pad)  (pad)
>  
> @@ -49,6 +43,8 @@ struct vimc_deb_device {
>  	u8 *src_frame;
>  	const struct vimc_deb_pix_map *sink_pix_map;
>  	unsigned int sink_bpp;
> +	unsigned int mean_win_size;
> +	struct v4l2_ctrl_handler hdl;
>  };
>  
>  static const struct v4l2_mbus_framefmt sink_fmt_default = {
> @@ -387,7 +383,7 @@ static void vimc_deb_calc_rgb_sink(struct vimc_deb_device *vdeb,
>  	 * the top left corner of the mean window (considering the current
>  	 * pixel as the center)
>  	 */
> -	seek = deb_mean_win_size / 2;
> +	seek = vdeb->mean_win_size / 2;
>  
>  	/* Sum the values of the colors in the mean window */
>  
> @@ -477,6 +473,33 @@ static void *vimc_deb_process_frame(struct vimc_ent_device *ved,
>  
>  }
>  
> +static inline void vimc_deb_s_mean_win_size(struct vimc_deb_device *vdeb,
> +					    unsigned int mean_win_size)
> +{
> +		if (vdeb->mean_win_size == mean_win_size)
> +			return;
> +		vdeb->mean_win_size = mean_win_size;
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
>  static void vimc_deb_release(struct v4l2_subdev *sd)
>  {
>  	struct vimc_deb_device *vdeb =
> @@ -502,6 +525,24 @@ void vimc_deb_rm(struct vimc_device *vimc, struct vimc_ent_config *vcfg)
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
> +	.name = "Mean window size",

Should be "Mean Window Size". We follow English capitalization rules for titles
for the control names.

> +	.type = V4L2_CTRL_TYPE_INTEGER,
> +	.min = 1,
> +	.max = 99,

This seems unreasonably large. I'm not sure what is a typical maximum, but
I suspect it will be very much smaller than 99.

Make sure you do a streaming test with this control with both the min and max values.

Does v4l2-compliance pass?

Regards,

	Hans

> +	.step = 2,
> +	.def = 3,
> +};
> +
>  int vimc_deb_add(struct vimc_device *vimc, struct vimc_ent_config *vcfg)
>  {
>  	struct v4l2_device *v4l2_dev = &vimc->v4l2_dev;
> @@ -513,6 +554,16 @@ int vimc_deb_add(struct vimc_device *vimc, struct vimc_ent_config *vcfg)
>  	if (!vdeb)
>  		return -ENOMEM;
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
>  				   vcfg->name,
> @@ -520,13 +571,12 @@ int vimc_deb_add(struct vimc_device *vimc, struct vimc_ent_config *vcfg)
>  				   (const unsigned long[2]) {MEDIA_PAD_FL_SINK,
>  				   MEDIA_PAD_FL_SOURCE},
>  				   &vimc_deb_int_ops, &vimc_deb_ops);
> -	if (ret) {
> -		kfree(vdeb);
> -		return ret;
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
> @@ -541,4 +591,11 @@ int vimc_deb_add(struct vimc_device *vimc, struct vimc_ent_config *vcfg)
>  
>  	vcfg->ved = &vdeb->ved;
>  	return 0;
> +
> +err_free_hdl:
> +	v4l2_ctrl_handler_free(&vdeb->hdl);
> +err_free_vdeb:
> +	kfree(vdeb);
> +
> +	return ret;
>  }
> 

