Return-Path: <linux-media+bounces-30408-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 118D2A9146B
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 08:56:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 207A2173A3C
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 06:56:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B95821638C;
	Thu, 17 Apr 2025 06:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="kpJa1q7O"
X-Original-To: linux-media@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842942153CD;
	Thu, 17 Apr 2025 06:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744872984; cv=none; b=GBXn8Vqv1vL3nvM4vfa73xJkv2nOgPGgoyfRL+fysnaGjLeRRFMy5ci2APvi5rVKlHHtD4zsfBIARAtEkNes2RL6UHiasxEv+dpvtzDR1dA9E00MjSPyT6zzSuj52OD6T7Yb4LCeinGKNeuMSC+PEW1sAjPgpDLzyfBDIQIaCPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744872984; c=relaxed/simple;
	bh=RdIgEse0susC7cN4FiVr6ZHyBg/3fmSwbQuMH/GA83g=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rfPI4HZL30vcaGFopiOCAwcERmd5/wPeQxAJ3aIJtWNYooBlOrJOhlGSZJbsV6y2RQe68aJR9qlRG6jckdhLE9i+fM4EurL/IuopymBVrdlPJtO88gi+Z31IZVAXmyKbdX2PWgYtJH59/K0WKwYW+tsbOPliwtlFhIehB4xuyZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=kpJa1q7O; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53H6u1362898241
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 01:56:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744872961;
	bh=TN0mfjTgvt0v7MdkHzyGH7cJJYZuD5vzSiZuAUvtAVs=;
	h=From:To:CC:Subject:Date;
	b=kpJa1q7Ocg3e9oOungPDaVTXpn4RHqH4rmACAjI2bAGv8NurItEslqIY3zYRcqLlM
	 PD/Uj2i6MNC7G+ehfSUopC1YeLCyaqOhmiMOJQVhQjkrnf+KNkzUvlqDcI/bjitGHH
	 9op7GaxdH+8zWz5sCV4mqSx+nkcANdrw+2eMT1dM=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53H6u1UI012660
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Apr 2025 01:56:01 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 17
 Apr 2025 01:56:00 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 17 Apr 2025 01:56:00 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [10.24.69.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53H6tsx0035403;
	Thu, 17 Apr 2025 01:55:55 -0500
From: Rishikesh Donadkar <r-donadkar@ti.com>
To: <jai.luthra@linux.dev>, <mripard@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <r-donadkar@ti.com>, <devarsht@ti.com>,
        <y-abhilashchandra@ti.com>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <vaishnav.a@ti.com>,
        <s-jain1@ti.com>, <vigneshr@ti.com>, <sakari.ailus@linux.intel.com>,
        <hverkuil-cisco@xs4all.nl>, <tomi.valkeinen@ideasonboard.com>,
        <jai.luthra@ideasonboard.com>, <changhuang.liang@starfivetech.com>,
        <jack.zhu@starfivetech.com>, <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v3 00/13] media: cadence,ti: CSI2RX Multistream Support
Date: Thu, 17 Apr 2025 12:25:41 +0530
Message-ID: <20250417065554.437541-1-r-donadkar@ti.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

This series adds multi-stream support for Cadence CSI2RX and TI CSI2RX
Shim drivers.

PATCH 1-6:	Support multiple DMA contexts/video nodes in TI CSI2RX
PATCH 7-8:	Use get_frame_desc to propagate virtual channel information 
            across Cadence and TI CSI-RX subdevs
PATCH 9-11:	Use new multi-stream APIs across the drivers to support
            multiplexed cameras from sources like UB960 (FPDLink)
PATCH 12:	Optimize stream on by submitting all queued buffers to DMA
PATCH 13:   Change the drain architecture to support multi-stream

Testing for this series has been done on top of media tree with 4x IMX219 
camera modules connected to TI's AM62A using V3 Link fusion mini board.

Overlay and defconfig changes for the same can be found below:
https://github.com/RISHI27-dot/linux/commits/u/multistream_v3/

Signed-off-by: Jai Luthra <j-luthra@ti.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---

Changes in v3:

- Drop [PATCH v2 01/13] media: cadence: csi2rx: Support runtime PM from
  v2, support for runtime PM will be added in a separate series:
  https://lore.kernel.org/all/20250224-ti_csi_pm-v1-0-8f8c29ef646d@ideasonboard.com/
- Change the drain architecture to prevent FIFO overflow in multistream
  usecases.
- With the new drain architecture, we don't need the the driver to wait 
  for userspace to start streaming on all "actively routed" video nodes 
  before starting streaming on the source. So, revert back to the capture 
  architecture where streams can be started and stopped independent 
  to each other.

- Link to (v2):
  https://lore.kernel.org/r/20240627-multistream-v2-0-6ae96c54c1c3@ti.com

Changes in v2:

- Change the multi-camera capture architecture to be similar to that of
  Tomi's RPi5 FE series, where the driver will wait for userspace to
  start streaming on all "actively routed" video nodes before starting
  streaming on the source. This simplifies things a lot from the HW
  perspective, which might run into deadlocks due to a shared FIFO
  between multiple DMA channels.

- Drop a few fixes that were posted separately and are already merged
- Fix dtschema warnings reported by Rob on [02/13]
- Fix warnings for uninitialized `used_vc` variable in cdns-csi2rx.c
- Return -EBUSY if someone updates routes for j721e-csi2rx subdev while
  streaming
- Only allow single-streams to be routed to the source pads (linked to
  video nodes) of the j721e-csi2rx device
- Squash the patches marked "SQUASH" in the v1 RFC series

- Link to RFC (v1):
  https://lore.kernel.org/r/20240222-multistream-v1-0-1837ed916eeb@ti.com

Jai Luthra (8):
  dt-bindings: media: ti,j721e-csi2rx-shim: Support 32 dma chans
  media: ti: j721e-csi2rx: separate out device and context
  media: ti: j721e-csi2rx: add a subdev for the core device
  media: ti: j721e-csi2rx: add support for processing virtual channels
  media: cadence: csi2rx: Use new enable stream APIs
  media: cadence: csi2rx: Enable multi-stream support
  media: ti: j721e-csi2rx: add multistream support
  media: ti: j721e-csi2rx: Submit all available buffers

Pratyush Yadav (4):
  media: ti: j721e-csi2rx: prepare SHIM code for multiple contexts
  media: ti: j721e-csi2rx: allocate DMA channel based on context index
  media: ti: j721e-csi2rx: get number of contexts from device tree
  media: cadence: csi2rx: add get_frame_desc wrapper

Rishikesh Donadkar (1):
  media: ti: j721e-csi2rx: Change the drain architecture for multistream

 .../bindings/media/ti,j721e-csi2rx-shim.yaml  |  39 +-
 drivers/media/platform/cadence/cdns-csi2rx.c  | 384 ++++++--
 .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 913 +++++++++++++-----
 3 files changed, 992 insertions(+), 344 deletions(-)

-- 
2.34.1


