Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1C511302FE
	for <lists+linux-media@lfdr.de>; Sat,  4 Jan 2020 16:22:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726050AbgADPVo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 4 Jan 2020 10:21:44 -0500
Received: from mail.kernel.org ([198.145.29.99]:58896 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725943AbgADPVo (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 4 Jan 2020 10:21:44 -0500
Received: from localhost.localdomain (unknown [194.230.155.149])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EE35521734;
        Sat,  4 Jan 2020 15:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578151302;
        bh=CHtvmJmJTYA2XWUU5fS02RD4y82wxxLkb2gjothw9tA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RDzsuAq+nYsQO29qCBhBO9FjDxx618JMRr5D9o92vqiVferDfQLcLqEQ4DQLlo662
         lOS1FuuNWrW746XfRQkDHYBm+qU74NPgWbr0sfR0D5d/LCUydagdMTpGK/ePGLoHSH
         m8R1KB9m4f/U8yUJSFYwB611Byd98e61/IgMyJ3M=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kukjin Kim <kgene@kernel.org>, Kamil Debski <kamil@wypas.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 01/20] dt-bindings: Rename Exynos to lowercase
Date:   Sat,  4 Jan 2020 16:20:48 +0100
Message-Id: <20200104152107.11407-2-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200104152107.11407-1-krzk@kernel.org>
References: <20200104152107.11407-1-krzk@kernel.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix up inconsistent usage of upper and lowercase letters in "Exynos"
name.

"EXYNOS" is not an abbreviation but a regular trademarked name.
Therefore it should be written with lowercase letters starting with
capital letter.

The lowercase "Exynos" name is promoted by its manufacturer Samsung
Electronics Co., Ltd., in advertisement materials and on website.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. New patch
---
 .../devicetree/bindings/media/exynos-jpeg-codec.txt         | 2 +-
 Documentation/devicetree/bindings/media/exynos5-gsc.txt     | 2 +-
 Documentation/devicetree/bindings/media/samsung-fimc.txt    | 2 +-
 .../devicetree/bindings/media/samsung-mipi-csis.txt         | 2 +-
 Documentation/devicetree/bindings/phy/samsung-phy.txt       | 6 +++---
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/exynos-jpeg-codec.txt b/Documentation/devicetree/bindings/media/exynos-jpeg-codec.txt
index 38941db23dd2..ce9a22689e53 100644
--- a/Documentation/devicetree/bindings/media/exynos-jpeg-codec.txt
+++ b/Documentation/devicetree/bindings/media/exynos-jpeg-codec.txt
@@ -1,4 +1,4 @@
-Samsung S5P/EXYNOS SoC series JPEG codec
+Samsung S5P/Exynos SoC series JPEG codec
 
 Required properties:
 
diff --git a/Documentation/devicetree/bindings/media/exynos5-gsc.txt b/Documentation/devicetree/bindings/media/exynos5-gsc.txt
index bc963a6d305a..1872688fa408 100644
--- a/Documentation/devicetree/bindings/media/exynos5-gsc.txt
+++ b/Documentation/devicetree/bindings/media/exynos5-gsc.txt
@@ -1,6 +1,6 @@
 * Samsung Exynos5 G-Scaler device
 
-G-Scaler is used for scaling and color space conversion on EXYNOS5 SoCs.
+G-Scaler is used for scaling and color space conversion on Exynos5 SoCs.
 
 Required properties:
 - compatible: should be one of
diff --git a/Documentation/devicetree/bindings/media/samsung-fimc.txt b/Documentation/devicetree/bindings/media/samsung-fimc.txt
index 48c599dacbdf..f91b9dc80eb3 100644
--- a/Documentation/devicetree/bindings/media/samsung-fimc.txt
+++ b/Documentation/devicetree/bindings/media/samsung-fimc.txt
@@ -1,4 +1,4 @@
-Samsung S5P/EXYNOS SoC Camera Subsystem (FIMC)
+Samsung S5P/Exynos SoC Camera Subsystem (FIMC)
 ----------------------------------------------
 
 The S5P/Exynos SoC Camera subsystem comprises of multiple sub-devices
diff --git a/Documentation/devicetree/bindings/media/samsung-mipi-csis.txt b/Documentation/devicetree/bindings/media/samsung-mipi-csis.txt
index be45f0b1a449..a4149c9434ea 100644
--- a/Documentation/devicetree/bindings/media/samsung-mipi-csis.txt
+++ b/Documentation/devicetree/bindings/media/samsung-mipi-csis.txt
@@ -1,4 +1,4 @@
-Samsung S5P/EXYNOS SoC series MIPI CSI-2 receiver (MIPI CSIS)
+Samsung S5P/Exynos SoC series MIPI CSI-2 receiver (MIPI CSIS)
 -------------------------------------------------------------
 
 Required properties:
diff --git a/Documentation/devicetree/bindings/phy/samsung-phy.txt b/Documentation/devicetree/bindings/phy/samsung-phy.txt
index 1c40ccd40ce4..7510830a79bd 100644
--- a/Documentation/devicetree/bindings/phy/samsung-phy.txt
+++ b/Documentation/devicetree/bindings/phy/samsung-phy.txt
@@ -1,4 +1,4 @@
-Samsung S5P/EXYNOS SoC series MIPI CSIS/DSIM DPHY
+Samsung S5P/Exynos SoC series MIPI CSIS/DSIM DPHY
 -------------------------------------------------
 
 Required properties:
@@ -27,7 +27,7 @@ the PHY specifier identifies the PHY and its meaning is as follows:
 supports additional fifth PHY:
   4 - MIPI CSIS 2.
 
-Samsung EXYNOS SoC series Display Port PHY
+Samsung Exynos SoC series Display Port PHY
 -------------------------------------------------
 
 Required properties:
@@ -38,7 +38,7 @@ Required properties:
 		      control pmu registers for power isolation.
 - #phy-cells : from the generic PHY bindings, must be 0;
 
-Samsung S5P/EXYNOS SoC series USB PHY
+Samsung S5P/Exynos SoC series USB PHY
 -------------------------------------------------
 
 Required properties:
-- 
2.17.1

