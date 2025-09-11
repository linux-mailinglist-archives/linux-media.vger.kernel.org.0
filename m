Return-Path: <linux-media+bounces-42291-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B4ED9B52E70
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 12:32:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D8581C86BD5
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 10:32:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1C743115A0;
	Thu, 11 Sep 2025 10:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="VNrwbj7X"
X-Original-To: linux-media@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E09930C354;
	Thu, 11 Sep 2025 10:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757586568; cv=none; b=G3Kgo4mFxn97l7ezZqMAorOrMgFx7Q4/MkqsrIyYUmWgM5ScsNMOVe9uETz98SImkC+RMKk8xAUFTcCxKW3Bl643KOQnxSgQ4JLCtCLmJtU98DvaYQrjTOhHgfT9mzceBid+EPOGrdjmz0ryikp1MKF2++McuiBPnXpYAQIA+KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757586568; c=relaxed/simple;
	bh=Pa3T9CD86CniqpLGRmc3QhKXiw9OEiy1ZSKkbHCt+MI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GWEIhDaECK7YLS48q4/ugLTfKDYIfyWxQk4NHhz3eLjqdaa1JPVLIeWjhxbSxWYb4raTXzclf+Xpg+gCcEA47DZ838O6inkE1VS98EtFA+CiOdij93wSfroGU4tVn535tqBe8+ZoFAVf7/aBUiS/09hBHznXSnVYstmoWk3tW20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=VNrwbj7X; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58BASf6B273328;
	Thu, 11 Sep 2025 05:28:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757586521;
	bh=8yP2HiFDeTQcblcHvBsZphoo/SWdYfYKcCYjtYb8jkQ=;
	h=From:To:CC:Subject:Date;
	b=VNrwbj7XjwLiydcEwqq4Dc5A01uH38yQeUmLwuJMlRPsr/T/7E3bwgaKLUL6rM/n8
	 pc+t87TQPzCLtl93g8aDwk9do5xqkdpqW1hypUoMsaxYDihlmEE9OqDdsEpn99Ltz5
	 8P3EGT/UvWXRssqK26TKtkRvia3oYxcJmcswWWwY=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58BASfiI1875266
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 11 Sep 2025 05:28:41 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 11
 Sep 2025 05:28:40 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 11 Sep 2025 05:28:40 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58BASXbe1985821;
	Thu, 11 Sep 2025 05:28:34 -0500
From: Rishikesh Donadkar <r-donadkar@ti.com>
To: <jai.luthra@linux.dev>, <laurent.pinchart@ideasonboard.com>,
        <mripard@kernel.org>
CC: <r-donadkar@ti.com>, <y-abhilashchandra@ti.com>, <devarsht@ti.com>,
        <s-jain1@ti.com>, <vigneshr@ti.com>, <mchehab@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <p.zabel@pengutronix.de>,
        <conor+dt@kernel.org>, <sakari.ailus@linux.intel.com>,
        <hverkuil-cisco@xs4all.nl>, <tomi.valkeinen@ideasonboard.com>,
        <jai.luthra@ideasonboard.com>, <changhuang.liang@starfivetech.com>,
        <jack.zhu@starfivetech.com>, <sjoerd@collabora.com>,
        <hverkuil+cisco@kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v7 00/16] media: cadence,ti: CSI2RX Multistream Support
Date: Thu, 11 Sep 2025 15:58:16 +0530
Message-ID: <20250911102832.1583440-1-r-donadkar@ti.com>
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

This series adds multi-stream support and PM support for Cadence CSI2RX
and TI CSI2RX SHIM drivers.

PM patches are picked from:
https://lore.kernel.org/all/20250902-ti_csi_pm-v2-0-59a3be199940@ideasonboard.com/

PATCH 01 :    Remove word size alignment restriction on frame width
PATCH 02-07:  Support multiple DMA contexts/video nodes in TI CSI2RX
PATCH 08-09:  Use get_frame_desc to propagate virtual channel
              information across Cadence and TI CSI-RX subdevs
PATCH 10-11:  Use new multi-stream APIs across the drivers to support
              multiplexed cameras from sources like UB960 (FPDLink)
PATCH 12:     Optimize stream on by submitting all queued buffers to DMA
PATCH 13:     Change the drain architecture to support multi-stream and
              implement completion barriers for last drain.
PATCH 14-16:  Runtime PM and System PM support for CSI-RX.

Testing for this series has been done on top of media tree with 4x IMX219
camera modules connected to TI's AM62A using V3 Link fusion mini board.

Overlay and defconfig changes for the same can be found below:
https://github.com/RISHI27-dot/linux/commits/u/multistream_v7/

v4l2-compliance results:
https://gist.github.com/Rishikesh-D/f51e2e17022cd7fbf449f5ad90ff08ba

---
Changes in v7:

[PATCH v6 03/16] media: ti: j721e-csi2rx: separate out device and context
- Resolve bisect test fail because of undefined 'csi' variable
- Resolve bisect test fail because of 'vdev' not being in scope when used
[PATCH v6 07/16] media: ti: j721e-csi2rx: get number of contexts from device tree
- Resolve compiler warning regarding missing error code 'ret'
[PATCH v6 12/16] media: ti: j721e-csi2rx: Submit all available buffers
- Remove unused variable

Link to (v6):
https://lore.kernel.org/all/20250908134729.3940366-1-r-donadkar@ti.com/

---
Changes in v6:

# New patches in v6:

[PATCH v6 14/16] media: cadence: csi2rx: Support runtime PM
[PATCH v6 15/16] media: ti: j721e-csi2rx: Support runtime suspend
[PATCH v6 16/16] media: ti: j721e-csi2rx: Support system suspend
using pm_notifier

# Changes in patches from v5:
[PATCH v5 01/16] media: ti: j721e-csi2rx: Remove word size alignment
on frame width
- Remove restrictions on minimum frame width in ti_csi2rx_fill_fmt()
- Add Reviewed-by from Abhilash
[PATCH v5 02/16] dt-bindings: media: ti,j721e-csi2rx-shim: Support 32 dma chans
- No change
[PATCH v5 03/16] media: ti: j721e-csi2rx: separate out device and context
- No change
[PATCH v5 04/16] media: ti: j721e-csi2rx: prepare SHIM code for multiple contexts
- No change
[PATCH v5 05/16] media: ti: j721e-csi2rx: allocate DMA channel based on context index
- No change
[PATCH v5 06/16] media: ti: j721e-csi2rx: add a subdev for the core device
- No change
[PATCH v5 07/16] media: ti: j721e-csi2rx: get number of contexts from device tree
- Solve compilation warnings
[PATCH v5 08/16] media: cadence: csi2rx: add get_frame_desc wrapper
- No change
[PATCH v5 09/16] media: ti: j721e-csi2rx: add support for processing virtual channels
- Remove unnecessary call to v4l2_unlock_state()
[PATCH v5 10/16] media: cadence: csi2rx: add multistream support
- No change
[PATCH v5 11/16] media: ti: j721e-csi2rx: add multistream support
- No change
[PATCH v5 12/16] media: ti: j721e-csi2rx: Submit all available buffers
- No change
[PATCH v5 13/16] media: ti: j721e-csi2rx: Change the drain architecture for multistream
- Squash implementation of completion barriers for last drain cycle
- Make struct completion per ctx

Link to (v5):
https://lore.kernel.org/all/20250825142522.1826188-1-r-donadkar@ti.com/

---
Changes in v5:

# New patches in v5:

[PATCH v5 01/14] media: ti: j721e-csi2rx: Remove word size alignment
[PATCH v5 14/14] media: ti: j721e-csi2rx: Wait for the last drain

# Changes in patches from v4:

[PATCH v4 01/12] dt-bindings: media: ti,j721e-csi2rx-shim: Support 32 dma chans
- No change
[PATCH v4 02/12] media: ti: j721e-csi2rx: separate out device and context
- No change
[PATCH v4 03/12] media: ti: j721e-csi2rx: prepare SHIM code for multiple contexts
- No change
[PATCH v4 04/12] media: ti: j721e-csi2rx: allocate DMA channel based on context index
- No change
[PATCH v4 05/12] media: ti: j721e-csi2rx: add a subdev for the core device
- No change
[PATCH v4 06/12] media: ti: j721e-csi2rx: get number of contexts from device tree
- No change
[PATCH v4 07/12] media: cadence: csi2rx: add get_frame_desc wrapper
- No change
[PATCH v4 08/12] media: ti: j721e-csi2rx: add support for processing virtual channels
- No change
[PATCH v4 09/12] media: cadence: csi2rx: add multistream support
- No change
[PATCH v4 10/12] media: ti: j721e-csi2rx: add multistream support
- Serialize stream stop
- Remove the break statement to avoid early return in the loop, as
  reported by Sjoerd
[PATCH v4 11/12] media: ti: j721e-csi2rx: Submit all available buffers
- Delete the list node on DMA error to avoid kernel panic
[PATCH v4 12/12] media: ti: j721e-csi2rx: Change the drain architecture for multistream
- Mention about next frame after drain being bogus

Link to (v4):
  https://lore.kernel.org/all/20250514112527.1983068-1-r-donadkar@ti.com/

Changes in v4:

[PATCH 01/13] dt-bindings: media: ti,j721e-csi2rx-shim: Support 32 dma chans
  - No change
[PATCH 02/13] media: ti: j721e-csi2rx: separate out device and context
  - Add ctx identifier in the dev_err() message
  - No change
[PATCH 03/13] media: ti: j721e-csi2rx: prepare SHIM code for multiple contexts
  - Reduced the name string lenght from 32 chars to 5 chars
[PATCH 04/13] media: ti: j721e-csi2rx: allocate DMA channel based on context index
  - No change
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

Changhuang Liang (1):
  media: cadence: csi2rx: Support runtime PM

Jai Luthra (9):
  dt-bindings: media: ti,j721e-csi2rx-shim: Support 32 dma chans
  media: ti: j721e-csi2rx: separate out device and context
  media: ti: j721e-csi2rx: add a subdev for the core device
  media: ti: j721e-csi2rx: add support for processing virtual channels
  media: cadence: csi2rx: add multistream support
  media: ti: j721e-csi2rx: add multistream support
  media: ti: j721e-csi2rx: Submit all available buffers
  media: ti: j721e-csi2rx: Support runtime suspend
  media: ti: j721e-csi2rx: Support system suspend using pm_notifier

Pratyush Yadav (4):
  media: ti: j721e-csi2rx: prepare SHIM code for multiple contexts
  media: ti: j721e-csi2rx: allocate DMA channel based on context index
  media: ti: j721e-csi2rx: get number of contexts from device tree
  media: cadence: csi2rx: add get_frame_desc wrapper

Rishikesh Donadkar (2):
  media: ti: j721e-csi2rx: Remove word size alignment on frame width
  media: ti: j721e-csi2rx: Change the drain architecture for multistream

 .../bindings/media/ti,j721e-csi2rx-shim.yaml  |   39 +-
 drivers/media/platform/cadence/Kconfig        |    1 +
 drivers/media/platform/cadence/cdns-csi2rx.c  |  491 +++++--
 drivers/media/platform/ti/Kconfig             |    1 +
 .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 1167 +++++++++++++----
 5 files changed, 1300 insertions(+), 399 deletions(-)

-- 
2.34.1


