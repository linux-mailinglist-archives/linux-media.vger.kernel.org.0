Return-Path: <linux-media+bounces-39516-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7CBB21F5D
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 09:21:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2BEF02A1F08
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 07:21:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0A632DAFCE;
	Tue, 12 Aug 2025 07:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HaHquvz5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAF127462;
	Tue, 12 Aug 2025 07:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754983267; cv=none; b=BQO/fplBBFUwQzUuMRszHTR+b/QvBl6HdtneIOUE+lxpxIQ5iFCpvopMaDEINEr4zPWWhSuzMivdfZGWXHvf9d0M43PKt5cWOSxpwbLMx4prNBPuv5DpL+5Qf4MBuCWxoL72/bPseQkaJ0+ms/bP3xDN/TFckmJ1jnE5eND+iw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754983267; c=relaxed/simple;
	bh=tigkppWCWYMCvNyNEubqAvylnX60Uy4UDRVtMpltcMs=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=MOpR2wMMo+QiVKUOica7Zu3HxQ7KTmW0AlY2ot6F5B/16IBohxvHmwIjGKnSlCDuKALOdptBjrO+vzc8nR/YZCB1Ei1tg64MbwMP8y6AYYlkOmWPvdvm4Eadqc7Jfgjb0J+cqUAEpjcTvz6D/nG1PGuqrBGaAJNFaJ3bGIUyFBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HaHquvz5; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-af96524c5a9so669592366b.1;
        Tue, 12 Aug 2025 00:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754983264; x=1755588064; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KdvN3hos4ZfIVGUNdDwdDNs5CgvOMtRQ9WBj592DhBk=;
        b=HaHquvz5iuqC4hkDhnyicai3AsN9SFtkMvGz5217jSd7YLvHECCRZGbWV/zXcXFd2t
         JH+PCmbCxUMVCBXWFEs8fjHLkWUOFoV+UnBmMzUiZg2Z0VofS3V0l14PcQRmBEnxmVsL
         fwREbMp6P+vSnNzkcognLGkABFBPxdO3/47e8aGzVgWnjYuXGmjUIuGL7IFO5SfpHxRG
         +h5khV7fbMAr/saYXzTRjWHhlbJKjFfxUjfcgGZcSLnhse8T4c8a7jcloJZ3ruAd+rYw
         f478FAGf0IAMznv54HdlCrW2/TTH0K8teAF81QOa5/dFqmxM7D3XZ0Dn5iCzeValGoNR
         Ugxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754983264; x=1755588064;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KdvN3hos4ZfIVGUNdDwdDNs5CgvOMtRQ9WBj592DhBk=;
        b=GSMh+yL98KvQXW8WMJ4hDHCQfStr9KjWxvvQss1wZ6hVn8MfZej4QZU+RTZN9MR/13
         6EAUj7ba83EZopYt8puZIU7hfj9EfTsSwfpNLl/TsAJM+8BstaygjgKSSloHwRgkWYPE
         kMcdkdVnwse+nPNuSDYcIY7Fcl4GMN+IFdkHnAJ6OsBwy0lrbwiXbkAS6+ucy8EY/3Qc
         wXN0IaGWq1xiRR3fb+jEeCzy6Xl1/Nqxm+ulTw+Ec7WlpPSkl2NC2YGJZhPm1raKzMjO
         UtN64Zgfc/D6VsUPv8hIQRnjVx3J8CgeKl4Z9zAmFaQ9FkxWV4jaXLYQRbFYW3yAj0VF
         Xu6A==
X-Forwarded-Encrypted: i=1; AJvYcCVSLHcExocSYz8zNvwOBBj2HJTQHPMy7uzhR59il+tGyqj+eC+FoutK/k0IQDrQjaWzgG8v6/G4d7wYvg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWe2017FNzqHW5Otw+bR6tVnLxSGCX/kRaL+eRMUgBRAXiCr9Q
	Qs7pGAEdR6ohLFCsxfY1PZQ6WBncNVfDEhzYKxYggZKTDZShGlJndtCl
X-Gm-Gg: ASbGncu0b4tSO5JCtdP775smzar3p2Svl67protRXbyjIZk5hdTFt0LwAUimpx4iyHc
	wDrgHJ7kYV5QNKwL5OKpJz4bUtxwjtVRrJF5RXDc6qRmSv0iSPPXkv/K9XD3HXSEpxN5qT8VDho
	EJwo2mG7aPjJJINnMSFUTYLdXQDHqXPo5MYlvEOIVTZnDwrDffqa7j25+iGoyzdiuspz6RVtx8R
	3mLLmYb1jSmbGcS9mS7C3clWB7LEJi5Wi99BMJDVCHmzc7LJ8keKZSO8TSXC22a04whjURjdmiY
	8YvA4C05NAsWbxuxeB2Kmy6BEZkwbQXILrNVLfXqHnSqvP+JYorLjN+wZ56AVOYfTjIwaXScV7x
	x8IL1QMl74oVymWRHmlKc3nK+ajkFlFYpnKJrLfP6c6ceApJNuUqSg3gNdx5asnUSM10S9KKDA1
	HWQybP5ruaUg0=
X-Google-Smtp-Source: AGHT+IEEEuwo1oGl7QN9YdJIWFLJDjjJKJXuGCx345I6XSM6Vd9H1McXJijKZIxcZ5MMMWp2gsEhrQ==
X-Received: by 2002:a17:907:787:b0:af9:2e2a:64a8 with SMTP id a640c23a62f3a-af9c6403ac8mr1625756866b.25.1754983263453;
        Tue, 12 Aug 2025 00:21:03 -0700 (PDT)
Received: from smtpclient.apple (89-66-237-154.dynamic.play.pl. [89.66.237.154])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c081sm2131936566b.97.2025.08.12.00.21.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 12 Aug 2025 00:21:02 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v2 00/12] media: rkvdec: Add support for VDPU381 and
 VDPU383
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <20250808200340.156393-1-detlev.casanova@collabora.com>
Date: Tue, 12 Aug 2025 09:20:51 +0200
Cc: linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>,
 linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <3786B8EA-9796-40A9-8EEF-16CFAEE27766@gmail.com>
References: <20250808200340.156393-1-detlev.casanova@collabora.com>
To: Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: Apple Mail (2.3826.700.81)



> Wiadomo=C5=9B=C4=87 napisana przez Detlev Casanova =
<detlev.casanova@collabora.com> w dniu 8 sie 2025, o godz. 22:03:
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
> controls for HEVC [1].
> Therefore, a patched version of userpace tools is needed for HEVC
> support (added for GStreamer[2] and in an early stage for FFmpeg[3]).
>=20
> This patch set also depends on the preparation patch set sent earlier =
[4]
> as well as the iommu restore fix [5] (already merged in linux-media) =
and
> Nicolas Frattaroli's bitmap patch [6] to support setting registers =
that
> uses upper 16 bits as masks.
>=20
> [1]: =
https://lore.kernel.org/all/20250807194327.69900-1-detlev.casanova@collabo=
ra.com/
> [2]: =
https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/9355
> [3]: https://gitlab.collabora.com/detlev/ffmpeg
> [4]: =
https://lore.kernel.org/all/20250623160722.55938-1-detlev.casanova@collabo=
ra.com/
> [5]: =
https://lore.kernel.org/all/20250508-rkvdec-iommu-reset-v1-1-c46b6efa6e9b@=
collabora.com/
> [6]: =
https://lore.kernel.org/all/20250623-byeword-update-v2-1-cf1fc08a2e1f@coll=
abora.com/
>=20
> Changes since v1:
> - Add parsing of the short and long term ref frame sets from the new =
v4l2
>   controls
> - Add RPS cache to avoid parsing the same data again
> - Fix HEVC pixel formats selection
> - Fix multiple indentation errors
>=20
> Detlev Casanova (12):
>  media: rkvdec: Switch to using structs instead of writel
>  media: rkvdec: Move cabac table to its own source file
>  media: rkvdec: Use structs to represent the HW RPS
>  media: rkvdec: Move h264 functions to common file
>  media: rkvdec: Add per variant configuration
>  media: rkvdec: Add RCB and SRAM support
>  media: rkvdec: Support per-variant interrupt handler
>  media: rkvdec: Enable all clocks without naming them
>  media: rkvdec: Add H264 support for the VDPU381 variant
>  media: rkvdec: Add H264 support for the VDPU383 variant
>  media: rkvdec: Add HEVC support for the VDPU381 variant
>  media: rkvdec: Add HEVC support for the VDPU383 variant
>=20
> ..

Detlev,

I give run for this series on rk3576 and rk3588 devices (various SBC =
boards) on mainline 6.16 kernel.
Userspace was: KODI, MythTV and mpv.
All are using ffmpeg - but without [3] applied*.
Tested video rendering pipelines was: EGL DAMBuf and DRM direct to plane

Happy to report:
-all h264 content** i tested was decoded ok.
-on some rk3576 h264 rendering manifest known "green lines" issue*** =20
-hevc content**** was also decoded ok except samples requiring long =
sps/rps hinting from userspace (from ffmpeg in my case)


* - it looks (to me) your's ffmpeg branch changes are incompatible with =
yours rkvdec code (i.e. ffmpeg refers to =
V4L2_HEVC_EXT_SPS_RPS_FLAG_INTER_REF_PIC_SET_PRED but kernel v2 driver =
don't have it)

**  - i'm referring to multiple h.264 movies and TV HD channels

*** - issue of thin green lines we discussed on rockchip IRC channel

**** - as my ffmpeg7.1 has not applied newly introduced =
hevc_ext_sps_[ls]t_rps v4l2
controls for HEVC (due *) - some content is not decoded properly.

If any extra tests can be helpful - i'' be more that happy to do so!

br=20


