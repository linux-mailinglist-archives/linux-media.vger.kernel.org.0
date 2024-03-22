Return-Path: <linux-media+bounces-7585-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC85886865
	for <lists+linux-media@lfdr.de>; Fri, 22 Mar 2024 09:44:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6DD401F220AD
	for <lists+linux-media@lfdr.de>; Fri, 22 Mar 2024 08:44:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC5DC17998;
	Fri, 22 Mar 2024 08:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jS6GBYDR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EAF9F4FA
	for <linux-media@vger.kernel.org>; Fri, 22 Mar 2024 08:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711097071; cv=none; b=pJXd4j6/wnpL3coNKe3h3mYZV1gpoSXAkxDfMwhdH5eApaBmspBHizie654YtR+q+UcLHMxedV3IfYw9qoxbJGId1Ecikc7VCfOzOwwYL5JeghHrw+edXOlDsfGt0pD/xIfM8PKMqHkrVIKo8tm7oBrW4DMFLjTTxFDuUV71Byo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711097071; c=relaxed/simple;
	bh=SxmMHOxaCnc57+03c/bW2aI9l1RD4xgHL9N8Dv1tWyA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MAx39pgX1xnaDFBKdES7Y0REuFguTrTfFqbtt6fcBiZTSlHyZ8u7SWdFtRBWWZpibj4qV7qr+LJbo5F6RZwM04YvXXCVi3hopizhxaQ160l+UIO6uRWhvSb/z8jo9/HYJ4yy0mDGTAk0/m2Odx7iYkcMK5Dz5FxZCpZQnB02u4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jS6GBYDR; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-56be0860060so516685a12.1
        for <linux-media@vger.kernel.org>; Fri, 22 Mar 2024 01:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711097067; x=1711701867; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kdU8R0JCUwSoCa+Mw5IaNMpAemnaAFu7Yqgf3SohedY=;
        b=jS6GBYDRhFdZBILwrcy8OayEJLk9SccxpppAO1rQWoHFYvJiGjk7Bk12Wxc0XLn6vz
         cYAnH6WLWz2lU8P/qcV4vmvzQmhV5ynK7Tngk5BSI4hoYmCm6eFBdlduf6rOZP7uvvBZ
         LDEamHRw7BzcoeK4Y0GqY/pWjOM6oSDXs4GCM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711097067; x=1711701867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kdU8R0JCUwSoCa+Mw5IaNMpAemnaAFu7Yqgf3SohedY=;
        b=KYo9o219fCMbU+xb+3QDMTYpO1sNnH7CTtFlNzxQewLjqDiI3hKu3KxoIBMtmfe7IO
         fTiXerPs9IZbQ+DSndbMy71lFvRZ2yJSxxP/MOEDM99ueg6YM8kYFTt1bltROC5+xoAx
         a0qq8TMdP8E+lXuSrihVJz0SJo7D4SGMxtM9iODmhh5kmpnm0xZ2fFUGgO9sy16xdJO+
         pYR+T3AeAwuz8zKsw15G8ObaPawpu9YuLpvOPBNK74BAgvuSkG9jkVBNFxMsvcSNszQX
         JQIZeKPYcbWryIf9h+b46l0s2bMy6af7z/LUvP4e9kGDYTQskF5tSDTty5uuGz1ywDwT
         beAw==
X-Forwarded-Encrypted: i=1; AJvYcCWDVK/QilclTM6m49rH89Sv0RxZgyH3IbAepZXaKmkJeOOBUbC6GGbADiX3baETRoTdqprNCe7OqHQx5xO8/q1B4fJjfaPhAFoPO+k=
X-Gm-Message-State: AOJu0Yxs99TEK8mvc/IJyiRZHVUvrYMq8KYM0EH6dK9Vu2bjRzZ+jZwV
	BGTwNS6Ff3sDcqMqO9W6Ari5bPvmP39ufsxaDncg2SzUfzuM2/ClWOtcVx0yIa5AsiTxt0McmKA
	=
X-Google-Smtp-Source: AGHT+IEDZDOI3DZBgFumxeOlIqGEAJrRpaFV7hChLdJZZ9+VZSnSyuqM4St++R0sC5jiWNrQ2m5f2w==
X-Received: by 2002:a50:999d:0:b0:56b:c003:16a6 with SMTP id m29-20020a50999d000000b0056bc00316a6mr1161234edb.23.1711097066638;
        Fri, 22 Mar 2024 01:44:26 -0700 (PDT)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com. [209.85.128.50])
        by smtp.gmail.com with ESMTPSA id cs11-20020a0564020c4b00b0056b0af78d80sm363321edb.34.2024.03.22.01.44.26
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Mar 2024 01:44:26 -0700 (PDT)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-41412411672so14554405e9.3
        for <linux-media@vger.kernel.org>; Fri, 22 Mar 2024 01:44:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVYCdq04IZcKch6coTthztBHGBNMus5OdN/XH7pyeFk1sfGtJvg2PUbYy7KfIjxtTBK2C6tSIOjkzEbOEUYSuZRZzkMQBnXWRAeDA0=
X-Received: by 2002:a05:6000:793:b0:341:b846:9b5d with SMTP id
 bu19-20020a056000079300b00341b8469b5dmr680622wrb.52.1711097065450; Fri, 22
 Mar 2024 01:44:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <243a66ad-6dff-4a43-ab03-e01d1038fe8a@xs4all.nl>
 <644a9bfa5f2d3bba8e5c590a8c6fce302279a94b.camel@ndufresne.ca>
 <33dc55fd-a8b6-49ac-a5e3-47af5c75065c@xs4all.nl> <9428d113d271cc9dce723d68611f843eea6094e6.camel@ndufresne.ca>
 <bf73ea2c-795f-44fd-903e-702f7162c399@xs4all.nl>
In-Reply-To: <bf73ea2c-795f-44fd-903e-702f7162c399@xs4all.nl>
From: Tomasz Figa <tfiga@chromium.org>
Date: Fri, 22 Mar 2024 17:44:04 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DU+9H23Guof0knmDp1N2BnK=E31e6ZHJpPESAvQWnY=Q@mail.gmail.com>
Message-ID: <CAAFQd5DU+9H23Guof0knmDp1N2BnK=E31e6ZHJpPESAvQWnY=Q@mail.gmail.com>
Subject: Re: RFC: VIDIOC_ADD_BUFS, a VIDIOC_CREATE_BUFS replacement
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Nicolas Dufresne <nicolas@ndufresne.ca>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 21, 2024 at 7:43=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.nl> w=
rote:
>
> On 16/02/2024 20:49, Nicolas Dufresne wrote:
> > Le lundi 12 f=C3=A9vrier 2024 =C3=A0 09:38 +0100, Hans Verkuil a =C3=A9=
crit :
> >> On 09/02/2024 19:03, Nicolas Dufresne wrote:
> >>> Hi,
> >>>
> >>> Le jeudi 08 f=C3=A9vrier 2024 =C3=A0 09:31 +0100, Hans Verkuil a =C3=
=A9crit :
> >>>> Hi all,
> >>>>
> >>>> Benjamin Gaignard's 'DELETE_BUFS' series [1] is almost ready, but th=
ere is
> >>>> one outstanding issue: it works closely together with VIDIOC_CREATE_=
BUFS,
> >>>> but that ioctl has long since been a thorn in my eye due to the use =
of
> >>>> struct v4l2_format embedded in the struct v4l2_create_buffers. This =
makes
> >>>> it hard to use in applications.
> >>>>
> >>>> The only fields of that struct v4l2_format that are actually used ar=
e:
> >>>>
> >>>> type
> >>>>
> >>>> and, depending on 'type':
> >>>>
> >>>> pix.sizeimage
> >>>> pix_mp.num_planes, pix_mp.plane_fmt.sizeimage
> >>>> sdr.buffersize
> >>>> meta.buffersize
> >>>> vbi.samples_per_line, vbi.count
> >>>> sliced.io_size
> >>>
> >>> Sorry to disrupt, but that is only true since no driver support alloc=
ating for a
> >>> different target input. In stateless CODEC drivers, when these are us=
ed as
> >>> reference frame, extra space is needed to store reference data like m=
otion
> >>> vectors and more.
> >>>
> >>> The size of the data will vary depending on the width/height and pixe=
lformat
> >>> (from which we can deduce the depth). Of course, some driver will onl=
y operate
> >>> with secondary buffer (post processed display buffer), which is the c=
ase for the
> >>> driver this feature is being demonstrated, but won't be true for othe=
r drivers.
> >>>
> >>> I sincerely think this RFC does not work for the use case we are addi=
ng delete
> >>> bufs for.
> >>
> >> I don't understand your reply. I'm not sure if you are talking about t=
he fields
> >> that VIDIOC_CREATE_BUFS uses, or about the proposed new ioctl.
> >>
> >> If you are talking about CREATE_BUFS, then it really is ignoring all o=
ther
> >> fields from the struct v4l2_format. See vb2_create_bufs() in videobuf2=
-v4l2.c.
> >
> > Which demonstrate that the API is not fully implemented. What in my opi=
nion it
> > should be doing is to pass the format structure to the driver try_forma=
t for the
> > adjustments to the format to take place. The updated fmt is then return=
ed like
> > any other calls in V4L2, and buffers are allocated according to that.
>
> No, that's really messy. Really, CREATE_BUFS should just use the buffer s=
ize
> given. If the application wants to call TRY_FMT to obtain the size, then =
it is
> free to do so and just use that in CREATE_BUFS. It is a bad idea to combi=
ne
> TRY_FMT and creating new buffers into one ioctl. It should never have bee=
n
> designed like that, and the fact that for all those years nobody bothered=
 to
> try to do anything with the format field besides getting the buffer size =
clearly
> indicates that. It makes the ioctl much too complicated.

I fully agree with separating format handling from buffer allocation
(and the DRM subsystem does exactly that as well). The same buffer can
be used with multiple different formats, it's only necessary for it to
be big enough to store the image data.

That said, there is one problem with current TRY_FMT semantics - the
assumption is that the format is validated against the current state
of the video device. So for example for a stateful video decoder, the
operation would always return the resolution of the video being
currently decoded and it would only allow some extra rounding (e.g.
stride) and/or pixelformat changes.

We may need to have some state-independent TRY_FMT behavior if we want
to do it this way.

Best regards,
Tomasz

>
> >
> >>
> >> If you are talking about my proposed ADD_BUFS ioctl: what is missing t=
here
> >> that you need?
> >
> > As I explain, allocation size is not something application can calculat=
e easily
> > for codec driver reference frames. Width, height and bitdepth will have=
 an
> > impact on the size in a very hardware specific way. There is a solution=
 of
> > course to use your proposal, which is that user must call TRY_FMT thems=
elf in
> > order to obtain the correct size from the driver (and due to how create=
 bufs in
> > currently implemented by vb2, it is already thecase). I'm not too conce=
rn, we
> > just loose the powerful (or over engineered, up to you to decide) bit o=
f
> > CREATE_BUFS (the API, not its implementation), which could have avoided=
 having
> > to do 2 ioctl. Its likely not a hot path, so again, I'm not worried.
> >
> > I do dislike though that this come up after a year of submitting and up=
dating
> > the original proposal and hope some coding effort will be shared as our=
 budget
> > owners are reaching their tolerance limits.
>
> The only question here is whether to call the new ioctl 'DELETE_BUFS' or =
'REMOVE_BUFS'.
>
> If you have no particular preference, then I will just ask Benjamin to re=
name
> it to REMOVE_BUFS and post a v20. It should be ready to go, hopefully.
>
> Regards,
>
>         Hans
>
> >
> > regards,
> > Nicolas
> >
> >>
> >> Regards,
> >>
> >>      Hans
> >>
> >>>
> >>> Nicolas
> >>>
> >>>>
> >>>> See vb2_create_bufs() in videobuf2-v4l2.c.
> >>>>
> >>>> It's a pain to use since you need to fill in different fields
> >>>> depending on the type in order to allocate the new buffer memory,
> >>>> but all you want is just to give new buffer sizes.
> >>>>
> >>>> I propose to add a new ioctl:
> >>>>
> >>>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/vid=
eodev2.h
> >>>> index 03443833aaaa..a7398e4c85e7 100644
> >>>> --- a/include/uapi/linux/videodev2.h
> >>>> +++ b/include/uapi/linux/videodev2.h
> >>>> @@ -2624,6 +2624,39 @@ struct v4l2_create_buffers {
> >>>>    __u32                   reserved[5];
> >>>>  };
> >>>>
> >>>> +/**
> >>>> + * struct v4l2_add_buffers - VIDIOC_ADD_BUFS argument
> >>>> + * @type: enum v4l2_buf_type
> >>>> + * @memory:       enum v4l2_memory; buffer memory type
> >>>> + * @count:        entry: number of requested buffers,
> >>>> + *                return: number of created buffers
> >>>> + * @num_planes:   requested number of planes for each buffer
> >>>> + * @sizes:        requested plane sizes for each buffer
> >>>> + * @start_index:on return, index of the first created buffer
> >>>> + * @total_count:on return, the total number of allocated buffers
> >>>> + * @capabilities: capabilities of this buffer type.
> >>>> + * @flags:        additional buffer management attributes (ignored =
unless the
> >>>> + *                queue has V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS =
capability
> >>>> + *                and configured for MMAP streaming I/O).
> >>>> + * @max_num_buffers: if V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS capab=
ility flag is set
> >>>> + *                this field indicate the maximum possible number o=
f buffers
> >>>> + *                for this queue.
> >>>> + * @reserved:     future extensions
> >>>> + */
> >>>> +struct v4l2_add_buffers {
> >>>> +  __u32                   type;
> >>>> +  __u32                   memory;
> >>>> +  __u32                   count;
> >>>> +  __u32                   num_planes;
> >>>> +  __u32                   size[VIDEO_MAX_PLANES];
> >>>> +  __u32                   start_index;
> >>>> +  __u32                   total_count;
> >>>> +  __u32                   capabilities;
> >>>> +  __u32                   flags;
> >>>> +  __u32                   max_num_buffers;
> >>>> +  __u32                   reserved[7];
> >>>> +};
> >>>> +
> >>>>  /**
> >>>>   * struct v4l2_delete_buffers - VIDIOC_DELETE_BUFS argument
> >>>>   * @index:        the first buffer to be deleted
> >>>> @@ -2738,6 +2771,7 @@ struct v4l2_delete_buffers {
> >>>>
> >>>>  #define VIDIOC_QUERY_EXT_CTRL     _IOWR('V', 103, struct v4l2_query=
_ext_ctrl)
> >>>>  #define VIDIOC_DELETE_BUFS        _IOWR('V', 104, struct v4l2_delet=
e_buffers)
> >>>> +#define VIDIOC_ADD_BUFS   _IOWR('V', 105, struct v4l2_add_buffers)
> >>>>
> >>>>
> >>>>  /* Reminder: when adding new ioctls please add support for them to
> >>>>
> >>>> Note that this patch sits on top of [1].
> >>>>
> >>>> The new struct is mostly the same as v4l2_create_buffers, but replac=
ing the
> >>>> embedded v4l2_format with just the data it actually needs.  I also r=
enamed
> >>>> 'index' to 'start_index' and added a new 'total_count' field to repo=
rt the
> >>>> total number of buffers. VIDIOC_CREATE_BUFS used the 'index' field f=
or that
> >>>> when called with count =3D=3D 0, but that is awkward once you allow =
for deleting
> >>>> buffers.
> >>>>
> >>>> Implementing VIDIOC_ADD_BUFS would be very easy, it is almost all do=
ne in
> >>>> vb2. Drivers would just need to point .vidioc_add_bufs to vb2_ioctl_=
add_bufs.
> >>>>
> >>>> The vb2_queue ops do not change since those are already based on jus=
t an
> >>>> array of requested sizes.
> >>>>
> >>>> One reason I am bringing this up is that this has a potential impact=
 on the
> >>>> name of the new ioctl in [1]. Do we call it 'VIDIOC_DELETE_BUFS' or
> >>>> 'VIDIOC_REMOVE_BUFS'?
> >>>>
> >>>> I like the ADD/REMOVE pair better than ADD/DELETE. I never quite lik=
ed
> >>>> 'CREATE/DELETE' since buffer memory is only created/deleted in the M=
MAP
> >>>> streaming case, not with DMABUF/USERPTR. I think add/remove are bett=
er names.
> >>>>
> >>>> I think CREATE/REMOVE is also acceptable, so I am leaning towards ca=
lling
> >>>> the new ioctl in [1] VIDIOC_REMOVE_BUFS instead of VIDIOC_DELETE_BUF=
S.
> >>>>
> >>>> So, please comment on this RFC, both whether adding a CREATE_BUFS re=
placement
> >>>> makes sense, and whether using REMOVE_BUFS instead of DELETE_BUFS ma=
kes sense.
> >>>>
> >>>> Ideally it would be nice to introduce both ADD_BUFS and REMOVE_BUFS =
at the
> >>>> same time, so any userspace application that needs to use REMOVE_BUF=
S to
> >>>> remove buffers can rely on the new ADD_BUFS ioctl being available as=
 well.
> >>>>
> >>>> Regards,
> >>>>
> >>>>    Hans
> >>>>
> >>>> [1]: https://patchwork.linuxtv.org/project/linux-media/list/?series=
=3D12195
> >>>
> >>
> >
>
>

