Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F5F82CDE47
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 20:03:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389305AbgLCTA7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 14:00:59 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:19190 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389144AbgLCTA5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Dec 2020 14:00:57 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fc935c10000>; Thu, 03 Dec 2020 11:00:17 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 3 Dec
 2020 19:00:15 +0000
Received: from skomatineni-linux.nvidia.com (172.20.13.39) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Thu, 3 Dec 2020 19:00:14 +0000
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>
CC:     <bparrot@ti.com>, <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 11/13] dt-bindings: tegra: Update csi data-lanes to maximum 8 lanes
Date:   Thu, 3 Dec 2020 11:00:00 -0800
Message-ID: <1607022002-26575-12-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607022002-26575-1-git-send-email-skomatineni@nvidia.com>
References: <1607022002-26575-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1607022017; bh=XU0Fn2MfBPn3DHELaCrdMSR4GJ6Z2xcF9JZQJrMVyaA=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:X-NVConfidentiality:MIME-Version:Content-Type;
        b=FyO4rT0fLi6Bcb9fOjYgoRD1YNqmv+sGLmgu2iFhvmATqSlmrc89sya7r6hjpcHcY
         AkSJTiviR7dKxTtNTRRah4boUeaH70HHZ4gurKhndzUztIdvVq1pNtIJWzlLOZnY41
         ctNpYqnrwmJqaC82OrRBQ+Z0a8I6j19VxhdeuDTDV3is3WsIalGHzgMhX1bCb3b6Ft
         r/xzZ93sP631ftPEAQwGyDRmSn/C3YMYea9OhBPRUp1cAM5yAW+k9ZrTDATxcQamUX
         xWpsQvb4Bv/HOJLm+KzC4YukgmagNlBxqcgWRBiBDyrRLl24tbE1CI0yvZsNGVt7ba
         eUwmLn0mUzfxw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Tegra VI/CSI hardware don't have native 8 lane CSI RX port.

But x8 capture can be supported by using consecutive x4 ports
simultaneously with HDMI-to-CSI bridges where source image is split
on to two x4 ports.

This patch updates dt-bindings for csi endpoint data-lane property
with maximum of 8 lanes.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 .../devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
index 34d9933..8a6d3e1 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
@@ -111,8 +111,8 @@ of the following host1x client modules:
 
 	  endpoint (required node)
 	  Required properties:
-	  - data-lanes: an array of data lane from 1 to 4. Valid array
-	    lengths are 1/2/4.
+	  - data-lanes: an array of data lane from 1 to 8. Valid array
+	    lengths are 1/2/4/8.
 	  - remote-endpoint: phandle to sensor 'endpoint' node.
 
         port@1 (required node)
-- 
2.7.4

