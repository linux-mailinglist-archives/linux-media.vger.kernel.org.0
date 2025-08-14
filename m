Return-Path: <linux-media+bounces-40061-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE2DB2983B
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 06:37:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A59591895A99
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 04:37:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B8B3263F49;
	Mon, 18 Aug 2025 04:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="hs6f1N5I"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423C825B1C5
	for <linux-media@vger.kernel.org>; Mon, 18 Aug 2025 04:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755491843; cv=none; b=FAFl6Jg8Cf/Zjdi5h9RHc22Fbn+HFBVcKUnm2HcRfKyUdYCqkA8qv6lQuulTSiJ5BaUKAM3BATufvofLEfQCTE0dHIR2YdcIBIMqfUFaCDdSQORn6uSpaPT1ejuD54p9vHAbhTgmGHeOFUSLbKo/wqQDYmCXTuRCHKmMrLXbgJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755491843; c=relaxed/simple;
	bh=GGMEHVB0X2VGIc4wzUyfGmQwSg52QCIC5HEXNyGM8To=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=GnzRsOAfhJxz8nO41EnCxDwNF9I8VSEhncVpYJNK5L/+V6yGK34riGhCNBElDF9kpda8Cqi7mOab/qiJS9eQlNaynhvFFkl5azEer6XjYl4HFZF9hhdq+UdN/x67MBF5nrSVnI1mgczmnQnhj5/OGc+LENmOmJ4p2TKLPR3K/SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=hs6f1N5I; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250818043719epoutp02273fff7638319f309f46c5829e29001b~cwobTFfEj1614916149epoutp028
	for <linux-media@vger.kernel.org>; Mon, 18 Aug 2025 04:37:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250818043719epoutp02273fff7638319f309f46c5829e29001b~cwobTFfEj1614916149epoutp028
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755491839;
	bh=44MXY/Ntu9rAF0ovbjOJnvuaxkF7loC1JC6bTAe9rcc=;
	h=From:To:Cc:Subject:Date:References:From;
	b=hs6f1N5IFuWk+6F5dtOPgis0vajdlWb4bFzF6EZRtUBVaHfpqrLJBxqSBsHDZKBT5
	 /+rsGn7ltJQhYRWmKrNxZBVrFXUCdRALJQY8zXdS4dWcoKrdxSRj7civ/mQSjEkLCz
	 7WWIA4dGzeIvz5Ob5KdBV6bfzRa5QfZsBIzhMQ8I=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250818043718epcas5p3efbcae916de49e498b30a4a88463536a~cwoat_LHK0408004080epcas5p3U;
	Mon, 18 Aug 2025 04:37:18 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.87]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4c50LG6cnmz6B9mL; Mon, 18 Aug
	2025 04:37:10 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250814140956epcas5p480aa24441933523484da5c241a201d3c~bp3QEJitT1225312253epcas5p4t;
	Thu, 14 Aug 2025 14:09:56 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250814140952epsmtip2b069f926cc266c22788710b6b7b5e597~bp3MNOvQB1162411624epsmtip2h;
	Thu, 14 Aug 2025 14:09:52 +0000 (GMT)
From: Inbaraj E <inbaraj.e@samsung.com>
To: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org,
	s.nawrocki@samsung.com, s.hauer@pengutronix.de, shawnguo@kernel.org,
	cw00.choi@samsung.com, rmfrfs@gmail.com, laurent.pinchart@ideasonboard.com,
	martink@posteo.de, mchehab@kernel.org, linux-fsd@tesla.com, will@kernel.org,
	catalin.marinas@arm.com, pankaj.dubey@samsung.com, shradha.t@samsung.com,
	ravi.patel@samsung.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, alim.akhtar@samsung.com,
	linux-samsung-soc@vger.kernel.org, kernel@puri.sm, kernel@pengutronix.de,
	festevam@gmail.com, linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Inbaraj E <inbaraj.e@samsung.com>
Subject: [PATCH v2 00/12] Add FSD CSI support
Date: Thu, 14 Aug 2025 19:39:31 +0530
Message-ID: <20250814140943.22531-1-inbaraj.e@samsung.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250814140956epcas5p480aa24441933523484da5c241a201d3c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250814140956epcas5p480aa24441933523484da5c241a201d3c
References: <CGME20250814140956epcas5p480aa24441933523484da5c241a201d3c@epcas5p4.samsung.com>

FSD CSI(Camera Serial Interface) IP bundles Link controller and DMA
controller for receiving frames. FSD SoC has 12 instances of CSI IP and
3 D-PHY. 4 instances of CSI IP use 1 D-PHY.

This patch series does the following:
1) Refactor the imx-mipi-csis driver to support platform specific
clock names and interrupt handlers through device specific data
(struct mipi_csis_info).
2) Add FSD CSI link controller support in imx-mipi-csis driver.
3) Introduce a new media driver for FSD CSI DMA providing support for
video capture and streaming.
 
These patches were tested on the FSD platform using the
capture_raw_frames application.

Changes since v1:
1. Addressed review comments from Laurent Pinchart to integrate the
with imx-mipi-csis.c to handle the CSIS and expose it as a subdev.

Here is the link to v1 patch for reference:
https://patchwork.kernel.org/project/linux-media/patch/7e7832c16925386b771ddb7e00e08661115aa0ea.1668963790.git.sathya@samsung.com/

Inbaraj E (12):
  dt-bindings: clock: Add CAM_CSI clock macro for FSD
  clk: samsung: fsd: Add clk id for PCLK and PLL in CAM_CSI block
  dt-bindings: media: nxp: Add support for FSD SoC
  arm64: dts: fsd: Add CSI nodes
  media: imx-mipi-csis: Move clk to mipi_csis_info structure
  media: imx-mipi-csis: Move irq flag and handler to mipi_csis_info
    structure
  media: imx-mipi-csis: Add support to configure specific vc
  media: imx-mipi-csis: Add support to dump all vc regs
  media: imx-mipi-csis: Add support for FSD CSI Rx
  dt-bindings: media: fsd: Document CSIS DMA controller
  arm64: defconfig: Enable FSD CSIS DMA driver
  media: fsd-csis: Add support for FSD CSIS DMA

 .../bindings/media/nxp,imx-mipi-csi2.yaml     |   88 +-
 .../bindings/media/tesla,fsd-csis-media.yaml  |   74 +
 MAINTAINERS                                   |    8 +
 arch/arm64/boot/dts/tesla/fsd-evb.dts         |   96 +
 arch/arm64/boot/dts/tesla/fsd.dtsi            |  552 ++++++
 arch/arm64/configs/defconfig                  |    1 +
 drivers/clk/samsung/clk-fsd.c                 |   28 +-
 drivers/media/platform/nxp/imx-mipi-csis.c    |  354 +++-
 drivers/media/platform/samsung/Kconfig        |    1 +
 drivers/media/platform/samsung/Makefile       |    1 +
 .../media/platform/samsung/fsd-csis/Kconfig   |   16 +
 .../media/platform/samsung/fsd-csis/Makefile  |    3 +
 .../platform/samsung/fsd-csis/fsd-csis.c      | 1730 +++++++++++++++++
 include/dt-bindings/clock/fsd-clk.h           |   13 +
 14 files changed, 2890 insertions(+), 75 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/tesla,fsd-csis-media.yaml
 create mode 100644 drivers/media/platform/samsung/fsd-csis/Kconfig
 create mode 100644 drivers/media/platform/samsung/fsd-csis/Makefile
 create mode 100644 drivers/media/platform/samsung/fsd-csis/fsd-csis.c

-- 
2.49.0


