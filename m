Return-Path: <linux-media+bounces-39421-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7F6B204AB
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 11:59:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F1DB166EDA
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 09:56:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65CA32253A7;
	Mon, 11 Aug 2025 09:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="S+j3TNnD"
X-Original-To: linux-media@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2B91A3BD7;
	Mon, 11 Aug 2025 09:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754906166; cv=none; b=hjNmm6Xb+gm9Ei4HN0D/Virj95aC3xzkLCUSM0+4gyrkVAfdc072PtuOuwn2KjFIzNHp0eNbE2oFV+dBoRyD6yLKd5FSMweHU10PnkiKCM5WTwFLiPVcD22YDACDmFN/LXHSw7S5NHMWogFkUDo5SyYH3ujGhzl0tZ7sIxmQLyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754906166; c=relaxed/simple;
	bh=+LousacpS0/Yiei9dU/4VJWNpaknexmjAHj8WIwRx/0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ndnw//0DniL3X/ZYJwYivx5TS/6jfdnyp6NR7UVfLlGSEqm/4rri7vSQvwI1IXnfqRMqVdAET4DwcMrgyCMPGOSKylkmaGZEG/0e2QovoYimPDj3vPDaSNQ4JxsNayoDFVP4R0kUrKc58tE5PhFi24Q6ahkr9aS/u6pggjHVl3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=S+j3TNnD; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Xdzi6B8uhEDOjcvSLgClkb9Tis7D4GnuKNk7eRpcdEE=; b=S+j3TNnDepfKpc5RHT5HClyO0C
	cCSH2YmsWGanIkopeLLLkp0ShOHzxQx8IfLHUcz/EOgnHVAaC96bSTouLa2SsLbtl8N3wzBXFZUkU
	Wd/QHZKQkbgt8yx5xFEJ73aGqbrfo/PoOUjfsXABqV66uq8DjtjO6T3jUGNxQS0s2vW8wF4EuWS9T
	8yoVS9Xc48BN8Q0U745K8yzX4fIA397RvihK2z8VxHCTEG/GWqXpVwZ//jl4m91etWMPNqmirxjxk
	8U1gAGMRG5NF5wxNiJMUbXtz7ndq3QQ/vnz/Zo4ZUV8hj7OR5JUAUyZ/Xu31neZtS2Q+palkdFA4h
	9wSiwbWw==;
Received: from i53875a0c.versanet.de ([83.135.90.12] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ulPG5-0008OT-Hr; Mon, 11 Aug 2025 11:56:01 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: linux-kernel@vger.kernel.org,
 Detlev Casanova <detlev.casanova@collabora.com>
Cc: Detlev Casanova <detlev.casanova@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com
Subject:
 Re: [PATCH v2 00/12] media: rkvdec: Add support for VDPU381 and VDPU383
Date: Mon, 11 Aug 2025 11:56:00 +0200
Message-ID: <11040209.aFP6jjVeTY@diego>
In-Reply-To: <20250808200340.156393-1-detlev.casanova@collabora.com>
References: <20250808200340.156393-1-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Detlev,

Am Freitag, 8. August 2025, 22:03:22 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Detlev Casanova:
> These variants are found respectively in the RK3588 and RK3576 SoCs.
> This patch only adds support for H264 and H265 in both variants.
>=20
> As there is a considerable part of the code that can be shared with the
> already supported rkvdec decoder driver, the support for these variants
> is added here rather than writing a new driver.
>=20
> This patch set uses the newly introduced hevc_ext_sps_[ls]t_rps v4l2
> controls for HEVC [1].
> Therefore, a patched version of userpace tools is needed for HEVC
> support (added for GStreamer[2] and in an early stage for FFmpeg[3]).
>=20
> This patch set also depends on the preparation patch set sent earlier [4]
> as well as the iommu restore fix [5] (already merged in linux-media) and
> Nicolas Frattaroli's bitmap patch [6] to support setting registers that
> uses upper 16 bits as masks.
>=20
> [1]: https://lore.kernel.org/all/20250807194327.69900-1-detlev.casanova@c=
ollabora.com/
> [2]: https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/=
9355
> [3]: https://gitlab.collabora.com/detlev/ffmpeg
> [4]: https://lore.kernel.org/all/20250623160722.55938-1-detlev.casanova@c=
ollabora.com/
> [5]: https://lore.kernel.org/all/20250508-rkvdec-iommu-reset-v1-1-c46b6ef=
a6e9b@collabora.com/
> [6]: https://lore.kernel.org/all/20250623-byeword-update-v2-1-cf1fc08a2e1=
f@collabora.com/
>=20
> Changes since v1:
>  - Add parsing of the short and long term ref frame sets from the new v4l2
>    controls
>  - Add RPS cache to avoid parsing the same data again
>  - Fix HEVC pixel formats selection
>  - Fix multiple indentation errors

when applying the series, git was a bit unhappy about some whitespaces:


> Detlev Casanova (12):
>   media: rkvdec: Switch to using structs instead of writel
>   media: rkvdec: Move cabac table to its own source file

Applying: media: rkvdec: Move cabac table to its own source file
=2Egit/rebase-apply/patch:535: new blank line at EOF.
+
Warnung: 1 Zeile f=C3=BCgt Whitespace-Fehler hinzu.


>   media: rkvdec: Use structs to represent the HW RPS
>   media: rkvdec: Move h264 functions to common file

Applying: media: rkvdec: Move h264 functions to common file
=2Egit/rebase-apply/patch:278: new blank line at EOF.
+
Warnung: 1 Zeile f=C3=BCgt Whitespace-Fehler hinzu.


>   media: rkvdec: Add per variant configuration
>   media: rkvdec: Add RCB and SRAM support

Applying: media: rkvdec: Add RCB and SRAM support
=2Egit/rebase-apply/patch:200: new blank line at EOF.
+
Warnung: 1 Zeile f=C3=BCgt Whitespace-Fehler hinzu.


>   media: rkvdec: Support per-variant interrupt handler
>   media: rkvdec: Enable all clocks without naming them
>   media: rkvdec: Add H264 support for the VDPU381 variant
>   media: rkvdec: Add H264 support for the VDPU383 variant
>   media: rkvdec: Add HEVC support for the VDPU381 variant

Applying: media: rkvdec: Add HEVC support for the VDPU381 variant
=2Egit/rebase-apply/patch:3483: new blank line at EOF.
+
=2Egit/rebase-apply/patch:4035: new blank line at EOF.
+
Warnung: 2 Zeilen f=C3=BCgen Whitespace-Fehler hinzu.


Heiko



