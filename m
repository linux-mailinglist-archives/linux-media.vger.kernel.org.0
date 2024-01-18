Return-Path: <linux-media+bounces-3860-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC1B8318A8
	for <lists+linux-media@lfdr.de>; Thu, 18 Jan 2024 12:48:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8D071F23C52
	for <lists+linux-media@lfdr.de>; Thu, 18 Jan 2024 11:48:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DBAF241FF;
	Thu, 18 Jan 2024 11:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="sXwkHAfQ"
X-Original-To: linux-media@vger.kernel.org
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49413241EC
	for <linux-media@vger.kernel.org>; Thu, 18 Jan 2024 11:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705578516; cv=none; b=mDJSCLfh+J65N+InuSxxZfw2gmKaMvHBNdCjBDe/JBpL3fegzejZSRGanDIcJv3+EvicoyMHrY7sLrIwk7VKvwx7pFjfEgGd5Lmf9sJuEBwqPq7SCHauVtXV50iP5d7R8Q8QP7zxIrqB2tpgL5KtcWDakJMDoQ0MPQhd+0i7tBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705578516; c=relaxed/simple;
	bh=XczugnXPdpLdguk5UpHMagN6eY5M8TNYEhntKJvdQCY=;
	h=X-KPN-MessageId:Received:DKIM-Signature:X-KPN-MID:
	 X-KPN-VerifiedSender:X-CMASSUN:X-Originating-IP:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:
	 To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding; b=FsP1JWLoUlV1DCbkkywy7PJGQrSa4XsjIDnFPXogjhs42GH9Xs4BpXNqhRQkkIfxjdjNYIq36W3Ly1uFJcwbabdeVbrsQIZ9dy3pdYsoNI2ww/8lH3WTXoGEdsqN0iMParyob+1LPlztwH85ff2Q0fAnrfatIjBC06i6RA6gGMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xs4all.nl; spf=pass smtp.mailfrom=xs4all.nl; dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b=sXwkHAfQ; arc=none smtp.client-ip=195.121.94.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
X-KPN-MessageId: 41d2ae9c-b5f7-11ee-90ec-00505699b430
Received: from smtp.kpnmail.nl (unknown [10.31.155.6])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 41d2ae9c-b5f7-11ee-90ec-00505699b430;
	Thu, 18 Jan 2024 12:46:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=content-type:from:to:subject:mime-version:date:message-id;
	bh=5Qo/1ghxjPjNB5I+Qg/SDDcMEyAga2Ypg3CtHTjA60E=;
	b=sXwkHAfQCuLfZGiDElKDzrjK0IAIMkcNACWYnaniG10e/KC8+pnMIQbkYHsM7MEgOVoFQlsiHFYzP
	 wvb5umDtJ9q1YwvjdsaEzVdOt8N83khUU2PFfL3Mp1eoVt5zR1BYwCf7eYG/iBLfHsWWa+J7M046Cr
	 oDkB1jQkqp1lFQ3Vm/KVlcjOVoTyO/CoIlAoMcMYg5bwDtq8nTz9A/4xCNzXlPLo9NZQ1vKZ6FiUPq
	 KWoSqs6DFT4aVrjJhbb7cx5WcHIri8AS2q8h8YOrT4re1mjfka0Wmo+fv8EuOKag5NJAbXeQLz9APw
	 8qKIIUPRLJeoknXJxuMk3Fej84g66qQ==
X-KPN-MID: 33|TmjOF+JxKNrm1nzf04VPe55KswCNh/4PYrjvsM1o49Y2LXZRL8ntzNi/wSDbZhu
 o086LZyiSQaLFu+F2aPAD7jkS/46d/8a9sUUQCLLAb7Q=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|SZ4VrOL+PhrVGVokkJRMP2SMEXJb+7c8zq7uTauVkxRXDukej4OV0IRd4pTGOEU
 5ZvjdFpPAVnHUs9MeVCKLxQ==
Received: from [10.47.75.249] (unknown [173.38.220.58])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id 570887e0-b5f7-11ee-9dc8-00505699772e;
	Thu, 18 Jan 2024 12:47:22 +0100 (CET)
Message-ID: <ec90fefb-fe81-4766-bd81-7bfcfbc6ddbd@xs4all.nl>
Date: Thu, 18 Jan 2024 12:47:21 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: vb2: refactor setting flags and caps, fix missing
 cap
Content-Language: en-US
To: Tomasz Figa <tfiga@chromium.org>
Cc: m.szyprowski@samsung.com, mchehab@kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 linux-media@vger.kernel.org, kernel@collabora.com
References: <5df8141c-c0eb-4f55-b380-94cda08bd5ad@xs4all.nl>
 <CAAFQd5BGCNj4PDV2BVP=77yM8rzugu0U_7X0T4EiOnZkTSzx1A@mail.gmail.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <CAAFQd5BGCNj4PDV2BVP=77yM8rzugu0U_7X0T4EiOnZkTSzx1A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 1/18/24 12:14, Tomasz Figa wrote:
> Hi Hans,
> 
> On Tue, Jan 16, 2024 at 11:05 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>
>> Several functions implementing VIDIOC_REQBUFS and _CREATE_BUFS all use almost
>> the same code to fill in the flags and capability fields. Refactor this into a
>> new vb2_set_flags_and_caps() function that replaces the old fill_buf_caps()
>> and validate_memory_flags() functions.
>>
>> This also fixes a bug where vb2_ioctl_create_bufs() would not set the
>> V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS cap and also not fill in the
>> max_num_buffers field.
>>
>> Fixes: d055a76c0065 ("media: core: Report the maximum possible number of buffers for the queue")
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> ---
>>  .../media/common/videobuf2/videobuf2-v4l2.c   | 55 +++++++++----------
>>  1 file changed, 26 insertions(+), 29 deletions(-)
>>
> 
> Thanks for the patch! Please check my comments inline.
> 
>> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
>> index 54d572c3b515..c575198e8354 100644
>> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
>> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
>> @@ -671,8 +671,20 @@ int vb2_querybuf(struct vb2_queue *q, struct v4l2_buffer *b)
>>  }
>>  EXPORT_SYMBOL(vb2_querybuf);
>>
>> -static void fill_buf_caps(struct vb2_queue *q, u32 *caps)
>> +static void vb2_set_flags_and_caps(struct vb2_queue *q, u32 memory,
>> +                                  u32 *flags, u32 *caps, u32 *max_num_bufs)
>>  {
>> +       if (!q->allow_cache_hints || memory != V4L2_MEMORY_MMAP) {
>> +               /*
>> +                * This needs to clear V4L2_MEMORY_FLAG_NON_COHERENT only,
>> +                * but in order to avoid bugs we zero out all bits.
>> +                */
>> +               *flags = 0;
>> +       } else {
>> +               /* Clear all unknown flags. */
>> +               *flags &= V4L2_MEMORY_FLAG_NON_COHERENT;
>> +       }
>> +
>>         *caps = V4L2_BUF_CAP_SUPPORTS_ORPHANED_BUFS;
>>         if (q->io_modes & VB2_MMAP)
>>                 *caps |= V4L2_BUF_CAP_SUPPORTS_MMAP;
>> @@ -686,21 +698,9 @@ static void fill_buf_caps(struct vb2_queue *q, u32 *caps)
>>                 *caps |= V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS;
>>         if (q->supports_requests)
>>                 *caps |= V4L2_BUF_CAP_SUPPORTS_REQUESTS;
>> -}
>> -
>> -static void validate_memory_flags(struct vb2_queue *q,
>> -                                 int memory,
>> -                                 u32 *flags)
>> -{
>> -       if (!q->allow_cache_hints || memory != V4L2_MEMORY_MMAP) {
>> -               /*
>> -                * This needs to clear V4L2_MEMORY_FLAG_NON_COHERENT only,
>> -                * but in order to avoid bugs we zero out all bits.
>> -                */
>> -               *flags = 0;
>> -       } else {
>> -               /* Clear all unknown flags. */
>> -               *flags &= V4L2_MEMORY_FLAG_NON_COHERENT;
>> +       if (max_num_bufs) {
>> +               *max_num_bufs = q->max_num_buffers;
>> +               *caps |= V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS;
>>         }
>>  }
>>
>> @@ -709,8 +709,8 @@ int vb2_reqbufs(struct vb2_queue *q, struct v4l2_requestbuffers *req)
>>         int ret = vb2_verify_memory_type(q, req->memory, req->type);
>>         u32 flags = req->flags;
> 
> I think we have a bug here, we check the memory type, but just let the
> code continue even if it's invalid.

It should be harmless. The old code did the same, BTW.

> 
>>
>> -       fill_buf_caps(q, &req->capabilities);
>> -       validate_memory_flags(q, req->memory, &flags);
>> +       vb2_set_flags_and_caps(q, req->memory, &flags,
>> +                              &req->capabilities, NULL);
>>         req->flags = flags;
>>         return ret ? ret : vb2_core_reqbufs(q, req->memory,
>>                                             req->flags, &req->count);
>> @@ -751,11 +751,9 @@ int vb2_create_bufs(struct vb2_queue *q, struct v4l2_create_buffers *create)
>>         int ret = vb2_verify_memory_type(q, create->memory, f->type);
>>         unsigned i;
>>
> 
> Ditto.
> 
>> -       fill_buf_caps(q, &create->capabilities);
>> -       validate_memory_flags(q, create->memory, &create->flags);
>>         create->index = vb2_get_num_buffers(q);
>> -       create->max_num_buffers = q->max_num_buffers;
>> -       create->capabilities |= V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS;
>> +       vb2_set_flags_and_caps(q, create->memory, &create->flags,
>> +                              &create->capabilities, &create->max_num_buffers);
>>         if (create->count == 0)
>>                 return ret != -EBUSY ? ret : 0;
>>
>> @@ -1006,8 +1004,8 @@ int vb2_ioctl_reqbufs(struct file *file, void *priv,
>>         int res = vb2_verify_memory_type(vdev->queue, p->memory, p->type);
>>         u32 flags = p->flags;
>>
>> -       fill_buf_caps(vdev->queue, &p->capabilities);
>> -       validate_memory_flags(vdev->queue, p->memory, &flags);
>> +       vb2_set_flags_and_caps(vdev->queue, p->memory, &flags,
>> +                              &p->capabilities, NULL);
> 
> Could we just call vb2_reqbufs() instead of vb2_core_reqbufs() and
> avoid all the duplicate checks?
> 
>>         p->flags = flags;
>>         if (res)
>>                 return res;
>> @@ -1026,12 +1024,11 @@ int vb2_ioctl_create_bufs(struct file *file, void *priv,
>>                           struct v4l2_create_buffers *p)
>>  {
>>         struct video_device *vdev = video_devdata(file);
>> -       int res = vb2_verify_memory_type(vdev->queue, p->memory,
>> -                       p->format.type);
>> +       int res = vb2_verify_memory_type(vdev->queue, p->memory, p->format.type);
>>
>> -       p->index = vdev->queue->num_buffers;
>> -       fill_buf_caps(vdev->queue, &p->capabilities);
>> -       validate_memory_flags(vdev->queue, p->memory, &p->flags);
>> +       p->index = vb2_get_num_buffers(vdev->queue);
>> +       vb2_set_flags_and_caps(vdev->queue, p->memory, &p->flags,
>> +                              &p->capabilities, &p->max_num_buffers);
> 
> This function in fact already calls vb2_create_bufs() which includes
> all the checks above, except the one for vb2_queue_is_bus() that
> continues down below, so maybe we can just remove them?

Same answer for both reqbufs and create_bufs: it has to do with the
order in which checks are done.

When using vb2_ioctl_reqbufs you want to first check vb2_verify_memory_type()
and return if that's wrong. Next you check if the queue is busy and return
-EBUSY. Only then do you call vb2_core_reqbufs() (or vb2_create_bufs()).

Note that this is a fixes patch (that should have been in the subject, sorry
for that), and I don't want to make more changes than strictly necessary.

What really should happen is that the last users of vb2_reqbufs and
vb2_create_bufs are converted to use vb2_ioctl_reqbufs/create_bufs. But
that's another story.

Regards,

	Hans

> 
> Best regards,
> Tomasz
> 
>>         /*
>>          * If count == 0, then just check if memory and type are valid.
>>          * Any -EBUSY result from vb2_verify_memory_type can be mapped to 0.
>> --
>> 2.42.0
>>
>>


