Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E8BC34A7C8
	for <lists+linux-media@lfdr.de>; Fri, 26 Mar 2021 14:04:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229982AbhCZNDu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Mar 2021 09:03:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229995AbhCZNDn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Mar 2021 09:03:43 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E5C1C0613AA
        for <linux-media@vger.kernel.org>; Fri, 26 Mar 2021 06:03:42 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id k128so2944773wmk.4
        for <linux-media@vger.kernel.org>; Fri, 26 Mar 2021 06:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynesim-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:references:in-reply-to
         :user-agent:mime-version:content-transfer-encoding;
        bh=pnByEdP+F8ySISIiRZhvGyObOtY7yMK7CtOka9IyJso=;
        b=KFAboZN11OkLz2V2hb/BTp9pvQXtrkzQxmK3SrMsj1dzqindmlpSP51YqSQWREGGd8
         gFy1LgWC4uX8xuPIpGIas8iFsfUzoOrTPn8BFc72Dc+RmvSC69xxPmRSbLqSPSlaNRQ1
         V/YCMLbLSww4Q80k/DV269X2LqE+NIWqAgI0oHkntTcOhaQvSe55N3gCqBRYf87jI/2K
         PrXOXP0wo+weHiTlYs3fpvpIrDn1zZNS5eMT9LgEAFCi48k9uTxeRSL4xp4ygED9Oq5w
         GqdDzK9k3VhTuAaRWrxuk8mwS5p8ekC4azkq3JY/7Ib6msK0VVOtu1s872ZEcYEvTKpS
         1ktw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:references
         :in-reply-to:user-agent:mime-version:content-transfer-encoding;
        bh=pnByEdP+F8ySISIiRZhvGyObOtY7yMK7CtOka9IyJso=;
        b=hKiLBF6tHFCZ70KhJuQH7Vml5eKGdmGo9uBjXJzgmg6fhP4nUquRoCRAC4sfhwsgSA
         Tld8Wyi8amka2pPIiv7fyCCBhSuYJuZAPKPzc/o0BQ6ZFw76FueAE4NPIA/j5MnZOCS5
         oB1zi+puGGsjAZ81VHW2evhmawdH7Z7nivmn+p21HUJe1QwF/K8qYImISogEv1UY/rIk
         PLj9FahXFTd/AYRrpWGrND2/1phnYGh2Eo4FPvnR9w1LRKz5vqrt7didzzb3Zs706l+h
         aYBvJ35ttcpDUFLNqZeJvjZ7so3FlaT2yAFLbnJo7NHnc0gdsM2X5sj7WpKDP3KNiC2M
         PDsg==
X-Gm-Message-State: AOAM530XUwILwvIDi8UEZ637nXwqEj1wdAILvAttWuQ/YWR4jKeddpVi
        oTTCSOD9LDGS+VtFfMNdVSbzAA==
X-Google-Smtp-Source: ABdhPJytjO/q7I6RMfWuWUsFwzUNQaKrL0Deofw+H2JZcemUb8pTUA4JBAYVjCqMXUaEEhtMbtZ9WQ==
X-Received: by 2002:a7b:ce16:: with SMTP id m22mr13319120wmc.65.1616763820853;
        Fri, 26 Mar 2021 06:03:40 -0700 (PDT)
Received: from CTHALPA.outer.uphall.net (cpc1-cmbg20-2-0-cust759.5-4.cable.virginm.net. [86.21.218.248])
        by smtp.gmail.com with ESMTPSA id t20sm11312759wmi.15.2021.03.26.06.03.39
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Fri, 26 Mar 2021 06:03:40 -0700 (PDT)
From:   John Cox <jc@kynesim.co.uk>
To:     Helen Koike <helen.koike@collabora.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        kernel@collabora.com, linux-kernel@vger.kernel.org,
        laurent.pinchart@ideasonboard.com, dave.stevenson@raspberrypi.org,
        tfiga@chromium.org
Subject: Re: [PATCH 1/2] media: videobuf2: use dmabuf size for length
Date:   Fri, 26 Mar 2021 13:03:39 +0000
Message-ID: <8omr5gd5r4qm7d9l6l5grhlgj3c2h7di88@4ax.com>
References: <20210325001712.197837-1-helen.koike@collabora.com> <afno5g9a14fmf7tj1uq0e9pciflop2rv3k@4ax.com> <e67265d4-0641-e6d5-a939-9aa05f2214a6@collabora.com>
In-Reply-To: <e67265d4-0641-e6d5-a939-9aa05f2214a6@collabora.com>
User-Agent: ForteAgent/8.00.32.1272
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Helen

>Hi John,
>
>On 3/25/21 7:20 AM, John Cox wrote:
>> Hi
>>=20
>>> Always use dmabuf size when considering the length of the buffer.
>>> Discard userspace provided length.
>>> Fix length check error in _verify_length(), which was handling single=
 and
>>> multiplanar diferently, and also not catching the case where =
userspace
>>> provides a bigger length and bytesused then the underlying buffer.
>>>
>>> Suggested-by: Hans Verkuil <hverkuil@xs4all.nl>
>>> Signed-off-by: Helen Koike <helen.koike@collabora.com>
>>> ---
>>>
>>> Hello,
>>>
>>> As discussed on
>>> =
https://patchwork.linuxtv.org/project/linux-media/patch/gh5kef5bkeel3o6b2=
dkgc2dfagu9klj4c0@4ax.com/
>>>
>>> This patch also helps the conversion layer of the Ext API patchset,
>>> where we are not exposing the length field.
>>>
>>> It was discussed that userspace might use a smaller length field to
>>> limit the usage of the underlying buffer, but I'm not sure if this is
>>> really usefull and just complicates things.
>>>
>>> If this is usefull, then we should also expose a length field in the =
Ext
>>> API, and document this feature properly.
>>>
>>> What do you think?
>>> ---
>>> .../media/common/videobuf2/videobuf2-core.c   | 21 =
++++++++++++++++---
>>> .../media/common/videobuf2/videobuf2-v4l2.c   |  8 +++----
>>> include/uapi/linux/videodev2.h                |  7 +++++--
>>> 3 files changed, 27 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c =
b/drivers/media/common/videobuf2/videobuf2-core.c
>>> index 02281d13505f..2cbde14af051 100644
>>> --- a/drivers/media/common/videobuf2/videobuf2-core.c
>>> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
>>> @@ -1205,6 +1205,7 @@ static int __prepare_dmabuf(struct vb2_buffer =
*vb)
>>>
>>> 	for (plane =3D 0; plane < vb->num_planes; ++plane) {
>>> 		struct dma_buf *dbuf =3D dma_buf_get(planes[plane].m.fd);
>>> +		unsigned int bytesused;
>>>
>>> 		if (IS_ERR_OR_NULL(dbuf)) {
>>> 			dprintk(q, 1, "invalid dmabuf fd for plane %d\n",
>>> @@ -1213,9 +1214,23 @@ static int __prepare_dmabuf(struct vb2_buffer =
*vb)
>>> 			goto err;
>>> 		}
>>>
>>> -		/* use DMABUF size if length is not provided */
>>> -		if (planes[plane].length =3D=3D 0)
>>> -			planes[plane].length =3D dbuf->size;
>>> +		planes[plane].length =3D dbuf->size;
>>> +		bytesused =3D planes[plane].bytesused ?
>>> +			    planes[plane].bytesused : dbuf->size;
>>> +
>>> +		if (planes[plane].bytesused > planes[plane].length) {
>>> +			dprintk(q, 1, "bytesused is bigger then dmabuf length for plane =
%d\n",
>>> +				plane);
>>> +			ret =3D -EINVAL;
>>> +			goto err;
>>> +		}
>>> +
>>> +		if (planes[plane].data_offset >=3D bytesused) {
>>> +			dprintk(q, 1, "data_offset >=3D bytesused for plane %d\n",
>>> +				plane);
>>> +			ret =3D -EINVAL;
>>> +			goto err;
>>> +		}
>>>
>>> 		if (planes[plane].length < vb->planes[plane].min_length) {
>>> 			dprintk(q, 1, "invalid dmabuf length %u for plane %d, minimum =
length %u\n",
>>> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c =
b/drivers/media/common/videobuf2/videobuf2-v4l2.c
>>> index 7e96f67c60ba..ffc7ed46f74a 100644
>>> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
>>> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
>>> @@ -98,14 +98,14 @@ static int __verify_length(struct vb2_buffer *vb,=
 const struct v4l2_buffer *b)
>>> 	unsigned int bytesused;
>>> 	unsigned int plane;
>>>
>>> -	if (V4L2_TYPE_IS_CAPTURE(b->type))
>>> +	/* length check for dmabuf is performed in _prepare_dmabuf() */
>>> +	if (V4L2_TYPE_IS_CAPTURE(b->type) || b->memory =3D=3D =
VB2_MEMORY_DMABUF)
>>> 		return 0;
>>>
>>> 	if (V4L2_TYPE_IS_MULTIPLANAR(b->type)) {
>>> 		for (plane =3D 0; plane < vb->num_planes; ++plane) {
>>> -			length =3D (b->memory =3D=3D VB2_MEMORY_USERPTR ||
>>> -				  b->memory =3D=3D VB2_MEMORY_DMABUF)
>>> -			       ? b->m.planes[plane].length
>>> +			length =3D b->memory =3D=3D VB2_MEMORY_USERPTR
>>> +				? b->m.planes[plane].length
>>> 				: vb->planes[plane].length;
>>> 			bytesused =3D b->m.planes[plane].bytesused
>>> 				  ? b->m.planes[plane].bytesused : length;
>>> diff --git a/include/uapi/linux/videodev2.h =
b/include/uapi/linux/videodev2.h
>>> index 8d15f6ccc4b4..79b3b2893513 100644
>>> --- a/include/uapi/linux/videodev2.h
>>> +++ b/include/uapi/linux/videodev2.h
>>> @@ -968,7 +968,9 @@ struct v4l2_requestbuffers {
>>> /**
>>>   * struct v4l2_plane - plane info for multi-planar buffers
>>>   * @bytesused:		number of bytes occupied by data in the plane =
(payload)
>>> - * @length:		size of this plane (NOT the payload) in bytes
>>> + * @length:		size of this plane (NOT the payload) in bytes. Filled
>>> + *			by userspace for USERPTR and by the driver for DMABUF
>>> + *			and MMAP.
>>>   * @mem_offset:		when memory in the associated struct v4l2_buffer is
>>>   *			V4L2_MEMORY_MMAP, equals the offset from the start of
>>>   *			the device memory for this plane (or is a "cookie" that
>>> @@ -1025,7 +1027,8 @@ struct v4l2_plane {
>>>   * @m:		union of @offset, @userptr, @planes and @fd
>>>   * @length:	size in bytes of the buffer (NOT its payload) for =
single-plane
>>>   *		buffers (when type !=3D *_MPLANE); number of elements in the
>>> - *		planes array for multi-plane buffers
>>> + *		planes array for multi-plane buffers. Filled by userspace for
>>> + *		USERPTR and by the driver for DMABUF and MMAP.
>>>   * @reserved2:	drivers and applications must zero this field
>>>   * @request_fd: fd of the request that this buffer should use
>>>   * @reserved:	for backwards compatibility with applications that do =
not know
>>=20
>> I think this does what I want. But I'm going to restate my usage =
desires
>> and check that you agree that it covers them.
>>=20
>> I'm interested in passing compressed bitstreams to a decoder.  The =
size
>> of these buffers can be very variable and the worst case will nearly
>> always be much larger than the typical case and that size cannot be
>> known in advance of usage.  It can be very wasteful to have to =
allocate
>> buffers that are over an order of magnitude bigger than are likely to
>> ever be used.  If you have a fixed pool of fixed size buffers =
allocated
>> at the start of time this wastefulness is unavoidable, but dmabufs can
>> be dynamically sized to be as big as required and so there should be =
no
>> limitation on passing in buffers that are smaller than the maximum.  =
It
>
>Do you mean that the kernel should re-allocate the buffer dynamically
>without userspace intervention?
>I'm not entirely sure if this would be possible.

No - I didn't mean that at all.  Any reallocation would be done by the
user.  I was just setting out why damabufs are different from (and more
useful than) MMAP buffers for bitstream-like purposes.

Regards

John Cox

>Regards,
>Helen
>
>
>> also seems plausible that dmabufs that are larger than the maximum
>> should be allowed as long as their bytesused is smaller or equal.
>>=20
>> As an aside, even when using dynamically sized dmabufs they are often
>> way larger than the data they contain and forcing cache flushes or =
maps
>> of their entire length rather than just the used portion is also
>> wasteful.  This might be a use for the incoming size field.
>>=20
>> Regards
>>=20
>> John Cox
>>=20
