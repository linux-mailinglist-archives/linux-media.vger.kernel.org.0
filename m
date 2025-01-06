Return-Path: <linux-media+bounces-24304-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CB8A03190
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 21:47:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27F573A10F3
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2025 20:47:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6A201D7E52;
	Mon,  6 Jan 2025 20:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="YjwYmbMa"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317651DFDBC
	for <linux-media@vger.kernel.org>; Mon,  6 Jan 2025 20:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736196423; cv=none; b=IX4jqiqv5mRR70T8DGqrI+E6clv5f2ewlIboCJvC+yTg/NhYQ8xD9Wlqp+usN+HbNBp5ik1lEV3V+eXUx+QU90oMzDRemOjDWRiE2nRV3pOp2+vCfhWkykeHKnP0wDtCW4valMOT8FnnBpD2EHvOmETL8YvVxnHEZiaefdWbLAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736196423; c=relaxed/simple;
	bh=O+sTBcNOxkecC+Jd+n30un0IvoQBEsVGjMonA4JXCOk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OuT3HWgvZJax6hwaJKR08ZlWBFTxRLfxFh6/hT2gvyLjRNl2Nz7yQhMrdh2mvvcR1GBz1HxBvvUO93appbjbodZ35PtXPpdlr9ZjCRx/ItveQchkyHXKA9WfdJ0iP+33Bu1REkj++IXlE222iKZjf8BGykQAwH4iZW14hVm5XJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=YjwYmbMa; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7b6f7d7e128so1337887285a.1
        for <linux-media@vger.kernel.org>; Mon, 06 Jan 2025 12:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1736196413; x=1736801213; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EloCmD5vSvykTTCm70QPpfJi//8F/dnIThWOyUh1lm4=;
        b=YjwYmbMa4YYXsaWBqv4RpxSZzFtERaEvZcwbPbyHqk2tOtH5K6cV8wif51kn2wmZO6
         J6OTz4Z9THbLRPRxJMKTVk6gpcTWCvo+QItDkJn0WEOB8jK53QlaR0HcEuf0UyporPfE
         OfpoNKSAxKXxYYZMpcC7oSH25rXEAnEMzNXJfxh2zXf/cFv0zxDONSOLer0H3MwIAZGi
         /kPPjK51PhVjIb+7BSrMHwnoroyKtk9Go8RWO9VZcLfxyaKRj/ZOKDqYqychf4WlYhTK
         /zRL3dCl1CWb9dQDsvvYmwuHF3FJ0SpRGT64pki33+FSIj/fxWcO125CGn5LNMAArKUp
         wJ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736196413; x=1736801213;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EloCmD5vSvykTTCm70QPpfJi//8F/dnIThWOyUh1lm4=;
        b=X6fRBVq1/HXbDPMY6S55aehUkaLwc1AN2qaXvtsC7xqUzInSXuiBBeG/6oAcFXVExP
         xes4GO95HIxSVyQ5WmBypXPlQeQ4HEH7WzlUv7hks73IP8cb9k0XYhujfD40kxHU4YtI
         dLEWSiuVuM4qaAWoF1wKUUkaec7QmVNOnI2Qo64ujjXexdrSF9X7g9iREJpDPml7x8Cv
         HxOXBCj/v+MnOARaH9lS/8bK0qQQt+plTICZHlVIgCpFT5Fg5RcDVsNKHJtfQ+eYRl+C
         YUzTQ8PJGjd3yvZJ3qaCP9YOBB3kCrqIM0pKQtjnAwSzPLxuksoMHoVyMngPCA+L+qp0
         2quA==
X-Forwarded-Encrypted: i=1; AJvYcCU9tF4qYu5QhC3JJBtNwnBamZacGZ2Japhe2PX3+PEulWAfEHht49MG0HpDODzwZIKcG5G0kZe0K0+sDg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMZIL5Dqa+02T9EkiavYRIrSnpzmwGOmiKtyaoUgQvP5Jh4UlW
	mK8UfWU5r30UKOAAXGkn7Tl4nUoK6Ryij/yivnOzz24/Zf3SXoFAKjF/se29paQ=
X-Gm-Gg: ASbGncutnTIUwftEvKcYJ1IvnqppY41Q2jWjc+1j5cDX/g3P1QT3z93miszQM9egIL5
	nDwEIcm5MM2CImM6jBkVHwS+pIu1lgaPPTgJesak3Iq2Q4S7SynzvVAQjleBhOpdMcbwqri7re3
	5hMn/MjTd4cyNegfubbXvlbOh3vxYswYm92LY9pXQ7yLTPyDqVFyU2GBxFIu95+j37DrtIQGTrU
	0tiUedHrdS5bw+AGjjs+w4VbjBNeIOgdH68osTxV0ZUmQRzPrVBDbYDyw==
X-Google-Smtp-Source: AGHT+IEMUpx5WSDntOkVlHd6swggwLWbFswANwJgtDgghf091d82A662g87XBemFKef9WXo9+bywug==
X-Received: by 2002:a05:620a:2886:b0:7b6:fdb9:197e with SMTP id af79cd13be357-7bb902488camr127330485a.8.1736196413275;
        Mon, 06 Jan 2025 12:46:53 -0800 (PST)
Received: from nicolas-tpx395.localdomain ([2606:6d00:15:862e::7a9])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b9ac2d1054sm1539427285a.32.2025.01.06.12.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 12:46:52 -0800 (PST)
Message-ID: <6d6c49919af9e782bd8e9be5066e92c9704ad5b7.camel@ndufresne.ca>
Subject: Re: [PATCH 0/7] Raspberry Pi HEVC decoder driver
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, Sakari Ailus	
 <sakari.ailus@linux.intel.com>, Laurent Pinchart	
 <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Florian Fainelli
 <florian.fainelli@broadcom.com>, Broadcom internal kernel review list	
 <bcm-kernel-feedback-list@broadcom.com>, John Cox
 <john.cox@raspberrypi.com>,  Dom Cobley <dom@raspberrypi.com>, review list
 <kernel-list@raspberrypi.com>, Ezequiel Garcia	
 <ezequiel@vanguardiasur.com.ar>
Cc: John Cox <jc@kynesim.co.uk>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
  John Cox <john.cox@raspberypi.com>
Date: Mon, 06 Jan 2025 15:46:51 -0500
In-Reply-To: <20241220-media-rpi-hevc-dec-v1-0-0ebcc04ed42e@raspberrypi.com>
References: <20241220-media-rpi-hevc-dec-v1-0-0ebcc04ed42e@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Dave,

Le vendredi 20 d=C3=A9cembre 2024 =C3=A0 16:21 +0000, Dave Stevenson a =C3=
=A9crit=C2=A0:
> Hi All
>=20
> This has been in the pipeline for a while, but I've finally cleaned
> up our HEVC decoder driver to be in a shape to at least get a first
> review.
> John Cox has done almost all of the work under contract to Raspberry
> Pi, and I'm largely just doing the process of patch curation and
> sending.
>=20
> There are a couple of questions raised in frameworks.
> The main one is that the codec has 2 independent phases to the decode,
> CABAC and reconstruction. To keep the decoder operating optimally
> means that two requests need to be in process at once, whilst the
> current frameworks don't want to allow as there is an implicit
> assumption of only a single job being active at once, and
> completition returns both buffers and releases the media request.
>=20
> The OUTPUT queue buffer is finished with and can be returned at the
> end of phase 1, but the media request is still required for phase 2.
> The frameworks currently force the driver to be returning both
> together via v4l2_m2m_buf_done_and_job_finish. v4l2_m2m_job_finish
> would complete the job without returning the buffer as we need,
> however if the driver has set VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF
> then we have a WARN in v4l2_m2m_job_finish.
> Dropping the WARN as this series is currently doing isn't going to be
> the right answer, but it isn't obvious what the right answer is.
> Discussion required.

I think part of the manual request completion RFC will be to evaluate the i=
mpact
on VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF feature. MTK does not support
interleaved interlaced decoding (only alternate), so they didn't have to
implement that feature.

Overall, It would be nice to get your feedback on the new manual request
proposal, which is I believe better then the pin/unpin API you have in this
serie.

>=20
> We also have a need to hold on to the media request for phase 2. John
> had discussed this with Ezequiel (and others) a couple of years back,
> and hence suggested a patch that adds media_request_{pin,unpin} to
> grab references on the media request. Discussion required on that
> or a better way of handling it.
>=20
> I will apologise in advance for sending this V1 just before I head off
> on the Christmas break, but will respond to things as soon as possible.

One thing missing in this summary is how this driver is being validated
(specially that for this one requires a downstream fork of FFMPEG). To this
report we ask for:

- v4l2-compliance results
- Fluster conformance tests results [1] and I believe you need [2]

[1]=C2=A0https://github.com/fluendo/fluster
[2]=C2=A0https://github.com/fluendo/fluster/pull/179

GStreamer support is there in main now, but without the needed software vid=
eo
converter for you column tiling, we can't use it for that (i.e. only works
through GL or Wayland).

regards,
Nicolas

>=20
> Thanks
>   Dave
>=20
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
> Dave Stevenson (4):
>       docs: uapi: media: Document Raspberry Pi NV12 column format
>       media: ioctl: Add pixel formats NV12MT_COL128 and NV12MT_10_COL128
>       media: dt-bindings: media: Add binding for the Raspberry Pi HEVC de=
coder
>       arm: dts: bcm2711-rpi: Add HEVC decoder node
>=20
> Ezequiel Garcia (1):
>       RFC: media: Add media_request_{pin,unpin} API
>=20
> John Cox (2):
>       media: platform: Add Raspberry Pi HEVC decoder driver
>       RFC: v4l2-mem2mem: Remove warning from v4l2_m2m_job_finish
>=20
>  .../bindings/media/raspberrypi,hevc-dec.yaml       |   72 +
>  .../userspace-api/media/v4l/pixfmt-yuv-planar.rst  |   42 +
>  MAINTAINERS                                        |   10 +
>  arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi        |    5 +
>  arch/arm/boot/dts/broadcom/bcm2711.dtsi            |    9 +
>  drivers/media/mc/mc-request.c                      |   35 +
>  drivers/media/platform/raspberrypi/Kconfig         |    1 +
>  drivers/media/platform/raspberrypi/Makefile        |    1 +
>  .../media/platform/raspberrypi/hevc_dec/Kconfig    |   17 +
>  .../media/platform/raspberrypi/hevc_dec/Makefile   |    5 +
>  .../media/platform/raspberrypi/hevc_dec/hevc_d.c   |  443 ++++
>  .../media/platform/raspberrypi/hevc_dec/hevc_d.h   |  190 ++
>  .../platform/raspberrypi/hevc_dec/hevc_d_h265.c    | 2629 ++++++++++++++=
++++++
>  .../platform/raspberrypi/hevc_dec/hevc_d_hw.c      |  376 +++
>  .../platform/raspberrypi/hevc_dec/hevc_d_hw.h      |  303 +++
>  .../platform/raspberrypi/hevc_dec/hevc_d_video.c   |  685 +++++
>  .../platform/raspberrypi/hevc_dec/hevc_d_video.h   |   38 +
>  drivers/media/v4l2-core/v4l2-ioctl.c               |    2 +
>  drivers/media/v4l2-core/v4l2-mem2mem.c             |    7 -
>  include/media/media-request.h                      |   12 +
>  include/uapi/linux/videodev2.h                     |    5 +
>  21 files changed, 4880 insertions(+), 7 deletions(-)
> ---
> base-commit: e90c9612ac3969cb8206029a26bcd2b6f5d4a942
> change-id: 20241212-media-rpi-hevc-dec-3b5be739f3bd
>=20
> Best regards,


