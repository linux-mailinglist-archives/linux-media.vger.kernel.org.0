Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BFFA294E04
	for <lists+linux-media@lfdr.de>; Wed, 21 Oct 2020 15:53:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2443103AbgJUNxt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Oct 2020 09:53:49 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:29050 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2443030AbgJUNxs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Oct 2020 09:53:48 -0400
X-IronPort-AV: E=Sophos;i="5.77,401,1596466800"; 
   d="scan'208";a="60410357"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 21 Oct 2020 22:53:47 +0900
Received: from devel.example.org?044ree.adwin.renesas.com (unknown [10.226.36.120])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id B1B7E429809D;
        Wed, 21 Oct 2020 22:53:44 +0900 (JST)
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
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v5 3/5] media: dt-bindings: media: renesas,drif: Add r8a77990 support
Date:   Wed, 21 Oct 2020 14:53:30 +0100
Message-Id: <20201021135332.4928-4-fabrizio.castro.jz@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201021135332.4928-1-fabrizio.castro.jz@renesas.com>
References: <20201021135332.4928-1-fabrizio.castro.jz@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The r8a77990 (a.k.a. R-Car E3) device tree schema is
compatible with R-Car H3 and M3-W schema.

Document r8a77990 support within renesas,drif.yaml.

Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Rob Herring <robh@kernel.org>
---
v4->v5:
* Fixed indentation
v3->v4:
* No change
v2->v3:
* No change
v1->v2:
* No change

 Documentation/devicetree/bindings/media/renesas,drif.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,drif.yaml b/Documentation/devicetree/bindings/media/renesas,drif.yaml
index 7d86c581a65f..0b1a25ccb959 100644
--- a/Documentation/devicetree/bindings/media/renesas,drif.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,drif.yaml
@@ -53,6 +53,7 @@ properties:
       - enum:
           - renesas,r8a7795-drif        # R-Car H3
           - renesas,r8a7796-drif        # R-Car M3-W
+          - renesas,r8a77990-drif       # R-Car E3
       - const: renesas,rcar-gen3-drif   # Generic R-Car Gen3 compatible device
 
   reg:
-- 
2.25.1

