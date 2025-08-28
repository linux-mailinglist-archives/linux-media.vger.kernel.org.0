Return-Path: <linux-media+bounces-41224-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2CBB3979F
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 10:59:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EBA2817744B
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 08:59:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B6242EBBA2;
	Thu, 28 Aug 2025 08:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="pTvI62XZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F0D1B4244
	for <linux-media@vger.kernel.org>; Thu, 28 Aug 2025 08:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756371568; cv=none; b=QpOgx7zIIOYpeIDfUp2VxZs9VllOE19WKHBCLgv8JDCY/KdzTuem9nc7x4ZSJz0caG4w21Wnr/4e6raSXFH1m7i8jgP9yThkGaCzNiMwuv9S9TBeB/ym18/X5geRnFMWfBe1qHAgABXSxbnYRxBc+ANqsUWr7lhlJ9pRsJBOzmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756371568; c=relaxed/simple;
	bh=Rv6CyOoBS0W6yMgI9XY7ZWoTbg3KKhO83xxoSL9tWoI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=oPTiIMZo44Tr+K3oEbXDzjvgVi0Bfy5x5psi3KanHiIVZ4PRH4gv0jm9p9L2ZsHXiRV0NqLaQapfpYszHIcf1h0zl0lyI9iGTjhEUQxcoYJubMAIb6dY3jjBXODcB95Q7TFisy0sZivcIR7ufTLfKCvPbjnYVdkt4YEs9JFJGwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=pTvI62XZ; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250828085924epoutp044198a3797da34af42e6b4e638e81d07d~f4qHSg--n2436024360epoutp04U
	for <linux-media@vger.kernel.org>; Thu, 28 Aug 2025 08:59:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250828085924epoutp044198a3797da34af42e6b4e638e81d07d~f4qHSg--n2436024360epoutp04U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756371564;
	bh=YaV1VCJbwEKqNvJ8DCaGfJQT4gOTln3mHx4bL14ILXs=;
	h=From:To:Cc:Subject:Date:References:From;
	b=pTvI62XZb1VR5uxk4RXbccIKcAbv1L3jmADiyjJSi9EOaOiXRVk7xwK4jzRp2wDMM
	 ayMp1ltLEK7a6ho4Rl80ZbHDeXP6th3LjapPgPZ+fNHqXcnylVGtpwU1tHpOtwv0vD
	 dr5oHULb4FNswNaRo2/pR46QZg1DrbvWhkIKt6eM=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250828085923epcas5p4276b477fa880021927a43b3304ee9b26~f4qGgLVUj1772417724epcas5p4y;
	Thu, 28 Aug 2025 08:59:23 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.90]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4cCFhB3Nj9z6B9m6; Thu, 28 Aug
	2025 08:59:22 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250828085921epcas5p44f9371fb004fe0aa8bf68d1230e01861~f4qE65rNv1995619956epcas5p40;
	Thu, 28 Aug 2025 08:59:21 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250828085918epsmtip246c42f8ece911f2a426316d886ff3883~f4qCR2X9_0306303063epsmtip2U;
	Thu, 28 Aug 2025 08:59:18 +0000 (GMT)
From: Inbaraj E <inbaraj.e@samsung.com>
To: rmfrfs@gmail.com, laurent.pinchart@ideasonboard.com, martink@posteo.de,
	kernel@puri.sm, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de
Cc: kernel@pengutronix.de, festevam@gmail.com, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com,
	ravi.patel@samsung.com, shradha.t@samsung.com, Inbaraj E
	<inbaraj.e@samsung.com>
Subject: [PATCH v3 0/7] Add FSD CSIS support
Date: Thu, 28 Aug 2025 14:29:04 +0530
Message-ID: <20250828085911.81266-1-inbaraj.e@samsung.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250828085921epcas5p44f9371fb004fe0aa8bf68d1230e01861
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250828085921epcas5p44f9371fb004fe0aa8bf68d1230e01861
References: <CGME20250828085921epcas5p44f9371fb004fe0aa8bf68d1230e01861@epcas5p4.samsung.com>

The Tesla FSD SoC includes a MIPI CSI-2 receiver IP core named CSIS
(Camera Serial Interface Slave) IP, which is compatible with the CSIS
IP present in NXP i.MX7 and i.MX8 SoC.

The Tesla FSD SoC CSIS IP version is 4.3. This version of the CSIS IP
bundles MIPI CSI-2 link controller and video capture interface. The MIPI
CSI-2 link operation are integrated into the imx-mipi-csis driver, while 
the video capture interface is implemented in the fsd-csis driver.

The Tesla FSD SoC contains 12 instances of CSIS IP and 3 D-PHYs, with 4
CSIS instances sharing a single D-PHY.

The D-PHY interface exposes only the reset through Samsung SYSREG
controller.

This patch series does the following:
1) Add the necessary DT-binding documents.
2) Refactor the imx-mipi-csis driver to support platform specific
clock names and interrupt handlers through device specific data
(struct mipi_csis_info).
3) Add support to dynamically select the VC from the subdevice.
4) Add Telsa FSD CSIS link controller support in imx-mipi-csis driver.
5) Introduce a new media driver(fsd-csis) for the Telsa FSD video
capture interface to capture frames.

These patches were tested on the FSD platform using the
capture_raw_frames application.

Changes since v1:
1. Addressed review comments from Laurent Pinchart to integrate the
with imx-mipi-csis.c to handle the CSIS and expose it as a subdev.

Here is the link to v1 patch for reference:
https://lore.kernel.org/linux-media/7e7832c16925386b771ddb7e00e08661115aa0ea.1668963790.git.sathya@samsung.com/ 

Changes since v2:
1. Improved commit description across all the patches.
2. Changed syscon prefix from samsung to tesla.
3. Changed config from VIDEO_FSD_CSIS to VIDEO_TESLA_FSD_CSIS.
4. Fixed pll clock leak in probe.
5. Rebased the patches on top of laurent pinchart patchset.

Here is the link to v2 patch for reference.
https://lore.kernel.org/linux-media/20250814140943.22531-1-inbaraj.e@samsung.com/

This patchset is dependent on following laurent pinchart patchset.
https://lore.kernel.org/linux-media/20250822002734.23516-1-laurent.pinchart@ideasonboard.com/

Inbaraj E (7):
  dt-bindings: media: nxp: Add support for FSD SoC
  dt-bindings: media: fsd: Add CSIS video capture interface
  media: imx-mipi-csis: Move clk to mipi_csis_info structure
  media: imx-mipi-csis: Move irq flag and handler to mipi_csis_info
    structure
  media: imx-mipi-csis: Add support for dynamic VC selection
  media: imx-mipi-csis: Add support for Telsa FSD CSIS.
  media: fsd-csis: Add FSD CSIS video capture interface support

 .../bindings/media/nxp,imx-mipi-csi2.yaml     |   91 +-
 .../bindings/media/tesla,fsd-csis-media.yaml  |   76 +
 MAINTAINERS                                   |    8 +
 drivers/media/platform/nxp/imx-mipi-csis.c    |  330 +++-
 drivers/media/platform/samsung/Kconfig        |    1 +
 drivers/media/platform/samsung/Makefile       |    1 +
 .../media/platform/samsung/fsd-csis/Kconfig   |   18 +
 .../media/platform/samsung/fsd-csis/Makefile  |    3 +
 .../platform/samsung/fsd-csis/fsd-csis.c      | 1693 +++++++++++++++++
 9 files changed, 2161 insertions(+), 60 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/tesla,fsd-csis-media.yaml
 create mode 100644 drivers/media/platform/samsung/fsd-csis/Kconfig
 create mode 100644 drivers/media/platform/samsung/fsd-csis/Makefile
 create mode 100644 drivers/media/platform/samsung/fsd-csis/fsd-csis.c
-- 
2.49.0


