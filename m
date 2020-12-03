Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 494BE2CDE58
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 20:04:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2501984AbgLCTBb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 14:01:31 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:18470 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731806AbgLCTBa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Dec 2020 14:01:30 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fc935c10000>; Thu, 03 Dec 2020 11:00:17 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 3 Dec
 2020 19:00:14 +0000
Received: from skomatineni-linux.nvidia.com (172.20.13.39) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Thu, 3 Dec 2020 19:00:12 +0000
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>
CC:     <bparrot@ti.com>, <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 10/13] media: v4l2-fwnode: Update V4L2_FWNODE_CSI2_MAX_DATA_LANES to 8
Date:   Thu, 3 Dec 2020 10:59:59 -0800
Message-ID: <1607022002-26575-11-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607022002-26575-1-git-send-email-skomatineni@nvidia.com>
References: <1607022002-26575-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1607022017; bh=0r1CsjXAcGhStr4lTll4w2YEjN3lzY3myJy7gJpTSd0=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:X-NVConfidentiality:MIME-Version:Content-Type;
        b=FLA6zt4bNo4HUuBxxWxqVcnEn/mDagSr61KhfzzFhxTii8sn0v6S0WM1dzxZb7Yxf
         lu8xoIfsDM2g7b6AQr5bVlT9nm3ryIUbOsTtshMZK6rtd5q/rrybctr98wiCyo5cix
         76k0s94mD4c41bky/oqv2dqCKQsbyQhLere7JaSsCMy15Wq+h5HsJ05eAhHBwpzB4b
         dEq29VGh9FJJ9Yu2c6gMyWT4TKprGpukzSupuPZ9PhAO3D7aU5viNZdnOHObqetGhG
         ptJEnXccaI0OB2hv3DxR4D3eZIL5ISi/g1TWlFtYQKa+xzO7pal76nSlIFS4uKkxeC
         1oz6iDIXZcU8A==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some CSI2 receivers support 8 data lanes.

So, this patch updates CSI2 maximum data lanes to be 8.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/media/platform/ti-vpe/cal-camerarx.c | 2 +-
 include/media/v4l2-fwnode.h                  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal-camerarx.c b/drivers/media/platform/ti-vpe/cal-camerarx.c
index 806cbf1..47e2143 100644
--- a/drivers/media/platform/ti-vpe/cal-camerarx.c
+++ b/drivers/media/platform/ti-vpe/cal-camerarx.c
@@ -534,7 +534,7 @@ static int cal_camerarx_parse_dt(struct cal_camerarx *phy)
 {
 	struct v4l2_fwnode_endpoint *endpoint = &phy->endpoint;
 	struct device_node *ep_node;
-	char data_lanes[V4L2_FWNODE_CSI2_MAX_DATA_LANES * 2];
+	char data_lanes[V4L2_FWNODE_CSI2_MAX_DATA_LANES];
 	unsigned int i;
 	int ret;
 
diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
index 4e1f6e1d..92401c1 100644
--- a/include/media/v4l2-fwnode.h
+++ b/include/media/v4l2-fwnode.h
@@ -25,7 +25,7 @@ struct fwnode_handle;
 struct v4l2_async_notifier;
 struct v4l2_async_subdev;
 
-#define V4L2_FWNODE_CSI2_MAX_DATA_LANES	4
+#define V4L2_FWNODE_CSI2_MAX_DATA_LANES	8
 
 /**
  * struct v4l2_fwnode_bus_mipi_csi2 - MIPI CSI-2 bus data structure
-- 
2.7.4

