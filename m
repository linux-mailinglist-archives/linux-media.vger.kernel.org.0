Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6403A2D7C50
	for <lists+linux-media@lfdr.de>; Fri, 11 Dec 2020 18:08:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394292AbgLKRFb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Dec 2020 12:05:31 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:2576 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390394AbgLKREy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Dec 2020 12:04:54 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fd3a6420000>; Fri, 11 Dec 2020 09:02:58 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 11 Dec
 2020 17:02:54 +0000
Received: from skomatineni-linux.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Fri, 11 Dec 2020 17:02:54 +0000
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>
CC:     <mchehab@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 11/13] dt-bindings: tegra: Update csi data-lanes to maximum 8 lanes
Date:   Fri, 11 Dec 2020 09:02:40 -0800
Message-ID: <1607706162-1548-12-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607706162-1548-1-git-send-email-skomatineni@nvidia.com>
References: <1607706162-1548-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1607706178; bh=cEfNDFkS84iV8njM0C+tDfF6JjQAU3GjXx81Qy0pDmM=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:X-NVConfidentiality:MIME-Version:Content-Type;
        b=aVU7Q2v++NRGQKefT3v2rXvF4KUIxXQ+SIhHXNUMzfQs/M1VBDSinP6CfZxXGYys9
         1a+p3BH6KKdLO0yegHl3epGrqb4PEES3EzLG3kev3dxzRsQ41L/R2HS5qsZCgbVL3D
         w5ihePVE9PhTk8jai0NCxYJz3P31oX1TnfMNduaujnD0GFFgUGx/LTOy+gx6hg4WAh
         2h7if5pk4w4AjcAQwl2u3Cu0r1lhrqwyBdrMzoUrxHfbRGDhtfJdwPow7fsBPsrZeN
         VF0lO8oIGzFw6vMzhbJeczePU7/doI9S73WJNuAgjIwp+pQnOV5/0m9gKrV2KTjhGW
         rMERHl/LofAwA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Tegra VI/CSI hardware don't have native 8 lane CSI RX port.

But x8 capture can be supported by using consecutive x4 ports
simultaneously with HDMI-to-CSI bridges where source image is split
on to two x4 ports.

This patch updates dt-bindings for csi endpoint data-lane property
with maximum of 8 lanes.

Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
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

