Return-Path: <linux-media+bounces-1714-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECA58067A4
	for <lists+linux-media@lfdr.de>; Wed,  6 Dec 2023 07:38:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0029FB20FD7
	for <lists+linux-media@lfdr.de>; Wed,  6 Dec 2023 06:38:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A3C112E6E;
	Wed,  6 Dec 2023 06:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="X613SzLi"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16B2E10F4
	for <linux-media@vger.kernel.org>; Tue,  5 Dec 2023 22:38:17 -0800 (PST)
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20231206063815epoutp01f619c5693b87c60851186a08b6272f2e~eKrvd_p5Q2682726827epoutp01k
	for <linux-media@vger.kernel.org>; Wed,  6 Dec 2023 06:38:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20231206063815epoutp01f619c5693b87c60851186a08b6272f2e~eKrvd_p5Q2682726827epoutp01k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1701844695;
	bh=+dA8CLW4Uw8h0Ln1czVzzbczb8qavjLH60g5Jc7kYyw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X613SzLi108z59aYNcKaJ8q9JL8bSyFrxVqaTQgYOY24yD3AkQErqYBt+LBTC2/hC
	 C2UWh9JPpD8VpozXgzsXXs0CMSVVVJfkBWHQ/zNTJj1COclxwxt1Db2ocFYdOaiVJt
	 QxtFN9qQYTQL5cl/lgTuCdF9miQ9Y6+gQEI1und8=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTP id
	20231206063815epcas5p38891ae2a02cb760aaf91a073b51be495~eKru-N5ZD0692206922epcas5p36;
	Wed,  6 Dec 2023 06:38:15 +0000 (GMT)
Received: from epsmgec5p1new.samsung.com (unknown [182.195.38.178]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4SlSQY10qYz4x9Pp; Wed,  6 Dec
	2023 06:38:13 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
	epsmgec5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	D7.D5.08567.5D610756; Wed,  6 Dec 2023 15:38:13 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20231206063140epcas5p1ba86525117f4d9ec9172ae7cb18b7420~eKl-klOGr1915119151epcas5p1Y;
	Wed,  6 Dec 2023 06:31:40 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20231206063140epsmtrp1514d221fa74fb562dc52274e24214301~eKl-jYr5e1588615886epsmtrp1h;
	Wed,  6 Dec 2023 06:31:40 +0000 (GMT)
X-AuditID: b6c32a44-617fd70000002177-23-657016d52c4b
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	34.A6.07368.C4510756; Wed,  6 Dec 2023 15:31:40 +0900 (KST)
Received: from cheetah.sa.corp.samsungelectronics.net (unknown
	[107.109.115.53]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20231206063137epsmtip21b3bf3f83a9d036871d7de0b4c1cfe80~eKl80fbta0816708167epsmtip2L;
	Wed,  6 Dec 2023 06:31:37 +0000 (GMT)
From: Aakarsh Jain <aakarsh.jain@samsung.com>
To: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: m.szyprowski@samsung.com, andrzej.hajda@intel.com, mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl, krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org, conor+dt@kernel.org, linux-samsung-soc@vger.kernel.org,
	andi@etezian.org, gost.dev@samsung.com, alim.akhtar@samsung.com,
	aswani.reddy@samsung.com, pankaj.dubey@samsung.com,
	ajaykumar.rs@samsung.com, aakarsh.jain@samsung.com, linux-fsd@tesla.com,
	Smitha T Murthy <smithatmurthy@gmail.com>
Subject: [Patch v5 11/11] arm64: dts: fsd: Add MFC related DT enteries
Date: Wed,  6 Dec 2023 12:00:45 +0530
Message-Id: <20231206063045.97234-12-aakarsh.jain@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231206063045.97234-1-aakarsh.jain@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHJsWRmVeSWpSXmKPExsWy7bCmpu5VsYJUg8Y9LBZPd8xktTjw/iCL
	xYN529gsFv94zmRxf/FnFotDm7eyW6zZe47JYv6Rc6wWNw/sZLK4OPMui0Xfi4fMFpseX2O1
	ePgq3OLyrjlsFj0btrJazDi/j8li7ZG77BbLNv1hsli09Qu7ReveI+wWLY1LWB1EPa4v+cTs
	sXPWXXaPxXteMnlsWtXJ5nHn2h42j81L6j36tqxi9PjXNJfd4/MmOY9TXz+zB3BFZdtkpCam
	pBYppOYl56dk5qXbKnkHxzvHm5oZGOoaWlqYKynkJeam2iq5+AToumXmAP2opFCWmFMKFApI
	LC5W0rezKcovLUlVyMgvLrFVSi1IySkwKdArTswtLs1L18tLLbEyNDAwMgUqTMjO6H29lalg
	P1fFz0XbGBsYV3B0MXJySAiYSDx51sncxcjFISSwm1Hi2aZJrBDOJ0aJRRcXQznfGCUOTb/F
	AtNy8Ns/qJa9jBJTP11ng3BamSQ2zbgOlOHgYBPQlTi7PQekQUSgkVHicUcJSA2zwHFmiQUT
	ZoJNEhZwk/jy/DwziM0ioCrx7MsFRhCbV8BOYn/rDmaIbfISqzccALM5geJT1iwAO0lC4AaH
	xKutT6CKXCTmHv/ACmELS7w6voUdwpaSeNnfBmUnSzxe9BKqPkdi/Z4pUO/YSxy4MocF5Ghm
	AU2J9bv0IcKyElNPrWMCsZkF+CR6fz9hgojzSuyYB2OrScy58wNqrYzE4dVLGSFsD4k/b6dA
	A2Uio8TFT3uZJjDKzUJYsYCRcRWjZGpBcW56arJpgWFeajk82pLzczcxghOylssOxhvz/+kd
	YmTiYDzEKMHBrCTCm3M+P1WINyWxsiq1KD++qDQntfgQoykwACcyS4km5wNzQl5JvKGJpYGJ
	mZmZiaWxmaGSOO/r1rkpQgLpiSWp2ampBalFMH1MHJxSDUzh/9K/n14T7nDunkubzOQpt/7N
	r8z4knGnSs3dfu7ajR8XenSsP6WTvt/7bFRsZo5KYfYTodsBMuf/XpjNm7S+WqXoLmPlaaaa
	8O2KPU0FE1d9Nv3MxWojW2O43viXwIMF0fzM2W+v+pbL7VE8petlN2tS464NTIGfjrhbJG9X
	ff/dSkxB3vfXJeae0ykbtr+7+muK+xJbxZUP3fd3MGiUa0w48PLFb+Yj/2a77E2UuaK5pPV3
	rNexCxNEiiIZVKT3M983+KrB5y/86onjmhnyD4U6jy89efH0Z3+5pK1bQy2vnjcIW2Ef7h6/
	9F8E494cq8aCPc5vc99KPl7SM113YtCFrLNx/OpeljeUC2uVWIozEg21mIuKEwHlnZAOUQQA
	AA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrCLMWRmVeSWpSXmKPExsWy7bCSvK6PaEGqwbyFEhZPd8xktTjw/iCL
	xYN529gsFv94zmRxf/FnFotDm7eyW6zZe47JYv6Rc6wWNw/sZLK4OPMui0Xfi4fMFpseX2O1
	ePgq3OLyrjlsFj0btrJazDi/j8li7ZG77BbLNv1hsli09Qu7ReveI+wWLY1LWB1EPa4v+cTs
	sXPWXXaPxXteMnlsWtXJ5nHn2h42j81L6j36tqxi9PjXNJfd4/MmOY9TXz+zB3BFcdmkpOZk
	lqUW6dslcGX0vt7KVLCfq+Lnom2MDYwrOLoYOTkkBEwkDn77x9zFyMUhJLCbUeLF07+sEAkZ
	if9tx9ghbGGJlf+es0MUNTNJXGhbx9jFyMHBJqArcXZ7DkhcRKCVUeL6yk4mEIdZ4DazxKYJ
	D8G6hQXcJL48P88MYrMIqEo8+3KBEcTmFbCT2N+6gxlig7zE6g0HwGxOoPiUNQtYQRYICdhK
	rDzpOIGRbwEjwypGydSC4tz03GTDAsO81HK94sTc4tK8dL3k/NxNjOCI0dLYwXhv/j+9Q4xM
	HIyHGCU4mJVEeHPO56cK8aYkVlalFuXHF5XmpBYfYpTmYFES5zWcMTtFSCA9sSQ1OzW1ILUI
	JsvEwSnVwJSTuEv74vYl1k86zbTluzkS8kJk/Kw7FSO4P7f+Kjx2dvPdLeUPwmJDRT7csg/5
	tzPhQ8NMk8V8L6b/X/FxxrT+e1JnbJew8Wdtjin+eSHmV7/UopWexa6KC34G5ufw3t4WeHSl
	m9WHzo+zeDPTBUry4rk3fD93bl5i99c/qkEibzI257KtnKZ0wt7g/Oud7Jom4R8Xb/Csctc9
	1SlwePqK//P8jQ/Lc2kEZ1h+Z1gSauol+cd1fcjzX/+3buUQ6i2fNdmXdUHtMa0TD9eW3rWM
	XHdiEU/if747+pECytvOTb3y4KJDdLjuqe0bmHfInDzKOb1E6WYM84qgaNZT7r4Fsi1L45RX
	Md48qjHNR12JpTgj0VCLuag4EQB5WGqRBwMAAA==
X-CMS-MailID: 20231206063140epcas5p1ba86525117f4d9ec9172ae7cb18b7420
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20231206063140epcas5p1ba86525117f4d9ec9172ae7cb18b7420
References: <20231206063045.97234-1-aakarsh.jain@samsung.com>
	<CGME20231206063140epcas5p1ba86525117f4d9ec9172ae7cb18b7420@epcas5p1.samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

Add MFC DT node and reserve memory node for MFC usage.

Cc: linux-fsd@tesla.com
Signed-off-by: Smitha T Murthy <smithatmurthy@gmail.com>
Signed-off-by: Aakarsh Jain <aakarsh.jain@samsung.com>
---
 arch/arm64/boot/dts/tesla/fsd.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/tesla/fsd.dtsi b/arch/arm64/boot/dts/tesla/fsd.dtsi
index bb50a9f7db4a..f421012b0a4a 100644
--- a/arch/arm64/boot/dts/tesla/fsd.dtsi
+++ b/arch/arm64/boot/dts/tesla/fsd.dtsi
@@ -342,6 +342,18 @@
 		#clock-cells = <0>;
 	};
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		mfc_left: region@84000000 {
+			compatible = "shared-dma-pool";
+			no-map;
+			reg = <0 0x84000000 0 0x8000000>;
+		};
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -956,6 +968,15 @@
 			clock-names = "fin_pll", "mct";
 		};
 
+		mfc: mfc@12880000 {
+			compatible = "tesla,fsd-mfc";
+			reg = <0x0 0x12880000 0x0 0x10000>;
+			interrupts = <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "mfc";
+			clocks = <&clock_mfc MFC_MFC_IPCLKPORT_ACLK>;
+			memory-region = <&mfc_left>;
+		};
+
 		ufs: ufs@15120000 {
 			compatible = "tesla,fsd-ufs";
 			reg = <0x0 0x15120000 0x0 0x200>,  /* 0: HCI standard */
-- 
2.17.1


