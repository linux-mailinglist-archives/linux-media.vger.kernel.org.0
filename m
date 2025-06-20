Return-Path: <linux-media+bounces-35475-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C19DAAE1786
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 11:29:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A8B974A6C39
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 09:29:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7075B283C92;
	Fri, 20 Jun 2025 09:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="E0xVwfeP"
X-Original-To: linux-media@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F179A283686;
	Fri, 20 Jun 2025 09:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750411742; cv=none; b=GFARyTQfPuBcHLZt9bwWu9QIkJ4b4tEvgNZjPXRw09P6o1WR7/JzGHNFuDeyvUzDOCE6ivBO9CU9cnfnDq9pRzx6a1J2y2NagmLz9crSTH8MHmdRvVCJvXdmR3sDeyd/zAsKY7AuZ9lS4pk/l5vqQde+D30FWxbRd0pIYCfaemY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750411742; c=relaxed/simple;
	bh=urp8Q0ehaUbO+yKBRG0fm5N6pDJPVrQuXvB1WKobIWU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QFSidlYMi/ODvgvXCQYdrqn7/wptaMnVozYzkE155LIObWX3Xbz726frB+LVsH8CXMiXcJazK99k3nM0FcOLXNNiHaQQGaIbiwKh2wBFJ6XM8oVywYXFsR54EfFiUNFA6cdJU4+4LmlEBff4sHq6cJ24fqWDSDW36l3g9jD0P8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=E0xVwfeP; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=O0Z76gXzXASZvB45zMW7OBOfjiQs1Vtulp5U1K5X9+M=; b=E0xVwfePovI7zW07TkUrEmyv3u
	R6+iMMc2szMneU5Th+XbYLGrJMTI6wOnXneDpAa+NUznRovozXXGjIsRNZ3jM5XtXpaSvZ+1O50KY
	/YiANnD7+B6m3xmrAmSMjP/ADzGH+C6YP3KUnsrlFQtdCCWYW1TKw6kg35jrkVA8/N1yz/0KxnISa
	VrP5B9U/Y2f2kkmCCaa5m0sT8obSTTtEQZQ29fJbf2qyDFec7LH9Tvi5mpfWM2Npr8PKr7SZ2DGtm
	gE+NS9aCpNSgCLmcAC0mjhuBV8cJR6kxgEocCpeaFl2Hkr/s+H0fNHscRzNLwFSQ8wO+n2cjCxUnY
	61fY+D8A==;
Received: from 85-207-219-154.static.bluetone.cz ([85.207.219.154] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uSY2z-0008Po-Kz; Fri, 20 Jun 2025 11:28:33 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Kever Yang <kever.yang@rock-chips.com>, Robin Murphy <robin.murphy@arm.com>,
 Daniel Stone <daniel@fooishbar.org>, Da Xue <da@libre.computer>,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>, Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Tomeu Vizoso <tomeu@tomeuvizoso.net>, Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v7 00/10] New DRM accel driver for Rockchip's RKNN NPU
Date: Fri, 20 Jun 2025 11:28:32 +0200
Message-ID: <2241399.8hzESeGDPO@phil>
In-Reply-To: <20250606-6-10-rocket-v7-0-dc16cfe6fe4e@tomeuvizoso.net>
References: <20250606-6-10-rocket-v7-0-dc16cfe6fe4e@tomeuvizoso.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Freitag, 6. Juni 2025, 08:28:20 Mitteleurop=C3=A4ische Sommerzeit schrie=
b Tomeu Vizoso:
> This series adds a new driver for the NPU that Rockchip includes in its
> newer SoCs, developed by them on the NVDLA base.
>=20
> In its current form, it supports the specific NPU in the RK3588 SoC.
>=20
> The userspace driver is part of Mesa and an initial draft can be found at:
>=20
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/29698
>=20
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>

> ---
> Nicolas Frattaroli (2):
>       arm64: dts: rockchip: add pd_npu label for RK3588 power domains
>       arm64: dts: rockchip: enable NPU on ROCK 5B
>=20
> Tomeu Vizoso (8):
>       accel/rocket: Add registers header
>       accel/rocket: Add a new driver for Rockchip's NPU
>       accel/rocket: Add IOCTL for BO creation
>       accel/rocket: Add job submission IOCTL
>       accel/rocket: Add IOCTLs for synchronizing memory accesses
>       dt-bindings: npu: rockchip,rknn: Add bindings
>       arm64: dts: rockchip: Add nodes for NPU and its MMU to rk3588-base
>       arm64: dts: rockchip: Enable the NPU on quartzpro64

from a handling point of view, I would expect patch 1 - 6
(driver code + dt-binding patch) to go through some driver tree
but have not clue which one that is.

And afterwards, I would pick up the arm64 devicetree additions
patches 7 - 10 .


Heiko



