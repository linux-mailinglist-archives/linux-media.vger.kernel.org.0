Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 270673B36D4
	for <lists+linux-media@lfdr.de>; Thu, 24 Jun 2021 21:22:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232812AbhFXTYw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Jun 2021 15:24:52 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:51304 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232806AbhFXTYu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Jun 2021 15:24:50 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15OJMR8t043449;
        Thu, 24 Jun 2021 14:22:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1624562547;
        bh=J0vYLX1VEIIhvtOEuWuQOTgbjYsk/PtZul3G3ueX2KQ=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=wkkFKo52DNTrCKW/IDAeABhotHxkvHk+j3dDaZvk3QA2KBzBeOxlBzU61J5aSD9Hd
         I2tr3xTwOU2z/pveA5AOZ4UlMOQDmAYY6+ckrrtzSrXzCZJ6D+mSV4PD2VhFmBoss+
         edXxDDUsnPtExRIMqdlQfWdClJtH44FzkumRW3NM=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15OJMRYm057861
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 24 Jun 2021 14:22:27 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 24
 Jun 2021 14:22:27 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 24 Jun 2021 14:22:27 -0500
Received: from pratyush-OptiPlex-790.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15OJM14K120548;
        Thu, 24 Jun 2021 14:22:25 -0500
From:   Pratyush Yadav <p.yadav@ti.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
CC:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Maxime Ripard <mripard@kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>
Subject: [PATCH v3 04/11] media: cadence: csi2rx: Soft reset the streams before starting capture
Date:   Fri, 25 Jun 2021 00:51:53 +0530
Message-ID: <20210624192200.22559-5-p.yadav@ti.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210624192200.22559-1-p.yadav@ti.com>
References: <20210624192200.22559-1-p.yadav@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This resets the stream state machines and FIFOs, giving them a clean
slate. On J721E if the streams are not reset before starting the
capture, the captured frame gets wrapped around vertically on every run
after the first.

Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
---

(no changes since v1)

 drivers/media/platform/cadence/cdns-csi2rx.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
index d86be917135b..379bc163d4c1 100644
--- a/drivers/media/platform/cadence/cdns-csi2rx.c
+++ b/drivers/media/platform/cadence/cdns-csi2rx.c
@@ -39,6 +39,7 @@
 #define CSI2RX_STREAM_BASE(n)		(((n) + 1) * 0x100)
 
 #define CSI2RX_STREAM_CTRL_REG(n)		(CSI2RX_STREAM_BASE(n) + 0x000)
+#define CSI2RX_STREAM_CTRL_SOFT_RST			BIT(4)
 #define CSI2RX_STREAM_CTRL_START			BIT(0)
 
 #define CSI2RX_STREAM_DATA_CFG_REG(n)		(CSI2RX_STREAM_BASE(n) + 0x008)
@@ -135,12 +136,22 @@ struct csi2rx_priv *v4l2_subdev_to_csi2rx(struct v4l2_subdev *subdev)
 
 static void csi2rx_reset(struct csi2rx_priv *csi2rx)
 {
+	int i;
+
 	writel(CSI2RX_SOFT_RESET_PROTOCOL | CSI2RX_SOFT_RESET_FRONT,
 	       csi2rx->base + CSI2RX_SOFT_RESET_REG);
 
 	udelay(10);
 
 	writel(0, csi2rx->base + CSI2RX_SOFT_RESET_REG);
+
+	/* Reset individual streams. */
+	for (i = 0; i < csi2rx->max_streams; i++) {
+		writel(CSI2RX_STREAM_CTRL_SOFT_RST,
+		       csi2rx->base + CSI2RX_STREAM_CTRL_REG(i));
+		usleep_range(10, 20);
+		writel(0, csi2rx->base + CSI2RX_STREAM_CTRL_REG(i));
+	}
 }
 
 static int csi2rx_configure_external_dphy(struct csi2rx_priv *csi2rx)
-- 
2.30.0

