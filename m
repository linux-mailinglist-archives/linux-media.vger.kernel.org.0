Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 628B4A68A7
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2019 14:37:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729015AbfICMhF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Sep 2019 08:37:05 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:34658 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727667AbfICMhF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Sep 2019 08:37:05 -0400
Received: from [IPv6:2804:431:c7f4:702d:d711:794d:1c68:5ed3] (unknown [IPv6:2804:431:c7f4:702d:d711:794d:1c68:5ed3])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tonyk)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id EC84C28D3A7;
        Tue,  3 Sep 2019 13:37:00 +0100 (BST)
Subject: Re: [PATCH] media: vimc: Implement debayer control for mean window
 size
To:     Arthur Moraes do Lago <arthurmoraeslago@gmail.com>,
        helen.koike@collabora.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        lkcamp@lists.libreplanetbr.org
References: <20190901194032.16207-1-arthurmoraeslago@gmail.com>
From:   =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@collabora.com>
Message-ID: <a3059e07-73d9-950f-b525-bd363283383b@collabora.com>
Date:   Tue, 3 Sep 2019 09:35:59 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190901194032.16207-1-arthurmoraeslago@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Arthur and Laís,

Thanks for your patch!

On 9/1/19 4:40 PM, Arthur Moraes do Lago wrote:
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

Since you removed the module parameter, please make sure to update vimc
documentation section explaining about it:
https://git.linuxtv.org/media_tree.git/tree/Documentation/media/v4l-drivers/vimc.rst#n94

Thanks,
	André

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
> +	.type = V4L2_CTRL_TYPE_INTEGER,
> +	.min = 1,
> +	.max = 99,
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

