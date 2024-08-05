Return-Path: <linux-media+bounces-15774-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A27EA9479F0
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2024 12:36:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2E9DCB21325
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2024 10:36:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E058154BE7;
	Mon,  5 Aug 2024 10:36:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2E0D1547D9;
	Mon,  5 Aug 2024 10:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722854175; cv=none; b=kdHjGy+ZIZoI+98iY1dtPRsKeoPFnYs+97z3y5V2B7NRSPUWSABMNsh9RudcuxS3zxSbkOYGul2mmojWm/ZDV/QsnZQ42sKZlIl+Ep92J0KwPeepzEE2vj0ZqrvTNP0FmAmQ5ngsSeote/dDTHIoZJBSTeTY4hd3uPn2Q4Gc44k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722854175; c=relaxed/simple;
	bh=kBhmUclFzk726fT89zE3oK4ucx0reiqXAcJRjHeloQA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XZH8iC4K9IbyMfsCT1XOpphj7Ih5ouiWUvtOv3Kd3J76vjCvAmRpC91tTmNSNme1bBQ9rVts36hXjyckksgTDrLG8OAyYTtZzxUzn0zgJR4Nte3E7Q+wKzLp4fJI8z87uBtTvucAQaQLTp29RfyRGvOOSrATSNcPKAm8D0opc8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.09,264,1716217200"; 
   d="scan'208";a="214716803"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 05 Aug 2024 19:36:08 +0900
Received: from localhost.localdomain (unknown [10.226.92.197])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id A083041FB3BB;
	Mon,  5 Aug 2024 19:36:03 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v3 2/2] media: dt-bindings: media: renesas,fcp: Document RZ/G2UL FCPVD bindings
Date: Mon,  5 Aug 2024 11:35:44 +0100
Message-ID: <20240805103549.92369-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240805103549.92369-1-biju.das.jz@bp.renesas.com>
References: <20240805103549.92369-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document FCPVD found in RZ/G2UL SoC. FCPVD block is similar to FCP for
VSP found on RZ/{G2L,G2LC,V2L} SoCs.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Added Rb tag from Geert and Laurent.
v1->v2:
 * Added Ack from Conor.
---
 Documentation/devicetree/bindings/media/renesas,fcp.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,fcp.yaml b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
index c6abe719881b..f94dacd96278 100644
--- a/Documentation/devicetree/bindings/media/renesas,fcp.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
@@ -27,6 +27,7 @@ properties:
           - renesas,fcpf # FCP for FDP
       - items:
           - enum:
+              - renesas,r9a07g043u-fcpvd # RZ/G2UL
               - renesas,r9a07g044-fcpvd # RZ/G2{L,LC}
               - renesas,r9a07g054-fcpvd # RZ/V2L
           - const: renesas,fcpv         # Generic FCP for VSP fallback
@@ -62,6 +63,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - renesas,r9a07g043u-fcpvd
               - renesas,r9a07g044-fcpvd
               - renesas,r9a07g054-fcpvd
     then:
-- 
2.43.0


