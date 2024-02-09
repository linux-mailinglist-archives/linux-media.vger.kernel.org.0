Return-Path: <linux-media+bounces-4903-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2164784FB79
	for <lists+linux-media@lfdr.de>; Fri,  9 Feb 2024 19:03:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F0761F22AFC
	for <lists+linux-media@lfdr.de>; Fri,  9 Feb 2024 18:03:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 095AB7F48A;
	Fri,  9 Feb 2024 18:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="ZuAliUkZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BB274E09
	for <linux-media@vger.kernel.org>; Fri,  9 Feb 2024 18:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707501797; cv=none; b=PTN4SVCVsgBvDwBhkUvELlx4f0R1vtP8E8LGl47dn0AuqScqMJyDrB4cTZcH4wFvVl/waHSNpcqAsHxx9c4BoC2qV+foYa8kv1X2s8wFlQVc1blLDTypowZsq15o2LPhkGzxenlS5uUTH5ZtDqsuLb2KQtOrH3Q85o71Azr3P4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707501797; c=relaxed/simple;
	bh=wUOqp8O/+2PTeDwtPu+slsGGd4B2LkrSlXEkL7ydopk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=V02Ox3oSioxsyX3NakIJkxwy8zGvyTli6RXE/4EVIxyrcb3iX3fOZL66zN7EQp3G/aGBt0MgtqYlBIHifTnejsNtGbJSPY86xBKbbDeOptIWKQz6XM/3kmOoYRltaDxjHhmDVdnogbLrk7Yz4baC0yXISm9LeW2UNHQegOPRWeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=ZuAliUkZ; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-42a8b99eaf9so7727671cf.1
        for <linux-media@vger.kernel.org>; Fri, 09 Feb 2024 10:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1707501795; x=1708106595; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XMmtR/jVreZJZL0VPGdv7OCSid3xFfo3cmr9iPZCS/o=;
        b=ZuAliUkZmUPFWupP3L2YYYU5+LFXFpNzZKQfpXfdAXBKEeS+fuxaEZueIgBxo39367
         Woh/Zfkuif5d6svkjEiL1CVkxSk+l90FhVa39jjPILpn+0VxF03JNnQmw7m85hGTl/2B
         MgwkvBTZ6MbxBQHlWYeGarYSPXdZzUmwUwYWy2m80eV7/+k6MR/8HJJ3oQctkzWt0wLx
         ZMePJBLwOseES0cPn9t4kB4ntkxZTm/ZwzyyMr8eDCykvL+yXGoxTJieoOpQZrMKDTdT
         oTeRV+fI39TEBHZOy0bzCpovT9OcEqZMl7f4X5DPwQTsiml6i6t4ErRPoIayBeBrapVA
         HVmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707501795; x=1708106595;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XMmtR/jVreZJZL0VPGdv7OCSid3xFfo3cmr9iPZCS/o=;
        b=RRa9dcxZOPtGOf12icfQ5MI9CXKzjC+fUNmPIgg4GebBripJOLS8kNRddsWf1UtMqJ
         iLl1kmYapvnQ6TJVSK0BrcRFNdum1JIZKLwsd8NOg7/WGFqq/VRcxY7QuuiMeBYptwWx
         czhOtV8dLJrBXYgKR+iwFKCPG0ZBpv9it3R6T+TG9Lht/y2d3ccGpVHbnQbS3bHOifGM
         69sYOkOtxfrIezKtQRq72N4cZ5kH7O6qXkO+TjIOo7dcl7sWOzuHe3OZSHVHslKnc/Wp
         OkCsk7StMFG6ZzbR+TcNte8/Dke+nEu/+4zXMXgU9k6KVszJtN9ee9871IB7b8r9wOho
         qoiA==
X-Forwarded-Encrypted: i=1; AJvYcCUFz3dSAPrvEX6LrAVPP1heYs/r3S+ziRD6UaJHNu7bCqTZy9+BKQUHy+mFYjhe8t0ilbYghnU1rrCNerpNoSwFzrR4tUf9tw0IZ70=
X-Gm-Message-State: AOJu0YxmesB/uO3kajZUJredIwoXP5OG8xF2+DH+ZlKo3WRDtzwCWULa
	zrmqlyq12HTGoYNyjfMzieBdm8b2aE7BrE0Lzl/+Nzu/Uu5OhEBma5FIL7j7zUg=
X-Google-Smtp-Source: AGHT+IF2D2hDsfZCxLHiFrFsWZvtS5n2ULyhAmFlR+34UsRTHielf89U1eNyz73xjruzJHxP6Th0HA==
X-Received: by 2002:ac8:7f87:0:b0:42b:f17f:8db2 with SMTP id z7-20020ac87f87000000b0042bf17f8db2mr2392876qtj.51.1707501794647;
        Fri, 09 Feb 2024 10:03:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVvvNzcTNwO2ufTeQXwNcPU52LzeHzAH+rWzfo/KZjVshpswHaH4nMEbBMIzlF86ZI/HI9NLuKxIMkIN7vXvqCeXzLsZHllTsdTwKE=
Received: from nicolas-tpx395.localdomain ([2606:6d00:11:3354::7a9])
        by smtp.gmail.com with ESMTPSA id d14-20020a05622a100e00b0042a8c890444sm902025qte.1.2024.02.09.10.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 10:03:14 -0800 (PST)
Message-ID: <644a9bfa5f2d3bba8e5c590a8c6fce302279a94b.camel@ndufresne.ca>
Subject: Re: RFC: VIDIOC_ADD_BUFS, a VIDIOC_CREATE_BUFS replacement
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Hans Verkuil <hverkuil@xs4all.nl>, Linux Media Mailing List
	 <linux-media@vger.kernel.org>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Date: Fri, 09 Feb 2024 13:03:11 -0500
In-Reply-To: <243a66ad-6dff-4a43-ab03-e01d1038fe8a@xs4all.nl>
References: <243a66ad-6dff-4a43-ab03-e01d1038fe8a@xs4all.nl>
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

Hi,

Le jeudi 08 f=C3=A9vrier 2024 =C3=A0 09:31 +0100, Hans Verkuil a =C3=A9crit=
=C2=A0:
> Hi all,
>=20
> Benjamin Gaignard's 'DELETE_BUFS' series [1] is almost ready, but there i=
s
> one outstanding issue: it works closely together with VIDIOC_CREATE_BUFS,
> but that ioctl has long since been a thorn in my eye due to the use of
> struct v4l2_format embedded in the struct v4l2_create_buffers. This makes
> it hard to use in applications.
>=20
> The only fields of that struct v4l2_format that are actually used are:
>=20
> type
>=20
> and, depending on 'type':
>=20
> pix.sizeimage
> pix_mp.num_planes, pix_mp.plane_fmt.sizeimage
> sdr.buffersize
> meta.buffersize
> vbi.samples_per_line, vbi.count
> sliced.io_size

Sorry to disrupt, but that is only true since no driver support allocating =
for a
different target input. In stateless CODEC drivers, when these are used as
reference frame, extra space is needed to store reference data like motion
vectors and more.

The size of the data will vary depending on the width/height and pixelforma=
t
(from which we can deduce the depth). Of course, some driver will only oper=
ate
with secondary buffer (post processed display buffer), which is the case fo=
r the
driver this feature is being demonstrated, but won't be true for other driv=
ers.

I sincerely think this RFC does not work for the use case we are adding del=
ete
bufs for.

Nicolas

>=20
> See vb2_create_bufs() in videobuf2-v4l2.c.
>=20
> It's a pain to use since you need to fill in different fields
> depending on the type in order to allocate the new buffer memory,
> but all you want is just to give new buffer sizes.
>=20
> I propose to add a new ioctl:
>=20
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev=
2.h
> index 03443833aaaa..a7398e4c85e7 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -2624,6 +2624,39 @@ struct v4l2_create_buffers {
>  	__u32			reserved[5];
>  };
>=20
> +/**
> + * struct v4l2_add_buffers - VIDIOC_ADD_BUFS argument
> + * @type:	enum v4l2_buf_type
> + * @memory:	enum v4l2_memory; buffer memory type
> + * @count:	entry: number of requested buffers,
> + *		return: number of created buffers
> + * @num_planes:	requested number of planes for each buffer
> + * @sizes:	requested plane sizes for each buffer
> + * @start_index:on return, index of the first created buffer
> + * @total_count:on return, the total number of allocated buffers
> + * @capabilities: capabilities of this buffer type.
> + * @flags:	additional buffer management attributes (ignored unless the
> + *		queue has V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS capability
> + *		and configured for MMAP streaming I/O).
> + * @max_num_buffers: if V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS capability=
 flag is set
> + *		this field indicate the maximum possible number of buffers
> + *		for this queue.
> + * @reserved:	future extensions
> + */
> +struct v4l2_add_buffers {
> +	__u32			type;
> +	__u32			memory;
> +	__u32			count;
> +	__u32			num_planes;
> +	__u32			size[VIDEO_MAX_PLANES];
> +	__u32			start_index;
> +	__u32			total_count;
> +	__u32			capabilities;
> +	__u32			flags;
> +	__u32			max_num_buffers;
> +	__u32			reserved[7];
> +};
> +
>  /**
>   * struct v4l2_delete_buffers - VIDIOC_DELETE_BUFS argument
>   * @index:	the first buffer to be deleted
> @@ -2738,6 +2771,7 @@ struct v4l2_delete_buffers {
>=20
>  #define VIDIOC_QUERY_EXT_CTRL	_IOWR('V', 103, struct v4l2_query_ext_ctrl=
)
>  #define VIDIOC_DELETE_BUFS	_IOWR('V', 104, struct v4l2_delete_buffers)
> +#define VIDIOC_ADD_BUFS	_IOWR('V', 105, struct v4l2_add_buffers)
>=20
>=20
>  /* Reminder: when adding new ioctls please add support for them to
>=20
> Note that this patch sits on top of [1].
>=20
> The new struct is mostly the same as v4l2_create_buffers, but replacing t=
he
> embedded v4l2_format with just the data it actually needs.  I also rename=
d
> 'index' to 'start_index' and added a new 'total_count' field to report th=
e
> total number of buffers. VIDIOC_CREATE_BUFS used the 'index' field for th=
at
> when called with count =3D=3D 0, but that is awkward once you allow for d=
eleting
> buffers.
>=20
> Implementing VIDIOC_ADD_BUFS would be very easy, it is almost all done in
> vb2. Drivers would just need to point .vidioc_add_bufs to vb2_ioctl_add_b=
ufs.
>=20
> The vb2_queue ops do not change since those are already based on just an
> array of requested sizes.
>=20
> One reason I am bringing this up is that this has a potential impact on t=
he
> name of the new ioctl in [1]. Do we call it 'VIDIOC_DELETE_BUFS' or
> 'VIDIOC_REMOVE_BUFS'?
>=20
> I like the ADD/REMOVE pair better than ADD/DELETE. I never quite liked
> 'CREATE/DELETE' since buffer memory is only created/deleted in the MMAP
> streaming case, not with DMABUF/USERPTR. I think add/remove are better na=
mes.
>=20
> I think CREATE/REMOVE is also acceptable, so I am leaning towards calling
> the new ioctl in [1] VIDIOC_REMOVE_BUFS instead of VIDIOC_DELETE_BUFS.
>=20
> So, please comment on this RFC, both whether adding a CREATE_BUFS replace=
ment
> makes sense, and whether using REMOVE_BUFS instead of DELETE_BUFS makes s=
ense.
>=20
> Ideally it would be nice to introduce both ADD_BUFS and REMOVE_BUFS at th=
e
> same time, so any userspace application that needs to use REMOVE_BUFS to
> remove buffers can rely on the new ADD_BUFS ioctl being available as well=
.
>=20
> Regards,
>=20
> 	Hans
>=20
> [1]: https://patchwork.linuxtv.org/project/linux-media/list/?series=3D121=
95


