Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 825AC14C64B
	for <lists+linux-media@lfdr.de>; Wed, 29 Jan 2020 07:00:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726116AbgA2F72 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jan 2020 00:59:28 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:3961 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725858AbgA2F71 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jan 2020 00:59:27 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e311f2e0000>; Tue, 28 Jan 2020 21:59:10 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 28 Jan 2020 21:59:25 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 28 Jan 2020 21:59:25 -0800
Received: from [10.2.164.115] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 29 Jan
 2020 05:59:24 +0000
Subject: Re: [RFC PATCH v1 4/5] media: tegra: Add Tegra Video input driver for
 Tegra210
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
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
Message-ID: <14ab584f-7ba6-9d79-6e5e-3cb0b4f47bc7@nvidia.com>
Date:   Tue, 28 Jan 2020 21:59:23 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <7265b661-de5a-b0f0-bcdc-1a1d2c03fe57@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1580277550; bh=23+yMU6A9CmYzhYQZ4qAxqdkwqng9Zywr0Jn8uJm68M=;
        h=X-PGP-Universal:Subject:From:To:CC:References:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=gxg16mTp2s2ZQXkERFcDahbB812oFHaPlWezL0uajk6h6A3QZKqcC5kCfhkBlm80p
         pqtjzxwAiPIudZC4ayaZnmu9A2+2auA/VxvJQzrjiRtFDxcmG+b4XCrMlll4wgT4lI
         088A5r0YfuH7DsR/OTwF6nrjiM/9dNKA6lLri1h204qMDmj4/PAwpXYkkqQ7kP9OUb
         v5hIVdUAD1tJWLfUVVRO+GANxeYyqXtEOw+3/PCJWnWn+gTkmJL7Mr7jwSdaj3K+xH
         G127XmWn7zPEMdZ7g46CIiMWsmBux0GQk9jluVEeKaRTwPdRRNKbWCGsq+2aKhRc98
         jxqDQktHxFqIg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 1/28/20 6:11 PM, Sowjanya Komatineni wrote:
>
> On 1/28/20 5:05 PM, Helen Koike wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> On 1/28/20 10:49 PM, Sowjanya Komatineni wrote:
>>> On 1/28/20 2:13 PM, Sowjanya Komatineni wrote:
>>>> On 1/28/20 1:45 PM, Helen Koike wrote:
>>>>> External email: Use caution opening links or attachments
>>>>>
>>>>>
>>>>> Hi Sowjanya,
>>>>>
>>>>> I just took a really quick look, I didn't check the driver in=20
>>>>> deep, so just some small comments below.
>>>>>
>>>>> On 1/28/20 4:23 PM, Sowjanya Komatineni wrote:
>>>>>> Tegra210 contains a powerful Video Input (VI) hardware controller
>>>>>> which can support up to 6 MIPI CSI camera sensors.
>>>>>>
>>>>>> Each Tegra CSI port can be one-to-one mapped to VI channel and can
>>>>>> capture from an external camera sensor connected to CSI or from
>>>>>> built-in test pattern generator.
>>>>>>
>>>>>> Tegra210 supports built-in test pattern generator from CSI to VI.
>>>>>>
>>>>>> This patch adds a V4L2 media controller and capture driver support
>>>>>> for Tegra210 built-in CSI to VI test pattern generator.
>>>>>>
>>>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>>> Could you send us the output of media-ctl --print-dot ? So we can=20
>>>>> view the media topology easily?
>>>> root@tegra-ubuntu:/home/ubuntu# ./media-ctl --print-dot
>>>> digraph board {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rankdir=3DTB
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n00000001 [label=3D"5=
4080000.vi-output-0\n/dev/video0",=20
>>>> shape=3Dbox, style=3Dfilled, fillcolor=3Dyellow]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n00000005 [label=3D"5=
4080000.vi-output-1\n/dev/video1",=20
>>>> shape=3Dbox, style=3Dfilled, fillcolor=3Dyellow]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n00000009 [label=3D"5=
4080000.vi-output-2\n/dev/video2",=20
>>>> shape=3Dbox, style=3Dfilled, fillcolor=3Dyellow]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n0000000d [label=3D"5=
4080000.vi-output-3\n/dev/video3",=20
>>>> shape=3Dbox, style=3Dfilled, fillcolor=3Dyellow]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n00000011 [label=3D"5=
4080000.vi-output-4\n/dev/video4",=20
>>>> shape=3Dbox, style=3Dfilled, fillcolor=3Dyellow]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n00000015 [label=3D"5=
4080000.vi-output-5\n/dev/video5",=20
>>>> shape=3Dbox, style=3Dfilled, fillcolor=3Dyellow]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n00000019 [label=3D"{=
{} | tpg-0 | {<port0> 0}}",=20
>>>> shape=3DMrecord, style=3Dfilled, fillcolor=3Dgreen]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n00000019:port0 -> n0=
0000001
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n0000001d [label=3D"{=
{} | tpg-1 | {<port0> 0}}",=20
>>>> shape=3DMrecord, style=3Dfilled, fillcolor=3Dgreen]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n0000001d:port0 -> n0=
0000005
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n00000021 [label=3D"{=
{} | tpg-2 | {<port0> 0}}",=20
>>>> shape=3DMrecord, style=3Dfilled, fillcolor=3Dgreen]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n00000021:port0 -> n0=
0000009
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n00000025 [label=3D"{=
{} | tpg-3 | {<port0> 0}}",=20
>>>> shape=3DMrecord, style=3Dfilled, fillcolor=3Dgreen]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n00000025:port0 -> n0=
000000d
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n00000029 [label=3D"{=
{} | tpg-4 | {<port0> 0}}",=20
>>>> shape=3DMrecord, style=3Dfilled, fillcolor=3Dgreen]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n00000029:port0 -> n0=
0000011
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n0000002d [label=3D"{=
{} | tpg-5 | {<port0> 0}}",=20
>>>> shape=3DMrecord, style=3Dfilled, fillcolor=3Dgreen]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n0000002d:port0 -> n0=
0000015
>>>> }
>>>>
>>>>>> --- diff --git a/drivers/staging/media/tegra/host1x-video.h=20
>>>>>> b/drivers/staging/media/tegra/host1x-video.h
>>>>>> new file mode 100644
>>>>>> index 000000000000..84d28e6f4362
>>>>>> --- /dev/null
>>>>>> +++ b/drivers/staging/media/tegra/host1x-video.h
>>>>>> @@ -0,0 +1,33 @@
>>>>>> +// SPDX-License-Identifier: GPL-2.0-only
>>>>>> +/*
>>>>>> + * Copyright (C) 2020 NVIDIA CORPORATION.=C2=A0 All rights reserved=
.
>>>>>> + */
>>>>>> +
>>>>>> +#ifndef HOST1X_VIDEO_H
>>>>>> +#define HOST1X_VIDEO_H 1
>>>>>> +
>>>>>> +#include <linux/host1x.h>
>>>>>> +
>>>>>> +#include <media/media-device.h>
>>>>>> +#include <media/media-entity.h>
>>>>>> +#include <media/v4l2-async.h>
>>>>>> +#include <media/v4l2-ctrls.h>
>>>>>> +#include <media/v4l2-device.h>
>>>>>> +#include <media/v4l2-dev.h>
>>>>>> +#include <media/videobuf2-v4l2.h>
>>>>>> +
>>>>>> +#include "tegra-vi.h"
>>>>>> +#include "csi.h"
>>>>>> +
>>>>>> +struct tegra_camera {
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_device v4l2_dev;
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct media_device media_dev;
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct device *dev;
>>>>> You can use cam->media_dev.dev instead of having this pointer.
>>>>>
>>> Will fix in v2
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct tegra_vi *vi;
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct tegra_csi_device *csi;
>>>>>> +};
>>>>>> +
>>>>>> +
>>>>>> +#define to_tegra_channel(vdev) \
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 container_of(vdev, struct tegra_channel, v=
ideo)
>>>>> Why not inline instead of define. Inlines has the advantage of=20
>>>>> checking types.
>>> Will change in v2
>>>>>> +static int __tegra_channel_try_format(struct tegra_channel *chan,
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2=
_pix_format *pix,
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struc=
t=20
>>>>>> tegra_video_format **vfmt)
>>>>>> +{
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 const struct tegra_video_format *fmt_info;
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_subdev *subdev;
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_subdev_format fmt;
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_subdev_pad_config *pad_cfg;
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 subdev =3D tegra_channel_get_remote_subdev=
(chan);
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 pad_cfg =3D v4l2_subdev_alloc_pad_config(s=
ubdev);
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 if (!pad_cfg)
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 return -ENOMEM;
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Retrieve format information and se=
lect the default=20
>>>>>> format if the
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * requested format isn't supported.
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 fmt_info =3D tegra_core_get_format_by_four=
cc(chan,=20
>>>>>> pix->pixelformat);
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 if (!fmt_info) {
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 pix->pixelformat =3D chan->format.pixelformat;
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 pix->colorspace =3D chan->format.colorspace;
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 fmt_info =3D tegra_core_get_format_by_fourcc(chan,
>>>>>> + pix->pixelformat);
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 /* Change this when start adding interlace=
 format support */
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 pix->field =3D V4L2_FIELD_NONE;
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 fmt.which =3D V4L2_SUBDEV_FORMAT_TRY;
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 fmt.pad =3D 0;
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 v4l2_fill_mbus_format(&fmt.format, pix, fm=
t_info->code);
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 v4l2_subdev_call(subdev, pad, set_fmt, pad=
_cfg, &fmt);
>>>>> As fas as I understand, entities formats should be independent, it=20
>>>>> is up to link_validate
>>>>> to check formats between entities.
>>>>> The capture shouldn't change the format of the subdevice.
>>>>>
>>> Tegra Built-in TPG on CSI accepts specific TPG sizes and CSI is=20
>>> source and VI is sink.
>>>
>>> link validation happens only for sink ends of the link.
>> And what is the problem with it being on the sink end?
>> You just need to implement custom link validation in=20
>> tegra_csi_media_ops that also checks the format
>> between the capture and the subdevice, no? Unless I missunderstood=20
>> something here (which is quite possible).
>>
>> Examples:
>> drivers/staging/media/rkisp1/rkisp1-capture.c -=20
>> rkisp1_capture_link_validate()
>> drivers/media/pci/intel/ipu3/ipu3-cio2.c - cio2_video_link_validate()
>> drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c -=20
>> sun6i_video_link_validate()
>>
>> Regards,
>> Helen
>>
> But if we move subdevice side format/size check into its=20
> link_validation, any incorrect image size set thru set-fmt-video will=20
> be taken and get-fmt-video will also show same as it doesn't validate=20
> formats/sizes supported by CSI subdev during this time. link=20
> validation happens during pipeline start. So thought to prevent=20
> accepting incorrect format/size during set-fmt-video/get-fmt-video.
>
> Other than this I don't see any issue moving it to link_validation.
>
link validation happens for all the links in the pipeline where both of=20
the ends of the links are V4L2 sub-devices.

v4l2_subdev_link_validate calls sink pad link_validate.

This driver has currently TPG support only where CSI v4l2 subdevice is=20
the source and VI is the sink video entity.


>
>>> So with CSI subdev set_fmt sets width/height to default incase if=20
>>> width/height is not from one of the supported sizes.
>>>
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 v4l2_fill_pix_format(pix, &fmt.format);
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 tegra_channel_fmt_align(chan, &fmt_info->b=
pp, &pix->width,=20
>>>>>> &pix->height,
>>>>>> + &pix->bytesperline);
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 pix->sizeimage =3D pix->bytesperline * pix=
->height;
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 if (vfmt)
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 *vfmt =3D fmt_info;
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 v4l2_subdev_free_pad_config(pad_cfg);
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>>>>> +}
>>>>>> +
>>>>>> +static int tegra_channel_try_format(struct file *file, void *fh,
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_format *for=
mat)
>>>>>> +{
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_fh *vfh =3D file->private_data=
;
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct tegra_channel *chan =3D to_tegra_ch=
annel(vfh->vdev);
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 return __tegra_channel_try_format(chan, &f=
ormat->fmt.pix,=20
>>>>>> NULL);
>>>>>> +}
>>>>>> +
>>>>>> +static int tegra_channel_set_format(struct file *file, void *fh,
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_format *for=
mat)
>>>>>> +{
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_fh *vfh =3D file->private_data=
;
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct tegra_channel *chan =3D to_tegra_ch=
annel(vfh->vdev);
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 const struct tegra_video_format *info;
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 int ret;
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_subdev_format fmt;
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_subdev *subdev;
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_pix_format *pix =3D &format->f=
mt.pix;
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 if (vb2_is_busy(&chan->queue))
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 return -EBUSY;
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 /* get supported format by try_fmt */
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D __tegra_channel_try_format(chan, p=
ix, &info);
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 return ret;
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 subdev =3D tegra_channel_get_remote_subdev=
(chan);
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 fmt.which =3D V4L2_SUBDEV_FORMAT_ACTIVE;
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 fmt.pad =3D 0;
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 v4l2_fill_mbus_format(&fmt.format, pix, in=
fo->code);
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 v4l2_subdev_call(subdev, pad, set_fmt, NUL=
L, &fmt);
>>>>> same here.
>>>>>
>>> Calling subdev set_fmt here for the same reason as explained above.
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 v4l2_fill_pix_format(pix, &fmt.format);
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 chan->format =3D *pix;
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 chan->fmtinfo =3D info;
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 tegra_channel_update_format(chan, pix->wid=
th,
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pix->height, info->four=
cc,
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &info->bpp,
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pix->bytesperline);
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 *pix =3D chan->format;
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>>>>> +}
>>>>>> +
>>>>>> +static int tegra_channel_enum_input(struct file *file, void *fh,
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_input *inp)
>>>>>> +{
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 /* Currently driver supports internal TPG =
only */
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 if (inp->index !=3D 0)
>>>>> just
>>>>> if (inp->index)
>>>>>
>>> Will update in v2
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 return -EINVAL;
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 inp->type =3D V4L2_INPUT_TYPE_CAMERA;
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 strscpy(inp->name, "Tegra TPG", sizeof(inp=
->name));
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>>>>> +}
>>>>>> +static const struct tegra_video_format tegra_default_format =3D {
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 /* RAW 10 */
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 TEGRA_VF_RAW10,
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 10,
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 MEDIA_BUS_FMT_SRGGB10_1X10,
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 {2, 1},
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 TEGRA_IMAGE_FORMAT_DEF,
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 TEGRA_IMAGE_DT_RAW10,
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_PIX_FMT_SRGGB10,
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 "RGRG.. GBGB..",
>>>>> It would be more readable to do:
>>>>>
>>>>> .code =3D TEGRA_VF_RAW10,
>>>>> .width =3D 10,
>>>>> .code =3D MEDIA_BUS_FMT_SRGGB10_1X10,
>>>>>
>>>>> and so on
>>> Will update in v2
>>>>>> +};
>>>>>> +
>>>>>> +/*
>>>>>> + * Helper functions
>>>>>> + */
>>>>>> +
>>>>>> +/**
>>>>>> + * tegra_core_get_default_format - Get default format
>>>>>> + *
>>>>>> + * Return: pointer to the format where the default format needs
>>>>>> + * to be filled in.
>>>>>> + */
>>>>>> +const struct tegra_video_format=20
>>>>>> *tegra_core_get_default_format(void)
>>>>>> +{
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 return &tegra_default_format;
>>>>>> +}
>>>>> This is only used in tegra-channel.c, why not to declare it there=20
>>>>> as static?
>>>>>
>>> Will move all video format retrieval helper functions to=20
>>> corresponding file as static in v2
>>>>>> + +static struct v4l2_frmsize_discrete tegra_csi_tpg_sizes[] =3D {
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 {1280, 720},
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 {1920, 1080},
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 {3840, 2160},
>>>>>> +};
>>>>>> +
>>>>>> +/*
>>>>>> + * V4L2 Subdevice Pad Operations
>>>>>> + */
>>>>>> +static int tegra_csi_get_format(struct v4l2_subdev *subdev,
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_subdev_pad_config *cfg,
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_subdev_format *fmt)
>>>>>> +{
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct tegra_csi_channel *csi_chan =3D to_=
csi_chan(subdev);
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 mutex_lock(&csi_chan->format_lock);
>>>>> Do you need this lock? I think there is already a serialization in=20
>>>>> the ioctls in place (to be confirmed).
>>>>>
>>> This is on CSI v4l2 subdevice side during format updates
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 memcpy(fmt, &csi_chan->ports->format,
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
sizeof(struct v4l2_mbus_framefmt));
>>>>> I would prefer just:
>>>>> *fmt =3D *csi_chan->ports->format;
>>>>>
>>>>> I think it is easier to read IMHO.
>>>>> same in tegra_csi_set_format().
>>>>>
>>> Will fix in v2
>>>>>> + mutex_unlock(&csi_chan->format_lock);
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>>>>> +}
>>>>>> +
>>>>>> +static void tegra_csi_try_mbus_fmt(struct v4l2_subdev *subdev,
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_mbus_framefmt *mf=
mt)
>>>>>> +{
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct tegra_csi_channel *csi_chan =3D to_=
csi_chan(subdev);
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct tegra_csi_device *csi =3D csi_chan-=
>csi;
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 const struct v4l2_frmsize_discrete *sizes;
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 int i, j;
>>>>> unsigned
>>>>>
>>> Will fix in v2
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < ARRAY_SIZE(tegra_csi_tpg=
_fmts); i++) {
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 struct v4l2_mbus_framefmt *mbus_fmt =3D=20
>>>>>> &tegra_csi_tpg_fmts[i];
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 if (mfmt->code =3D=3D mbus_fmt->code) {
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (j =3D 0; j <=20
>>>>>> ARRAY_SIZE(tegra_csi_tpg_sizes); j++) {
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 sizes =3D &tegra_csi_tpg_sizes[j];
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (mfmt->width =3D=3D sizes->width &&
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mfmt->height =3D=3D siz=
es->height) {
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 return;
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 }
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 dev_info(csi->dev, "using Tegra default RAW10 video=20
>>>>>> format\n");
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 dev_info(csi->dev, "using Tegra default WI=
DTH X HEIGHT=20
>>>>>> (1920x1080)\n");
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 memcpy(mfmt, tegra_csi_tpg_fmts, sizeof(st=
ruct=20
>>>>>> v4l2_mbus_framefmt));
>>>>>> +}
>>>>>> +
>>>>>> +
