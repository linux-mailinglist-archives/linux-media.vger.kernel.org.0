Return-Path: <linux-media+bounces-50318-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 16741D0B725
	for <lists+linux-media@lfdr.de>; Fri, 09 Jan 2026 18:00:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F1A40302BFBC
	for <lists+linux-media@lfdr.de>; Fri,  9 Jan 2026 16:59:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 462D936920B;
	Fri,  9 Jan 2026 16:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bw2aC5Va";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SY4eSbsb"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2468C366578
	for <linux-media@vger.kernel.org>; Fri,  9 Jan 2026 16:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767977916; cv=none; b=qS44V1BqyLkyqVvN06I6BA4HfYdDi41ybwClYsFns3nY93sFiPjaTpBYrgXAC08Hovs6+WaLDaesrwpH0S/hnubvNRCZeW3vFoNBF0Ud0qS4k+Bo3iY/4xAqW2q4p0ngrrwYw1nckL9YJsCCbsRG4xC4j8lotutwOkzfAv59GQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767977916; c=relaxed/simple;
	bh=Uyp3c+ZcOw7zIw42zFp5/g9Wh9eWtjdFSWod2VZLRvk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YmfcGTN40r2wLLsro5LDs0xZoZmAoWBp8p7b9cCWfsAQKFqfyYtMcHVugCP2UTafg/ZQnPYoHcPa3dLq11dlhXimHWAvwWJb/U2U60znyi7V0mijw7BekQbhWGg6KTJ/YKfMUbZ6ZWvBGYyUTP/sfY0af/YzlbJImmgs+GTFpv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bw2aC5Va; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SY4eSbsb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 609DtTvp3142583
	for <linux-media@vger.kernel.org>; Fri, 9 Jan 2026 16:58:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ow1+Sylf0/GThA8sV9q6qdIH/jdzl1X0FeZ+BXt7EwU=; b=bw2aC5Vaevcd1ryh
	uLRScVJd87DWUmrA40LMCkcsxHs9m3waqPfan7pxpk6GgRcWkXgbZyKBBJewy4mc
	8hoQ1vxxohXNFijNlFrHk8OXGA/0eQAA4iVRKadwITNauTbs33ODpf72fxDuIdrc
	j96M9/kkJepyhfIrGr9+iDj277g3/eIxWIw7Uo5NFCnERiu9t+yC468YC8pXSltO
	BufnFUaYO6zxBsrLzGdz8GIRZhxHThIJ/GbLvxRHx4fUsRA/iL7QbKmAMCGOoBjs
	vlnVpQbNGySWSaUAqIyte7Glum03G3Ppot/BH0+1Nnoft90P7Mr6af8tRz/Wy4IW
	nkU2aw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjj8j3d9w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 09 Jan 2026 16:58:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b17194d321so667345585a.0
        for <linux-media@vger.kernel.org>; Fri, 09 Jan 2026 08:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767977911; x=1768582711; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ow1+Sylf0/GThA8sV9q6qdIH/jdzl1X0FeZ+BXt7EwU=;
        b=SY4eSbsbMvMOjQ9Du3fK3UKSRZHNa5ugxQxuNzs5KCc43RXzRseaBGdt+C7UAfRcxO
         VHh93YwFaqbUYwh+cVIsy/FJvWrlzpyyDzW4s08nSIEtSdneAkjS9fGrOeONCOTQ181B
         smeT7mpMjjkMBkWFKd76jXqxzjcMs3ShosE+ZNuenOMZNzm6tcy+pbpEGlhFmphgsS+b
         dfYGbBdTJsq2YqjPJ0vRo26nndnq9uvgz7htpMKOP/7DJSPfpMQbkVKwXf6i7g8Qef/e
         XaOB6MSQe8Lqjk/9caI+VgJTQiv8P9p2HPNa3muy9115nvtgcAoGBeiZXQLZutuwllTe
         6/pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767977911; x=1768582711;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ow1+Sylf0/GThA8sV9q6qdIH/jdzl1X0FeZ+BXt7EwU=;
        b=MOWxqmAG1s3NDTL4aNCdV52SezeKtUDxnoX4u8+mHS2I+N3BS5WAeNHaGXTSkHdjfe
         1k9K4DP+psPGERXhFe4cWbSZDtdom+G7krf0R8P9roj/9iKUlqfWOhRsQvhRVV0fcTJw
         q1IPTkJqSB4OYBxlzyYibv+VdMk7YgTbsk+NvX/w082+1YQWEg19d4Mv56d5D25fowWB
         Bp0IMSnyDsbubgBbzAvGuKaMvfF3pYCKTFQaVt5mhEqiYvxEXtnZrSjBilc29YrbxLdt
         1+16/TicXhZbTtH3JFVss6G9n4yzkvDEk3NXIjb87wTrvdid6OeKsKglLKIWengLjqXk
         cgtA==
X-Forwarded-Encrypted: i=1; AJvYcCXd9xAax9SFGforXrQrMTMceCa5lo9E9EUQA32Kq9goDBQxCHUHXh6UlPoXMISt5N5dXEu7fBiey+SsvA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbeLoFv2NDBqXHD8eAwXh2hSYhwreriAf6GiIJD3XW+gPJyMxk
	pPfCa8wicUYixRNJtW+kLzL9SegSIXVJqmx55+TveGJxRJQ9IOctQgItVmqIwjDerJd1uT0zwqb
	VKAwH+GA3wSo2E/0clHtzv6UrpiO/bS8ftZ8wm3JbgcLaukU8uZE+SaX4Yqx9dk3PUA==
X-Gm-Gg: AY/fxX5DUe4KeYPqM7WjcWtU8qSQIEkkrS19jCyEetmJmh2QZok++SN8I0n0gBNWOuh
	YuKgl03o2hCbSnH3a0KpegWii8LFeh9VxqF4d9FCJ5gXMe9o5w2MWS6XCnsdDhgjs4J1O+v2pzH
	YXVMaBczJwKpFFen3xDRIXKBfFyptRJtKI8C3/OTfT36mORX60ikL1pT1IsoW0FjqCCMEapYy/3
	04rsSivIQru5fwedwT2fqEcRjML6G1nrf8xeQkX2vtCbEAyGnRIfjuUUNleyu3ImVFR+V4YTzy5
	NdHqS3SbQJ+oUroYGOtDxVMTQvTt7l4e9NHVjtYrtJHb+ThJ1rhunj1YMA2tSmzLdIaW/R+2Rqu
	IqUIVjhYpfmIZDhxCM0iZ6OPo+SWMP8Kv0g==
X-Received: by 2002:a05:620a:31a4:b0:8b2:9a8a:118b with SMTP id af79cd13be357-8c3893ee38emr1424669685a.73.1767977911275;
        Fri, 09 Jan 2026 08:58:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEagzIp+psjVuVk3GVMCLnSaVXjxxAaX3Szhc6w4avTMmKqAquuUCbyZR4B9aXL0lO+SjkmzA==
X-Received: by 2002:a05:620a:31a4:b0:8b2:9a8a:118b with SMTP id af79cd13be357-8c3893ee38emr1424664785a.73.1767977910752;
        Fri, 09 Jan 2026 08:58:30 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee243sm23231784f8f.31.2026.01.09.08.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 08:58:29 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 09 Jan 2026 17:57:53 +0100
Subject: [PATCH v3 09/12] clk: imx: imx31: Simplify with scoped for each OF
 child loop
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-of-for-each-compatible-scoped-v3-9-c22fa2c0749a@oss.qualcomm.com>
References: <20260109-of-for-each-compatible-scoped-v3-0-c22fa2c0749a@oss.qualcomm.com>
In-Reply-To: <20260109-of-for-each-compatible-scoped-v3-0-c22fa2c0749a@oss.qualcomm.com>
To: Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Nipun Gupta <nipun.gupta@amd.com>,
        Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Vinod Koul <vkoul@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-clk@vger.kernel.org, imx@lists.linux.dev,
        dmaengine@vger.kernel.org, linux-media@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        Frank Li <Frank.Li@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1361;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Uyp3c+ZcOw7zIw42zFp5/g9Wh9eWtjdFSWod2VZLRvk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpYTOYPsGxvbeXsQGj23rJ/C/cCYfiZObAB9ixz
 y53oRvcWfCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWEzmAAKCRDBN2bmhouD
 11quD/932ltOa1s5tv7DudKIHF/1ebbW/6MsuD85b7MWtuPg8Ls//bcv8pKK2ldqRl0TTVl8PkE
 ymOrPYPnkMOZ0U9NghNrj6KVF4exeUKx90kH9QNCtz+HIZj1nJxO0FP4sAeusOxe6LC0XrIZIgV
 t3AG7s68MxFbVkr5P5MZWLUEqHSyz9ZPyXHNFZ94LoQ7nkL0OsIZ/eFD2njaVT1fP3AysNNBx2X
 nCgqMQaEuqrrH0p1fZir1tlD31Jcd7sExD5GCAdljD6E0uZpm8xNDlJlWECzk2Dw5Ap3COM+KYn
 e3zK6tgBgEPPZ79RFbRXCQWkuIDeyGMDek+78gSufysu1DMds4kQXEFiPurkbSasHj8KuVA2KW9
 +nolYW3e2wYzPGG5gPHWoiE4CUFSKxy0t36hEQhgMQLZezOD3Cld6uvoW35Vd3m3ycLRErbjfs7
 0vTrDkBhUznPnLA3rEEGgGNBoT2i2rJ4Bsh+ilpoIs4vuaPh3wm24arsSyvlOSA93Gg5fvpEVQM
 zbhxmpeJHsu/YUcSjCtdx3PmTZodhUNm03jj+1Cm733yQFBZLh90bbahZL9OSE0bE96DdNCG7UV
 Uc6hfMZyGk02iLvd/M2xdswLxMksBmEDF0VsW9mDk1UbCL+lLFy8lbJGfwOECeeEF+4EZKw0VJG
 3miz2lZ0KOeMIoA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDEyOCBTYWx0ZWRfX6pEAyP6QP59k
 JyTEoeYJdprZlGB9pif383TjAMyx3xNpq8j8g6lovp4FUavFzpzR4iZ+uZB4VGjXvc7PqHDSNgd
 IhO59Y3U3CVR9K+IGs939BPCBUG3ot6csaEycFw2xIIvW8dlB6WX4iLQkAXK4qAcsV67HClw9Ch
 Q7W5W71XOZF/8YKgV5SwCRmVMCuRkxbhnbKZmG4uzdes0mvME2Yk6R+j3KnT5G9ERBb1rpKougS
 6k2iV1SPH2oQU+cQnsOTXh21PshRaQnVv9xGwznulvzPMx5/o1CWcxPazu6+yswwnADhgMIexRS
 IWgKhjfqWEWAirNY5zGK13iHUp7UEk2EmPhW4RZ+YOeeS0M0ix8OFQRZSsJMt2mr+svsntGQiL1
 H3yBUmoxI9NTe15AXxFZitqg5v2/NZtYpJ9CdYS+DyYiD/WdHv8tVZ9AUK0/5zCOpvk4jnyzDf/
 Y5v4GWX57dpmvwcfTLw==
X-Authority-Analysis: v=2.4 cv=JIs2csKb c=1 sm=1 tr=0 ts=696133b7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8AirrxEcAAAA:8 a=i0EeH86SAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=RsIb78jGsj8zXbp4E7EA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: 4cPlYJ4NP5Zw6PRL8oEI2QCw1_jbov9k
X-Proofpoint-ORIG-GUID: 4cPlYJ4NP5Zw6PRL8oEI2QCw1_jbov9k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_05,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090128

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Acked-by: Abel Vesa <abelvesa@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Depends on first patch.
---
 drivers/clk/imx/clk-imx31.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/imx/clk-imx31.c b/drivers/clk/imx/clk-imx31.c
index 4c8d9ff0b2ad..962eccac63ce 100644
--- a/drivers/clk/imx/clk-imx31.c
+++ b/drivers/clk/imx/clk-imx31.c
@@ -123,18 +123,15 @@ static void __init _mx31_clocks_init(void __iomem *base, unsigned long fref)
 
 static void __init mx31_clocks_init_dt(struct device_node *np)
 {
-	struct device_node *osc_np;
 	u32 fref = 26000000; /* default */
 	void __iomem *ccm;
 
-	for_each_compatible_node(osc_np, NULL, "fixed-clock") {
+	for_each_compatible_node_scoped(osc_np, NULL, "fixed-clock") {
 		if (!of_device_is_compatible(osc_np, "fsl,imx-osc26m"))
 			continue;
 
-		if (!of_property_read_u32(osc_np, "clock-frequency", &fref)) {
-			of_node_put(osc_np);
+		if (!of_property_read_u32(osc_np, "clock-frequency", &fref))
 			break;
-		}
 	}
 
 	ccm = of_iomap(np, 0);

-- 
2.51.0


