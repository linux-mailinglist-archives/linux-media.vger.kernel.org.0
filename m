Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B91D9C1617
	for <lists+linux-media@lfdr.de>; Sun, 29 Sep 2019 18:17:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729095AbfI2QRQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 29 Sep 2019 12:17:16 -0400
Received: from mailoutvs17.siol.net ([185.57.226.208]:54054 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726838AbfI2QRQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 29 Sep 2019 12:17:16 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 47EFD522066;
        Sun, 29 Sep 2019 18:17:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta09.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta09.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id GiQyqTXl0iyX; Sun, 29 Sep 2019 18:17:13 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id F2331520EAC;
        Sun, 29 Sep 2019 18:17:12 +0200 (CEST)
Received: from localhost.localdomain (cpe-86-58-59-25.static.triera.net [86.58.59.25])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id A5B1E522056;
        Sun, 29 Sep 2019 18:17:10 +0200 (CEST)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mripard@kernel.org, wens@csie.org
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, mchehab@kernel.org,
        hverkuil@xs4all.nl, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: [PATCH v2 2/6] clk: sunxi-ng: h3: Export MBUS clock
Date:   Sun, 29 Sep 2019 18:16:49 +0200
Message-Id: <20190929161653.160158-3-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190929161653.160158-1-jernej.skrabec@siol.net>
References: <20190929161653.160158-1-jernej.skrabec@siol.net>
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

