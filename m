Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74FAA251DF4
	for <lists+linux-media@lfdr.de>; Tue, 25 Aug 2020 19:14:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726793AbgHYROU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Aug 2020 13:14:20 -0400
Received: from mailoutvs7.siol.net ([185.57.226.198]:34314 "EHLO mail.siol.net"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726753AbgHYROP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Aug 2020 13:14:15 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 7F704524B35;
        Tue, 25 Aug 2020 19:14:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta10.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta10.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id nk7rpHcdItQS; Tue, 25 Aug 2020 19:14:09 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 2F77D524B3F;
        Tue, 25 Aug 2020 19:14:09 +0200 (CEST)
Received: from localhost.localdomain (89-212-178-211.dynamic.t-2.net [89.212.178.211])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id E5EC3524B35;
        Tue, 25 Aug 2020 19:14:06 +0200 (CEST)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mripard@kernel.org, wens@csie.org
Cc:     mchehab@kernel.org, robh+dt@kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com
Subject: [PATCH 1/3] dt-bindings: media: allwinner,sun4i-a10-ir: Add R40 compatible
Date:   Tue, 25 Aug 2020 19:13:56 +0200
Message-Id: <20200825171358.1286902-2-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200825171358.1286902-1-jernej.skrabec@siol.net>
References: <20200825171358.1286902-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Allwinner R40 has very similar IR core to that found in A31.

Add compatible for R40 and while at it, sort compatibles by family.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 .../bindings/media/allwinner,sun4i-a10-ir.yaml           | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-=
ir.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.=
yaml
index 7838804700d6..5fa19d4aeaf3 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
@@ -18,10 +18,13 @@ properties:
     oneOf:
       - const: allwinner,sun4i-a10-ir
       - const: allwinner,sun5i-a13-ir
-      - items:
-          - const: allwinner,sun8i-a83t-ir
-          - const: allwinner,sun6i-a31-ir
       - const: allwinner,sun6i-a31-ir
+      - items:
+          - const: allwinner,sun8i-a83t-ir
+          - const: allwinner,sun6i-a31-ir
+      - items:
+          - const: allwinner,sun8i-r40-ir
+          - const: allwinner,sun6i-a31-ir
       - items:
           - const: allwinner,sun50i-a64-ir
           - const: allwinner,sun6i-a31-ir
--=20
2.28.0

