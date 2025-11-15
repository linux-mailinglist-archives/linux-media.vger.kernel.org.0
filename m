Return-Path: <linux-media+bounces-47165-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D404C609B0
	for <lists+linux-media@lfdr.de>; Sat, 15 Nov 2025 19:00:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7CA654E34B4
	for <lists+linux-media@lfdr.de>; Sat, 15 Nov 2025 18:00:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BDC130748C;
	Sat, 15 Nov 2025 18:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="EakzarZL"
X-Original-To: linux-media@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F856245020;
	Sat, 15 Nov 2025 17:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763229601; cv=none; b=piVrGTzYy/NKe8ZGgYq3VRtEIF92eKfzZ5yxXsDgYzy78CunqpxCWjO7Zv2LCuezpxaS5PKUYkQq14gOJSJxo33PtDzM+sq4Fnjj+WioVyerdfhgGo7A+Ipb9vq4+RrH9Nnc7moo5YWyTR2pdc5qtYew1faRumx49sfywceHf1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763229601; c=relaxed/simple;
	bh=lxHrOMrsSJuXY9HMIRHWqRZHwt12QXxjKehR+EBlN8M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iTtXoE921x3bRFvKWPo2/lsn7IDJydhGBQ7Wss7X5Yde9uhe162vAcwWjgYdwkYJ059R0DLXoOvTXsipQUZMZsf0o9zHAHQpfH2lYKKureP002gSbNKteZyK7dOxVCqfnwp6jEEm4S77mZXx3Q+8cZEHPDpgOGinJMfFHc2DvwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=EakzarZL; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=+C/kU3wegl/g8oahkJ5TL3Nr8ieZ3KWlXonyzZd5hhk=; b=EakzarZLj9n5uOsx7TlSnRgt1p
	TekWmMyDtSu3MkuD8D27cazGfl76DTAJtM+syFL7+KotnDFUk0A7CuYfj0Ku7oP8KYYsNltqQ6fzi
	l2oM65z9QYEv1L1mIM9kkaUUsCtSLGHlxC2+/Ksu91dF9wxQ7SqUZ65+1/DZd8lY/fajnyav6arJL
	5p0k54jZwHbt4DczlVdZv7MpRMEFkne0oTfB6nt9iII9fRneBiDMvA5ZZ8HBRfutRrQLIv2eu2pd6
	e+liEvqiUpIWrukIScewemOcMXWmaAwSyVBdSQlww2orWZIi+mCHmgKia3fKZN12lpgRwvUGjRg7P
	N8W+O0Qw==;
Received: from i53875bd0.versanet.de ([83.135.91.208] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vKKYk-0007jc-Gg; Sat, 15 Nov 2025 18:59:38 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Mehdi Djait <mehdi.djait@linux.intel.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 =?UTF-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Markus Elfring <Markus.Elfring@web.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Kever Yang <kever.yang@rock-chips.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Collabora Kernel Team <kernel@collabora.com>,
 Paul Kocialkowski <paulk@sys-base.io>,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, michael.riesch@collabora.com
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@collabora.com>,
 Michael Riesch <michael.riesch@collabora.com>,
 Mehdi Djait <mehdi.djait@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject:
 Re: [PATCH v15 00/14] media: rockchip: add a driver for the rockchip camera
 interface
Date: Sat, 15 Nov 2025 18:59:36 +0100
Message-ID: <2678569.Lt9SDvczpP@diego>
In-Reply-To: <20240220-rk3568-vicap-v15-0-8f4915ee365d@collabora.com>
References: <20240220-rk3568-vicap-v15-0-8f4915ee365d@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Freitag, 14. November 2025, 16:20:11 Mitteleurop=C3=A4ische Normalzeit s=
chrieb Michael Riesch via B4 Relay:
> This series introduces support for the Rockchip Camera Interface (CIF),
> which is featured in many Rockchip SoCs in different variations.
> The series has now been around for a while and has received many comments
> and reviews. Thus, it should be ready for mainline by now.
>=20
> The last issue we discussed (see thread to v14, link below) was the
> necessary integration of a mux subdevice, as the MIPI CSI-2 data can
> be passed to the ISP and/or to the VICAP on RK3568. In order to avoid
> any uAPI breakage, the MIPI CSI-2 receiver support has been removed in v15
> (following an off-list discussion with Sakari).
>=20
> Therefore, the v15 of the series adds a media controller centric V4L2
> device driver for the Rockchip CIF with
>  - support for the PX30 VIP (not tested, though, due to the lack of HW)
>  - support for the RK3568 VICAP, including
>     - capturing frames from the DVP
>     - capturing frames from the MIPI CSI-2 receiver
>  - abstraction for the ping-pong scheme to allow for future extensions
>  - abstraction for the INTERFACE and CROP parts to allow for future
>    extensions
>  - initial support for different virtual channels (not tested, though,
>    due to the lack of HW)
>=20
> Apart from that, there are no changes compared to v14.
>=20
> Looking forward to your comments!

[...]

> Michael Riesch (12):
>       Documentation: admin-guide: media: add rockchip camera interface
>       media: dt-bindings: video-interfaces: add defines for sampling modes
>       media: dt-bindings: add rockchip rk3568 vicap
>       media: rockchip: add driver for the rockchip camera interface
>       media: rockchip: rkcif: add abstraction for interface and crop bloc=
ks
>       media: rockchip: rkcif: add abstraction for dma blocks
>       media: rockchip: rkcif: add support for px30 vip dvp capture
>       media: rockchip: rkcif: add support for rk3568 vicap dvp capture
>       media: rockchip: rkcif: add support for rk3568 vicap mipi capture

for people playing along at home, patches 1-10 seems to have been merged
into the media-committers tree [0]


[0] https://gitlab.freedesktop.org/linux-media/media-committers/-/commit/1f=
2353f5a1af995efbf7bea44341aa0d03460b28
    that commit and backwards in the history



>       arm64: defconfig: enable rockchip camera interface
>       arm64: dts: rockchip: add vicap node to rk356x
>       arm64: dts: rockchip: enable vicap dvp on wolfvision pf5 io expander




