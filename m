Return-Path: <linux-media+bounces-24468-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 327A4A06523
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 20:15:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A47F167D7E
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 19:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49314201278;
	Wed,  8 Jan 2025 19:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="ozNjQgM5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0E719ABB6
	for <linux-media@vger.kernel.org>; Wed,  8 Jan 2025 19:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736363725; cv=none; b=eX0PfH+ZVXfS8h7ewd7f9lyMd3nG7ArCLiHVftlbHRVmfYLIBeJTTqcrxdSiXRn+2Hz3TAYeeDxhtNSXJyB4PSme3gX562rV/uk/MH8K0sNDorYh8FPnGhMv0U+yfCgxgkHTvRLGO183HpFCI7gPOR+qAIZVY+bWxJOgVVjJYo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736363725; c=relaxed/simple;
	bh=QgNWnJfRMKF9JftIXvOcU4YXsS8mns9R9Kqe32yl08s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LBpLhV3zjTmnSWXDpbekl7+Dl6nL+blsLlb1OswTNT4uhj8QGAUs13zSKQQ6QdtYIRfTAevO+AhYzoQe4kPVp1wI3iGJUnhz8f8CW5SIIR8yQrx2otdPjufwW0bRHJH/za8N9Fwo7dmASiYn8BYahsXAskFOaFSEU7BhZPoU3PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=ozNjQgM5; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6dd43b08674so1789666d6.3
        for <linux-media@vger.kernel.org>; Wed, 08 Jan 2025 11:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1736363723; x=1736968523; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=M52Mk44BkQ+7uLtkzi2LIqMxodSH7vZgOI4iwRWjrgY=;
        b=ozNjQgM5PcexgOc8SFBFE9H52Ote5i0YMTtJ9fbwJ4/hoFkhC1VYHi5TUriXIThex+
         cXv89DVQIxyW++ndFqBNxD4cCJhbYbXbbPy1UZLJZrQwemwkfyOch3S10lVZkDcQPlNq
         42vqovoQu5z5U9Jtj1aXEu4r1r8ynQ+/FejYVnIWAB4IFD3m0u/MkBHbPa8vUCm33+be
         8Tdt5Rax4X9Ko7sQ2vMXPoC7zF9Ho+EK7YEx8+ZNhAgNsH5lvIP0Bk+eLHARun3zfRd5
         uNLRrUgeWUWGpb0lXT+ushozTBc53/7sqnY9+ysO3TKlOSSZmSUoLV85PX9qpJfFYmt/
         Qxtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736363723; x=1736968523;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M52Mk44BkQ+7uLtkzi2LIqMxodSH7vZgOI4iwRWjrgY=;
        b=UGESOzFF0TIF6kNC1EJ1ZSPNqjvmotj7vqtwMq0QiMZwC9krAE/k+NKPhgPX4QOfbP
         YEk009XnTWYIGufmOQez5i3p/GLH1recKAhT28b5NuAhsEyQ1n5hejAc+f4gPyGenNZW
         4zb6TX4pPFIEXeZ7rE665KiHOYcVSThnwok9596v02z3mBUxRn3unJQ3PXnJpPp2zIHg
         bC912m8kV3Vl5IdwuY0mOwVcilBTVZwaMyNlrRILX5VUy8D50ar4j2BZd2QKcvcO/MQk
         nhRQTeYp/Qb5RCjibtuEuANQR3A49aDXRdtdX6O4/5tnnw1H1+sanJWcc8qmmzSzGjQI
         5Smw==
X-Forwarded-Encrypted: i=1; AJvYcCVfuyFh3cIFVHpz1Oq2E/2jFMUbC6vq/tDelZtGCdTunLZGe+ur/fjZSqxJoXPBf475uIS2McsGxEnpTA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4hPKHmnEtSNBsNX4RFg6oHZCMa9VNC1fSo6wDQMVMxYj/gxzw
	F0H5Tx9mTdVUnIkkC46VmQqafj6Md7M33Vn2QT4sT5aghGCEmUg/8/f5RceVKHc=
X-Gm-Gg: ASbGncsQwTM72PMPeoQHZQar7EQCwTXhKiqDVF0X/r/5zP2M3+ypN2sMpFeQm9hrUHg
	dTA3t1EFjoxmkEn2wMD1om2OGeSXwDd9uExUsx2qKUnKeOz1ygusxOQYuuYRevhO7fOHOcAx9rR
	h5nt44xfxZXPDCZWDyR+ctIAmwSC2RcnP6lOxo+Vwe+zJti0LNtr/tqMB946bJIV/YwqXIXA/v/
	0UDLQUKxoTE0p2T2Hmlqa1EqcwanZDUdiUVXhQkXGrAEyBYTg6Klpf8kg==
X-Google-Smtp-Source: AGHT+IFRT5zib5m260fI2MIaNuGhzpZO4SOSY6igb4Cp9o+S/bihYNZRjajxrfPtzGlpTSuUDolwdA==
X-Received: by 2002:a05:6214:570c:b0:6d9:2e0c:56c4 with SMTP id 6a1803df08f44-6df9b1b4d31mr65617576d6.1.1736363722785;
        Wed, 08 Jan 2025 11:15:22 -0800 (PST)
Received: from nicolas-tpx395.localdomain ([2606:6d00:15:862e::7a9])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dd31faa052sm170937266d6.9.2025.01.08.11.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 11:15:22 -0800 (PST)
Message-ID: <fd5b45f02e5a7dcc828a8e9ae9e6fb2948532dff.camel@ndufresne.ca>
Subject: Re: [PATCH 0/7] Raspberry Pi HEVC decoder driver
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: John Cox <jc@kynesim.co.uk>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, Sakari Ailus	
 <sakari.ailus@linux.intel.com>, Laurent Pinchart	
 <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Florian Fainelli
 <florian.fainelli@broadcom.com>, Broadcom internal kernel review list	
 <bcm-kernel-feedback-list@broadcom.com>, John Cox
 <john.cox@raspberrypi.com>,  Dom Cobley <dom@raspberrypi.com>, review list
 <kernel-list@raspberrypi.com>, Ezequiel Garcia	
 <ezequiel@vanguardiasur.com.ar>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
  John Cox <john.cox@raspberypi.com>
Date: Wed, 08 Jan 2025 14:15:20 -0500
In-Reply-To: <fnhsnjlvifnma1rqlsm9kqk7ao3bc174ic@4ax.com>
References: <20241220-media-rpi-hevc-dec-v1-0-0ebcc04ed42e@raspberrypi.com>
	 <6d6c49919af9e782bd8e9be5066e92c9704ad5b7.camel@ndufresne.ca>
	 <fnhsnjlvifnma1rqlsm9kqk7ao3bc174ic@4ax.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi John,

Le mercredi 08 janvier 2025 =C3=A0 09:52 +0000, John Cox a =C3=A9crit=C2=A0=
:
> On Mon, 06 Jan 2025 15:46:51 -0500, you wrote:
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
> Is the effect of the manual complete API different from the pin API? Pin
> incs the ref count on the media object to prevent competion,
> manaul_complete sets a flag to do the same thing. Or have I missed the
> point?

The request contains "objects", usually controls and a src buffer. The stat=
e of
the request goes to complete implicitly when the last object is removed. Th=
e
manual completion avoids adding ref-count on top of this, and simply disabl=
e the
implicit signalling of the request. With that we can signal everything in t=
he
most logical order:

1. Program the register from controls -> mark controls complete
2. Entropy decode the stream -> mark src buffer done
3. Reconstruct the image -> mark dst buffer done
4. Signal the request completion

Before that, you always had to hold on the src buffer, and only mark it don=
e
after the reconstruction was complete and the dst buffer was marked done. T=
hat
didn't matter for single function HW of course.

Unlike the pin/unpin, manual completion mode removes the implicit completio=
n
bound to the fact the last "object" is removed from the request, and leave =
it to
the driver to decide when to actually signal the request. Internally, the g=
ive a
reference to the driver of course (similar to pin).

>=20
> I don't mind what call is used as long as the effect is to be able to
> delay media object completion. (In my first veraion of the code I
> created a dummy object and attached it to the media object, when I
> wanted to unpin I deleted the dummy object - pin was just a cleaner
> API.)

The manual completion patchset is very similar really in you step back.

>=20
> The pin API is counted and needs no new structure elements (which is
> nice), but manual_complete does give a flag that allows other functions
> to know that holding on to the media object whilst releasing OUTPUT is
> intentional so can be made to work cleanly with things like
> v4l2_m2m_job_finish so is probably the better solution (assuming my
> understand of how it works is correct).=20
>=20
> I'll try to build a version of the code using manual_complete in the
> next few days.

Thanks! your feedback will be very useful.

Nicolas

>=20
> Regards
>=20
> JC
>=20
> > >=20
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


