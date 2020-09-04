Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 470F325E2A8
	for <lists+linux-media@lfdr.de>; Fri,  4 Sep 2020 22:19:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728078AbgIDUSv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Sep 2020 16:18:51 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:7897 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728109AbgIDUSt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 4 Sep 2020 16:18:49 -0400
X-IronPort-AV: E=Sophos;i="5.76,391,1592838000"; 
   d="scan'208";a="56193948"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 05 Sep 2020 05:18:47 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 373D9400C441;
        Sat,  5 Sep 2020 05:18:45 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Paul <paul.kocialkowski@bootlin.com>,
        Hugues Fruchet <hugues.fruchet@st.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v4 1/6] media: i2c: ov5640: Remain in power down for DVP mode unless streaming
Date:   Fri,  4 Sep 2020 21:18:30 +0100
Message-Id: <20200904201835.5958-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200904201835.5958-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20200904201835.5958-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Keep the sensor in software power down mode and wake up only in
ov5640_set_stream_dvp() callback.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Tested-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov5640.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 2fe4a7ac0592..880fde73a030 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -34,6 +34,8 @@
 #define OV5640_REG_SYS_RESET02		0x3002
 #define OV5640_REG_SYS_CLOCK_ENABLE02	0x3006
 #define OV5640_REG_SYS_CTRL0		0x3008
+#define OV5640_REG_SYS_CTRL0_SW_PWDN	0x42
+#define OV5640_REG_SYS_CTRL0_SW_PWUP	0x02
 #define OV5640_REG_CHIP_ID		0x300a
 #define OV5640_REG_IO_MIPI_CTRL00	0x300e
 #define OV5640_REG_PAD_OUTPUT_ENABLE01	0x3017
@@ -1120,6 +1122,12 @@ static int ov5640_load_regs(struct ov5640_dev *sensor,
 		val = regs->val;
 		mask = regs->mask;
 
+		/* remain in power down mode for DVP */
+		if (regs->reg_addr == OV5640_REG_SYS_CTRL0 &&
+		    val == OV5640_REG_SYS_CTRL0_SW_PWUP &&
+		    sensor->ep.bus_type != V4L2_MBUS_CSI2_DPHY)
+			continue;
+
 		if (mask)
 			ret = ov5640_mod_reg(sensor, reg_addr, mask, val);
 		else
@@ -1297,9 +1305,14 @@ static int ov5640_set_stream_dvp(struct ov5640_dev *sensor, bool on)
 	 * PAD OUTPUT ENABLE 02
 	 * - [7:2]:	D[5:0] output enable
 	 */
-	return ov5640_write_reg(sensor,
-				OV5640_REG_PAD_OUTPUT_ENABLE02,
-				on ? 0xfc : 0);
+	ret = ov5640_write_reg(sensor, OV5640_REG_PAD_OUTPUT_ENABLE02,
+			       on ? 0xfc : 0);
+	if (ret)
+		return ret;
+
+	return ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0, on ?
+				OV5640_REG_SYS_CTRL0_SW_PWUP :
+				OV5640_REG_SYS_CTRL0_SW_PWDN);
 }
 
 static int ov5640_set_stream_mipi(struct ov5640_dev *sensor, bool on)
-- 
2.17.1

