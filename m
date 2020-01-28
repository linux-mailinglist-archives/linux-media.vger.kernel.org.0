Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B43F514BF7E
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2020 19:23:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726902AbgA1SXm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jan 2020 13:23:42 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:7334 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726276AbgA1SXl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jan 2020 13:23:41 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e307c180001>; Tue, 28 Jan 2020 10:23:20 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 28 Jan 2020 10:23:40 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 28 Jan 2020 10:23:40 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 28 Jan
 2020 18:23:39 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 28 Jan 2020 18:23:39 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.164.115]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5e307c280002>; Tue, 28 Jan 2020 10:23:39 -0800
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH v1 3/5] dt-binding: tegra: Add VI and CSI bindings
Date:   Tue, 28 Jan 2020 10:23:19 -0800
Message-ID: <1580235801-4129-4-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1580235801-4129-1-git-send-email-skomatineni@nvidia.com>
References: <1580235801-4129-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1580235800; bh=UgUcisJMPgF+6T3cLh1vBYdSrnMqK173ZEWHTCS2SUk=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=VXZNOhv8IvH5fYUp+LXGh5svCAXW1u+8ty0eacGv02n3qXgbjIfg8+4YT65X/I+Gl
         sEO6Kc/TGqEmtrKpTx5g9teJ8SdvPna9u62591FuzqcbxjWx9/npyZRFscY1xLAN20
         E8lFrflvuIV1RbNcFVI5LpzIwnwfwzZ9U6eQqKiluu/ulhD2ySa8BoQoHQncB+w5Uc
         M+fnf2l8Liu1hkRRohX4Ws8+m1Y/vP5qCQfgpB1QPvcUzy7eIJaQTGWRr53ix5w6he
         whFUN4kpYLjQbdxd2JSIHo5g9FfaMgFXdOCBAUUj04gnF+ABLLM9J+6pxpi+dH/Dl8
         ehvNdDo+6vyeQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Tegra contains VI controller which can support up to 6 MIPI CSI
camera sensors.

Each Tegra CSI port from CSI unit can be one-to-one mapper to
VI channel and can capture from an external camera sensor or
from built-in test pattern generator.

This patch adds dt-bindings for Tegra VI and CSI.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 .../bindings/display/tegra/nvidia,tegra20-host1x.txt           | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
index 9999255ac5b6..47cd6532b7d3 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
@@ -40,7 +40,7 @@ of the following host1x client modules:
 
   Required properties:
   - compatible: "nvidia,tegra<chip>-vi"
-  - reg: Physical base address and length of the controller's registers.
+  - reg: Physical base address and length of the controller registers.
   - interrupts: The interrupt outputs from the controller.
   - clocks: Must contain one entry, for the module clock.
     See ../clocks/clock-bindings.txt for details.
@@ -49,6 +49,14 @@ of the following host1x client modules:
   - reset-names: Must include the following entries:
     - vi
 
+- csi: mipi csi interface to vi
+
+  Required properties:
+  - compatible: "nvidia,tegra<chip>-csi"
+  - reg: Physical base address and length of the controller registers.
+  - clocks: Must contain entries csi, cilab, cilcd, cile clocks.
+    See ../clocks/clock-bindings.txt for details.
+
 - epp: encoder pre-processor
 
   Required properties:
-- 
2.7.4

