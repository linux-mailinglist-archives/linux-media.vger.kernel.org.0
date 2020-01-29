Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9898A14C42C
	for <lists+linux-media@lfdr.de>; Wed, 29 Jan 2020 01:49:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726758AbgA2AtI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jan 2020 19:49:08 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:5604 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726487AbgA2AtI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jan 2020 19:49:08 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e30d66e0000>; Tue, 28 Jan 2020 16:48:46 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 28 Jan 2020 16:49:06 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 28 Jan 2020 16:49:06 -0800
Received: from [10.2.164.115] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 29 Jan
 2020 00:49:05 +0000
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
Message-ID: <017ca95e-7dd3-2d04-8d84-9047ac4e548b@nvidia.com>
Date:   Tue, 28 Jan 2020 16:49:04 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <162488d0-4e74-963a-3366-e4c1f7cf04ca@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1580258926; bh=lsNeivytM1fE5m38fKCZV7ZmU59h964rXaD0ela0Mgg=;
        h=X-PGP-Universal:Subject:From:To:CC:References:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=evyBlETbmLDaPBN4WZsfCklBrqrRR3u9Cdbly3lYdD6A0UU3gS6s+nxQSxFtCGvNQ
         9wepDJQpakz/kYYL5KPcojK8iVEDYXCwi1tfCQfICkEJht63Hq2G745szsRLqzpFfk
         Wur8gdtT5ecd8/DYWqxCiNn1zp2JqP6wILPWF7JciV70DwmRUo1ALDZ591PMo1/6Gj
         RjUoRZEZpECb8KoC1OHReT6Mv7qg8bYhsW8nq2ruMWuc9Dco8SHJWNwD6YB2Iubjg1
         ypxnm04GAfe/5cXEZg6RqffLsI+WBYTyA/zBcO60W605TYzywIRwfkpoqnEL30y4Ve
         hg873LnD6lepA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 1/28/20 2:13 PM, Sowjanya Komatineni wrote:
>
> On 1/28/20 1:45 PM, Helen Koike wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> Hi Sowjanya,
>>
>> I just took a really quick look, I didn't check the driver in deep,=20
>> so just some small comments below.
>>
>> On 1/28/20 4:23 PM, Sowjanya Komatineni wrote:
>>> Tegra210 contains a powerful Video Input (VI) hardware controller
>>> which can support up to 6 MIPI CSI camera sensors.
>>>
>>> Each Tegra CSI port can be one-to-one mapped to VI channel and can
>>> capture from an external camera sensor connected to CSI or from
>>> built-in test pattern generator.
>>>
>>> Tegra210 supports built-in test pattern generator from CSI to VI.
>>>
>>> This patch adds a V4L2 media controller and capture driver support
>>> for Tegra210 built-in CSI to VI test pattern generator.
>>>
>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> Could you send us the output of media-ctl --print-dot ? So we can=20
>> view the media topology easily?
> root@tegra-ubuntu:/home/ubuntu# ./media-ctl --print-dot
> digraph board {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rankdir=3DTB
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n00000001 [label=3D"54080000.v=
i-output-0\n/dev/video0",=20
> shape=3Dbox, style=3Dfilled, fillcolor=3Dyellow]
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n00000005 [label=3D"54080000.v=
i-output-1\n/dev/video1",=20
> shape=3Dbox, style=3Dfilled, fillcolor=3Dyellow]
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n00000009 [label=3D"54080000.v=
i-output-2\n/dev/video2",=20
> shape=3Dbox, style=3Dfilled, fillcolor=3Dyellow]
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n0000000d [label=3D"54080000.v=
i-output-3\n/dev/video3",=20
> shape=3Dbox, style=3Dfilled, fillcolor=3Dyellow]
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n00000011 [label=3D"54080000.v=
i-output-4\n/dev/video4",=20
> shape=3Dbox, style=3Dfilled, fillcolor=3Dyellow]
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n00000015 [label=3D"54080000.v=
i-output-5\n/dev/video5",=20
> shape=3Dbox, style=3Dfilled, fillcolor=3Dyellow]
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n00000019 [label=3D"{{} | tpg-=
0 | {<port0> 0}}", shape=3DMrecord,=20
> style=3Dfilled, fillcolor=3Dgreen]
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n00000019:port0 -> n00000001
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n0000001d [label=3D"{{} | tpg-=
1 | {<port0> 0}}", shape=3DMrecord,=20
> style=3Dfilled, fillcolor=3Dgreen]
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n0000001d:port0 -> n00000005
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n00000021 [label=3D"{{} | tpg-=
2 | {<port0> 0}}", shape=3DMrecord,=20
> style=3Dfilled, fillcolor=3Dgreen]
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n00000021:port0 -> n00000009
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n00000025 [label=3D"{{} | tpg-=
3 | {<port0> 0}}", shape=3DMrecord,=20
> style=3Dfilled, fillcolor=3Dgreen]
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n00000025:port0 -> n0000000d
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n00000029 [label=3D"{{} | tpg-=
4 | {<port0> 0}}", shape=3DMrecord,=20
> style=3Dfilled, fillcolor=3Dgreen]
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n00000029:port0 -> n00000011
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n0000002d [label=3D"{{} | tpg-=
5 | {<port0> 0}}", shape=3DMrecord,=20
> style=3Dfilled, fillcolor=3Dgreen]
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n0000002d:port0 -> n00000015
> }
>
>>
>>> --- diff --git a/drivers/staging/media/tegra/host1x-video.h=20
>>> b/drivers/staging/media/tegra/host1x-video.h
>>> new file mode 100644
>>> index 000000000000..84d28e6f4362
>>> --- /dev/null
>>> +++ b/drivers/staging/media/tegra/host1x-video.h
>>> @@ -0,0 +1,33 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * Copyright (C) 2020 NVIDIA CORPORATION.=C2=A0 All rights reserved.
>>> + */
>>> +
>>> +#ifndef HOST1X_VIDEO_H
>>> +#define HOST1X_VIDEO_H 1
>>> +
>>> +#include <linux/host1x.h>
>>> +
>>> +#include <media/media-device.h>
>>> +#include <media/media-entity.h>
>>> +#include <media/v4l2-async.h>
>>> +#include <media/v4l2-ctrls.h>
>>> +#include <media/v4l2-device.h>
>>> +#include <media/v4l2-dev.h>
>>> +#include <media/videobuf2-v4l2.h>
>>> +
>>> +#include "tegra-vi.h"
>>> +#include "csi.h"
>>> +
>>> +struct tegra_camera {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_device v4l2_dev;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct media_device media_dev;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct device *dev;
>> You can use cam->media_dev.dev instead of having this pointer.
>>
Will fix in v2
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct tegra_vi *vi;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct tegra_csi_device *csi;
>>> +};
>>> +
>>> +
>>> +#define to_tegra_channel(vdev) \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 container_of(vdev, struct tegra_channel, vide=
o)
>> Why not inline instead of define. Inlines has the advantage of=20
>> checking types.
Will change in v2
>>
>>> +static int __tegra_channel_try_format(struct tegra_channel *chan,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_pi=
x_format *pix,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct t=
egra_video_format=20
>>> **vfmt)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 const struct tegra_video_format *fmt_info;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_subdev *subdev;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_subdev_format fmt;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_subdev_pad_config *pad_cfg;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 subdev =3D tegra_channel_get_remote_subdev(ch=
an);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 pad_cfg =3D v4l2_subdev_alloc_pad_config(subd=
ev);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 if (!pad_cfg)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return -ENOMEM;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Retrieve format information and selec=
t the default format=20
>>> if the
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * requested format isn't supported.
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 fmt_info =3D tegra_core_get_format_by_fourcc(=
chan,=20
>>> pix->pixelformat);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 if (!fmt_info) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 pix->pixelformat =3D chan->format.pixelformat;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 pix->colorspace =3D chan->format.colorspace;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 fmt_info =3D tegra_core_get_format_by_fourcc(chan,
>>> + pix->pixelformat);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 /* Change this when start adding interlace fo=
rmat support */
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 pix->field =3D V4L2_FIELD_NONE;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 fmt.which =3D V4L2_SUBDEV_FORMAT_TRY;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 fmt.pad =3D 0;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 v4l2_fill_mbus_format(&fmt.format, pix, fmt_i=
nfo->code);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 v4l2_subdev_call(subdev, pad, set_fmt, pad_cf=
g, &fmt);
>> As fas as I understand, entities formats should be independent, it is=20
>> up to link_validate
>> to check formats between entities.
>> The capture shouldn't change the format of the subdevice.
>>
Tegra Built-in TPG on CSI accepts specific TPG sizes and CSI is source=20
and VI is sink.

link validation happens only for sink ends of the link.

So with CSI subdev set_fmt sets width/height to default incase if=20
width/height is not from one of the supported sizes.

>>
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 v4l2_fill_pix_format(pix, &fmt.format);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 tegra_channel_fmt_align(chan, &fmt_info->bpp,=
 &pix->width,=20
>>> &pix->height,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 &pix->bytesperline);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 pix->sizeimage =3D pix->bytesperline * pix->h=
eight;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 if (vfmt)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 *vfmt =3D fmt_info;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 v4l2_subdev_free_pad_config(pad_cfg);
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>> +}
>>> +
>>> +static int tegra_channel_try_format(struct file *file, void *fh,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_format *format=
)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_fh *vfh =3D file->private_data;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct tegra_channel *chan =3D to_tegra_chann=
el(vfh->vdev);
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 return __tegra_channel_try_format(chan, &form=
at->fmt.pix, NULL);
>>> +}
>>> +
>>> +static int tegra_channel_set_format(struct file *file, void *fh,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_format *format=
)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_fh *vfh =3D file->private_data;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct tegra_channel *chan =3D to_tegra_chann=
el(vfh->vdev);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 const struct tegra_video_format *info;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 int ret;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_subdev_format fmt;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_subdev *subdev;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_pix_format *pix =3D &format->fmt.=
pix;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 if (vb2_is_busy(&chan->queue))
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return -EBUSY;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 /* get supported format by try_fmt */
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D __tegra_channel_try_format(chan, pix,=
 &info);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return ret;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 subdev =3D tegra_channel_get_remote_subdev(ch=
an);
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 fmt.which =3D V4L2_SUBDEV_FORMAT_ACTIVE;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 fmt.pad =3D 0;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 v4l2_fill_mbus_format(&fmt.format, pix, info-=
>code);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 v4l2_subdev_call(subdev, pad, set_fmt, NULL, =
&fmt);
>> same here.
>>
Calling subdev set_fmt here for the same reason as explained above.
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 v4l2_fill_pix_format(pix, &fmt.format);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 chan->format =3D *pix;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 chan->fmtinfo =3D info;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 tegra_channel_update_format(chan, pix->width,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pix->height, info->fourcc,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &info->bpp,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pix->bytesperline);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 *pix =3D chan->format;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>> +}
>>> +
>>> +static int tegra_channel_enum_input(struct file *file, void *fh,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_input *inp)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 /* Currently driver supports internal TPG onl=
y */
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 if (inp->index !=3D 0)
>> just
>> if (inp->index)
>>
Will update in v2
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return -EINVAL;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 inp->type =3D V4L2_INPUT_TYPE_CAMERA;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 strscpy(inp->name, "Tegra TPG", sizeof(inp->n=
ame));
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>> +}
>>> +static const struct tegra_video_format tegra_default_format =3D {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 /* RAW 10 */
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 TEGRA_VF_RAW10,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 10,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 MEDIA_BUS_FMT_SRGGB10_1X10,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 {2, 1},
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 TEGRA_IMAGE_FORMAT_DEF,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 TEGRA_IMAGE_DT_RAW10,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 V4L2_PIX_FMT_SRGGB10,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 "RGRG.. GBGB..",
>> It would be more readable to do:
>>
>> .code =3D TEGRA_VF_RAW10,
>> .width =3D 10,
>> .code =3D MEDIA_BUS_FMT_SRGGB10_1X10,
>>
>> and so on
Will update in v2
>>
>>> +};
>>> +
>>> +/*
>>> + * Helper functions
>>> + */
>>> +
>>> +/**
>>> + * tegra_core_get_default_format - Get default format
>>> + *
>>> + * Return: pointer to the format where the default format needs
>>> + * to be filled in.
>>> + */
>>> +const struct tegra_video_format *tegra_core_get_default_format(void)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 return &tegra_default_format;
>>> +}
>> This is only used in tegra-channel.c, why not to declare it there as=20
>> static?
>>
Will move all video format retrieval helper functions to corresponding=20
file as static in v2
>>> + +static struct v4l2_frmsize_discrete tegra_csi_tpg_sizes[] =3D {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 {1280, 720},
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 {1920, 1080},
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 {3840, 2160},
>>> +};
>>> +
>>> +/*
>>> + * V4L2 Subdevice Pad Operations
>>> + */
>>> +static int tegra_csi_get_format(struct v4l2_subdev *subdev,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_subdev_pad_config *cfg,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_subdev_format *fmt)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct tegra_csi_channel *csi_chan =3D to_csi=
_chan(subdev);
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 mutex_lock(&csi_chan->format_lock);
>> Do you need this lock? I think there is already a serialization in=20
>> the ioctls in place (to be confirmed).
>>
This is on CSI v4l2 subdevice side during format updates
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 memcpy(fmt, &csi_chan->ports->format,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 siz=
eof(struct v4l2_mbus_framefmt));
>> I would prefer just:
>> *fmt =3D *csi_chan->ports->format;
>>
>> I think it is easier to read IMHO.
>> same in tegra_csi_set_format().
>>
Will fix in v2
>>> + mutex_unlock(&csi_chan->format_lock);
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>> +}
>>> +
>>> +static void tegra_csi_try_mbus_fmt(struct v4l2_subdev *subdev,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_mbus_framefmt *mfmt)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct tegra_csi_channel *csi_chan =3D to_csi=
_chan(subdev);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct tegra_csi_device *csi =3D csi_chan->cs=
i;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 const struct v4l2_frmsize_discrete *sizes;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 int i, j;
>> unsigned
>>
Will fix in v2
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < ARRAY_SIZE(tegra_csi_tpg_fm=
ts); i++) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 struct v4l2_mbus_framefmt *mbus_fmt =3D=20
>>> &tegra_csi_tpg_fmts[i];
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 if (mfmt->code =3D=3D mbus_fmt->code) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (j =3D 0; j <=20
>>> ARRAY_SIZE(tegra_csi_tpg_sizes); j++) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 sizes =3D &tegra_csi_tpg_sizes[j];
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 if (mfmt->width =3D=3D sizes->width &&
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mfmt->height =3D=3D sizes-=
>height) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
turn;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 }
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 dev_info(csi->dev, "using Tegra default RAW10 video=20
>>> format\n");
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 dev_info(csi->dev, "using Tegra default WIDTH=
 X HEIGHT=20
>>> (1920x1080)\n");
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 memcpy(mfmt, tegra_csi_tpg_fmts, sizeof(struc=
t=20
>>> v4l2_mbus_framefmt));
>>> +}
>>> +
>>> +=20
>>
