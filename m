Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BCE7358E50
	for <lists+linux-media@lfdr.de>; Thu,  8 Apr 2021 22:24:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232158AbhDHUZH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Apr 2021 16:25:07 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:43474 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231699AbhDHUZG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 8 Apr 2021 16:25:06 -0400
X-IronPort-AV: E=Sophos;i="5.82,207,1613401200"; 
   d="scan'208";a="77693642"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 09 Apr 2021 05:24:52 +0900
Received: from devel.example.org?044ree.adwin.renesas.com (unknown [10.226.36.85])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 50F7940061B4;
        Fri,  9 Apr 2021 05:24:50 +0900 (JST)
From:   Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Ramesh Shanmugasundaram <rashanmu@gmail.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH] media: dt-bindings: media: renesas,drif: Fix fck definition
Date:   Thu,  8 Apr 2021 21:24:36 +0100
Message-Id: <20210408202436.3706-1-fabrizio.castro.jz@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

dt_binding_check reports the below error with the latest schema:

Documentation/devicetree/bindings/media/renesas,drif.yaml:
  properties:clock-names:maxItems: False schema does not allow 1
Documentation/devicetree/bindings/media/renesas,drif.yaml:
  ignoring, error in schema: properties: clock-names: maxItems

This patch fixes the problem.

Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
---
 Documentation/devicetree/bindings/media/renesas,drif.yaml | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/renesas,drif.yaml b/Documentation/devicetree/bindings/media/renesas,drif.yaml
index f1bdaeab4053..e28396f35ee6 100644
--- a/Documentation/devicetree/bindings/media/renesas,drif.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,drif.yaml
@@ -67,9 +67,7 @@ properties:
     maxItems: 1
 
   clock-names:
-    maxItems: 1
-    items:
-      - const: fck
+    const: fck
 
   resets:
     maxItems: 1
-- 
2.25.1

