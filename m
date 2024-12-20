Return-Path: <linux-media+bounces-23947-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3584A9F964F
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 17:22:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D377163487
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 16:22:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 611A321B8EC;
	Fri, 20 Dec 2024 16:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="ULKmalyJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AF1219A90
	for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 16:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734711697; cv=none; b=TGzFbuyXiRQRee8q7OQ0n8aq6dux6mLm1Yv4ARjbT/MTu6r7InVBYh1pVq2cN3l5iGuYyWoLRKcG0StMvQ2zCuNBG8NZ7iwJFY/D/vHAArVnAkq3oMFd8Y4kVbjsXTGV7iT+mQ7ddxm99nNL9whVAaBxr65I/QE41+SmTS1wEmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734711697; c=relaxed/simple;
	bh=Nm4fsxGYoQQSVTPfd/GmYVxTY6ghk6mOsm8WTQMjS5o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=K3lr3Xyv5eSZeVdwCDhiq6Y/qGi3cPSw/m4hUFqGMy8WOyTjDcEpZqQFlDfr3eZYdjQHV6jii60JCvQLHf5IH3mGstzyepIsZtdFVH0lnYacgpISphshFey0Zar+dz5fUvA0TAv02M9CHaWpHo+9ip9OoUGpfseVMxnKPBsYJK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=ULKmalyJ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43622354a3eso14747465e9.1
        for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 08:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1734711694; x=1735316494; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wzAYIPQHb0FbSnFpHVNI5uenoiDrwNrze87rYQaiun4=;
        b=ULKmalyJx3W2F9B5hsx9svT3AOKZKxO2otZnL+LUqEXgRFr30n5LD4Z1D2hjBNrzoD
         u4HdQMqwOhZQSpQpJ5EJ9WsXVpRbGcHNURGZD8aavSl90UAfpok15zrJc8k7GXJTh3HL
         o+Cwf620Q9uWy015LLdJju6IvmfiGlRDSIZwelK7On0zXeIUxmV61E+4TnbOV8mQZqsT
         xNaxdqIfvDeZrHnBD1anVa7hcK6GIYEpFYlsQzRrQ7kMNaG5MZ2s5GVLOu8rNPEsM7HJ
         8VLn/X/mh0rnNeAQm9s9KpBcrvG7814TG2AUMTlSdzl7pmZrAAJL3qPbIJu2tNsc6Jrj
         narA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734711694; x=1735316494;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wzAYIPQHb0FbSnFpHVNI5uenoiDrwNrze87rYQaiun4=;
        b=sj8y+muxBs/rhCbWXyQvqogjqisH5uCnMXvJ3pquVMFdxzVya7LdaV5X6mB4SuAMyI
         C7YjHttzHMeIrbdir8pBRARTMb52wGbEIDTV9lNJMwm80xtxTqtPepoJld7d5rvXo/2c
         4AODBxiSo0hCiF4kkSVkajnmXteyU/XsDusNA8Fa2vooVjyDX15BovnwnckAwBofeL44
         pOR1nVWIIw3tZwQAAr8CxL8W9DpaEnxCTRQkN8RCe9Sx5InDxxTuUChycHWSfeGqBYVi
         RiAzTnkEZUpafEgV7ZaTaPGtE+BvYgxsIRn+g7KVbxVs6lNj7RdGU3mDGuecXqGQzZvk
         tMow==
X-Forwarded-Encrypted: i=1; AJvYcCVRpv+bjWlTDObNoGcxaA7Y9BoPDLKDT6DeufVpYlgqoLESFNYCFojeFdcJg9EeAKFAOKwdeJoxfJFNmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbuBqH8k7JG9eefiLiK7PUUznp4c84SM2li1xy9g5VG4uIAyw+
	rgTSVYNl/xqzufLw/9h44DphGxiUh8goFYOSVOEc6+zA2FUOr48iUgxoaWjD0N8=
X-Gm-Gg: ASbGnctHv8zbxWir77UCKqYz8bNKeadAQPKnDZFINOTgfEtG721F8rNYsx8wVFvHkxQ
	VSbo2yYZ/fh4WLTRvGKQ1jkzSh1WDKAWsBiVhWvJJmDEiB6MlL+cqEJ2kLeE3++mq9blHi4HjOI
	8c04HszctYgxQxQM57koINfRr4ldGXU6fVDxRERs8+bQqRoMKt9glKzCABxt6U8+lIGMwGJRmiD
	Mf8YfVuZBh64tNS0jbgHTIEjO74CMnJuAeWPRSSMVtY2Law
X-Google-Smtp-Source: AGHT+IHoMhxzo3nOSCXEz3c5go2jSoHmBpi1T83KWRryGLqx6ewmpsxMhEX24RS3Od99Osv6HAf6mA==
X-Received: by 2002:a05:600c:154c:b0:434:9f81:76d5 with SMTP id 5b1f17b1804b1-43668b49a47mr28606565e9.22.1734711693962;
        Fri, 20 Dec 2024 08:21:33 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43656b013e1sm82824045e9.12.2024.12.20.08.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 08:21:33 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 0/7] Raspberry Pi HEVC decoder driver
Date: Fri, 20 Dec 2024 16:21:11 +0000
Message-Id: <20241220-media-rpi-hevc-dec-v1-0-0ebcc04ed42e@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHiZZWcC/x3MSwqAIBRG4a3EHXchtYjaSjRI/c076IFCBNHek
 4bf4JyHMpIg01g9lHBJlmMvUHVFLi77ChZfTLrRrdJK8wYvC6dTOOJy7OHY2M6iN0Mw1lMJz4Q
 g9z+d5vf9ACkFL4VkAAAA
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 John Cox <john.cox@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>, 
 review list <kernel-list@raspberrypi.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: John Cox <jc@kynesim.co.uk>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 John Cox <john.cox@raspberypi.com>
X-Mailer: b4 0.14.1

Hi All

This has been in the pipeline for a while, but I've finally cleaned
up our HEVC decoder driver to be in a shape to at least get a first
review.
John Cox has done almost all of the work under contract to Raspberry
Pi, and I'm largely just doing the process of patch curation and
sending.

There are a couple of questions raised in frameworks.
The main one is that the codec has 2 independent phases to the decode,
CABAC and reconstruction. To keep the decoder operating optimally
means that two requests need to be in process at once, whilst the
current frameworks don't want to allow as there is an implicit
assumption of only a single job being active at once, and
completition returns both buffers and releases the media request.

The OUTPUT queue buffer is finished with and can be returned at the
end of phase 1, but the media request is still required for phase 2.
The frameworks currently force the driver to be returning both
together via v4l2_m2m_buf_done_and_job_finish. v4l2_m2m_job_finish
would complete the job without returning the buffer as we need,
however if the driver has set VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF
then we have a WARN in v4l2_m2m_job_finish.
Dropping the WARN as this series is currently doing isn't going to be
the right answer, but it isn't obvious what the right answer is.
Discussion required.

We also have a need to hold on to the media request for phase 2. John
had discussed this with Ezequiel (and others) a couple of years back,
and hence suggested a patch that adds media_request_{pin,unpin} to
grab references on the media request. Discussion required on that
or a better way of handling it.

I will apologise in advance for sending this V1 just before I head off
on the Christmas break, but will respond to things as soon as possible.

Thanks
  Dave

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
Dave Stevenson (4):
      docs: uapi: media: Document Raspberry Pi NV12 column format
      media: ioctl: Add pixel formats NV12MT_COL128 and NV12MT_10_COL128
      media: dt-bindings: media: Add binding for the Raspberry Pi HEVC decoder
      arm: dts: bcm2711-rpi: Add HEVC decoder node

Ezequiel Garcia (1):
      RFC: media: Add media_request_{pin,unpin} API

John Cox (2):
      media: platform: Add Raspberry Pi HEVC decoder driver
      RFC: v4l2-mem2mem: Remove warning from v4l2_m2m_job_finish

 .../bindings/media/raspberrypi,hevc-dec.yaml       |   72 +
 .../userspace-api/media/v4l/pixfmt-yuv-planar.rst  |   42 +
 MAINTAINERS                                        |   10 +
 arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi        |    5 +
 arch/arm/boot/dts/broadcom/bcm2711.dtsi            |    9 +
 drivers/media/mc/mc-request.c                      |   35 +
 drivers/media/platform/raspberrypi/Kconfig         |    1 +
 drivers/media/platform/raspberrypi/Makefile        |    1 +
 .../media/platform/raspberrypi/hevc_dec/Kconfig    |   17 +
 .../media/platform/raspberrypi/hevc_dec/Makefile   |    5 +
 .../media/platform/raspberrypi/hevc_dec/hevc_d.c   |  443 ++++
 .../media/platform/raspberrypi/hevc_dec/hevc_d.h   |  190 ++
 .../platform/raspberrypi/hevc_dec/hevc_d_h265.c    | 2629 ++++++++++++++++++++
 .../platform/raspberrypi/hevc_dec/hevc_d_hw.c      |  376 +++
 .../platform/raspberrypi/hevc_dec/hevc_d_hw.h      |  303 +++
 .../platform/raspberrypi/hevc_dec/hevc_d_video.c   |  685 +++++
 .../platform/raspberrypi/hevc_dec/hevc_d_video.h   |   38 +
 drivers/media/v4l2-core/v4l2-ioctl.c               |    2 +
 drivers/media/v4l2-core/v4l2-mem2mem.c             |    7 -
 include/media/media-request.h                      |   12 +
 include/uapi/linux/videodev2.h                     |    5 +
 21 files changed, 4880 insertions(+), 7 deletions(-)
---
base-commit: e90c9612ac3969cb8206029a26bcd2b6f5d4a942
change-id: 20241212-media-rpi-hevc-dec-3b5be739f3bd

Best regards,
-- 
Dave Stevenson <dave.stevenson@raspberrypi.com>


