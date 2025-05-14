Return-Path: <linux-media+bounces-32464-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B67AAB69C1
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 13:26:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC28517B4B5
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 11:26:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DB2027467B;
	Wed, 14 May 2025 11:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="uvt3+tzm"
X-Original-To: linux-media@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3964342A82;
	Wed, 14 May 2025 11:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747221968; cv=none; b=hp4EKA8J8C3juV2Xfw1TTG+JwepxgJy6Ci0C/oflRjaltPDxFY90mzOqgj66VBil5p+pMeIMhm8DAIpik/JYm8JSvFoyOSxT47S6j1MRIbRhJ6MK7O4sXjkpy30D/YXjQ5rOrhgmimKvvRqFmtpBubXuefI29P/BkFm2ITpwXKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747221968; c=relaxed/simple;
	bh=6Es3TSn+9TBgkKBVy9/057O5E2HKdAbufSTal0Abt0M=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=e6s6i/vGfZf3pIggMTjIYSzqt0H6tdzKwmxc27fAjMbZBEhL2GAJ9qIAoIoQGVhngPZWDa5fKQgT2AID+kDGzYkU57SKDIp1T34guEjvJSkwkEhb6FKyraLRGjw3O8UBZJO6j4Ly7W9vrHvH9TstVDIijFM52sz+JUFymt2JFfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=uvt3+tzm; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 54EBPZDM3126758
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 May 2025 06:25:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747221935;
	bh=9iHE5FSyMX7LDgx8S9Lh0j23+vUZqY7ICZe0fWhMXys=;
	h=From:To:CC:Subject:Date;
	b=uvt3+tzm1qnIr0y1GDFRyhaxTpC0bWXKh8eZMoiucBjIu38h8ZqrOMJmPJMHIu8I1
	 8Y6CoXFoIGvtG3YWt+EtZl8PHmYthEAmwrjWje/1icCjoBHODRg1o35zAz0qp2TYc7
	 3c8oYiZeM/00XYgr/cWoKHRu6UlnPXQALiZxujFw=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 54EBPZ74119976
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 14 May 2025 06:25:35 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 14
 May 2025 06:25:34 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 14 May 2025 06:25:34 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [10.24.69.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54EBPSV6107507;
	Wed, 14 May 2025 06:25:29 -0500
From: Rishikesh Donadkar <r-donadkar@ti.com>
To: <jai.luthra@linux.dev>, <laurent.pinchart@ideasonboard.com>,
        <mripard@kernel.org>
CC: <r-donadkar@ti.com>, <y-abhilashchandra@ti.com>, <devarsht@ti.com>,
        <vaishnav.a@ti.com>, <s-jain1@ti.com>, <vigneshr@ti.com>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <sakari.ailus@linux.intel.com>,
        <hverkuil-cisco@xs4all.nl>, <tomi.valkeinen@ideasonboard.com>,
        <jai.luthra@ideasonboard.com>, <changhuang.liang@starfivetech.com>,
        <jack.zhu@starfivetech.com>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v4 00/12] media: cadence,ti: CSI2RX Multistream Support
Date: Wed, 14 May 2025 16:55:15 +0530
Message-ID: <20250514112527.1983068-1-r-donadkar@ti.com>
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
SHIM drivers.

PATCH 1-6:  Support multiple DMA contexts/video nodes in TI CSI2RX
PATCH 7-8:  Use get_frame_desc to propagate virtual channel
            information across Cadence and TI CSI-RX subdevs
PATCH 9-10: Use new multi-stream APIs across the drivers to support
            multiplexed cameras from sources like UB960 (FPDLink)
PATCH 11:   Optimize stream on by submitting all queued buffers to DMA
PATCH 12:   Change the drain architecture to support multi-stream

Testing for this series has been done on top of media tree with 4x IMX219
camera modules connected to TI's AM62A using V3 Link fusion mini board.

Overlay and defconfig changes for the same can be found below:
https://github.com/RISHI27-dot/linux/commits/u/multistream_v4

v4l2-compliance results:
https://gist.github.com/Rishikesh-D/4ddf957da2f62191eefe7a9e5ff212ab

---
Changes in v4:

[PATCH 01/13] dt-bindings: media: ti,j721e-csi2rx-shim: Support 32 dma chans
  - No change
[PATCH 02/13] media: ti: j721e-csi2rx: separate out device and context
  - Add ctx identifier in the dev_err() message
  - No change
[PATCH 04/13] media: ti: j721e-csi2rx: prepare SHIM code for multiple contexts
  - Reduced the name string lenght from 32 chars to 5 chars
[PATCH 05/13] media: ti: j721e-csi2rx: add a subdev for the core device
  - Add .enum_mbus_code callback
  - Replace statically allocated struct with a global static const struct
    v4l2_mbus_framefmt and used that in the _init_state() function
[PATCH 06/13] media: ti: j721e-csi2rx: get number of contexts from device tree
  - Fix the drain buffer being leaked
  - If the shows more number of ctx than the TI_CSI2RX_MAX_CTX, return an error
    instead of warning
[PATCH 07/13] media: cadence: csi2rx: add get_frame_desc wrapper
  - No change
[PATCH 08/13] media: ti: j721e-csi2rx: add support for processing virtual channels
  - Call ti_csi2rx_get_vc() only once on first stream start and cache the VC data in
    the driver, use the corresponding VC in all subsequent stream starts.
[PATCH 09/13] media: cadence: csi2rx: Use new enable stream APIs
[PATCH 10/13] media: cadence: csi2rx: Enable multi-stream support
  - Squash the above two patches into
    [PATCH v4 09/12] media: cadence: csi2rx: add multistream support
  - Use already obtained csi2rx->source_pad in enable_streams() and
    disable_streams() call
  - Update commit message with the reason for using a custom helper for s_stream
    instead of v4l2_subdev_s_stream_helper()
  - Use v4l2_get_link_freq() variant that takes pad of the source as its first
    argument instead of the one that takes v4l2_ctrl_handler
  - Call v4l2_get_link_freq() with bpp = 0 to prevent fallback to V4L2_CID_PIXEL_RATE
    in multi-stream case
  - Use lock guards to simplify error handling
  - Call csi2rx_update_vc_select() at first stream start before enabling the controller
[PATCH 11/13] media: ti: j721e-csi2rx: add multistream support
  - No change
[PATCH 12/13] media: ti: j721e-csi2rx: Submit all available buffers
  - No change
[PATCH 13/13] media: ti: j721e-csi2rx: Change the drain architecture for multistream
  - Fix checkpatch warning
  - Change commit message to give a better description of the patch

Link to (v3):
  https://lore.kernel.org/all/20250417065554.437541-1-r-donadkar@ti.com/

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

Link to (v2):
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

Link to RFC (v1):
https://lore.kernel.org/r/20240222-multistream-v1-0-1837ed916eeb@ti.com


Jai Luthra (7):
  dt-bindings: media: ti,j721e-csi2rx-shim: Support 32 dma chans
  media: ti: j721e-csi2rx: separate out device and context
  media: ti: j721e-csi2rx: add a subdev for the core device
  media: ti: j721e-csi2rx: add support for processing virtual channels
  media: cadence: csi2rx: add multistream support
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
 drivers/media/platform/cadence/cdns-csi2rx.c  | 372 +++++--
 .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 958 +++++++++++++-----
 3 files changed, 1025 insertions(+), 344 deletions(-)

-- 
2.34.1


