Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FA99B8F08
	for <lists+linux-media@lfdr.de>; Fri, 20 Sep 2019 13:32:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438151AbfITLca (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Sep 2019 07:32:30 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:47853 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2408667AbfITLca (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Sep 2019 07:32:30 -0400
Received: from [IPv6:2001:983:e9a7:1:3829:6e33:4e49:c53d] ([IPv6:2001:983:e9a7:1:3829:6e33:4e49:c53d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id BH9FisbYnz6EABH9GiylOx; Fri, 20 Sep 2019 13:32:27 +0200
Subject: Re: [PATCH v2] media: vimc: fla: Add virtual flash subdevice
To:     =?UTF-8?Q?Lucas_A=2e_M=2e_Magalh=c3=a3es?= <lucmaga@gmail.com>,
        linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, helen.koike@collabora.com,
        edusbarretto@gmail.com, lkcamp@lists.libreplanetbr.org
References: <20190915184419.32184-1-lucmaga@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <f9670de6-5586-0067-936e-87ebf8a20609@xs4all.nl>
Date:   Fri, 20 Sep 2019 13:32:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190915184419.32184-1-lucmaga@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfJVrI6xX7kau+dyOk91gQIwjxYSmXIcrZJo5Qnq0SBiXJa+T/HiguUb7QFvWefXEsBo+MxfTwva9GXrysIOWcywXcm7mi+AgAMt0VMDK1OAZPa23j4Dp
 lIjPksCdgdi1MM5KMtPyFXMeEez5xtr3TlUeQqn13QeFmiKsUJ/BxapjyZTOBX2LeaKIMrX8emszjV9rsOEeoKU6ynDh3FJ5Z6gqWcnUXB/PWE2kzLWorM8G
 8rxa4pc5nFVrK2NmUB9NVTOdgxfkO8NIhktClJW22tsLzvo26Jsps0gKC5MErS8N0YiuvrtDZ1k9QMY+FjyaeJyxfXniZfeWGVWDdL1bKO/PDqnZ+Mqfp+wh
 zu4N2pbImAHcC58dYLjhyXF0NLs830okrtw/rkuPLpC1ByQbCuk4gGAHZ/MKw1EemZKdaf8174Nmbp3d0uF6PuyBuvc2NxoZhFv8u4hGBFeE5HXFflc=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/15/19 8:44 PM, Lucas A. M. Magalhães wrote:
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

What's the time unit for these defines? Just make that part of the name,
e.g. VIMC_FLASH_TIMEOUT_MS_STEP (or NS or US, whatever the unit is).

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

Please use proper coding style, so { should be on a new line...

> +	struct v4l2_ctrl *c;

...and add an empty line between variable declarations and the following code.

> +	c = v4l2_ctrl_find(hdl, V4L2_CID_FLASH_STROBE_STATUS);
> +	if (!c) return;

'return' should be on the next line.

> +	v4l2_ctrl_s_ctrl(c, value);
> +

no spurious empty line at the end.

> +}

How about this:

static void vimc_fla_set_strobe_status(struct v4l2_ctrl_handler *hdl, bool value)
{
	struct v4l2_ctrl *c = v4l2_ctrl_find(hdl, V4L2_CID_FLASH_STROBE_STATUS);

	if (c)
		v4l2_ctrl_s_ctrl(c, value);
}

Even better: just store the V4L2_CID_FLASH_STROBE_STATUS v4l2_ctrl pointer in
struct vimc_fla_device when the control is created and use that pointer directly.

> +
> +static int vimc_fla_strobe_thread(void *data)
> +{
> +	struct vimc_fla_device *vfla = data;

empty line

> +	vimc_fla_set_strobe_status(&vfla->hdl, vfla->is_strobe);

Hmm, this really boils down to a simple:

	v4l2_ctrl_s_ctrl(vfla->strobe_status_ctrl, 1);

So you don't need the vimc_fla_set_strobe_status at all.

> +	vfla->last_strobe = ktime_get_ns();
> +	while(vfla->is_strobe &&

space after 'while'.

Please run 'checkpatch.pl --strict' over your patch!

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

What if the thread is already running?

I wonder what existing flash drivers do if V4L2_CID_FLASH_STROBE is called
repeatedly. Perhaps returning EBUSY if strobe is still active makes sense here.

It would also be a nice feature if keeping the strobe on for more than X seconds
would create a V4L2_FLASH_FAULT_LED_OVER_TEMPERATURE fault.

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

Can you look at existing flash drivers and copy the min/max/step/def values?

The values here are rather arbitrary. It would be nice if it was a bit more
realistic.

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
> 

Regards,

	Hans
