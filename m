Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64C10251E68
	for <lists+linux-media@lfdr.de>; Tue, 25 Aug 2020 19:35:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726820AbgHYRfp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Aug 2020 13:35:45 -0400
Received: from mailoutvs11.siol.net ([185.57.226.202]:60531 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726090AbgHYRfm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Aug 2020 13:35:42 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 867AD5247D3;
        Tue, 25 Aug 2020 19:35:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta09.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta09.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id UwvD_FWKSc_M; Tue, 25 Aug 2020 19:35:38 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 3A21252476A;
        Tue, 25 Aug 2020 19:35:38 +0200 (CEST)
Received: from localhost.localdomain (89-212-178-211.dynamic.t-2.net [89.212.178.211])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id E05C05247D3;
        Tue, 25 Aug 2020 19:35:35 +0200 (CEST)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mripard@kernel.org, wens@csie.org, paul.kocialkowski@bootlin.com
Cc:     mchehab@kernel.org, robh+dt@kernel.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-sunxi@googlegroups.com
Subject: [PATCH 3/5] dt-bindings: media: allwinner,sun4i-a10-video-engine: Add R40 compatible
Date:   Tue, 25 Aug 2020 19:35:21 +0200
Message-Id: <20200825173523.1289379-4-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200825173523.1289379-1-jernej.skrabec@siol.net>
References: <20200825173523.1289379-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Allwinner R40 SoC contains video engine. Add compatible for it.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 .../bindings/media/allwinner,sun4i-a10-video-engine.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-=
video-engine.yaml b/Documentation/devicetree/bindings/media/allwinner,sun=
4i-a10-video-engine.yaml
index 4cc1a670c986..0d58bbcd24d3 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-e=
ngine.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-e=
ngine.yaml
@@ -18,6 +18,7 @@ properties:
       - allwinner,sun7i-a20-video-engine
       - allwinner,sun8i-a33-video-engine
       - allwinner,sun8i-h3-video-engine
+      - allwinner,sun8i-r40-video-engine
       - allwinner,sun50i-a64-video-engine
       - allwinner,sun50i-h5-video-engine
       - allwinner,sun50i-h6-video-engine
--=20
2.28.0

