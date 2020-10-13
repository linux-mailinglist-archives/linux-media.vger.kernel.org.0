Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D32E28D0E2
	for <lists+linux-media@lfdr.de>; Tue, 13 Oct 2020 17:02:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389126AbgJMPCf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Oct 2020 11:02:35 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:42312 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2387958AbgJMPCS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Oct 2020 11:02:18 -0400
X-IronPort-AV: E=Sophos;i="5.77,371,1596466800"; 
   d="scan'208";a="59674410"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 14 Oct 2020 00:02:17 +0900
Received: from devel.example.org?044ree.adwin.renesas.com (unknown [10.226.36.120])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 933C94009410;
        Wed, 14 Oct 2020 00:02:14 +0900 (JST)
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
Subject: [PATCH v3 4/5] media: dt-bindings: media: renesas,drif: Add r8a77965 support
Date:   Tue, 13 Oct 2020 16:01:49 +0100
Message-Id: <20201013150150.14801-5-fabrizio.castro.jz@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201013150150.14801-1-fabrizio.castro.jz@renesas.com>
References: <20201013150150.14801-1-fabrizio.castro.jz@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The r8a77965 (a.k.a. R-Car M3-N) device tree schema is
compatible with the already documented R-Car Gen3 devices.

Document r8a77965 support within renesas,drif.yaml.

Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
---
v2->v3:
* New patch

 Documentation/devicetree/bindings/media/renesas,drif.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,drif.yaml b/Documentation/devicetree/bindings/media/renesas,drif.yaml
index ae50b1448320..89445ddd598e 100644
--- a/Documentation/devicetree/bindings/media/renesas,drif.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,drif.yaml
@@ -53,6 +53,7 @@ properties:
       - enum:
         - renesas,r8a7795-drif        # R-Car H3
         - renesas,r8a7796-drif        # R-Car M3-W
+        - renesas,r8a77965-drif       # R-Car M3-N
         - renesas,r8a77990-drif       # R-Car E3
       - const: renesas,rcar-gen3-drif # Generic R-Car Gen3 compatible device
 
-- 
2.25.1

