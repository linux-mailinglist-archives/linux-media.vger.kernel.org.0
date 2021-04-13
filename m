Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E78E35E338
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 17:54:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231995AbhDMPyX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 11:54:23 -0400
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:45510 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1346601AbhDMPyN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 11:54:13 -0400
X-Halon-ID: 6f4132fd-9c70-11eb-b966-005056917a89
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p54ac5521.dip0.t-ipconnect.de [84.172.85.33])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id 6f4132fd-9c70-11eb-b966-005056917a89;
        Tue, 13 Apr 2021 17:53:52 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] media: dt-bindings: media: renesas,csi2: Node port@0 is not mandatory
Date:   Tue, 13 Apr 2021 17:53:46 +0200
Message-Id: <20210413155346.2471776-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When converting the binding to use the video-interfaces schemas the node
port@0 was incorrectly made a mandatory property.

The port@0 node describes which CSI-2 transmitter the R-Car CSI-2
receiver is connected too. Not all boards connects all CSI-2 receivers
to an CSI-2 transmitter.

Fixes: 066a94e28a23e04c ("media: dt-bindings: media: Use graph and video-interfaces schemas")
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 Documentation/devicetree/bindings/media/renesas,csi2.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/renesas,csi2.yaml b/Documentation/devicetree/bindings/media/renesas,csi2.yaml
index 20396f1be9993461..395484807dd5ed47 100644
--- a/Documentation/devicetree/bindings/media/renesas,csi2.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,csi2.yaml
@@ -78,7 +78,6 @@ properties:
           modules connected the CSI-2 receiver.
 
     required:
-      - port@0
       - port@1
 
 required:
-- 
2.31.1

