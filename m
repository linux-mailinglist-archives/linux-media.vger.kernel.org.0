Return-Path: <linux-media+bounces-14769-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC9392BBE7
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 15:52:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04A982816DA
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 13:52:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD9C61891C4;
	Tue,  9 Jul 2024 13:52:14 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09356184128;
	Tue,  9 Jul 2024 13:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720533134; cv=none; b=Pc2F301AOjMEfnRx24L6tjOcBD5luD+6bZ/mJH02u5c5TyYl1jGVCfqhFAQFRrl4IJMbRPYfLorxBgao+SbWIcxxe9/X6XONwrJBPAa3eIcONjgd5UKhXvF/94yGuybvuE4RVpVIas2p7HaAYe6hMsV5uCuWa+uErRW/VLj8Pz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720533134; c=relaxed/simple;
	bh=tV8rbhT5Txu7ivXHeEYxuKCkDBgJT+Q1p5Zpx55LQWo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nQLOFf9A0V73qwmbyL85zXeSFpfWFHOVJxvfd8FZWuCAOR0xY4JWJRSKAJJvWshAXQHyu+CZ293GoBsS9Tf0/M8phKoioo8MRKhhVYZPJMKNmAlBXz1MxPGClDdyx8sisuVG8sZmhdgq1cGH/vHLqTiZfvsrXIQ+76Hz+WwsYTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.09,195,1716217200"; 
   d="scan'208";a="210808026"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 09 Jul 2024 22:52:11 +0900
Received: from localhost.localdomain (unknown [10.226.92.130])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 5320F43DEDAE;
	Tue,  9 Jul 2024 22:52:07 +0900 (JST)
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
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 2/9] media: dt-bindings: media: renesas,fcp: Document RZ/G2UL FCPVD bindings
Date: Tue,  9 Jul 2024 14:51:40 +0100
Message-ID: <20240709135152.185042-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240709135152.185042-1-biju.das.jz@bp.renesas.com>
References: <20240709135152.185042-1-biju.das.jz@bp.renesas.com>
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
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
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


