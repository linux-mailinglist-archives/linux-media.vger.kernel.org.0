Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E81814D038
	for <lists+linux-media@lfdr.de>; Wed, 29 Jan 2020 19:16:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727412AbgA2SP7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jan 2020 13:15:59 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:18820 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726245AbgA2SP6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jan 2020 13:15:58 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e31cbc80000>; Wed, 29 Jan 2020 10:15:36 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Wed, 29 Jan 2020 10:15:56 -0800
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Wed, 29 Jan 2020 10:15:56 -0800
Received: from [10.2.164.115] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 29 Jan
 2020 18:15:55 +0000
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
 <4b443e7c-0866-ceea-938c-8ab71959fc89@collabora.com>
 <b1e7168a-1f6f-c6bf-6320-7a6ee51880be@nvidia.com>
Message-ID: <01ab1cae-692d-3a31-39e6-a887bbb9b4e0@nvidia.com>
Date:   Wed, 29 Jan 2020 10:15:54 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <b1e7168a-1f6f-c6bf-6320-7a6ee51880be@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1580321736; bh=lcB3LENC64tDFrE65WXfwb2vE0kJrjlnhJQznCSUke0=;
        h=X-PGP-Universal:Subject:From:To:CC:References:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=AdWPJUXXPjL1u4E1ltxLUli41Nph4ma5DmUZ0Lx7CuuI2rpqNuOwzYkevVg5RAEto
         JGK/K9FGOvSTW71Q+OAyWNi3UA4GQI95hCkyUaHZBKVMGAiZLHNjb7UFpHfDQENEnf
         1GTqFUxABB62zsaPEnPAMxeWdXgHu8djQgH55vd4H4L7Lk+dei+8lp2nTvEw77Ce70
         Wm2qUzGkDree1Ib8h77F/mnEO7emoY58EBU4sIL/Uoeo42skjSn88DFiGI930DEuza
         3dusiNM5cyisHEezKk5wJLUwEjC1ZGVJRbSDrFJ3Xqt1KGIjSqXgGc0Vd1gY/I0vKs
         5ig3xPotcHlyA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 1/29/20 9:49 AM, Sowjanya Komatineni wrote:
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
>>>>>>> I just took a really quick look, I didn't check the driver in=20
>>>>>>> deep, so just some small comments below.
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
>>>>>>> Could you send us the output of media-ctl --print-dot ? So we=20
>>>>>>> can view the media topology easily?
>>>>>> root@tegra-ubuntu:/home/ubuntu# ./media-ctl --print-dot
>>>>>> digraph board {
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rankdir=3DTB
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n00000001 [la=
bel=3D"54080000.vi-output-0\n/dev/video0",=20
>>>>>> shape=3Dbox, style=3Dfilled, fillcolor=3Dyellow]
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n00000005 [la=
bel=3D"54080000.vi-output-1\n/dev/video1",=20
>>>>>> shape=3Dbox, style=3Dfilled, fillcolor=3Dyellow]
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n00000009 [la=
bel=3D"54080000.vi-output-2\n/dev/video2",=20
>>>>>> shape=3Dbox, style=3Dfilled, fillcolor=3Dyellow]
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n0000000d [la=
bel=3D"54080000.vi-output-3\n/dev/video3",=20
>>>>>> shape=3Dbox, style=3Dfilled, fillcolor=3Dyellow]
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n00000011 [la=
bel=3D"54080000.vi-output-4\n/dev/video4",=20
>>>>>> shape=3Dbox, style=3Dfilled, fillcolor=3Dyellow]
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n00000015 [la=
bel=3D"54080000.vi-output-5\n/dev/video5",=20
>>>>>> shape=3Dbox, style=3Dfilled, fillcolor=3Dyellow]
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n00000019 [la=
bel=3D"{{} | tpg-0 | {<port0> 0}}",=20
>>>>>> shape=3DMrecord, style=3Dfilled, fillcolor=3Dgreen]
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n00000019:por=
t0 -> n00000001
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n0000001d [la=
bel=3D"{{} | tpg-1 | {<port0> 0}}",=20
>>>>>> shape=3DMrecord, style=3Dfilled, fillcolor=3Dgreen]
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n0000001d:por=
t0 -> n00000005
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n00000021 [la=
bel=3D"{{} | tpg-2 | {<port0> 0}}",=20
>>>>>> shape=3DMrecord, style=3Dfilled, fillcolor=3Dgreen]
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n00000021:por=
t0 -> n00000009
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n00000025 [la=
bel=3D"{{} | tpg-3 | {<port0> 0}}",=20
>>>>>> shape=3DMrecord, style=3Dfilled, fillcolor=3Dgreen]
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n00000025:por=
t0 -> n0000000d
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n00000029 [la=
bel=3D"{{} | tpg-4 | {<port0> 0}}",=20
>>>>>> shape=3DMrecord, style=3Dfilled, fillcolor=3Dgreen]
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n00000029:por=
t0 -> n00000011
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n0000002d [la=
bel=3D"{{} | tpg-5 | {<port0> 0}}",=20
>>>>>> shape=3DMrecord, style=3Dfilled, fillcolor=3Dgreen]
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n0000002d:por=
t0 -> n00000015
>>>>>> }
>>>>>>
>>>>>>>> --- diff --git a/drivers/staging/media/tegra/host1x-video.h=20
>>>>>>>> b/drivers/staging/media/tegra/host1x-video.h
>>>>>>>> new file mode 100644
>>>>>>>> index 000000000000..84d28e6f4362
>>>>>>>> --- /dev/null
>>>>>>>> +++ b/drivers/staging/media/tegra/host1x-video.h
>>>>>>>> @@ -0,0 +1,33 @@
>>>>>>>> +// SPDX-License-Identifier: GPL-2.0-only
>>>>>>>> +/*
>>>>>>>> + * Copyright (C) 2020 NVIDIA CORPORATION.=C2=A0 All rights reserv=
ed.
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
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_device v4l2_dev;
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct media_device media_dev;
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct device *dev;
>>>>>>> You can use cam->media_dev.dev instead of having this pointer.
>>>>>>>
>>>>> Will fix in v2
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct tegra_vi *vi;
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct tegra_csi_device *csi;
>>>>>>>> +};
>>>>>>>> +
>>>>>>>> +
>>>>>>>> +#define to_tegra_channel(vdev) \
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 container_of(vdev, struct tegra_channel,=
 video)
>>>>>>> Why not inline instead of define. Inlines has the advantage of=20
>>>>>>> checking types.
>>>>> Will change in v2
>>>>>>>> +static int __tegra_channel_try_format(struct tegra_channel *chan,
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v=
4l2_pix_format *pix,
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const st=
ruct=20
>>>>>>>> tegra_video_format **vfmt)
>>>>>>>> +{
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 const struct tegra_video_format *fmt_inf=
o;
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_subdev *subdev;
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_subdev_format fmt;
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_subdev_pad_config *pad_cfg;
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 subdev =3D tegra_channel_get_remote_subd=
ev(chan);
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 pad_cfg =3D v4l2_subdev_alloc_pad_config=
(subdev);
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 if (!pad_cfg)
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 return -ENOMEM;
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Retrieve format information and =
select the default=20
>>>>>>>> format if the
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * requested format isn't supported=
.
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 fmt_info =3D tegra_core_get_format_by_fo=
urcc(chan,=20
>>>>>>>> pix->pixelformat);
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 if (!fmt_info) {
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 pix->pixelformat =3D chan->format.pixelformat;
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 pix->colorspace =3D chan->format.colorspace;
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 fmt_info =3D tegra_core_get_format_by_fourcc(chan,
>>>>>>>> + pix->pixelformat);
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 /* Change this when start adding interla=
ce format support */
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 pix->field =3D V4L2_FIELD_NONE;
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 fmt.which =3D V4L2_SUBDEV_FORMAT_TRY;
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 fmt.pad =3D 0;
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 v4l2_fill_mbus_format(&fmt.format, pix, =
fmt_info->code);
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 v4l2_subdev_call(subdev, pad, set_fmt, p=
ad_cfg, &fmt);
>>>>>>> As fas as I understand, entities formats should be independent,=20
>>>>>>> it is up to link_validate
>>>>>>> to check formats between entities.
>>>>>>> The capture shouldn't change the format of the subdevice.
>>>>>>>
>>>>> Tegra Built-in TPG on CSI accepts specific TPG sizes and CSI is=20
>>>>> source and VI is sink.
>>>>>
>>>>> link validation happens only for sink ends of the link.
>>>> And what is the problem with it being on the sink end?
>>>> You just need to implement custom link validation in=20
>>>> tegra_csi_media_ops that also checks the format
>>>> between the capture and the subdevice, no? Unless I missunderstood=20
>>>> something here (which is quite possible).
>>>>
>>>> Examples:
>>>> drivers/staging/media/rkisp1/rkisp1-capture.c -=20
>>>> rkisp1_capture_link_validate()
>>>> drivers/media/pci/intel/ipu3/ipu3-cio2.c - cio2_video_link_validate()
>>>> drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c -=20
>>>> sun6i_video_link_validate()
>>>>
>>>> Regards,
>>>> Helen
>>>>
>>> But if we move subdevice side format/size check into its=20
>>> link_validation, any incorrect image size set thru set-fmt-video=20
>>> will be taken and get-fmt-video will also show same as it doesn't=20
>>> validate formats/sizes supported by CSI subdev during this time.=20
>>> link validation happens during pipeline start. So thought to prevent=20
>>> accepting incorrect format/size during set-fmt-video/get-fmt-video.
>> This is how media API is designed, formats shouldn't propagate=20
>> between entities, it is up to userspace to configure pads
>> correctly. And if formats of the pads don't match, stream fails=20
>> during pipeline start, and userspace receive -EPIPE error.
>>
>> According to the docs:=20
>> https://linuxtv.org/downloads/v4l-dvb-apis/uapi/v4l/dev-subdev.html
>>
>> "Formats are not propagated across links, as that would involve=20
>> propagating them from one sub-device file handle to another.=20
>> Applications must then take care to configure both ends of every link=20
>> explicitly with compatible formats. Identical formats on the two ends=20
>> of a link are guaranteed to be compatible. Drivers are free to accept=20
>> different formats matching device requirements as being compatible."
>>
>> Perhaps you want to add support of this driver in libcamera.org to=20
>> make it easier to userspace.
>>
>> Regards,
>> Helen
>
> I see in doc, Format Negotiation says drivers can propagate formats=20
> inside sub-devices. When try/active format is set on pad,=20
> corresponding format on other pads of same subdevice can be modified=20
> by the driver as long as formats are propagated from Sink pads to=20
> source pads.
>
> When application configures front-end sink pad format, driver can=20
> propagate the format to front-end source pad.
>
> VI is Sink and CSI is source subdev here for TPG.
>
> Currently set_fmt/get_fmt from vi channel invokes Source subdevice=20
> set_fmt/get_fmt which is CSI in this case of TPG.
>
Also regarding link_validation, it seems like its called for every link=20
in pipeline where both end of links are v4l2 subdevices.

Driver should take care of format validation between sub-device and=20
video nodes.

This driver TPG is b/w Tegra CSI (subdevice) and VI (video entity).

So I don't think we can use link_validate for format=20
validation/negotiation b/w video entity and subdevice.

Currently driver follows propagating format sink pad (VI) to source pad=20
and on CSI source subdev we update format to default if format size=20
doesn't match one of the TPG format sizes.

Please let me know if I am missing anything to understand your feedback.


>>> Other than this I don't see any issue moving it to link_validation.
>>>
>>>
>>>>> So with CSI subdev set_fmt sets width/height to default incase if=20
>>>>> width/height is not from one of the supported sizes.
>>>>>
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 v4l2_fill_pix_format(pix, &fmt.format);
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 tegra_channel_fmt_align(chan, &fmt_info-=
>bpp,=20
>>>>>>>> &pix->width, &pix->height,
>>>>>>>> + &pix->bytesperline);
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 pix->sizeimage =3D pix->bytesperline * p=
ix->height;
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 if (vfmt)
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 *vfmt =3D fmt_info;
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 v4l2_subdev_free_pad_config(pad_cfg);
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>>>>>>> +}
>>>>>>>> +
>>>>>>>> +static int tegra_channel_try_format(struct file *file, void *fh,
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_format *=
format)
>>>>>>>> +{
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_fh *vfh =3D file->private_da=
ta;
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct tegra_channel *chan =3D to_tegra_=
channel(vfh->vdev);
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 return __tegra_channel_try_format(chan, =
&format->fmt.pix,=20
>>>>>>>> NULL);
>>>>>>>> +}
>>>>>>>> +
>>>>>>>> +static int tegra_channel_set_format(struct file *file, void *fh,
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_format *=
format)
>>>>>>>> +{
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_fh *vfh =3D file->private_da=
ta;
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct tegra_channel *chan =3D to_tegra_=
channel(vfh->vdev);
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 const struct tegra_video_format *info;
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 int ret;
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_subdev_format fmt;
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_subdev *subdev;
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_pix_format *pix =3D &format-=
>fmt.pix;
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 if (vb2_is_busy(&chan->queue))
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 return -EBUSY;
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 /* get supported format by try_fmt */
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D __tegra_channel_try_format(chan,=
 pix, &info);
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 return ret;
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 subdev =3D tegra_channel_get_remote_subd=
ev(chan);
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 fmt.which =3D V4L2_SUBDEV_FORMAT_ACTIVE;
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 fmt.pad =3D 0;
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 v4l2_fill_mbus_format(&fmt.format, pix, =
info->code);
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 v4l2_subdev_call(subdev, pad, set_fmt, N=
ULL, &fmt);
>>>>>>> same here.
>>>>>>>
>>>>> Calling subdev set_fmt here for the same reason as explained above.
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 v4l2_fill_pix_format(pix, &fmt.format);
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 chan->format =3D *pix;
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 chan->fmtinfo =3D info;
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 tegra_channel_update_format(chan, pix->w=
idth,
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pix->height, info->f=
ourcc,
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &info->bpp,
>>>>>>>> + pix->bytesperline);
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 *pix =3D chan->format;
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>>>>>>> +}
>>>>>>>> +
>>>>>>>> +static int tegra_channel_enum_input(struct file *file, void *fh,
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_input *i=
np)
>>>>>>>> +{
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 /* Currently driver supports internal TP=
G only */
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 if (inp->index !=3D 0)
>>>>>>> just
>>>>>>> if (inp->index)
>>>>>>>
>>>>> Will update in v2
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 return -EINVAL;
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 inp->type =3D V4L2_INPUT_TYPE_CAMERA;
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 strscpy(inp->name, "Tegra TPG", sizeof(i=
np->name));
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>>>>>>> +}
>>>>>>>> +static const struct tegra_video_format tegra_default_format =3D {
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 /* RAW 10 */
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 TEGRA_VF_RAW10,
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 10,
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 MEDIA_BUS_FMT_SRGGB10_1X10,
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 {2, 1},
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 TEGRA_IMAGE_FORMAT_DEF,
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 TEGRA_IMAGE_DT_RAW10,
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_PIX_FMT_SRGGB10,
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 "RGRG.. GBGB..",
>>>>>>> It would be more readable to do:
>>>>>>>
>>>>>>> .code =3D TEGRA_VF_RAW10,
>>>>>>> .width =3D 10,
>>>>>>> .code =3D MEDIA_BUS_FMT_SRGGB10_1X10,
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
>>>>>>>> +const struct tegra_video_format=20
>>>>>>>> *tegra_core_get_default_format(void)
>>>>>>>> +{
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 return &tegra_default_format;
>>>>>>>> +}
>>>>>>> This is only used in tegra-channel.c, why not to declare it=20
>>>>>>> there as static?
>>>>>>>
>>>>> Will move all video format retrieval helper functions to=20
>>>>> corresponding file as static in v2
>>>>>>>> + +static struct v4l2_frmsize_discrete tegra_csi_tpg_sizes[] =3D {
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 {1280, 720},
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 {1920, 1080},
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 {3840, 2160},
>>>>>>>> +};
>>>>>>>> +
>>>>>>>> +/*
>>>>>>>> + * V4L2 Subdevice Pad Operations
>>>>>>>> + */
>>>>>>>> +static int tegra_csi_get_format(struct v4l2_subdev *subdev,
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_subdev_pad_config *cfg,
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_subdev_format *fmt)
>>>>>>>> +{
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct tegra_csi_channel *csi_chan =3D t=
o_csi_chan(subdev);
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 mutex_lock(&csi_chan->format_lock);
>>>>>>> Do you need this lock? I think there is already a serialization=20
>>>>>>> in the ioctls in place (to be confirmed).
>>>>>>>
>>>>> This is on CSI v4l2 subdevice side during format updates
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 memcpy(fmt, &csi_chan->ports->format,
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 sizeof(struct v4l2_mbus_framefmt));
>>>>>>> I would prefer just:
>>>>>>> *fmt =3D *csi_chan->ports->format;
>>>>>>>
>>>>>>> I think it is easier to read IMHO.
>>>>>>> same in tegra_csi_set_format().
>>>>>>>
>>>>> Will fix in v2
>>>>>>>> + mutex_unlock(&csi_chan->format_lock);
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>>>>>>> +}
>>>>>>>> +
>>>>>>>> +static void tegra_csi_try_mbus_fmt(struct v4l2_subdev *subdev,
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_mbus_framefmt =
*mfmt)
>>>>>>>> +{
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct tegra_csi_channel *csi_chan =3D t=
o_csi_chan(subdev);
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct tegra_csi_device *csi =3D csi_cha=
n->csi;
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 const struct v4l2_frmsize_discrete *size=
s;
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 int i, j;
>>>>>>> unsigned
>>>>>>>
>>>>> Will fix in v2
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < ARRAY_SIZE(tegra_csi_t=
pg_fmts); i++) {
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 struct v4l2_mbus_framefmt *mbus_fmt =3D=20
>>>>>>>> &tegra_csi_tpg_fmts[i];
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 if (mfmt->code =3D=3D mbus_fmt->code) {
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (j =3D 0; j <=
=20
>>>>>>>> ARRAY_SIZE(tegra_csi_tpg_sizes); j++) {
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sizes =3D &tegra_csi_tpg_sizes[j];
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (mfmt->width =3D=3D sizes->width &&
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mfmt->height =3D=3D =
sizes->height) {
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return;
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 }
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 dev_info(csi->dev, "using Tegra default RAW10=20
>>>>>>>> video format\n");
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>>>>> +
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 dev_info(csi->dev, "using Tegra default =
WIDTH X HEIGHT=20
>>>>>>>> (1920x1080)\n");
>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 memcpy(mfmt, tegra_csi_tpg_fmts, sizeof(=
struct=20
>>>>>>>> v4l2_mbus_framefmt));
>>>>>>>> +}
>>>>>>>> +
>>>>>>>> +
