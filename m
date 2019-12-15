Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28DC711F96B
	for <lists+linux-media@lfdr.de>; Sun, 15 Dec 2019 18:00:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727024AbfLORAY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Dec 2019 12:00:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:54890 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726145AbfLOQ7a (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Dec 2019 11:59:30 -0500
Received: from wens.tw (mirror2.csie.ntu.edu.tw [140.112.30.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7379A2465B;
        Sun, 15 Dec 2019 16:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576429169;
        bh=NPSuZ6u/sK4SlEDJ0oH9si5g4gTkgubMSRdexHBwM4g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qIXQlg9wbdGZXjiEkHcQk33NuX/6vZv5AznWEx+QQaKc0cPCRXyWcreLkSlIvrxj+
         6sd709V2okmUuC+zbJ2fGCmk1U8u45MT+uN24eVRFEdfkuV9YqEW7p6hoMhjCep0J1
         fgu9XM1jTDew+Zn1w/QZC4zNpROJWYtxrWrz5pSQ=
Received: by wens.tw (Postfix, from userid 1000)
        id 1BB865F9B4; Mon, 16 Dec 2019 00:59:26 +0800 (CST)
From:   Chen-Yu Tsai <wens@kernel.org>
To:     Maxime Ripard <mripard@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Chen-Yu Tsai <wens@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 01/14] dt-bindings: media: sun4i-csi: Add compatible for CSI1 on A10/A20
Date:   Mon, 16 Dec 2019 00:59:11 +0800
Message-Id: <20191215165924.28314-2-wens@kernel.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191215165924.28314-1-wens@kernel.org>
References: <20191215165924.28314-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Chen-Yu Tsai <wens@csie.org>

The CSI1 block has the same structure and layout as the CSI0 block.
Differences include:

  - Only one channel in BT.656 instead of four in CSI0
  - 10-bit raw data input vs 8-bit in CSI0
  - 24-bit RGB888/YUV444 input vs 16-bit RGB565/YUV422 in CSI0
  - No ISP hardware

The hardware found in the A20 is the same as in the A10.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 .../bindings/media/allwinner,sun4i-a10-csi.yaml       | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
index d3e423fcb6c2..221fe630c7d5 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
@@ -16,7 +16,12 @@ description: |-
 
 properties:
   compatible:
-    const: allwinner,sun7i-a20-csi0
+    oneOf:
+      - const: allwinner,sun4i-a10-csi1
+      - const: allwinner,sun7i-a20-csi0
+      - items:
+        - const: allwinner,sun7i-a20-csi1
+        - const: allwinner,sun4i-a10-csi1
 
   reg:
     maxItems: 1
@@ -25,12 +30,16 @@ properties:
     maxItems: 1
 
   clocks:
+    minItems: 2
+    maxItems: 3
     items:
       - description: The CSI interface clock
       - description: The CSI ISP clock
       - description: The CSI DRAM clock
 
   clock-names:
+    minItems: 2
+    maxItems: 3
     items:
       - const: bus
       - const: isp
-- 
2.24.0

