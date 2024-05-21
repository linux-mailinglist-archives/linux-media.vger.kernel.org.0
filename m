Return-Path: <linux-media+bounces-11701-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0558CB037
	for <lists+linux-media@lfdr.de>; Tue, 21 May 2024 16:19:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3E312B24773
	for <lists+linux-media@lfdr.de>; Tue, 21 May 2024 14:19:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3701180031;
	Tue, 21 May 2024 14:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora-corp-partner-google-com.20230601.gappssmtp.com header.i=@collabora-corp-partner-google-com.20230601.gappssmtp.com header.b="k+a61pdL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F227FBAC
	for <linux-media@vger.kernel.org>; Tue, 21 May 2024 14:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716301138; cv=none; b=O/BmWKxToVfltlFAqcmNeqmXY0mSB4snblvJY8PFNik+UDl90LkXJ1JLWnDxCXScON4cojkSCr4B7LknPZWk2mngeDhMlcjrZQew144tNmBzhP4GprDl5bP4c+LuTFD8nmxeNjh4VFLndg3tuYJpkH2jSPQSxjl0YNtQfrJ0PfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716301138; c=relaxed/simple;
	bh=wZOefzj8+e+4vjxxYBi/tXPQnXuBRAXApSHOnGSmpog=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hWOCix0sUs47n43MDOx0ut27GaBw8lPJDtOAS1ylk+w8aVB6ZmEgb47ZDYpp8aN0C87BHGlteZY9LyYdyY9r86q6ODholCUz6/JZ8fLXBGOfeux8nXGk/7QwCZx/cCaaZ7FRdsaimV5oZIfW0AjyXsDqq2AsTfp/vDrNGqax7uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=collabora.corp-partner.google.com; spf=pass smtp.mailfrom=collabora.corp-partner.google.com; dkim=pass (2048-bit key) header.d=collabora-corp-partner-google-com.20230601.gappssmtp.com header.i=@collabora-corp-partner-google-com.20230601.gappssmtp.com header.b=k+a61pdL; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=collabora.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.corp-partner.google.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-43de92e234dso38761471cf.1
        for <linux-media@vger.kernel.org>; Tue, 21 May 2024 07:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=collabora-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1716301135; x=1716905935; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/grV1OF2tkqSVpiWd99UzFJtL1VFoxAYH5Zqv+kbk/8=;
        b=k+a61pdLVKGH8OGdY4vWMvYaTvoTR1uGXmKzrXmRT/pSJHN9j/D3SvfDKfoPhQaOMP
         NiKmp2PuZaGKGm4gb5dMdG5C2P290jasdzgsNN9aLMxj3jjxUCRprQ7eh/+7KR0DQ7sc
         A7qggSowVmcedeRtYHKfEc2nk6qm9z+s+IeaTOfldljL39TO3AbImua1cy4ftr2VM3k0
         1HbsF/8pyHAVL9KjRy/kfK+P8qYyA+QFpPPiLkD0clvODdlCJsw34OYBEwTQVrJQXdRs
         Bcxpi9b8Z1DNabTvcT5diNc7tIXl5+xoyXGlO6DqKVqyR+QrwZyEdPob9or01bVqYXLu
         t4NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716301135; x=1716905935;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/grV1OF2tkqSVpiWd99UzFJtL1VFoxAYH5Zqv+kbk/8=;
        b=cSWTD7IBKjs2/rS3UPv0dNm5gy9Fr6T2P2KCBHEK24MltoJJBINTt+Frnk68V8aGwT
         MfEKsy5iCp2P5gYQbQgXDHY4cR2Mw5KUK7Ud52Mu1gQNf5hs6BZVoKKO8ixIm2Nxbgir
         +jGeg/iLJzMQGgD7+HdQAZ248E7chlDAvYz2ohgxOJhDOuaplgz56Vj9Gb6tbRnw5NnZ
         CnQJHlSUwgchW9NWEjJJyR4UxctmhJ7DG1J2qA66MOwQmy9830VlOdNDuvu7b3f5yot2
         C2ByFsw4A9ukRDfgRNQKLr0gdhOqjTqQhYQgXxUVe0v2mnX11UB6yxnqiJ61c8X+qrSC
         QhQw==
X-Forwarded-Encrypted: i=1; AJvYcCXBYCbQgRFJHlC1FB9pgfXkQ10Itc0CbXxekazKXO7GqWgU2FvfMmWTXm9S1ijxyq70Y7w+nuU40MFjJHUmqBwpRkW7RWwdh2bdpXE=
X-Gm-Message-State: AOJu0YxhQwJLGcYY31y1IMIAD2C7jgelHBnajlXQrs85TDbHmai0vC6x
	7KqybQ5KWzG/bj8Pvw6vEwmyMz+XrtmjZvWDgAIsP1k/EbVzCf8CncX68xly3xo=
X-Google-Smtp-Source: AGHT+IH7DUWuvkmlYTyeHpsmKHeWKkfIDi7ddT8p57U2WnoisqjWydmnWCAmBhK0r+UU5ijE8x5iJA==
X-Received: by 2002:ac8:58cf:0:b0:43e:1039:8ce8 with SMTP id d75a77b69052e-43f7a2a4ab7mr151321121cf.14.1716301135602;
        Tue, 21 May 2024 07:18:55 -0700 (PDT)
Received: from nicolas-tpx395.lan ([2606:6d00:17:5985::580])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6a15f1798f4sm123402526d6.1.2024.05.21.07.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 07:18:54 -0700 (PDT)
Message-ID: <44f7f49922c9ed0a1543ec98535a20469b14ac4e.camel@collabora.corp-partner.google.com>
Subject: Re: Safety of opening up /dev/dma_heap/* to physically present
 users (udev uaccess tag) ?
From: nicolas.dufresne@collabora.corp-partner.google.com
To: Maxime Ripard <mripard@redhat.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Bryan O'Donoghue
 <bryan.odonoghue@linaro.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>,  Hans de Goede <hdegoede@redhat.com>, Sumit
 Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Lennart
 Poettering <mzxreary@0pointer.de>,  Robert Mader
 <robert.mader@collabora.com>, Sebastien Bacher
 <sebastien.bacher@canonical.com>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>,  linaro-mm-sig@lists.linaro.org, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Milan Zamazal
 <mzamazal@redhat.com>, Andrey Konovalov <andrey.konovalov.ynk@gmail.com>
Date: Tue, 21 May 2024 10:18:53 -0400
In-Reply-To: <20240521-thick-messy-lemur-c8cebe@houat>
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
	 <20240521-thick-messy-lemur-c8cebe@houat>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le mardi 21 mai 2024 =C3=A0 10:43 +0200, Maxime Ripard a =C3=A9crit=C2=A0:
> On Thu, May 16, 2024 at 01:11:51PM GMT, nicolas.dufresne@collabora.corp-p=
artner.google.com wrote:
> > Le jeudi 16 mai 2024 =C3=A0 14:27 +0300, Laurent Pinchart a =C3=A9crit=
=C2=A0:
> > > Hi Nicolas,
> > >=20
> > > On Wed, May 15, 2024 at 01:43:58PM -0400, nicolas.dufresne@collabora.=
corp-partner.google.com wrote:
> > > > Le mardi 14 mai 2024 =C3=A0 23:42 +0300, Laurent Pinchart a =C3=A9c=
rit=C2=A0:
> > > > > > You'll hit the same limitation as we hit in GStreamer, which is=
 that KMS driver
> > > > > > only offer allocation for render buffers and most of them are m=
issing allocators
> > > > > > for YUV buffers, even though they can import in these formats. =
(kms allocators,
> > > > > > except dumb, which has other issues, are format aware).
> > > > >=20
> > > > > My experience on Arm platforms is that the KMS drivers offer allo=
cation
> > > > > for scanout buffers, not render buffers, and mostly using the dum=
b
> > > > > allocator API. If the KMS device can scan out YUV natively, YUV b=
uffer
> > > > > allocation should be supported. Am I missing something here ?
> > > >=20
> > > > There is two APIs, Dumb is the legacy allocation API, only used by =
display
> > >=20
> > > Is it legacy only ? I understand the dumb buffers API to be officiall=
y
> > > supported, to allocate scanout buffers suitable for software renderin=
g.
> > >=20
> > > > drivers indeed, and the API does not include a pixel format or a mo=
difier. The
> > > > allocation of YUV buffer has been made through a small hack,=20
> > > >=20
> > > >   bpp =3D number of bits per component (of luma plane if multiple p=
lanes)
> > > >   width =3D width
> > > >   height =3D height * X
> > > >=20
> > > > Where X will vary, "3 / 2" is used for 420 subsampling, "2" for 422=
 and "3" for
> > > > 444. It is far from idea, requires deep knowledge of each formats i=
n the
> > > > application
> > >=20
> > > I'm not sure I see that as an issue, but our experiences and uses cas=
es
> > > may vary :-)
> >=20
> > Its extra burden, and does not scale to all available pixel formats. My=
 reply
> > was for readers education as I feel like a lot of linux-media dev don't=
 have a
> > clue of what is going on at the rendering side. This ensure a minimum k=
nowledge
> > to everyone commenting.
> >=20
> > And yes, within the GFX community, Dumb allocation is to be killed and
> > replacement completely in the future, it simply does not have a complet=
e
> > replacement yet.
> >=20
> > >=20
> > > > and cannot allocate each planes seperatly.
> > >=20
> > > For semi-planar or planar formats, unless I'm mistaken, you can eithe=
r
> > > allocate a single buffer and use it with appropriate offsets when
> > > constructing your framebuffer (with DRM_IOCTL_MODE_ADDFB2), or alloca=
te
> > > one buffer per plane.
> >=20
> > We have use cases were single allocation is undesirable, but I don't re=
ally feel
> > like this is important enough for me to type this explanation. Ping me =
if you
> > care.
> > >=20
> > > > The second is to use the driver specific allocation API. This is th=
en abstracted
> > > > by GBM. This allows allocating render buffers with notably modifier=
s and/or use
> > > > cases. But no support for YUV formats or multi-planar formats.
> > >=20
> > > GBM is the way to go for render buffers indeed. It has been designed
> > > with only graphics buffer management use cases in mind, so it's
> > > unfortunately not an option as a generic allocator, at least in its
> > > current form.
> > >=20
> >=20
> > What I perhaps should have highlighted that is that all these allocator=
s in the
> > GFX (called DRM, but meh) subsystem abstract away some deep knowledge o=
f the HW
> > requirements. Heaps are lower level APIs that assume that userspace hav=
e this
> > knowledge. The Android and ChromeOS solution is to take the implementat=
ion from
> > the kernel and move it into userspace, see minigbm from chromeos, or gr=
alloc
> > from Android. As these two projects are device centric, they are not us=
able on
> > generic Linux. Heaps might have some future, but not without other piec=
e of the
> > puzzle.
> >=20
> > To come back to you wanting heaps in libcamera, because it makes them b=
etter for
> > rendered or display. Well today this is a lie you make to yourself, bec=
ause this
> > is just a tiny bit of the puzzle, it is pure luck if you allocate dmabu=
f is
> > usable but a foreign device. At the end of the day, this is just a fall=
back to
> > satisfy that application are not forced to allocate that memory in libc=
amera.
>=20
> I mean, it's pure luck, but can you point to any platform supported
> upstream where it wouldn't work?

Most AMD GPUs needs 256 bytes aligned strides. So unless you have that hard=
coded
in libcamera its one case that often fail to import. There is no kernel API=
 to
know anyway, so hardcoding is becoming common with the popularity of the GP=
Us.
Mali have a 64 bytes alignment required, except  for some YUV formats on ve=
ry
recent Mesa. If you hardcode for AMD, it works for Mali too.

Intel display driver is an interesting one. Most of software dmabuf exporte=
r
will enable cpu cache (UVC driver included). That driver fails to reject th=
ese
dmabuf assuming the exporter will always flush the cache. UVC driver as exp=
orted
does not, its not so clear to me if dmaheap+softISP (assuming softISP do th=
e
dmabuf sync calls) will work or not. UVC to display artifacts were still vi=
sible
on 6.8 (last time I tested).

>=20
> > Thus, I strongly recommend the udmabuf in the short term. Finally, movi=
ng to
> > heaps when the reported issue is resolved, as then it gives more option=
s and
> > reduce the number of layers.
>=20
> udmabuf wouldn't work with any platform without an IOMMU. We have plenty
> of those.

Its up to userspace to decide to allocate scattered or not, but again,
generically there is no API to let the application (softISP) know. Many of =
our
real-life tests concluded that using malloc data in software video processi=
ng to
finally do a memcpy() into final "device" memory is faster then using "cohe=
rent"
allocation or doing the cache handling.

>=20
> All things considered, while I agree that it isn't the ideal solution,
> we really don't have a better (ie, works on a larger set of platforms)
> solution at the moment or in the next 5 years.

Indeed. In the short term, I like the idea that we'll first make it safe to
expose the heaps at all time, so at least we have a choice. Today, on most =
major
distributions none of the solution mentioned are available. I have no idea =
how
much work this is.

Nicolas


