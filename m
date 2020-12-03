Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D883B2CDE2B
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 20:00:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727275AbgLCTAo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 14:00:44 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:19125 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727010AbgLCTAo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Dec 2020 14:00:44 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fc935b30008>; Thu, 03 Dec 2020 11:00:03 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 3 Dec
 2020 19:00:00 +0000
Received: from skomatineni-linux.nvidia.com (172.20.13.39) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Thu, 3 Dec 2020 18:59:59 +0000
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>
CC:     <bparrot@ti.com>, <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 00/13] tegra-video: Add support for capturing from HDMI-to-CSI bridge
Date:   Thu, 3 Dec 2020 10:59:49 -0800
Message-ID: <1607022002-26575-1-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1607022003; bh=jY8Zlq4FoiBPbmHJITN+zE+SOrzIlCzgHph0zo6yb4A=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:X-NVConfidentiality:
         MIME-Version:Content-Type;
        b=nLsr6NYcKctwUlBuM2L0NmRx/gQPsSJeMlUhiUPvpuOBaKJvWSH7cGCR3FtQnh9co
         lCzusKT4s19M/6gJz/GEu0U0cWA0g5ta70JSH8wTepG4W+lmxIko/0yOBWfO/1vyaj
         AMsIw1ibEVxH6lItHUBRrvNHYVu8I1BCMI9Uvc5hpwjEcOnQr3KUA8x8V0oCDhxUjK
         LhRURrIjGTGt9+4mi6hYgUO1J5wuVNL4L7fCGh00liB6GZjkcTfFAoMTtSN+t1d2W6
         /Vq1XlUWK1umZUGi/sDAyTJeIuJ2/xfl/Dhj0i2yxnSnbXxF++gpOEUsJWCwvyaP4f
         sX5ooMF6BHs6w==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series includes below changes to allow capturing from HDMI-to-CSI bridges.
- Add DV timing, EDID and log status V4L2 IOCTLs
- Subscribe V4L2_EVENT_SOURCE_CHANGE
- Implement V4L2 device notify callback to report queue error on source change
  during active streaming.
- Add support for NV16 V4L2 Pixel format.
- Add x8 capture by multiple ports gang up for 4K captures from HDMI-to-CSI
  bridges.

Note: These patches are tested with TC358840 HDMI-to-CSI bridge.

This series also include below fixes
- Allow format change for subdevs that don't have crop support.
- Correct V4L2 Pixel format for RGB888_1X24
- Enable VI pixel transform for YUV and RGB formats.

Delta between patch versions:
[v3]:	Includes below changes based on v2 feedback
	- Correct V4L2 pixel formats for RGB and YUV.
	- Sets V4L2_IN_CAP_DV_TIMINGS capability for v4l2 input.
	- Updates V4L2_FWNODE_CSI2_MAX_DATA_LANES to 8 and uses
	  data-lanes property of Tegra CSI device graph endpoint
	  for 8 lanes.
	- Added V4L2 custom control V4L2_CID_TEGRA_SYNCPT_TIMEOUT_RETRY
	  for HDMI-to-CSI bridge debug purposes.

[v2]:	v1 + additional patch for x8 capture support


Sowjanya Komatineni (13):
  media: tegra-video: Use zero crop settings if subdev has no
    get_selection
  media: tegra-video: Enable VI pixel transform for YUV and RGB formats
  media: tegra-video: Fix V4L2 pixel format RGB and YUV
  media: tegra-video: Add support for V4L2_PIX_FMT_NV16
  media: tegra-video: Add DV timing support
  media: tegra-video: Add support for EDID ioctl ops
  media: tegra-video: Add support for VIDIOC_LOG_STATUS ioctl
  media: tegra-video: Add support for V4L2_EVENT_SOURCE_CHANGE
  media: tegra-video: Implement V4L2 device notify callback
  media: v4l2-fwnode: Update V4L2_FWNODE_CSI2_MAX_DATA_LANES to 8
  dt-bindings: tegra: Update csi data-lanes to maximum 8 lanes
  media: tegra-video: Add support for x8 captures with gang ports
  media: tegra-video: Add custom V4L2 control
    V4L2_CID_TEGRA_SYNCPT_TIMEOUT_RETRY

 .../display/tegra/nvidia,tegra20-host1x.txt        |   4 +-
 drivers/media/platform/ti-vpe/cal-camerarx.c       |   2 +-
 drivers/staging/media/tegra-video/csi.c            |  35 ++-
 drivers/staging/media/tegra-video/csi.h            |  14 +-
 drivers/staging/media/tegra-video/tegra210.c       | 340 ++++++++++++++-------
 drivers/staging/media/tegra-video/vi.c             | 338 +++++++++++++++++---
 drivers/staging/media/tegra-video/vi.h             |  23 +-
 drivers/staging/media/tegra-video/video.c          |  18 ++
 include/media/v4l2-fwnode.h                        |   2 +-
 9 files changed, 615 insertions(+), 161 deletions(-)

-- 
2.7.4

