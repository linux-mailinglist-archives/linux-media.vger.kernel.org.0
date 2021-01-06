Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A6662EC30C
	for <lists+linux-media@lfdr.de>; Wed,  6 Jan 2021 19:15:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727320AbhAFSNM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Jan 2021 13:13:12 -0500
Received: from mailoutvs3.siol.net ([185.57.226.194]:37791 "EHLO mail.siol.net"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727148AbhAFSNM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 Jan 2021 13:13:12 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 492A25233E8;
        Wed,  6 Jan 2021 19:12:30 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta09.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta09.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id yCJlVSH9jLGl; Wed,  6 Jan 2021 19:12:30 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 04A205233E7;
        Wed,  6 Jan 2021 19:12:30 +0100 (CET)
Received: from kista.localdomain (cpe-86-58-58-53.static.triera.net [86.58.58.53])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id B247B5233E8;
        Wed,  6 Jan 2021 19:12:27 +0100 (CET)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     robh+dt@kernel.org, mripard@kernel.org, wens@csie.org
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, jernej.skrabec@siol.net,
        linux-sunxi@googlegroups.com
Subject: [PATCH 1/2] dt-bindings: media: Add Allwinner R40 deinterlace compatible
Date:   Wed,  6 Jan 2021 19:19:00 +0100
Message-Id: <20210106181901.1324075-2-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210106181901.1324075-1-jernej.skrabec@siol.net>
References: <20210106181901.1324075-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Allwinner R40 SoC also contains deinterlace core, compatible to H3.

Add compatible string for it.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 .../bindings/media/allwinner,sun8i-h3-deinterlace.yaml         | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun8i-h3-d=
einterlace.yaml b/Documentation/devicetree/bindings/media/allwinner,sun8i=
-h3-deinterlace.yaml
index 6a56214c6cfd..b80980b1908e 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun8i-h3-deinterl=
ace.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun8i-h3-deinterl=
ace.yaml
@@ -19,6 +19,9 @@ properties:
   compatible:
     oneOf:
       - const: allwinner,sun8i-h3-deinterlace
+      - items:
+          - const: allwinner,sun8i-r40-deinterlace
+          - const: allwinner,sun8i-h3-deinterlace
       - items:
           - const: allwinner,sun50i-a64-deinterlace
           - const: allwinner,sun8i-h3-deinterlace
--=20
2.30.0

