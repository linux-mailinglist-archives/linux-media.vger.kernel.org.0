Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8245628E3C2
	for <lists+linux-media@lfdr.de>; Wed, 14 Oct 2020 17:57:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388079AbgJNP5r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Oct 2020 11:57:47 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:1802 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2387909AbgJNP5g (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Oct 2020 11:57:36 -0400
X-IronPort-AV: E=Sophos;i="5.77,375,1596466800"; 
   d="scan'208";a="59783601"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 15 Oct 2020 00:57:36 +0900
Received: from devel.example.org?044ree.adwin.renesas.com (unknown [10.226.36.120])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 5B9BC400C4E3;
        Thu, 15 Oct 2020 00:57:33 +0900 (JST)
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
Subject: [PATCH v4 4/5] media: dt-bindings: media: renesas,drif: Add r8a77965 support
Date:   Wed, 14 Oct 2020 16:57:18 +0100
Message-Id: <20201014155719.15120-5-fabrizio.castro.jz@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201014155719.15120-1-fabrizio.castro.jz@renesas.com>
References: <20201014155719.15120-1-fabrizio.castro.jz@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The r8a77965 (a.k.a. R-Car M3-N) device tree schema is
compatible with the already documented R-Car Gen3 devices.

Document r8a77965 support within renesas,drif.yaml.

Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3->v4:
* No change
v2->v3:
* New patch

 Documentation/devicetree/bindings/media/renesas,drif.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,drif.yaml b/Documentation/devicetree/bindings/media/renesas,drif.yaml
index 478968345aa9..0fe79f9e8eb9 100644
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

