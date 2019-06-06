Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB0D036D04
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2019 09:09:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726723AbfFFHJU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jun 2019 03:09:20 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:55001 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725782AbfFFHJU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 Jun 2019 03:09:20 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud9.xs4all.net with ESMTPA
        id YmWOhfHgWsDWyYmWRh2Vn1; Thu, 06 Jun 2019 09:09:17 +0200
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
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <15371dbc-9981-bf7e-648c-d321aaa0e1b9@xs4all.nl>
Date:   Thu, 6 Jun 2019 09:09:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190606085159.3454aecb@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfJjGcYLDdjzJqkYV0cc3D96x88vqCg9KwEwwlpoQ/L5Vpu9ZtDsWiNLk6i1AR7ji0TgYzKgLbNeS59Ts96oqcSWTJPLFOorsxsb63kuTJ+NQ5HDsBTFy
 HlugHi5RqBRsJg52TrwwV/Fn7XTjc+OLvqlLCcod+vM1/miTsVuQaKB9Bv0cPsQk7iHxwqAGNC0GDp3kehuyai8KmO0wVzCXLBwfuqE9zBVuKtMzkFlKZZf1
 OTz9aUkhl3LkdGNxJpz/ex0KPUVE3UdbnkZe0dRJmmLv+T1w4VwKwspdezgubNkRxvaD8NXYKftIZarE+e2e0bNa9I40ay8JQAt2NlZ7G8SQrLAv4b7vNZXp
 EDeLoKDc2jvmfOi1w1Qdj78H+uwARQ+OWlcjFzA6MeztfjuV6L0o+38yThNY6NEyrD5FkVU3yMG7MzijXA3vXmVvPrwmBtNxhm1T7z9usF43jKFgwI/43Fvx
 Y/bsr6GRs+RAqYPoflS2hEGb5Tp0hnwfQjnZiO1h3rWeqIbNldNhOAOYI/Ny+4qIR40JYUZ+F2u0/dYD
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/6/19 8:51 AM, Boris Brezillon wrote:
> On Thu, 6 Jun 2019 12:53:57 +0900
> Tomasz Figa <tfiga@chromium.org> wrote:
> 
>> On Thu, Jun 6, 2019 at 1:46 AM Boris Brezillon
>> <boris.brezillon@collabora.com> wrote:
>>>
>>> CAP_M2M_MPLANE means the device supports _MPLANE formats for both
>>> capture and output. Adjust the check to avoid EINVAL errors on
>>> such devices.
>>>
>>> Fixes: 366c719d6479 ("media: v4l2: Get rid of ->vidioc_enum_fmt_vid_{cap,out}_mplane")
>>> Reported-by: Maxime Jourdan <mjourdan@baylibre.com>
>>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
>>> ---
>>>  drivers/media/v4l2-core/v4l2-ioctl.c | 9 +++++++--
>>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
>>> index b4c73e8f23c5..ace9b9761bed 100644
>>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
>>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
>>> @@ -1385,6 +1385,7 @@ static int v4l_enum_fmt(const struct v4l2_ioctl_ops *ops,
>>>         struct video_device *vdev = video_devdata(file);
>>>         struct v4l2_fmtdesc *p = arg;
>>>         int ret = check_fmt(file, p->type);
>>> +       u32 cap_mask;
>>>
>>>         if (ret)
>>>                 return ret;
>>> @@ -1393,7 +1394,9 @@ static int v4l_enum_fmt(const struct v4l2_ioctl_ops *ops,
>>>         switch (p->type) {
>>>         case V4L2_BUF_TYPE_VIDEO_CAPTURE:
>>>         case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
>>> -               if (!!(vdev->device_caps & V4L2_CAP_VIDEO_CAPTURE_MPLANE) !=
>>> +               cap_mask = V4L2_CAP_VIDEO_CAPTURE_MPLANE |
>>> +                          V4L2_CAP_VIDEO_M2M_MPLANE;
>>> +               if (!!(vdev->device_caps & cap_mask) !=  
>>
>> Shouldn't devices that report V4L2_CAP_VIDEO_M2M_MPLANE have also
>> V4L2_CAP_VIDEO_CAPTURE_MPLANE and V4L2_CAP_VIDEO_OUTPUT_MPLANE
>> reported anyway?
> 
> That's the other option, force drivers that set
> V4L2_CAP_VIDEO_M2M_MPLANE to also set
> V4L2_CAP_VIDEO_{CAPTURE,OUTPUT}_MPLANE (or we can let the core do it).
> 

No, we decided at some point not to do that. The M2M cap makes it explicit
that this is a memory to memory device, and it avoids applications from
trying to use it as a webcam since most apps just check for the VIDEO_CAPTURE
capability.

Regards,

	Hans
