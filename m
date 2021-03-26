Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1761834AB63
	for <lists+linux-media@lfdr.de>; Fri, 26 Mar 2021 16:23:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230134AbhCZPXV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Mar 2021 11:23:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230080AbhCZPXA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Mar 2021 11:23:00 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D3E5C0613B1
        for <linux-media@vger.kernel.org>; Fri, 26 Mar 2021 08:22:59 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id o16so6074481wrn.0
        for <linux-media@vger.kernel.org>; Fri, 26 Mar 2021 08:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynesim-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:references:in-reply-to
         :user-agent:mime-version:content-transfer-encoding;
        bh=dm4g6QapptOVOUQW996Pyq+yJoWxEg2KCbrqEdCCAt0=;
        b=13B/M+rSS97D+F9gBxb7Md3kWe3+/bdHx8InadP/6Grlt+mYR5bwy/GFsXyakW5eny
         I4LGKGinTGP8Mp4HhMyV7RlwS4e24R/euUaZaBApPZhR5RrleCGzazbdapfiSk2HmTH5
         ayy6VBLLvDJVY4qhdp5Xx8h9J8BZjQjXbtTgUObJ+HMUBTPJTZlASI2FSLkFZtZ74kUc
         UzLI108rvFjrD7jyX4cc/BlpvFBAWxzuEHHg2BKv/ULyZqDbZTqNEqQ4jjDNEAxDzyIn
         kPKfV1Y3bo0H9f7tYUzfscXg6yLRggq+Xie7+LWdll2fQ1PSKFkq1kacuCilh9zaRXIz
         jSQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:references
         :in-reply-to:user-agent:mime-version:content-transfer-encoding;
        bh=dm4g6QapptOVOUQW996Pyq+yJoWxEg2KCbrqEdCCAt0=;
        b=d3l96M8W+zHxc2GXnfmTeb6yIpt+gre5WfMCssWpT7034O+LJpEjKBI4xzV9SemjMt
         UaCQ1x0QeOAlWfSnfe+vNTaNFxI6p3ViTDsNddxhGsFb6P9VCl4D84V9moyXjDNClJU/
         aCDzytCRc4o4xdNZtRTocL5Q713uiZSg+7v9ABZ0yy0NH+1fU7o4xRQZFKOcWSGXACtf
         mAJxwZxRs5kwfONghDlRTLHAnwEAA6qaMqB1b/+vZO+ROimOzLjvYWc6tjenVWRalObi
         LN43noSAgbpSMrulRkRDVB5PVS74GOkvqlJJlL+5hFemMCkhLi+cN3gEzPPmiw+5pAKY
         xS9A==
X-Gm-Message-State: AOAM532oXDm0Z8khhNmcsy8iP42RaKte2iX3zxweQuUJBnojrd4erjI6
        35uzpEBdEgYPVUfLm0AbEUITkw==
X-Google-Smtp-Source: ABdhPJw8sR2d+yq5zHX0UYzkuzctVADltTR3NSI8YIUYPk/p646Ep8NmWLMR81I6oaNpxtztliFc8g==
X-Received: by 2002:a5d:49ca:: with SMTP id t10mr15119972wrs.76.1616772177943;
        Fri, 26 Mar 2021 08:22:57 -0700 (PDT)
Received: from CTHALPA.outer.uphall.net (cpc1-cmbg20-2-0-cust759.5-4.cable.virginm.net. [86.21.218.248])
        by smtp.gmail.com with ESMTPSA id u2sm13359573wrp.12.2021.03.26.08.22.57
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Fri, 26 Mar 2021 08:22:57 -0700 (PDT)
From:   John Cox <jc@kynesim.co.uk>
To:     Helen Koike <helen.koike@collabora.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        kernel@collabora.com, linux-kernel@vger.kernel.org,
        laurent.pinchart@ideasonboard.com, dave.stevenson@raspberrypi.org,
        tfiga@chromium.org
Subject: Re: [PATCH 1/2] media: videobuf2: use dmabuf size for length
Date:   Fri, 26 Mar 2021 15:22:56 +0000
Message-ID: <qjur5g5scmtle1qjg5l6q3anrrbmbl3qjj@4ax.com>
References: <20210325001712.197837-1-helen.koike@collabora.com> <afno5g9a14fmf7tj1uq0e9pciflop2rv3k@4ax.com> <e67265d4-0641-e6d5-a939-9aa05f2214a6@collabora.com> <8omr5gd5r4qm7d9l6l5grhlgj3c2h7di88@4ax.com> <88f114f0-96d1-7c9d-1c0f-19fc1f2a8220@collabora.com>
In-Reply-To: <88f114f0-96d1-7c9d-1c0f-19fc1f2a8220@collabora.com>
User-Agent: ForteAgent/8.00.32.1272
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Helen

>On 3/26/21 10:03 AM, John Cox wrote:
>> Hi Helen
>>=20
>>> Hi John,
>>>
>>> On 3/25/21 7:20 AM, John Cox wrote:
>>>> Hi
>>>>
>>>>> Always use dmabuf size when considering the length of the buffer.
>>>>> Discard userspace provided length.
>>>>> Fix length check error in _verify_length(), which was handling =
single and
>>>>> multiplanar diferently, and also not catching the case where =
userspace
>>>>> provides a bigger length and bytesused then the underlying buffer.
>>>>>
>>>>> Suggested-by: Hans Verkuil <hverkuil@xs4all.nl>
>>>>> Signed-off-by: Helen Koike <helen.koike@collabora.com>
>>>>> ---
>>>>>
>>>>> Hello,
>>>>>
>>>>> As discussed on
>>>>> =
https://patchwork.linuxtv.org/project/linux-media/patch/gh5kef5bkeel3o6b2=
dkgc2dfagu9klj4c0@4ax.com/
>>>>>
>>>>> This patch also helps the conversion layer of the Ext API patchset,
>>>>> where we are not exposing the length field.
>>>>>
>>>>> It was discussed that userspace might use a smaller length field to
>>>>> limit the usage of the underlying buffer, but I'm not sure if this =
is
>>>>> really usefull and just complicates things.
>>>>>
>>>>> If this is usefull, then we should also expose a length field in =
the Ext
>>>>> API, and document this feature properly.
>>>>>
>>>>> What do you think?
>>>>> ---
>>>>> .../media/common/videobuf2/videobuf2-core.c   | 21 =
++++++++++++++++---
>>>>> .../media/common/videobuf2/videobuf2-v4l2.c   |  8 +++----
>>>>> include/uapi/linux/videodev2.h                |  7 +++++--
>>>>> 3 files changed, 27 insertions(+), 9 deletions(-)
>>>>>
>>>>> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c =
b/drivers/media/common/videobuf2/videobuf2-core.c
>>>>> index 02281d13505f..2cbde14af051 100644
>>>>> --- a/drivers/media/common/videobuf2/videobuf2-core.c
>>>>> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
>>>>> @@ -1205,6 +1205,7 @@ static int __prepare_dmabuf(struct vb2_buffer=
 *vb)
>>>>>
>>>>> 	for (plane =3D 0; plane < vb->num_planes; ++plane) {
>>>>> 		struct dma_buf *dbuf =3D dma_buf_get(planes[plane].m.fd);
>>>>> +		unsigned int bytesused;
>>>>>
>>>>> 		if (IS_ERR_OR_NULL(dbuf)) {
>>>>> 			dprintk(q, 1, "invalid dmabuf fd for plane %d\n",
>>>>> @@ -1213,9 +1214,23 @@ static int __prepare_dmabuf(struct =
vb2_buffer *vb)
>>>>> 			goto err;
>>>>> 		}
>>>>>
>>>>> -		/* use DMABUF size if length is not provided */
>>>>> -		if (planes[plane].length =3D=3D 0)
>>>>> -			planes[plane].length =3D dbuf->size;
>>>>> +		planes[plane].length =3D dbuf->size;
>>>>> +		bytesused =3D planes[plane].bytesused ?
>>>>> +			    planes[plane].bytesused : dbuf->size;
>>>>> +
>>>>> +		if (planes[plane].bytesused > planes[plane].length) {
>>>>> +			dprintk(q, 1, "bytesused is bigger then dmabuf length for plane=
 %d\n",
>>>>> +				plane);
>>>>> +			ret =3D -EINVAL;
>>>>> +			goto err;
>>>>> +		}
>>>>> +
>>>>> +		if (planes[plane].data_offset >=3D bytesused) {
>>>>> +			dprintk(q, 1, "data_offset >=3D bytesused for plane %d\n",
>>>>> +				plane);
>>>>> +			ret =3D -EINVAL;
>>>>> +			goto err;
>>>>> +		}
>>>>>
>>>>> 		if (planes[plane].length < vb->planes[plane].min_length) {
>>>>> 			dprintk(q, 1, "invalid dmabuf length %u for plane %d, minimum =
length %u\n",
>>>>> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c =
b/drivers/media/common/videobuf2/videobuf2-v4l2.c
>>>>> index 7e96f67c60ba..ffc7ed46f74a 100644
>>>>> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
>>>>> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
>>>>> @@ -98,14 +98,14 @@ static int __verify_length(struct vb2_buffer =
*vb, const struct v4l2_buffer *b)
>>>>> 	unsigned int bytesused;
>>>>> 	unsigned int plane;
>>>>>
>>>>> -	if (V4L2_TYPE_IS_CAPTURE(b->type))
>>>>> +	/* length check for dmabuf is performed in _prepare_dmabuf() */
>>>>> +	if (V4L2_TYPE_IS_CAPTURE(b->type) || b->memory =3D=3D =
VB2_MEMORY_DMABUF)
>>>>> 		return 0;
>>>>>
>>>>> 	if (V4L2_TYPE_IS_MULTIPLANAR(b->type)) {
>>>>> 		for (plane =3D 0; plane < vb->num_planes; ++plane) {
>>>>> -			length =3D (b->memory =3D=3D VB2_MEMORY_USERPTR ||
>>>>> -				  b->memory =3D=3D VB2_MEMORY_DMABUF)
>>>>> -			       ? b->m.planes[plane].length
>>>>> +			length =3D b->memory =3D=3D VB2_MEMORY_USERPTR
>>>>> +				? b->m.planes[plane].length
>>>>> 				: vb->planes[plane].length;
>>>>> 			bytesused =3D b->m.planes[plane].bytesused
>>>>> 				  ? b->m.planes[plane].bytesused : length;
>>>>> diff --git a/include/uapi/linux/videodev2.h =
b/include/uapi/linux/videodev2.h
>>>>> index 8d15f6ccc4b4..79b3b2893513 100644
>>>>> --- a/include/uapi/linux/videodev2.h
>>>>> +++ b/include/uapi/linux/videodev2.h
>>>>> @@ -968,7 +968,9 @@ struct v4l2_requestbuffers {
>>>>> /**
>>>>>    * struct v4l2_plane - plane info for multi-planar buffers
>>>>>    * @bytesused:		number of bytes occupied by data in the plane =
(payload)
>>>>> - * @length:		size of this plane (NOT the payload) in bytes
>>>>> + * @length:		size of this plane (NOT the payload) in bytes. Filled
>>>>> + *			by userspace for USERPTR and by the driver for DMABUF
>>>>> + *			and MMAP.
>>>>>    * @mem_offset:		when memory in the associated struct v4l2_buffer=
 is
>>>>>    *			V4L2_MEMORY_MMAP, equals the offset from the start of
>>>>>    *			the device memory for this plane (or is a "cookie" that
>>>>> @@ -1025,7 +1027,8 @@ struct v4l2_plane {
>>>>>    * @m:		union of @offset, @userptr, @planes and @fd
>>>>>    * @length:	size in bytes of the buffer (NOT its payload) for =
single-plane
>>>>>    *		buffers (when type !=3D *_MPLANE); number of elements in the
>>>>> - *		planes array for multi-plane buffers
>>>>> + *		planes array for multi-plane buffers. Filled by userspace for
>>>>> + *		USERPTR and by the driver for DMABUF and MMAP.
>>>>>    * @reserved2:	drivers and applications must zero this field
>>>>>    * @request_fd: fd of the request that this buffer should use
>>>>>    * @reserved:	for backwards compatibility with applications that =
do not know
>>>>
>>>> I think this does what I want. But I'm going to restate my usage =
desires
>>>> and check that you agree that it covers them.
>>>>
>>>> I'm interested in passing compressed bitstreams to a decoder.  The =
size
>>>> of these buffers can be very variable and the worst case will nearly
>>>> always be much larger than the typical case and that size cannot be
>>>> known in advance of usage.  It can be very wasteful to have to =
allocate
>>>> buffers that are over an order of magnitude bigger than are likely =
to
>>>> ever be used.  If you have a fixed pool of fixed size buffers =
allocated
>>>> at the start of time this wastefulness is unavoidable, but dmabufs =
can
>>>> be dynamically sized to be as big as required and so there should be=
 no
>>>> limitation on passing in buffers that are smaller than the maximum. =
 It
>>>
>>> Do you mean that the kernel should re-allocate the buffer dynamically
>>> without userspace intervention?
>>> I'm not entirely sure if this would be possible.
>>=20
>> No - I didn't mean that at all.  Any reallocation would be done by the
>> user.  I was just setting out why damabufs are different from (and =
more
>> useful than) MMAP buffers for bitstream-like purposes.
>
>Right, thanks for the clarification.
>
>>=20
>> Regards
>>=20
>> John Cox
>>=20
>>> Regards,
>>> Helen
>>>
>>>
>>>> also seems plausible that dmabufs that are larger than the maximum
>>>> should be allowed as long as their bytesused is smaller or equal.
>
>If I understand correctly, the requirements would be:
>
>(consider maximum being the length/boundary provided by userspace).
>
>(1) bytesused <=3D maximum && bytesused <=3D dmabuf_length, this must =
always be true.
>(2) maximum <=3D dmabuf_length is always ok.
>(3) dmabuf_length <=3D maximum is ok as long (1) is still true.
>if dmabuf_length <=3D maximum, but bytesused > maximum, then it is not =
ok.
>
>Make sense?
>
>We could save in vb2:
>bytesused_max =3D maximum ? min(maximum, dmabuf_length) : dmabuf_length;
>
>Then drivers could check if if bytesused <=3D bytesused_max,
>and we don't need to check dma_length against the maximum value.
>
>Or maybe there is little value in letting userspace define a maximum.
>
>What do you think we should do? Remove the maximum (as implemented in =
this patch)?
>Or just comparing against bytesused_max is enough (which would keeping =
the boundary
>feature) ?
>
>I would prefer to remove the maximum if there is no value for userspace,=
 since
>this would make things easier for the Ext API implementation.

=46rom my personal PoV, for an OUTPUT buffer, as long as the data fits in
the buffer i.e. bytesused <=3D dmabuf_length then that is all I really
care about. Other peoples mileage may vary!

Thanks

JC


>>>>
>>>> As an aside, even when using dynamically sized dmabufs they are =
often
>>>> way larger than the data they contain and forcing cache flushes or =
maps
>>>> of their entire length rather than just the used portion is also
>>>> wasteful.  This might be a use for the incoming size field.
>
>I guess this can be achieved using the bytesused field.
>
>Regards,
>Helen
>
>>>>
>>>> Regards
>>>>
>>>> John Cox
>>>>
