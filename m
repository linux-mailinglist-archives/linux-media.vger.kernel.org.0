Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A0E114D0A6
	for <lists+linux-media@lfdr.de>; Wed, 29 Jan 2020 19:46:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727520AbgA2SqH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jan 2020 13:46:07 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:1758 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727024AbgA2SqH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jan 2020 13:46:07 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e31d2d80003>; Wed, 29 Jan 2020 10:45:44 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 29 Jan 2020 10:46:04 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 29 Jan 2020 10:46:04 -0800
Received: from [10.2.164.115] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 29 Jan
 2020 18:46:03 +0000
Subject: Re: [RFC PATCH v1 4/5] media: tegra: Add Tegra Video input driver for
 Tegra210
To:     Helen Koike <helen.koike@collabora.com>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <frankc@nvidia.com>, <hverkuil@xs4all.nl>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <1580235801-4129-1-git-send-email-skomatineni@nvidia.com>
 <1580235801-4129-5-git-send-email-skomatineni@nvidia.com>
 <3cdea635-a9ca-7b9c-3c99-8f489f4d669a@collabora.com>
 <162488d0-4e74-963a-3366-e4c1f7cf04ca@nvidia.com>
 <017ca95e-7dd3-2d04-8d84-9047ac4e548b@nvidia.com>
 <655b9a64-10d7-3fd3-f443-babf33e67b62@collabora.com>
 <7265b661-de5a-b0f0-bcdc-1a1d2c03fe57@nvidia.com>
 <4b443e7c-0866-ceea-938c-8ab71959fc89@collabora.com>
 <b1e7168a-1f6f-c6bf-6320-7a6ee51880be@nvidia.com>
 <d9401e75-5876-50df-46b7-48c7509d322f@collabora.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <b7cf1aeb-ad08-b141-e7ea-e7f19fa77c33@nvidia.com>
Date:   Wed, 29 Jan 2020 10:46:02 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <d9401e75-5876-50df-46b7-48c7509d322f@collabora.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1580323544; bh=ZJj6oe8dxWf/OyVZrb52nJrfzNnx8JoVRFe6qFZLwLs=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=BrmH609qEotkIPk+ayb1507AU58KBJmiE3lNkQ04Ky5RlCUAVVZB4ZiOB4oXeREJd
         O3NWVw5qsbTQXx7xOTHB7FcZHfplOSKfp8CWHHgX2vSjW10/FKmtE+iqI11EnmaINT
         ToDPkiGwUcXtzzFhlp0EZtjM2tqtaoq5A5KRD3b9kQ5SjktHfy1FkQ4MzH91aSbc/g
         5WNWGzeTDbglhZ4Nr245OqAZcpQNPIACnxVxmifxEj60KxnvYUvckMQsydNvQ0Y4dI
         8UiX2PqoikLVb7VW5Ij2qZvkJl4JtEvr5pHtlzJOUhO+lOmHP5Xt9mSumX7ykPAOBD
         3HsCD3tO1CKmQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 1/29/20 10:29 AM, Helen Koike wrote:
> External email: Use caution opening links or attachments
>
>
> On 1/29/20 3:49 PM, Sowjanya Komatineni wrote:
>> On 1/29/20 2:31 AM, Helen Koike wrote:
>>> External email: Use caution opening links or attachments
>>>
>>>
>>> On 1/29/20 12:11 AM, Sowjanya Komatineni wrote:
>>>> On 1/28/20 5:05 PM, Helen Koike wrote:
>>>>> External email: Use caution opening links or attachments
>>>>>
>>>>>
>>>>> On 1/28/20 10:49 PM, Sowjanya Komatineni wrote:
>>>>>> On 1/28/20 2:13 PM, Sowjanya Komatineni wrote:
>>>>>>> On 1/28/20 1:45 PM, Helen Koike wrote:
>>>>>>>> External email: Use caution opening links or attachments
>>>>>>>>
>>>>>>>>
>>>>>>>> Hi Sowjanya,
>>>>>>>>
>>>>>>>> I just took a really quick look, I didn't check the driver in deep, so just some small comments below.
>>>>>>>>
>>>>>>>> On 1/28/20 4:23 PM, Sowjanya Komatineni wrote:
>>>>>>>>> Tegra210 contains a powerful Video Input (VI) hardware controller
>>>>>>>>> which can support up to 6 MIPI CSI camera sensors.
>>>>>>>>>
>>>>>>>>> Each Tegra CSI port can be one-to-one mapped to VI channel and can
>>>>>>>>> capture from an external camera sensor connected to CSI or from
>>>>>>>>> built-in test pattern generator.
>>>>>>>>>
>>>>>>>>> Tegra210 supports built-in test pattern generator from CSI to VI.
>>>>>>>>>
>>>>>>>>> This patch adds a V4L2 media controller and capture driver support
>>>>>>>>> for Tegra210 built-in CSI to VI test pattern generator.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>>>>>> Could you send us the output of media-ctl --print-dot ? So we can view the media topology easily?
>>>>>>> root@tegra-ubuntu:/home/ubuntu# ./media-ctl --print-dot
>>>>>>> digraph board {
>>>>>>>            rankdir=TB
>>>>>>>            n00000001 [label="54080000.vi-output-0\n/dev/video0", shape=box, style=filled, fillcolor=yellow]
>>>>>>>            n00000005 [label="54080000.vi-output-1\n/dev/video1", shape=box, style=filled, fillcolor=yellow]
>>>>>>>            n00000009 [label="54080000.vi-output-2\n/dev/video2", shape=box, style=filled, fillcolor=yellow]
>>>>>>>            n0000000d [label="54080000.vi-output-3\n/dev/video3", shape=box, style=filled, fillcolor=yellow]
>>>>>>>            n00000011 [label="54080000.vi-output-4\n/dev/video4", shape=box, style=filled, fillcolor=yellow]
>>>>>>>            n00000015 [label="54080000.vi-output-5\n/dev/video5", shape=box, style=filled, fillcolor=yellow]
>>>>>>>            n00000019 [label="{{} | tpg-0 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
>>>>>>>            n00000019:port0 -> n00000001
>>>>>>>            n0000001d [label="{{} | tpg-1 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
>>>>>>>            n0000001d:port0 -> n00000005
>>>>>>>            n00000021 [label="{{} | tpg-2 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
>>>>>>>            n00000021:port0 -> n00000009
>>>>>>>            n00000025 [label="{{} | tpg-3 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
>>>>>>>            n00000025:port0 -> n0000000d
>>>>>>>            n00000029 [label="{{} | tpg-4 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
>>>>>>>            n00000029:port0 -> n00000011
>>>>>>>            n0000002d [label="{{} | tpg-5 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
>>>>>>>            n0000002d:port0 -> n00000015
>>>>>>> }
>>>>>>>
>>>>>>>>> --- diff --git a/drivers/staging/media/tegra/host1x-video.h b/drivers/staging/media/tegra/host1x-video.h
>>>>>>>>> new file mode 100644
>>>>>>>>> index 000000000000..84d28e6f4362
>>>>>>>>> --- /dev/null
>>>>>>>>> +++ b/drivers/staging/media/tegra/host1x-video.h
>>>>>>>>> @@ -0,0 +1,33 @@
>>>>>>>>> +// SPDX-License-Identifier: GPL-2.0-only
>>>>>>>>> +/*
>>>>>>>>> + * Copyright (C) 2020 NVIDIA CORPORATION.  All rights reserved.
>>>>>>>>> + */
>>>>>>>>> +
>>>>>>>>> +#ifndef HOST1X_VIDEO_H
>>>>>>>>> +#define HOST1X_VIDEO_H 1
>>>>>>>>> +
>>>>>>>>> +#include <linux/host1x.h>
>>>>>>>>> +
>>>>>>>>> +#include <media/media-device.h>
>>>>>>>>> +#include <media/media-entity.h>
>>>>>>>>> +#include <media/v4l2-async.h>
>>>>>>>>> +#include <media/v4l2-ctrls.h>
>>>>>>>>> +#include <media/v4l2-device.h>
>>>>>>>>> +#include <media/v4l2-dev.h>
>>>>>>>>> +#include <media/videobuf2-v4l2.h>
>>>>>>>>> +
>>>>>>>>> +#include "tegra-vi.h"
>>>>>>>>> +#include "csi.h"
>>>>>>>>> +
>>>>>>>>> +struct tegra_camera {
>>>>>>>>> +     struct v4l2_device v4l2_dev;
>>>>>>>>> +     struct media_device media_dev;
>>>>>>>>> +     struct device *dev;
>>>>>>>> You can use cam->media_dev.dev instead of having this pointer.
>>>>>>>>
>>>>>> Will fix in v2
>>>>>>>>> +     struct tegra_vi *vi;
>>>>>>>>> +     struct tegra_csi_device *csi;
>>>>>>>>> +};
>>>>>>>>> +
>>>>>>>>> +
>>>>>>>>> +#define to_tegra_channel(vdev) \
>>>>>>>>> +     container_of(vdev, struct tegra_channel, video)
>>>>>>>> Why not inline instead of define. Inlines has the advantage of checking types.
>>>>>> Will change in v2
>>>>>>>>> +static int __tegra_channel_try_format(struct tegra_channel *chan,
>>>>>>>>> +                                   struct v4l2_pix_format *pix,
>>>>>>>>> +                                   const struct tegra_video_format **vfmt)
>>>>>>>>> +{
>>>>>>>>> +     const struct tegra_video_format *fmt_info;
>>>>>>>>> +     struct v4l2_subdev *subdev;
>>>>>>>>> +     struct v4l2_subdev_format fmt;
>>>>>>>>> +     struct v4l2_subdev_pad_config *pad_cfg;
>>>>>>>>> +
>>>>>>>>> +     subdev = tegra_channel_get_remote_subdev(chan);
>>>>>>>>> +     pad_cfg = v4l2_subdev_alloc_pad_config(subdev);
>>>>>>>>> +     if (!pad_cfg)
>>>>>>>>> +             return -ENOMEM;
>>>>>>>>> +
>>>>>>>>> +     /*
>>>>>>>>> +      * Retrieve format information and select the default format if the
>>>>>>>>> +      * requested format isn't supported.
>>>>>>>>> +      */
>>>>>>>>> +     fmt_info = tegra_core_get_format_by_fourcc(chan, pix->pixelformat);
>>>>>>>>> +     if (!fmt_info) {
>>>>>>>>> +             pix->pixelformat = chan->format.pixelformat;
>>>>>>>>> +             pix->colorspace = chan->format.colorspace;
>>>>>>>>> +             fmt_info = tegra_core_get_format_by_fourcc(chan,
>>>>>>>>> + pix->pixelformat);
>>>>>>>>> +     }
>>>>>>>>> +
>>>>>>>>> +     /* Change this when start adding interlace format support */
>>>>>>>>> +     pix->field = V4L2_FIELD_NONE;
>>>>>>>>> +     fmt.which = V4L2_SUBDEV_FORMAT_TRY;
>>>>>>>>> +     fmt.pad = 0;
>>>>>>>>> +     v4l2_fill_mbus_format(&fmt.format, pix, fmt_info->code);
>>>>>>>>> +     v4l2_subdev_call(subdev, pad, set_fmt, pad_cfg, &fmt);
>>>>>>>> As fas as I understand, entities formats should be independent, it is up to link_validate
>>>>>>>> to check formats between entities.
>>>>>>>> The capture shouldn't change the format of the subdevice.
>>>>>>>>
>>>>>> Tegra Built-in TPG on CSI accepts specific TPG sizes and CSI is source and VI is sink.
>>>>>>
>>>>>> link validation happens only for sink ends of the link.
>>>>> And what is the problem with it being on the sink end?
>>>>> You just need to implement custom link validation in tegra_csi_media_ops that also checks the format
>>>>> between the capture and the subdevice, no? Unless I missunderstood something here (which is quite possible).
>>>>>
>>>>> Examples:
>>>>> drivers/staging/media/rkisp1/rkisp1-capture.c - rkisp1_capture_link_validate()
>>>>> drivers/media/pci/intel/ipu3/ipu3-cio2.c - cio2_video_link_validate()
>>>>> drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c - sun6i_video_link_validate()
>>>>>
>>>>> Regards,
>>>>> Helen
>>>>>
>>>> But if we move subdevice side format/size check into its link_validation, any incorrect image size set thru set-fmt-video will be taken and get-fmt-video will also show same as it doesn't validate formats/sizes supported by CSI subdev during this time. link validation happens during pipeline start. So thought to prevent accepting incorrect format/size during set-fmt-video/get-fmt-video.
>>> This is how media API is designed, formats shouldn't propagate between entities, it is up to userspace to configure pads
>>> correctly. And if formats of the pads don't match, stream fails during pipeline start, and userspace receive -EPIPE error.
>>>
>>> According to the docs: https://linuxtv.org/downloads/v4l-dvb-apis/uapi/v4l/dev-subdev.html
>>>
>>> "Formats are not propagated across links, as that would involve propagating them from one sub-device file handle to another. Applications must then take care to configure both ends of every link explicitly with compatible formats. Identical formats on the two ends of a link are guaranteed to be compatible. Drivers are free to accept different formats matching device requirements as being compatible."
>>>
>>> Perhaps you want to add support of this driver in libcamera.org to make it easier to userspace.
>>>
>>> Regards,
>>> Helen
>> I see in doc, Format Negotiation says drivers can propagate formats inside sub-devices. When try/active format is set on pad, corresponding format on other pads of same subdevice can be modified by the driver as long as formats are propagated from Sink pads to source pads.
>>
>> When application configures front-end sink pad format, driver can propagate the format to front-end source pad.
> Yes, the doc says that "Drivers automatically propagate formats **inside** sub-devices", not between subdevices.
>
> So, when a subdevice has a sink pad and a source pad, if user changes the format of the sink pad, the changes
> are indeed propagated to the source pad, but not between different subdevices.
>
>> VI is Sink and CSI is source subdev here for TPG.
> Vi and TPG are different entities, so you shouldn't propagate between them.
>
> Regards,
> Helen
OK, got it. Thanks Helen. Will fix in v2
>> Currently set_fmt/get_fmt from vi channel invokes Source subdevice set_fmt/get_fmt which is CSI in this case of TPG.
>>
>>>> Other than this I don't see any issue moving it to link_validation.
>>>>
>>>>
>>>>>> So with CSI subdev set_fmt sets width/height to default incase if width/height is not from one of the supported sizes.
>>>>>>
>>>>>>>>> +
>>>>>>>>> +     v4l2_fill_pix_format(pix, &fmt.format);
>>>>>>>>> +     tegra_channel_fmt_align(chan, &fmt_info->bpp, &pix->width, &pix->height,
>>>>>>>>> +                             &pix->bytesperline);
>>>>>>>>> +     pix->sizeimage = pix->bytesperline * pix->height;
>>>>>>>>> +
>>>>>>>>> +     if (vfmt)
>>>>>>>>> +             *vfmt = fmt_info;
>>>>>>>>> +
>>>>>>>>> +     v4l2_subdev_free_pad_config(pad_cfg);
>>>>>>>>> +
>>>>>>>>> +     return 0;
>>>>>>>>> +}
>>>>>>>>> +
>>>>>>>>> +static int tegra_channel_try_format(struct file *file, void *fh,
>>>>>>>>> +                                 struct v4l2_format *format)
>>>>>>>>> +{
>>>>>>>>> +     struct v4l2_fh *vfh = file->private_data;
>>>>>>>>> +     struct tegra_channel *chan = to_tegra_channel(vfh->vdev);
>>>>>>>>> +
>>>>>>>>> +     return __tegra_channel_try_format(chan, &format->fmt.pix, NULL);
>>>>>>>>> +}
>>>>>>>>> +
>>>>>>>>> +static int tegra_channel_set_format(struct file *file, void *fh,
>>>>>>>>> +                                 struct v4l2_format *format)
>>>>>>>>> +{
>>>>>>>>> +     struct v4l2_fh *vfh = file->private_data;
>>>>>>>>> +     struct tegra_channel *chan = to_tegra_channel(vfh->vdev);
>>>>>>>>> +     const struct tegra_video_format *info;
>>>>>>>>> +     int ret;
>>>>>>>>> +     struct v4l2_subdev_format fmt;
>>>>>>>>> +     struct v4l2_subdev *subdev;
>>>>>>>>> +     struct v4l2_pix_format *pix = &format->fmt.pix;
>>>>>>>>> +
>>>>>>>>> +     if (vb2_is_busy(&chan->queue))
>>>>>>>>> +             return -EBUSY;
>>>>>>>>> +
>>>>>>>>> +     /* get supported format by try_fmt */
>>>>>>>>> +     ret = __tegra_channel_try_format(chan, pix, &info);
>>>>>>>>> +     if (ret)
>>>>>>>>> +             return ret;
>>>>>>>>> +
>>>>>>>>> +     subdev = tegra_channel_get_remote_subdev(chan);
>>>>>>>>> +
>>>>>>>>> +     fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
>>>>>>>>> +     fmt.pad = 0;
>>>>>>>>> +     v4l2_fill_mbus_format(&fmt.format, pix, info->code);
>>>>>>>>> +     v4l2_subdev_call(subdev, pad, set_fmt, NULL, &fmt);
>>>>>>>> same here.
>>>>>>>>
>>>>>> Calling subdev set_fmt here for the same reason as explained above.
>>>>>>>>> +
>>>>>>>>> +     v4l2_fill_pix_format(pix, &fmt.format);
>>>>>>>>> +     chan->format = *pix;
>>>>>>>>> +     chan->fmtinfo = info;
>>>>>>>>> +     tegra_channel_update_format(chan, pix->width,
>>>>>>>>> +                                 pix->height, info->fourcc,
>>>>>>>>> +                                 &info->bpp,
>>>>>>>>> +                                 pix->bytesperline);
>>>>>>>>> +     *pix = chan->format;
>>>>>>>>> +
>>>>>>>>> +     return 0;
>>>>>>>>> +}
>>>>>>>>> +
>>>>>>>>> +static int tegra_channel_enum_input(struct file *file, void *fh,
>>>>>>>>> +                                 struct v4l2_input *inp)
>>>>>>>>> +{
>>>>>>>>> +     /* Currently driver supports internal TPG only */
>>>>>>>>> +     if (inp->index != 0)
>>>>>>>> just
>>>>>>>> if (inp->index)
>>>>>>>>
>>>>>> Will update in v2
>>>>>>>>> +             return -EINVAL;
>>>>>>>>> +
>>>>>>>>> +     inp->type = V4L2_INPUT_TYPE_CAMERA;
>>>>>>>>> +     strscpy(inp->name, "Tegra TPG", sizeof(inp->name));
>>>>>>>>> +
>>>>>>>>> +     return 0;
>>>>>>>>> +}
>>>>>>>>> +static const struct tegra_video_format tegra_default_format = {
>>>>>>>>> +     /* RAW 10 */
>>>>>>>>> +     TEGRA_VF_RAW10,
>>>>>>>>> +     10,
>>>>>>>>> +     MEDIA_BUS_FMT_SRGGB10_1X10,
>>>>>>>>> +     {2, 1},
>>>>>>>>> +     TEGRA_IMAGE_FORMAT_DEF,
>>>>>>>>> +     TEGRA_IMAGE_DT_RAW10,
>>>>>>>>> +     V4L2_PIX_FMT_SRGGB10,
>>>>>>>>> +     "RGRG.. GBGB..",
>>>>>>>> It would be more readable to do:
>>>>>>>>
>>>>>>>> .code = TEGRA_VF_RAW10,
>>>>>>>> .width = 10,
>>>>>>>> .code = MEDIA_BUS_FMT_SRGGB10_1X10,
>>>>>>>>
>>>>>>>> and so on
>>>>>> Will update in v2
>>>>>>>>> +};
>>>>>>>>> +
>>>>>>>>> +/*
>>>>>>>>> + * Helper functions
>>>>>>>>> + */
>>>>>>>>> +
>>>>>>>>> +/**
>>>>>>>>> + * tegra_core_get_default_format - Get default format
>>>>>>>>> + *
>>>>>>>>> + * Return: pointer to the format where the default format needs
>>>>>>>>> + * to be filled in.
>>>>>>>>> + */
>>>>>>>>> +const struct tegra_video_format *tegra_core_get_default_format(void)
>>>>>>>>> +{
>>>>>>>>> +     return &tegra_default_format;
>>>>>>>>> +}
>>>>>>>> This is only used in tegra-channel.c, why not to declare it there as static?
>>>>>>>>
>>>>>> Will move all video format retrieval helper functions to corresponding file as static in v2
>>>>>>>>> + +static struct v4l2_frmsize_discrete tegra_csi_tpg_sizes[] = {
>>>>>>>>> +     {1280, 720},
>>>>>>>>> +     {1920, 1080},
>>>>>>>>> +     {3840, 2160},
>>>>>>>>> +};
>>>>>>>>> +
>>>>>>>>> +/*
>>>>>>>>> + * V4L2 Subdevice Pad Operations
>>>>>>>>> + */
>>>>>>>>> +static int tegra_csi_get_format(struct v4l2_subdev *subdev,
>>>>>>>>> +                             struct v4l2_subdev_pad_config *cfg,
>>>>>>>>> +                             struct v4l2_subdev_format *fmt)
>>>>>>>>> +{
>>>>>>>>> +     struct tegra_csi_channel *csi_chan = to_csi_chan(subdev);
>>>>>>>>> +
>>>>>>>>> +     mutex_lock(&csi_chan->format_lock);
>>>>>>>> Do you need this lock? I think there is already a serialization in the ioctls in place (to be confirmed).
>>>>>>>>
>>>>>> This is on CSI v4l2 subdevice side during format updates
>>>>>>>>> +     memcpy(fmt, &csi_chan->ports->format,
>>>>>>>>> +            sizeof(struct v4l2_mbus_framefmt));
>>>>>>>> I would prefer just:
>>>>>>>> *fmt = *csi_chan->ports->format;
>>>>>>>>
>>>>>>>> I think it is easier to read IMHO.
>>>>>>>> same in tegra_csi_set_format().
>>>>>>>>
>>>>>> Will fix in v2
>>>>>>>>> + mutex_unlock(&csi_chan->format_lock);
>>>>>>>>> +
>>>>>>>>> +     return 0;
>>>>>>>>> +}
>>>>>>>>> +
>>>>>>>>> +static void tegra_csi_try_mbus_fmt(struct v4l2_subdev *subdev,
>>>>>>>>> +                                struct v4l2_mbus_framefmt *mfmt)
>>>>>>>>> +{
>>>>>>>>> +     struct tegra_csi_channel *csi_chan = to_csi_chan(subdev);
>>>>>>>>> +     struct tegra_csi_device *csi = csi_chan->csi;
>>>>>>>>> +     const struct v4l2_frmsize_discrete *sizes;
>>>>>>>>> +     int i, j;
>>>>>>>> unsigned
>>>>>>>>
>>>>>> Will fix in v2
>>>>>>>>> +
>>>>>>>>> +     for (i = 0; i < ARRAY_SIZE(tegra_csi_tpg_fmts); i++) {
>>>>>>>>> +             struct v4l2_mbus_framefmt *mbus_fmt = &tegra_csi_tpg_fmts[i];
>>>>>>>>> +
>>>>>>>>> +             if (mfmt->code == mbus_fmt->code) {
>>>>>>>>> +                     for (j = 0; j < ARRAY_SIZE(tegra_csi_tpg_sizes); j++) {
>>>>>>>>> +                             sizes = &tegra_csi_tpg_sizes[j];
>>>>>>>>> +                             if (mfmt->width == sizes->width &&
>>>>>>>>> +                                 mfmt->height == sizes->height) {
>>>>>>>>> +                                     return;
>>>>>>>>> +                             }
>>>>>>>>> +                     }
>>>>>>>>> +             }
>>>>>>>>> +
>>>>>>>>> +             dev_info(csi->dev, "using Tegra default RAW10 video format\n");
>>>>>>>>> +     }
>>>>>>>>> +
>>>>>>>>> +     dev_info(csi->dev, "using Tegra default WIDTH X HEIGHT (1920x1080)\n");
>>>>>>>>> +     memcpy(mfmt, tegra_csi_tpg_fmts, sizeof(struct v4l2_mbus_framefmt));
>>>>>>>>> +}
>>>>>>>>> +
>>>>>>>>> +
