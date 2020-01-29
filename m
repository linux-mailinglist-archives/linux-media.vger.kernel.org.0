Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 629B514D07F
	for <lists+linux-media@lfdr.de>; Wed, 29 Jan 2020 19:30:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727484AbgA2SaJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jan 2020 13:30:09 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:60770 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726560AbgA2SaI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jan 2020 13:30:08 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 1CE3629423D
Subject: Re: [RFC PATCH v1 4/5] media: tegra: Add Tegra Video input driver for
 Tegra210
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1580235801-4129-1-git-send-email-skomatineni@nvidia.com>
 <1580235801-4129-5-git-send-email-skomatineni@nvidia.com>
 <3cdea635-a9ca-7b9c-3c99-8f489f4d669a@collabora.com>
 <162488d0-4e74-963a-3366-e4c1f7cf04ca@nvidia.com>
 <017ca95e-7dd3-2d04-8d84-9047ac4e548b@nvidia.com>
 <655b9a64-10d7-3fd3-f443-babf33e67b62@collabora.com>
 <7265b661-de5a-b0f0-bcdc-1a1d2c03fe57@nvidia.com>
 <4b443e7c-0866-ceea-938c-8ab71959fc89@collabora.com>
 <b1e7168a-1f6f-c6bf-6320-7a6ee51880be@nvidia.com>
From:   Helen Koike <helen.koike@collabora.com>
Autocrypt: addr=helen.koike@collabora.com; keydata=
 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
Message-ID: <d9401e75-5876-50df-46b7-48c7509d322f@collabora.com>
Date:   Wed, 29 Jan 2020 15:29:56 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <b1e7168a-1f6f-c6bf-6320-7a6ee51880be@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 1/29/20 3:49 PM, Sowjanya Komatineni wrote:
> 
> On 1/29/20 2:31 AM, Helen Koike wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> On 1/29/20 12:11 AM, Sowjanya Komatineni wrote:
>>> On 1/28/20 5:05 PM, Helen Koike wrote:
>>>> External email: Use caution opening links or attachments
>>>>
>>>>
>>>> On 1/28/20 10:49 PM, Sowjanya Komatineni wrote:
>>>>> On 1/28/20 2:13 PM, Sowjanya Komatineni wrote:
>>>>>> On 1/28/20 1:45 PM, Helen Koike wrote:
>>>>>>> External email: Use caution opening links or attachments
>>>>>>>
>>>>>>>
>>>>>>> Hi Sowjanya,
>>>>>>>
>>>>>>> I just took a really quick look, I didn't check the driver in deep, so just some small comments below.
>>>>>>>
>>>>>>> On 1/28/20 4:23 PM, Sowjanya Komatineni wrote:
>>>>>>>> Tegra210 contains a powerful Video Input (VI) hardware controller
>>>>>>>> which can support up to 6 MIPI CSI camera sensors.
>>>>>>>>
>>>>>>>> Each Tegra CSI port can be one-to-one mapped to VI channel and can
>>>>>>>> capture from an external camera sensor connected to CSI or from
>>>>>>>> built-in test pattern generator.
>>>>>>>>
>>>>>>>> Tegra210 supports built-in test pattern generator from CSI to VI.
>>>>>>>>
>>>>>>>> This patch adds a V4L2 media controller and capture driver support
>>>>>>>> for Tegra210 built-in CSI to VI test pattern generator.
>>>>>>>>
>>>>>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>>>>> Could you send us the output of media-ctl --print-dot ? So we can view the media topology easily?
>>>>>> root@tegra-ubuntu:/home/ubuntu# ./media-ctl --print-dot
>>>>>> digraph board {
>>>>>>           rankdir=TB
>>>>>>           n00000001 [label="54080000.vi-output-0\n/dev/video0", shape=box, style=filled, fillcolor=yellow]
>>>>>>           n00000005 [label="54080000.vi-output-1\n/dev/video1", shape=box, style=filled, fillcolor=yellow]
>>>>>>           n00000009 [label="54080000.vi-output-2\n/dev/video2", shape=box, style=filled, fillcolor=yellow]
>>>>>>           n0000000d [label="54080000.vi-output-3\n/dev/video3", shape=box, style=filled, fillcolor=yellow]
>>>>>>           n00000011 [label="54080000.vi-output-4\n/dev/video4", shape=box, style=filled, fillcolor=yellow]
>>>>>>           n00000015 [label="54080000.vi-output-5\n/dev/video5", shape=box, style=filled, fillcolor=yellow]
>>>>>>           n00000019 [label="{{} | tpg-0 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
>>>>>>           n00000019:port0 -> n00000001
>>>>>>           n0000001d [label="{{} | tpg-1 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
>>>>>>           n0000001d:port0 -> n00000005
>>>>>>           n00000021 [label="{{} | tpg-2 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
>>>>>>           n00000021:port0 -> n00000009
>>>>>>           n00000025 [label="{{} | tpg-3 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
>>>>>>           n00000025:port0 -> n0000000d
>>>>>>           n00000029 [label="{{} | tpg-4 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
>>>>>>           n00000029:port0 -> n00000011
>>>>>>           n0000002d [label="{{} | tpg-5 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
>>>>>>           n0000002d:port0 -> n00000015
>>>>>> }
>>>>>>
>>>>>>>> --- diff --git a/drivers/staging/media/tegra/host1x-video.h b/drivers/staging/media/tegra/host1x-video.h
>>>>>>>> new file mode 100644
>>>>>>>> index 000000000000..84d28e6f4362
>>>>>>>> --- /dev/null
>>>>>>>> +++ b/drivers/staging/media/tegra/host1x-video.h
>>>>>>>> @@ -0,0 +1,33 @@
>>>>>>>> +// SPDX-License-Identifier: GPL-2.0-only
>>>>>>>> +/*
>>>>>>>> + * Copyright (C) 2020 NVIDIA CORPORATION.  All rights reserved.
>>>>>>>> + */
>>>>>>>> +
>>>>>>>> +#ifndef HOST1X_VIDEO_H
>>>>>>>> +#define HOST1X_VIDEO_H 1
>>>>>>>> +
>>>>>>>> +#include <linux/host1x.h>
>>>>>>>> +
>>>>>>>> +#include <media/media-device.h>
>>>>>>>> +#include <media/media-entity.h>
>>>>>>>> +#include <media/v4l2-async.h>
>>>>>>>> +#include <media/v4l2-ctrls.h>
>>>>>>>> +#include <media/v4l2-device.h>
>>>>>>>> +#include <media/v4l2-dev.h>
>>>>>>>> +#include <media/videobuf2-v4l2.h>
>>>>>>>> +
>>>>>>>> +#include "tegra-vi.h"
>>>>>>>> +#include "csi.h"
>>>>>>>> +
>>>>>>>> +struct tegra_camera {
>>>>>>>> +     struct v4l2_device v4l2_dev;
>>>>>>>> +     struct media_device media_dev;
>>>>>>>> +     struct device *dev;
>>>>>>> You can use cam->media_dev.dev instead of having this pointer.
>>>>>>>
>>>>> Will fix in v2
>>>>>>>> +     struct tegra_vi *vi;
>>>>>>>> +     struct tegra_csi_device *csi;
>>>>>>>> +};
>>>>>>>> +
>>>>>>>> +
>>>>>>>> +#define to_tegra_channel(vdev) \
>>>>>>>> +     container_of(vdev, struct tegra_channel, video)
>>>>>>> Why not inline instead of define. Inlines has the advantage of checking types.
>>>>> Will change in v2
>>>>>>>> +static int __tegra_channel_try_format(struct tegra_channel *chan,
>>>>>>>> +                                   struct v4l2_pix_format *pix,
>>>>>>>> +                                   const struct tegra_video_format **vfmt)
>>>>>>>> +{
>>>>>>>> +     const struct tegra_video_format *fmt_info;
>>>>>>>> +     struct v4l2_subdev *subdev;
>>>>>>>> +     struct v4l2_subdev_format fmt;
>>>>>>>> +     struct v4l2_subdev_pad_config *pad_cfg;
>>>>>>>> +
>>>>>>>> +     subdev = tegra_channel_get_remote_subdev(chan);
>>>>>>>> +     pad_cfg = v4l2_subdev_alloc_pad_config(subdev);
>>>>>>>> +     if (!pad_cfg)
>>>>>>>> +             return -ENOMEM;
>>>>>>>> +
>>>>>>>> +     /*
>>>>>>>> +      * Retrieve format information and select the default format if the
>>>>>>>> +      * requested format isn't supported.
>>>>>>>> +      */
>>>>>>>> +     fmt_info = tegra_core_get_format_by_fourcc(chan, pix->pixelformat);
>>>>>>>> +     if (!fmt_info) {
>>>>>>>> +             pix->pixelformat = chan->format.pixelformat;
>>>>>>>> +             pix->colorspace = chan->format.colorspace;
>>>>>>>> +             fmt_info = tegra_core_get_format_by_fourcc(chan,
>>>>>>>> + pix->pixelformat);
>>>>>>>> +     }
>>>>>>>> +
>>>>>>>> +     /* Change this when start adding interlace format support */
>>>>>>>> +     pix->field = V4L2_FIELD_NONE;
>>>>>>>> +     fmt.which = V4L2_SUBDEV_FORMAT_TRY;
>>>>>>>> +     fmt.pad = 0;
>>>>>>>> +     v4l2_fill_mbus_format(&fmt.format, pix, fmt_info->code);
>>>>>>>> +     v4l2_subdev_call(subdev, pad, set_fmt, pad_cfg, &fmt);
>>>>>>> As fas as I understand, entities formats should be independent, it is up to link_validate
>>>>>>> to check formats between entities.
>>>>>>> The capture shouldn't change the format of the subdevice.
>>>>>>>
>>>>> Tegra Built-in TPG on CSI accepts specific TPG sizes and CSI is source and VI is sink.
>>>>>
>>>>> link validation happens only for sink ends of the link.
>>>> And what is the problem with it being on the sink end?
>>>> You just need to implement custom link validation in tegra_csi_media_ops that also checks the format
>>>> between the capture and the subdevice, no? Unless I missunderstood something here (which is quite possible).
>>>>
>>>> Examples:
>>>> drivers/staging/media/rkisp1/rkisp1-capture.c - rkisp1_capture_link_validate()
>>>> drivers/media/pci/intel/ipu3/ipu3-cio2.c - cio2_video_link_validate()
>>>> drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c - sun6i_video_link_validate()
>>>>
>>>> Regards,
>>>> Helen
>>>>
>>> But if we move subdevice side format/size check into its link_validation, any incorrect image size set thru set-fmt-video will be taken and get-fmt-video will also show same as it doesn't validate formats/sizes supported by CSI subdev during this time. link validation happens during pipeline start. So thought to prevent accepting incorrect format/size during set-fmt-video/get-fmt-video.
>> This is how media API is designed, formats shouldn't propagate between entities, it is up to userspace to configure pads
>> correctly. And if formats of the pads don't match, stream fails during pipeline start, and userspace receive -EPIPE error.
>>
>> According to the docs: https://linuxtv.org/downloads/v4l-dvb-apis/uapi/v4l/dev-subdev.html
>>
>> "Formats are not propagated across links, as that would involve propagating them from one sub-device file handle to another. Applications must then take care to configure both ends of every link explicitly with compatible formats. Identical formats on the two ends of a link are guaranteed to be compatible. Drivers are free to accept different formats matching device requirements as being compatible."
>>
>> Perhaps you want to add support of this driver in libcamera.org to make it easier to userspace.
>>
>> Regards,
>> Helen
> 
> I see in doc, Format Negotiation says drivers can propagate formats inside sub-devices. When try/active format is set on pad, corresponding format on other pads of same subdevice can be modified by the driver as long as formats are propagated from Sink pads to source pads.
> 
> When application configures front-end sink pad format, driver can propagate the format to front-end source pad.

Yes, the doc says that "Drivers automatically propagate formats **inside** sub-devices", not between subdevices.

So, when a subdevice has a sink pad and a source pad, if user changes the format of the sink pad, the changes
are indeed propagated to the source pad, but not between different subdevices.

> 
> VI is Sink and CSI is source subdev here for TPG.

Vi and TPG are different entities, so you shouldn't propagate between them.

Regards,
Helen

> 
> Currently set_fmt/get_fmt from vi channel invokes Source subdevice set_fmt/get_fmt which is CSI in this case of TPG.
> 
>>> Other than this I don't see any issue moving it to link_validation.
>>>
>>>
>>>>> So with CSI subdev set_fmt sets width/height to default incase if width/height is not from one of the supported sizes.
>>>>>
>>>>>>>> +
>>>>>>>> +     v4l2_fill_pix_format(pix, &fmt.format);
>>>>>>>> +     tegra_channel_fmt_align(chan, &fmt_info->bpp, &pix->width, &pix->height,
>>>>>>>> +                             &pix->bytesperline);
>>>>>>>> +     pix->sizeimage = pix->bytesperline * pix->height;
>>>>>>>> +
>>>>>>>> +     if (vfmt)
>>>>>>>> +             *vfmt = fmt_info;
>>>>>>>> +
>>>>>>>> +     v4l2_subdev_free_pad_config(pad_cfg);
>>>>>>>> +
>>>>>>>> +     return 0;
>>>>>>>> +}
>>>>>>>> +
>>>>>>>> +static int tegra_channel_try_format(struct file *file, void *fh,
>>>>>>>> +                                 struct v4l2_format *format)
>>>>>>>> +{
>>>>>>>> +     struct v4l2_fh *vfh = file->private_data;
>>>>>>>> +     struct tegra_channel *chan = to_tegra_channel(vfh->vdev);
>>>>>>>> +
>>>>>>>> +     return __tegra_channel_try_format(chan, &format->fmt.pix, NULL);
>>>>>>>> +}
>>>>>>>> +
>>>>>>>> +static int tegra_channel_set_format(struct file *file, void *fh,
>>>>>>>> +                                 struct v4l2_format *format)
>>>>>>>> +{
>>>>>>>> +     struct v4l2_fh *vfh = file->private_data;
>>>>>>>> +     struct tegra_channel *chan = to_tegra_channel(vfh->vdev);
>>>>>>>> +     const struct tegra_video_format *info;
>>>>>>>> +     int ret;
>>>>>>>> +     struct v4l2_subdev_format fmt;
>>>>>>>> +     struct v4l2_subdev *subdev;
>>>>>>>> +     struct v4l2_pix_format *pix = &format->fmt.pix;
>>>>>>>> +
>>>>>>>> +     if (vb2_is_busy(&chan->queue))
>>>>>>>> +             return -EBUSY;
>>>>>>>> +
>>>>>>>> +     /* get supported format by try_fmt */
>>>>>>>> +     ret = __tegra_channel_try_format(chan, pix, &info);
>>>>>>>> +     if (ret)
>>>>>>>> +             return ret;
>>>>>>>> +
>>>>>>>> +     subdev = tegra_channel_get_remote_subdev(chan);
>>>>>>>> +
>>>>>>>> +     fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
>>>>>>>> +     fmt.pad = 0;
>>>>>>>> +     v4l2_fill_mbus_format(&fmt.format, pix, info->code);
>>>>>>>> +     v4l2_subdev_call(subdev, pad, set_fmt, NULL, &fmt);
>>>>>>> same here.
>>>>>>>
>>>>> Calling subdev set_fmt here for the same reason as explained above.
>>>>>>>> +
>>>>>>>> +     v4l2_fill_pix_format(pix, &fmt.format);
>>>>>>>> +     chan->format = *pix;
>>>>>>>> +     chan->fmtinfo = info;
>>>>>>>> +     tegra_channel_update_format(chan, pix->width,
>>>>>>>> +                                 pix->height, info->fourcc,
>>>>>>>> +                                 &info->bpp,
>>>>>>>> +                                 pix->bytesperline);
>>>>>>>> +     *pix = chan->format;
>>>>>>>> +
>>>>>>>> +     return 0;
>>>>>>>> +}
>>>>>>>> +
>>>>>>>> +static int tegra_channel_enum_input(struct file *file, void *fh,
>>>>>>>> +                                 struct v4l2_input *inp)
>>>>>>>> +{
>>>>>>>> +     /* Currently driver supports internal TPG only */
>>>>>>>> +     if (inp->index != 0)
>>>>>>> just
>>>>>>> if (inp->index)
>>>>>>>
>>>>> Will update in v2
>>>>>>>> +             return -EINVAL;
>>>>>>>> +
>>>>>>>> +     inp->type = V4L2_INPUT_TYPE_CAMERA;
>>>>>>>> +     strscpy(inp->name, "Tegra TPG", sizeof(inp->name));
>>>>>>>> +
>>>>>>>> +     return 0;
>>>>>>>> +}
>>>>>>>> +static const struct tegra_video_format tegra_default_format = {
>>>>>>>> +     /* RAW 10 */
>>>>>>>> +     TEGRA_VF_RAW10,
>>>>>>>> +     10,
>>>>>>>> +     MEDIA_BUS_FMT_SRGGB10_1X10,
>>>>>>>> +     {2, 1},
>>>>>>>> +     TEGRA_IMAGE_FORMAT_DEF,
>>>>>>>> +     TEGRA_IMAGE_DT_RAW10,
>>>>>>>> +     V4L2_PIX_FMT_SRGGB10,
>>>>>>>> +     "RGRG.. GBGB..",
>>>>>>> It would be more readable to do:
>>>>>>>
>>>>>>> .code = TEGRA_VF_RAW10,
>>>>>>> .width = 10,
>>>>>>> .code = MEDIA_BUS_FMT_SRGGB10_1X10,
>>>>>>>
>>>>>>> and so on
>>>>> Will update in v2
>>>>>>>> +};
>>>>>>>> +
>>>>>>>> +/*
>>>>>>>> + * Helper functions
>>>>>>>> + */
>>>>>>>> +
>>>>>>>> +/**
>>>>>>>> + * tegra_core_get_default_format - Get default format
>>>>>>>> + *
>>>>>>>> + * Return: pointer to the format where the default format needs
>>>>>>>> + * to be filled in.
>>>>>>>> + */
>>>>>>>> +const struct tegra_video_format *tegra_core_get_default_format(void)
>>>>>>>> +{
>>>>>>>> +     return &tegra_default_format;
>>>>>>>> +}
>>>>>>> This is only used in tegra-channel.c, why not to declare it there as static?
>>>>>>>
>>>>> Will move all video format retrieval helper functions to corresponding file as static in v2
>>>>>>>> + +static struct v4l2_frmsize_discrete tegra_csi_tpg_sizes[] = {
>>>>>>>> +     {1280, 720},
>>>>>>>> +     {1920, 1080},
>>>>>>>> +     {3840, 2160},
>>>>>>>> +};
>>>>>>>> +
>>>>>>>> +/*
>>>>>>>> + * V4L2 Subdevice Pad Operations
>>>>>>>> + */
>>>>>>>> +static int tegra_csi_get_format(struct v4l2_subdev *subdev,
>>>>>>>> +                             struct v4l2_subdev_pad_config *cfg,
>>>>>>>> +                             struct v4l2_subdev_format *fmt)
>>>>>>>> +{
>>>>>>>> +     struct tegra_csi_channel *csi_chan = to_csi_chan(subdev);
>>>>>>>> +
>>>>>>>> +     mutex_lock(&csi_chan->format_lock);
>>>>>>> Do you need this lock? I think there is already a serialization in the ioctls in place (to be confirmed).
>>>>>>>
>>>>> This is on CSI v4l2 subdevice side during format updates
>>>>>>>> +     memcpy(fmt, &csi_chan->ports->format,
>>>>>>>> +            sizeof(struct v4l2_mbus_framefmt));
>>>>>>> I would prefer just:
>>>>>>> *fmt = *csi_chan->ports->format;
>>>>>>>
>>>>>>> I think it is easier to read IMHO.
>>>>>>> same in tegra_csi_set_format().
>>>>>>>
>>>>> Will fix in v2
>>>>>>>> + mutex_unlock(&csi_chan->format_lock);
>>>>>>>> +
>>>>>>>> +     return 0;
>>>>>>>> +}
>>>>>>>> +
>>>>>>>> +static void tegra_csi_try_mbus_fmt(struct v4l2_subdev *subdev,
>>>>>>>> +                                struct v4l2_mbus_framefmt *mfmt)
>>>>>>>> +{
>>>>>>>> +     struct tegra_csi_channel *csi_chan = to_csi_chan(subdev);
>>>>>>>> +     struct tegra_csi_device *csi = csi_chan->csi;
>>>>>>>> +     const struct v4l2_frmsize_discrete *sizes;
>>>>>>>> +     int i, j;
>>>>>>> unsigned
>>>>>>>
>>>>> Will fix in v2
>>>>>>>> +
>>>>>>>> +     for (i = 0; i < ARRAY_SIZE(tegra_csi_tpg_fmts); i++) {
>>>>>>>> +             struct v4l2_mbus_framefmt *mbus_fmt = &tegra_csi_tpg_fmts[i];
>>>>>>>> +
>>>>>>>> +             if (mfmt->code == mbus_fmt->code) {
>>>>>>>> +                     for (j = 0; j < ARRAY_SIZE(tegra_csi_tpg_sizes); j++) {
>>>>>>>> +                             sizes = &tegra_csi_tpg_sizes[j];
>>>>>>>> +                             if (mfmt->width == sizes->width &&
>>>>>>>> +                                 mfmt->height == sizes->height) {
>>>>>>>> +                                     return;
>>>>>>>> +                             }
>>>>>>>> +                     }
>>>>>>>> +             }
>>>>>>>> +
>>>>>>>> +             dev_info(csi->dev, "using Tegra default RAW10 video format\n");
>>>>>>>> +     }
>>>>>>>> +
>>>>>>>> +     dev_info(csi->dev, "using Tegra default WIDTH X HEIGHT (1920x1080)\n");
>>>>>>>> +     memcpy(mfmt, tegra_csi_tpg_fmts, sizeof(struct v4l2_mbus_framefmt));
>>>>>>>> +}
>>>>>>>> +
>>>>>>>> +
