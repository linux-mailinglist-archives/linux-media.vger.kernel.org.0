Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03B4A4315D
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2019 23:13:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728662AbfFLVMv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Jun 2019 17:12:51 -0400
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:58479 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726599AbfFLVMv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jun 2019 17:12:51 -0400
X-Halon-ID: d2605675-8d56-11e9-8d05-005056917f90
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (unknown [89.233.230.99])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id d2605675-8d56-11e9-8d05-005056917f90;
        Wed, 12 Jun 2019 23:12:47 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH v2] dt-bindings: rcar-{csi2,vin}: Rename bindings documentation files
Date:   Wed, 12 Jun 2019 23:12:41 +0200
Message-Id: <20190612211241.1455-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Renesas media binding documentation files uses a naming schema of
'renesas,<module>.txt'. Rename VIN and CSI-2 files to match this
pattern.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
---
 .../media/{renesas,rcar-csi2.txt => renesas,csi2.txt}         | 0
 .../bindings/media/{rcar_vin.txt => renesas,vin.txt}          | 0
 MAINTAINERS                                                   | 4 ++--
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename Documentation/devicetree/bindings/media/{renesas,rcar-csi2.txt => renesas,csi2.txt} (100%)
 rename Documentation/devicetree/bindings/media/{rcar_vin.txt => renesas,vin.txt} (100%)

diff --git a/Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt b/Documentation/devicetree/bindings/media/renesas,csi2.txt
similarity index 100%
rename from Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt
rename to Documentation/devicetree/bindings/media/renesas,csi2.txt
diff --git a/Documentation/devicetree/bindings/media/rcar_vin.txt b/Documentation/devicetree/bindings/media/renesas,vin.txt
similarity index 100%
rename from Documentation/devicetree/bindings/media/rcar_vin.txt
rename to Documentation/devicetree/bindings/media/renesas,vin.txt
diff --git a/MAINTAINERS b/MAINTAINERS
index 6a3bac28ebb47830..a0d21ff13c8e8989 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9807,8 +9807,8 @@ L:	linux-media@vger.kernel.org
 L:	linux-renesas-soc@vger.kernel.org
 T:	git git://linuxtv.org/media_tree.git
 S:	Supported
-F:	Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt
-F:	Documentation/devicetree/bindings/media/rcar_vin.txt
+F:	Documentation/devicetree/bindings/media/renesas,csi2.txt
+F:	Documentation/devicetree/bindings/media/renesas,vin.txt
 F:	drivers/media/platform/rcar-vin/
 
 MEDIA DRIVERS FOR RENESAS - VSP1
-- 
2.21.0

