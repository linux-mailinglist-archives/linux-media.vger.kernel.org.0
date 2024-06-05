Return-Path: <linux-media+bounces-12587-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AE18FD1E4
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2024 17:41:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C910B1C237F3
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2024 15:41:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 567F41494BD;
	Wed,  5 Jun 2024 15:41:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 066B354907;
	Wed,  5 Jun 2024 15:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717602096; cv=none; b=Kxt3/ZO1PctDFvT5HRoSsXuuTCGlzAF4enXXS0bBhnLLHYzqC5XL523uKS1rJZfUQJU7JALfqQEyBXzqrETudEoOeGZ5vRe+Ci2lttPK0QhCNBQFjkWxUXTu1uxdi+A+VhJGs84r7LXimyfbE2P0UCufyJ5aWCuZVIKY6cQACOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717602096; c=relaxed/simple;
	bh=Xf5KJTVOjvytz60dHDy6FJ1UuqJaMXvBprQ1btjCZtA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=P8PYvyc4gmqUFT8Kap9Hr+YuU2/gDXAqk+w7DDybdF+VMKBoP5X3E28pgiRwGvY4+2GnUByybmWuCpIhfRC166cuZEvmEQKrWMh3cvsIADDnJPA1PwBE/cx1z0D0UT5no/Aqb1PMr25WWhwZetwwo6NyPznnVPZj245oub5tZmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.08,216,1712588400"; 
   d="scan'208";a="210791036"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 06 Jun 2024 00:41:27 +0900
Received: from localhost.localdomain (unknown [10.226.92.154])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id E7FEC40062C0;
	Thu,  6 Jun 2024 00:41:22 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
Subject: [PATCH v3 RESEND 1/2] media: dt-bindings: renesas,rzg2l-csi2: Document Renesas RZ/G2UL CSI-2 block
Date: Wed,  5 Jun 2024 16:41:14 +0100
Message-Id: <20240605154115.263447-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240605154115.263447-1-biju.das.jz@bp.renesas.com>
References: <20240605154115.263447-1-biju.das.jz@bp.renesas.com>
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
v3->v3 resend:
 * No change, just rebase.
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


