Return-Path: <linux-media+bounces-38186-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 82850B0C840
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 17:56:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 602931C2178B
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 15:56:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 191212DEA79;
	Mon, 21 Jul 2025 15:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="N7F21LPI"
X-Original-To: linux-media@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397221F463A;
	Mon, 21 Jul 2025 15:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753113311; cv=none; b=KgkPPTdxv/QPjJrcB/t6fbIYFo6kcNbiROfC8963D9m+Gq6Cu2xRrRwKiDr1Rdh712/FAs86sfYY5062mGijb/2+rHR6sXk395BAveYtNX7DBkqBlxf3eSKdsC6EdY/ht0DevQJ6gEZwFdF6FkCQxD2mx4DxIxhqxOJ4e2zIMxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753113311; c=relaxed/simple;
	bh=N1dy7xoxRKl1sQ1tb4Ipkebpw3UhPsQ6Fu34IdYEgOA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MR4RwdQ1g7KPdqbNqQSmE1CdwyJY3XMe6qeUXOYQz3Qf54u+O3uG6JjDTn9CLGNphLb1akLJa+AEKSosW9x8ToXa2qs/CEwqY0XtObbNJvhK1BY19PhtSwkBwhB1we3bQWyzVEDFqbJVytslxAzXlyZ1TuQ37SmEGZmxasLJSyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=N7F21LPI; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=N1dy7xoxRKl1sQ1tb4Ipkebpw3UhPsQ6Fu34IdYEgOA=; b=N7F21LPIdchD8+2O9CRvE6O6lI
	gX1sGnojJnysvzXKgRZSVl3qksY/yK/9djn9/YWNxOIWo7kFQbymnEjUusxPGd1xxRZxoe4sKglj0
	h5Dh1ridpadW6MvtjkAbPCgYeYBiRCxw1Sg96MnfuX+/9+opxxxztm6oYj0PzZmb1sgUJ4KI2NSYg
	3BVv4bX1JAQbphTSLHK+Me/8AOwc2onF5MjEXKI8VCbzpWtbhsMOvO5HiV0lI01ilo91r6z1ubpOv
	+Zu5Ulx51fV7sPn3ctWr48CQG/p3JV46sJ2rUHDQ9QNCIY9gs1FwB6HfVy+QTbCfCw1igvlrNNkf5
	K4zSFjWA==;
Received: from i53875b2e.versanet.de ([83.135.91.46] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1udsND-00047Z-91; Mon, 21 Jul 2025 17:24:15 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Kever Yang <kever.yang@rock-chips.com>, Robin Murphy <robin.murphy@arm.com>,
 Daniel Stone <daniel@fooishbar.org>, Da Xue <da@libre.computer>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Robert Foss <rfoss@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v9 00/10] New DRM accel driver for Rockchip's RKNN NPU
Date: Mon, 21 Jul 2025 17:24:13 +0200
Message-ID: <4109088.mvXUDI8C0e@diego>
In-Reply-To: <b48c6694-2bd1-44d0-9dd1-1b7a67e22d87@oss.qualcomm.com>
References:
 <20250721-6-10-rocket-v9-0-77ebd484941e@tomeuvizoso.net>
 <b48c6694-2bd1-44d0-9dd1-1b7a67e22d87@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Jeff,

Am Montag, 21. Juli 2025, 16:55:01 Mitteleurop=C3=A4ische Sommerzeit schrie=
b Jeff Hugo:
> On 7/21/2025 3:17 AM, Tomeu Vizoso wrote:
> > This series adds a new driver for the NPU that Rockchip includes in its
> > newer SoCs, developed by them on the NVDLA base.
> >=20
> > In its current form, it supports the specific NPU in the RK3588 SoC.
> >=20
> > The userspace driver is part of Mesa and an initial draft can be found =
at:
> >=20
> > https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/29698
> >=20
> > Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
>=20
> This (and the userspace component) appear ready for merge from what I=20
> can tell. Tomeu is still working on his drm-misc access so I've offered=20
> to merge on his behalf. Planning on waiting until Friday for any final=20
> feedback to come in before doing so.

sounds great.

Just to make sure, you're planning to merge patches 1-6 (driver + binding)
into drm-misc and I'll pick up the "arm64: dts: " patches 7-10 afterwards?

Heiko



