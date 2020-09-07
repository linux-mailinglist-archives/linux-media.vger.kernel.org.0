Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 977E625FE06
	for <lists+linux-media@lfdr.de>; Mon,  7 Sep 2020 18:05:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729973AbgIGQFT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Sep 2020 12:05:19 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:40388 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729915AbgIGOrM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 7 Sep 2020 10:47:12 -0400
X-IronPort-AV: E=Sophos;i="5.76,402,1592838000"; 
   d="scan'208";a="56367466"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 07 Sep 2020 23:46:07 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 8B1B442FBA1B;
        Mon,  7 Sep 2020 23:46:04 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: [PATCH 1/2] dt-bindings: media: renesas,vin: Add device tree support for r8a7742
Date:   Mon,  7 Sep 2020 15:45:08 +0100
Message-Id: <20200907144509.8861-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200907144509.8861-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20200907144509.8861-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add compatible string for r8a7742. No driver change is needed as
"renesas,rcar-gen2-vin" will activate the right code.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 Documentation/devicetree/bindings/media/renesas,vin.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,vin.yaml b/Documentation/devicetree/bindings/media/renesas,vin.yaml
index 53c0a7238bac..7f0dd2a08613 100644
--- a/Documentation/devicetree/bindings/media/renesas,vin.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,vin.yaml
@@ -24,6 +24,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - renesas,vin-r8a7742  # RZ/G1H
               - renesas,vin-r8a7743  # RZ/G1M
               - renesas,vin-r8a7744  # RZ/G1N
               - renesas,vin-r8a7745  # RZ/G1E
-- 
2.17.1

