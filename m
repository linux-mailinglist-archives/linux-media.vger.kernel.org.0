Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF1F81B7224
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2020 12:40:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726857AbgDXKkB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Apr 2020 06:40:01 -0400
Received: from sauhun.de ([88.99.104.3]:46272 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726791AbgDXKkB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Apr 2020 06:40:01 -0400
Received: from localhost (p5486CE62.dip0.t-ipconnect.de [84.134.206.98])
        by pokefinder.org (Postfix) with ESMTPSA id 71E812C1FE8;
        Fri, 24 Apr 2020 12:39:59 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] media: rcar-csi2: Fix comment of VCDT/VCDT2 register
Date:   Fri, 24 Apr 2020 12:39:45 +0200
Message-Id: <20200424103945.2836-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>

According to latest H/W manual v1.50, the description of channel
number in the VCDT/VCDT2 register is decremented by one.
Therefore, this patch fixes it about comment.

Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/media/platform/rcar-vin/rcar-csi2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
index faa9fb23a2e9..151e6a90c5fb 100644
--- a/drivers/media/platform/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
@@ -52,8 +52,8 @@ struct rcar_csi2;
 
 /*
  * Channel Data Type Select
- * VCDT[0-15]:  Channel 1 VCDT[16-31]:  Channel 2
- * VCDT2[0-15]: Channel 3 VCDT2[16-31]: Channel 4
+ * VCDT[0-15]:  Channel 0 VCDT[16-31]:  Channel 1
+ * VCDT2[0-15]: Channel 2 VCDT2[16-31]: Channel 3
  */
 #define VCDT_REG			0x10
 #define VCDT2_REG			0x14
-- 
2.20.1

