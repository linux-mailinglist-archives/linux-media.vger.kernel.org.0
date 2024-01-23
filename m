Return-Path: <linux-media+bounces-4085-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B37838E51
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 13:17:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC22E1C22661
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 12:17:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 594485DF2F;
	Tue, 23 Jan 2024 12:17:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE03E5DF01;
	Tue, 23 Jan 2024 12:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706012253; cv=none; b=irry6VFYnk0c8VO5xGp2fBDsmox6ZAngED3wfIXzuOgijMMw92CO6ksAPANMZM3ZobIsaifl8/0IKc0b2/d9fHrylPefDcnMtKONdWbgNrO6KmjC0kiCFxB7qJjPDSme3Fo2JhksDAuMf+r91u3xu3KdRM8WyL5UkWCkKV7iejg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706012253; c=relaxed/simple;
	bh=eTIFx5VzxXBlnM28UCwgQbkWOtPuhjQQ1Zf1ibXKUtk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pmCJHakg6BF591DEjiSTJrARKlF8hsXcJYUbrUAYIrma2m46ap99AixhUgmcZvmIE3qdPzxhtlpIOm89vZTPIFVOZsCsdgHMc+sKmJ86pR0DOYUtp6627NCJpwv9A90x4He22CItzA5WWaUouuVuGD3xxGwZ8yosbVQACLhUsTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.05,214,1701097200"; 
   d="scan'208";a="195343459"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 23 Jan 2024 21:17:30 +0900
Received: from localhost.localdomain (unknown [10.226.93.36])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id DD82D420E363;
	Tue, 23 Jan 2024 21:17:26 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 1/5] media: dt-bindings: renesas,rzg2l-csi2: Document Renesas RZ/G2UL CSI-2 block
Date: Tue, 23 Jan 2024 12:17:16 +0000
Message-Id: <20240123121720.294753-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240123121720.294753-1-biju.das.jz@bp.renesas.com>
References: <20240123121720.294753-1-biju.das.jz@bp.renesas.com>
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

No driver changes are required as generic compatible string
"renesas,rzg2l-csi2" will be used as a fallback on RZ/G2UL SoC.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
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


