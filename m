Return-Path: <linux-media+bounces-22636-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D070C9E3F71
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 17:15:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 354492816F7
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 16:15:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B64520C473;
	Wed,  4 Dec 2024 16:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DGcaTZer"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE57188587
	for <linux-media@vger.kernel.org>; Wed,  4 Dec 2024 16:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733328950; cv=none; b=jLWSTmjXbvLOLHKW5/Lk9oAOmWtNgSCU4RLeFdCTeC56yj3VawFN5Y1ptjp+9pg/8lnystEvBUqWCBYe35u4T/hWh1nOn18J4njJJtCQ+0oB9+58qZcXQ74nhFLoleRFjISfNPzyPp9naAPrkAmU/gizbMNuP6Snz4enm4i0Ea4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733328950; c=relaxed/simple;
	bh=joIDpw8E29GRojBpoqkK+X/T8tEr34MBGh7IQ/oluAY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qO31gIgh5aj6q2r8a8uKlV262eYANyLCV02/C2UIn5P4Vn39rWdO4c6ytWRxoeS1UjXzOA26KGOEnGOSRC+u2xjT6N9/ONvDKx0fE77cLyhRvzhRKeQjdw7PYQzC40R8cfjqFGyeiHZz+NhGPcBMpc+JYfSWeTC8qfSbSx69tUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DGcaTZer; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5d0c939ab78so9811a12.0
        for <linux-media@vger.kernel.org>; Wed, 04 Dec 2024 08:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733328947; x=1733933747; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1rHO2R+e0I6TJZIXYLQBQq322w6i2QrZ0HFp2Dkg6e0=;
        b=DGcaTZeri4Q1gjkb3aPdOaf4UwmJ86+KOJVNXuhE8CQKQLMAllR/AmnoFwsbXFbSiS
         1R7gWGRS8ma1EcTinhkYqrYGejd0MxNAlu7AEWYVP+NBpLySZAv18QYF08mD1AA37Lo+
         UVxFDJN9w/tI+EfoB+iZX/8vVzxbAsMBij9GT2Lt5q3rjSHsp1D7aM5cEpzfvlbA6dmz
         c1hMWgL2njE2cuJo/Pz/iVv2I4/Wu/LvLEUl2hHvur/jEEQgzdVhysBwow3jLtvWWA/Y
         OvGdYVWOEASWnRm0xuhAku1wODJtKGwxstCon0g5cDt8H00SbK2/AaETFU9SDvyXeBS0
         AL7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733328947; x=1733933747;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1rHO2R+e0I6TJZIXYLQBQq322w6i2QrZ0HFp2Dkg6e0=;
        b=MFbL2+QvZfT0sg4qbPZf9kf9QXDOYIoZEvQnnhY065I3sK9FczfJgP8btKsECpkkwr
         3gGOuBFGzyMRyjlqvNQUVJ8Ble8ox6nTuAMZuRvHGuLR+Ib1tOELCkFYF6CbCSJ7rZpS
         lcHftPQqo89XDMAId5xqqhB4PYjYcHoL6dc8zmemV7dJ6CztwxTaQci7UwtbU1HH9Q0U
         uvdOZOquKNpK6PPT0QHDoix6K+we1xbt1+ub46HuePeQgDOqNrARA6GQDBy6N3hHVU9j
         Cl6LFnxM1r4HWM4elsjQ8K9QvDdQd+QS6i8RXgw5CpTy8ZChWgrwxuHptneeO8ZjKgYg
         qKig==
X-Forwarded-Encrypted: i=1; AJvYcCUlyCLvn3ZtUo/0I/uzXRz8MAswPho/Xg7K+1t3ZEBtXG8kjUQW6LRrmYCilAi92ZFZUwJp7ePrX1A9lw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/5VBmtuC6gHT1SKz8PAIHniQTFMTidPzdctlR1gjZCSoqyup9
	4pMqYxgfWZ5xfJ2xhVH0N0AeI4tOtUcLzkM1WX2/Q+zzNQRyX8mVoW8UgDHa3Z9/glK9SsNSE0Z
	pXxEiaWqJVF62RYoMxZZW70vJ+xjXDj1XpUMa
X-Gm-Gg: ASbGncvJZdn/SziWKoPV2pN6yPKQznwpd4G5eC4GCiazQ2QMF/ZR1dc7M1QC5LiLGsS
	Wn8w9bigF6hH2Y5ZVxyCUpk1fPMMTGYHnAM3uqBVjxMR71J/8+CwLEz25AfE=
X-Google-Smtp-Source: AGHT+IH+tsX9V69opZ/sve8O/AoKYFLP1rqwva7AFm68u1eQU6ovRCfm8nXse/vPk2lxbhPEkYsTf77IKlmuGhob8wk=
X-Received: by 2002:a05:6402:1bdc:b0:5d0:b501:fc77 with SMTP id
 4fb4d7f45d1cf-5d118ee38b2mr89054a12.5.1733328946220; Wed, 04 Dec 2024
 08:15:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241203-udmabuf-fixes-v1-0-f99281c345aa@google.com>
 <20241203-udmabuf-fixes-v1-3-f99281c345aa@google.com> <IA0PR11MB7185D54AD6BB8067EAA6AE8EF8372@IA0PR11MB7185.namprd11.prod.outlook.com>
In-Reply-To: <IA0PR11MB7185D54AD6BB8067EAA6AE8EF8372@IA0PR11MB7185.namprd11.prod.outlook.com>
From: Jann Horn <jannh@google.com>
Date: Wed, 4 Dec 2024 17:15:10 +0100
Message-ID: <CAG48ez3pVzBFTb6uX47fps8mZp3TaRWPcLaKvQwREUKVApd02A@mail.gmail.com>
Subject: Re: [PATCH 3/3] udmabuf: fix memory leak on last export_udmabuf()
 error path
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Simona Vetter <simona.vetter@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>, 
	"Joel Fernandes (Google)" <joel@joelfernandes.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 4, 2024 at 10:14=E2=80=AFAM Kasireddy, Vivek
<vivek.kasireddy@intel.com> wrote:
> > Subject: [PATCH 3/3] udmabuf: fix memory leak on last export_udmabuf()
> > error path
> >
> > In export_udmabuf(), if dma_buf_fd() fails because the FD table is full=
, a
> > dma_buf owning the udmabuf has already been created; but the error
> > handling
> > in udmabuf_create() will tear down the udmabuf without doing anything
> > about
> > the containing dma_buf.
> >
> > This leaves a dma_buf in memory that contains a dangling pointer; thoug=
h
> > that doesn't seem to lead to anything bad except a memory leak.
> >
> > Fix it by moving the dma_buf_fd() call out of export_udmabuf() so that =
we
> > can give it different error handling.
> >
> > Note that the shape of this code changed a lot in commit 5e72b2b41a21
> > ("udmabuf: convert udmabuf driver to use folios"); but the memory leak
> > seems to have existed since the introduction of udmabuf.
> >
> > Fixes: fbb0de795078 ("Add udmabuf misc device")
> > Signed-off-by: Jann Horn <jannh@google.com>
[...]
> > @@ -330,11 +329,7 @@ static int export_udmabuf(struct udmabuf *ubuf,
> >       exp_info.priv =3D ubuf;
> >       exp_info.flags =3D O_RDWR;
> >
> > -     buf =3D dma_buf_export(&exp_info);
> > -     if (IS_ERR(buf))
> > -             return PTR_ERR(buf);
> > -
> > -     return dma_buf_fd(buf, flags);
> flags is now unused in this function.

Ack, will remove in v2.

> > +     return dma_buf_export(&exp_info);
> >  }
> >
> >  static long udmabuf_pin_folios(struct udmabuf *ubuf, struct file *memf=
d,
> > @@ -391,6 +386,7 @@ static long udmabuf_create(struct miscdevice
> > *device,
> >       struct folio **folios =3D NULL;
> >       pgoff_t pgcnt =3D 0, pglimit;
> >       struct udmabuf *ubuf;
> > +     struct dma_buf *dmabuf;
> >       long ret =3D -EINVAL;
> >       u32 i, flags;
> >
> > @@ -451,9 +447,16 @@ static long udmabuf_create(struct miscdevice
> > *device,
> >       }
> >
> >       flags =3D head->flags & UDMABUF_FLAGS_CLOEXEC ? O_CLOEXEC : 0;
> > -     ret =3D export_udmabuf(ubuf, device, flags);
> > -     if (ret < 0)
> > +     dmabuf =3D export_udmabuf(ubuf, device, flags);
> > +     if (IS_ERR(dmabuf)) {
> > +             ret =3D PTR_ERR(dmabuf);
> >               goto err;
> > +     }
> > +     /* ownership of ubuf is held by the dmabuf from here */
> Please also add a comment here that says that if dma_buf_fd() fails,
> then calling dma_buf_put() will enable cleanup to be done via release().

Ack, added in v2.

> With that,
>
> Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>

Thanks!

