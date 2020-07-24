Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B540822C8A2
	for <lists+linux-media@lfdr.de>; Fri, 24 Jul 2020 16:59:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727013AbgGXO7W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jul 2020 10:59:22 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:48204 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726366AbgGXO7W (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jul 2020 10:59:22 -0400
X-IronPort-AV: E=Sophos;i="5.75,391,1589209200"; 
   d="scan'208";a="52962835"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 24 Jul 2020 23:59:19 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 8AD96425F8C1;
        Fri, 24 Jul 2020 23:59:17 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Niklas <niklas.soderlund@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/2] dt-bindings: media: renesas,vin: Document renesas-vin-ycbcr-8b-g property
Date:   Fri, 24 Jul 2020 15:58:51 +0100
Message-Id: <1595602732-25582-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595602732-25582-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <1595602732-25582-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a DT property "renesas-vin-ycbcr-8b-g" to select YCbCr422 8-bit data
input pins.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 Documentation/devicetree/bindings/media/renesas,vin.yaml | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,vin.yaml b/Documentation/devicetree/bindings/media/renesas,vin.yaml
index 53c0a72..7dfb781 100644
--- a/Documentation/devicetree/bindings/media/renesas,vin.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,vin.yaml
@@ -106,6 +106,12 @@ properties:
 
           remote-endpoint: true
 
+          renesas-vin-ycbcr-8b-g:
+            type: boolean
+            description:
+              If present this property specifies to selects VIN_G[7:0] as data pins for YCbCr422 8-bit data.
+            default: false
+
         required:
           - remote-endpoint
 
@@ -168,6 +174,13 @@ properties:
 
               remote-endpoint: true
 
+              renesas-vin-ycbcr-8b-g:
+                type: boolean
+                description:
+                  If present this property specifies to selects VIN_G[7:0] as data pins for
+                  YCbCr422 8-bit data.
+                default: false
+
             required:
               - remote-endpoint
 
-- 
2.7.4

