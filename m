Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E98485765
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2019 03:04:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730551AbfHHBEK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Aug 2019 21:04:10 -0400
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:14899 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730529AbfHHBEK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 7 Aug 2019 21:04:10 -0400
X-Halon-ID: 5252cf1b-b978-11e9-bdc3-005056917a89
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (unknown [145.14.112.32])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id 5252cf1b-b978-11e9-bdc3-005056917a89;
        Thu, 08 Aug 2019 03:04:00 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v3] dt-bindings: rcar-{csi2,vin}: Rename bindings documentation files
Date:   Thu,  8 Aug 2019 03:03:30 +0200
Message-Id: <20190808010330.19515-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.22.0
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
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
---
 .../media/{renesas,rcar-csi2.txt => renesas,csi2.txt}         | 0
 .../bindings/media/{rcar_vin.txt => renesas,vin.txt}          | 0
 MAINTAINERS                                                   | 4 ++--
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename Documentation/devicetree/bindings/media/{renesas,rcar-csi2.txt => renesas,csi2.txt} (100%)
 rename Documentation/devicetree/bindings/media/{rcar_vin.txt => renesas,vin.txt} (100%)

---

Hi Geert,

Would you be willing to take this patch in your renesas tree? There 
seems to be a lack of interest in it :-(

// Niklas

diff --git a/Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt b/Documentation/devicetree/bindings/media/renesas,csi2.txt
similarity index 100%
rename from Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt
rename to Documentation/devicetree/bindings/media/renesas,csi2.txt
diff --git a/Documentation/devicetree/bindings/media/rcar_vin.txt b/Documentation/devicetree/bindings/media/renesas,vin.txt
similarity index 100%
rename from Documentation/devicetree/bindings/media/rcar_vin.txt
rename to Documentation/devicetree/bindings/media/renesas,vin.txt
diff --git a/MAINTAINERS b/MAINTAINERS
index 3012e33e59465f4c..60bd9b419ee1f635 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9801,8 +9801,8 @@ L:	linux-media@vger.kernel.org
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
2.22.0

