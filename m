Return-Path: <linux-media+bounces-2069-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF1880C25D
	for <lists+linux-media@lfdr.de>; Mon, 11 Dec 2023 08:49:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC02D1F20FB2
	for <lists+linux-media@lfdr.de>; Mon, 11 Dec 2023 07:49:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B22D20B02;
	Mon, 11 Dec 2023 07:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="Mp5ZAgZF"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05654FD;
	Sun, 10 Dec 2023 23:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1702280979; x=1733816979;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nfzaV3vxtQAyCNR+jzMcM2jLOcbWTkwcukLDVw5CIyg=;
  b=Mp5ZAgZFQ/8wEASqX3LMiyEOC3Cn7R+/943BHWWRZN2W8J7T6D1BGvy8
   Ei0HULTG6vphONKW29Pqgs+1RIchC7Ojq4ETs91HELZdkr6trPKFf7Mm7
   iPC1HiYUFzjdHElITLdVJu/v59fQMKhrYbWj1gX5EExo1UdVQRYWyMX2F
   JthsrMjR24vsoKlEn5NdECC2Gs/PDeMjQm+ynScTevY/hIlAXKx2USTgF
   WkS9gZuMnkKbY5kwxK5na41gAHF08VhDDPYiQeJawvW4a9DmmleZgwMY5
   OSYLoX6lhXthmNZDGnSLHGA/lGQ+uY+hEneJQv+4XCk6M4FHYmoER1chM
   w==;
X-IronPort-AV: E=Sophos;i="6.04,267,1695679200"; 
   d="scan'208";a="34423846"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 11 Dec 2023 08:49:36 +0100
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 88432280075;
	Mon, 11 Dec 2023 08:49:36 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, Paul Elder <paul.elder@ideasonboard.com>
Cc: kieran.bingham@ideasonboard.com, tomi.valkeinen@ideasonboard.com, umang.jain@ideasonboard.com, aford173@gmail.com, Paul Elder <paul.elder@ideasonboard.com>
Subject: Re: [PATCH v4 00/11] media: rkisp1: Add support for i.MX8MP
Date: Mon, 11 Dec 2023 08:49:37 +0100
Message-ID: <5998504.lOV4Wx5bFT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <5184188.e9J7NaK4W3@steina-w>
References: <20231129092759.242641-1-paul.elder@ideasonboard.com> <5184188.e9J7NaK4W3@steina-w>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi,

Am Mittwoch, 29. November 2023, 11:58:39 CET schrieb Alexander Stein:
> Hi Paul,
>=20
> thanks for the series.
>=20
> Am Mittwoch, 29. November 2023, 10:27:48 CET schrieb Paul Elder:
> > This series extends the rkisp1 driver to support the ISP found in the
> > NXP i.MX8MP SoC.
> >=20
> > The ISP IP cores in the Rockchip RK3399 (known as the "Rockchip ISP1")
> > and in the NXP i.MX8MP have the same origin, and have slightly diverged
> > over time as they are now independently developed (afaik) by Rockchip
> > and VeriSilicon. The latter is marketed under the name "ISP8000Nano",
> > and is close enough to the RK3399 ISP that it can easily be supported by
> > the same driver.
> >=20
> > The last two patches add support for UYVY output format, which can be
> > implemented on the ISP version in the i.MX8MP but not in the one in the
> > RK3399.
> >=20
> > This version of the series specifically has been tested on a Polyhex
> > Debix model A with an imx219 (Raspberry Pi cam v2).
>=20
> I've created a setup on TQMa8MPxL/MBa8MPxL and a Sony IMX327 sensor for a
> while now. I can stream 1080p video at 45 FPS to HDMI output without any
> special configuration.

Just for the records. the 45 FPS limit is introduced by (HDMI) output. Usin=
g a=20
gstreamer testsink "outpu", I can run at 60 FPS.

Best regards,
Alexander

> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>=20
> > Laurent Pinchart (2):
> >   media: rkisp1: Add and use rkisp1_has_feature() macro
> >   media: rkisp1: Configure gasket on i.MX8MP
> >=20
> > Paul Elder (9):
> >   media: rkisp1: Support setting memory stride for main path
> >   media: rkisp1: Support devices lacking self path
> >   media: rkisp1: Support devices lacking dual crop
> >   media: rkisp1: Fix RSZ_CTRL bits for i.MX8MP
> >   dt-bindings: media: rkisp1: Add i.MX8MP ISP to compatible
> >   media: rkisp1: Add match data for i.MX8MP ISP
> >   media: rkisp1: Shift DMA buffer addresses on i.MX8MP
> >   media: rkisp1: Add YC swap capability
> >   media: rkisp1: Add UYVY as an output format
> > =20
> >  .../bindings/media/rockchip-isp1.yaml         |  37 ++++-
> >  .../platform/rockchip/rkisp1/rkisp1-capture.c | 128 ++++++++++++-----
> >  .../platform/rockchip/rkisp1/rkisp1-common.h  |  35 ++++-
> >  .../platform/rockchip/rkisp1/rkisp1-dev.c     |  66 +++++++--
> >  .../platform/rockchip/rkisp1/rkisp1-isp.c     | 131 +++++++++++++++++-
> >  .../platform/rockchip/rkisp1/rkisp1-regs.h    |  32 +++++
> >  .../platform/rockchip/rkisp1/rkisp1-resizer.c |  27 ++--
> >  include/uapi/linux/rkisp1-config.h            |   2 +
> >  8 files changed, 398 insertions(+), 60 deletions(-)


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



