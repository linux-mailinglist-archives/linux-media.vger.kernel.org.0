Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D001E36D17
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2019 09:10:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726092AbfFFHKh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jun 2019 03:10:37 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:45659 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725782AbfFFHKh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 Jun 2019 03:10:37 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud9.xs4all.net with ESMTPA
        id YmXfhfIAMsDWyYmXjh2WA1; Thu, 06 Jun 2019 09:10:35 +0200
Subject: Re: [PATCH] media: v4l2: Fix the _MPLANE format check in
 v4l_enum_fmt()
To:     Boris Brezillon <boris.brezillon@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        kernel@collabora.com, Hirokazu Honda <hiroh@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Maxime Jourdan <mjourdan@baylibre.com>
References: <20190605164625.5109-1-boris.brezillon@collabora.com>
 <CAAFQd5Aji4v7fJZ+at_W58L_0+wC5E9wvSW=gCPLWswFECBMJA@mail.gmail.com>
 <20190606085159.3454aecb@collabora.com>
 <20190606090916.33c78976@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <948b3939-81d4-49a0-c9b4-32261309922e@xs4all.nl>
Date:   Thu, 6 Jun 2019 09:10:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190606090916.33c78976@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfKMAN0wO+a6bqLVSIr4+isktf5uVSO1QkOi2r8d/a6yOGSUg2fGBbW/wMNbQDoT+hpJpThHJkoSZwNPB6/oFMgJUQCjEiTPPDr9AgAnqj83EUeK834zL
 oJnRbkHJt8+TdXnThP4LFS2tsagTjuwxf3b9IM+yI9NTqleigDpHLEFhlaRe6rj3YuKOFW3Quhff6g0ZBgBfDa8PGJ6CxAuC/CKkNryXshjd/yHAqK1NPkwR
 vBEnl/tAoBTfX9tdMavI1sLyENiTuEXxuQ3KJPlK1d6ccEvxBZg60aqhalIz0jiuctuufYynyDNONjUPmifZRYpb75eJGWqxvpzt8z/BvMlAZoZJ+2RNtb/c
 S+yzTalc1uknpaBcGEdtHmMxPo1UVapEhAucblZTf6H+lhXY6o34lsYzM2YhIKxgr/DuvC9+BMxlOWr+L4ABEyIq6XFYxGbx5geL7aoJZyLQFr+YzWssJ6eN
 +HyVGG9DbwwV5xTc4bIFigGqu9XbTpEgl0/sG+zGBh2j9x4xfrQ5SS+WvZoOo7GNAd6PjY8HxKmoDR16
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/6/19 9:09 AM, Boris Brezillon wrote:
> On Thu, 6 Jun 2019 08:51:59 +0200
> Boris Brezillon <boris.brezillon@collabora.com> wrote:
> 
>> On Thu, 6 Jun 2019 12:53:57 +0900
>> Tomasz Figa <tfiga@chromium.org> wrote:
>>
>>> On Thu, Jun 6, 2019 at 1:46 AM Boris Brezillon
>>> <boris.brezillon@collabora.com> wrote:  
>>>>
>>>> CAP_M2M_MPLANE means the device supports _MPLANE formats for both
>>>> capture and output. Adjust the check to avoid EINVAL errors on
>>>> such devices.
>>>>
>>>> Fixes: 366c719d6479 ("media: v4l2: Get rid of ->vidioc_enum_fmt_vid_{cap,out}_mplane")
>>>> Reported-by: Maxime Jourdan <mjourdan@baylibre.com>
>>>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
>>>> ---
>>>>  drivers/media/v4l2-core/v4l2-ioctl.c | 9 +++++++--
>>>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
>>>> index b4c73e8f23c5..ace9b9761bed 100644
>>>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
>>>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
>>>> @@ -1385,6 +1385,7 @@ static int v4l_enum_fmt(const struct v4l2_ioctl_ops *ops,
>>>>         struct video_device *vdev = video_devdata(file);
>>>>         struct v4l2_fmtdesc *p = arg;
>>>>         int ret = check_fmt(file, p->type);
>>>> +       u32 cap_mask;
>>>>
>>>>         if (ret)
>>>>                 return ret;
>>>> @@ -1393,7 +1394,9 @@ static int v4l_enum_fmt(const struct v4l2_ioctl_ops *ops,
>>>>         switch (p->type) {
>>>>         case V4L2_BUF_TYPE_VIDEO_CAPTURE:
>>>>         case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
>>>> -               if (!!(vdev->device_caps & V4L2_CAP_VIDEO_CAPTURE_MPLANE) !=
>>>> +               cap_mask = V4L2_CAP_VIDEO_CAPTURE_MPLANE |
>>>> +                          V4L2_CAP_VIDEO_M2M_MPLANE;
>>>> +               if (!!(vdev->device_caps & cap_mask) !=    
>>>
>>> Shouldn't devices that report V4L2_CAP_VIDEO_M2M_MPLANE have also
>>> V4L2_CAP_VIDEO_CAPTURE_MPLANE and V4L2_CAP_VIDEO_OUTPUT_MPLANE
>>> reported anyway?  
>>
>> That's the other option, force drivers that set
>> V4L2_CAP_VIDEO_M2M_MPLANE to also set
>> V4L2_CAP_VIDEO_{CAPTURE,OUTPUT}_MPLANE (or we can let the core do it).
> 
> That would basically look like this. Hans, let me know if you want me
> to send a new version with the below diff.

No, I don't want that :-)

See my earlier reply for the reason.

Regards,

	Hans

> 
> --->8---
> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> index 29946a2b2752..9cb782c62f69 100644
> --- a/drivers/media/v4l2-core/v4l2-dev.c
> +++ b/drivers/media/v4l2-core/v4l2-dev.c
> @@ -933,6 +933,14 @@ int __video_register_device(struct video_device *vdev,
>         }
>  #endif
>  
> +       /*
> +        * Adjust ->device_caps: CAP_M2M_MPLANE implies CAP_CAPTURE_MPLANES and
> +        * CAP_OUTPUT_MLANES.
> +        */
> +       if (vdev->device_caps & V4L2_CAP_VIDEO_M2M_MPLANE)
> +               vdev->device_caps |= V4L2_CAP_VIDEO_CAPTURE_MPLANE |
> +                                    V4L2_CAP_VIDEO_OUTPUT_MPLANE;
> +
>         /* Pick a device node number */
>         mutex_lock(&videodev_lock);
>         nr = devnode_find(vdev, nr == -1 ? 0 : nr, minor_cnt);
> 

