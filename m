Return-Path: <linux-media+bounces-42066-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 626D5B4A48E
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 10:08:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DE1D27AC848
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 08:06:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22E13246762;
	Tue,  9 Sep 2025 08:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="mt/DHCtH"
X-Original-To: linux-media@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2D927453;
	Tue,  9 Sep 2025 08:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757405292; cv=none; b=cGBL0xMrJ0x25rPj8frv3YK9FbBNkZdLlpO+ZgZsDqPRy9faPwFkKN7oE429RBGYOTuPHCaCLAiYvCNiEHDLOxL78I/wHWAESO0zhhxtfjzq/PzLTLNsvJDCT0FLdlBqpxriK1sUS/c/Toiife7p9etANpeNt9sK/OVfm0Ge5vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757405292; c=relaxed/simple;
	bh=pgqnCJUBkhynTfzhoTx3T75WGLLRiyFvnl4HwV8FrM8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SwRX78/GZ11nxAxX1c3N0M942Bk/jAuxKTQQirJZTn31iYh7XEX6yWEDrPcpKcWpkyYAk+0FxhrkPYNjxVLKbVG4WMJVplbbWQ/iQssbt9nzy5NORtsvH8SQxxHZjiYWIj1Y9Jnbo6P39krPId0obzBPA7C6Uf/dh1i7+KyY30s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=mt/DHCtH; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 589880Oa293572;
	Tue, 9 Sep 2025 03:08:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757405280;
	bh=Y0Zfml1i4feiJJrbO2nBjAqErtsyY5h434fvTyCD3kY=;
	h=From:To:CC:Subject:Date;
	b=mt/DHCtHqZJRwQ9ruq/XNFCPsLLWQSWLf1iHp2PWYNI5jc1JY0sOlaJRFQwI80Ej+
	 8/DJqEEkegF7L5oworAgL5d7F5GcqWx4W1pUZn/ahBC+pg8v4lUqkyOcG1WlUATeFg
	 ptfcCP+9s4O86bYL40Vl1Pi5UFd7uZzuFuVX+M7c=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 589880Ii204864
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 9 Sep 2025 03:08:00 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 9
 Sep 2025 03:07:59 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 9 Sep 2025 03:07:59 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.68.198])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58987soD2319864;
	Tue, 9 Sep 2025 03:07:55 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <hverkuil+cisco@kernel.org>
CC: <sakari.ailus@linux.intel.com>, <bparrot@ti.com>,
        <jai.luthra@ideasonboard.com>, <dale@farnsworth.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>,
        <y-abhilashchandra@ti.com>
Subject: [PATCH V3 0/5] Add support for TI VIP
Date: Tue, 9 Sep 2025 13:37:13 +0530
Message-ID: <20250909080718.1381758-1-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

This patch series adds support for the TI VIP. VIP stands for Video
Input Port, it can be found on devices such as DRA7xx and provides
a parallel interface to a video source such as a sensor or TV decoder. 

Each VIP can support two inputs (slices) and a SoC can be configured
with a variable number of VIP's. Each slice can support two ports
each connected to its own sub-device.

Changelog:
Changes in v3:
Krzysztof:
- Add kerneldoc for vpdma_update_dma_addr function
- Change EXPORT_SYMBOL to EXPORT_SYMBOL_GPL for vpdma_update_dma_addr
- Remove redundant labels in bindings (Patch 4/5)
- Remove minItems in interrupts and mandate exactly 2 interrupts using items (Patch 4/5)
- Rename phandle from ti,vip-clk-polarity to ti,ctrl-module and explain why this is required by the device (Patch 4/5)
- Make the phandle verifiable instead of just descriptive (Patch 4/5)
- Drop entire sensor node from example DT (Patch 4/5)
- Fix ports hierarchy using appropriate references and descriptions (Patch 4/5)
- Use generic node names (Patch 4/5)
- Use dev_err_probe() instead of dev_err() (Patch 5/5)
- Remove functionality that identifies instance ID using label (Patch 5/5)

Hans:
- Do not fill bus_info in vip_querycap (Patch 5/5)
- Change "camera" to "Camera" in vip_enuminput (Patch 5/5)
- Add vb2_is_busy() check in vip_s_std function (Patch 5/5)
- Remove compose since the hardware does not support it (Patch 5/5)
- Add check for s->target in vip_s_selection function (Patch 5/5)
- Drop wait_prepare/wait_finish callbacks (Patch 5/5)
- Remove v4l2_dbg prints that only log the called ioctl (Patch 5/5)
- Drop the maintainer’s patch since it was already accepted

- Add two new properties ti,vip-pixel-mux and ti,vip-channels with appropriate types and descriptions (Patch 4/5)
- If the input matches the current video standard in vip_s_std, then return (Patch 5/5)

v4l2-compliance output: https://gist.github.com/Yemike-Abhilash-Chandra/cdab5a066bdca54034eb1168e5218e79
v4l2-compliance with -s: https://gist.github.com/Yemike-Abhilash-Chandra/51c70ab2bc00b7f0ae3224c9aefacb54
Test logs: https://gist.github.com/Yemike-Abhilash-Chandra/14b8e88237aa932cb5a44c728701bb1b
DT binding check results: https://gist.github.com/Yemike-Abhilash-Chandra/97240db08d3d83d1c51d91aa7a05201e
(No errors related to ti,vip.yaml)

Link for v2: https://lore.kernel.org/all/20250716111912.235157-1-y-abhilashchandra@ti.com/

Dale Farnsworth (2):
  dt-bindings: media: ti: vpe: Add support for Video Input Port
  media: ti-vpe: Add the VIP driver

Yemike Abhilash Chandra (3):
  Revert "media: platform: ti: Remove unused vpdma_update_dma_addr"
  media: platform: ti: Add kerneldoc for vpdma_update_dma_addr()
  media: platform: ti: Switch to EXPORT_SYMBOL_GPL()

 .../devicetree/bindings/media/ti,vip.yaml     |  178 +
 MAINTAINERS                                   |    1 +
 drivers/media/platform/ti/Kconfig             |   13 +
 drivers/media/platform/ti/vpe/Makefile        |    2 +
 drivers/media/platform/ti/vpe/vip.c           | 3768 +++++++++++++++++
 drivers/media/platform/ti/vpe/vip.h           |  724 ++++
 drivers/media/platform/ti/vpe/vpdma.c         |   48 +
 drivers/media/platform/ti/vpe/vpdma.h         |    3 +
 8 files changed, 4737 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/ti,vip.yaml
 create mode 100644 drivers/media/platform/ti/vpe/vip.c
 create mode 100644 drivers/media/platform/ti/vpe/vip.h

-- 
2.34.1


