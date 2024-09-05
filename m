Return-Path: <linux-media+bounces-17647-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D35396D043
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 09:18:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23032283FB6
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 07:18:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ADBB193091;
	Thu,  5 Sep 2024 07:18:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EBCD1925BD;
	Thu,  5 Sep 2024 07:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725520700; cv=none; b=PF5DUP5nicthNRrCnvEMIiTQOlcsj40i0/bK5ocYOyYGb10gl2nxiRuOv1FCuE3oVLW7rbSZ7oEwMl33yz+iQCgq5VQZVtRifMRBZtQQ7vGmWxZCri/usfnx5Slx0YUhRQxLVWakCM7vHnMMOG5/H1BIIGe+nRQNDCn6ebVTf5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725520700; c=relaxed/simple;
	bh=1E0nu+zy1Da39Rv7vl30O4gnnIIoPGX+hr0l70RcZoo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B6xC3sU39ii+ydpcmYdkHj2p0fsGTrp1+fzgfe6TwghPAYkU6kn6xBnWNhDkY11+VmRI+tE/EXRsLWAo8MMch8YC9hvKeO5BYkynGIJUtKjKI8LFSSlJDJ+y+2YiK4pQsUe6N0PpDiYXd4cBNaVtf55whqbcrZXuMqNzLe3W5io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.10,203,1719846000"; 
   d="scan'208";a="217606061"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 05 Sep 2024 16:18:10 +0900
Received: from localhost.localdomain (unknown [10.226.93.27])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id A95AA4007543;
	Thu,  5 Sep 2024 16:18:06 +0900 (JST)
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
	Pavel Machek <pavel@denx.de>
Subject: [PATCH] media: dt-bindings: renesas,rzg2l-cru: Improve documentation
Date: Thu,  5 Sep 2024 08:18:01 +0100
Message-ID: <20240905071803.8920-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the documentation issues pointed by Pavel while backporting
it to 6.1.y-cip.
 - Replace 'input'->'inputs' in main description
 - Replace 'Main'->'main' in CRU main clock description
 - Replace 'Register'-> 'register' in CRU Register access clock
   description

Reported-by: Pavel Machek <pavel@denx.de>
Closes: https://lore.kernel.org/all/ZtWJqOdRxkBkUb9y@duo.ucw.cz/
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../devicetree/bindings/media/renesas,rzg2l-cru.yaml        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml b/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
index bc1245127025..d3c74341febc 100644
--- a/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
@@ -13,7 +13,7 @@ maintainers:
 description:
   The CRU image processing module is a data conversion module equipped with pixel
   color space conversion, LUT, pixel format conversion, etc. An MIPI CSI-2 input and
-  parallel (including ITU-R BT.656) input are provided as the image sensor interface.
+  parallel (including ITU-R BT.656) inputs are provided as the image sensor interface.
 
 properties:
   compatible:
@@ -38,8 +38,8 @@ properties:
 
   clocks:
     items:
-      - description: CRU Main clock
-      - description: CRU Register access clock
+      - description: CRU main clock
+      - description: CRU register access clock
       - description: CRU image transfer clock
 
   clock-names:
-- 
2.43.0


