Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9372CE2628
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2019 00:13:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436746AbfJWWNv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Oct 2019 18:13:51 -0400
Received: from mailoutvs54.siol.net ([185.57.226.245]:47587 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2436699AbfJWWNu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Oct 2019 18:13:50 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 8056C5232FA;
        Thu, 24 Oct 2019 00:13:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta09.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta09.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id kA_GW-T7H7Vs; Thu, 24 Oct 2019 00:13:47 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 2D15A5228DC;
        Thu, 24 Oct 2019 00:13:47 +0200 (CEST)
Received: from localhost.localdomain (cpe-86-58-59-25.static.triera.net [86.58.59.25])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id AC5655232FA;
        Thu, 24 Oct 2019 00:13:44 +0200 (CEST)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mripard@kernel.org, wens@csie.org
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, mchehab@kernel.org,
        hverkuil@xs4all.nl, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-sunxi@googlegroups.com,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v5 2/6] clk: sunxi-ng: h3: Export MBUS clock
Date:   Thu, 24 Oct 2019 00:13:28 +0200
Message-Id: <20191023221332.3674175-3-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191023221332.3674175-1-jernej.skrabec@siol.net>
References: <20191023221332.3674175-1-jernej.skrabec@siol.net>
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

