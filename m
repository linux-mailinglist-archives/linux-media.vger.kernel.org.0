Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23A1423A879
	for <lists+linux-media@lfdr.de>; Mon,  3 Aug 2020 16:32:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727997AbgHCOcP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Aug 2020 10:32:15 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:12397 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726358AbgHCOcP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 3 Aug 2020 10:32:15 -0400
X-IronPort-AV: E=Sophos;i="5.75,430,1589209200"; 
   d="scan'208";a="53750351"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 03 Aug 2020 23:32:13 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 90BF642ACBDC;
        Mon,  3 Aug 2020 23:32:10 +0900 (JST)
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
Subject: [PATCH v2 1/4] dt-bindings: media: i2c: ov5640: Document bus-type property
Date:   Mon,  3 Aug 2020 15:31:44 +0100
Message-Id: <1596465107-14251-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596465107-14251-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <1596465107-14251-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document the possible bus-type's supported by the OV5640 sensor driver.

Also add the bus-type in example node.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 Documentation/devicetree/bindings/media/i2c/ov5640.txt | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/ov5640.txt b/Documentation/devicetree/bindings/media/i2c/ov5640.txt
index c97c2f2da12d..00131dbb147e 100644
--- a/Documentation/devicetree/bindings/media/i2c/ov5640.txt
+++ b/Documentation/devicetree/bindings/media/i2c/ov5640.txt
@@ -36,9 +36,15 @@ Endpoint node required properties for parallel connection are:
 - data-shift: shall be set to <2> for 8 bits parallel bus
 	      (lines 9:2 are used) or <0> for 10 bits parallel bus
 - hsync-active: active state of the HSYNC signal, 0/1 for LOW/HIGH respectively.
+		(Required for bus-type 5)
 - vsync-active: active state of the VSYNC signal, 0/1 for LOW/HIGH respectively.
+		(Required for bus-type 5)
 - pclk-sample: sample data on rising (1) or falling (0) edge of the pixel clock
-	       signal.
+	       signal. (Required for bus-type 5)
+- bus-type: data bus type. Possible values are:
+	    4 - MIPI CSI-2 D-PHY
+	    5 - Parallel
+	    6 - Bt.656
 
 Examples:
 
@@ -86,6 +92,7 @@ Examples:
 				hsync-active = <0>;
 				vsync-active = <0>;
 				pclk-sample = <1>;
+				bus-type = <5>;
 			};
 		};
 	};
-- 
2.17.1

