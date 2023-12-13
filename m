Return-Path: <linux-media+bounces-2288-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AF203810B5A
	for <lists+linux-media@lfdr.de>; Wed, 13 Dec 2023 08:18:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5229DB21090
	for <lists+linux-media@lfdr.de>; Wed, 13 Dec 2023 07:18:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFC4F18E27;
	Wed, 13 Dec 2023 07:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="OvAq1wOK"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [IPv6:2a00:1098:ed:100::25])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 676D1AC;
	Tue, 12 Dec 2023 23:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702451900;
	bh=R0EPnnH2lUhpKxCiD3hGDPCbdnJBTlqcqNHVynAmqLQ=;
	h=From:To:Cc:Subject:Date:From;
	b=OvAq1wOKGgOh7++SoiiENu0BjinGn1BRI26s7WjWQBMEcuh3QvARtx2xkguobCvUS
	 /pRVpvHY94tVveDOJ+PHFQS/YUS1QnzUwjgJg9cmtifvRyV3FL1F2YRWYq+e4ZXRNT
	 6U48Vt8bUleEx/A/LC3rNKJviQrZKsk7tMoPhK4lu+XpQWeWTiPOteWkV2IHLEW5xO
	 rwnLfCL8qw7aSbI33BL2WLoLdueVuvXcKCx7w44fmqWzPSOTy28JOw/tQlq3WQox9X
	 ifCCb5Kmkn+RPRMiuRBJXN8RkTxKwYUD+MI40c780Y4IHiXvgmrsuL9E7qiFfPTisu
	 Ac/w3ScHWdG9w==
Received: from stla-brain-8255-1.home (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 8C8013781419;
	Wed, 13 Dec 2023 07:18:19 +0000 (UTC)
From: Julien Massot <julien.massot@collabora.com>
To: benjamin.mugnier@foss.st.com,
	sylvain.petinot@foss.st.com,
	mchehab@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: kernel@collabora.com,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org,
	Julien Massot <julien.massot@collabora.com>
Subject: [PATCH] media: dt-bindings: st-vgxy61: relax data-lanes restriction
Date: Wed, 13 Dec 2023 08:17:37 +0100
Message-ID: <20231213071737.1070162-1-julien.massot@collabora.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ST VGXY61 sensors support multiple lane number, as
well as lane mapping.

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 .../devicetree/bindings/media/i2c/st,st-vgxy61.yaml        | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml b/Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml
index 8c28848b226a..733fac85a20f 100644
--- a/Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml
@@ -67,11 +67,8 @@ properties:
           data-lanes:
             description:
               CSI lanes to use
-            items:
-              - const: 1
-              - const: 2
-              - const: 3
-              - const: 4
+            minItems: 1
+            maxItems: 4
 
           remote-endpoint: true
 
-- 
2.43.0


