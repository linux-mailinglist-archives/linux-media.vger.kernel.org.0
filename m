Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28A6729A320
	for <lists+linux-media@lfdr.de>; Tue, 27 Oct 2020 04:20:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504538AbgJ0DT0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Oct 2020 23:19:26 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:18911 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2441488AbgJ0DT0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Oct 2020 23:19:26 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f9791c50000>; Mon, 26 Oct 2020 20:19:33 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 27 Oct
 2020 03:19:25 +0000
Received: from skomatineni-linux.nvidia.com (172.20.13.39) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Tue, 27 Oct 2020 03:19:25 +0000
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <hverkuil@xs4all.nl>
CC:     <mchehab@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 00/10] media: tegra-video: Add support for capturing from HDMI-to-CSI bridge
Date:   Mon, 26 Oct 2020 20:19:13 -0700
Message-ID: <1603768763-25590-1-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1603768773; bh=/fOSfK9LaPPgd8dFjYt+YucOUv6hsn5otzeyWCnAirg=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:X-NVConfidentiality:
         MIME-Version:Content-Type;
        b=YRoeOtCnmW7L9x29hxLP4nIFZ7q/MIDbBonBi/yES2DqWIJr6m/9dblHVaXAYN4qy
         NhpR8zRuR7/jSvIF69xU+6bV4jK58gdqKZqqTfF2S4ynHAltaRqKEtJMHXwI+iPSCM
         SFcyQQoiOKZkv1dL+daPlacfZH6M2u6lCLRiIoi6F/3CrsNz7bOq0GSLM+YKj5dyPm
         U69ukyhhNex2rJ/XEkNDFNryIsk3hySB8V1/2lo0RBEfOJfKSB4xFY6KJ+pC0E1qV5
         l8K5qz1wPCEJVSJ4iJiV2kMDbaXzqwO7a+1t4ItP/fkZYwyisEzbFT+1FhLKKgseXR
         01LHonRFDM7dw==
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
[v2]:	v1 + additional patch for x8 capture support


Sowjanya Komatineni (10):
  media: tegra-video: Use zero crop settings if subdev has no
    get_selection
  media: tegra-video: Enable VI pixel transform for YUV and RGB formats
  media: tegra-video: Fix V4L2 pixel format for RGB888_1X24
  media: tegra-video: Add support for V4L2_PIX_FMT_NV16
  media: tegra-video: Add DV timing support
  media: tegra-video: Add support for EDID ioctl ops
  media: tegra-video: Add support for VIDIOC_LOG_STATUS ioctl
  media: tegra-video: Add support for V4L2_EVENT_SOURCE_CHANGE
  media: tegra-video: Implement V4L2 device notify callback
  media: tegra-video: Add support for x8 captures with gang ports

 drivers/staging/media/tegra-video/csi.c      |  47 +++-
 drivers/staging/media/tegra-video/csi.h      |  14 +-
 drivers/staging/media/tegra-video/tegra210.c | 312 +++++++++++++++++++--------
 drivers/staging/media/tegra-video/vi.c       | 288 +++++++++++++++++++++----
 drivers/staging/media/tegra-video/vi.h       |  17 +-
 drivers/staging/media/tegra-video/video.c    |  18 ++
 6 files changed, 547 insertions(+), 149 deletions(-)

-- 
2.7.4

