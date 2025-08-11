Return-Path: <linux-media+bounces-39400-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D07B200E7
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 09:54:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 19604188A647
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 07:54:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 436C32DAFA3;
	Mon, 11 Aug 2025 07:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="SxXGZdtQ"
X-Original-To: linux-media@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324A92DA768;
	Mon, 11 Aug 2025 07:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754898768; cv=none; b=S/nKp36D2xQXGVcXIRruQFC/RdQ/xUurjx/ln4w8Kfd/4O7PKN+wjSD7RVUZhbrphzDE0TSTTroChbWUDO48K43Jkppz2ZsxFBMTvzyrqwkvp87oSe8qacz3qdXTPUYpOLkffYOfSFC+FMmWCkSLZ25s+SFkbHuaU/eLfwh9vf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754898768; c=relaxed/simple;
	bh=95e3CuUQTrqy45zqcyWItFZG1H12fFfOzG5f9CveAYY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EPgDTp4NuiSs0aVsX58rm1MuhnAG3XrC/jTTCTFihjMODzy43kVaN1aJ8hXj1X4GPyWUWh2MbsmBQQvwYvWzmpEpbtUCNOxNGHMGhgGl4AsErpcdONFClz7wL9g2pJ739BIX1M+QyUTkACJgVvEieDxOkNQ4pzV7Ef78jhHHWt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=SxXGZdtQ; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=o/TAwYgz0ngg4OZwy8ia8COP26JschOwB0HVHE21DAo=; b=SxXGZdtQyMxVwztNjnje48NwIx
	XaQaPQlAFvFfiS6IlDPIeQMvlKPgHgQqqLGrZ4R2g0IitbB6dbDHTto16Pp1ddSAobTmniULWRNzl
	BexPQ0ZFnRcOgjUSdki0l99Lr2pnWuqHmy52zl621XqRWKy5viH8Pb3fPt9GmlblgoAPAVVylH243
	4zzixJvbmlYB36lFr1prCfqgUkJigDVR9cKjV/8UGaSsEwVXzVrBSmJMLXxGRzYyQdsFWmoFJ4gon
	Q6FJhthMt6ar6kMBaIY3TKu5dpzbnVRwS2Wzsgj5njlP2DWDzHN1ihnT0+sLBay9pqGWozkbvqrSu
	xB0lx96A==;
Received: from i53875a0c.versanet.de ([83.135.90.12] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ulNKN-0007Ro-TK; Mon, 11 Aug 2025 09:52:19 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Oded Gabbay <ogabbay@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Daniel Stone <daniel@fooishbar.org>,
	Da Xue <da@libre.computer>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	Robert Foss <rfoss@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH v9 00/10] New DRM accel driver for Rockchip's RKNN NPU
Date: Mon, 11 Aug 2025 09:52:06 +0200
Message-ID: <175489870472.808197.2800921191556391028.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250721-6-10-rocket-v9-0-77ebd484941e@tomeuvizoso.net>
References: <20250721-6-10-rocket-v9-0-77ebd484941e@tomeuvizoso.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 21 Jul 2025 11:17:27 +0200, Tomeu Vizoso wrote:
> This series adds a new driver for the NPU that Rockchip includes in its
> newer SoCs, developed by them on the NVDLA base.
> 
> In its current form, it supports the specific NPU in the RK3588 SoC.
> 
> The userspace driver is part of Mesa and an initial draft can be found at:
> 
> [...]

Applied, thanks!

[07/10] arm64: dts: rockchip: add pd_npu label for RK3588 power domains
        commit: 6d64bceb97a1c93b3cc2131f7e023ef2f9cf33f2
[08/10] arm64: dts: rockchip: Add nodes for NPU and its MMU to rk3588-base
        commit: a31dfc060a747f08705ace36d8de006bc13318fa
[09/10] arm64: dts: rockchip: Enable the NPU on quartzpro64
        commit: 640366d644b1e282771a09c72be37162b6eda438
[10/10] arm64: dts: rockchip: enable NPU on ROCK 5B
        commit: 3af6a83fc85033e44ce5cd0e1de54dc20b7e15af

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

