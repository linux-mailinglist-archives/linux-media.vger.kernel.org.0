Return-Path: <linux-media+bounces-49286-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC87CD4F1D
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 09:16:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E29F4300C0F1
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 08:16:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BAEF266EE9;
	Mon, 22 Dec 2025 08:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HOdcAyPP"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B82249EB;
	Mon, 22 Dec 2025 08:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766391363; cv=none; b=GMElSH3CW8FaxV3pH0R0cwFdCIiT0rJ4mf/Nxrt57aiqJYjb2KvGYWZdiAluAvAz6dTYo1Mlu0JMgl/GOkCgoe+TF+ffbuocFL49qcGIvpILBUL3Eut/SzqyO1kpSv8TDIKJhmI+4zTYo6kJblaDnUbernSPSE+iOxJKWmy5L9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766391363; c=relaxed/simple;
	bh=5MHnsyD89NROSfexwZ1Dtrw/+AKtFeDxCn/EqKpiCWQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=c8vz2f/0YKfXEgGhoubg78APJGOCo33Wk6pLOiy6Tj7o/HXclbcSHRJRrraU8FpJDrRzHpI+IOIJ5K3/01bu3cSmBVOFw+wYdJHf3I4ZjARlBjAb9BM0aig9i7327Ycem5qV92GHGufKN3laoue9/OIhZnPncgvBqT5m9vhWgWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HOdcAyPP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:aa51:d08b:9316:9524:9005])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CB0E0E1F;
	Mon, 22 Dec 2025 09:15:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1766391342;
	bh=5MHnsyD89NROSfexwZ1Dtrw/+AKtFeDxCn/EqKpiCWQ=;
	h=From:Subject:Date:To:Cc:From;
	b=HOdcAyPPiFUgtCMGxl9rVFu5RGR+BW+moF5363HnJHcgImbeySg0hIVn6+QmR0xhm
	 lgr4k9pejsswqZhBdNiNkLQCb9B8+0r0z7C744al7VccOYf3/2IwnIkvvbHY6FHh4+
	 wNFpEKvNjxHLQSZczWdzpykzXyP1AuIROi6r2Q3E=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH v4 00/17] media: i2c: Miscellaneous features and fixes for
 OV5647
Date: Mon, 22 Dec 2025 13:45:24 +0530
Message-Id: <20251222-b4-rpi-ov5647-v4-0-b949c7309280@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABz+SGkC/3XQwW7CMAwG4Fepcl6mxHGawIn3mHZoUnfkQANJi
 TYh3n0GhJBgO/62/k+yT6JSSVTFujuJQi3VlGcO+NaJuB3mL5Jp5CxAgdUKUAaUZZ9kbrZHJ5U
 NvVLOeteD4M6+0JS+r97HJ+dtqksuP1e+6cv0LvknqWmppFp51AYtTpY2aaSh5jnkoYzvMe/EB
 WzwQLR+QYARS86Ti8FNq/APYh4IaPuMGEYwgiUTvTcB/kDOt1sLHY78suV2sAhDJcn7XVrWnZ9
 UwBgJ0WsunH8BhrRoMGsBAAA=
X-Change-ID: 20251024-b4-rpi-ov5647-05b600758762
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Naushir Patuck <naush@raspberrypi.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 David Plowman <david.plowman@raspberrypi.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Peter Robinson <pbrobinson@gmail.com>, Stefan Wahren <wahrenst@gmx.net>, 
 "Ivan T. Ivanov" <iivanov@suse.de>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3243;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=5MHnsyD89NROSfexwZ1Dtrw/+AKtFeDxCn/EqKpiCWQ=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpSP4gun4xQxrKTu8RJoSPUZSKFt4Oktq6ZTUs+
 ttc6/1fez2JAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaUj+IAAKCRBD3pH5JJpx
 RfEGD/0Xd92pMqQUYgTGVojne5TFKtBni5vhUiB65p0vUQmDqOxfOVoTy5TW8ozXNN+oikrqfr3
 Y+seNRF9CKQw85ZIjlrlIVmzlNN9IYPToISpkMtD+FjmeUc3PU07LialaGb6oX13iQtoDa30iUZ
 +KF+oG10BDq2Jw+KO1BkIKwxfNaz01x5rlVRDl7eOdOjOMINOTPDAA2bFPvrBP+8lNKFrjc+K3r
 FZq1bo1IEUO4nasGuiE0yGsFBb5FnrDim4CfwaLmm1pTE8nv1HymVyxvi4aD0PIYpnXr/5gRKNF
 5jCMVbYqFPb3tfeJBCL3T/8WsuoCSGpeqcUm0rtZXlkXr/ikvaZGez5BnakC0ySJoS8AOYMUMdt
 MtWnDgm5kGjNtd3OqXwPRkO0F7JxHVhYS0jiC3/RjOJ7ot2Q85dw/ije4x91EiUyZh1LFFRwWvy
 2vGpm7btALL7TMfU0d91AEmimMtOqGou177XaoH9BaFCw+uOgPLxA7dJbKS2R4zziI9NO+zMHlz
 Hca1ZxYYcV0NBysGadyO2Amsekl7uXkbXZs0qeYtDX4LXhoGHEnucCVnnzP9vtrJctglgL4J2zJ
 R/mPCns+wsqIbWdeJFlap2nS/DhdmmauUzOk+9Zj4GGoRujI+PmDIHZH066zmaI8GC56jmxDTRi
 PtzcpIjB/mF968w==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

This series adds support for some important features, like controls for
H/VFLIP, horizontal blanking, link frequency and regulator support that
is present in the downstream kernel to support the Raspberry Pi v1 camera
module.

Additionally, it also fixes some known issues with streaming lockups and
wrong pixel array size.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Changes in v4:
- Separate out fix for VGA mode's pixel rate as [PATCH 5/17]
- Use correct link frequency for VGA mode in [PATCH 17/17]
- Link to v3: https://lore.kernel.org/r/20251215-b4-rpi-ov5647-v3-0-4c25e3c883b2@ideasonboard.com

Changes in v3:
- Match the default register value in all mode tables with the default
  value for the horizontal flip control (i.e. 0x3281[1] = 1)
- Update pixel rate for VGA mode as discussed in [PATCH v1 13/13]
- Set default link frequency value using the default mode as Jacopo
  suggested in v2
- Add review/ack tags from Dave, Jacopo and Krzysztof
- Link to v2: https://lore.kernel.org/r/20251118-b4-rpi-ov5647-v2-0-5e78e7cb7f9b@ideasonboard.com

Changes in v2:
- Drop [PATCH 4/13] as it is already present in mainline
- Add a fix for a potential segfault by reordering ov5647_init_controls
  after v4l2_i2c_subdev_init in the probe
- Add 2 new patches updating dt-bindings for regulators and
  rotation/orientation
- Add a patch for cleaning up the PIXEL_RATE control
- Reorder the patches in the series, moving all fixes at the start
- Fix review comments from Jacopo, Stefan, Kieran and Dave, picking
  Jacopo's R-by tag on a few patches
- Link to v1: https://lore.kernel.org/r/20251028-b4-rpi-ov5647-v1-0-098413454f5e@ideasonboard.com

---
Dave Stevenson (7):
      media: i2c: ov5647: Add support for regulator control
      media: i2c: ov5647: Use v4l2_async_register_subdev_sensor for lens binding
      media: i2c: ov5647: Add control of V4L2_CID_HBLANK
      media: i2c: ov5647: Tidy up mode registers to make the order common
      media: i2c: ov5647: Separate out the common registers.
      media: i2c: ov5647: Use the same PLL config for full, 1080p, and binned modes
      media: i2c: ov5647: Add V4L2_CID_LINK_FREQUENCY control

David Plowman (4):
      media: i2c: ov5647: Correct pixel array offset
      media: i2c: ov5647: Correct minimum VBLANK value
      media: i2c: ov5647: Sensor should report RAW color space
      media: i2c: ov5647: Support HFLIP and VFLIP

Jai Luthra (5):
      media: i2c: ov5647: Initialize subdev before controls
      media: i2c: ov5647: Fix PIXEL_RATE value for VGA mode
      dt-bindings: media: ov5647: Add optional regulators
      dt-bindings: media: ov5647: Allow props from video-interface-devices
      media: i2c: ov5647: Tidy up PIXEL_RATE control

Laurent Pinchart (1):
      media: i2c: ov5647: Parse and register properties

 .../devicetree/bindings/media/i2c/ovti,ov5647.yaml |  14 +-
 drivers/media/i2c/ov5647.c                         | 465 ++++++++++-----------
 2 files changed, 235 insertions(+), 244 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251024-b4-rpi-ov5647-05b600758762

Best regards,
-- 
Jai Luthra <jai.luthra@ideasonboard.com>


