Return-Path: <linux-media+bounces-5084-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB7E853327
	for <lists+linux-media@lfdr.de>; Tue, 13 Feb 2024 15:30:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5D45280C0A
	for <lists+linux-media@lfdr.de>; Tue, 13 Feb 2024 14:30:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F233058107;
	Tue, 13 Feb 2024 14:29:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C1085644D;
	Tue, 13 Feb 2024 14:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707834594; cv=none; b=nHFLQH1tneiFfYTNlA88RPHMFPdz+Ctw08iXh/L7Vu867XMVE/G6K6VTMoIW01bEm0KpvQh+rUjAVDhn1LOD87wzsv3Xj1kZF/W9NxrqduOPd5MAY76B2GuLxpX6o7Bhzz3CpKJNeJqTLLQWts9iVbcEnLmG/eNHKcS800xXzJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707834594; c=relaxed/simple;
	bh=AhR10VrCNEmNypZucVfu71DXBbyPkEuWWyQjSvgTYdE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=osAA/x+m7pFRQCIQX4jwLyFtB8W3g5xqQRMbDTme9VUj4ZP9euYXCmkH/qt7OLv8ad6eUUR9DfWxIgM623mgH0YMUEjFICu+cRKGeWsyR/+K7PxnVryozTdqcl90oMXF+GfWkPaxfNlVvzozdQjqK0jF3r84upSYjiWB9PK/v1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.06,157,1705330800"; 
   d="scan'208";a="193789610"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 13 Feb 2024 23:29:51 +0900
Received: from localhost.localdomain (unknown [10.226.93.58])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 92F804215B70;
	Tue, 13 Feb 2024 23:29:47 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/2] media: dt-bindings: renesas,rzg2l-csi2: Document Renesas RZ/G2UL CSI-2 block
Date: Tue, 13 Feb 2024 14:29:40 +0000
Message-Id: <20240213142941.161217-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240213142941.161217-1-biju.das.jz@bp.renesas.com>
References: <20240213142941.161217-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the CSI-2 block which is part of CRU found in Renesas RZ/G2UL
SoC.

The CSI-2 block on the RZ/G2UL SoC is identical to one found on the
RZ/G2L SoC.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2->v3:
 * Added Rb tag from Geert.
v1->v2:
 * Added Ack from Conor Dooley.
 * Dropped driver reference from commit description.
---
 Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml b/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
index 67eea2ac1d22..7faa12fecd5b 100644
--- a/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
@@ -19,6 +19,7 @@ properties:
   compatible:
     items:
       - enum:
+          - renesas,r9a07g043-csi2       # RZ/G2UL
           - renesas,r9a07g044-csi2       # RZ/G2{L,LC}
           - renesas,r9a07g054-csi2       # RZ/V2L
       - const: renesas,rzg2l-csi2
-- 
2.25.1


