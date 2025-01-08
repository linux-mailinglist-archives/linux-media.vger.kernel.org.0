Return-Path: <linux-media+bounces-24405-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD0EA05C88
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 14:18:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F1EEB18843A1
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 13:18:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E5DF1FC119;
	Wed,  8 Jan 2025 13:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="SGmP1VTI"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D331F8F0E;
	Wed,  8 Jan 2025 13:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736342302; cv=none; b=VeULsbT2/WDxU9b+No6crAENs+57Rvt6rTjKehZuDM2oISBqc+xVv7lesbwvyo4CGN0UYqCEQqsaVJuYhYzEdF5N7fFOQVmcsHLr18jJg3rtG1KkhYoWLJuCpFWH99IX9bDQk9DWTRTVq7URufVPBthvaC9CtaVY2AwTOC2z+Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736342302; c=relaxed/simple;
	bh=CXXJpWWnCnbGwRT5QUhmxoymGQOaUZiSd0d6E0XyYU8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=N+1bymbbR0SuDj7vxKVyulPE3aREbhE9OdA0mJqxB71bz2LnyyK+ySjMCIvwe0AsMSj9VXOyPK9LBXkt+HONXH4jWZrbRAyQhlwmKBFoESJPabvpTICXjFtS/Yak0opQ0O+aaV+5yuVhsU/6U69LZLpusmd83yLdMRGWovqPQEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=SGmP1VTI; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5089S71c008374;
	Wed, 8 Jan 2025 14:18:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	Wj89DE0wTJdp2wyTEZQwobNPweMsiKJIaFrQ1faSRt4=; b=SGmP1VTI879B4DYB
	Lxfmnfb0LNkZ+qOZAFgx4s1/7LpBjeP6jJ/DnLvf3//pjOPjY2BqmVuiGOWztO7f
	QIDGFOSXvRoAD07rcr4jcnIqwtNnLt6eOTV20Y2Q3k9TZ9jkrtOPkq6+ADCgxyM0
	R1JCI5+PazrY8CBRQr+WsrnhO2hKHOJVHE2VZ/O9Z+X1u8vOBTVnUxaFeFsKi/HL
	4bMCFYaReNvNOJvoeMIQmGN0TBwWtWnUYUiRVZ9tvL9cO6eAX/tZTBqlKNd5Cznc
	ifXZGYNDm193CeaI6ZxLdPc3T8UCkMUT3ROYbI3Mi2MLHJmkkLg+pTxGjkOxlfyu
	03A63Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 441m7t9md7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 14:18:02 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B6BE640047;
	Wed,  8 Jan 2025 14:17:00 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 04DCE2795F1;
	Wed,  8 Jan 2025 14:16:11 +0100 (CET)
Received: from localhost (10.252.31.140) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 8 Jan
 2025 14:16:10 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Wed, 8 Jan 2025 14:16:04 +0100
Subject: [PATCH v2 1/8] dt-bindings: media: clarify stm32 csi & simplify
 example
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250108-csi_dcmipp_mp25_enhancements-v2-1-05808ce50e41@foss.st.com>
References: <20250108-csi_dcmipp_mp25_enhancements-v2-0-05808ce50e41@foss.st.com>
In-Reply-To: <20250108-csi_dcmipp_mp25_enhancements-v2-0-05808ce50e41@foss.st.com>
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

Clarify the description of the stm32 CSI by mentioning CSI-2 and D-PHY.
Remove the bus-type property from the example since this CSI has a D-PHY,
which is the only bus-type option, making this property redundant.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>

---
v2: clarify commit message related to bus-type property removal within
    the example
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


