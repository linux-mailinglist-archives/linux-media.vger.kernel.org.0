Return-Path: <linux-media+bounces-23625-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A774E9F54D9
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 18:48:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80E7D188835E
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 17:45:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B30C1F9A83;
	Tue, 17 Dec 2024 17:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="IfKJFxJe"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58271F8F10;
	Tue, 17 Dec 2024 17:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734457311; cv=none; b=jxyYGIyWvPcAIcCJTC15pzDu/0aBVFLex10ldf06d8tsXzG6zdlzwmO3HKtlC09tZl+txNOMhIUBqnngYG91xpbon/CEB1VC1L0O/3yz4f8WblCBYLNX5OGQA1KvPUC0nI4mkdN3VWASG5MVq8RmoWnCLWELeLIVnR5k0sg15fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734457311; c=relaxed/simple;
	bh=5QquJExtMC+uA7UHytyRXwL5pLNbrbEj5raUCQoVI/Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=BumPs3vOPMlmpw+nVNYu/IwulmWJK6OSsqOyl3gvX5/sHpp94osNwqh+eph1HKQDKJ74mpZbYVhyInSoky9npcJ26jgMWUCJrZRjXBobYMxm1dYVNw5c8T3SpJ8XeIbOGY+i8cyHIHgo7sLigOqBRgdIA0ve/moC1vzElOUP2d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=IfKJFxJe; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BHDQcJN030946;
	Tue, 17 Dec 2024 18:41:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	Nc9RXMeFr31ytwA1Y5dlc81Sj4KC1vb4yt2kMR6a00c=; b=IfKJFxJeEiMthcDX
	vmT4BjLEf+DefvDF4W07qOJQeorlRQEjJ6IpUKGdxbftAf8xwpVkbBUkiQFKZuw0
	rfBk72TBQ5uRdgU6bhO25tr+kgvme5PInju7yGXVyA5L/LdERjfSF0L03p4pJ2yL
	x2OhxIFQSqHiEArW0dswRsFg2h2GG1mHEQwgsXVCnZ1t1RkWgR0Ck2cJhswOa76n
	SKZcYM8GDo08WRruMkrWNSy4caS4QNpmD7jJNwFc0jjGbQbgmZEUEeEItuHiHBu8
	pGFkJLiJipTP9KUIyzJt8acTUyAES4iABxJ/gVbe4vzkalAA5QuTtqKTS+39jtYZ
	6088vA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43k5c4u3bb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 18:41:25 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1AB0A40044;
	Tue, 17 Dec 2024 18:40:16 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 49E6828E45A;
	Tue, 17 Dec 2024 18:39:26 +0100 (CET)
Received: from localhost (10.252.23.235) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 17 Dec
 2024 18:39:25 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 17 Dec 2024 18:39:19 +0100
Subject: [PATCH 2/9] dt-bindings: media: clarify stm32 csi & simplify
 example
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241217-csi_dcmipp_mp25_enhancements-v1-2-2b432805d17d@foss.st.com>
References: <20241217-csi_dcmipp_mp25_enhancements-v1-0-2b432805d17d@foss.st.com>
In-Reply-To: <20241217-csi_dcmipp_mp25_enhancements-v1-0-2b432805d17d@foss.st.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Alain Volmat <alain.volmat@foss.st.com>
X-Mailer: b4 0.14.1
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

Clarify the description of the stm32 csi by mentioning CSI-2 and
D-PHY.
Remove the bus-type property from the example.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml b/Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml
index 33bedfe41924..e9fa3cfea5d2 100644
--- a/Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml
+++ b/Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml
@@ -7,8 +7,8 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: STMicroelectronics STM32 CSI controller
 
 description:
-  The STM32 CSI controller allows connecting a CSI based
-  camera to the DCMIPP camera pipeline.
+  The STM32 CSI controller, coupled with a D-PHY allows connecting a CSI-2
+  based camera to the DCMIPP camera pipeline.
 
 maintainers:
   - Alain Volmat <alain.volmat@foss.st.com>
@@ -109,7 +109,6 @@ examples:
                 endpoint {
                     remote-endpoint = <&imx335_ep>;
                     data-lanes = <1 2>;
-                    bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
                 };
             };
 

-- 
2.34.1


