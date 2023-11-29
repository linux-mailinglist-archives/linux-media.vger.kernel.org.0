Return-Path: <linux-media+bounces-1351-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 390FB7FD4C9
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 11:58:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BDC28B21A80
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 10:58:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FCF91BDE0;
	Wed, 29 Nov 2023 10:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="b4wLtIo3"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E267595;
	Wed, 29 Nov 2023 02:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1701255522; x=1732791522;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=M/EKEUFxfdDs8TNn3crGxGOgNAze2DxPXENRFYQt23s=;
  b=b4wLtIo30ONBvyeuMxTjw7OW+b0Zi6+A7kjFIDguPRny+4eA7Rwg17RD
   UB3wpFwsJfBysIMjRfs7c1Bbz61VSTVY74fLoFG+7OMSJ2vZ4E719b1oU
   Li3NnEre/5nCH4nXo0dCv7rq/p1mDAiqmxp84p9a9k5uQLls/BtkynIL2
   cbLoCIsQnd5DqDWiK2QIMUR5bJa7ZUL4uKLruBRm+P9+lHcTGvdaELFkP
   NOex1P8GPMBIvzA69A45utwDJwWoUQKk465HukFOnMwCIImKNNBFwAKlp
   feTElvDN+FiQRfVZfUl7RhP30ah+b4N8XTMcovpr/5ttLX5/OEzh8xH20
   w==;
X-IronPort-AV: E=Sophos;i="6.04,235,1695679200"; 
   d="scan'208";a="34235300"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 29 Nov 2023 11:58:40 +0100
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id E799E280075;
	Wed, 29 Nov 2023 11:58:39 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, Paul Elder <paul.elder@ideasonboard.com>
Cc: kieran.bingham@ideasonboard.com, tomi.valkeinen@ideasonboard.com, umang.jain@ideasonboard.com, aford173@gmail.com, Paul Elder <paul.elder@ideasonboard.com>
Subject: Re: [PATCH v4 00/11] media: rkisp1: Add support for i.MX8MP
Date: Wed, 29 Nov 2023 11:58:39 +0100
Message-ID: <5184188.e9J7NaK4W3@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20231129092759.242641-1-paul.elder@ideasonboard.com>
References: <20231129092759.242641-1-paul.elder@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi Paul,

thanks for the series.

Am Mittwoch, 29. November 2023, 10:27:48 CET schrieb Paul Elder:
> This series extends the rkisp1 driver to support the ISP found in the
> NXP i.MX8MP SoC.
>=20
> The ISP IP cores in the Rockchip RK3399 (known as the "Rockchip ISP1")
> and in the NXP i.MX8MP have the same origin, and have slightly diverged
> over time as they are now independently developed (afaik) by Rockchip
> and VeriSilicon. The latter is marketed under the name "ISP8000Nano",
> and is close enough to the RK3399 ISP that it can easily be supported by
> the same driver.
>=20
> The last two patches add support for UYVY output format, which can be
> implemented on the ISP version in the i.MX8MP but not in the one in the
> RK3399.
>=20
> This version of the series specifically has been tested on a Polyhex
> Debix model A with an imx219 (Raspberry Pi cam v2).

I've created a setup on TQMa8MPxL/MBa8MPxL and a Sony IMX327 sensor for a=20
while now. I can stream 1080p video at 45 FPS to HDMI output without any=20
special configuration.

Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> Laurent Pinchart (2):
>   media: rkisp1: Add and use rkisp1_has_feature() macro
>   media: rkisp1: Configure gasket on i.MX8MP
>=20
> Paul Elder (9):
>   media: rkisp1: Support setting memory stride for main path
>   media: rkisp1: Support devices lacking self path
>   media: rkisp1: Support devices lacking dual crop
>   media: rkisp1: Fix RSZ_CTRL bits for i.MX8MP
>   dt-bindings: media: rkisp1: Add i.MX8MP ISP to compatible
>   media: rkisp1: Add match data for i.MX8MP ISP
>   media: rkisp1: Shift DMA buffer addresses on i.MX8MP
>   media: rkisp1: Add YC swap capability
>   media: rkisp1: Add UYVY as an output format
>=20
>  .../bindings/media/rockchip-isp1.yaml         |  37 ++++-
>  .../platform/rockchip/rkisp1/rkisp1-capture.c | 128 ++++++++++++-----
>  .../platform/rockchip/rkisp1/rkisp1-common.h  |  35 ++++-
>  .../platform/rockchip/rkisp1/rkisp1-dev.c     |  66 +++++++--
>  .../platform/rockchip/rkisp1/rkisp1-isp.c     | 131 +++++++++++++++++-
>  .../platform/rockchip/rkisp1/rkisp1-regs.h    |  32 +++++
>  .../platform/rockchip/rkisp1/rkisp1-resizer.c |  27 ++--
>  include/uapi/linux/rkisp1-config.h            |   2 +
>  8 files changed, 398 insertions(+), 60 deletions(-)


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



