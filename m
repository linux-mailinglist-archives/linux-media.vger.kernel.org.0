Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 455A9338E3E
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 14:05:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231278AbhCLNEk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Mar 2021 08:04:40 -0500
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:43108 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231792AbhCLNE3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Mar 2021 08:04:29 -0500
X-Halon-ID: 775f6397-8333-11eb-a542-005056917a89
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p54ac5521.dip0.t-ipconnect.de [84.172.85.33])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id 775f6397-8333-11eb-a542-005056917a89;
        Fri, 12 Mar 2021 14:04:27 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] dt-bindings: media: renesas,csi2: Add r8a77961 support
Date:   Fri, 12 Mar 2021 14:04:21 +0100
Message-Id: <20210312130421.1743226-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the compatible string for M3-W+ (r8a77961) to the list of supported
SoCs.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 Documentation/devicetree/bindings/media/renesas,csi2.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,csi2.yaml b/Documentation/devicetree/bindings/media/renesas,csi2.yaml
index 20396f1be9993461..23703b767f5b66f4 100644
--- a/Documentation/devicetree/bindings/media/renesas,csi2.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,csi2.yaml
@@ -25,6 +25,7 @@ properties:
           - renesas,r8a774e1-csi2 # RZ/G2H
           - renesas,r8a7795-csi2  # R-Car H3
           - renesas,r8a7796-csi2  # R-Car M3-W
+          - renesas,r8a77961-csi2 # R-Car M3-W+
           - renesas,r8a77965-csi2 # R-Car M3-N
           - renesas,r8a77970-csi2 # R-Car V3M
           - renesas,r8a77980-csi2 # R-Car V3H
-- 
2.30.1

