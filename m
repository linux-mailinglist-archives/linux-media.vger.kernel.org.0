Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24F56A5580
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2019 14:04:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731359AbfIBMEw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Sep 2019 08:04:52 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:48327 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731334AbfIBMEw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 2 Sep 2019 08:04:52 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 4l4gidhjazaKO4l4jiXbHQ; Mon, 02 Sep 2019 14:04:49 +0200
Subject: Re: [PATCH] media: vimc: fla: Add virtual flash subdevice
To:     =?UTF-8?Q?Lucas_A=2e_M=2e_Magalh=c3=a3es?= <lucmaga@gmail.com>,
        linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, helen.koike@collabora.com,
        edusbarretto@gmail.com
References: <20190901211139.2405-1-lucmaga@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <1fea2f25-98d1-f9f6-a483-17c74f89452e@xs4all.nl>
Date:   Mon, 2 Sep 2019 14:04:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190901211139.2405-1-lucmaga@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfNS6P6VVuPGfIyZZPLLvy9iHL0FR+WayJNWWF9lazffIHCu33lsvZq2MckTnArvJAGC29EvS2TLcCsnTUY7DPldZ2eKaR1wvkWWLU++msO2rqfXA0tCd
 tPy1tp6GqTbOl/C9ckHS45QxJP+w0OKslI99vKOgEgLoRWt+chn7b9emMMcgbQS/8rGVLeF2amck/IyUhvntuD2zP2syfFAs8JY3RlwuuBiAZrZp4duJxVnV
 9fo4/DRwmuhR4iNLI/CakLY0RMkmNlOyGCE2aGw2HAfCl/XFi3AcXt1UqOFm0U8Vva/BYs4ErNEzcixTpPtFmA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Lucas, Eduardo,

Thank you for the patch!

Some comments below:

On 9/1/19 11:11 PM, Lucas A. M. Magalhães wrote:
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
> 	"Collapse vimc into single monolithic driver" version 3.
> 
> I tested it using the v4l2-ctl and the v4l2-compliance. Apparently the compliance
> doesn't test any of the standard flash controls. However I got this error:
> 
> test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>         fail: v4l2-test-controls.cpp(830): subscribe event for control 'Flash Controls' failed
> 
> Is it really mandatory to implement the event mechanism?
> 
> Here is the full output of the v4l2-compliance
> 
> root@(none):/# /usr/local/bin/v4l2-compliance -d /dev/v4l-subdev6
> v4l2-compliance SHA: b393a5408383b7341883857dfda78537f2f85ef6, 64 bits
> 
> Compliance test for vimc device /dev/v4l-subdev6:
> 
> Media Driver Info:
>         Driver name      : vimc
>         Model            : VIMC MDEV
>         Serial           :
>         Bus info         : platform:vimc
>         Media version    : 5.3.0
>         Hardware revision: 0x00000000 (0)
>         Driver version   : 5.3.0
> Interface Info:
>         ID               : 0x03000039
>         Type             : V4L Sub-Device
> Entity Info:
>         ID               : 0x0000001c (28)
>         Name             : Flash Controller
>         Function         : Flash Controller
> 
> Required ioctls:
>         test MC information (see 'Media Driver Info' above): OK
> 
> Allow for multiple opens:
>         test second /dev/v4l-subdev6 open: OK
>         test for unlimited opens: OK
> 
> Debug ioctls:
> [  342.293254] Flash Controller: =================  START STATUS  ================
> [  342.293945] Flash Controller: ==================  END STATUS  ==================
>         test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>         Inputs: 0 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>         Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>         test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls:
>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>         test VIDIOC_QUERYCTRL: OK
>         test VIDIOC_G/S_CTRL: OK
>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>                 fail: v4l2-test-controls.cpp(830): subscribe event for control 'Flash Controls' failed
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL
>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> 
> ontrols: 11 Private Controls: 0
> 
> Format ioctls:
>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
>         test VIDIOC_G/S_PARM: OK (Not Supported)
>         test VIDIOC_G_FBUF: OK (Not Supported)
>         test VIDIOC_G_FMT: OK (Not Supported)
>         test VIDIOC_TRY_FMT: OK (Not Supported)
>         test VIDIOC_S_FMT: OK (Not Supported)
>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>         test Cropping: OK (Not Supported)
>         test Composing: OK (Not Supported)
>         test Scaling: OK (Not Supported)
> 
> Codec ioctls:
>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls:
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
>         test VIDIOC_EXPBUF: OK (Not Supported)
>         test Requests: OK (Not Supported)
> 
> Total for vimc device /dev/v4l-subdev6: 41, Succeeded: 40, Failed: 1, Warnings: 0
> 
>  drivers/media/platform/vimc/Makefile      |   2 +-
>  drivers/media/platform/vimc/vimc-common.c |   2 +
>  drivers/media/platform/vimc/vimc-common.h |   3 +
>  drivers/media/platform/vimc/vimc-core.c   |   6 +
>  drivers/media/platform/vimc/vimc-flash.c  | 173 ++++++++++++++++++++++
>  5 files changed, 185 insertions(+), 1 deletion(-)
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
> index 5b2282de395c..af35169753f1 100644
> --- a/drivers/media/platform/vimc/vimc-common.h
> +++ b/drivers/media/platform/vimc/vimc-common.h
> @@ -159,6 +159,9 @@ void vimc_sca_rm(struct vimc_device *vimc, struct vimc_ent_config *vcfg);
>  int vimc_sen_add(struct vimc_device *vimc, struct vimc_ent_config *vcfg);
>  void vimc_sen_rm(struct vimc_device *vimc, struct vimc_ent_config *vcfg);
>  
> +int vimc_fla_add(struct vimc_device *vimc, struct vimc_ent_config *vcfg);
> +void vimc_fla_rm(struct vimc_device *vimc, struct vimc_ent_config *vcfg);
> +
>  /**
>   * vimc_pads_init - initialize pads
>   *
> diff --git a/drivers/media/platform/vimc/vimc-core.c b/drivers/media/platform/vimc/vimc-core.c
> index 3749bfa88e40..019a52b0d4e6 100644
> --- a/drivers/media/platform/vimc/vimc-core.c
> +++ b/drivers/media/platform/vimc/vimc-core.c
> @@ -100,6 +100,12 @@ static struct vimc_ent_config ent_config[] = {
>  		.add = vimc_cap_add,
>  		.rm = vimc_cap_rm,
>  	},
> +	{
> +		.name = "Flash Controller",
> +		.ved = NULL,
> +		.add = vimc_fla_add,
> +		.rm = vimc_fla_rm,
> +	}
>  };
>  
>  static const struct vimc_ent_link ent_links[] = {
> diff --git a/drivers/media/platform/vimc/vimc-flash.c b/drivers/media/platform/vimc/vimc-flash.c
> new file mode 100644
> index 000000000000..ee15fcb4aa8f
> --- /dev/null
> +++ b/drivers/media/platform/vimc/vimc-flash.c
> @@ -0,0 +1,173 @@
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
> +#include <linux/vmalloc.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-subdev.h>
> +
> +#include "vimc-common.h"
> +
> +struct vimc_fla_device {
> +	struct vimc_ent_device ved;
> +	struct v4l2_subdev sd;
> +	struct v4l2_ctrl_handler hdl;
> +	int led_mode;
> +	int indicator_intensity;
> +	int torch_intensity;
> +	int brightness;

Please call this flash_intensity or something like that. 'brightness'
is confusing since that's the name used for the CID_USER_BRIGHTNESS
control.

> +};
> +
> +static int vimc_fla_g_volatile_ctrl(struct v4l2_ctrl *c)
> +{
> +	struct vimc_fla_device *vfla =
> +		container_of(c->handler, struct vimc_fla_device, hdl);
> +
> +	switch (c->id) {
> +	case V4L2_CID_FLASH_TORCH_INTENSITY:
> +		return vfla->torch_intensity;
> +	case V4L2_CID_FLASH_INDICATOR_INTENSITY:
> +		return vfla->indicator_intensity;
> +	case V4L2_CID_FLASH_INTENSITY:
> +		return vfla->brightness;
> +	case V4L2_CID_FLASH_STROBE_STATUS:
> +	case V4L2_CID_FLASH_FAULT:
> +		return 0;
> +	default:
> +		return -EINVAL;
> +	}
> +}

Just drop this function. None of the controls are volatile, so by default
the control framework just returns the last set value, which is what you do
here.

> +
> +/* Flash Controls */
> +static const struct v4l2_ctrl_config vimc_fla_ctrl_class = {
> +	.flags = V4L2_CTRL_FLAG_READ_ONLY | V4L2_CTRL_FLAG_WRITE_ONLY,
> +	.id = VIMC_CID_VIMC_CLASS,
> +	.name = "VIMC Flash Controls",
> +	.type = V4L2_CTRL_TYPE_CTRL_CLASS,
> +};

Huh? Just drop this, this duplicates V4L2_CID_FLASH_CLASS which is added
automatically.

> +
> +static int vimc_fla_s_ctrl(struct v4l2_ctrl *c)
> +{
> +	struct vimc_fla_device *vfla =
> +		container_of(c->handler, struct vimc_fla_device, hdl);
> +
> +	switch (c->id) {
> +	case V4L2_CID_FLASH_LED_MODE:
> +		vfla->led_mode = c->val;
> +		return 0;
> +	case V4L2_CID_FLASH_STROBE_SOURCE:
> +		return 0;
> +	case V4L2_CID_FLASH_STROBE:
> +		return 0;
> +	case V4L2_CID_FLASH_STROBE_STOP:
> +		return 0;
> +	case V4L2_CID_FLASH_TIMEOUT:
> +		return 0;
> +	case V4L2_CID_FLASH_INTENSITY:
> +		vfla->brightness = c->val;
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
> +	.g_volatile_ctrl = vimc_fla_g_volatile_ctrl,
> +	.s_ctrl = vimc_fla_s_ctrl,
> +};
> +
> +/* initialize device */
> +static const struct v4l2_subdev_ops vimc_fla_ops = {
> +	.core = NULL,
> +};

You do need core events:

static const struct v4l2_subdev_core_ops vimc_fla_core_ops = {
        .subscribe_event = v4l2_ctrl_subdev_subscribe_event,
        .unsubscribe_event = v4l2_event_subdev_unsubscribe,
};

The reason for the compliance fail is that this is missing.

> +
> +int vimc_fla_add(struct vimc_device *vimc, struct vimc_ent_config *vcfg)
> +{
> +	struct v4l2_device *v4l2_dev = &vimc->v4l2_dev;
> +	struct vimc_fla_device *vfla;
> +	int ret;
> +
> +	/* Allocate the vfla struct */
> +	vfla = kzalloc(sizeof(*vfla), GFP_KERNEL);
> +	if (!vfla)
> +		return -ENOMEM;
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
> +			  V4L2_CID_FLASH_TIMEOUT, 1, 10, 1, 10);
> +	v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
> +			  V4L2_CID_FLASH_TORCH_INTENSITY, 0, 255, 1, 255);
> +	v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
> +			  V4L2_CID_FLASH_INTENSITY, 0, 255, 1, 255);
> +	v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
> +			  V4L2_CID_FLASH_INDICATOR_INTENSITY, 0, 255, 1, 255);
> +	v4l2_ctrl_new_std(&vfla->hdl, &vimc_fla_ctrl_ops,
> +			  V4L2_CID_FLASH_STROBE_STATUS, 0, 0, 0, 0);

It would be nice if this would actually reflect the actual strobe status.

There are more things that can be done to make this a more realistic module,
e.g. STROBE_FLASH can only be set if V4L2_CID_FLASH_LED_MODE is set to
V4L2_FLASH_LED_MODE_FLASH and V4L2_CID_FLASH_STROBE_SOURCE is set to
V4L2_FLASH_STROBE_SOURCE_SOFTWARE.

Regards,

	Hans

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
> +				   vcfg->name,
> +				   MEDIA_ENT_F_FLASH, 0, NULL,
> +				   NULL, &vimc_fla_ops);
> +	if (ret)
> +		goto err_free_hdl;
> +
> +	/* Initialize standard values */
> +	vfla->indicator_intensity = 0;
> +	vfla->torch_intensity = 0;
> +	vfla->brightness = 0;
> +	vfla->led_mode = V4L2_FLASH_LED_MODE_NONE;
> +
> +	vcfg->ved = &vfla->ved;
> +	return 0;
> +
> +err_free_hdl:
> +	v4l2_ctrl_handler_free(&vfla->hdl);
> +err_free_vfla:
> +	kfree(vfla);
> +
> +	return ret;
> +}
> +
> +void vimc_fla_rm(struct vimc_device *vimc, struct vimc_ent_config *vcfg)
> +{
> +	struct vimc_ent_device *ved = vcfg->ved;
> +	struct vimc_fla_device *vfla;
> +
> +	if (!ved)
> +		return;
> +
> +	vfla = container_of(ved, struct vimc_fla_device, ved);
> +	vimc_ent_sd_unregister(ved, &vfla->sd);
> +}
> 

