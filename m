Return-Path: <linux-media+bounces-14349-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ED75491C088
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 16:11:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F69F1C21C63
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 14:11:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A0E31C004F;
	Fri, 28 Jun 2024 14:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GiVWpopY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC181BF305;
	Fri, 28 Jun 2024 14:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719583879; cv=none; b=u2+S4B4C6dhsnat1yVqwUpl5GQtzqwiRHnhuGxN7+pk9KSBhrNVYD6T8VyvxpPeuDxh66kMd3yWu4vJq7VzNr5sabbACapVzQnI3ls0n0Y9aepaZDZ2VFAyPSHbuRTgKMNh1xGpMfQUM1jm/CoUrJkyv7jgUOzvMP1mMDiqHjTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719583879; c=relaxed/simple;
	bh=fSw3ru4jN9d4ybV2khk34iBEEicROSB4m//SX5Nqhgw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pvxl4wQQNL9sF4tSgJ7IOP/DF+Ndw0/3Ft2fDHZncumIjqbZQm/bHeswP4TW1jiYPDIM6JaDXL6bLETJLBTSTg9anMs/+bJFrMNB/INFkM5pYgE2PSLLyak8UWGUgSXr0bb8aC/uib2V+AcIBMHXJKUvYZ+BlpIKpOwk3vrYIug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GiVWpopY; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42138eadf64so5593335e9.3;
        Fri, 28 Jun 2024 07:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719583876; x=1720188676; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZxKiQR1WifW9R4T+o00BES3qwoMoa9ISf2D6Aafrxx8=;
        b=GiVWpopYA3pwEakHILukhD7qUXwagNIgabL+/W8C6+tw15xyIanXeX6H7Smh76aJja
         Vj+JtjcMpOdzhd/q5umUe1etQD1FAI4t+KsIXYONelpad51mWxhEgv2eZvrg/MoNzQRw
         XHbCgz5SB61/0bfFDgU9ZirV/jBuY/MgjJBj+r8ZfRMgAm9/GlbpWP2soymXp4UEhaeS
         iSxyC7jFPrXS8d4sREa6wy0yhHfJ42E9m5jmlf4TfvFOxjaFtHbZLG6h8caocs/8q5zn
         ZYriWMGnKhqYZ5yLtGcqISpcGPWEo0+/Uf0eluc+Xaq6p5/Mwr9bBNC7pxASNXKST7gv
         asUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719583876; x=1720188676;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZxKiQR1WifW9R4T+o00BES3qwoMoa9ISf2D6Aafrxx8=;
        b=f0Td/EqkxFeSnaaigMnoxlE493v8GK8dzbqP+BNf56GLOQG3d1BwlAEnMvFPgtLhRD
         Dqxnl31ZJhkgdbLKPYMQhC6DmDG2F3V6oybZwP8BvswSA8Ux5f61NyggXGBADEfX0y3C
         ARJD34KFfq6D9aT2JqexUamfeOcv1MW4ICnjAo/4rC+DQSopGq2cfcaxWw+v87e9u3dt
         zoF8AAxnHBY5i5fJirrfnEiVo5t8yP+nBPK8SZeko3y6ZmodX4XDapD704yMpRxqYq6q
         Axho/4eZBlD7RoF6PB/FEs6Y3TWnKVjoerZeXy8ALE8tbxYZMpUDA860HNQ0ywQjPBZi
         p0Ag==
X-Forwarded-Encrypted: i=1; AJvYcCVaegBT04uHZ7+uNbcPmZ4EWGi/f6hjH61gGwEOxinPAFobKzlANZQRexcCTgZBcllUc3tzKNX3obkGWTWASDKTkl4+QAMAv+zus+Zrm+uX1Rv5n/HsDO2g4rzdwgvPHQbuMvI+VBRbrD/9haJRRnoznVTAgWJdFzEOvbBSI2zOkZPHOM+y
X-Gm-Message-State: AOJu0Yx5iokB0cREd4N+1YATd2fdKjadLsHtxHC5WmSjndVElcfrFq/s
	5rkrekiM9+8StcWkWDhUI445nuhIw41KFfQYhCKaks9kjycuIBiK
X-Google-Smtp-Source: AGHT+IGbRNARcyszw7Fxct+HFR/l8/HkdbHi7l9tRcmptWJeUjqa7yMsnwT9j/blr6nU6pxbXF7nyA==
X-Received: by 2002:a05:600c:4f09:b0:425:680b:a6a8 with SMTP id 5b1f17b1804b1-425680ba7camr36139395e9.15.1719583875564;
        Fri, 28 Jun 2024 07:11:15 -0700 (PDT)
Received: from orome (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256af55d0fsm36838285e9.19.2024.06.28.07.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 07:11:15 -0700 (PDT)
Date: Fri, 28 Jun 2024 16:11:13 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: "mripard@kernel.org" <mripard@kernel.org>
Cc: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Jason-JH Lin =?utf-8?B?KOael+edv+elpSk=?= <Jason-JH.Lin@mediatek.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, 
	"quic_vjitta@quicinc.com" <quic_vjitta@quicinc.com>, 
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>, "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "jkardatzke@google.com" <jkardatzke@google.com>, 
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, "joakim.bech@linaro.org" <joakim.bech@linaro.org>, 
	Youlin Pei =?utf-8?B?KOijtOWPi+aelyk=?= <youlin.pei@mediatek.com>, "logang@deltatee.com" <logang@deltatee.com>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	Kuohong Wang =?utf-8?B?KOeOi+Wci+m0uyk=?= <kuohong.wang@mediatek.com>, 
	Jianjiao Zeng =?utf-8?B?KOabvuWBpeWnoyk=?= <Jianjiao.Zeng@mediatek.com>, "contact@emersion.fr" <contact@emersion.fr>, 
	"benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>, "willy@infradead.org" <willy@infradead.org>, 
	"pavel@ucw.cz" <pavel@ucw.cz>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, 
	"Brian.Starkey@arm.com" <Brian.Starkey@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"tjmercier@google.com" <tjmercier@google.com>, "jstultz@google.com" <jstultz@google.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "robin.murphy@arm.com" <robin.murphy@arm.com>, 
	Yong Wu =?utf-8?B?KOWQtOWLhyk=?= <Yong.Wu@mediatek.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"ppaalanen@gmail.com" <ppaalanen@gmail.com>
Subject: Re: [PATCH v5 2/9] scatterlist: Add a flag for the restricted memory
Message-ID: <72dx7gqentafhwqnfjmosemm35vfl3blqrfiu5skm3cj33eqqu@vj7kmbllgehk>
References: <1050c44512374031d1349b5dced228d0efc3fbde.camel@mediatek.com>
 <3104b765-5666-44e4-8788-f1b1b296fe17@amd.com>
 <98c11bad7f40bcc79ed7a2039ddb3a46f99908f5.camel@mediatek.com>
 <75dc1136-7751-4772-9fa7-dd9124684cd2@amd.com>
 <ZnxWWtdShekGSUif@phenom.ffwll.local>
 <ae73a0203d6acf2878c9e3ae2d7554816b9c66ad.camel@mediatek.com>
 <5739abdb-0234-412a-9f25-49219411bbc6@amd.com>
 <20240627-impetuous-aboriginal-cougar-cdcbbf@houat>
 <w3xcvakoytubud6dw4wxr6ntbe6uvfrldihnd26vai6uyyto6j@vcq7gizxolag>
 <20240628-hypnotic-kagu-of-hurricane-5fbc82@houat>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xr2rzsuy6pm7a5h3"
Content-Disposition: inline
In-Reply-To: <20240628-hypnotic-kagu-of-hurricane-5fbc82@houat>


--xr2rzsuy6pm7a5h3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2024 at 03:21:51PM GMT, mripard@kernel.org wrote:
> On Fri, Jun 28, 2024 at 01:47:01PM GMT, Thierry Reding wrote:
> > On Thu, Jun 27, 2024 at 04:40:02PM GMT, mripard@kernel.org wrote:
> > > On Thu, Jun 27, 2024 at 08:57:40AM GMT, Christian K=C3=B6nig wrote:
> > > > Am 27.06.24 um 05:21 schrieb Jason-JH Lin (=E6=9E=97=E7=9D=BF=E7=A5=
=A5):
> > > > >=20
> > > > > On Wed, 2024-06-26 at 19:56 +0200, Daniel Vetter wrote:
> > > > > >   > External email : Please do not click links or open attachme=
nts
> > > > > until
> > > > > > you have verified the sender or the content.
> > > > > >  On Wed, Jun 26, 2024 at 12:49:02PM +0200, Christian K=C3=B6nig=
 wrote:
> > > > > > > Am 26.06.24 um 10:05 schrieb Jason-JH Lin (=E6=9E=97=E7=9D=BF=
=E7=A5=A5):
> > > > > > > > > > I think I have the same problem as the ECC_FLAG mention=
 in:
> > > > > > > > > > > > > https://lore.kernel.org/linux-media/20240515-dma-=
buf-ecc-heap-v1-0-54cbbd049511@kernel.org/
> > > > > > > > > > > > I think it would be better to have the user configu=
rable
> > > > > > private
> > > > > > > > > > information in dma-buf, so all the drivers who have the=
 same
> > > > > > > > > > requirement can get their private information from dma-=
buf
> > > > > > directly
> > > > > > > > > > and
> > > > > > > > > > no need to change or add the interface.
> > > > > > > > > > > > What's your opinion in this point?
> > > > > > > > >  > Well of hand I don't see the need for that.
> > > > > > > > > > What happens if you get a non-secure buffer imported in=
 your
> > > > > > secure
> > > > > > > > > device?
> > > > > > > > > > > We use the same mediatek-drm driver for secure and
> > > > > non-secure
> > > > > > buffer.
> > > > > > > > If non-secure buffer imported to mediatek-drm driver, it's =
go to
> > > > > > the
> > > > > > > > normal flow with normal hardware settings.
> > > > > > > > > > > We use different configurations to make hardware have
> > > > > different
> > > > > > > > permission to access the buffer it should access.
> > > > > > > > > > > So if we can't get the information of "the buffer is
> > > > > allocated
> > > > > > from
> > > > > > > > restricted_mtk_cma" when importing the buffer into the driv=
er, we
> > > > > > won't
> > > > > > > > be able to configure the hardware correctly.
> > > > > > > > > Why can't you get this information from userspace?
> > > > > > > Same reason amd and i915/xe also pass this around internally =
in the
> > > > > > kernel, it's just that for those gpus the render and kms node a=
re the
> > > > > > same
> > > > > > driver so this is easy.
> > > > > >
> > > >=20
> > > > The reason I ask is that encryption here looks just like another pa=
rameter
> > > > for the buffer, e.g. like format, stride, tilling etc..
> > > >=20
> > > > So instead of this during buffer import:
> > > >=20
> > > > mtk_gem->secure =3D (!strncmp(attach->dmabuf->exp_name, "restricted=
", 10));
> > > > mtk_gem->dma_addr =3D sg_dma_address(sg->sgl);
> > > > mtk_gem->size =3D attach->dmabuf->size;
> > > > mtk_gem->sg =3D sg;
> > > >=20
> > > > You can trivially say during use hey this buffer is encrypted.
> > > >=20
> > > > At least that's my 10 mile high view, maybe I'm missing some extens=
ive key
> > > > exchange or something like that.
> > >=20
> > > That doesn't work in all cases, unfortunately.
> > >=20
> > > If you're doing secure video playback, the firmware is typically in
> > > charge of the frame decryption/decoding, and you'd get dma-buf back t=
hat
> > > aren't accessible by the CPU (or at least, not at the execution level
> > > Linux runs with).
> >=20
> > Can you clarify which firmware you're talking about? Is this secure
> > firmware, or firmware running on the video decoding hardware?
>=20
> Secure firmware

Ah... interesting. So you actually need to interop with that firmware in
order to start decryption/decoding. That's quite different from how this
works on Tegra. Well, maybe not entirely. For Tegra there is firmware
that runs on the hardware decoder and which has access to the keys, so
in that way I guess it's similar to your use-case, except the firmware
runs on a different chip.

> > > So nobody can map that buffer, and the firmware driver is the one who
> > > knows that this buffer cannot be accessed by anyone. Putting this on =
the
> > > userspace to know would be pretty weird, and wouldn't solve the case
> > > where the kernel would try to map it.
> >=20
> > Doesn't userspace need to know from the start whether it's trying to do
> > secure playback or not?
>=20
> It does, but it won't know the capabilities of the buffer it gets back
> from the secure firmware.

I think that's kind of the point. Does it really have to know the
capabilities? Isn't it enough to know that it's got some sort of
protected buffer back and then use it more or less blindly? I mean
these are things that have to be tightly coupled no matter what, so
how much point is there in trying to validate what you get?

> > Typically this involves more than just the decoding part. You'd
> > typically set up things like HDCP as part of the process, so userspace
> > probably already does know that the buffers being passed around are
> > protected.
> >=20
> > Also, the kernel shouldn't really be mapping these buffers unless
> > explicitly told to. In most cases you also wouldn't want the kernel to
> > map these kinds of buffers, right? Are there any specific cases where
> > you expect the kernel to need to map these?
> >=20
> > I've been looking at this on the Tegra side recently and the way it
> > works on these chips is that you basically get an opaque carveout region
> > that has been locked down by secure firmware or early bootloaders, so
> > only certain hardware blocks can access it. We can allocate from that
> > carveout and then pass the buffers around.
>=20
> So you allocate both the input and output buffers (and from different
> regions) from the application, and pass both to the secure firmware?
>=20
> Yeah, I guess that would work then.

It doesn't really matter who allocates the buffers. It could be the
application allocating the scanout buffer from a DRM/KMS device and the
input buffer from the multimedia decoder. Or it could be the application
allocating both buffers from different DMA-BUF heaps. In the end it
shouldn't really matter where they are coming from. It's effectively up
to the application to pass the right buffers into the right IOCTLs.

> > It may be possible to use these protected carveout regions exclusively
> > from the DRM/KMS driver and share them with multimedia engines via DMA-
> > BUF, but I've also been looking into perhaps using DMA-BUF heaps to
> > expose the carveout, which would make this a bit more flexible and allow
> > either userspace to allocate the buffers or have multiple kernel drivers
> > share the carveout via the DMA-BUF heap. Though the latter would require
> > that there be in-kernel APIs for heaps, so not too sure about that yet.
>=20
> What would be the advantage of using a heap compared to having all these
> devices in DT use the reserved-memory property and point to that
> carveout? It should already work today.

You can't just have all of these point to a common reserved-memory node
because there can be multiple concurrent users. You could have multiple
protected streams running at the same time. DMA-BUF heaps allows us to
expose a central provider for the protected memory so that allocations
can be properly arbitrated.

Thierry

--xr2rzsuy6pm7a5h3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmZ+xH4ACgkQ3SOs138+
s6Ewkw/+OuesTDwI4fSJ/OgnfnSYV+09dFmZnKCi7T9XiPqeHlgY+7yQJEjWaSog
9Kad7Sr83CNyrKHDePh/SHKyReazx+0HaT6abYiBlidEjZ7D74N6GoGMp3Kz6W23
pctq1hflyNgDWkElJ0pVxfY7MwJoHURxaxDEgnLpWITye8AHU5mwP47H/XgdGBYq
jd2ygGo/LZ3M8S48QlBayvRkrQC76OaAzG/u/TzJSNpMFZOQuU3Yh9m+t11VHr1g
Gf9SYQDRk/Rd7pHqGGrQjHXPlKXz+sz51HpX8dj3j9xtupjHgOd8jWLfQKMU7AlA
waDv9+KFWQd7L6u9fBpLAkT00toK9JvEW0/3bOZ/IOhZr5wLlPDkd91dwHbl94sz
yawHtAEcFQDZktRqkiq3PWig4mFb12tlBWR1dPH/BiRQaghyw3FZ0LzmrmmoGowR
Rd7ceZA+13m3e+XcoY6TYNFIuJNQP+OPrmPbzUaUxD/JEIfGBMlzVrZl/8Tx+0kV
hiehAiVeC1uXPzllCHvoV8pYBpfFArXSTwrWg6P8QevwWOqOa/SJBfauBpvJB7Go
gGCfcVEJXQ+VQrqgGo/5ked+5djU5Qwz5PEOxJ2+XH0n92rpXH1Ml4Mkv2Xlp0lk
0Eftw28P6ER9Nkh82eV4TOpX6r0vhePu4x3bq4vDUWMmr6q+k40=
=kVmy
-----END PGP SIGNATURE-----

--xr2rzsuy6pm7a5h3--

