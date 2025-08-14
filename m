Return-Path: <linux-media+bounces-40062-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F06B2983E
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 06:37:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AF8A27ADB58
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 04:36:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7461525B1C5;
	Mon, 18 Aug 2025 04:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="jYemU/V/"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D537C2627F9
	for <linux-media@vger.kernel.org>; Mon, 18 Aug 2025 04:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755491843; cv=none; b=MYW3GYSf4ZrJqBrrBFwxYaXl2edliATBOJQc+Fh0Koo9hl8UHutmKjtdmymsTzN3JsWJi5E81nnp3dPXfq/AvVU9wUdHV0C+1FMNB1oay/JUUKt+HwxOK5Td3X9cyrKfEX+cJT4648/RhMEt7IHOWB91S+RA+Xl1ZQDj/9gzmcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755491843; c=relaxed/simple;
	bh=eQ6mbLJ666ylH+iobL9nwWrhK1RwBh90HeDv3LHcVhs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=a3p7a9Z5PQ5KsiDzpPR1aE8QWkGyvYyWk3KxjX0CSyAXLwggJSb8PVBpBb+ZZR64NOqbG9ZcHu4dX2bUyAE+Bd/G83LxNB1e4NghjUURQstC38HSTC2suQNrkWTCvFhSAxLPAxGjvHyeWQbTKuoGzHkquCRJsxj1gaCCs60tlbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=jYemU/V/; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250818043719epoutp0292543ea8abdec5fc12c325a1a1fe0193~cwocGlU5t1614916149epoutp02_
	for <linux-media@vger.kernel.org>; Mon, 18 Aug 2025 04:37:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250818043719epoutp0292543ea8abdec5fc12c325a1a1fe0193~cwocGlU5t1614916149epoutp02_
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755491839;
	bh=xl82Otcai0y60jQ/O2jr10UdDoE6TM4ftxxvpBCLJQM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jYemU/V/NSIjwx2P2zVz9QHeHiLPzTGKU2zfEGt5cM3QJ98lu1YulWakYgzC4fqaF
	 /DqnWCrvI/dYcihH0SF2zLDz2TJj+hO73tSW8MkpwsrkmcER3U5HKa5zpDK40ztgJh
	 ao1k7ANX4H9tXiS9fefTxWHjCrNltBMyc7oQ03uI=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250818043719epcas5p4910c652177a448bc6bad489f6c7e881a~cwobik0sO1032010320epcas5p4g;
	Mon, 18 Aug 2025 04:37:19 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.90]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4c50LQ2Nhjz6B9m4; Mon, 18 Aug
	2025 04:37:18 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250814141003epcas5p167e0a3d0ecc52fd8af17151cdddd031a~bp3W8Nc0d0355303553epcas5p1H;
	Thu, 14 Aug 2025 14:10:03 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250814140959epsmtip2c60bd3f2bed42df98c8f3e5a092a9a7a~bp3THPJDQ1586615866epsmtip2A;
	Thu, 14 Aug 2025 14:09:59 +0000 (GMT)
From: Inbaraj E <inbaraj.e@samsung.com>
To: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org,
	s.nawrocki@samsung.com, s.hauer@pengutronix.de, shawnguo@kernel.org,
	cw00.choi@samsung.com, rmfrfs@gmail.com, laurent.pinchart@ideasonboard.com,
	martink@posteo.de, mchehab@kernel.org, linux-fsd@tesla.com, will@kernel.org,
	catalin.marinas@arm.com, pankaj.dubey@samsung.com, shradha.t@samsung.com,
	ravi.patel@samsung.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, alim.akhtar@samsung.com,
	linux-samsung-soc@vger.kernel.org, kernel@puri.sm, kernel@pengutronix.de,
	festevam@gmail.com, linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Inbaraj E <inbaraj.e@samsung.com>
Subject: [PATCH v2 01/12] dt-bindings: clock: Add CAM_CSI clock macro for
 FSD
Date: Thu, 14 Aug 2025 19:39:32 +0530
Message-ID: <20250814140943.22531-2-inbaraj.e@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250814140943.22531-1-inbaraj.e@samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250814141003epcas5p167e0a3d0ecc52fd8af17151cdddd031a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250814141003epcas5p167e0a3d0ecc52fd8af17151cdddd031a
References: <20250814140943.22531-1-inbaraj.e@samsung.com>
	<CGME20250814141003epcas5p167e0a3d0ecc52fd8af17151cdddd031a@epcas5p1.samsung.com>

CAM_CSI block has ACLK, PCLK and PLL clocks. PCLK id is already
assigned. To use PCLK and PLL clock in driver add id macro for CAM_CSI_PLL
and CAM_CSI_PCLK.

Signed-off-by: Inbaraj E <inbaraj.e@samsung.com>
---
 include/dt-bindings/clock/fsd-clk.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/dt-bindings/clock/fsd-clk.h b/include/dt-bindings/clock/fsd-clk.h
index 3f7b64d93558..58fdec8f4c2a 100644
--- a/include/dt-bindings/clock/fsd-clk.h
+++ b/include/dt-bindings/clock/fsd-clk.h
@@ -139,5 +139,18 @@
 #define CAM_CSI2_1_IPCLKPORT_I_ACLK		10
 #define CAM_CSI2_2_IPCLKPORT_I_ACLK		11
 #define CAM_CSI2_3_IPCLKPORT_I_ACLK		12
+#define CAM_CSI_PLL				13
+#define CAM_CSI0_0_IPCLKPORT_I_PCLK		14
+#define CAM_CSI0_1_IPCLKPORT_I_PCLK		15
+#define CAM_CSI0_2_IPCLKPORT_I_PCLK		16
+#define CAM_CSI0_3_IPCLKPORT_I_PCLK		17
+#define CAM_CSI1_0_IPCLKPORT_I_PCLK		18
+#define CAM_CSI1_1_IPCLKPORT_I_PCLK		19
+#define CAM_CSI1_2_IPCLKPORT_I_PCLK		20
+#define CAM_CSI1_3_IPCLKPORT_I_PCLK		21
+#define CAM_CSI2_0_IPCLKPORT_I_PCLK		22
+#define CAM_CSI2_1_IPCLKPORT_I_PCLK		23
+#define CAM_CSI2_2_IPCLKPORT_I_PCLK		24
+#define CAM_CSI2_3_IPCLKPORT_I_PCLK		25
 
 #endif /*_DT_BINDINGS_CLOCK_FSD_H */
-- 
2.49.0


