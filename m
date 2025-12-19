Return-Path: <linux-media+bounces-49175-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 03183CD01EE
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 14:52:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CCFF330A5E3C
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 13:51:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69B16325714;
	Fri, 19 Dec 2025 13:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XY2orDqC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D772DF140
	for <linux-media@vger.kernel.org>; Fri, 19 Dec 2025 13:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766152271; cv=none; b=Dy5SdJfBmUxYGStSVEEFRflYvrmUMtwFLwtCiYabzOkSoB9h+Rclfd0PK7deWTU1gCyR9xi3yxAULkdfkkPFyKw6xgIuNOcQdDNqjSv9/trV7o347OGnzfIV7H6hcvGKieYQeG7Wc8MRdfGavL3/O+OVQ6IIBQ2iF27POIBfup0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766152271; c=relaxed/simple;
	bh=zifKS0279SxPrQ+mfSbCon2mTPfxEvbsenFlUY4BnAQ=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=jzZ0tSXBGPFy+jkeyrePb66Ypgb1rhnmusJRvhiH+xIdfndfCm9EJCiS4pOlPlRwhqyebc3y0zFLbKvGcYDap34kl7QhKVs03MSLrOB2b2LkeS9boQW7pMisVTYjIjabcDrjrGu3q30pRq4M5GLdyM1wjLtzO1ZIOJleBnNUllo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XY2orDqC; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-64c893f3a94so288744a12.0
        for <linux-media@vger.kernel.org>; Fri, 19 Dec 2025 05:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766152266; x=1766757066; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WVY0FTbz4AdN3t8EEt7ziV7biZCYpab1ixrilZdONsw=;
        b=XY2orDqCNlkpYUoAO9/h9/7Q8WLKmUBpnsitimeHE1cDSUfclcY6s7IHYrIMUN9n2i
         WDyMqShq5hJ639C4QZYp7tIu6RMXeThs/xHdUM3VwYZ/Vr7BNv1AInUZ41ZGl+X8tzwl
         xofZ2Xim6vaEuvgCKjiByj9EVxDiKQ/lqV0EAEtUoTdonN6bgDIiuPJgb6LYNOVcl93s
         bsD3DdZtW/ioUsB+KowCCixigeUrb0AaB4CQMOhvKADmRJhn0Zp79j7wcf/JsOv3gqgY
         VZazDhn8ernXvKku2O4qbSZeuMGsx/5q/KUiXb8ea26vDruk/X5xgvgMXJCfG9b+IESq
         6+wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766152266; x=1766757066;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WVY0FTbz4AdN3t8EEt7ziV7biZCYpab1ixrilZdONsw=;
        b=HOZ289G661RK8uENye79TYN42MjBoRRlL0n66aTu18IgXXBcQ03H5SIt7+1Pe5CWvh
         IjyGNXgPltzVOusxpICss2zI6SsaOhUPK01rqDzqkiYD1deNZ5tRP9p9eHopLfpa8Lfh
         a6cRkC0wnUBbjZu9Kv7HEIa7Xgg0QhR0K3mRSYCX/gBxkcZKvq7xnEl8JxhKKHYnxNZQ
         dkKzs+1EwTeFSsIISJ+YibPaaPPF5e+7fGn1OJxjksRNEx3lju5HCUHzp6LAOe81rYrX
         SqZsmQ42wMVJof6GMRZ9Zsi95R0cM3eyHdXzyKHnlpWeJnHOGQs/ROFIQs2M5KH9VZ7F
         tmYA==
X-Forwarded-Encrypted: i=1; AJvYcCXMGud6wxcG58tF4n85s7BAPbPhu7Lkhv4IcreUNqxxCvAXx3wqM+UD2gaAv9YjBgZbY28m5vtkpXwWZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxgNbP5J49e8feCndV5ROCOiknPVcT+Ut3zKJQlPfevSHMYCGnr
	gj2smyFg8o0oA6wxX4kZM4FAqf4//sONeCh3suan5BTCQL8kW/OD7QhPtTN41A==
X-Gm-Gg: AY/fxX5xiG1PScQ5b97avKvjvnZi7qvbEwOEYmIdRlonMkJfnVUU98nfNO1MA6wsNzH
	fWGyvGN4Z+yqEZXNbxQ3ZhM1XU+LCtJxWHvhjRGtAtfOIGbUtVTUx4dhjCyvTjgthiEugmZ59Zf
	o9bfStmGXIofz3Mhg2xKoBORIeP9tmb4MznU8s64MxExaCMEeYBJTkyh0k8Z6Ok6c+0cWYTa91/
	HimhJrbEHVeqhwSMskHhP3y4Cql2M//z6fmYJftidOT05FEqOsVVCDml8P2TG6sB8ga6nz9lVbC
	a8pl/w3vEW5AKC5PxM5eHQwhC1KtPul4B6A9SxrczuhuawNzZWa7BL1vT/G3UF3sgdayH1IuOg8
	RnggrJVnE9j5VUvPtjFCFbvO+ZubbYQgB8vhMBzc0N98YWKYES1Qrhl68+9BsAyP9HsTt9HL1bN
	vk2iJZSujB+qvMfZT6f7akKNVnZL21I5Dd3PsXbMD2ifRNLFIFHElcesycTeywgXjs
X-Google-Smtp-Source: AGHT+IHqGj9nyeirOfNEOBoQJdeIZKX2jxqMX1La5bEetWOpLjaUzix23G3qWZHuR52h5YIkt2/e2A==
X-Received: by 2002:a17:907:96a2:b0:b76:afa4:933f with SMTP id a640c23a62f3a-b80205de9dcmr597496066b.22.1766152266241;
        Fri, 19 Dec 2025 05:51:06 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.play.pl. [89.66.237.154])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ae2dbesm244601566b.29.2025.12.19.05.51.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Dec 2025 05:51:05 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v7 00/17] media: rkvdec: Add support for VDPU381 and
 VDPU383
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <20251218232829.337811-1-detlev.casanova@collabora.com>
Date: Fri, 19 Dec 2025 14:50:51 +0100
Cc: linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Heiko Stuebner <heiko@sntech.de>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Ricardo Ribalda <ribalda@chromium.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Yunke Cao <yunkec@google.com>,
 Hans de Goede <hansg@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Pavan Bobba <opensource206@gmail.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 James Cowgill <james.cowgill@blaize.com>,
 linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com,
 Jonas Karlman <jonas@kwiboo.se>
Content-Transfer-Encoding: quoted-printable
Message-Id: <219DE002-BE77-4D28-9BC6-9124F099F211@gmail.com>
References: <20251218232829.337811-1-detlev.casanova@collabora.com>
To: Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: Apple Mail (2.3826.700.81)



> Wiadomo=C5=9B=C4=87 napisana przez Detlev Casanova =
<detlev.casanova@collabora.com> w dniu 19 gru 2025, o godz. 00:28:
>=20
> These variants are found respectively in the RK3588 and RK3576 SoCs.
> This patch only adds support for H264 and H265 in both variants.
>=20
> As there is a considerable part of the code that can be shared with =
the
> already supported rkvdec decoder driver, the support for these =
variants
> is added here rather than writing a new driver.
>=20
> This patch set uses the newly introduced hevc_ext_sps_[ls]t_rps v4l2
> controls for HEVC.
> Therefore, a patched version of userpace tools is needed for HEVC
> support (added for GStreamer[1] and in an early stage for FFmpeg[2]).
>=20
> The DTS changes can be found in another patch set: [3]
>=20
> [1]: =
https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/9355
> [2]: https://gitlab.collabora.com/detlev/ffmpeg
> [3]: =
https://lore.kernel.org/all/20251020212009.8852-1-detlev.casanova@collabor=
a.com/
>=20

Detlev,

FYI:

In my testbed with=20

i. v7 of [1] on mainline 6.18.2
ii ffmpeg8 v4l2_request [2]
iii. mythv as player [3]
iv. minimyth2 as distro [4]
v. NO applied yours ffmpeg sps/rps hinting [5] (as i'm on ffmpeg8)

I run set of my mpeg2/h264/hevc/vp8/vp9 samples on: rk3328. rk3399, =
rk3566, rk3576, rk3588 and h616 (just for brief test for potential =
cross-regressions)

Results:

a. rk3328: no any regressions; all samples are decoded ok

b. rk3399: no any regressions; all samples are decoded ok

c. rk3566: no any regressions (e.g. in vp9. v6 and older were =
regressing; v7 is ok) =20
c.1 h264: all ok
c.2 hevc: samples without long-term sps/rps: all ok.
c.3 hevc: samples with long-tern sps/rps: v7 is a bit regressing here: =
it gives me sometimes kernel oops requiring hw. reset to bring decoder =
back to live.=20
Exemplary oops: https://termbin.com/upju
Older vers of your code were handling such cases without needs of hw. =
reset

d. rk3576:
d.1: h264: works ok - but randomly i'm getting playback with distortions =
like this: https://postimg.cc/Yh8Djc3L. it is avd. 1 per few playbacks.
d.2: hevc: the same like c.1 and c.2

e. rk3588
e.1: h264: all ok
e.2: hevc: the same like c.1 and c.2
  =20
g. h616 with cedrus: all ok.

btw:=20
Adding to [1] vp9 android code [6] offers me nice working vp9 hwdec =
accell on rk3566/3588. =20

Great work!

[1] =
https://gitlab.collabora.com/detlev/linux/-/commits/add-vdpu381-and-383-to=
-rkvdec-v7
[2] https://code.ffmpeg.org/Kwiboo/FFmpeg/src/branch/v4l2-request-n8.0.1
[3] https://github.com/MythTV/mythtv
[4] https://github.com/warpme/minimyth2
[5] https://gitlab.collabora.com/detlev/ffmpeg
[6] =
https://github.com/dvab-sarma/android_kernel_rk_opi/commit/fd0b1b17cbdfcf0=
c15bc9f411cc7127105157e57
  =20
=20


