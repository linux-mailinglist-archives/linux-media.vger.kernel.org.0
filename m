Return-Path: <linux-media+bounces-1620-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B41803C92
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 19:15:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7ED8F1C20B1A
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 18:15:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 475AF2F858;
	Mon,  4 Dec 2023 18:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="cJgokJDB"
X-Original-To: linux-media@vger.kernel.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D2DBB6;
	Mon,  4 Dec 2023 10:15:20 -0800 (PST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3B4IFA17031321;
	Mon, 4 Dec 2023 12:15:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1701713710;
	bh=aXh+ryNhp7mZiiivyy66Kv4VGbuJezjA6jht3qlIIrg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=cJgokJDBg1LQekykE1PW67UM14ztMGf+HNylu+OdgjyMJIKDDsGajM3DBXDnJsqsm
	 rzuhuX8a+vejwvh3uenVGx3YZPCVdfVDAh1xUgeFSYOIc4eb2ZjHx/Jj+qxFRvAePx
	 tY3Tfn3uw3LT/5Gbfxd19c4CjJnESiTuMDKAF4+I=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3B4IFAtu008855
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 4 Dec 2023 12:15:10 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 4
 Dec 2023 12:15:09 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 4 Dec 2023 12:15:10 -0600
Received: from udba0500997.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3B4IF6ac035354;
	Mon, 4 Dec 2023 12:15:09 -0600
From: Brandon Brnich <b-brnich@ti.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        Sebastian Fricke
	<sebastian.fricke@collabora.com>,
        Nas Chung <nas.chung@chipsnmedia.com>
CC: Nishanth Menon <nm@ti.com>, Darren Etheridge <detheridge@ti.com>,
        Brandon
 Brnich <b-brnich@ti.com>
Subject: [PATCH 1/2] dt-bindings: media: Remove K3 Family Prefix from Compatible
Date: Mon, 4 Dec 2023 12:14:51 -0600
Message-ID: <20231204181452.1258419-2-b-brnich@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231204181452.1258419-1-b-brnich@ti.com>
References: <20231204181452.1258419-1-b-brnich@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

K3 family prefix is not included in other TI compatible
strings. Remove this prefix to keep naming convention
consistent.

Fixes: de4b9f7e371a ("dt-bindings: media: wave5: add yaml devicetree bindings")
Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Closes: https://lore.kernel.org/all/CAMuHMdUYOq=q1j=d+Eac28hthOUAaNUkuvxmRu-mUN1pLKq69g@mail.gmail.com/
Signed-off-by: Brandon Brnich <b-brnich@ti.com>
---
 Documentation/devicetree/bindings/media/cnm,wave521c.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/cnm,wave521c.yaml b/Documentation/devicetree/bindings/media/cnm,wave521c.yaml
index 6d5569e77b7a..471840e858c9 100644
--- a/Documentation/devicetree/bindings/media/cnm,wave521c.yaml
+++ b/Documentation/devicetree/bindings/media/cnm,wave521c.yaml
@@ -17,7 +17,7 @@ properties:
   compatible:
     items:
       - enum:
-          - ti,k3-j721s2-wave521c
+          - ti,j721s2-wave521c
       - const: cnm,wave521c
 
   reg:
-- 
2.34.1


