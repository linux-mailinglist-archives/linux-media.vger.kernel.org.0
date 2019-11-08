Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8348BF3DF1
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2019 03:17:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728370AbfKHCRO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Nov 2019 21:17:14 -0500
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:28264 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727024AbfKHCRO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Nov 2019 21:17:14 -0500
X-Halon-ID: 883853d4-01cd-11ea-837a-0050569116f7
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (unknown [84.172.88.101])
        by bin-vsp-out-03.atm.binero.net (Halon) with ESMTPA
        id 883853d4-01cd-11ea-837a-0050569116f7;
        Fri, 08 Nov 2019 03:14:45 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 2/3] dt-bindings: rcar-vin: Document compatibility string for R8A77470
Date:   Fri,  8 Nov 2019 03:16:08 +0100
Message-Id: <20191108021609.2584272-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191108021609.2584272-1-niklas.soderlund+renesas@ragnatech.se>
References: <20191108021609.2584272-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When adding the compatibility string for R8A77470 (RZ/G1C) to the
rcar-vin driver the string was never document in the bindings, add it
now.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 Documentation/devicetree/bindings/media/renesas,vin.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,vin.txt b/Documentation/devicetree/bindings/media/renesas,vin.txt
index e6136d43b0775269..5eefd62ac5c5b9fd 100644
--- a/Documentation/devicetree/bindings/media/renesas,vin.txt
+++ b/Documentation/devicetree/bindings/media/renesas,vin.txt
@@ -13,6 +13,7 @@ on Gen3 and RZ/G2 platforms to a CSI-2 receiver.
    - "renesas,vin-r8a7743" for the R8A7743 device
    - "renesas,vin-r8a7744" for the R8A7744 device
    - "renesas,vin-r8a7745" for the R8A7745 device
+   - "renesas,vin-r8a77470" for the R8A77470 device
    - "renesas,vin-r8a774a1" for the R8A774A1 device
    - "renesas,vin-r8a774b1" for the R8A774B1 device
    - "renesas,vin-r8a774c0" for the R8A774C0 device
-- 
2.23.0

