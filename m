Return-Path: <linux-media+bounces-24811-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD03A12BA8
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 20:19:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 158E23A32E7
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 19:18:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 836411D61A7;
	Wed, 15 Jan 2025 19:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="GQ+DY5rd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABAE154C0C
	for <linux-media@vger.kernel.org>; Wed, 15 Jan 2025 19:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736968733; cv=none; b=V8GocmrvSoqyGrGDYoOZq250/7C2RbMLu9IjGTbeRhsXjKF2k0ALpM8bIszgAKwc26heN43mv6UUaJn4Z7I2y1bSDPzNRZOzP/9AuLDbb/SSAXaQ+kWRIT3xVz2jaRJvJX8O6d0Yz6OuSRZDoY3Y3lt+BhWoAXF0WkOmIUFGtzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736968733; c=relaxed/simple;
	bh=aZUYhG62RDI2+IY84MZ4EddUxzmZSKoaaD3vUYhPv+4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CIO+3xPuVQVaVFk5dgVEQKiRUWhgvt+/DPHZnOpSf9CwpyP4N+ROepd3YYEDFBGMmCp/tnPUHQwMFApM9AUEUwK0l/XC/VSGEOnuYY47XaFTriteRaGI8dB2G3aPQxzUki4sbWDJ1IThkpGozTrw2aULwgg5xIQuBjHy2HCoHF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=GQ+DY5rd; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7b6f1b54dc3so10502785a.1
        for <linux-media@vger.kernel.org>; Wed, 15 Jan 2025 11:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1736968731; x=1737573531; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mpmKtnCWRpHOLmXeM+m8/X0MaS0zLPmR4RSBUWAy3OM=;
        b=GQ+DY5rdRTqG//DsnRdeWdYLoJkJlpkgJrmeo5o2CC4cJ9YleccSHHAh5MzIeyEsUV
         pBPpk9sXU6fi3zJCNx1uZTbL266GpCbF5Jom3i+3Oo+7go6tFeHq+qDh6j37asSq7JsS
         vyt8aAmZ/We+FDjBa6IhL+/BuoiX5+CLEfPHxf836qbxtO7hTpT9jz2hnzBZVryr5U4O
         BlTzuqnFGU9KAjFUFYddfpP05z/wmiBEg2BNddO9ylCKDyYSojPfUx/EO+4bSybpiGOE
         7X911lU5AEmM0y1n7770mYrhlIF4AntxVbfJgzOxwCxOO1oVLe7z/fQwnj+VcKCYdNgG
         IrQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736968731; x=1737573531;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mpmKtnCWRpHOLmXeM+m8/X0MaS0zLPmR4RSBUWAy3OM=;
        b=rbSoglaK7IJqVi/oU95OSfjoPoRYo6W+8pIMbQMw1jqRrlpMcEVPd6GB6+g3t+aoAJ
         bnZ6qYQhjuj2wMsTO7u0qOAinRkBjVV6PpdKSX64trHrhTqNOZ2Fo7R5qYFOWaFUKZr4
         ehPiTtOeb0LABiRi7zfWxO48ZWDQT5rctHYNrFMKOx5sy9tG1lBg9eaMJ6R3zNvSvhQG
         R70Xlr81x3hS3l5vqnCVka9VEdZa7+0DS3wei4cqoFx5FId1/B9efLHyVnrDNzvx1JPa
         fWSn2weD3RGoo1iQS+ARpRXmRploG1dWaHeIymfdv+GbEpwKpPZ/Wgk2sa47Sx0Xrry4
         onNg==
X-Forwarded-Encrypted: i=1; AJvYcCXhkRofBpcFcSLgf79tXO34q0dDBh4i+bRPPF83GUVuxdIchytbCvV/iXDcOcwD6XGSsuuI7uiQmqFIXw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpidFOekNOendtnXFpXG82irwMBYkXP3Zss2gKNbADqynRq2Lv
	5j8C/kAZ4oqHWa68qg7XWIS87cCRTIviSRrzGn1XGb1pKAzEAc5WZbgqmpQxeBo=
X-Gm-Gg: ASbGnctBKFVZv4HkXlfswT/zWZH5ranwp7vIX9XBjoakxdZ4//yqztvVVUg3X/kvT0G
	Qk8xOYptgOTlBU9D4euBsOqQUf6b0UKgO10ptNXnI4eS5vb3IUocNL3hXwCnV5uT0ErEjvdoBgp
	07gmrWjhAOAjIE11FAWC2qNzib9zFm8Gs8RQLchUFcNkFdkz83ftlpoahGSi0qs7inPODotFSsc
	jPqeIy6GunLKanExgZd3IOpIggrzhbrLNPY4wI4rDvQwI6Vu27YGHTp7Q==
X-Google-Smtp-Source: AGHT+IHgX0R1BrWaa+bTz5ALI7oBXhVm+zFDFeStqtCEQMg2RUCVlizRdsnOV0vsJ4odvy758h7Qyg==
X-Received: by 2002:a05:620a:4614:b0:7b6:6d4e:40c5 with SMTP id af79cd13be357-7bcd973efdemr4688148585a.21.1736968731084;
        Wed, 15 Jan 2025 11:18:51 -0800 (PST)
Received: from nicolas-tpx395.localdomain ([2606:6d00:15:862e::7a9])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7be44d3da3bsm275447485a.114.2025.01.15.11.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 11:18:50 -0800 (PST)
Message-ID: <220affb06b8f7b1015bcce6d85df464dc34353c7.camel@ndufresne.ca>
Subject: Re: [PATCH 0/7] Raspberry Pi HEVC decoder driver
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: John Cox <jc@kynesim.co.uk>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, Sakari Ailus	
 <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
  Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,  Broadcom internal kernel review list	
 <bcm-kernel-feedback-list@broadcom.com>, John Cox
 <john.cox@raspberrypi.com>,  Dom Cobley <dom@raspberrypi.com>, review list
 <kernel-list@raspberrypi.com>, Ezequiel Garcia	
 <ezequiel@vanguardiasur.com.ar>, linux-media@vger.kernel.org
Date: Wed, 15 Jan 2025 14:18:49 -0500
In-Reply-To: <2aqaojh380fqpuillo1es2k7bq1pi7aln0@4ax.com>
References: <20241220-media-rpi-hevc-dec-v1-0-0ebcc04ed42e@raspberrypi.com>
	 <6d6c49919af9e782bd8e9be5066e92c9704ad5b7.camel@ndufresne.ca>
	 <2aqaojh380fqpuillo1es2k7bq1pi7aln0@4ax.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le lundi 13 janvier 2025 =C3=A0 19:35 +0000, John Cox a =C3=A9crit=C2=A0:
> Hi Nicolas
>=20
> [some recipients snipped - pretty much at random - due to my previous
> reply all here being rejected due to too many recips]
>=20
> > Hi Dave,
> >=20
> > Le vendredi 20 d=C3=A9cembre 2024 =C3=A0 16:21 +0000, Dave Stevenson a =
=C3=A9crit=C2=A0:
> > > Hi All
> > >=20
> > > This has been in the pipeline for a while, but I've finally cleaned
> > > up our HEVC decoder driver to be in a shape to at least get a first
> > > review.
> > > John Cox has done almost all of the work under contract to Raspberry
> > > Pi, and I'm largely just doing the process of patch curation and
> > > sending.
> > >=20
> > > There are a couple of questions raised in frameworks.
> > > The main one is that the codec has 2 independent phases to the decode=
,
> > > CABAC and reconstruction. To keep the decoder operating optimally
> > > means that two requests need to be in process at once, whilst the
> > > current frameworks don't want to allow as there is an implicit
> > > assumption of only a single job being active at once, and
> > > completition returns both buffers and releases the media request.
> > >=20
> > > The OUTPUT queue buffer is finished with and can be returned at the
> > > end of phase 1, but the media request is still required for phase 2.
> > > The frameworks currently force the driver to be returning both
> > > together via v4l2_m2m_buf_done_and_job_finish. v4l2_m2m_job_finish
> > > would complete the job without returning the buffer as we need,
> > > however if the driver has set VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_B=
UF
> > > then we have a WARN in v4l2_m2m_job_finish.
> > > Dropping the WARN as this series is currently doing isn't going to be
> > > the right answer, but it isn't obvious what the right answer is.
> > > Discussion required.
> >=20
> > I think part of the manual request completion RFC will be to evaluate t=
he impact
> > on VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF feature. MTK does not supp=
ort
> > interleaved interlaced decoding (only alternate), so they didn't have t=
o
> > implement that feature.
> >=20
> > Overall, It would be nice to get your feedback on the new manual reques=
t
> > proposal, which is I believe better then the pin/unpin API you have in =
this
> > serie.
>=20
> I took the manual_completion patches, patched them into our current tree
> and did the relatively trivial conversion from pin to manual_completion
> (not quite a simple global replace but quite close) and it all seems to
> work just like it did before. So I'm fine with using that API rather
> than pin.

That's a good news, looking forward the update.

Nicolas

>=20
> Regards
>=20
> John Cox
>=20
>=20
> > > We also have a need to hold on to the media request for phase 2. John
> > > had discussed this with Ezequiel (and others) a couple of years back,
> > > and hence suggested a patch that adds media_request_{pin,unpin} to
> > > grab references on the media request. Discussion required on that
> > > or a better way of handling it.
> > >=20
> > > I will apologise in advance for sending this V1 just before I head of=
f
> > > on the Christmas break, but will respond to things as soon as possibl=
e.
> >=20
> > One thing missing in this summary is how this driver is being validated
> > (specially that for this one requires a downstream fork of FFMPEG). To =
this
> > report we ask for:
> >=20
> > - v4l2-compliance results
> > - Fluster conformance tests results [1] and I believe you need [2]
> >=20
> > [1]=C2=A0https://github.com/fluendo/fluster
> > [2]=C2=A0https://github.com/fluendo/fluster/pull/179
> >=20
> > GStreamer support is there in main now, but without the needed software=
 video
> > converter for you column tiling, we can't use it for that (i.e. only wo=
rks
> > through GL or Wayland).
> >=20
> > regards,
> > Nicolas
> >=20
> > >=20
> > > Thanks
> > >   Dave
> > >=20
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > ---
> > > Dave Stevenson (4):
> > >       docs: uapi: media: Document Raspberry Pi NV12 column format
> > >       media: ioctl: Add pixel formats NV12MT_COL128 and NV12MT_10_COL=
128
> > >       media: dt-bindings: media: Add binding for the Raspberry Pi HEV=
C decoder
> > >       arm: dts: bcm2711-rpi: Add HEVC decoder node
> > >=20
> > > Ezequiel Garcia (1):
> > >       RFC: media: Add media_request_{pin,unpin} API
> > >=20
> > > John Cox (2):
> > >       media: platform: Add Raspberry Pi HEVC decoder driver
> > >       RFC: v4l2-mem2mem: Remove warning from v4l2_m2m_job_finish
> > >=20
> > >  .../bindings/media/raspberrypi,hevc-dec.yaml       |   72 +
> > >  .../userspace-api/media/v4l/pixfmt-yuv-planar.rst  |   42 +
> > >  MAINTAINERS                                        |   10 +
> > >  arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi        |    5 +
> > >  arch/arm/boot/dts/broadcom/bcm2711.dtsi            |    9 +
> > >  drivers/media/mc/mc-request.c                      |   35 +
> > >  drivers/media/platform/raspberrypi/Kconfig         |    1 +
> > >  drivers/media/platform/raspberrypi/Makefile        |    1 +
> > >  .../media/platform/raspberrypi/hevc_dec/Kconfig    |   17 +
> > >  .../media/platform/raspberrypi/hevc_dec/Makefile   |    5 +
> > >  .../media/platform/raspberrypi/hevc_dec/hevc_d.c   |  443 ++++
> > >  .../media/platform/raspberrypi/hevc_dec/hevc_d.h   |  190 ++
> > >  .../platform/raspberrypi/hevc_dec/hevc_d_h265.c    | 2629 ++++++++++=
++++++++++
> > >  .../platform/raspberrypi/hevc_dec/hevc_d_hw.c      |  376 +++
> > >  .../platform/raspberrypi/hevc_dec/hevc_d_hw.h      |  303 +++
> > >  .../platform/raspberrypi/hevc_dec/hevc_d_video.c   |  685 +++++
> > >  .../platform/raspberrypi/hevc_dec/hevc_d_video.h   |   38 +
> > >  drivers/media/v4l2-core/v4l2-ioctl.c               |    2 +
> > >  drivers/media/v4l2-core/v4l2-mem2mem.c             |    7 -
> > >  include/media/media-request.h                      |   12 +
> > >  include/uapi/linux/videodev2.h                     |    5 +
> > >  21 files changed, 4880 insertions(+), 7 deletions(-)
> > > ---
> > > base-commit: e90c9612ac3969cb8206029a26bcd2b6f5d4a942
> > > change-id: 20241212-media-rpi-hevc-dec-3b5be739f3bd
> > >=20
> > > Best regards,


