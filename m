Return-Path: <linux-media+bounces-24350-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F83A045B5
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 17:14:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB12F165D08
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 16:14:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B607E1F4708;
	Tue,  7 Jan 2025 16:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="i53+cfiV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9FB1F37C5
	for <linux-media@vger.kernel.org>; Tue,  7 Jan 2025 16:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736266462; cv=none; b=MffCCWOcSzDOBMUw/9fpdoqGoiLz8aXVSGscT4xw+cKNfNWxtDYuadHIaRkmtowZ0IOg1T9V5tRXHJTn74cUN73WhP8GLMpiw7drXnPdI0WbDAbmjy0d7DRMivaHczUWGfKX5rUA8TxnfDlS7x8ToBEfhOblD0doXnUtZmIgMGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736266462; c=relaxed/simple;
	bh=FbDfPFegFAi5sYcEX085zjrnU7Q1elEQcnnCeGFvOh4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=quA0rkuiJR9QHcOndYTHOOKzpmIxPe361xyln5rCy/Pobe6fGR+m26Pb6uAqCnzMPheY37AErPIqde0a3ylUV5/a+mOW3SYaNZv3FPtWlXN9stFcEfc/kDgZXnK+Lma3ldTrW8hELCVdOcS8wgJmrDBvXmRHkSXP2zCLyYxvzzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=i53+cfiV; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e3983426f80so22023110276.1
        for <linux-media@vger.kernel.org>; Tue, 07 Jan 2025 08:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1736266457; x=1736871257; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0rvra3RCbmO7on5RjXJBOjy4ediXvLDrlpyaByEjLGY=;
        b=i53+cfiVv3m8V/ZFrYnBySNa9wFOWAsNWtcvVe22KHR3vW8x1Ix+V1AlIqoyirEGls
         U4yJ7RwaNuhDceHml8rrC/oLSb1vBRN5AiG9Ib0sCMJhnfe8zAto2UN+nNud16p5QyFg
         djMDzlji5OHuxh6NAxVOaG21cWf1Ba7IqxqPaUrUl5T9jXSjLLfvdD2yvglAt78uREEN
         xdgJsmnA0k8P72gBD1kJXy0Sw7Ga2AHxzz4qPe9I6p/eZSyqOLECbzIxm/xwXyuFDFN0
         HjjWH0oFAuxyasekjPrvisqarcXpySQy5Jw6fbVWfR6CIbd13cI7Ns2btOPZOeYd4JDn
         ecxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736266457; x=1736871257;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0rvra3RCbmO7on5RjXJBOjy4ediXvLDrlpyaByEjLGY=;
        b=tdDwH60SrycQflv+Nq+32//bD4vZyafBb9vfjgLF7RnpMMfXZj6TsRm3Cmpg/pVbMP
         kLDhVH2NBEQzdropjUcuhxb5j7biysB9PE/11m/PtzT6bJwPuk7hndM5YtWjfMUkveUR
         jqv5OarBlf/XLD7j1l4wtUlROwhGNisYIrXWUjFpnA2jl2YLAC6m2uq3xRDz34wuCZYh
         CPylGyh9GOHipoOa7YEQzi4qJZ/j09i+goGA/9Do9EilFeEwaCSd1LAw9RkiUv8Zvm+Y
         MXZozLcGXNZlYEf0nDWA8peGpIc+FxfMS8EuG9PlW9ib1sOxUjci7vyGj7936zxQ2j2G
         CP/g==
X-Forwarded-Encrypted: i=1; AJvYcCWeh1KcknCQkdx2WU5qHRPB7dtdw/j9fHXc3ckIIpag9+AFqlnVTOL+jY+roggacnNXvBhOwlmpr//Xww==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/l1q8ozXNME9fLeb0MCQPIS1U9a4VTed5yukGzHLk1lAAxXDj
	gnPUif1G2YgtkAKciaID8YgpVmbmbbKKP3CucN/NWLZa4FVQpijneWS+PuyQ7PB1+6KMD5jDe9O
	nZNCEFEAfnGCVdl73jA9u0egd24iY0WVcj+7eVQ==
X-Gm-Gg: ASbGncsiabw+mH7fjylMPE7ZJ4djaoTAr6UNMed2PJSy50TnnglA8AAxB9gRuTvxxpx
	2x3z2NZVRn+F4CS0Su7QOZxfF+RY/ifL6TS3Y5kJrN3sjsZv7ed625PK8QvE6WA1N1/rznQ==
X-Google-Smtp-Source: AGHT+IHjt6hgsSYIWcGMH4BD5lYCfFjrFTcc/W+yzGtUvG88Grw1oBmNIs84ANy3GKYQgJLFRzpBsKl6TJmjjiydVZQ=
X-Received: by 2002:a05:690c:4988:b0:6ef:7fc0:a381 with SMTP id
 00721157ae682-6f3f80d9149mr459489347b3.8.1736266456908; Tue, 07 Jan 2025
 08:14:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241220-media-rpi-hevc-dec-v1-0-0ebcc04ed42e@raspberrypi.com> <6d6c49919af9e782bd8e9be5066e92c9704ad5b7.camel@ndufresne.ca>
In-Reply-To: <6d6c49919af9e782bd8e9be5066e92c9704ad5b7.camel@ndufresne.ca>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 7 Jan 2025 16:13:58 +0000
Message-ID: <CAPY8ntCxH2C=YEJEcee0b2UuXU+xZ0Ntbuvc29MLAipr9DCmmw@mail.gmail.com>
Subject: Re: [PATCH 0/7] Raspberry Pi HEVC decoder driver
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, John Cox <john.cox@raspberrypi.com>, 
	Dom Cobley <dom@raspberrypi.com>, review list <kernel-list@raspberrypi.com>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, John Cox <jc@kynesim.co.uk>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, John Cox <john.cox@raspberypi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nicolas

On Mon, 6 Jan 2025 at 20:46, Nicolas Dufresne <nicolas@ndufresne.ca> wrote:
>
> Hi Dave,
>
> Le vendredi 20 d=C3=A9cembre 2024 =C3=A0 16:21 +0000, Dave Stevenson a =
=C3=A9crit :
> > Hi All
> >
> > This has been in the pipeline for a while, but I've finally cleaned
> > up our HEVC decoder driver to be in a shape to at least get a first
> > review.
> > John Cox has done almost all of the work under contract to Raspberry
> > Pi, and I'm largely just doing the process of patch curation and
> > sending.
> >
> > There are a couple of questions raised in frameworks.
> > The main one is that the codec has 2 independent phases to the decode,
> > CABAC and reconstruction. To keep the decoder operating optimally
> > means that two requests need to be in process at once, whilst the
> > current frameworks don't want to allow as there is an implicit
> > assumption of only a single job being active at once, and
> > completition returns both buffers and releases the media request.
> >
> > The OUTPUT queue buffer is finished with and can be returned at the
> > end of phase 1, but the media request is still required for phase 2.
> > The frameworks currently force the driver to be returning both
> > together via v4l2_m2m_buf_done_and_job_finish. v4l2_m2m_job_finish
> > would complete the job without returning the buffer as we need,
> > however if the driver has set VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF
> > then we have a WARN in v4l2_m2m_job_finish.
> > Dropping the WARN as this series is currently doing isn't going to be
> > the right answer, but it isn't obvious what the right answer is.
> > Discussion required.
>
> I think part of the manual request completion RFC will be to evaluate the=
 impact
> on VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF feature. MTK does not suppor=
t
> interleaved interlaced decoding (only alternate), so they didn't have to
> implement that feature.
>
> Overall, It would be nice to get your feedback on the new manual request
> proposal, which is I believe better then the pin/unpin API you have in th=
is
> serie.

I wasn't aware of that series, but I / John will take a look.

> >
> > We also have a need to hold on to the media request for phase 2. John
> > had discussed this with Ezequiel (and others) a couple of years back,
> > and hence suggested a patch that adds media_request_{pin,unpin} to
> > grab references on the media request. Discussion required on that
> > or a better way of handling it.
> >
> > I will apologise in advance for sending this V1 just before I head off
> > on the Christmas break, but will respond to things as soon as possible.
>
> One thing missing in this summary is how this driver is being validated
> (specially that for this one requires a downstream fork of FFMPEG). To th=
is
> report we ask for:
>
> - v4l2-compliance results
> - Fluster conformance tests results [1] and I believe you need [2]
>
> [1] https://github.com/fluendo/fluster
> [2] https://github.com/fluendo/fluster/pull/179

Sure, I'll sort that before doing a V2.

> GStreamer support is there in main now, but without the needed software v=
ideo
> converter for you column tiling, we can't use it for that (i.e. only work=
s
> through GL or Wayland).

Can you point me at the right place for the software converter?
It's a relatively trivial reformat required to get it back into NV12 /
I420 or 10bit equivalents, so happy to do that. I think John already
has NEON optimised code if desired.

  Dave

> regards,
> Nicolas
>
> >
> > Thanks
> >   Dave
> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > ---
> > Dave Stevenson (4):
> >       docs: uapi: media: Document Raspberry Pi NV12 column format
> >       media: ioctl: Add pixel formats NV12MT_COL128 and NV12MT_10_COL12=
8
> >       media: dt-bindings: media: Add binding for the Raspberry Pi HEVC =
decoder
> >       arm: dts: bcm2711-rpi: Add HEVC decoder node
> >
> > Ezequiel Garcia (1):
> >       RFC: media: Add media_request_{pin,unpin} API
> >
> > John Cox (2):
> >       media: platform: Add Raspberry Pi HEVC decoder driver
> >       RFC: v4l2-mem2mem: Remove warning from v4l2_m2m_job_finish
> >
> >  .../bindings/media/raspberrypi,hevc-dec.yaml       |   72 +
> >  .../userspace-api/media/v4l/pixfmt-yuv-planar.rst  |   42 +
> >  MAINTAINERS                                        |   10 +
> >  arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi        |    5 +
> >  arch/arm/boot/dts/broadcom/bcm2711.dtsi            |    9 +
> >  drivers/media/mc/mc-request.c                      |   35 +
> >  drivers/media/platform/raspberrypi/Kconfig         |    1 +
> >  drivers/media/platform/raspberrypi/Makefile        |    1 +
> >  .../media/platform/raspberrypi/hevc_dec/Kconfig    |   17 +
> >  .../media/platform/raspberrypi/hevc_dec/Makefile   |    5 +
> >  .../media/platform/raspberrypi/hevc_dec/hevc_d.c   |  443 ++++
> >  .../media/platform/raspberrypi/hevc_dec/hevc_d.h   |  190 ++
> >  .../platform/raspberrypi/hevc_dec/hevc_d_h265.c    | 2629 ++++++++++++=
++++++++
> >  .../platform/raspberrypi/hevc_dec/hevc_d_hw.c      |  376 +++
> >  .../platform/raspberrypi/hevc_dec/hevc_d_hw.h      |  303 +++
> >  .../platform/raspberrypi/hevc_dec/hevc_d_video.c   |  685 +++++
> >  .../platform/raspberrypi/hevc_dec/hevc_d_video.h   |   38 +
> >  drivers/media/v4l2-core/v4l2-ioctl.c               |    2 +
> >  drivers/media/v4l2-core/v4l2-mem2mem.c             |    7 -
> >  include/media/media-request.h                      |   12 +
> >  include/uapi/linux/videodev2.h                     |    5 +
> >  21 files changed, 4880 insertions(+), 7 deletions(-)
> > ---
> > base-commit: e90c9612ac3969cb8206029a26bcd2b6f5d4a942
> > change-id: 20241212-media-rpi-hevc-dec-3b5be739f3bd
> >
> > Best regards,
>

