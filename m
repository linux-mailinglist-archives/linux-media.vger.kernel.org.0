Return-Path: <linux-media+bounces-49914-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A21ACF3F62
	for <lists+linux-media@lfdr.de>; Mon, 05 Jan 2026 14:54:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 53641317DA02
	for <lists+linux-media@lfdr.de>; Mon,  5 Jan 2026 13:47:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0ADC332911;
	Mon,  5 Jan 2026 13:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZZTtcHlQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XGEbJy9K"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B20331960D
	for <linux-media@vger.kernel.org>; Mon,  5 Jan 2026 13:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767620050; cv=none; b=aHD1UxJGF+UDRWWTQYYdmc5kbg7/brpPt32W4qT+rcDKVWpUB9SdnHYZarZZDCEhKIzRDMiZqJlJOpEXnHtwUAh0zcrzNfXVvhqGY7G3A144jgXSe/SFtG22GDQXHmFpAAYdo/hmBAk/COhll+JWSd3Vp/3vwate2E7rFwbcqno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767620050; c=relaxed/simple;
	bh=JLd+YJVelW7DAYz5I5oq+Bq5OMySRygwF3/FHKcXlRE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KFrRovbgEX30303mhZm40SOqsoeZ+sayDVuKK3/0mTMhVTd6yoDZ8Z6aoNsCoOBpUq06JGDUL3Dsc0AN4bYyuV1zawOXqZDokcIbRnrlHmkQoKhMHekP+5ZtWXhUTJ/amCWpjmKewCs8vS5xrSytJ4JtZzjuSjerH18QhRFYMV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZZTtcHlQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XGEbJy9K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6058L33e3652262
	for <linux-media@vger.kernel.org>; Mon, 5 Jan 2026 13:34:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	apBQxo7qSrwo1nwoLIpfGQYjycgRUvqMuCwBV3g5lLc=; b=ZZTtcHlQNrsTzjLh
	QSr7zfF8N7pHuS//wC9rxrFLzRwLboR0uCAkHp5eH7Vw+IDC2rMxtArb5nn1gNwH
	6N5r+iiSIIVRxY/OkCw55fcjm/PSXGURJB266yofdElUACg/sbqaHMeg+4v/tDKR
	r+JcB9Ihorh+NlFmYLKq9sjRFhKLR+ScWF4dh8v45tc2ddyppRRJFBbglWBcj+ty
	Wh79bhCQ2g81as2nOX+2+tWhNwvvtTi/W9SHzVNUW1Tf1IYhsGpcdgdfXqDy8TrZ
	pdE6b1z1AIT976TA2inhM8ZblQtmAJEGN8iDWA9lXRByd8iU1Z/xrTYGNW8GDOB9
	G1JMsQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bet2qvsv0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 05 Jan 2026 13:34:03 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed6ceab125so390231871cf.1
        for <linux-media@vger.kernel.org>; Mon, 05 Jan 2026 05:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767620042; x=1768224842; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=apBQxo7qSrwo1nwoLIpfGQYjycgRUvqMuCwBV3g5lLc=;
        b=XGEbJy9KwwfdVV2e/5wRT34m3Vp9voWzW3DjLrOMWDfiZDzRWerrlX/6WCnSrcuw50
         r6LvO1whLWv8xUxojjHPGB5kN5h0NP9qwrjMt9MgeCm3NExcVMA8PBqO9cnTVejFfCRu
         S30AyeWsb8ikVLGVN98QNzfXm/4Gp1uzNUuuwalxAJyWo+sTY4bmp/OzL4L34JLcc+vm
         3MJO7HOyaQJUdcnyKJFxcZHTL1N7rtHwz1Je2bhQHrMG2e2wRCsL/cJP2Llv1R7NfCtZ
         orZALIxLNhFzI6Rok/mlQ4tzWt2stAugMyZgo5hsd9nsKYAlrTzHF3ic9UpLhL9QnrKL
         UTkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767620042; x=1768224842;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=apBQxo7qSrwo1nwoLIpfGQYjycgRUvqMuCwBV3g5lLc=;
        b=gY04P2dcARc0+7avkqSXVnAG3z8ldeROAlteI4rQLSN1I3F0XR+iqCHG3BTUhbJaDZ
         Ti14mdQOs2Y5DXZPrrb9WIMHtqKU14re8m1NIcB+LdDRi+yYQmNvN00+i/gzIeLUjThL
         cOYZjamZukCSSLxmhbTmWd3uR+0d1ZhyYq3V0zzH9IdvEFghOpztO16n/QQfye0GcK65
         ysXRgxhqRtHfDxCxZjxUzxwOniCcuuO7V6Eg6aE+Mw5i9iEIwbCVaqbFvprFHplARQG4
         HeTYXTruxubaPN0smM9/kxScIoJnRRKYLRhVzGJOWUWmqSM4UEK9GPJL1pPDzY9OLp+F
         z1Lg==
X-Forwarded-Encrypted: i=1; AJvYcCVW1mZndxWjSQRklNDyszvCiJ4RYO7c2jNrwuI3z4vqVYovuv5ZZ2r8FjR2zx1nPnUhoxZb0sO3Y1LDiA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJkbXnkshC3Ap741B7aoQoY2iWTEOHklHyJg5I+mWapJm8Qibp
	DWtnJEJePDla2ZWdkD2Hib5VnrBOrw2NlqASIFJp4TVwWfXiwZ8Suah+4mv8hdRqyZvxv7j+fCZ
	gpKZW3CFgz8gR3r0Rs0CNINB8F5ZMYtVDSQfenphE+3sA9PimPmFNKLLajzBkpXLfUg==
X-Gm-Gg: AY/fxX6uZQXQC+U3DuBGykNNmdkd8BdDZ3SObllzWvcK2gAyxO/BDc7mNZg34VtHCQz
	G2GPkEQ+Dy+M08sNZ96llyHDfmj0+Psds93jRGClXhfajWoLlRXy8laRvzI6ibA26AuPh2P0mkE
	KbJOmONyw1rBHdLcPs158ql5AQRx7k9aIxC9LqT0sTRsLZ1S2yHFco9xLmsqUDOKwreLs0EhnC9
	Jf0Xx6eXw8EHVnpwZmczO0O/GCYoCVs+IG9AlWDJCdq5/oihQ2eaKdwgY339/WDq8FHEQAYqhWn
	ZvxnbLhWE/ZGl1+JzB94qUUwDIyBPgyseTBEuugH96jKMxCh+eE7woJHKzVrj+Kz2N+avvI0ZTJ
	Ovbpi39yBWjubQw1RXYqHu5CYBX677tJQWQ==
X-Received: by 2002:ac8:5851:0:b0:4ed:b82b:19a3 with SMTP id d75a77b69052e-4f4abd03104mr752216771cf.32.1767620042633;
        Mon, 05 Jan 2026 05:34:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGL073c62Hd/WRutx99PIMM2D7+ut3zs1jMfjpXqo8+y09Dd4UVpcHVCw4KVlqpW3z5E7iWsQ==
X-Received: by 2002:ac8:5851:0:b0:4ed:b82b:19a3 with SMTP id d75a77b69052e-4f4abd03104mr752216391cf.32.1767620042172;
        Mon, 05 Jan 2026 05:34:02 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d143f75sm147211015e9.5.2026.01.05.05.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 05:34:01 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 05 Jan 2026 14:33:41 +0100
Subject: [PATCH 03/11] ARM: exynos: Simplify with scoped for each OF child
 loop
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-of-for-each-compatible-scoped-v1-3-24e99c177164@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1404;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=JLd+YJVelW7DAYz5I5oq+Bq5OMySRygwF3/FHKcXlRE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpW724uhqQJQeP4Vg/SI4D4SjbbtLmMEMQDRC5I
 un3PEi6+/aJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVu9uAAKCRDBN2bmhouD
 13GOD/42JM6vglHCZIWxqXZXSDiZEKiNaq8l/k7h7Llh56nvuYIx3nbUDCR+0D5+3U1tYFCtovP
 KMPVAvqckUrgBJWsNEmhJNZFinrNc193abWGWdNS8PReyJxR2paW+PZRxPmIyHN6T9+4ClyKJYT
 orO/UFCcHSnr7VL3wA39p+weE0sJ30fO5hcgn7qMiATvRULDU+h9Rp2WdTMvMTec8zzJ7Mp7LGe
 Uvr6DKnbkGRq2LJqAjrH37R4v+mHWcm8bu2BiJAngB9hPMEiCwtFmvrvuP/FT8iOXa5Z/7K4L0j
 4yOz0FbvSemXetVtuW+50hYj6yzKhUtTXIMF8EruhLmquMUDS7Qva+XpabcbvgKMYHEcPbxotjV
 VA5P9H5hZcbnYb1cfw8Ab6IhT/bMrAtvhoDXpItPkBGfOv9woUFjvXNCBC3x6AEeQwH2+QNyDuu
 LJEmqLiwzse1GyN8YizPcFsZ3LBzvdQbvCbqupZ7783pewZPJRfbLYDaZ1I+/eAU0qlMFLmQti9
 8IRok6H212gxfCEHN1G/jibO//9cyPAmiQp8tpC5DVfBddLCvveHc8aOxAC0bbKTIvAAWNuZ9a5
 aa1uQKAhQw7ow82uEju+DJFlO5RrIBHE6W86AiOFG0xEKIu6/nKbVfSIvX/cjn3Iku1poulaIxV
 J5gu1QgYIhtkx0g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: b1pNhnmNIGiZsn396iQCElsYRHFk92LX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDExOCBTYWx0ZWRfXzZdozY88QcbC
 gwlZXhjn/xJuV8MUMS+H0cji6o+IqcdCjDiNqA+uQPcvlLro9JrHpLh3XBE2HGhGZlZu5DP/UDk
 oGQfDCHJu9vfcD6x6mRbqny5fvVkN0egU+qfm43Ky2i15W5fY9V7j5yjm/c/SoR4uCX5CKC7gvq
 eImajv0PNJR+Fmn4HxMM/gtkSaPEDasAO9/e3xE9dIxAAnphjgcTBe1hhlb8IWGsEw1gmqQ9HFq
 PvWjMoYEjNGGh5VXnMitmAd7381eU9fdGEDl7wk8tpNy1eWlgESr8jrI+ESA6uRMVYa5HXogjgs
 8c/3GwD7U+7rbMgNkzWYz8ysyTBM3/jgvky9XJ+6PF2m69M4wZoHUklrskegIwAt9VU5QdwWhiO
 l4zQH8ODGyD8F7wyqP4OJeTdt/kEBiHCpqMG7uR/w/05okcRmNaviY/uAjFJfy2xQ8w2H2Rb75+
 SMh+aQ/Hoy0qGKexQhQ==
X-Authority-Analysis: v=2.4 cv=RKK+3oi+ c=1 sm=1 tr=0 ts=695bbdcb cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=kVq6N5mEIK0mURhpU1kA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: b1pNhnmNIGiZsn396iQCElsYRHFk92LX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601050118

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Depends on the first patch.
---
 arch/arm/mach-exynos/exynos.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exynos.c
index 2e8099479ffa..18695076c34e 100644
--- a/arch/arm/mach-exynos/exynos.c
+++ b/arch/arm/mach-exynos/exynos.c
@@ -47,9 +47,7 @@ unsigned int exynos_rev(void)
 
 void __init exynos_sysram_init(void)
 {
-	struct device_node *node;
-
-	for_each_compatible_node(node, NULL, "samsung,exynos4210-sysram") {
+	for_each_compatible_node_scoped(node, NULL, "samsung,exynos4210-sysram") {
 		struct resource res;
 		if (!of_device_is_available(node))
 			continue;
@@ -57,15 +55,13 @@ void __init exynos_sysram_init(void)
 		of_address_to_resource(node, 0, &res);
 		sysram_base_addr = ioremap(res.start, resource_size(&res));
 		sysram_base_phys = res.start;
-		of_node_put(node);
 		break;
 	}
 
-	for_each_compatible_node(node, NULL, "samsung,exynos4210-sysram-ns") {
+	for_each_compatible_node_scoped(node, NULL, "samsung,exynos4210-sysram-ns") {
 		if (!of_device_is_available(node))
 			continue;
 		sysram_ns_base_addr = of_iomap(node, 0);
-		of_node_put(node);
 		break;
 	}
 }

-- 
2.51.0


