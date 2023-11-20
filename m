Return-Path: <linux-media+bounces-619-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB457F1977
	for <lists+linux-media@lfdr.de>; Mon, 20 Nov 2023 18:11:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB4161F24331
	for <lists+linux-media@lfdr.de>; Mon, 20 Nov 2023 17:11:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3172D2031D;
	Mon, 20 Nov 2023 17:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="s4RUlMn4"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7257EBE;
	Mon, 20 Nov 2023 09:10:51 -0800 (PST)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3AKEl1jY025028;
	Mon, 20 Nov 2023 18:10:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	selector1; bh=fE1n5RTIzcUozo7IYZhXqyrLMqCuRn0oukoD09IgbtQ=; b=s4
	RUlMn4xDOS76UhFdDHsNgmqz7UWfkThQGj4tetBhuxgqgzeaYTZoJy85MgLiXLeY
	gEAE3IiwKqxsCdIyqvmznuwOa9uWKLbhNqrnosoTJKtgZVyjJ1GvolMHFq6syXf3
	zv9jcUO/DXa7Kn/0e/iqX7YmyvyBOGElKNS1pKALsqtrZKF5X/97iZJ7eqY0+9CB
	wFLcKxAmLlJ/6sgYXfo+MsOtGdQj3wxMt03+fk52qD7+msUmAGx3LZYa1QVBUOFa
	JCL6fnpsOdAv2rV2PCOHhh1dZZqEU+LGffVLG0cQwfN8Mhpc3SMsg7R4pvhE/8KT
	7SwYQaGhrZdMMSjcLqag==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3uen1hysh9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Nov 2023 18:10:32 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E095910002A;
	Mon, 20 Nov 2023 18:10:31 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D4EA3237D6F;
	Mon, 20 Nov 2023 18:10:31 +0100 (CET)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 20 Nov
 2023 18:10:31 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Alain Volmat
	<alain.volmat@foss.st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob
 Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Russell King <linux@armlinux.org.uk>,
        Philipp
 Zabel <p.zabel@pengutronix.de>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>,
        Dan Scally
	<dan.scally@ideasonboard.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 4/5] ARM: dts: stm32: add dcmipp support to stm32mp135
Date: Mon, 20 Nov 2023 18:08:00 +0100
Message-ID: <20231120170809.728941-5-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231120170809.728941-1-alain.volmat@foss.st.com>
References: <20231120170809.728941-1-alain.volmat@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.129.178.213]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-20_17,2023-11-20_01,2023-05-22_02

From: Hugues Fruchet <hugues.fruchet@foss.st.com>

Add dcmipp support to STM32MP135.

Signed-off-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 arch/arm/boot/dts/st/stm32mp135.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp135.dtsi b/arch/arm/boot/dts/st/stm32mp135.dtsi
index abf2acd37b4e..68d32f9f5314 100644
--- a/arch/arm/boot/dts/st/stm32mp135.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp135.dtsi
@@ -8,5 +8,16 @@
 
 / {
 	soc {
+		dcmipp: dcmipp@5a000000 {
+			compatible = "st,stm32mp13-dcmipp";
+			reg = <0x5a000000 0x400>;
+			interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rcc DCMIPP_R>;
+			clocks = <&rcc DCMIPP_K>;
+			status = "disabled";
+
+			port {
+			};
+		};
 	};
 };
-- 
2.25.1


