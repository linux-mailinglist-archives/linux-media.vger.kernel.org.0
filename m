Return-Path: <linux-media+bounces-41018-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C411EB343DB
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 16:32:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 848A317129B
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 14:27:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1354B2FD1B6;
	Mon, 25 Aug 2025 14:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ZldJOsQ3"
X-Original-To: linux-media@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1E92FB983;
	Mon, 25 Aug 2025 14:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756131964; cv=none; b=WHXpbJD5wLqzeZtjrzMx/sKjeVQOFXWqdwQ1TddsfOpGuzvSD959vhmt6evoXIZta4rrdcZGI+cU6uR8aTAfIbGLYuLwIITYCI5f9Cu19fXHLWcKgyv3I0EYnUaHLFEkTB2kAP/tVaY+my1qu/tC3o0y0WlmcMhkWnmw0eCpsKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756131964; c=relaxed/simple;
	bh=+anDv4KCxAMQhb/zgI5+MkJajBqEkRpD5J1Azq9QDII=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tnYrFijAPgPx57UDsGDD5nWhHP8RFsyfAkLc7Umif094OVV879crNG6C1KWTJ+3UQvNz3hqkMIlTBhQayLONC0WKD95yuV6C0xc9l26ozw465yrVyW/4P7wqkZg81H7QOAUIDNRKtP1KN8jmbkcIctmznTjoFIFUDyHOBO0yrug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ZldJOsQ3; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57PEPU36831105;
	Mon, 25 Aug 2025 09:25:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756131930;
	bh=01wni2euBTT2L905UFnK3Ynn9iHMPxWiMJx8hw6DYUM=;
	h=From:To:CC:Subject:Date;
	b=ZldJOsQ3pABormexsA5ofZiuYgz6s7BAqxGV8NSR+WfxM7/jgaSztqPkglvtl2kIe
	 fQgwHpDne3574euz0doUYU8R4/SdpWp7gBFVAKAyxebmxvyMcxaf12mElkeaqt45Tk
	 Gw/Z/qVa/gFUxtq8gh/vLjGYIySM7ZV1duiiZMyo=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57PEPUTJ1643886
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 25 Aug 2025 09:25:30 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 25
 Aug 2025 09:25:29 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 25 Aug 2025 09:25:29 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57PEPN3n3747540;
	Mon, 25 Aug 2025 09:25:23 -0500
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
Subject: [PATCH v5 00/14] media: cadence,ti: CSI2RX Multistream Support
Date: Mon, 25 Aug 2025 19:55:08 +0530
Message-ID: <20250825142522.1826188-1-r-donadkar@ti.com>
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

The first patch is not strictly related to multistream support

PATCH 01 :    Remove word size alignment restriction on frame width

PATCH 02-07:  Support multiple DMA contexts/video nodes in TI CSI2RX
PATCH 08-09:  Use get_frame_desc to propagate virtual channel
              information across Cadence and TI CSI-RX subdevs
PATCH 10-11:  Use new multi-stream APIs across the drivers to support
              multiplexed cameras from sources like UB960 (FPDLink)
PATCH 12:     Optimize stream on by submitting all queued buffers to DMA
PATCH 13:     Change the drain architecture to support multi-stream
PATCH 14:     Use wait for completion barrier APIs to ensure clean
              stream stop

Testing for this series has been done on top of media tree with 4x IMX219
camera modules connected to TI's AM62A using V3 Link fusion mini board.

Overlay and defconfig changes for the same can be found below:
https://github.com/RISHI27-dot/linux/commits/u/multistream_v5/

v4l2-compliance results:
https://gist.github.com/Rishikesh-D/27cb682fd0e16a383552485ef899b895

This patch series depends on:
https://lore.kernel.org/all/20250811-probe_fixes-v4-0-aae22290f1d0@ideasonboard.com/#t

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

Rishikesh Donadkar (3):
  media: ti: j721e-csi2rx: Remove word size alignment on frame width
  media: ti: j721e-csi2rx: Change the drain architecture for multistream
  media: ti: j721e-csi2rx: Wait for the last drain completion

 .../bindings/media/ti,j721e-csi2rx-shim.yaml  |   39 +-
 drivers/media/platform/cadence/cdns-csi2rx.c  |  372 ++++--
 .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 1002 ++++++++++++-----
 3 files changed, 1049 insertions(+), 364 deletions(-)

-- 
2.34.1


