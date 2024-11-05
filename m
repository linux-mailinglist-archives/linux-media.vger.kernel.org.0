Return-Path: <linux-media+bounces-20875-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 784CB9BC77D
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 08:54:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0D777B226E7
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 07:54:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00A6520013F;
	Tue,  5 Nov 2024 07:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="AcmwMSyn"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B56282F1;
	Tue,  5 Nov 2024 07:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730793162; cv=none; b=W0Ck2dI/Hpz1IDbaj02DSNgFXDe2KU+3j6vM7E2F/uAr6YHU2nYtzcblXawB3M0Fvn0+PFHktXNSnCEh/CktJ9vNTKFYiOzroabHMidOckiiwsR0jUV9tLmF4JriRh3cZXkPB1frpAUmCL84W8YdvJXmSP0n6OXA2hmTvFTVycI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730793162; c=relaxed/simple;
	bh=V1zV4dk2RexT0VlhFpEXjyqddvw7mzRMMkBenDXXQzs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=mf6ZE5mRYMLIabJUn3ZFE+9quKlBNHtPnB9QfYha5MLDdrNVt1oykCj7lZyqfi6OppdxjtuYEQq9UQ/ad0SV9ptPwner0Bxs/u0iiN1w61jqhIEGHGhRKcnxtQph+b5PtpVU0MyAnZrJtcloQQAIGVjNb9NjKq5l0806vI0cCJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=AcmwMSyn; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A549V48025479;
	Tue, 5 Nov 2024 08:52:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	XnAbYm4VWUKZ0F1ePtL5cGK91Okpi3RKOo0VHnxT3ak=; b=AcmwMSynS2cZtSqX
	TJVEsdn86r9uuFsyt5bwqAuKA6eYiWjgAOVfMgvxnFfzjRIP8ZrWBtAp1vQfpKSG
	8Gtiy+06sRCuPSlE6TzCvrksd4ohbFRY/hoYZJ/cLfWAlGHmTro32+wdUhIPG+Dn
	6O5DA8Bv2erZBoZfKnn6HblXPNyX/38TCs/y1OmW5UGBeQUomZd4HAtY5PUCl1ai
	tjR37UNjcJngxsxG9yXO+8GdUw8boCcwu5ZbbZVS7UWiU/g28FPycM3/tF4S5uIH
	98N68fD+p/V2oFqS2IlHHz6XwQPCZX4MQOFcv5TXw5SzY6TiePr/DZDnWLn960rr
	+Zeqcg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42ncxbtucu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 08:52:27 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id AE4F040050;
	Tue,  5 Nov 2024 08:50:26 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 088E72513C1;
	Tue,  5 Nov 2024 08:49:37 +0100 (CET)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 5 Nov
 2024 08:49:36 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 5 Nov 2024 08:49:17 +0100
Subject: [PATCH v2 14/15] arm64: dts: st: add csi & dcmipp node in
 stm32mp25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241105-csi_dcmipp_mp25-v2-14-b9fc8a7273c2@foss.st.com>
References: <20241105-csi_dcmipp_mp25-v2-0-b9fc8a7273c2@foss.st.com>
In-Reply-To: <20241105-csi_dcmipp_mp25-v2-0-b9fc8a7273c2@foss.st.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Hans Verkuil
	<hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Alain Volmat <alain.volmat@foss.st.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

Add nodes describing the csi and dcmipp controllers handling the
camera pipeline on the stm32mp25x.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 1167cf63d7e87aaa15c5c1ed70a9f6511fd818d4..6f8cabf2c5985f358689f15296300de24e9d9b25 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -518,6 +518,29 @@ i2c8: i2c@46040000 {
 				status = "disabled";
 			};
 
+			csi: csi@48020000 {
+				compatible = "st,stm32mp25-csi";
+				reg = <0x48020000 0x2000>;
+				interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>;
+				resets = <&rcc CSI_R>;
+				clocks = <&rcc CK_KER_CSI>, <&rcc CK_KER_CSITXESC>,
+					 <&rcc CK_KER_CSIPHY>;
+				clock-names = "pclk", "txesc", "csi2phy";
+				access-controllers = <&rifsc 86>;
+				status = "disabled";
+			};
+
+			dcmipp: dcmipp@48030000 {
+				compatible = "st,stm32mp25-dcmipp";
+				reg = <0x48030000 0x1000>;
+				interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH>;
+				resets = <&rcc DCMIPP_R>;
+				clocks = <&rcc CK_BUS_DCMIPP>, <&rcc CK_KER_CSI>;
+				clock-names = "kclk", "mclk";
+				access-controllers = <&rifsc 87>;
+				status = "disabled";
+			};
+
 			sdmmc1: mmc@48220000 {
 				compatible = "st,stm32mp25-sdmmc2", "arm,pl18x", "arm,primecell";
 				arm,primecell-periphid = <0x00353180>;

-- 
2.25.1


