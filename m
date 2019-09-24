Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 500FEBCB9C
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2019 17:35:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390432AbfIXPej (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Sep 2019 11:34:39 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:44528 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389843AbfIXPei (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Sep 2019 11:34:38 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 0DFE82601A9
Message-ID: <893b802437a8cc011354cb724b6047283bd06f90.camel@collabora.com>
Subject: Re: [PATCH v2] media: vimc: fla: Add virtual flash subdevice
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     "Lucas A. M." =?ISO-8859-1?Q?Magalh=E3es?= <lucmaga@gmail.com>,
        linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, linux-kernel@vger.kernel.org,
        helen.koike@collabora.com, edusbarretto@gmail.com,
        lkcamp@lists.libreplanetbr.org
Date:   Tue, 24 Sep 2019 18:34:32 +0300
In-Reply-To: <20190915184419.32184-1-lucmaga@gmail.com>
References: <20190915184419.32184-1-lucmaga@gmail.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Sun, 2019-09-15 at 15:44 -0300, Lucas A. M. Magalhães wrote:
> From: Lucas A. M. Magalhaes <lucmaga@gmail.com>
> 
> Add a virtual subdevice to simulate the flash control API.
> Those are the supported controls:
> v4l2-ctl -d /dev/v4l-subdev6 -L
> Flash Controls
> 
>                        led_mode 0x009c0901 (menu)   : min=0 max=2 default=0 value=0
>                                 0: Off
>                                 1: Flash
>                                 2: Torch
>                   strobe_source 0x009c0902 (menu)   : min=0 max=1 default=0 value=0
>                                 0: Software
>                                 1: External
>                          strobe 0x009c0903 (button) : flags=write-only, execute-on-write
>                     stop_strobe 0x009c0904 (button) : flags=write-only, execute-on-write
>                   strobe_status 0x009c0905 (bool)   : default=0 value=0 flags=read-only
>                  strobe_timeout 0x009c0906 (int)    : min=1 max=10 step=1 default=10 value=10
>            intensity_flash_mode 0x009c0907 (int)    : min=0 max=255 step=1 default=255 value=255
>            intensity_torch_mode 0x009c0908 (int)    : min=0 max=255 step=1 default=255 value=255
>             intensity_indicator 0x009c0909 (int)    : min=0 max=255 step=1 default=255 value=255
>                          faults 0x009c090a (bitmask): max=0x00000002 default=0x00000000 value=0x00000000
> 
> Co-authored-by: Eduardo Barretto <edusbarretto@gmail.com>
> Signed-off-by: Eduardo Barretto <edusbarretto@gmail.com>
> Signed-off-by: Lucas A. M. Magalhães <lucmaga@gmail.com>
> 
> ---
> Hi,
> 
> This patch depends on the patch series
>         "Collapse vimc into single monolithic driver" version 4.
> 
> Changes in v2:
> 	- Fix v4l2-complience errors
> 	- Add V4L2_CID_FLASH_STROBE_STATUS behavior
> 	- Add V4L2_CID_FLASH_STROBE restrictions
> 	- Remove vimc_fla_g_volatile_ctrl
> 	- Remove unnecessarie V4L2_CID_FLASH_CLASS
> 	- Change varables names
> 	- Changes to apply over v4 of patch
> 		"Collapse vimc into single monolithic driver"
> ---
>  drivers/media/platform/vimc/Makefile      |   2 +-
>  drivers/media/platform/vimc/vimc-common.c |   2 +
>  drivers/media/platform/vimc/vimc-common.h |   4 +
>  drivers/media/platform/vimc/vimc-core.c   |   5 +
>  drivers/media/platform/vimc/vimc-flash.c  | 200 ++++++++++++++++++++++
>  5 files changed, 212 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/media/platform/vimc/vimc-flash.c
> 
> diff --git a/drivers/media/platform/vimc/Makefile b/drivers/media/platform/vimc/Makefile
> index a53b2b532e9f..e759bbb04b14 100644
> --- a/drivers/media/platform/vimc/Makefile
> +++ b/drivers/media/platform/vimc/Makefile
> @@ -1,6 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  vimc-y := vimc-core.o vimc-common.o vimc-streamer.o vimc-capture.o \
> -		vimc-debayer.o vimc-scaler.o vimc-sensor.o
> +		vimc-debayer.o vimc-scaler.o vimc-sensor.o vimc-flash.o
>  
>  obj-$(CONFIG_VIDEO_VIMC) += vimc.o
>  
> diff --git a/drivers/media/platform/vimc/vimc-common.c b/drivers/media/platform/vimc/vimc-common.c
> index a3120f4f7a90..cb786de75573 100644
> --- a/drivers/media/platform/vimc/vimc-common.c
> +++ b/drivers/media/platform/vimc/vimc-common.c
> @@ -203,6 +203,8 @@ struct media_pad *vimc_pads_init(u16 num_pads, const unsigned long *pads_flag)
>  	struct media_pad *pads;
>  	unsigned int i;
>  
> +	if (!num_pads)
> +		return NULL;
>  	/* Allocate memory for the pads */
>  	pads = kcalloc(num_pads, sizeof(*pads), GFP_KERNEL);
>  	if (!pads)
> diff --git a/drivers/media/platform/vimc/vimc-common.h b/drivers/media/platform/vimc/vimc-common.h
> index 236412ad7548..a1fbbc8066d3 100644
> --- a/drivers/media/platform/vimc/vimc-common.h
> +++ b/drivers/media/platform/vimc/vimc-common.h
> @@ -169,6 +169,10 @@ struct vimc_ent_device *vimc_sen_add(struct vimc_device *vimc,
>  				     const char *vcfg_name);
>  void vimc_sen_rm(struct vimc_device *vimc, struct vimc_ent_device *ved);
>  
> +struct vimc_ent_device *vimc_fla_add(struct vimc_device *vimc,
> +				     const char *vcfg_name);
> +void vimc_fla_rm(struct vimc_device *vimc, struct vimc_ent_device *ved);
> +
>  /**
>   * vimc_pads_init - initialize pads
>   *
> diff --git a/drivers/media/platform/vimc/vimc-core.c b/drivers/media/platform/vimc/vimc-core.c
> index a1218578cb9a..312723b4ed8a 100644
> --- a/drivers/media/platform/vimc/vimc-core.c
> +++ b/drivers/media/platform/vimc/vimc-core.c
> @@ -91,6 +91,11 @@ static struct vimc_ent_config ent_config[] = {
>  		.add = vimc_cap_add,
>  		.rm = vimc_cap_rm,
>  	},
> +	{
> +		.name = "Flash Controller",
> +		.add = vimc_fla_add,
> +		.rm = vimc_fla_rm,
> +	}
>  };
>  
>  static const struct vimc_ent_link ent_links[] = {
> diff --git a/drivers/media/platform/vimc/vimc-flash.c b/drivers/media/platform/vimc/vimc-flash.c
> new file mode 100644
> index 000000000000..637e7d0a5919
> --- /dev/null
> +++ b/drivers/media/platform/vimc/vimc-flash.c
> @@ -0,0 +1,200 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * vimc-flash.c Virtual Media Controller Driver
> + *
> + * Copyright (C) 2019
> + * Contributors: Lucas A. M. Magalhães <lamm@lucmaga.dev>
> + *               Eduardo Barretto <edusbarretto@gmail.com>
> + *
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/kthread.h>
> +#include <linux/sched.h>
> +#include <linux/vmalloc.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-subdev.h>
> +
> +#include "vimc-common.h"
> +
> +#define VIMC_FLASH_TIMEOUT_STEP 10000
> +#define VIMC_FLASH_TIMEOUT_MAX 50000000
> +
> +struct vimc_fla_device {
> +	struct vimc_ent_device ved;
> +	struct v4l2_subdev sd;
> +	struct v4l2_ctrl_handler hdl;
> +	int strobe_source;
> +	bool is_strobe;
> +	int led_mode;
> +	int indicator_intensity;
> +	int torch_intensity;
> +	int flash_intensity;
> +	u64 timeout;
> +	u64 last_strobe;
> +	struct task_struct *kthread;
> +};
> +
> +void vimc_fla_set_strobe_status(struct v4l2_ctrl_handler *hdl, bool value){
> +	struct v4l2_ctrl *c;
> +	c = v4l2_ctrl_find(hdl, V4L2_CID_FLASH_STROBE_STATUS);
> +	if (!c) return;
> +	v4l2_ctrl_s_ctrl(c, value);
> +
> +}
> +
> +static int vimc_fla_strobe_thread(void *data)
> +{
> +	struct vimc_fla_device *vfla = data;
> +	vimc_fla_set_strobe_status(&vfla->hdl, vfla->is_strobe);
> +	vfla->last_strobe = ktime_get_ns();
> +	while(vfla->is_strobe &&
> +		vfla->last_strobe + vfla->timeout > ktime_get_ns()){
> +		msleep_interruptible(VIMC_FLASH_TIMEOUT_STEP/1000);
> +	}
> +	vimc_fla_set_strobe_status(&vfla->hdl, false);
> +	return 0;
> +}
> +
> +static int vimc_fla_s_ctrl(struct v4l2_ctrl *c)
> +{
> +
> +	struct vimc_fla_device *vfla =
> +		container_of(c->handler, struct vimc_fla_device, hdl);
> +
> +	switch (c->id) {
> +	case V4L2_CID_FLASH_LED_MODE:
> +		vfla->led_mode = c->val;
> +		return 0;
> +	case V4L2_CID_FLASH_STROBE_SOURCE:
> +		vfla->strobe_source = c->val;
> +		return 0;
> +	case V4L2_CID_FLASH_STROBE:
> +		if (vfla->led_mode != V4L2_FLASH_LED_MODE_FLASH ||
> +		    vfla->strobe_source != V4L2_FLASH_STROBE_SOURCE_SOFTWARE){
> +			return -EILSEQ;
> +		}
> +		vfla->is_strobe = true;
> +		vfla->kthread = kthread_run(vimc_fla_strobe_thread, vfla, "vimc-flash thread");
> +		return 0;
> +	case V4L2_CID_FLASH_STROBE_STATUS:
> +		vfla->is_strobe = c->val;
> +		return 0;
> +	case V4L2_CID_FLASH_STROBE_STOP:
> +		vfla->is_strobe = false;
> +		return 0;
> +	case V4L2_CID_FLASH_TIMEOUT:
> +		vfla->timeout = c->val;
> +		return 0;
> +	case V4L2_CID_FLASH_INTENSITY:
> +		vfla->flash_intensity = c->val;
> +		return 0;
> +	case V4L2_CID_FLASH_TORCH_INTENSITY:
> +		vfla->torch_intensity = c->val;
> +		return 0;
> +	case V4L2_CID_FLASH_INDICATOR_INTENSITY:
> +		vfla->indicator_intensity = c->val;
> +		return 0;
Should you add here a "default" case returning error?

> +	}
> +	return 0;
> +}
> +
> +static const struct v4l2_ctrl_ops vimc_fla_ctrl_ops = {
> +	.s_ctrl = vimc_fla_s_ctrl,
> +};
> +
> +static const struct v4l2_subdev_core_ops vimc_fla_core_ops = {
> +	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
> +	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
> +};
> +
> +static const struct v4l2_subdev_ops vimc_fla_ops = {
> +	.core = &vimc_fla_core_ops,
> +};
> +
> +/* initialize device */
> +struct vimc_ent_device *vimc_fla_add(struct vimc_device *vimc,
> +				     const char *vcfg_name)
> +{
> +	struct v4l2_device *v4l2_dev = &vimc->v4l2_dev;
> +	struct vimc_fla_device *vfla;
> +	int ret;
> +
> +	/* Allocate the vfla struct */
> +	vfla = kzalloc(sizeof(*vfla), GFP_KERNEL);
> +	if (!vfla)
> +		return NULL;
> +
> +	v4l2_ctrl_handler_init(&vfla->hdl, 4);
> +
> +	v4l2_ctrl_new_std_menu(&vfla->hdl, &vimc_fla_ctrl_ops,
> +			       V4L2_CID_FLASH_LED_MODE,
> +			       V4L2_FLASH_LED_MODE_TORCH, ~0x7,
> +			       V4L2_FLASH_LED_MODE_NONE);
> +	v4l2_ctrl_new_std_menu(&vfla->hdl, &vimc_fla_ctrl_ops,
> +			       V4L2_CID_FLASH_STROBE_SOURCE, 0x1, ~0x3,
> +			       V4L2_FLASH_STROBE_SOURCE_SOFTWARE);
> +	v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
> +			  V4L2_CID_FLASH_STROBE, 0, 0, 0, 0);
> +	v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
> +			  V4L2_CID_FLASH_STROBE_STOP, 0, 0, 0, 0);
> +	v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
> +			  V4L2_CID_FLASH_TIMEOUT, 0,
> +			  VIMC_FLASH_TIMEOUT_MAX,
> +			  VIMC_FLASH_TIMEOUT_STEP,
> +			  VIMC_FLASH_TIMEOUT_STEP);
> +	v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
> +			  V4L2_CID_FLASH_TORCH_INTENSITY, 0, 255, 1, 255);
> +	v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
> +			  V4L2_CID_FLASH_INTENSITY, 0, 255, 1, 255);
> +	v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
> +			  V4L2_CID_FLASH_INDICATOR_INTENSITY, 0, 255, 1, 255);
> +	v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
> +			  V4L2_CID_FLASH_STROBE_STATUS, 0, 1, 1, 0);
> +	v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
> +			  V4L2_CID_FLASH_FAULT, 0,
> +			  V4L2_FLASH_FAULT_TIMEOUT, 0, 0);
> +	vfla->sd.ctrl_handler = &vfla->hdl;
> +	if (vfla->hdl.error) {
> +		ret = vfla->hdl.error;
> +		goto err_free_vfla;
> +	}
> +
> +	/* Initialize ved and sd */
> +	ret = vimc_ent_sd_register(&vfla->ved, &vfla->sd, v4l2_dev,
> +				   vcfg_name,
> +				   MEDIA_ENT_F_FLASH, 0, NULL,
> +				   NULL, &vimc_fla_ops);
I think you are missing a v4l2_subdev_internal_ops* as the 8th argument
with a release callback that frees the ctrl handler, similar to vimc-sensor

Regards,
Dafna

> +	if (ret)
> +		goto err_free_hdl;
> +
> +	/* Initialize standard values */
> +	vfla->indicator_intensity = 0;
> +	vfla->torch_intensity = 0;
> +	vfla->flash_intensity = 0;
> +	vfla->is_strobe = false;
> +	vfla->timeout = 0;
> +	vfla->last_strobe = 0;
> +	vfla->led_mode = V4L2_FLASH_LED_MODE_NONE;
> +
> +	return &vfla->ved;
> +
> +err_free_hdl:
> +	v4l2_ctrl_handler_free(&vfla->hdl);
> +err_free_vfla:
> +	kfree(vfla);
> +
> +	return NULL;
> +}
> +
> +void vimc_fla_rm(struct vimc_device *vimc, struct vimc_ent_device *ved)
> +{
> +	struct vimc_fla_device *vfla;
> +
> +	if (!ved)
> +		return;
> +
> +	vfla = container_of(ved, struct vimc_fla_device, ved);
> +	vimc_ent_sd_unregister(ved, &vfla->sd);
> +}

