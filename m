Return-Path: <linux-media+bounces-35247-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5200EAE0129
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 11:07:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 75F353BE8C1
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 09:04:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 086D7269B01;
	Thu, 19 Jun 2025 09:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="Lz+dxvYl"
X-Original-To: linux-media@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F7E266EE6;
	Thu, 19 Jun 2025 09:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750323733; cv=none; b=afmMC3M7FzPDl6aaBp2TLdiSpX1IKKCN7moWtwy86jxTmmHgYzIYbx+WwHhAPjhS67ht/UlNGW1E07fzxCuBe8mybi9zzLEs2SDcXjtHqjcTBKvRw6b/sx8Sb/BLPh5RztW07Y2IuWAkf9T2nMOxIOhNlmQ6ve7vqgojIeLPDG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750323733; c=relaxed/simple;
	bh=sxqts40hu+Zgp1o1uSnNnU4YRV1Nyg3LBUl0fy5ocyQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C9inc3d1UA1XWOmuFTHvaXuhzs4zPBQ4ujHeWsIwKCKk6c2QssiY+o1Btf4IPcezY+zBGVdEJb0PINYViCPAphOO5Rye1r7hzDEy2txin56Iu988+je++bY/7tVTct7Is0suG8CfhSAcAOg39TdcM+YSqiFxgjtVlAlSTWUP5AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=Lz+dxvYl; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=YHxb3G7EW8RzN+dJgsKeTL9lqcEi84ddNrYeIybSCPk=; b=Lz+dxvYl7ugAV5gMsPRzO/Zn6T
	Mxdaho/YZVeiUWxOl3h4OrtvnZ6048BbBDlX5dPKQ1XqhZujSpQjlCFGyTGDJm7if6VNINPaxvQ7o
	/8kFNcpB0Rj4uYwQn53p69/iF6U2l0VZMcGB4ZK08SUUkSee1C2Bd+uoY3lEBnaDa99ka8xdolaYd
	SkyMcwGzxVNOJqlu0QcVtDNjVOvnvaWwLcfmxjA1+76juFgGKqfFU9c6d/YlIZdO9oBjq1meeEYDr
	PAGkuq1Dd0gbw/v6G9F9GSdHqYL3yb71Yy3TIRlUw3GNSjlg/GLMdhqeQKNJ7KWRkbwdsBY/RvAPs
	pKCLP7BA==;
Received: from 85-207-219-154.static.bluetone.cz ([85.207.219.154] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uSB9C-0007Ey-OE; Thu, 19 Jun 2025 11:01:26 +0200
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
Date: Thu, 19 Jun 2025 11:01:25 +0200
Message-ID: <2217684.TLkxdtWsSY@phil>
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
> Changes in v7:
> - Actually enable process isolation by allocating its own IOMMU domain
>   to each DRM client.
> - Link to v6: https://lore.kernel.org/r/20250604-6-10-rocket-v6-0-237ac75=
ddb5e@tomeuvizoso.net

I was able to successfully run the SSDLite MobileDet model, detecting
elements correctly on that "Sounds of New York" youtube video all the
demos seem to be using ;-) - on a rk3588-tiger board.

NPU needed like 30ms per frame or so and also detected the expected
things, so

Tested-by: Heiko Stuebner <heiko@sntech.de>



