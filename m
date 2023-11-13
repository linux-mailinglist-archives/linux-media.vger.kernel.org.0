Return-Path: <linux-media+bounces-192-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C941A7E96F7
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 08:09:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 79AC81F210D9
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 07:09:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25F5F125A8;
	Mon, 13 Nov 2023 07:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="njokgWer"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9A98BFC;
	Mon, 13 Nov 2023 07:09:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CAA710F1;
	Sun, 12 Nov 2023 23:09:07 -0800 (PST)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3ACMav6V007581;
	Mon, 13 Nov 2023 08:08:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	selector1; bh=11mGKtnf68sv5F45K9ozUTLxzWamUOebDrS0r3G08pY=; b=nj
	okgWer2C4unQQkwkjWb1WB+d3FyxHmO6fbe+TSEz2fVS6+xOyekaX5oY6EdQN73U
	LGOiM4FMt8MJvq/6OqCC4bMVxBqTbvFNW4aBp7xGnSzgQYv29hFlFX7Yd5t8flY1
	iFCgY0JG5oFgeWe8Q7qrWa67D4cl3kmPaNOx6Gcc8kVj3Lz/wK9KXsdckNqRc2hn
	Gtq4Xed4fSQEzQHEtZH6CmG6YJb4zdOfyVXmQux8j6UlFawrAS8z2ojk8yDU53jx
	b46YdOb/IXB+VMywiOxaq+ggcFDBW3EAcBMS1tSNO6c8vPZLA1nx3/5fQavNrHvZ
	zDVooa6w6e7rShOn+Myg==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3u9ywkwvgq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Nov 2023 08:08:54 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B8E09100063;
	Mon, 13 Nov 2023 08:08:48 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AF4F32092FD;
	Mon, 13 Nov 2023 08:08:48 +0100 (CET)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 13 Nov
 2023 08:08:48 +0100
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
Subject: [PATCH v6 5/5] ARM: multi_v7_defconfig: enable STM32 DCMIPP media support
Date: Mon, 13 Nov 2023 08:05:24 +0100
Message-ID: <20231113070532.71509-6-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231113070532.71509-1-alain.volmat@foss.st.com>
References: <20231113070532.71509-1-alain.volmat@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.129.178.213]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-12_24,2023-11-09_01,2023-05-22_02

From: Hugues Fruchet <hugues.fruchet@foss.st.com>

Enables support of STM32 DCMIPP V4L2 media driver.

Signed-off-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index f08f39a3ed2b..86120e1c1503 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -690,6 +690,7 @@ CONFIG_VIDEO_STI_BDISP=m
 CONFIG_VIDEO_STI_DELTA=m
 CONFIG_VIDEO_STI_HVA=m
 CONFIG_VIDEO_STM32_DCMI=m
+CONFIG_VIDEO_STM32_DCMIPP=m
 CONFIG_V4L_TEST_DRIVERS=y
 CONFIG_VIDEO_VIVID=m
 CONFIG_VIDEO_ADV7180=m
-- 
2.25.1


