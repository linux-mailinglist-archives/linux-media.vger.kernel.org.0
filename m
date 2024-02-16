Return-Path: <linux-media+bounces-5313-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC69858669
	for <lists+linux-media@lfdr.de>; Fri, 16 Feb 2024 20:50:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65B391F24121
	for <lists+linux-media@lfdr.de>; Fri, 16 Feb 2024 19:50:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2975D136662;
	Fri, 16 Feb 2024 19:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="sjRV8cbK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD2412FF60
	for <linux-media@vger.kernel.org>; Fri, 16 Feb 2024 19:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708113002; cv=none; b=GZ8nsOz+Uxbl23mp2rr8BV8h+q/T0OBZ/8ugM7LD96vMdSAIgX/Ycc8BY6VIuBqEEdz1a9vPqOk6/jnp1YW4Gll5j32xXx8FhypEbtqGRMDYND+dKE2R5pC/nctcNHAd3pgASuKg4wyK9xC7Axa58UHolLKzPEqB02waIBqRVl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708113002; c=relaxed/simple;
	bh=U0kxs6EwpoNk7OANPYpBo1FbSDWB3PYutFYz2CeJja4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BojY9Ly7SdP67h5qM161slKqTazBXyJbJjQejG2WECaoUYhRSwfMMbbUdM5pcd5HHzQyFfACEvrOLtVGoi3oTzNCr5pBy5zzamxSR851KaMYohlnLrrhOnpIGu8oOF0qI8xNmd4uCxg90Z7yJ9ABLR9z+UZUfvNzz7AGPWKjugU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=sjRV8cbK; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-78717221b97so172300885a.0
        for <linux-media@vger.kernel.org>; Fri, 16 Feb 2024 11:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1708113000; x=1708717800; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V9h4kF8zmlp6e4gsSumN3mdOu5S1MiIOF5G6BcyTwZo=;
        b=sjRV8cbKAJ2Z/yHZa2IzDNuio1oJoI9rh9ZjuxNWlS9BUhGbpsY/m3M6MGIR/qPoFq
         R5LhK+IuYjRN/EsjdZLEX+95a+pmu9pi3lscMbzRlbD6L7qThOjEazYnCQRNVIUNKN7B
         SKfkjWCFDQ4QT70hanLfzYfwOs0fDciAJQ5jqgP/s1BhadtDcw1v5/f9roqPjrrsNm4H
         fa1B1TSuU+nKyF0OlJk+E0hrU2f3CE0oteij5PRlCPYdFshR+1g8WHsPmphBtdSuSCoN
         6oGvMtVjLy3BcSzB+MPU729nncwkViLFPTf5emNAEydnKoV2jlvKE8s1R32ScIANIqJZ
         3MNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708113000; x=1708717800;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V9h4kF8zmlp6e4gsSumN3mdOu5S1MiIOF5G6BcyTwZo=;
        b=MzmrNFwkYXTXMa4byaFm8U93bgPWVLJSZbIuEFR3QMB53pAdJrR0sK4tyxoTDbUNVl
         kARrFE/FrYWzz2wTGsUZIMWdIdylU7JS6F9YDt5c9SU3Rzp0Zhjjor2+7pKm2MeH4HKY
         hrfg9UDFQT/VHDQVifDSlUwIIoZwP5TbAqNN3IW1GI1hJ66Sg4/CsG6YXZICusDNseRo
         Zgb6ZUlVbPeM7TgcY5hHBjRUbJ5TWIv5GOZVbP7RGdC60KYFREBYawnvrihaOln8BqRz
         f2+daljYwp4gXnfNdRQ1iuj/XlZCyTBliJO4yYBikgAaUSq5oeL/tmH2AL1H9hPPXX8R
         jWMg==
X-Forwarded-Encrypted: i=1; AJvYcCVOUAq9+ZFz5Ozjsrpmm59ZHJ7CIaBrvvB/xa/ALEP8jPfy9TIGV9W8DaKNe2SvzieicG3wRshtL7x1GFlwGDIwz0b+EbCitGSVTV4=
X-Gm-Message-State: AOJu0YzD465aBYf3CUcElNUWQZAkdZnwmS1KkPQPqtJEQpx+4SGkOq8W
	hr/M3cXXX3mYkaEeRXKfy4FmNXmc/CjbQ3vzQPMFaHCPHkEWZpqI7Ly3CcJ4+xk=
X-Google-Smtp-Source: AGHT+IEwLovFdrKDsbUB5cjlZMBPpY6UrOJlKkgPZtI1jglJe8rbAT2tGsQrNyvByLpyp94AUactyQ==
X-Received: by 2002:a05:620a:2f2:b0:785:4fda:6610 with SMTP id a18-20020a05620a02f200b007854fda6610mr7280594qko.58.1708112999674;
        Fri, 16 Feb 2024 11:49:59 -0800 (PST)
Received: from nicolas-tpx395.localdomain ([2606:6d00:11:3354::7a9])
        by smtp.gmail.com with ESMTPSA id r20-20020a05620a299400b007857e7b35d0sm231114qkp.114.2024.02.16.11.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 11:49:59 -0800 (PST)
Message-ID: <9428d113d271cc9dce723d68611f843eea6094e6.camel@ndufresne.ca>
Subject: Re: RFC: VIDIOC_ADD_BUFS, a VIDIOC_CREATE_BUFS replacement
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Hans Verkuil <hverkuil@xs4all.nl>, Linux Media Mailing List
	 <linux-media@vger.kernel.org>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Date: Fri, 16 Feb 2024 14:49:58 -0500
In-Reply-To: <33dc55fd-a8b6-49ac-a5e3-47af5c75065c@xs4all.nl>
References: <243a66ad-6dff-4a43-ab03-e01d1038fe8a@xs4all.nl>
	 <644a9bfa5f2d3bba8e5c590a8c6fce302279a94b.camel@ndufresne.ca>
	 <33dc55fd-a8b6-49ac-a5e3-47af5c75065c@xs4all.nl>
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

Le lundi 12 f=C3=A9vrier 2024 =C3=A0 09:38 +0100, Hans Verkuil a =C3=A9crit=
=C2=A0:
> On 09/02/2024 19:03, Nicolas Dufresne wrote:
> > Hi,
> >=20
> > Le jeudi 08 f=C3=A9vrier 2024 =C3=A0 09:31 +0100, Hans Verkuil a =C3=A9=
crit=C2=A0:
> > > Hi all,
> > >=20
> > > Benjamin Gaignard's 'DELETE_BUFS' series [1] is almost ready, but the=
re is
> > > one outstanding issue: it works closely together with VIDIOC_CREATE_B=
UFS,
> > > but that ioctl has long since been a thorn in my eye due to the use o=
f
> > > struct v4l2_format embedded in the struct v4l2_create_buffers. This m=
akes
> > > it hard to use in applications.
> > >=20
> > > The only fields of that struct v4l2_format that are actually used are=
:
> > >=20
> > > type
> > >=20
> > > and, depending on 'type':
> > >=20
> > > pix.sizeimage
> > > pix_mp.num_planes, pix_mp.plane_fmt.sizeimage
> > > sdr.buffersize
> > > meta.buffersize
> > > vbi.samples_per_line, vbi.count
> > > sliced.io_size
> >=20
> > Sorry to disrupt, but that is only true since no driver support allocat=
ing for a
> > different target input. In stateless CODEC drivers, when these are used=
 as
> > reference frame, extra space is needed to store reference data like mot=
ion
> > vectors and more.
> >=20
> > The size of the data will vary depending on the width/height and pixelf=
ormat
> > (from which we can deduce the depth). Of course, some driver will only =
operate
> > with secondary buffer (post processed display buffer), which is the cas=
e for the
> > driver this feature is being demonstrated, but won't be true for other =
drivers.
> >=20
> > I sincerely think this RFC does not work for the use case we are adding=
 delete
> > bufs for.
>=20
> I don't understand your reply. I'm not sure if you are talking about the =
fields
> that VIDIOC_CREATE_BUFS uses, or about the proposed new ioctl.
>=20
> If you are talking about CREATE_BUFS, then it really is ignoring all othe=
r
> fields from the struct v4l2_format. See vb2_create_bufs() in videobuf2-v4=
l2.c.

Which demonstrate that the API is not fully implemented. What in my opinion=
 it
should be doing is to pass the format structure to the driver try_format fo=
r the
adjustments to the format to take place. The updated fmt is then returned l=
ike
any other calls in V4L2, and buffers are allocated according to that.

>=20
> If you are talking about my proposed ADD_BUFS ioctl: what is missing ther=
e
> that you need?

As I explain, allocation size is not something application can calculate ea=
sily
for codec driver reference frames. Width, height and bitdepth will have an
impact on the size in a very hardware specific way. There is a solution of
course to use your proposal, which is that user must call TRY_FMT themself =
in
order to obtain the correct size from the driver (and due to how create buf=
s in
currently implemented by vb2, it is already thecase). I'm not too concern, =
we
just loose the powerful (or over engineered, up to you to decide) bit of
CREATE_BUFS (the API, not its implementation), which could have avoided hav=
ing
to do 2 ioctl. Its likely not a hot path, so again, I'm not worried.

I do dislike though that this come up after a year of submitting and updati=
ng
the original proposal and hope some coding effort will be shared as our bud=
get
owners are reaching their tolerance limits.

regards,
Nicolas

>=20
> Regards,
>=20
> 	Hans
>=20
> >=20
> > Nicolas
> >=20
> > >=20
> > > See vb2_create_bufs() in videobuf2-v4l2.c.
> > >=20
> > > It's a pain to use since you need to fill in different fields
> > > depending on the type in order to allocate the new buffer memory,
> > > but all you want is just to give new buffer sizes.
> > >=20
> > > I propose to add a new ioctl:
> > >=20
> > > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/vide=
odev2.h
> > > index 03443833aaaa..a7398e4c85e7 100644
> > > --- a/include/uapi/linux/videodev2.h
> > > +++ b/include/uapi/linux/videodev2.h
> > > @@ -2624,6 +2624,39 @@ struct v4l2_create_buffers {
> > >  	__u32			reserved[5];
> > >  };
> > >=20
> > > +/**
> > > + * struct v4l2_add_buffers - VIDIOC_ADD_BUFS argument
> > > + * @type:	enum v4l2_buf_type
> > > + * @memory:	enum v4l2_memory; buffer memory type
> > > + * @count:	entry: number of requested buffers,
> > > + *		return: number of created buffers
> > > + * @num_planes:	requested number of planes for each buffer
> > > + * @sizes:	requested plane sizes for each buffer
> > > + * @start_index:on return, index of the first created buffer
> > > + * @total_count:on return, the total number of allocated buffers
> > > + * @capabilities: capabilities of this buffer type.
> > > + * @flags:	additional buffer management attributes (ignored unless t=
he
> > > + *		queue has V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS capability
> > > + *		and configured for MMAP streaming I/O).
> > > + * @max_num_buffers: if V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS capabi=
lity flag is set
> > > + *		this field indicate the maximum possible number of buffers
> > > + *		for this queue.
> > > + * @reserved:	future extensions
> > > + */
> > > +struct v4l2_add_buffers {
> > > +	__u32			type;
> > > +	__u32			memory;
> > > +	__u32			count;
> > > +	__u32			num_planes;
> > > +	__u32			size[VIDEO_MAX_PLANES];
> > > +	__u32			start_index;
> > > +	__u32			total_count;
> > > +	__u32			capabilities;
> > > +	__u32			flags;
> > > +	__u32			max_num_buffers;
> > > +	__u32			reserved[7];
> > > +};
> > > +
> > >  /**
> > >   * struct v4l2_delete_buffers - VIDIOC_DELETE_BUFS argument
> > >   * @index:	the first buffer to be deleted
> > > @@ -2738,6 +2771,7 @@ struct v4l2_delete_buffers {
> > >=20
> > >  #define VIDIOC_QUERY_EXT_CTRL	_IOWR('V', 103, struct v4l2_query_ext_=
ctrl)
> > >  #define VIDIOC_DELETE_BUFS	_IOWR('V', 104, struct v4l2_delete_buffer=
s)
> > > +#define VIDIOC_ADD_BUFS	_IOWR('V', 105, struct v4l2_add_buffers)
> > >=20
> > >=20
> > >  /* Reminder: when adding new ioctls please add support for them to
> > >=20
> > > Note that this patch sits on top of [1].
> > >=20
> > > The new struct is mostly the same as v4l2_create_buffers, but replaci=
ng the
> > > embedded v4l2_format with just the data it actually needs.  I also re=
named
> > > 'index' to 'start_index' and added a new 'total_count' field to repor=
t the
> > > total number of buffers. VIDIOC_CREATE_BUFS used the 'index' field fo=
r that
> > > when called with count =3D=3D 0, but that is awkward once you allow f=
or deleting
> > > buffers.
> > >=20
> > > Implementing VIDIOC_ADD_BUFS would be very easy, it is almost all don=
e in
> > > vb2. Drivers would just need to point .vidioc_add_bufs to vb2_ioctl_a=
dd_bufs.
> > >=20
> > > The vb2_queue ops do not change since those are already based on just=
 an
> > > array of requested sizes.
> > >=20
> > > One reason I am bringing this up is that this has a potential impact =
on the
> > > name of the new ioctl in [1]. Do we call it 'VIDIOC_DELETE_BUFS' or
> > > 'VIDIOC_REMOVE_BUFS'?
> > >=20
> > > I like the ADD/REMOVE pair better than ADD/DELETE. I never quite like=
d
> > > 'CREATE/DELETE' since buffer memory is only created/deleted in the MM=
AP
> > > streaming case, not with DMABUF/USERPTR. I think add/remove are bette=
r names.
> > >=20
> > > I think CREATE/REMOVE is also acceptable, so I am leaning towards cal=
ling
> > > the new ioctl in [1] VIDIOC_REMOVE_BUFS instead of VIDIOC_DELETE_BUFS=
.
> > >=20
> > > So, please comment on this RFC, both whether adding a CREATE_BUFS rep=
lacement
> > > makes sense, and whether using REMOVE_BUFS instead of DELETE_BUFS mak=
es sense.
> > >=20
> > > Ideally it would be nice to introduce both ADD_BUFS and REMOVE_BUFS a=
t the
> > > same time, so any userspace application that needs to use REMOVE_BUFS=
 to
> > > remove buffers can rely on the new ADD_BUFS ioctl being available as =
well.
> > >=20
> > > Regards,
> > >=20
> > > 	Hans
> > >=20
> > > [1]: https://patchwork.linuxtv.org/project/linux-media/list/?series=
=3D12195
> >=20
>=20


