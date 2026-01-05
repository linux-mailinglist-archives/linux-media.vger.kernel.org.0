Return-Path: <linux-media+bounces-49919-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D1DCF3EA5
	for <lists+linux-media@lfdr.de>; Mon, 05 Jan 2026 14:47:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7880D30208FD
	for <lists+linux-media@lfdr.de>; Mon,  5 Jan 2026 13:46:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A465533A037;
	Mon,  5 Jan 2026 13:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z0Ye+6s6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Eo+OUxYB"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01F2334370
	for <linux-media@vger.kernel.org>; Mon,  5 Jan 2026 13:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767620066; cv=none; b=HmffXqI9ctBXNKRYZW9TjNnm3J955JxOxfAyvwpuj0OPFp8i0D42yesUAQQfsShPGfJAghQdCz60FbSPbIzINNWDrFfdlRxxQq3HGDdluzAkhhnVpIVCzXpTeb6stFlz5z2PnbyN8ED+/Zg9Of2PI7cGDPToI0CfKRWA3e0x/gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767620066; c=relaxed/simple;
	bh=GS8OvkusvmgcdB0Bw7k1Y4Yk9s8voPKG1OqeEcLUEtQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qHVvAZohqibe+aYbEGX1/HHILpeTdzBlzO9I+/29WbCBHiY2Do09Plsl9NHD0FDGjuRTJZ33Fco++nVCOFUURsKypeKx8nNreCkgz46+668jjXclqC2/Ia9QzgzByCvlExZ+p7hQc8Zof0vXmYgcHN1oBJmhbZNhNHkDXYuQfvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z0Ye+6s6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Eo+OUxYB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6058K0hb3895225
	for <linux-media@vger.kernel.org>; Mon, 5 Jan 2026 13:34:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Du52gVNSd6dUN+ox34XkpgmRisqcm6nMlHGah1IV5Rs=; b=Z0Ye+6s62/VTDHGd
	1G2Tca4dXxjio8BbLPvCE9P654VjAGl3cP1dTXZClo28KJtbz2iH5QCsPDNimUh6
	IzHTL5XqqkJB8JPVa2tKldM5WMaeEbNhEogSKeCIobffKGKKq5O2IBkBTEiRThkr
	S0iXna45ybILw8mq8Sh2r7uRQI489nf+rRFQiNQFVDiqKy318HHUV2VVbal6OsLw
	IwAa9y7CjWfdP81fsd1s21Fi8r4NcY0a5agJsdwnlDJdB1zEXR9WtARrIJp7fevB
	fPCAU0nshGwkVaR+o0nr70A1WqoGO+VX1P3RPOiYIUhwAQXRde+a+AZ4wlSfwfqh
	euFJdg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4beuvd4kcc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 05 Jan 2026 13:34:19 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed74ab4172so349399581cf.1
        for <linux-media@vger.kernel.org>; Mon, 05 Jan 2026 05:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767620058; x=1768224858; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Du52gVNSd6dUN+ox34XkpgmRisqcm6nMlHGah1IV5Rs=;
        b=Eo+OUxYBvGilTUnm9BkGuF2+CwziWvxXZ6lRjdNApSr4eIDAqHqUv/PglIW/gtWkPK
         bnYLCfV4hCy46CQQoHRdJCYGGvLH2HABeWNaJHJrhbdxXgrtfG221pP8Utxn/db+AzbL
         PsofaVSOw8NavwuMYeUvlcBAPeXqwfbbmcxoyi0HwLpcA3Vff9pN9vAHekdyy6rKJoVe
         4NdNqVSCLXZvX2C9GFHJcyvLPOH2Dv+jnXGnB6R0Qbjr5GBBOUUvgXxFd4YuEeM7uM/H
         sC9+pCi5rbo7DUMliXBklpjrkQNeRfaiwxLCml76VLuhquLOIBXoBSEkiwvmPdrORqYs
         X0Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767620058; x=1768224858;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Du52gVNSd6dUN+ox34XkpgmRisqcm6nMlHGah1IV5Rs=;
        b=JakEXFj5FlJmNwZH6AdTt5BgMxVRQwKAlMwPlZPYwwjsjusgQobksw1TjGjdYdI8Yl
         Z0zVcw/40YCg6EsVYgRh7XYReAWHFjHf4rYC3jhjeqiyjeTifmuQQeX7UaTgcL7aDyWK
         eJOHk3or6zyT8MgIXSogqcq0P58UXQr3kZfgzS9yuRUkHCmdtMiDEEgsBbYPv64M9KxX
         pZiunJyZBpVxuGk4xWtK38blO4nRFSIfWdqQveHKqsXFo4Gu24jTZtUHqFTGKHfbslMu
         I8MtbTPIMmM3sKZsC1sMeO14k6ZSVcCzSJGxmBqoINgmNNQYPc+uOyniL5vBbTOAR7F+
         cI+w==
X-Forwarded-Encrypted: i=1; AJvYcCUWA/hFq74YZkjA6kCjJH7ReJ6yXEwmQgEZGgciMNyXMU68XSie3alqvkI2y+7GjoCfUhA6ubZPsGdoGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3tK5pPkbQTVkuEdSlZzpSzDWZpJtLa9THYOq6r/8WjZAMojRp
	CynsIlhYF0+HW0fXoXtQiVhZ2eBWEAXIW6dXcGIGd6b6nOwU8tZGqN27/yr63HF98DiPUtJjjX2
	X8//pZrnZ6fcUdeXt10pQLlzORBDcBmMnm+jeXARMpXslf3IIstlSPdmmx7soJCZ00jy0gDyO1g
	==
X-Gm-Gg: AY/fxX4uDFVrCFNbDqZGIoWmYhWog9Cx3Y/QN+6jinyrW0X1ipneN3fJQWOJKDIWzwu
	6RA2miZqObrVJmxbEFKe1oCfgMnDjD1B9tEii1JKdCNIEpuZ639lAIuPa7uMdvXu0Deg3fxvFHS
	HHNwn8EgDv+V4tzogtUrpfzzQrNPwYLOiC92fmqSeCFFh696CWe+U6mY/PEt1Ejkugm8ntXees4
	SuPoFcWLWMd+/lEQuHF9vd6JZRTui+yXZaoeRFaRT3zv5LEMk4sqRrI24T5WIEVWmeN+jkQiAHG
	48443CgwSxcH/+6i0/U6K3nNVho1zXQtxZv/L95OcM0gLZKufkL4gIn/HdGWEqnwFtVlkwiPK7q
	axEOZ0Di0OY0ucKu3PU+IiNcT7jzGSJLrXg==
X-Received: by 2002:a05:622a:4243:b0:4ef:bed6:5358 with SMTP id d75a77b69052e-4f4abd1c647mr721834941cf.21.1767620058390;
        Mon, 05 Jan 2026 05:34:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IESw6Lz1B78B4ULuxi3VJYQUxXjiiRMNi4bRGaq2JIYI77z61n6T7SSooev3CjMW7TdHKjxOg==
X-Received: by 2002:a05:622a:4243:b0:4ef:bed6:5358 with SMTP id d75a77b69052e-4f4abd1c647mr721834241cf.21.1767620057780;
        Mon, 05 Jan 2026 05:34:17 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d143f75sm147211015e9.5.2026.01.05.05.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 05:34:17 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 05 Jan 2026 14:33:47 +0100
Subject: [PATCH 09/11] dmaengine: fsl_raid: Simplify with scoped for each
 OF child loop
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-of-for-each-compatible-scoped-v1-9-24e99c177164@oss.qualcomm.com>
References: <20260105-of-for-each-compatible-scoped-v1-0-24e99c177164@oss.qualcomm.com>
In-Reply-To: <20260105-of-for-each-compatible-scoped-v1-0-24e99c177164@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1294;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=GS8OvkusvmgcdB0Bw7k1Y4Yk9s8voPKG1OqeEcLUEtQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpW7292bX6sV2klT8k73Gc27WnZClqHRYukVQ3s
 g0dt4LCeumJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVu9vQAKCRDBN2bmhouD
 11gKEACUJG62p3bBedXNXFAHMBRvdHh5SRxmskzIZSZ7YDiKWZ1xMuPSZ2UpCgiXYu+jzjQ3pSX
 J/tk4zTo9qz76qTrMt/5FIq6qSzht1As3D0B1eSZuwID8n/AFteLawtMhfHZAK7HNjpXJ5H9EBq
 62LoqS7xAsC0xCiZkpZvcZ9rfMTld2TxZl6XNo3RD0Htu0zWS1yAxP8K18X6I26IvXXjscdtexE
 iBVsA5MbEHfRq5ZKrC29z9sZb3tH62HK6tnmrwjs1SVWC+9e79+2kOb8gyuYuehYkOzBv629c1V
 tbLNukjURdIanxovvvQ0QNp8D409dDRHMp+XHeEcAAqq0XpNdixShlzGnTNVhHq0vF1gK2s6kqt
 VB4FxGFFb02+5YZBjeUN1h5/FR7WfVBSu+fR+LR0oeO49MWlmmCch4ELcHp7i8e9c1H1Mck5N9k
 dc20+3HAxiVbWgSi1z0IvynOLTkyQE2AkIcAjJXxMzpJ08ew0r02sNeagYcwLb1142buVZffbbh
 kwn19rttS0m5FcR0q8cRaTiTdaHPQhE5Vmf6NQvoghBrifIdxgzLmNDGMcmCXH39Lfgtr+qsayx
 noTsLExWWnq3y82IinF0+6fHFsfkb1/B4YQVykBXNubNjrxKqGilh7ZemeG2VmrX1owHSxo2BgD
 F96W9pTZJ8z6+kg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: HQCtdv5wr7B0t8htRBCtAgtcr7yzmMrE
X-Proofpoint-GUID: HQCtdv5wr7B0t8htRBCtAgtcr7yzmMrE
X-Authority-Analysis: v=2.4 cv=OuhCCi/t c=1 sm=1 tr=0 ts=695bbddb cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=kVq6N5mEIK0mURhpU1kA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDExOCBTYWx0ZWRfX/kSP0QXGggu3
 f8mUlLtbOe+16FnHSJAD9nrgjQLS4Q1tStm/UNxAX/U2O/cNJIoATsotvxSfLUCoiDvGhR1286T
 THEoRV4pYkTJiKRba+9arbDzSiOGv5Yhp8+aHvuHxQ1j1DBVzzEerhNfcuY0oiwod4g4UNTB2Ne
 gdD9k8nVeFbLf20ga2JWcxq7mkPiLmXtEDY0ZAEU05OMTzd7ORTk2q5/sTsQ9drzNSTCMkag+Gf
 sS7kk8/hipAVU5exbbR3whPzTMHY6X7RLl3UgIKtNpFCfyxe9CTAZKgqQY0Lm8Q5hUBPn1hXo5e
 h6GUk1x2iyWwgy9nyxOiET51lb6ABOBWbAx9PAMBPHVMQ7Y6biMcWvjUeKj6Lel5c0zLm+5a3OG
 Ft1YjvF4vkSgSss3hRW/8WpsuktFkA3gSMyu4Rmg2/Cqm2F8qr2S6W+V/5AQoLPhtDTfoCrj1HH
 oWcwVttnfzk7Ofoxt8Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050118

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

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


