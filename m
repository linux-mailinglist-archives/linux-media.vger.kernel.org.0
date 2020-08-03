Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F78223A881
	for <lists+linux-media@lfdr.de>; Mon,  3 Aug 2020 16:32:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728346AbgHCOc0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Aug 2020 10:32:26 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:8624 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726358AbgHCOcY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 3 Aug 2020 10:32:24 -0400
X-IronPort-AV: E=Sophos;i="5.75,430,1589209200"; 
   d="scan'208";a="53537274"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 03 Aug 2020 23:32:23 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id C0BAC42AD685;
        Mon,  3 Aug 2020 23:32:20 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Jacopo Mondi <jacopo@jmondi.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 4/4] media: i2c: ov5640: Fallback to parallel mode
Date:   Mon,  3 Aug 2020 15:31:47 +0100
Message-Id: <1596465107-14251-5-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596465107-14251-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <1596465107-14251-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fallback to parallel mode if bus_type doesn't match the supported
interfaces by the driver.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/media/i2c/ov5640.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 08c67250042f..4e88b0540740 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -3074,6 +3074,12 @@ static int ov5640_probe(struct i2c_client *client)
 		return ret;
 	}
 
+	/* fallback to parallel mode */
+	if (sensor->ep.bus_type != V4L2_MBUS_PARALLEL &&
+	    sensor->ep.bus_type != V4L2_MBUS_CSI2_DPHY &&
+	    sensor->ep.bus_type != V4L2_MBUS_BT656)
+		sensor->ep.bus_type = V4L2_MBUS_PARALLEL;
+
 	/* get system clock (xclk) */
 	sensor->xclk = devm_clk_get(dev, "xclk");
 	if (IS_ERR(sensor->xclk)) {
-- 
2.17.1

