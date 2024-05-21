Return-Path: <linux-media+bounces-11667-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A248CAA35
	for <lists+linux-media@lfdr.de>; Tue, 21 May 2024 10:43:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 537371C20BD8
	for <lists+linux-media@lfdr.de>; Tue, 21 May 2024 08:43:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C10135645B;
	Tue, 21 May 2024 08:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HV3eq8Un"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983F154720
	for <linux-media@vger.kernel.org>; Tue, 21 May 2024 08:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716281027; cv=none; b=SZNTATyyPXjYFi72u3GfUUWNusVmSvVPmhzhgMgVC4cMI3AadxTrVg9LtURM3sIIbbNuOo8K8oOad4hf5LGHD86kohLDWu2GplZaHEskBRCbEzQ3jk+u3EdKFopwHKaCT2DDhfU/VoKLxVEAXC5aCigIY3dIZm/e2bzFwmxJUkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716281027; c=relaxed/simple;
	bh=tX9rSmYYkLI/+kPzlQXgWyZ3TRIKt1pc3mMc9xWDYhA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YL9EHEFtR1v0v+QjcOd/5AtulAU6fYuCzieUMdgDbAT+7SU6M/1DxYuCUXXqrIU9q3Wj1s//eywvwSt2GeYPN5ui7E5XXwxiy8hACuIm2bu0+W/5wl0T8a/3lUZaoourLRHvKVnCtx29CUrN5v/IxN/8uuiSwRQ+gngfa0tTnlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HV3eq8Un; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716281024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x8k5q7R1XQcUXB4Szn34j6F6QdxRYsMfl6BtJBFY45A=;
	b=HV3eq8UncSJSRMXEMjJ8bNUQqNH4IrCBufUnjMI/5L2DTpMRXr+FZHlWkJsTQ0eZ9p5Qod
	vKHPMzjWq4AqcBKHTkQnJo632/gxkt9bIHfGLsBOfVZBIG0pC2zJgmR2UjjWhQeyLGnoIN
	mxhjFYSiZqhIbFjkbird3aD0wfge0c4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-187-C_x55dyIOOmieJHicXyrjg-1; Tue, 21 May 2024 04:43:37 -0400
X-MC-Unique: C_x55dyIOOmieJHicXyrjg-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-351cb5b7649so5264501f8f.3
        for <linux-media@vger.kernel.org>; Tue, 21 May 2024 01:43:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716281016; x=1716885816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x8k5q7R1XQcUXB4Szn34j6F6QdxRYsMfl6BtJBFY45A=;
        b=OfQ5Ybyv/+Rdn0oThGTylGtHInk6AV0iGLp0qQx2eOMxh+0bJAPTzOG5cT4oOkrK/P
         hOpnhZ9D39gLE/qlosIwDZoLTWE55GpzhdVMGr1ykUoswk3fQcg/ijVXwbKZkUq8URSB
         CeYoKqBjoehGPw46IrtpUEAv4rAE06IvHD+p3wOIl6njSvAKfyrET40vVkJd6GFlX7Dc
         i5Rz83/4yZ6y8m71dG2CKt7Jx3gwN3j8YH8sG4Y45QKncQXZtQsehwadFmEMugwdNvZ3
         KNEiLF3JdCfK4nTeRLfaQEM3QOlaSA8M5GK4n3onVZFlSen/zgybWbhPGW8xTiX6HieK
         /Dig==
X-Forwarded-Encrypted: i=1; AJvYcCUFaQ2I+JM1W2LQbseNeX9ndPE3FYDW6ZUA2gDddTrW6hgdyg6Ux0tulzs2OmsgjOSzfhP18swZXj4b8pfo5lb3mmr3kp7CEJA3pQM=
X-Gm-Message-State: AOJu0YwY0dpq9zt2hjznW+5uZ2+0FRk5Gr+Jg3DFl27pVEaHobdQfViZ
	3720r/xTdZF1/q6D7zqBHB4u8oD5VOAfo3l37EeUW3v+6eFz6O0mFrhV9PGtc/R1nb9Girfx/hS
	xVDTxjjf4D59srVOfIAFWNjQOnHjyNq2e1rzdjiIdHv1oUyRjr1slsdUtccgw
X-Received: by 2002:a5d:4537:0:b0:351:cb0a:5da9 with SMTP id ffacd0b85a97d-351cb0a5e27mr13610761f8f.54.1716281015789;
        Tue, 21 May 2024 01:43:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGViPbX2DDsBlX4k8bygNk8RERf9FOVVEI+UM+O9otWpAASEUQBvdHR9iUQt2Q/LtMHcgtmzA==
X-Received: by 2002:a5d:4537:0:b0:351:cb0a:5da9 with SMTP id ffacd0b85a97d-351cb0a5e27mr13610740f8f.54.1716281015294;
        Tue, 21 May 2024 01:43:35 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502b79bd4fsm31573798f8f.7.2024.05.21.01.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 01:43:34 -0700 (PDT)
Date: Tue, 21 May 2024 10:43:34 +0200
From: Maxime Ripard <mripard@redhat.com>
To: nicolas.dufresne@collabora.corp-partner.google.com
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Hans de Goede <hdegoede@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Lennart Poettering <mzxreary@0pointer.de>, 
	Robert Mader <robert.mader@collabora.com>, Sebastien Bacher <sebastien.bacher@canonical.com>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, linaro-mm-sig@lists.linaro.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Milan Zamazal <mzamazal@redhat.com>, 
	Andrey Konovalov <andrey.konovalov.ynk@gmail.com>
Subject: Re: Safety of opening up /dev/dma_heap/* to physically present users
 (udev uaccess tag) ?
Message-ID: <20240521-thick-messy-lemur-c8cebe@houat>
References: <20240507183613.GB20390@pendragon.ideasonboard.com>
 <4f59a9d78662831123cc7e560218fa422e1c5eca.camel@collabora.com>
 <Zjs5eM-rRoh6WYYu@phenom.ffwll.local>
 <20240513-heretic-didactic-newt-1d6daf@penduick>
 <20240513083417.GA18630@pendragon.ideasonboard.com>
 <c4db22ad94696ed22282bf8dad15088d94ade5d6.camel@collabora.com>
 <20240514204223.GN32013@pendragon.ideasonboard.com>
 <a3428b0c352c24d43a2d458d41819fbf4b6cce0f.camel@collabora.corp-partner.google.com>
 <20240516112720.GA12714@pendragon.ideasonboard.com>
 <08b882dd036367c4d78a5b33f5d11cdb347823bb.camel@collabora.corp-partner.google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="3ur3lppetxpfcjb6"
Content-Disposition: inline
In-Reply-To: <08b882dd036367c4d78a5b33f5d11cdb347823bb.camel@collabora.corp-partner.google.com>


--3ur3lppetxpfcjb6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 16, 2024 at 01:11:51PM GMT, nicolas.dufresne@collabora.corp-par=
tner.google.com wrote:
> Le jeudi 16 mai 2024 =E0 14:27 +0300, Laurent Pinchart a =E9crit=A0:
> > Hi Nicolas,
> >=20
> > On Wed, May 15, 2024 at 01:43:58PM -0400, nicolas.dufresne@collabora.co=
rp-partner.google.com wrote:
> > > Le mardi 14 mai 2024 =E0 23:42 +0300, Laurent Pinchart a =E9crit=A0:
> > > > > You'll hit the same limitation as we hit in GStreamer, which is t=
hat KMS driver
> > > > > only offer allocation for render buffers and most of them are mis=
sing allocators
> > > > > for YUV buffers, even though they can import in these formats. (k=
ms allocators,
> > > > > except dumb, which has other issues, are format aware).
> > > >=20
> > > > My experience on Arm platforms is that the KMS drivers offer alloca=
tion
> > > > for scanout buffers, not render buffers, and mostly using the dumb
> > > > allocator API. If the KMS device can scan out YUV natively, YUV buf=
fer
> > > > allocation should be supported. Am I missing something here ?
> > >=20
> > > There is two APIs, Dumb is the legacy allocation API, only used by di=
splay
> >=20
> > Is it legacy only ? I understand the dumb buffers API to be officially
> > supported, to allocate scanout buffers suitable for software rendering.
> >=20
> > > drivers indeed, and the API does not include a pixel format or a modi=
fier. The
> > > allocation of YUV buffer has been made through a small hack,=20
> > >=20
> > >   bpp =3D number of bits per component (of luma plane if multiple pla=
nes)
> > >   width =3D width
> > >   height =3D height * X
> > >=20
> > > Where X will vary, "3 / 2" is used for 420 subsampling, "2" for 422 a=
nd "3" for
> > > 444. It is far from idea, requires deep knowledge of each formats in =
the
> > > application
> >=20
> > I'm not sure I see that as an issue, but our experiences and uses cases
> > may vary :-)
>=20
> Its extra burden, and does not scale to all available pixel formats. My r=
eply
> was for readers education as I feel like a lot of linux-media dev don't h=
ave a
> clue of what is going on at the rendering side. This ensure a minimum kno=
wledge
> to everyone commenting.
>=20
> And yes, within the GFX community, Dumb allocation is to be killed and
> replacement completely in the future, it simply does not have a complete
> replacement yet.
>=20
> >=20
> > > and cannot allocate each planes seperatly.
> >=20
> > For semi-planar or planar formats, unless I'm mistaken, you can either
> > allocate a single buffer and use it with appropriate offsets when
> > constructing your framebuffer (with DRM_IOCTL_MODE_ADDFB2), or allocate
> > one buffer per plane.
>=20
> We have use cases were single allocation is undesirable, but I don't real=
ly feel
> like this is important enough for me to type this explanation. Ping me if=
 you
> care.
> >=20
> > > The second is to use the driver specific allocation API. This is then=
 abstracted
> > > by GBM. This allows allocating render buffers with notably modifiers =
and/or use
> > > cases. But no support for YUV formats or multi-planar formats.
> >=20
> > GBM is the way to go for render buffers indeed. It has been designed
> > with only graphics buffer management use cases in mind, so it's
> > unfortunately not an option as a generic allocator, at least in its
> > current form.
> >=20
>=20
> What I perhaps should have highlighted that is that all these allocators =
in the
> GFX (called DRM, but meh) subsystem abstract away some deep knowledge of =
the HW
> requirements. Heaps are lower level APIs that assume that userspace have =
this
> knowledge. The Android and ChromeOS solution is to take the implementatio=
n from
> the kernel and move it into userspace, see minigbm from chromeos, or gral=
loc
> from Android. As these two projects are device centric, they are not usab=
le on
> generic Linux. Heaps might have some future, but not without other piece =
of the
> puzzle.
>=20
> To come back to you wanting heaps in libcamera, because it makes them bet=
ter for
> rendered or display. Well today this is a lie you make to yourself, becau=
se this
> is just a tiny bit of the puzzle, it is pure luck if you allocate dmabuf =
is
> usable but a foreign device. At the end of the day, this is just a fallba=
ck to
> satisfy that application are not forced to allocate that memory in libcam=
era.

I mean, it's pure luck, but can you point to any platform supported
upstream where it wouldn't work?

> Thus, I strongly recommend the udmabuf in the short term. Finally, moving=
 to
> heaps when the reported issue is resolved, as then it gives more options =
and
> reduce the number of layers.

udmabuf wouldn't work with any platform without an IOMMU. We have plenty
of those.

All things considered, while I agree that it isn't the ideal solution,
we really don't have a better (ie, works on a larger set of platforms)
solution at the moment or in the next 5 years.

Maxime

--3ur3lppetxpfcjb6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZkxetgAKCRAnX84Zoj2+
dowVAYD+pixkM6lIhnLksc0THKJNXz5j3y7vVB903apxbhINtgV4AYh1nkv/zhcQ
iVGGJq8BgKzX+k9pfyDC1fMIarAnVyKH2XjGA5SJ8N18wPOrO6zuNN89CbWbOv7e
QtoE2jvRCg==
=vQjI
-----END PGP SIGNATURE-----

--3ur3lppetxpfcjb6--


