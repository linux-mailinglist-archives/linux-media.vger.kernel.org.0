Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5169FE33B5
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2019 15:14:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502441AbfJXNOd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Oct 2019 09:14:33 -0400
Received: from laurent.telenet-ops.be ([195.130.137.89]:40448 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502377AbfJXNOc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Oct 2019 09:14:32 -0400
Received: from ramsan ([84.195.182.253])
        by laurent.telenet-ops.be with bizsmtp
        id HREV210015USYZQ01REV1m; Thu, 24 Oct 2019 15:14:31 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iNcwe-00068n-UD; Thu, 24 Oct 2019 15:14:28 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iNcwe-0004Nk-RD; Thu, 24 Oct 2019 15:14:28 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] media: dt-bindings: rcar_vin: Document RZ/G1 per-board settings
Date:   Thu, 24 Oct 2019 15:14:23 +0200
Message-Id: <20191024131423.16799-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The R-Car Gen2 per-board settings apply to RZ/G1, too.

Fixes: 1d14a5eaa156b0b3 ("media: dt-bindings: media: rcar_vin: add device tree support for r8a774[35]")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/media/renesas,vin.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/renesas,vin.txt b/Documentation/devicetree/bindings/media/renesas,vin.txt
index aa217b0962797712..221fcc416d1ac598 100644
--- a/Documentation/devicetree/bindings/media/renesas,vin.txt
+++ b/Documentation/devicetree/bindings/media/renesas,vin.txt
@@ -43,7 +43,7 @@ on Gen3 and RZ/G2 platforms to a CSI-2 receiver.
 Additionally, an alias named vinX will need to be created to specify
 which video input device this is.
 
-The per-board settings Gen2 platforms:
+The per-board settings for Gen2 and RZ/G1 platforms:
 
 - port - sub-node describing a single endpoint connected to the VIN
   from external SoC pins as described in video-interfaces.txt[1].
@@ -63,7 +63,7 @@ The per-board settings Gen2 platforms:
     - data-enable-active: polarity of CLKENB signal, see [1] for
       description. Default is active high.
 
-The per-board settings Gen3 and RZ/G2 platforms:
+The per-board settings for Gen3 and RZ/G2 platforms:
 
 Gen3 and RZ/G2 platforms can support both a single connected parallel input
 source from external SoC pins (port@0) and/or multiple parallel input sources
-- 
2.17.1

