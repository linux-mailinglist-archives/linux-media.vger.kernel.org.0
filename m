Return-Path: <linux-media+bounces-5571-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E81D85E17D
	for <lists+linux-media@lfdr.de>; Wed, 21 Feb 2024 16:39:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 818D51C24477
	for <lists+linux-media@lfdr.de>; Wed, 21 Feb 2024 15:39:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EE4D8063D;
	Wed, 21 Feb 2024 15:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="iRgxtNtJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A72D8060A
	for <linux-media@vger.kernel.org>; Wed, 21 Feb 2024 15:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708529980; cv=none; b=WBPqsPYPsYkPcro6sz3G2XqyLz2MM4oWiJX2lXGPdAlqiM3VwUKyz2zlF09jVcO/q6nUwcHla5/crr4c2fy6YBC2SNTXgeZTRzPP1uhvaHnCW/1ARs8OrFOpazDHPyCYr/N/V3qt0CyqbtK+Ng6eT2GbOXGhZwW7hxY6Uv8o1cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708529980; c=relaxed/simple;
	bh=JbbUSt71szzfE4oZqP5qnDa1YtRatfeAneh6T5tT5l8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jlEM3fJiMWcXCZoBrrKSEm0IY/Xjm0tf9UscYrkVOuvWLiG3x9lri4Ldw/Eqgo00jW3wUz8dHH3KdDVcHtZfDFStil4ZcRMNCWRaQ/3jaQ7m5L52M8Nc1zBxSlquBOBr64QbGwE9hQ78Cl1BvGhE6Bgz7CxZbWi0fISwIKDgxF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=iRgxtNtJ; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-42c7a7596d0so47187781cf.0
        for <linux-media@vger.kernel.org>; Wed, 21 Feb 2024 07:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1708529977; x=1709134777; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=35h7duTKFySTke6HCFl1eP4Y97IUm/ARLKHh9me2R0A=;
        b=iRgxtNtJPSCaDa8JHLMSA6rLOA2h1UcO4xLcurfOZXh3T7gK/n3wqQpA66+apjtUUZ
         tfr1/OjaMB9Gb454rp9hgNgfidbOaV0ajmWhN9fljFh8h5HYBnKVDvk2O/3BRi/IHIJb
         g/wRUQKm/EKRSGZoKiLeUxEOF0RH97VRcV36gqbV/460Weug4NIOf56t1Ou9999YluKs
         fw7YetgZYR0ySKTC2oLbTFcsXKf0C0Dg+FMFqDAyyWrx/05RNSVApNQRSwfjbybkwymV
         w671iipq/2M48iKJkNSRzAs6/mpPKgFsOJ5W2xGxoKZPtuB1t28JGYyXqkxXo3VtkRLP
         TMHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708529977; x=1709134777;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=35h7duTKFySTke6HCFl1eP4Y97IUm/ARLKHh9me2R0A=;
        b=jUPZj3e9AyXrbp223AYZUBdjkJ0EpRPgDBm7aSXyvzPTzsr3rW71XTrp5+ekYDeZIn
         VPER5GY+Itm+iJXTvU33VpmlTSbInWYxGrtpoaMH2e6V5xKfT5rAqeKjvNY9cxjkPSsN
         uKFjSJJ0hs3Kg91TJceKv94cSpDsl2PkDrVyBNAczsMLaYnDCopMBme29Uu6YldFa9Gt
         jYPWgaJa1u5D50LBsblIUJ4qUhLDLdWqZ0yEALdv9mfAld6L8DHQu+Sdo6dbJbM087g2
         BorZquHdRTRiE4pUJAfCOcCuOHU8OsxoOrCm2mc14TKpPCKJY8UO5S8xIRVIoJ/9fB69
         dWwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNtPP1S4pmpDdC2UJ6dnD7YSQqS5pCZkBikT0BhDYKWJRzvHfGbMqnGV+abe/d4w0JtX/VP0Robm/PBZ6NNbijMSdIDvsvwiVIr+o=
X-Gm-Message-State: AOJu0YzjEUG4VtoxOoimy4Waisyquyq2pdmCopWtvne9nPxAfpa3bq5z
	FB8MOgpd5XvCtZ6L8UB+VfKEqSCYcQhpiJY6VPNunMp3ZQ+aiCNwy4qChK2ed23BmDRM0RUZrSf
	8
X-Google-Smtp-Source: AGHT+IF/YyMygTwU1h8/jMnYL/WtD8iTswL9tE8Wkg7MMYG2fc7O15c6pKs13y1duK+7AegmAADC3w==
X-Received: by 2002:a05:622a:254:b0:42d:a679:45fe with SMTP id c20-20020a05622a025400b0042da67945femr22243789qtx.46.1708529977391;
        Wed, 21 Feb 2024 07:39:37 -0800 (PST)
Received: from nicolas-tpx395.localdomain ([2606:6d00:11:3354::7a9])
        by smtp.gmail.com with ESMTPSA id s21-20020a05622a1a9500b0042e3468a98csm818450qtc.4.2024.02.21.07.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 07:39:37 -0800 (PST)
Message-ID: <a68f851919797244d3dab40267428a6367e0ff3c.camel@ndufresne.ca>
Subject: Re: RFC: VIDIOC_ADD_BUFS, a VIDIOC_CREATE_BUFS replacement
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Hans Verkuil <hverkuil@xs4all.nl>, Linux Media Mailing List
	 <linux-media@vger.kernel.org>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Date: Wed, 21 Feb 2024 10:39:36 -0500
In-Reply-To: <bf73ea2c-795f-44fd-903e-702f7162c399@xs4all.nl>
References: <243a66ad-6dff-4a43-ab03-e01d1038fe8a@xs4all.nl>
	 <644a9bfa5f2d3bba8e5c590a8c6fce302279a94b.camel@ndufresne.ca>
	 <33dc55fd-a8b6-49ac-a5e3-47af5c75065c@xs4all.nl>
	 <9428d113d271cc9dce723d68611f843eea6094e6.camel@ndufresne.ca>
	 <bf73ea2c-795f-44fd-903e-702f7162c399@xs4all.nl>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual; keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le mercredi 21 f=C3=A9vrier 2024 =C3=A0 11:43 +0100, Hans Verkuil a =C3=A9c=
rit=C2=A0:
> On 16/02/2024 20:49, Nicolas Dufresne wrote:
> > Le lundi 12 f=C3=A9vrier 2024 =C3=A0 09:38 +0100, Hans Verkuil a =C3=A9=
crit=C2=A0:
> > > On 09/02/2024 19:03, Nicolas Dufresne wrote:
> > > > Hi,
> > > >=20
> > > > Le jeudi 08 f=C3=A9vrier 2024 =C3=A0 09:31 +0100, Hans Verkuil a =
=C3=A9crit=C2=A0:
> > > > > Hi all,
> > > > >=20
> > > > > Benjamin Gaignard's 'DELETE_BUFS' series [1] is almost ready, but=
 there is
> > > > > one outstanding issue: it works closely together with VIDIOC_CREA=
TE_BUFS,
> > > > > but that ioctl has long since been a thorn in my eye due to the u=
se of
> > > > > struct v4l2_format embedded in the struct v4l2_create_buffers. Th=
is makes
> > > > > it hard to use in applications.
> > > > >=20
> > > > > The only fields of that struct v4l2_format that are actually used=
 are:
> > > > >=20
> > > > > type
> > > > >=20
> > > > > and, depending on 'type':
> > > > >=20
> > > > > pix.sizeimage
> > > > > pix_mp.num_planes, pix_mp.plane_fmt.sizeimage
> > > > > sdr.buffersize
> > > > > meta.buffersize
> > > > > vbi.samples_per_line, vbi.count
> > > > > sliced.io_size
> > > >=20
> > > > Sorry to disrupt, but that is only true since no driver support all=
ocating for a
> > > > different target input. In stateless CODEC drivers, when these are =
used as
> > > > reference frame, extra space is needed to store reference data like=
 motion
> > > > vectors and more.
> > > >=20
> > > > The size of the data will vary depending on the width/height and pi=
xelformat
> > > > (from which we can deduce the depth). Of course, some driver will o=
nly operate
> > > > with secondary buffer (post processed display buffer), which is the=
 case for the
> > > > driver this feature is being demonstrated, but won't be true for ot=
her drivers.
> > > >=20
> > > > I sincerely think this RFC does not work for the use case we are ad=
ding delete
> > > > bufs for.
> > >=20
> > > I don't understand your reply. I'm not sure if you are talking about =
the fields
> > > that VIDIOC_CREATE_BUFS uses, or about the proposed new ioctl.
> > >=20
> > > If you are talking about CREATE_BUFS, then it really is ignoring all =
other
> > > fields from the struct v4l2_format. See vb2_create_bufs() in videobuf=
2-v4l2.c.
> >=20
> > Which demonstrate that the API is not fully implemented. What in my opi=
nion it
> > should be doing is to pass the format structure to the driver try_forma=
t for the
> > adjustments to the format to take place. The updated fmt is then return=
ed like
> > any other calls in V4L2, and buffers are allocated according to that.
>=20
> No, that's really messy. Really, CREATE_BUFS should just use the buffer s=
ize
> given. If the application wants to call TRY_FMT to obtain the size, then =
it is
> free to do so and just use that in CREATE_BUFS. It is a bad idea to combi=
ne

There is no IF here, generic application must defer to the driver the
calculation of the strides (bytesperline) and plane sizes. Otherwise, users=
pace
must hardcode HW specific details (like gralloc/Android and minigbm(chromeo=
s)).
We don't want this for generic Linux software.

> TRY_FMT and creating new buffers into one ioctl. It should never have bee=
n
> designed like that, and the fact that for all those years nobody bothered=
 to
> try to do anything with the format field besides getting the buffer size =
clearly
> indicates that. It makes the ioctl much too complicated.

Fine, if you don't think the original design is worth the intended optimiza=
tion.

>=20
> >=20
> > >=20
> > > If you are talking about my proposed ADD_BUFS ioctl: what is missing =
there
> > > that you need?
> >=20
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
> >=20
> > I do dislike though that this come up after a year of submitting and up=
dating
> > the original proposal and hope some coding effort will be shared as our=
 budget
> > owners are reaching their tolerance limits.
>=20
> The only question here is whether to call the new ioctl 'DELETE_BUFS' or =
'REMOVE_BUFS'.
>=20
> If you have no particular preference, then I will just ask Benjamin to re=
name
> it to REMOVE_BUFS and post a v20. It should be ready to go, hopefully.

Works for me, we'll rename it REMOVE_BUFS, but we will leave to someone els=
e the
implementation of ADD_BUFS (and the deprecation of CREATE_BUFS).

regards,
Nicolas

>=20
> Regards,
>=20
> 	Hans
>=20
> >=20
> > regards,
> > Nicolas
> >=20
> > >=20
> > > Regards,
> > >=20
> > > 	Hans
> > >=20
> > > >=20
> > > > Nicolas
> > > >=20
> > > > >=20
> > > > > See vb2_create_bufs() in videobuf2-v4l2.c.
> > > > >=20
> > > > > It's a pain to use since you need to fill in different fields
> > > > > depending on the type in order to allocate the new buffer memory,
> > > > > but all you want is just to give new buffer sizes.
> > > > >=20
> > > > > I propose to add a new ioctl:
> > > > >=20
> > > > > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/=
videodev2.h
> > > > > index 03443833aaaa..a7398e4c85e7 100644
> > > > > --- a/include/uapi/linux/videodev2.h
> > > > > +++ b/include/uapi/linux/videodev2.h
> > > > > @@ -2624,6 +2624,39 @@ struct v4l2_create_buffers {
> > > > >  	__u32			reserved[5];
> > > > >  };
> > > > >=20
> > > > > +/**
> > > > > + * struct v4l2_add_buffers - VIDIOC_ADD_BUFS argument
> > > > > + * @type:	enum v4l2_buf_type
> > > > > + * @memory:	enum v4l2_memory; buffer memory type
> > > > > + * @count:	entry: number of requested buffers,
> > > > > + *		return: number of created buffers
> > > > > + * @num_planes:	requested number of planes for each buffer
> > > > > + * @sizes:	requested plane sizes for each buffer
> > > > > + * @start_index:on return, index of the first created buffer
> > > > > + * @total_count:on return, the total number of allocated buffers
> > > > > + * @capabilities: capabilities of this buffer type.
> > > > > + * @flags:	additional buffer management attributes (ignored unle=
ss the
> > > > > + *		queue has V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS capability
> > > > > + *		and configured for MMAP streaming I/O).
> > > > > + * @max_num_buffers: if V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS ca=
pability flag is set
> > > > > + *		this field indicate the maximum possible number of buffers
> > > > > + *		for this queue.
> > > > > + * @reserved:	future extensions
> > > > > + */
> > > > > +struct v4l2_add_buffers {
> > > > > +	__u32			type;
> > > > > +	__u32			memory;
> > > > > +	__u32			count;
> > > > > +	__u32			num_planes;
> > > > > +	__u32			size[VIDEO_MAX_PLANES];
> > > > > +	__u32			start_index;
> > > > > +	__u32			total_count;
> > > > > +	__u32			capabilities;
> > > > > +	__u32			flags;
> > > > > +	__u32			max_num_buffers;
> > > > > +	__u32			reserved[7];
> > > > > +};
> > > > > +
> > > > >  /**
> > > > >   * struct v4l2_delete_buffers - VIDIOC_DELETE_BUFS argument
> > > > >   * @index:	the first buffer to be deleted
> > > > > @@ -2738,6 +2771,7 @@ struct v4l2_delete_buffers {
> > > > >=20
> > > > >  #define VIDIOC_QUERY_EXT_CTRL	_IOWR('V', 103, struct v4l2_query_=
ext_ctrl)
> > > > >  #define VIDIOC_DELETE_BUFS	_IOWR('V', 104, struct v4l2_delete_bu=
ffers)
> > > > > +#define VIDIOC_ADD_BUFS	_IOWR('V', 105, struct v4l2_add_buffers)
> > > > >=20
> > > > >=20
> > > > >  /* Reminder: when adding new ioctls please add support for them =
to
> > > > >=20
> > > > > Note that this patch sits on top of [1].
> > > > >=20
> > > > > The new struct is mostly the same as v4l2_create_buffers, but rep=
lacing the
> > > > > embedded v4l2_format with just the data it actually needs.  I als=
o renamed
> > > > > 'index' to 'start_index' and added a new 'total_count' field to r=
eport the
> > > > > total number of buffers. VIDIOC_CREATE_BUFS used the 'index' fiel=
d for that
> > > > > when called with count =3D=3D 0, but that is awkward once you all=
ow for deleting
> > > > > buffers.
> > > > >=20
> > > > > Implementing VIDIOC_ADD_BUFS would be very easy, it is almost all=
 done in
> > > > > vb2. Drivers would just need to point .vidioc_add_bufs to vb2_ioc=
tl_add_bufs.
> > > > >=20
> > > > > The vb2_queue ops do not change since those are already based on =
just an
> > > > > array of requested sizes.
> > > > >=20
> > > > > One reason I am bringing this up is that this has a potential imp=
act on the
> > > > > name of the new ioctl in [1]. Do we call it 'VIDIOC_DELETE_BUFS' =
or
> > > > > 'VIDIOC_REMOVE_BUFS'?
> > > > >=20
> > > > > I like the ADD/REMOVE pair better than ADD/DELETE. I never quite =
liked
> > > > > 'CREATE/DELETE' since buffer memory is only created/deleted in th=
e MMAP
> > > > > streaming case, not with DMABUF/USERPTR. I think add/remove are b=
etter names.
> > > > >=20
> > > > > I think CREATE/REMOVE is also acceptable, so I am leaning towards=
 calling
> > > > > the new ioctl in [1] VIDIOC_REMOVE_BUFS instead of VIDIOC_DELETE_=
BUFS.
> > > > >=20
> > > > > So, please comment on this RFC, both whether adding a CREATE_BUFS=
 replacement
> > > > > makes sense, and whether using REMOVE_BUFS instead of DELETE_BUFS=
 makes sense.
> > > > >=20
> > > > > Ideally it would be nice to introduce both ADD_BUFS and REMOVE_BU=
FS at the
> > > > > same time, so any userspace application that needs to use REMOVE_=
BUFS to
> > > > > remove buffers can rely on the new ADD_BUFS ioctl being available=
 as well.
> > > > >=20
> > > > > Regards,
> > > > >=20
> > > > > 	Hans
> > > > >=20
> > > > > [1]: https://patchwork.linuxtv.org/project/linux-media/list/?seri=
es=3D12195
> > > >=20
> > >=20
> >=20
>=20


