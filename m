Return-Path: <linux-media+bounces-387-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 881E57EC8E1
	for <lists+linux-media@lfdr.de>; Wed, 15 Nov 2023 17:44:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 407D12815CA
	for <lists+linux-media@lfdr.de>; Wed, 15 Nov 2023 16:44:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3723631737;
	Wed, 15 Nov 2023 16:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="PNy1DYfC"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3063BB44;
	Wed, 15 Nov 2023 16:44:15 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::223])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20A1611D;
	Wed, 15 Nov 2023 08:44:12 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B40EA60006;
	Wed, 15 Nov 2023 16:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700066651;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mnNKnxShDKBKR7oddzUJiYMgk7ZsuUJgQ9HbV/jIWzo=;
	b=PNy1DYfCIEvygEiDckI0R3vTZpWCm5cZauVL38NsqNeXeg5Lq9LPhSNJd+FMh808Uh8dbe
	hvEFHjvuTNC6wAaxoq2gIq0OYSFroR8n7dUpe/N9cGzUl4DsiIBI6JCHyG/mNEJSX9T1cd
	HRppNhgzOZJ36jPgYesb+RlYW107fusuvXFRMbNf96JWlnR0LD98kER3Zk+0CNpU0Cbfxg
	k7io9HikMFWyhpfilR4wAOQ29uwzI/KyXtQylsVEVJKoLWppKqu5BWz/aX0qHf3F8Snkx2
	06O9hbtIS2IjgUPG7LEawJuXrcXwMcBAiZ/oq3BlH9S5AANlNmWYqxmHSnZd0A==
From: Mehdi Djait <mehdi.djait@bootlin.com>
To: krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com,
	alexandre.belloni@bootlin.com,
	paul.kocialkowski@bootlin.com,
	dafna@fastmail.com,
	laurent.pinchart@ideasonboard.com,
	helen.koike@collabora.com,
	heiko@sntech.de,
	paul.elder@ideasonboard.com,
	Mehdi Djait <mehdi.djait@bootlin.com>
Subject: [PATCH] media: dt-bindings: media: rkisp1: Fix the port description for the parallel interface
Date: Wed, 15 Nov 2023 17:44:07 +0100
Message-ID: <20231115164407.99876-1-mehdi.djait@bootlin.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: mehdi.djait@bootlin.com

The bus-type belongs to the endpoint's properties and should therefore
be moved.

Fixes: 6a0eaa25bf36 ("media: dt-bindings: media: rkisp1: Add port for parallel interface")
Signed-off-by: Mehdi Djait <mehdi.djait@bootlin.com>
---
 .../devicetree/bindings/media/rockchip-isp1.yaml      | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/rockchip-isp1.yaml b/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
index e466dff8286d..afcaa427d48b 100644
--- a/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
@@ -90,15 +90,16 @@ properties:
         description: connection point for input on the parallel interface
 
         properties:
-          bus-type:
-            enum: [5, 6]
-
           endpoint:
             $ref: video-interfaces.yaml#
             unevaluatedProperties: false
 
-        required:
-          - bus-type
+            properties:
+              bus-type:
+                enum: [5, 6]
+
+            required:
+              - bus-type
 
     anyOf:
       - required:
-- 
2.41.0


