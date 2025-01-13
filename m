Return-Path: <linux-media+bounces-24702-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F234A0C19D
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2025 20:36:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2958A3A56DD
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2025 19:36:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 510121D14E2;
	Mon, 13 Jan 2025 19:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kynesim.co.uk header.i=@kynesim.co.uk header.b="C7B0QF8J"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4DD01D14EC
	for <linux-media@vger.kernel.org>; Mon, 13 Jan 2025 19:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736796940; cv=none; b=oQVWyZYdj9lbRysjqFQc4LGTjI3admLiOF92FMcIbCw6b1ctRPrbAv92FVVSjGELjsyZ2MwuQx3F0Qr1XnJLdS0hho9hQKLpkOHmhp8/jZI0qkk5gDQ0EIxAzxgXOw1O9SZq5K6W3JkzhWv2agZResteOd3xSrtjE+awj5bhAnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736796940; c=relaxed/simple;
	bh=iQ8LtMGNPOqAhE0Y6aCZ3yiXLr7rM/jgLLDil41mjbY=;
	h=From:To:Cc:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=MJoMi4YO7bzGw5RQdcpW4ljrzOQebE1xhsCbyRk1Lepqz9PsjjGLE0vU3q41QtsnlNrnI9EK85cxrFLWQiD/+MJDC7bayHZz0Lw28rKiR7WX+H2rZAuoWwjFsi9aCyGPJrlR1n/mKvYFax8FncfprZUKM6W3Af4lxFx/LHa3EvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kynesim.co.uk; spf=pass smtp.mailfrom=kynesim.co.uk; dkim=pass (2048-bit key) header.d=kynesim.co.uk header.i=@kynesim.co.uk header.b=C7B0QF8J; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kynesim.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kynesim.co.uk
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4363dc916ceso35183105e9.0
        for <linux-media@vger.kernel.org>; Mon, 13 Jan 2025 11:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynesim.co.uk; s=google; t=1736796937; x=1737401737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:user-agent:in-reply-to
         :references:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=g73M30jpLKC2spHelctkvBP7JK41VdtR1ZbnkCj0uwA=;
        b=C7B0QF8J51SqLuY+djPmFJSXsnqC5znJ9DaJapwpUwS3HRo1aKeosBeF2ZA8UWUHPL
         V1wAVJklIJTGRwc6EM6jTF1JqC0OwNiE011kUfePSH1sJj+37h+UVbB4P8dWkOZPcITf
         bm1bMZx3OzhAt1RTkMg9w+y/cjEw/Hlo0lIqSdXKuvmI4E/hROdLalFB+JtRXkT6KiIp
         QRaLiELN9xd+ydYEyNpNhk2+D0ck4L1+UfRr4M0PXljpoxrV8E/qGwtGeW7nP7EVSb5f
         DTH4E2y69TnyeleLhvRnVjKFjc9oYCFLCg5lxdQ2ZfiSxD3iVHynWtrqYBNwZBbLQYWn
         L1yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736796937; x=1737401737;
        h=content-transfer-encoding:mime-version:user-agent:in-reply-to
         :references:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g73M30jpLKC2spHelctkvBP7JK41VdtR1ZbnkCj0uwA=;
        b=i1dpkGiD7/OIKOrZjFDxKAcEdjQH8IZk/pNWcM8JPKGVKnhTOXB5XFd/cd/RKPPHQk
         FMpF4jodyfgHJYn5Mg0d9+bx6EQqxyZRXTQHibA9QrHxLKnH2xqzr2x807d89G1RlHHS
         flNc021jSDRIXVbTF/aAmr2MEAxIc8d2ohx9tXocc0PGn6Rm6g7tX7/+mXRnrATKAxLn
         FHHE4s0JIr0Zs9nBp3lQ22Z5oMLa8aSRNqYFMo3ZmcXyH2ZLpTfzZ0KuthPodV+tLwYS
         qJmu5RtrZISrP/zz+26X5ch4ugO9vCMjNCCt+C3iZawcZcRqTw19jLugXj2YQAnSYy76
         z9sA==
X-Forwarded-Encrypted: i=1; AJvYcCV6eMzKwPZ84OxQCkotE+HKlqfJS0Nzm5sz2lLT59y8eIDY2qUy2RgdReS4xkalvQESNDO3sNvjvcN71Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxAOzxJnAN8mk/7P2GPlMGLx2I5v2jzgpD6bMuWNSBQ/Knjpdh8
	J4IdYUD+RIkn05yLejCBER+rrOS20CYVYKIHysZg5l8bFSk2LPgrZXXm72vkRdg=
X-Gm-Gg: ASbGncuYO1zCs5uKQuq/D0h/L0baYhGAJ035at9/fEfMX5Hh25AfNRwlUySeBuvkT/F
	MxN9Mv+Xa3YGuzKN/jA36Z9+TD/KmcMYtr9a0oPGbqmhI3xMwGI3ThS5ngl5RlM03EBv9AXLONm
	wipauSlkWh9bURNC/3CkXGfaA36F8yPKnmJ6XSHDKzRUdVsj6GXH+NXaRcjGwg60OAqY7o0AO6P
	/o9W9qbbk6VJMxIpVs/m3Wmij5fAUj0hneQT2r0U+h3RfCZcpGh2PjlQneld5XSlVoRunmPLA68
	OuQc5/7982R36G6svrJvL5+6GSYnJpcORCoU70brT251BoUxcueXERCsLPqO
X-Google-Smtp-Source: AGHT+IEynMibpOtbc6pL+X0SBKiJGl/oq1LZ0ZIuJJVioRAO08oYHnI7mkjZCYeC3w7aH7sC0C4z3A==
X-Received: by 2002:a05:600c:2282:b0:434:e65e:457b with SMTP id 5b1f17b1804b1-436e880fc75mr167651995e9.3.1736796937218;
        Mon, 13 Jan 2025 11:35:37 -0800 (PST)
Received: from CTHALPA.outer.uphall.net (cpc91456-cmbg20-2-0-cust124.5-4.cable.virginm.net. [86.21.160.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e37d0b1sm13043291f8f.12.2025.01.13.11.35.36
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Mon, 13 Jan 2025 11:35:36 -0800 (PST)
From: John Cox <jc@kynesim.co.uk>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, Sakari Ailus	 <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Broadcom internal kernel review list	 <bcm-kernel-feedback-list@broadcom.com>, John Cox <john.cox@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>, review list <kernel-list@raspberrypi.com>, Ezequiel Garcia	 <ezequiel@vanguardiasur.com.ar>, linux-media@vger.kernel.org
Subject: Re: [PATCH 0/7] Raspberry Pi HEVC decoder driver
Date: Mon, 13 Jan 2025 19:35:36 +0000
Message-ID: <2aqaojh380fqpuillo1es2k7bq1pi7aln0@4ax.com>
References: <20241220-media-rpi-hevc-dec-v1-0-0ebcc04ed42e@raspberrypi.com> <6d6c49919af9e782bd8e9be5066e92c9704ad5b7.camel@ndufresne.ca>
In-Reply-To: <6d6c49919af9e782bd8e9be5066e92c9704ad5b7.camel@ndufresne.ca>
User-Agent: ForteAgent/8.00.32.1272
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Nicolas

[some recipients snipped - pretty much at random - due to my previous
reply all here being rejected due to too many recips]

>Hi Dave,
>
>Le vendredi 20 d=C3=A9cembre 2024 =C3=A0 16:21 +0000, Dave Stevenson a =
=C3=A9crit=C2=A0:
>> Hi All
>>=20
>> This has been in the pipeline for a while, but I've finally cleaned
>> up our HEVC decoder driver to be in a shape to at least get a first
>> review.
>> John Cox has done almost all of the work under contract to Raspberry
>> Pi, and I'm largely just doing the process of patch curation and
>> sending.
>>=20
>> There are a couple of questions raised in frameworks.
>> The main one is that the codec has 2 independent phases to the decode,
>> CABAC and reconstruction. To keep the decoder operating optimally
>> means that two requests need to be in process at once, whilst the
>> current frameworks don't want to allow as there is an implicit
>> assumption of only a single job being active at once, and
>> completition returns both buffers and releases the media request.
>>=20
>> The OUTPUT queue buffer is finished with and can be returned at the
>> end of phase 1, but the media request is still required for phase 2.
>> The frameworks currently force the driver to be returning both
>> together via v4l2_m2m_buf_done_and_job_finish. v4l2_m2m_job_finish
>> would complete the job without returning the buffer as we need,
>> however if the driver has set =
VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF
>> then we have a WARN in v4l2_m2m_job_finish.
>> Dropping the WARN as this series is currently doing isn't going to be
>> the right answer, but it isn't obvious what the right answer is.
>> Discussion required.
>
>I think part of the manual request completion RFC will be to evaluate =
the impact
>on VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF feature. MTK does not =
support
>interleaved interlaced decoding (only alternate), so they didn't have to
>implement that feature.
>
>Overall, It would be nice to get your feedback on the new manual request
>proposal, which is I believe better then the pin/unpin API you have in =
this
>serie.

I took the manual_completion patches, patched them into our current tree
and did the relatively trivial conversion from pin to manual_completion
(not quite a simple global replace but quite close) and it all seems to
work just like it did before. So I'm fine with using that API rather
than pin.

Regards

John Cox


>> We also have a need to hold on to the media request for phase 2. John
>> had discussed this with Ezequiel (and others) a couple of years back,
>> and hence suggested a patch that adds media_request_{pin,unpin} to
>> grab references on the media request. Discussion required on that
>> or a better way of handling it.
>>=20
>> I will apologise in advance for sending this V1 just before I head off
>> on the Christmas break, but will respond to things as soon as =
possible.
>
>One thing missing in this summary is how this driver is being validated
>(specially that for this one requires a downstream fork of FFMPEG). To =
this
>report we ask for:
>
>- v4l2-compliance results
>- Fluster conformance tests results [1] and I believe you need [2]
>
>[1]=C2=A0https://github.com/fluendo/fluster
>[2]=C2=A0https://github.com/fluendo/fluster/pull/179
>
>GStreamer support is there in main now, but without the needed software =
video
>converter for you column tiling, we can't use it for that (i.e. only =
works
>through GL or Wayland).
>
>regards,
>Nicolas
>
>>=20
>> Thanks
>>   Dave
>>=20
>> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
>> ---
>> Dave Stevenson (4):
>>       docs: uapi: media: Document Raspberry Pi NV12 column format
>>       media: ioctl: Add pixel formats NV12MT_COL128 and =
NV12MT_10_COL128
>>       media: dt-bindings: media: Add binding for the Raspberry Pi HEVC=
 decoder
>>       arm: dts: bcm2711-rpi: Add HEVC decoder node
>>=20
>> Ezequiel Garcia (1):
>>       RFC: media: Add media_request_{pin,unpin} API
>>=20
>> John Cox (2):
>>       media: platform: Add Raspberry Pi HEVC decoder driver
>>       RFC: v4l2-mem2mem: Remove warning from v4l2_m2m_job_finish
>>=20
>>  .../bindings/media/raspberrypi,hevc-dec.yaml       |   72 +
>>  .../userspace-api/media/v4l/pixfmt-yuv-planar.rst  |   42 +
>>  MAINTAINERS                                        |   10 +
>>  arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi        |    5 +
>>  arch/arm/boot/dts/broadcom/bcm2711.dtsi            |    9 +
>>  drivers/media/mc/mc-request.c                      |   35 +
>>  drivers/media/platform/raspberrypi/Kconfig         |    1 +
>>  drivers/media/platform/raspberrypi/Makefile        |    1 +
>>  .../media/platform/raspberrypi/hevc_dec/Kconfig    |   17 +
>>  .../media/platform/raspberrypi/hevc_dec/Makefile   |    5 +
>>  .../media/platform/raspberrypi/hevc_dec/hevc_d.c   |  443 ++++
>>  .../media/platform/raspberrypi/hevc_dec/hevc_d.h   |  190 ++
>>  .../platform/raspberrypi/hevc_dec/hevc_d_h265.c    | 2629 =
++++++++++++++++++++
>>  .../platform/raspberrypi/hevc_dec/hevc_d_hw.c      |  376 +++
>>  .../platform/raspberrypi/hevc_dec/hevc_d_hw.h      |  303 +++
>>  .../platform/raspberrypi/hevc_dec/hevc_d_video.c   |  685 +++++
>>  .../platform/raspberrypi/hevc_dec/hevc_d_video.h   |   38 +
>>  drivers/media/v4l2-core/v4l2-ioctl.c               |    2 +
>>  drivers/media/v4l2-core/v4l2-mem2mem.c             |    7 -
>>  include/media/media-request.h                      |   12 +
>>  include/uapi/linux/videodev2.h                     |    5 +
>>  21 files changed, 4880 insertions(+), 7 deletions(-)
>> ---
>> base-commit: e90c9612ac3969cb8206029a26bcd2b6f5d4a942
>> change-id: 20241212-media-rpi-hevc-dec-3b5be739f3bd
>>=20
>> Best regards,

