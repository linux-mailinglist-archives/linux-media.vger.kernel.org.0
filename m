Return-Path: <linux-media+bounces-40287-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 221C4B2C791
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 16:52:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A94D07AF8A1
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 14:50:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C64D128136B;
	Tue, 19 Aug 2025 14:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="z3Hzko3U"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2D921772D;
	Tue, 19 Aug 2025 14:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755615080; cv=none; b=aX4lMTcPv98xezqWcX6EKZ/BU2QCLbvgnGHnPZGRTQ7Bk4HrO6LDngyyUSRN08+BoB0IPfukrtXnhMskKCstnPRYdi3NDi4+OVQsdD8WQheCa5Bid4uv0okn8A1mj++xg6h+6YcAjxOBU/MaSMPpn7wr2KRiKpu6Eblq04nbJjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755615080; c=relaxed/simple;
	bh=Mxuevp6bNGyl6fcD68OMxQ2LPG0IAnTU/AsVDo2gQ+M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=uA6XhHathJDROBiWDlfTADI5S/5jmIfATkLQ5Jns3/bskBN3Rx+/WllXKKg+KhLfhOJyZ22Bsi1AZsGF9Efn9y/ShokUPk2dVuOKHvHZmDFWWQz7/Jc1cPG3d6wSulyaL7Qd6ViphAwbAnFp7b1ox2MGRITPbTzKYNM2Xjm4OTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=z3Hzko3U; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JEdviC011360;
	Tue, 19 Aug 2025 16:51:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	h3jS/JC3i/+u2/S/uLHPpVffeWG5GKuLkz0xOuyVmcs=; b=z3Hzko3UESNDAycF
	OiUkEyZzjUrDF20JFKQnkTBBxDLQn6zaHzzMynBJwpMvh6HzhNX8vqspbdYf/5cj
	xd/atxWKtt9jgthohjXTvyr0VQLJtM5+jBdtJxkL4H82ArFWVLmDj53pzKVjlFHC
	nTmJV7ayifsjW0C7NanPJY1aZOkgCthcNMjC8qWsF6HDRHajcE+OpwWXNBdhnBdx
	nwBXezSG6Ttgdb1MuxREezpNb6IvQg1kIydHw1LuZ8mxDgb1BPk13VRZSxHTsy2p
	sp2Li/iQS0K2ugV9qzcdaWodR4CFgR/QW4+TcNr39ccYChtJ7Z91Pig2mTvcOQg0
	2iFDfw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48jfdkbqd9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Aug 2025 16:51:10 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id AA01140048;
	Tue, 19 Aug 2025 16:50:27 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 03FAF738B3C;
	Tue, 19 Aug 2025 16:49:54 +0200 (CEST)
Received: from localhost (10.130.78.67) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 19 Aug
 2025 16:49:53 +0200
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Date: Tue, 19 Aug 2025 16:47:41 +0200
Subject: [PATCH v2 1/2] media: dt-bindings: vd55g1: Add vd65g4 compatible
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250819-vd55g1_add_vd65g4-v2-1-500547ac4051@foss.st.com>
References: <20250819-vd55g1_add_vd65g4-v2-0-500547ac4051@foss.st.com>
In-Reply-To: <20250819-vd55g1_add_vd65g4-v2-0-500547ac4051@foss.st.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
        Sylvain Petinot
	<sylvain.petinot@foss.st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_02,2025-08-14_01,2025-03-28_01

Switch compatible from a const to an enum to accommodate both the vd55g1
and the vd65g4, which is the color variant.

Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
---
 Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml b/Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml
index 3c071e6fbea613e560f63d38af579421daee0efb..060ac6829b661dc50ee30a43eadb60173ff93814 100644
--- a/Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml
@@ -25,7 +25,11 @@ allOf:
 
 properties:
   compatible:
-    const: st,vd55g1
+    enum:
+      - st,vd55g1
+      - st,vd65g4
+    description:
+      VD55G1 is the monochrome variant, while VD65G4 is the color one.
 
   reg:
     maxItems: 1

-- 
2.25.1


