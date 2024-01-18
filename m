Return-Path: <linux-media+bounces-3841-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D27D831369
	for <lists+linux-media@lfdr.de>; Thu, 18 Jan 2024 08:56:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 872DF1F224D6
	for <lists+linux-media@lfdr.de>; Thu, 18 Jan 2024 07:56:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE3DFBE7F;
	Thu, 18 Jan 2024 07:56:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93DBFBE47;
	Thu, 18 Jan 2024 07:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705564571; cv=none; b=NbkCQLQJCkrfHC39hJ9/RJ2nbSrnLnAJxaADZeDohdVQOhEoVGGikrWSVBXvULIRxAhhs3Rm3EIwQYmT1OgQlTXsUWiSFxoJKt3conrD8LOG99iY6O+vj9uZe5mBEQ863b3WjlcQ0i+da6yw+X/A7Y4R+PBFam+yMf7QkAJ0Y7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705564571; c=relaxed/simple;
	bh=Um7Oz2Mk4LEeCzhV8GGeUHncNz93t7dxT0VISCZ3FpQ=;
	h=Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 Content-Language:To:Cc:References:From:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding; b=i2vDlRAy+7A6J8yeYxj+RgZS6rbvSYIFB9be0iBjT6DveylFi+OPMCf8l6jeb3K6cRurn0N6G65M6BZ5+P3+PEH2sOoZw/zg4uG+RV4kpZ6LSCFWVEmt2K3BW2kfT011O7zLiECRZ3Eg8IRZLpHDsIneaNomhw39JD3Cuq3di6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34CA6C433C7;
	Thu, 18 Jan 2024 07:56:07 +0000 (UTC)
Message-ID: <099df0d8-10c8-4a78-827b-7e000f02ca3f@xs4all.nl>
Date: Thu, 18 Jan 2024 08:56:05 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 15/15] media: vim2m-audio: add virtual driver for
 audio memory to memory
Content-Language: en-US, nl
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, sakari.ailus@iki.fi,
 tfiga@chromium.org, m.szyprowski@samsung.com, mchehab@kernel.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org
References: <1700637838-6743-1-git-send-email-shengjiu.wang@nxp.com>
 <1700637838-6743-16-git-send-email-shengjiu.wang@nxp.com>
 <6d96cf56-c534-4abf-8819-03cd32fda3d5@xs4all.nl>
 <CAA+D8ANfkQkuV9YgQQ1ggS2G0GhqvmhZrA6Yn-et0E5z6mPSxQ@mail.gmail.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <CAA+D8ANfkQkuV9YgQQ1ggS2G0GhqvmhZrA6Yn-et0E5z6mPSxQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/01/2024 07:13, Shengjiu Wang wrote:
> On Wed, Jan 17, 2024 at 6:32 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>
>> On 22/11/2023 08:23, Shengjiu Wang wrote:
>>> Audio memory to memory virtual driver use video memory to memory
>>> virtual driver vim2m.c as example. The main difference is
>>> device type is VFL_TYPE_AUDIO and device cap type is V4L2_CAP_AUDIO_M2M.
>>>
>>> The device_run function is a dummy function, which is simply
>>> copy the data from input buffer to output buffer.
>>>
>>> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
>>> ---
>>>  drivers/media/test-drivers/Kconfig       |  11 +
>>>  drivers/media/test-drivers/Makefile      |   1 +
>>>  drivers/media/test-drivers/vim2m-audio.c | 799 +++++++++++++++++++++++
>>>  3 files changed, 811 insertions(+)
>>>  create mode 100644 drivers/media/test-drivers/vim2m-audio.c
>>>
>>> diff --git a/drivers/media/test-drivers/Kconfig b/drivers/media/test-drivers/Kconfig
>>> index 459b433e9fae..55f8af6ee4e2 100644
>>> --- a/drivers/media/test-drivers/Kconfig
>>> +++ b/drivers/media/test-drivers/Kconfig
>>> @@ -17,6 +17,17 @@ config VIDEO_VIM2M
>>>         This is a virtual test device for the memory-to-memory driver
>>>         framework.
>>>
>>> +config VIDEO_VIM2M_AUDIO
>>> +     tristate "Virtual Memory-to-Memory Driver For Audio"
>>> +     depends on VIDEO_DEV
>>> +     select VIDEOBUF2_VMALLOC
>>> +     select V4L2_MEM2MEM_DEV
>>> +     select MEDIA_CONTROLLER
>>> +     select MEDIA_CONTROLLER_REQUEST_API
>>
>> Drop this. This option has been removed.
>>
>>> +     help
>>> +       This is a virtual audio test device for the memory-to-memory driver
>>> +       framework.
>>> +
>>>  source "drivers/media/test-drivers/vicodec/Kconfig"
>>>  source "drivers/media/test-drivers/vimc/Kconfig"
>>>  source "drivers/media/test-drivers/vivid/Kconfig"
>>> diff --git a/drivers/media/test-drivers/Makefile b/drivers/media/test-drivers/Makefile
>>> index 740714a4584d..0c61c9ada3e1 100644
>>> --- a/drivers/media/test-drivers/Makefile
>>> +++ b/drivers/media/test-drivers/Makefile
>>> @@ -10,6 +10,7 @@ obj-$(CONFIG_DVB_VIDTV) += vidtv/
>>>
>>>  obj-$(CONFIG_VIDEO_VICODEC) += vicodec/
>>>  obj-$(CONFIG_VIDEO_VIM2M) += vim2m.o
>>> +obj-$(CONFIG_VIDEO_VIM2M_AUDIO) += vim2m-audio.o
>>>  obj-$(CONFIG_VIDEO_VIMC) += vimc/
>>>  obj-$(CONFIG_VIDEO_VIVID) += vivid/
>>>  obj-$(CONFIG_VIDEO_VISL) += visl/
>>> diff --git a/drivers/media/test-drivers/vim2m-audio.c b/drivers/media/test-drivers/vim2m-audio.c
>>> new file mode 100644
>>> index 000000000000..72806ada8628
>>> --- /dev/null
>>> +++ b/drivers/media/test-drivers/vim2m-audio.c
>>> @@ -0,0 +1,799 @@
>>> +// SPDX-License-Identifier: GPL-2.0+
>>> +/*
>>> + * A virtual v4l2-mem2mem example for audio device.
>>> + */
>>> +
>>> +#include <linux/module.h>
>>> +#include <linux/delay.h>
>>> +#include <linux/fs.h>
>>> +#include <linux/sched.h>
>>> +#include <linux/slab.h>
>>> +
>>> +#include <linux/platform_device.h>
>>> +#include <media/v4l2-mem2mem.h>
>>> +#include <media/v4l2-device.h>
>>> +#include <media/v4l2-ioctl.h>
>>> +#include <media/v4l2-ctrls.h>
>>> +#include <media/v4l2-event.h>
>>> +#include <media/videobuf2-vmalloc.h>
>>> +#include <sound/dmaengine_pcm.h>
>>> +
>>> +MODULE_DESCRIPTION("Virtual device for audio mem2mem testing");
>>> +MODULE_LICENSE("GPL");
>>> +
>>> +static unsigned int debug;
>>> +module_param(debug, uint, 0644);
>>> +MODULE_PARM_DESC(debug, "debug level");
>>> +
>>> +#define MEM2MEM_NAME "vim2m-audio"
>>> +
>>> +#define dprintk(dev, lvl, fmt, arg...) \
>>> +     v4l2_dbg(lvl, debug, &(dev)->v4l2_dev, "%s: " fmt, __func__, ## arg)
>>> +
>>> +#define SAMPLE_NUM 4096
>>> +
>>> +static void audm2m_dev_release(struct device *dev)
>>> +{}
>>> +
>>> +static struct platform_device audm2m_pdev = {
>>> +     .name           = MEM2MEM_NAME,
>>> +     .dev.release    = audm2m_dev_release,
>>> +};
>>> +
>>> +static u32 formats[] = {
>>> +     V4L2_AUDIO_FMT_S16_LE,
>>> +};
>>> +
>>> +#define NUM_FORMATS ARRAY_SIZE(formats)
>>> +
>>> +/* Per-queue, driver-specific private data */
>>> +struct audm2m_q_data {
>>> +     unsigned int            rate;
>>> +     unsigned int            channels;
>>> +     unsigned int            buffersize;
>>> +     unsigned int            sequence;
>>> +     u32                     fourcc;
>>> +};
>>> +
>>> +enum {
>>> +     V4L2_M2M_SRC = 0,
>>> +     V4L2_M2M_DST = 1,
>>> +};
>>> +
>>> +static snd_pcm_format_t find_format(u32 fourcc)
>>> +{
>>> +     snd_pcm_format_t fmt;
>>> +     unsigned int k;
>>> +
>>> +     for (k = 0; k < NUM_FORMATS; k++) {
>>> +             if (formats[k] == fourcc)
>>> +                     break;
>>> +     }
>>> +
>>> +     if (k == NUM_FORMATS)
>>> +             return 0;
>>> +
>>> +     fmt = v4l2_fourcc_to_audfmt(formats[k]);
>>> +
>>> +     return fmt;
>>> +}
>>> +
>>> +struct audm2m_dev {
>>> +     struct v4l2_device      v4l2_dev;
>>> +     struct video_device     vfd;
>>> +
>>> +     struct mutex            dev_mutex;
>>> +
>>> +     struct v4l2_m2m_dev     *m2m_dev;
>>> +#ifdef CONFIG_MEDIA_CONTROLLER
>>> +     struct media_device     mdev;
>>> +#endif
>>> +};
>>> +
>>> +struct audm2m_ctx {
>>> +     struct v4l2_fh          fh;
>>> +     struct v4l2_ctrl_handler        ctrl_handler;
>>> +     struct audm2m_dev       *dev;
>>> +
>>> +     struct mutex            vb_mutex;
>>> +
>>> +     /* Source and destination queue data */
>>> +     struct audm2m_q_data   q_data[2];
>>> +};
>>> +
>>> +static inline struct audm2m_ctx *file2ctx(struct file *file)
>>> +{
>>> +     return container_of(file->private_data, struct audm2m_ctx, fh);
>>> +}
>>> +
>>> +static struct audm2m_q_data *get_q_data(struct audm2m_ctx *ctx,
>>> +                                     enum v4l2_buf_type type)
>>> +{
>>> +     if (type == V4L2_BUF_TYPE_AUDIO_OUTPUT)
>>> +             return &ctx->q_data[V4L2_M2M_SRC];
>>> +     return &ctx->q_data[V4L2_M2M_DST];
>>> +}
>>> +
>>> +static const char *type_name(enum v4l2_buf_type type)
>>> +{
>>> +     if (type == V4L2_BUF_TYPE_AUDIO_OUTPUT)
>>> +             return "Output";
>>> +     return "Capture";
>>> +}
>>> +
>>> +/*
>>> + * mem2mem callbacks
>>> + */
>>> +
>>> +/*
>>> + * device_run() - prepares and starts the device
>>> + */
>>> +static void device_run(void *priv)
>>> +{
>>> +     struct audm2m_ctx *ctx = priv;
>>> +     struct audm2m_dev *audm2m_dev;
>>> +     struct vb2_v4l2_buffer *src_buf, *dst_buf;
>>> +     struct audm2m_q_data *q_data_src, *q_data_dst;
>>> +     int src_size, dst_size = 0;
>>> +     short *src_addr, *dst_addr;
>>> +     int i;
>>> +
>>> +     audm2m_dev = ctx->dev;
>>> +
>>> +     q_data_src = get_q_data(ctx, V4L2_BUF_TYPE_AUDIO_OUTPUT);
>>> +     if (!q_data_src)
>>> +             return;
>>> +
>>> +     q_data_dst = get_q_data(ctx, V4L2_BUF_TYPE_AUDIO_CAPTURE);
>>> +     if (!q_data_dst)
>>> +             return;
>>> +
>>> +     src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
>>> +     dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
>>> +     src_buf->sequence = q_data_src->sequence++;
>>> +     dst_buf->sequence = q_data_dst->sequence++;
>>> +     v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, false);
>>> +
>>> +     /* Process the conversion */
>>> +     src_size = vb2_get_plane_payload(&src_buf->vb2_buf, 0);
>>> +
>>> +     src_addr = vb2_plane_vaddr(&src_buf->vb2_buf, 0);
>>> +     dst_addr = vb2_plane_vaddr(&dst_buf->vb2_buf, 0);
>>> +
>>> +     if (q_data_src->rate == q_data_dst->rate) {
>>> +             memcpy(dst_addr, src_addr, src_size);
>>> +             dst_size = src_size;
>>> +     } else if (q_data_src->rate == 2 * q_data_dst->rate) {
>>> +             /* 8k to 16k */
>>> +             for (i = 0; i < src_size / 2; i++) {
>>> +                     *dst_addr++ = *src_addr++;
>>> +                     src_addr++;
>>> +             }
>>> +
>>> +             dst_size = src_size / 2;
>>> +     } else if (q_data_src->rate * 2 == q_data_dst->rate) {
>>> +             /* 16k to 8k */
>>> +             for (i = 0; i < src_size / 2; i++) {
>>> +                     *dst_addr++ = *src_addr;
>>> +                     *dst_addr++ = *src_addr++;
>>> +             }
>>> +
>>> +             dst_size = src_size * 2;
>>> +     }
>>> +
>>> +     vb2_set_plane_payload(&dst_buf->vb2_buf, 0, dst_size);
>>> +
>>> +     src_buf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
>>> +     dst_buf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
>>> +
>>> +     v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_DONE);
>>> +     v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_DONE);
>>> +     v4l2_m2m_job_finish(audm2m_dev->m2m_dev, ctx->fh.m2m_ctx);
>>> +}
>>> +
>>> +static int audm2m_querycap(struct file *file, void *priv,
>>> +                        struct v4l2_capability *cap)
>>> +{
>>> +     strscpy(cap->driver, MEM2MEM_NAME, sizeof(cap->driver));
>>> +     strscpy(cap->card, MEM2MEM_NAME, sizeof(cap->card));
>>> +     snprintf(cap->bus_info, sizeof(cap->bus_info),
>>> +              "platform:%s", MEM2MEM_NAME);
>>
>> You can drop this bus_info line, it's filled in for you.
> 
> I see there is a warning from v4l2-compliance test if this line is removed.
> 
> warn: v4l2-compliance.cpp(676): media bus_info 'platform:vim2m-audio'
> differs from V4L2 bus_info 'platform:vim2m-audio.0'

You should also drop the line filling in the bus_info in the media device:

<snip>


>>> +static int audm2m_probe(struct platform_device *pdev)
>>> +{

<snip>

>>> +#ifdef CONFIG_MEDIA_CONTROLLER
>>> +     dev->mdev.dev = &pdev->dev;
>>> +     strscpy(dev->mdev.model, MEM2MEM_NAME, sizeof(dev->mdev.model));
>>> +     snprintf(dev->mdev.bus_info, sizeof(dev->mdev.bus_info),
>>> +              "platform:%s", MEM2MEM_NAME);

Drop this line.

>>> +     media_device_init(&dev->mdev);

This function will fill it in automatically as well, and with the same
name as querycap.

Regards,

	Hans

>>> +     dev->mdev.ops = &audm2m_media_ops;
>>> +     dev->v4l2_dev.mdev = &dev->mdev;
>>> +#endif
>>> +
>>> +     ret = video_register_device(vfd, VFL_TYPE_AUDIO, 0);
>>> +     if (ret) {
>>> +             v4l2_err(&dev->v4l2_dev, "Failed to register video device\n");
>>> +             goto error_m2m;
>>> +     }
>>> +
>>> +#ifdef CONFIG_MEDIA_CONTROLLER
>>> +     ret = v4l2_m2m_register_media_controller(dev->m2m_dev, vfd,
>>> +                                              MEDIA_ENT_F_PROC_AUDIO_RESAMPLER);
>>> +     if (ret) {
>>> +             v4l2_err(&dev->v4l2_dev, "Failed to init mem2mem media controller\n");
>>> +             goto error_v4l2;
>>> +     }
>>> +
>>> +     ret = media_device_register(&dev->mdev);
>>> +     if (ret) {
>>> +             v4l2_err(&dev->v4l2_dev, "Failed to register mem2mem media device\n");
>>> +             goto error_m2m_mc;
>>> +     }
>>> +#endif
>>> +
>>> +     v4l2_info(&dev->v4l2_dev,
>>> +               "Device registered as /dev/v4l-audio%d\n", vfd->num);
>>> +
>>> +     return 0;
>>> +
>>> +#ifdef CONFIG_MEDIA_CONTROLLER
>>> +error_m2m_mc:
>>> +     v4l2_m2m_unregister_media_controller(dev->m2m_dev);
>>> +#endif
>>> +error_v4l2:
>>> +     video_unregister_device(&dev->vfd);
>>> +     /* audm2m_device_release called by video_unregister_device to release various objects */
>>> +     return ret;
>>> +error_m2m:
>>> +     v4l2_m2m_release(dev->m2m_dev);
>>> +error_dev:
>>> +     v4l2_device_unregister(&dev->v4l2_dev);
>>> +error_free:
>>> +     kfree(dev);
>>> +
>>> +     return ret;
>>> +}
>>> +
>>> +static void audm2m_remove(struct platform_device *pdev)
>>> +{
>>> +     struct audm2m_dev *dev = platform_get_drvdata(pdev);
>>> +
>>> +     v4l2_info(&dev->v4l2_dev, "Removing " MEM2MEM_NAME);
>>> +
>>> +#ifdef CONFIG_MEDIA_CONTROLLER
>>> +     media_device_unregister(&dev->mdev);
>>> +     v4l2_m2m_unregister_media_controller(dev->m2m_dev);
>>> +#endif
>>> +     video_unregister_device(&dev->vfd);
>>> +}
>>> +
>>> +static struct platform_driver audm2m_pdrv = {
>>> +     .probe          = audm2m_probe,
>>> +     .remove_new     = audm2m_remove,
>>> +     .driver         = {
>>> +             .name   = MEM2MEM_NAME,
>>> +     },
>>> +};
>>> +
>>> +static void __exit audm2m_exit(void)
>>> +{
>>> +     platform_driver_unregister(&audm2m_pdrv);
>>> +     platform_device_unregister(&audm2m_pdev);
>>> +}
>>> +
>>> +static int __init audm2m_init(void)
>>> +{
>>> +     int ret;
>>> +
>>> +     ret = platform_device_register(&audm2m_pdev);
>>> +     if (ret)
>>> +             return ret;
>>> +
>>> +     ret = platform_driver_register(&audm2m_pdrv);
>>> +     if (ret)
>>> +             platform_device_unregister(&audm2m_pdev);
>>> +
>>> +     return ret;
>>> +}
>>> +
>>> +module_init(audm2m_init);
>>> +module_exit(audm2m_exit);
>>
>> Regards,
>>
>>         Hans


