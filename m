Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1FB3149512
	for <lists+linux-media@lfdr.de>; Sat, 25 Jan 2020 12:04:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729058AbgAYLEJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Jan 2020 06:04:09 -0500
Received: from mailoutvs58.siol.net ([185.57.226.249]:55196 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725996AbgAYLEI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Jan 2020 06:04:08 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id EB49E520F74;
        Sat, 25 Jan 2020 12:04:04 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta11.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta11.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id ATAfSBqQ2TVe; Sat, 25 Jan 2020 12:04:04 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id A6D08520EEE;
        Sat, 25 Jan 2020 12:04:04 +0100 (CET)
Received: from localhost.localdomain (cpe-194-152-20-232.static.triera.net [194.152.20.232])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id 5D856520F7D;
        Sat, 25 Jan 2020 12:04:02 +0100 (CET)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mripard@kernel.org, wens@csie.org
Cc:     mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com
Subject: [PATCH 2/5] clk: sunxi-ng: a64: Export MBUS clock
Date:   Sat, 25 Jan 2020 12:03:50 +0100
Message-Id: <20200125110353.591658-3-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200125110353.591658-1-jernej.skrabec@siol.net>
References: <20200125110353.591658-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

MBUS clock will be referenced in MBUS controller node.

Export it.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/clk/sunxi-ng/ccu-sun50i-a64.h      | 4 ----
 include/dt-bindings/clock/sun50i-a64-ccu.h | 2 +-
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-a64.h b/drivers/clk/sunxi-ng=
/ccu-sun50i-a64.h
index 116e6f826d04..54d1f96f4b68 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-a64.h
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-a64.h
@@ -55,10 +55,6 @@
=20
 /* All the DRAM gates are exported */
=20
-/* Some more module clocks are exported */
-
-#define CLK_MBUS			112
-
 /* And the DSI and GPU module clock is exported */
=20
 #define CLK_NUMBER			(CLK_GPU + 1)
diff --git a/include/dt-bindings/clock/sun50i-a64-ccu.h b/include/dt-bind=
ings/clock/sun50i-a64-ccu.h
index e512a1c9b0fc..318eb15c414c 100644
--- a/include/dt-bindings/clock/sun50i-a64-ccu.h
+++ b/include/dt-bindings/clock/sun50i-a64-ccu.h
@@ -131,7 +131,7 @@
 #define CLK_AVS			109
 #define CLK_HDMI		110
 #define CLK_HDMI_DDC		111
-
+#define CLK_MBUS		112
 #define CLK_DSI_DPHY		113
 #define CLK_GPU			114
=20
--=20
2.25.0

