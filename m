Return-Path: <linux-media+bounces-40278-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC13B2C3D8
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 14:38:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B227B173ED7
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 12:34:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B0FD334719;
	Tue, 19 Aug 2025 12:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="lnlyNMqU"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF2A2DE1FC;
	Tue, 19 Aug 2025 12:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755606818; cv=none; b=UOQjUudKcf9VBg4Mr/zqxTPeRq7iLPG0JsuvY81aFCrY8wUDppv8eCaiBHFBmHD1j8cQm4UFc+yN6rLYXSGH0Vkwm50fkM21rm9dmc4SXqp8Igd8IX6RE2eO+xh+p3Vauh3gOl5MhXctTHfvrZrxoXF2JbZOp6EYt8zV+E/+TUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755606818; c=relaxed/simple;
	bh=Mxuevp6bNGyl6fcD68OMxQ2LPG0IAnTU/AsVDo2gQ+M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=XLXFROAkgtSzLTMBjplOueY3cO1U6mUktLNbtvJ8xicq3oaS683VYRxZnwhQHz4FgkyxdourjuTXibBeAFJyU6qAezoVMcMvzDygjnHuOvfgxg2FxN1AuVlq3TG7YfD9JMM2ESL0H/rPGoXeqAhMFMv4yg3I4ZLU7xB9weGo7qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=lnlyNMqU; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JB3B4C026151;
	Tue, 19 Aug 2025 14:33:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	h3jS/JC3i/+u2/S/uLHPpVffeWG5GKuLkz0xOuyVmcs=; b=lnlyNMqU/oE1Hnfp
	6xkPanl7xYZeUOxief18qFYKPti5RelwWpiCa+ocVzPFBoQpPUWmFJh+5MGHuk7p
	2ve5eZTh6Q9APOMvkA/4pgJhwjZ3DUG8VnPkeMtBKjd7gPG/RncWkxdnqO1FfTa7
	rf4BYzyiBHMPmcjNgBUmEgcB9WRzo80g3/Q9hVUf2sw+TEA7zA9QcDbydWK4F+9Z
	9BNIM9DoTvI8p7Sn4VmuyltE7NAF+auSuhNqasxGEOUfKFjZPB3KIgb8Utay2Yuz
	N9fDl+IJ//IUQKXTMiY0XKLc24wqhJbnU6IZ3/gFM2k30DVYepVSjYX/74hVZHdO
	p6872g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48jgvf2hx7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Aug 2025 14:33:15 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id BB95D40056;
	Tue, 19 Aug 2025 14:32:32 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9FDD9724713;
	Tue, 19 Aug 2025 14:31:59 +0200 (CEST)
Received: from localhost (10.130.78.67) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 19 Aug
 2025 14:31:59 +0200
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Date: Tue, 19 Aug 2025 14:31:46 +0200
Subject: [PATCH 1/2] media: dt-bindings: vd55g1: Add vd65g4 compatible
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250819-vd55g1_add_vd65g4-v1-1-b48646456c23@foss.st.com>
References: <20250819-vd55g1_add_vd65g4-v1-0-b48646456c23@foss.st.com>
In-Reply-To: <20250819-vd55g1_add_vd65g4-v1-0-b48646456c23@foss.st.com>
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


