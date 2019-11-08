Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07AE6F3DEB
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2019 03:17:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726094AbfKHCRN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Nov 2019 21:17:13 -0500
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:37834 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726118AbfKHCRN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 7 Nov 2019 21:17:13 -0500
X-Halon-ID: 87a563be-01cd-11ea-837a-0050569116f7
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (unknown [84.172.88.101])
        by bin-vsp-out-03.atm.binero.net (Halon) with ESMTPA
        id 87a563be-01cd-11ea-837a-0050569116f7;
        Fri, 08 Nov 2019 03:14:44 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/3] dt-bindings: rcar-vin: Remove paragraph about aliases
Date:   Fri,  8 Nov 2019 03:16:07 +0100
Message-Id: <20191108021609.2584272-2-niklas.soderlund+renesas@ragnatech.se>
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

It might be convenient to have aliases but it's not required, drop the
sentence as it's not true and not used in Gen3 DTS files.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 Documentation/devicetree/bindings/media/renesas,vin.txt | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/renesas,vin.txt b/Documentation/devicetree/bindings/media/renesas,vin.txt
index e30b0d4eefdd84ae..e6136d43b0775269 100644
--- a/Documentation/devicetree/bindings/media/renesas,vin.txt
+++ b/Documentation/devicetree/bindings/media/renesas,vin.txt
@@ -41,9 +41,6 @@ on Gen3 and RZ/G2 platforms to a CSI-2 receiver.
  - interrupts: the interrupt for the device
  - clocks: Reference to the parent clock
 
-Additionally, an alias named vinX will need to be created to specify
-which video input device this is.
-
 The per-board settings for Gen2 and RZ/G1 platforms:
 
 - port - sub-node describing a single endpoint connected to the VIN
-- 
2.23.0

