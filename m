Return-Path: <linux-media+bounces-39449-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B490CB2124C
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 18:40:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A8C9B1886930
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 16:35:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 025832D4807;
	Mon, 11 Aug 2025 16:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="TV+lgzfY"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F09E2C21F7;
	Mon, 11 Aug 2025 16:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754930055; cv=pass; b=jdLNJYcJ3X0EgKt87XSmq5C0g7IzLDyuhVk5kiVAgN3zc7Vn9dSNFT+mNTh2aSLKXbD6bphQiY5bubQhtfPv4l+Tr+LQD1xUqIg9wCBn6I4aRwWla3ro+IgntDJliO+lGIsrVMqUIXLTLNxB+u0gsK9ZQZpIekpOkKXuX/cAVNQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754930055; c=relaxed/simple;
	bh=KkClp7/NTFWJs5sayibWNVcyEVObg21OtFsIQJKSfwM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mziRywiBbyfx+t5sDB9a9FQ4LBRXdZFGMSPZ9eo+RKmy73XV2LLJOQ1wmL7/Y8trbVc6vM05ms7pgjsUQ4Nb/STB5MIzyupOHIdh3szfye1hP3BvaQybGzJ3R9MpFpQncGkQI/wAbpnwNmQeRtm+1vvY6jtMRgPJniSUGiyNBTE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b=TV+lgzfY; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1754930035; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WALDvJUiY6agdTMVjbOdgsyLM0rooteGQ1Q2+Z0txOcryAUTuTDrS7mM7LxWJM7O7i83n5j7BBH5lSg1sMmcBL+jZytUwk2x7B3aJ+lSexS2OhFQpK2d9cQL7hrr/UiuO/OxE2nQ1huxt241vyQbDwAZ/FSemnay6ZWkE4YWSMU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1754930035; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=lxrZzkcx2EcLzf1PmmakOYUaazHyNZdo2XN9MJYVzZ4=; 
	b=RY1IHERjRqTpFmJVzLZqtb7WDX0BgvvM4TkMXtDkdMckef1FY+3qmdcLisKwAAizhPZ9DsTQF8M94z17CGYhnyOV6Wq2aFjVNtpuvO6gqmZdrNCxqIOZaJVumTQxbbWgZCk+hsTcMUFPSvn3LFVVOZoea/HiORk1hPbiKapc+Dg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1754930035;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=lxrZzkcx2EcLzf1PmmakOYUaazHyNZdo2XN9MJYVzZ4=;
	b=TV+lgzfYkfuWIOP8R63YlN16wY89pJ7dNVeThEbfhEOD7qpDzJLA3U0P22xI+Yuj
	8MBiFiTw//d7JKgK+mQqUngx7dnAK1Lj4uDzx6JbPsmuQtkpm6REFRNU8C/b5qweOCA
	aUDweGIL5Rx/sjCGVnrMMLi27lnur8BWxoLMqZMQ=
Received: by mx.zohomail.com with SMTPS id 1754930032659396.3146876115104;
	Mon, 11 Aug 2025 09:33:52 -0700 (PDT)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org,
 Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com
Subject:
 Re: [PATCH v2 00/12] media: rkvdec: Add support for VDPU381 and VDPU383
Date: Mon, 11 Aug 2025 12:33:51 -0400
Message-ID: <2377895.ElGaqSPkdT@trenzalore>
In-Reply-To: <11040209.aFP6jjVeTY@diego>
References:
 <20250808200340.156393-1-detlev.casanova@collabora.com>
 <11040209.aFP6jjVeTY@diego>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ZohoMailClient: External

Hi Heiko,

On Monday, 11 August 2025 05:56:00 EDT Heiko St=C3=BCbner wrote:
> Hi Detlev,
>=20
> Am Freitag, 8. August 2025, 22:03:22 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb=20
Detlev Casanova:
> > These variants are found respectively in the RK3588 and RK3576 SoCs.
> > This patch only adds support for H264 and H265 in both variants.
> >=20
> > As there is a considerable part of the code that can be shared with the
> > already supported rkvdec decoder driver, the support for these variants
> > is added here rather than writing a new driver.
> >=20
> > This patch set uses the newly introduced hevc_ext_sps_[ls]t_rps v4l2
> > controls for HEVC [1].
> > Therefore, a patched version of userpace tools is needed for HEVC
> > support (added for GStreamer[2] and in an early stage for FFmpeg[3]).
> >=20
> > This patch set also depends on the preparation patch set sent earlier [=
4]
> > as well as the iommu restore fix [5] (already merged in linux-media) and
> > Nicolas Frattaroli's bitmap patch [6] to support setting registers that
> > uses upper 16 bits as masks.
> >=20
> > [1]:
> > https://lore.kernel.org/all/20250807194327.69900-1-detlev.casanova@coll=
ab
> > ora.com/ [2]:
> > https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/9355
> > [3]: https://gitlab.collabora.com/detlev/ffmpeg
> > [4]:
> > https://lore.kernel.org/all/20250623160722.55938-1-detlev.casanova@coll=
ab
> > ora.com/ [5]:
> > https://lore.kernel.org/all/20250508-rkvdec-iommu-reset-v1-1-c46b6efa6e=
9b
> > @collabora.com/ [6]:
> > https://lore.kernel.org/all/20250623-byeword-update-v2-1-cf1fc08a2e1f@c=
ol
> > labora.com/>=20
> > Changes since v1:
> >  - Add parsing of the short and long term ref frame sets from the new v=
4l2
> > =20
> >    controls
> > =20
> >  - Add RPS cache to avoid parsing the same data again
> >  - Fix HEVC pixel formats selection
> >  - Fix multiple indentation errors
>=20
> when applying the series, git was a bit unhappy about some whitespaces:

Mmh, it looks like some rebase issues. Thanks, I'll fix those !

> > Detlev Casanova (12):
> >   media: rkvdec: Switch to using structs instead of writel
> >   media: rkvdec: Move cabac table to its own source file
>=20
> Applying: media: rkvdec: Move cabac table to its own source file
> .git/rebase-apply/patch:535: new blank line at EOF.
> +
> Warnung: 1 Zeile f=C3=BCgt Whitespace-Fehler hinzu.
>=20
> >   media: rkvdec: Use structs to represent the HW RPS
> >   media: rkvdec: Move h264 functions to common file
>=20
> Applying: media: rkvdec: Move h264 functions to common file
> .git/rebase-apply/patch:278: new blank line at EOF.
> +
> Warnung: 1 Zeile f=C3=BCgt Whitespace-Fehler hinzu.
>=20
> >   media: rkvdec: Add per variant configuration
> >   media: rkvdec: Add RCB and SRAM support
>=20
> Applying: media: rkvdec: Add RCB and SRAM support
> .git/rebase-apply/patch:200: new blank line at EOF.
> +
> Warnung: 1 Zeile f=C3=BCgt Whitespace-Fehler hinzu.
>=20
> >   media: rkvdec: Support per-variant interrupt handler
> >   media: rkvdec: Enable all clocks without naming them
> >   media: rkvdec: Add H264 support for the VDPU381 variant
> >   media: rkvdec: Add H264 support for the VDPU383 variant
> >   media: rkvdec: Add HEVC support for the VDPU381 variant
>=20
> Applying: media: rkvdec: Add HEVC support for the VDPU381 variant
> .git/rebase-apply/patch:3483: new blank line at EOF.
> +
> .git/rebase-apply/patch:4035: new blank line at EOF.
> +
> Warnung: 2 Zeilen f=C3=BCgen Whitespace-Fehler hinzu.
>=20
>=20
> Heiko





