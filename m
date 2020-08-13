Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA45F243E1F
	for <lists+linux-media@lfdr.de>; Thu, 13 Aug 2020 19:14:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726248AbgHMROK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Aug 2020 13:14:10 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:28876 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726384AbgHMROK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Aug 2020 13:14:10 -0400
X-IronPort-AV: E=Sophos;i="5.76,309,1592838000"; 
   d="scan'208";a="54312916"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 14 Aug 2020 02:14:07 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id B8D714005E0F;
        Fri, 14 Aug 2020 02:14:05 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Paul <paul.kocialkowski@bootlin.com>,
        Hugues Fruchet <hugues.fruchet@st.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: [PATCH v3 3/3] media: i2c: ov5640: Fail probe on unsupported bus_type
Date:   Thu, 13 Aug 2020 18:13:37 +0100
Message-Id: <20200813171337.5540-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200813171337.5540-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20200813171337.5540-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fail probe if unsupported bus_type is detected.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/media/i2c/ov5640.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 160d2857352a..3191e2b223c3 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -3078,6 +3078,13 @@ static int ov5640_probe(struct i2c_client *client)
 		return ret;
 	}
 
+	if (sensor->ep.bus_type != V4L2_MBUS_PARALLEL &&
+	    sensor->ep.bus_type != V4L2_MBUS_CSI2_DPHY &&
+	    sensor->ep.bus_type != V4L2_MBUS_BT656) {
+		dev_err(dev, "Unsupported bus type %d\n", sensor->ep.bus_type);
+		return -EINVAL;
+	}
+
 	/* get system clock (xclk) */
 	sensor->xclk = devm_clk_get(dev, "xclk");
 	if (IS_ERR(sensor->xclk)) {
-- 
2.17.1

