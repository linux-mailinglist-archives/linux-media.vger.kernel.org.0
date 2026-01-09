Return-Path: <linux-media+bounces-50319-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 12380D0B7F1
	for <lists+linux-media@lfdr.de>; Fri, 09 Jan 2026 18:05:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A750314E8D4
	for <lists+linux-media@lfdr.de>; Fri,  9 Jan 2026 16:59:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F3623659FF;
	Fri,  9 Jan 2026 16:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YWiTGxvV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NLUNIAnM"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6609364E82
	for <linux-media@vger.kernel.org>; Fri,  9 Jan 2026 16:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767977918; cv=none; b=adZb3kUftnDmMEV2HuLZmay1wXmyZJBKvSix8q5uHS/eSwf9Z6ajWTdZAS2lGTi3/vdW9hLYRsDQG7UIEvCTn/duG2VO1mr+ruN3nKs0aQexxnwXevaQLG2vUM1B7fIFNdpGjalZ+WJiVRbRJc2lykQUs3NZUljA+npJM0jcuMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767977918; c=relaxed/simple;
	bh=MsflXqekUXo/aDgUOpqM/A+IhR12MRSHnOb52zLXpPE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NnREc+SWXdloLJZMAAD7VrflaTHSqTw2eOk37bo7EJ5cVnIqYTDAflUN2OOosbHmoOXGT93fnYgcMd/VEkreFWPlW2wgaE6czP4B1WAQ5XWgA80GUN0u/etdCZ4zmRyNceoHFQ70bQkErjoDGONlxwOPhArUti6n8w1QZtaGyEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YWiTGxvV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NLUNIAnM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6099XhDj1048216
	for <linux-media@vger.kernel.org>; Fri, 9 Jan 2026 16:58:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7ovbKKrBmePhAYzcI6ZCSvjFvW5vMXzt/ujfJ3OIR3I=; b=YWiTGxvVE15vFfBL
	1PkZ5modhSlq9rMbB1302WeGwFCjUnXrSizKPUTx1ui0mKgKd08ji7dNxyuknY0L
	g3SKoM3LsaGtmiyBvaCvGRiqqR0iSrPMY/8E7ywIgECHJNfYY6yxXSpPLchBmWFw
	J4XWI3V2LTypt+dR/l/0LrR5TNKtzestz+QTpcJdvtfqVEt+WzgbjvQFDaLZS5eJ
	RefVgGMtGfVW4FPkmD1KX+c70rPtSEoh1iFwZ22URvVEg9+OEyx/ftfZGo+gRahK
	yzaap9JtzoiNGpjVFUtOTwct7Xp4/Fhi2w2y0aT3+sLNp4b95ICWt34zu3p/gNR8
	2fVyRA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjy5b97bg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 09 Jan 2026 16:58:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c38129a433so1096395485a.2
        for <linux-media@vger.kernel.org>; Fri, 09 Jan 2026 08:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767977914; x=1768582714; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ovbKKrBmePhAYzcI6ZCSvjFvW5vMXzt/ujfJ3OIR3I=;
        b=NLUNIAnMtyXcGRnHwniZkZeu0D6C61T5QHSHs36Dv1Sgt1M/caxyPVC87fQ3JQFFQf
         XrV+xHij9cAltV3SzU11l4e22VjrhPo5D62uD9lkESzkkJC4EE0CxOp+2epLy+XrAePh
         I328lhXT9crKjjHH9iBMzKz2Y7+pyWmNMxGUQbUdI1ihDHItBqKYXRgjdpOXCdpx6Lul
         hUDsX2WtJG+D/F/g46KLjlxfGeV8JEE17VGPytS2FdzPL3FWWL9XataBsYDIn6pf7qfU
         W2bOVQHUBSykl8GHvjr7TZ4GPtCXgA13nukwA8Q+nxF0kdnzGPrKt13KJNY86rk+tITq
         6mMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767977914; x=1768582714;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7ovbKKrBmePhAYzcI6ZCSvjFvW5vMXzt/ujfJ3OIR3I=;
        b=eSor7tfkrAa+uL3RloEEMMk/OJkdO8YCX0dFTgad0VC31/JXCjXo8bKIvAIxsoFa5I
         GRS4ORKLD1jpqBIDfnLahnzWt3EXaqGzFnJjKqJnPqEcOR5QVJiL/YYfCMq6645B9JBt
         K0WQJvtYv4Xt3TpetZ1v6KyKyPCAMrRJSQPzfzHCYYaGMYIeQ+ClxRgIs8pvnv7cxTPo
         xPGOcGm3uw+ai7wVfr90gdz+Z14s3tXnPH8Fa0IT1N/821yspVvrMBBOch0MW9kRuG4c
         i8P5/5C86OzjXEJyNuzPqeE93f2heDGZEM0MP3GGEA1/tItTnznjl4qVtq17o0FhLYI2
         55kA==
X-Forwarded-Encrypted: i=1; AJvYcCVrQO4zGZjacJS12RlbwfF1rVO6mg/0i5oP7rBllNw1Lpicc9wyshqq9OyqH3zfTfSpcKQ6b8hhgubAIg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx34CdYFXFJqwEWZshSNk8LyDL9qxT4GxNMMQZqgGpTbargBwt
	F0KAh7MikQQkb4RLpX66DYPX7e7JBE/BcaYc7APJGZn4G24H53d8+xz0B8SoAW5Ycww8pt/jp5J
	bsNb1VmuZt0mWDEA6gGOztkfbLmeaTpcwuIFaTB7zCiB2AuQ8zwYo9q2HHP5/ev+gAg==
X-Gm-Gg: AY/fxX76ex3/HvQ9cpodx7V8AgK/9ktIGZAmPe6gIPu7/2EqoYHMoQrkHTrovs9lTcS
	vJhfhtmZVRzpWWaA3Wr3+sFpdMwMQfrK3PnX9qTewaFRGHx7+alkwvLTh7ajxdzJrRTFJYAHkcV
	mvLLf53jQg39HtXRs/3MQS+aJrA4BF+YJeTnU1Z+gmp3W8eE3Lw/mI+9cqDvVJM1sjdziCp6578
	+09vooVK3SJdnRcVQlmMTUcMqvi9VLayKe5bMmdGR3N9Qqv/Tz5DlI/7GXolSbsKwtmxIGphtDd
	ymSQeCDm0R1KqQ6ydMoZBW4tSb2A7wuN9w6v3q06pPewrY75o5nMuCxK1UAND1EAz+j1tgYWdiw
	uaEyfV0U2OZ/0ZolexG2STpIAJXB6tmCr6w==
X-Received: by 2002:a05:620a:7088:b0:8b2:d2c9:f73 with SMTP id af79cd13be357-8c3893ef83cmr1176961185a.41.1767977913932;
        Fri, 09 Jan 2026 08:58:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF924iUMxd+MwJ3dGhp/iiQySS67dLxcUnb2YLMcFoaCMT4wx2qTC8T7uv1cj0weZDGRq/u/w==
X-Received: by 2002:a05:620a:7088:b0:8b2:d2c9:f73 with SMTP id af79cd13be357-8c3893ef83cmr1176955885a.41.1767977913425;
        Fri, 09 Jan 2026 08:58:33 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee243sm23231784f8f.31.2026.01.09.08.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 08:58:32 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 09 Jan 2026 17:57:54 +0100
Subject: [PATCH v3 10/12] dmaengine: fsl_raid: Simplify with scoped for
 each OF child loop
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-of-for-each-compatible-scoped-v3-10-c22fa2c0749a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1436;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=MsflXqekUXo/aDgUOpqM/A+IhR12MRSHnOb52zLXpPE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpYTOZjtjnuHm6MsFLp3+EGzl32axXLPMxcnb5v
 fcxLyp6KqqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWEzmQAKCRDBN2bmhouD
 15GBD/9pEsoaE7Sv9gNfW8gJEPcA0VfLzP/x1SLnW4JtF28oqZVC9He/51hlFzvBEJRg4A1b+Ft
 KOgvgzZS0/SX36dUn+pRf7ML30RCFvWcM/kSG0DgLYtTzezJfUN0kxc5A/xWKEvuPQp5P+967hM
 H4Ijk6xLQcgIn2DJtoVKHurLdzKhOmZIhfVPdAf1jYBCi9xwxCNSkwMoQfkUExJ5jr3kOeHqvVm
 OYjkMu9ExJBuwfwGhqrOR3q+0Wv0F7OXP0iJN2yGQOlztVvx4e/6EiFZxs37S5+LbXHqV7jXbGG
 CalSNTMChp/eEsmNKRlpdIgt1LDnMCYR+LJslJfpIp2RRLX2kK6KLoX2tL5y/qXLicul2V/JWt4
 O8+yTXm5butG+MSp/njvv83MUAAUxzmaCWYP6tNlk+PAMawDXh4IcyAEYAUkNoHu1h96quF8oz3
 5pf07iFkeS2fqhM1PhJ9VLxtsfBA9pVDVkIvAZQaBk9wreiv65snG9i6OFo1qeMsyatrXCMrs7s
 whC2MO0kZPQPzbg2JnYmK/kfVM/tLzvDn8ASzOUnekSH2fIw1O8GzBFFTHio3uwTdp/jShXzhkC
 zbzxjJdBuQRKlNBMeNmOhu45yvU7SHdE75kpTW1uG06zPaMryXuVAg4y1lGCNI+nBUFDD9hKY0M
 cKfFR2KqKiYbCNg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: MRiK6i8CvEYB2ixhfxACx1mE9H_q1uCj
X-Authority-Analysis: v=2.4 cv=JP42csKb c=1 sm=1 tr=0 ts=696133ba cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=i0EeH86SAAAA:8 a=VwQbUJbxAAAA:8 a=8AirrxEcAAAA:8
 a=EUspDBNiAAAA:8 a=RsIb78jGsj8zXbp4E7EA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDEyOCBTYWx0ZWRfX/a8DgAdXaHiX
 c5qt8Pj1h7NriaG9QbBea6sqaUr9MpUGgZI4u6sMCcuULZLPvl4xWRAqp9SGLuEbfbCFAa9Ay5H
 IJMBorqX0EnwETTBjZxDALFLgmCz0OLTPZiATI/SQEfmTBQiunMWkpG5gQCYanpuFVnKeG8JdE7
 itXNZrbaDtJ7khSDc88+0jidlE8KMu7Jq01gpsVaC9peOqA9RkIbbgqR7jMSFJUh8oq9u80sDiR
 fshbrf7GMA7pHj7QQWBbAceIsABqCFcsd801kNkik1ZIcs1mlsY1WWTYxYLLPzlzlUNsH2zJz4Z
 0cNbyp/qMB0M+C4tIEMp/HMh4O2wbOypsTOT0G3ADUogBV0rKIyl27J+p3A+6hSkgpOnbuL5AgK
 RKAstGG7CKLQCjawzLcpabkk/sAPPqWCUTlCySAt8MbphOTVtuoF9tR8VrLvFzuVgrCpCI6T3FL
 TxD/WU1RCylFkuVemKQ==
X-Proofpoint-GUID: MRiK6i8CvEYB2ixhfxACx1mE9H_q1uCj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_05,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090128

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Acked-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Depends on the first patch.
---
 drivers/dma/fsl_raid.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
index 6aa97e258a55..6e6d7e0e475e 100644
--- a/drivers/dma/fsl_raid.c
+++ b/drivers/dma/fsl_raid.c
@@ -746,7 +746,6 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
 static int fsl_re_probe(struct platform_device *ofdev)
 {
 	struct fsl_re_drv_private *re_priv;
-	struct device_node *np;
 	struct device_node *child;
 	u32 off;
 	u8 ridx = 0;
@@ -823,11 +822,10 @@ static int fsl_re_probe(struct platform_device *ofdev)
 	dev_set_drvdata(dev, re_priv);
 
 	/* Parse Device tree to find out the total number of JQs present */
-	for_each_compatible_node(np, NULL, "fsl,raideng-v1.0-job-queue") {
+	for_each_compatible_node_scoped(np, NULL, "fsl,raideng-v1.0-job-queue") {
 		rc = of_property_read_u32(np, "reg", &off);
 		if (rc) {
 			dev_err(dev, "Reg property not found in JQ node\n");
-			of_node_put(np);
 			return -ENODEV;
 		}
 		/* Find out the Job Rings present under each JQ */

-- 
2.51.0


