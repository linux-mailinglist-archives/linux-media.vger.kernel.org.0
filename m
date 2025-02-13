Return-Path: <linux-media+bounces-26120-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 748ADA33CE3
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2025 11:40:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 517267A38CB
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2025 10:39:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8A3B2135B6;
	Thu, 13 Feb 2025 10:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="b0JIacVt"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CAD211A06;
	Thu, 13 Feb 2025 10:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739443243; cv=none; b=dVGfZSZ40Xqo4vvbvPKWix7N+4SAKtZJHsgSiEZQLVwPqUNl+x3tOomcL+QVmacM2f5tSCTCkD3E2LiHBSi2tXKyn3x35EB7oY3YLOg1Hr+IAeVXLPobfL81/W3TVJI8hmtN/+6J90I75Rno7g5ct8pVPwJqHhcuAqT0O5r4n6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739443243; c=relaxed/simple;
	bh=rKfJj/nOFTP3ITe5GatUlSP/bs0kOFPFXDa1/jdXj0Q=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=Ea3Z3atIRMfDy7odnVfpJmHWTGTGNuCIEWTHUq4GEa2uH1bf95Y/BT2vpdCGa8OQIWCRJy/OIbODQc4LzEsbWblaYjWs3A+N7t7o78fPSIRqElO4EiPpNcA3541wPXoT4f8oOTA5wFrj0T13eGwVL/eXR1NziKuAKzxiJwpI+lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=fail (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=b0JIacVt reason="signature verification failed"; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 58AC36AF;
	Thu, 13 Feb 2025 11:39:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739443160;
	bh=rKfJj/nOFTP3ITe5GatUlSP/bs0kOFPFXDa1/jdXj0Q=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=b0JIacVtrHBLExudGvxw2VW6F6/nRpG6Ko7zZRbOF5hzlown3X9l7YYBxDooS+kn0
	 EP23NnSl/XMjJvwO6j+1Jl5FF0X9GJATp9tVJ3PujlTWBzn4f4d+gflviRsAoBU0Ca
	 +rweftJoiunoNp8OZmz8bMPvRF65bN//JuR4eBUE=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250212195656.69528-1-slavine@d3embedded.com>
References: <20250212195656.69528-1-slavine@d3embedded.com>
Subject: Re: [PATCH 0/4] media: i2c: Add driver for Sony IMX728
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: =?utf-8?q?N=C3=ADcolas?= F. R. A. Prado <nfraprado@collabora.com>, Abel Vesa <abel.vesa@linaro.org>, Achath Vaishnav <vaishnav.a@ti.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Ard Biesheuvel <ardb@kernel.org>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Biju Das <biju.das.jz@bp.renesas.com>, Bjorn Andersson <quic_bjorande@quicinc.com>, Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley <conor+dt@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>, Fabio Estevam <festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Hans Verkuil <hverkuil@xs4all.nl>, Javier Carrasco <javier.carrasco@wolfvision.net>, Jianzhong Xu <xuj@ti.com>, Julien Massot <julien.massot@collabora.com>, Kory Maincent <kory.maincent@bootlin.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
 , Mikhail Rudenko <mike.rudenko@gmail.com>, Nishanth Menon <nm@ti.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Sascha Hauer <s.hauer@pengutronix.de>, Sebastian LaVine <slavine@d3embedded.com>, Shawn Guo <shawnguo@kernel.org>, Stuart Burtner <sburtner@d3embedded.com>, Tero Kristo <kristo@kernel.org>, Thakkar Devarsh <devarsht@ti.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Umang Jain <umang.jain@ideasonboard.com>, Vignesh Raghavendra <vigneshr@ti.com>, Will Deacon <will@kernel.org>, Zhi Mao <zhi.mao@mediatek.com>
To: Sebastian LaVine <slavine@d3embedded.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Date: Thu, 13 Feb 2025 10:40:35 +0000
Message-ID: <173944323591.1238111.8582110055649651187@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Hi Sebastian,

Quoting Sebastian LaVine (2025-02-12 19:56:52)
<snip>
>=20
> Total for device /dev/v4l-subdev4: 44, Succeeded: 44, Failed: 0, Warnings=
: 0
>=20
>=20
> This is a v3 of a series that was originally sent last summer[0].
>=20
> [0]: https://lore.kernel.org/r/linux-media/20240628-imx728-driver-v2-0-80=
efa6774286@d3engineering.com/

This version of the driver was authored by "Spencer Hill
<shill@d3engineering.com>" who seems to no longer be credited. Is this
intentional?

Does his original Signed-off-by: tag need to be kept at least ? Or
perhaps Co-Authored-by: ?

--
Kieran


>=20
> v2 -> v3:
> - Update maintainer
> - Update bindings example
> - Add devicetree overlays
> - The driver now supports SRGGB12_1X12, not SRGGB10_1X10
> - The driver now outputs at 3856x2176, not 2840x2160
> - Fixed exposure, again controls
> - Removed duplicate register writes (removed repeat HDR writes, etc)
> - Fixed imx728_wait_for_state use of the cci_* API
> - Re-added _imx728_set_routing (necessary for imx728_init_state)
>=20
> Sebastian LaVine (4):
>   media: dt-bindings: Add Sony IMX728
>   media: i2c: Add driver for Sony IMX728
>   arm64: dts: ti: k3-am62a7-sk: Add overlay for fusion 2 board
>   arm64: dts: ti: Add overlays for IMX728 RCM

