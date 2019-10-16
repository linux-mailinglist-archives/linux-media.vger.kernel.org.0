Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AA4FD9A07
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2019 21:28:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436649AbfJPT2Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Oct 2019 15:28:25 -0400
Received: from mailoutvs13.siol.net ([185.57.226.204]:46322 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1730794AbfJPT2Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Oct 2019 15:28:25 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 38F6D52443F;
        Wed, 16 Oct 2019 21:28:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta11.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta11.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id mbgzama4aMTj; Wed, 16 Oct 2019 21:28:21 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id E3348522B23;
        Wed, 16 Oct 2019 21:28:21 +0200 (CEST)
Received: from localhost.localdomain (cpe-86-58-59-25.static.triera.net [86.58.59.25])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id 9837352443F;
        Wed, 16 Oct 2019 21:28:19 +0200 (CEST)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mripard@kernel.org, wens@csie.org
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, mchehab@kernel.org,
        hverkuil@xs4all.nl, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-sunxi@googlegroups.com,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v3 2/6] clk: sunxi-ng: h3: Export MBUS clock
Date:   Wed, 16 Oct 2019 21:28:03 +0200
Message-Id: <20191016192807.1278987-3-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191016192807.1278987-1-jernej.skrabec@siol.net>
References: <20191016192807.1278987-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

MBUS clock will be referenced in MBUS controller node.

Export it.

Acked-by: Maxime Ripard <mripard@kernel.org>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/clk/sunxi-ng/ccu-sun8i-h3.h      | 4 ----
 include/dt-bindings/clock/sun8i-h3-ccu.h | 2 +-
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-h3.h b/drivers/clk/sunxi-ng/c=
cu-sun8i-h3.h
index b6e2680ef354..d8c38447e11b 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-h3.h
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-h3.h
@@ -48,10 +48,6 @@
=20
 /* Some more module clocks are exported */
=20
-#define CLK_MBUS		113
-
-/* And the GPU module clock is exported */
-
 #define CLK_NUMBER_H3		(CLK_GPU + 1)
 #define CLK_NUMBER_H5		(CLK_BUS_SCR1 + 1)
=20
diff --git a/include/dt-bindings/clock/sun8i-h3-ccu.h b/include/dt-bindin=
gs/clock/sun8i-h3-ccu.h
index c5f7e9a70968..30d2d15373a2 100644
--- a/include/dt-bindings/clock/sun8i-h3-ccu.h
+++ b/include/dt-bindings/clock/sun8i-h3-ccu.h
@@ -143,7 +143,7 @@
 #define CLK_AVS			110
 #define CLK_HDMI		111
 #define CLK_HDMI_DDC		112
-
+#define CLK_MBUS		113
 #define CLK_GPU			114
=20
 /* New clocks imported in H5 */
--=20
2.23.0

