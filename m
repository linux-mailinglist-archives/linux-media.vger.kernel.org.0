Return-Path: <linux-media+bounces-36958-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8BDAFAD41
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 09:34:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9AA731884E5A
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 07:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E1D3290D8E;
	Mon,  7 Jul 2025 07:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="dFeuEC7J"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF57B28C5D2;
	Mon,  7 Jul 2025 07:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751873525; cv=none; b=NiIhM4ub/lbrJxTuDk1CojDV84zAUgGsMmkLJ0c96Rzymm17dmiefo5j0HsjMAPOi+cnELHRfYQqQBlmhv47duFp4HDiiD7pi7zRG56ZKUruFOyMu84Enm/MQmogalsRpNmtdGnci1cVG4vJ5HYe8+qR6BccjF5D90bZ4wih9V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751873525; c=relaxed/simple;
	bh=IFm8wdOlIIRruORWX4B639189gQKtjW4W1qnL4GmuWQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sg25QgViFZBikRRko3jUd2wwTk93XKCxMG3eeq40sXW4+ZAlbyiTCUFChDsCKkjiX19lgq1RTLTpLtYoFqVM+0ufqxRZI3UEjAcyJHOQJ1dxMZruOH3jYKwVsVjbSE89DUtkFhgfaIurSmVsPn6uO8e8lBnAvns1HJp8KA1fX5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=dFeuEC7J; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 76a5be4c5b0411f0b33aeb1e7f16c2b6-20250707
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=UUiHorZ2b+H0g7M8FPcVvqonKj3X+eMHTIPcEBNa148=;
	b=dFeuEC7JQP3DVuSG8XDYkBvWeH+2kj9DrCviAZlRvOBSrNpr9CCwGb7ZK6deCpjDSUr0Yi+ylSTRuQ2a2RcnvH1lY8US2STYnbfX2SgkFUBE6JYIVy5RABz7b9TzKVeurpJoxoWCU2YK5HXK/YiVMKgYUkEsoH3vJLqa5Lp4+jQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:3c229934-80da-4d43-a488-6881893b6cfb,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:2d53cb9c-b8a9-480a-b7e5-687022facff7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 76a5be4c5b0411f0b33aeb1e7f16c2b6-20250707
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 283312877; Mon, 07 Jul 2025 15:31:57 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 7 Jul 2025 15:31:56 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 7 Jul 2025 15:31:55 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kyrie Wu <kyrie.wu@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v7 09/12] media: dt-bindings: mediatek,jpeg: Add mediatek, mt8196-jpgdec compatible
Date: Mon, 7 Jul 2025 15:31:42 +0800
Message-ID: <20250707073146.3581-10-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250707073146.3581-1-kyrie.wu@mediatek.com>
References: <20250707073146.3581-1-kyrie.wu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

Compared to the previous generation IC, the MT8196 uses SMMU
instead of IOMMU and supports features such as dynamic voltage
and frequency scaling. Therefore, add "mediatek,mt8196-jpgdec"
compatible to the binding document.

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/media/mediatek,mt8195-jpegdec.yaml           | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
index e5448c60e3eb..28a9a9bfdbf8 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
@@ -14,7 +14,9 @@ description:
 
 properties:
   compatible:
-    const: mediatek,mt8195-jpgdec
+    enum:
+      - mediatek,mt8195-jpgdec
+      - mediatek,mt8196-jpgdec
 
   power-domains:
     maxItems: 1
@@ -44,7 +46,9 @@ patternProperties:
 
     properties:
       compatible:
-        const: mediatek,mt8195-jpgdec-hw
+        enum:
+          - mediatek,mt8195-jpgdec-hw
+          - mediatek,mt8196-jpgdec-hw
 
       reg:
         maxItems: 1
-- 
2.46.0


