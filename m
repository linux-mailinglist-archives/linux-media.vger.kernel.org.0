Return-Path: <linux-media+bounces-50309-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B39D0B70F
	for <lists+linux-media@lfdr.de>; Fri, 09 Jan 2026 17:59:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4EC7D30911C6
	for <lists+linux-media@lfdr.de>; Fri,  9 Jan 2026 16:58:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B2263644CB;
	Fri,  9 Jan 2026 16:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ONvLCqmR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j0I6hWg7"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2766035BDB1
	for <linux-media@vger.kernel.org>; Fri,  9 Jan 2026 16:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767977890; cv=none; b=nzUV2DaKYpS29juDqZwwE/lPmhVW0ZVjMrJhuPh8vFzElthATP5L32iUqk6gxh5T+HhSo1LGIu1ykeAZnl1Ks0yquz25l6TZrjvWjdf4IxueKut2LzvPHoG3EQ2JPSmpoVxB4MCRV+Ne7lZNNsJHuMcTBMxSyc+i7apEFR884+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767977890; c=relaxed/simple;
	bh=JN26wjrJYvXdAxtZ0bB816CXz0c9ThpfVWU5rfltyeQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qzEw+zjbt3emA4UjnQOLaHRlojQHxj969dvKLldZmHIwebGDKAaFps9pt+BArKOREIoYo/kwungVQu3skjwm/Yh/XcHVwtQNl99KlFqpiIsHacM2wc0yCDBbXn8iSGTYagtHJGTFW5fu9ePcuymARB39kQVIHjRELUIhUV44VpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ONvLCqmR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j0I6hWg7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 609CXEWZ3542097
	for <linux-media@vger.kernel.org>; Fri, 9 Jan 2026 16:58:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=wAHqNGApK8nOk2tnjvfw0g
	WpAzGP571Z7ygNRBnfXzI=; b=ONvLCqmRXGSaeOef5BaOlWEM18ej9r+EBwqVA+
	GlqLoANpxuvdRdkZl3HbO7lIO2w8NNeaKelD12WKkSK+SRoG8KdrQHO3NB5GcbyB
	a7X2cDzOUmU/3/asaUoHfvX/wktz9cm6ndf1KkeKDeOknJ5Ra9tdKxWiqvlpkht5
	LbOeHJ6ejQoeQI67vxJMNqpituJmeaBrkXzRWz1NP/9oz496k4LfhslWaz+0gd53
	ufJJ5gnKKU6zIaV9betREELfdtqM4yWKVYeTRqCVLnHDedaFdysrO2Fv/bswzavG
	VBkjL/RuCuc+iPFSsNhmP6r5F3b5G6EuJfPg2nPJxuXK0Uyg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bju6b20y2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 09 Jan 2026 16:58:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b2ea3d12fcso1034517585a.0
        for <linux-media@vger.kernel.org>; Fri, 09 Jan 2026 08:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767977887; x=1768582687; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wAHqNGApK8nOk2tnjvfw0gWpAzGP571Z7ygNRBnfXzI=;
        b=j0I6hWg7lqh0FdEPDPoJf3Zwcwt3fKQc1Clm7FuhJN5V6PVpPngmxJhlE/iFj2gyoj
         7XOhVLqsuABFrKV3cyOd1q9zSTdbvLMxgHdfDtK1Sw3vdRlciW/2dh6mo37tgMxVAPNh
         5I5461Hh0FN4T++mEWoxoL/dcTFn+SmrnISmpxX5eNPd6YlTckN9MpLZ+qb7PQQBim7W
         QQ/eCTKVNSNsqbMBsjezkfFk+rOiuUO5YpIxoJlcxytiGE1x/Bry4JwqmbaKBFaad4KL
         g4+RoxoHX93KTEnuQv5ZW+7jcRsJEkOfaf16E2NNCBmun+Mwsl0rgLDHw3I8FlZTPDVc
         Yffg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767977887; x=1768582687;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wAHqNGApK8nOk2tnjvfw0gWpAzGP571Z7ygNRBnfXzI=;
        b=jXEla5GIYavXyuBSAoJ1v7jp1OwFCa/5aYGYstrUOfuA458kLm1FJJnDK9ufwdMj6T
         2xJkom4M2BZW+et2hZF+U5vMKZE4sDKoHsZv0BPB9YAicaufrgh9uC9yAdCJPuOj9YUg
         9zVBIP+E/NtaGo5haZN8HfFOdOERiOhv4meRdlX0Cwsby2WlihJ+Dt5+Td3xYcUQeEAJ
         ag4StmO6aJLPdXQd0o1XMi5IbIfJaBFJXo34B2Db9eWPU4FUAWUxgk+wabI2ZPAltQBf
         l6HmuMYGw4PeSEHAWjwHC5rjeuVQT6UPKFcwRxDeUYwEvUbGxkS4htx5a5ymRyQk86oM
         FUsA==
X-Forwarded-Encrypted: i=1; AJvYcCXSG61k9TkYiv3qJ+TH5akleyHtTfHXiG/Co1xdZEBV3Vr26lYhnw5gIxx7DfQBoz6rU/776xaHE/m3xw==@vger.kernel.org
X-Gm-Message-State: AOJu0YznjSe+6AmllhHhC27kOL7bk724jYVAaSHfzCP4n9wf7iUySlcM
	OsCq+jYDkzfzr/zAL8Q7jxGEzbMs6CUTRw/Ot2CXsCUCvFxUOJbXDe1s9qelhq4c+5JXt0eeu49
	pZdo8ze5Wfzn3C2deRsAvOns0G3RBM0h5+n9DxrYi6RIaK0g0P9hGOaZUNl1QoTLokw==
X-Gm-Gg: AY/fxX5bwlLFIP50Idq4J+mKSWku9f0IgXvXt6P1bCSbrMlsrOgBl64qN3nlapbwjZQ
	9NraNAAtQaCVvnaiA9diDPbQD8B7kDt6/yRt/xQPwaBc3yXDZUq4FrFsDZBHUb259gkEzbkyOnP
	APKd+BklCpHWKBHSFMqg2KqiHDX+IqYptIsH8To/iGXSns7tqoAPrHqGlSCmaPTkNk7niIz/Rzg
	GZ64mebMhT1V3kGpdcDpjaF+g008oBzDGFEp+Ze6yxdyVhFi0JM6+JQtMoiKAiUQUPg3nyoJj5j
	Df956QHX5TNw8cKVuw1ZSXLOdQDW1PqM8xkV5guJG8gTFSPrDcL0Y2q4BjNhZEuBBQwJdrRmvXz
	NFwhEDPIdVcsNbrbSSKRZIhbHBRTreRbYQg==
X-Received: by 2002:a05:620a:298c:b0:89f:764b:a4aa with SMTP id af79cd13be357-8c389368df1mr1398269985a.18.1767977887060;
        Fri, 09 Jan 2026 08:58:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGNPfSLTF57nLz+6LXqzYYSsKZOpJyv6JlKR0v7EDkSl6w34TqTKkwxqafir8nDSQZDMHCUyg==
X-Received: by 2002:a05:620a:298c:b0:89f:764b:a4aa with SMTP id af79cd13be357-8c389368df1mr1398264485a.18.1767977886512;
        Fri, 09 Jan 2026 08:58:06 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee243sm23231784f8f.31.2026.01.09.08.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 08:58:05 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 00/12] of/treewide: Simplify with
 for_each_compatible_node_scoped()
Date: Fri, 09 Jan 2026 17:57:44 +0100
Message-Id: <20260109-of-for-each-compatible-scoped-v3-0-c22fa2c0749a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIgzYWkC/43NywrCMBAF0F8pWTslSZ9x5X+IizwmNtCamtSil
 P67aVcuBN0M3OFy7kIiBoeRHLOFBJxddP6WQnHIiO7k7YrgTMqEU15TRivwFqwPgFJ3oP0wysm
 pHiFqP6IB3laqMMpIXhUkGWNA6567f76k3Lk4+fDa52a2ff+VZwYUeIlCaNY0rC5PPsb8/pB96
 g55OmQbmPknWv9CeUJphUqUrRHM8i/ouq5vUWOo+CYBAAA=
X-Change-ID: 20260105-of-for-each-compatible-scoped-285b3dbda253
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2779;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=JN26wjrJYvXdAxtZ0bB816CXz0c9ThpfVWU5rfltyeQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpYTONgHItTP0IOHoke9/I0Oflg/ErlVdydJVdc
 rcybYkuDHiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWEzjQAKCRDBN2bmhouD
 186LD/923xyt5jSAANUPJr0DkfC0IFkCUjkwy7vW4g/lIjDDdTVlxCH4ZAEUfcejksjLVGtq385
 vpbtpjl+6EPGxbyWPt3Pwb6lzt0ktHB7BRZgpTWGZlh81OXdhlb7OMZAfVVRDcBWv59nnM55pMv
 e59QdyPIXetiGqvHAhD3Wl8xdOdiFBwodfcTfZmUSLX1ZyqeLeUYTS56FVWhIV5Yvd3XeRfGMa2
 U00RCzBkHuC1EL8wMgrm2vp6ysSeUI71Bj4hXm3iFdI534CaJfhvOcofEfo4qu3ldkPKXBmwviN
 ODLxbGgoAOSKGZpUaGhiUp1AN3CYQJ3D0NS9fLmmtbqtGcre8VGsTidTZNakmNmVYEE6sdFe0h/
 Jgit8sFCPF3Yfco3ovLxcWYetHgtdbTFK7CtnaELQjxLrn0KYos7BKHajZ1TVB3QWkveUqtZn9r
 h8ZSoUw4w8NFhxLEjzMdczcQIil9/js/40efGMKkIVAbq4amZR8Veg9PnUMuYsMZFeKNnWEZT94
 rs31WlzGsuvnMAq+tsstXjMOVCONmaXGa9ESHvGZqkorjoRTU6dZr7mFZFDmlfp/dp123jbvHJX
 pMBPQitRrKqpkR113badiHPtNCwW5sYYeeyeLZTghwveUxQn9Dt3XZpPExNBYHyktu+7rodtkES
 1DmaqvH9C1QgoZA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDEyOCBTYWx0ZWRfX13amV4k8Tpp4
 RJZ4M0izj0qf/G3TAA8iTzaJkomVuFbFd6cxGuevbacTPxDpdfqiLuX5UOs+zv8tW8jjNCwb+GS
 ewwf9nVSVJ+XP+llf61CVDqr0/8AUM2QPQWUxG4nRJvuPsxBZhLqE4jqyysCPzmmL6kLC3OAPgj
 Bu5aKTeOg4pmHkCS2qf8vnSMWfBZMpqockAZRuGvFg56UlwgjaWp3wfRd4d2kLKteFaz+xdRwst
 KRFnnG/d/8bGLhGwLdJmJF0jfjKU8QmKnv2hfahPvU5wVpS15tgfpI8oCTYU8YPovxXytnYKeA7
 bXclYcLBICjJWsotaCCVDMo/+N8aAPBqklPLZmA66LJmjRab02IX8Bh0uI1b2lyAV66l6xq2LIQ
 KF33KSPwgy3BFwRC+zldqiRJjZoCBDoWWlY+8oMi7WaYMHeE8QFlZQl8g9p2ex6Itju5MYvwHYS
 Fo+ZOvD4sENRjSE2E2g==
X-Proofpoint-ORIG-GUID: ixdwCUo3_08uG_QkPNRJrkhp3RKRa6Zp
X-Authority-Analysis: v=2.4 cv=V+5wEOni c=1 sm=1 tr=0 ts=6961339f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8
 a=d9g9ln5aRjr3gUnP3tUA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: ixdwCUo3_08uG_QkPNRJrkhp3RKRa6Zp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_05,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090128

Dependencies/merging
====================
1. First patch is a prerequisite for entire set, so either everything
   goes via same tree, the further patches wait a cycle or stable tag is
   shared from DT tree.

2. The last media patch depends on my earlier cleanup.

Changes in v3:
- New patch: cdx: Use mutex guard to simplify error handling
- Collect tags
- Link to v2: https://patch.msgid.link/20260106-of-for-each-compatible-scoped-v2-0-05eb948d91f2@oss.qualcomm.com

Changes in v2:
- Update also scripts/dtc/dt-extract-compatibles (Rob)
- Collect tags
- Link to v1: https://patch.msgid.link/20260105-of-for-each-compatible-scoped-v1-0-24e99c177164@oss.qualcomm.com

Description
===========
Simplify for_each_compatible_node() users with a new helper -
for_each_compatible_node_scoped().

Best regards,
Krzysztof

---
Krzysztof Kozlowski (12):
      of: Add for_each_compatible_node_scoped() helper
      ARM: at91: Simplify with scoped for each OF child loop
      ARM: exynos: Simplify with scoped for each OF child loop
      powerpc/fsp2: Simplify with scoped for each OF child loop
      powerpc/wii: Simplify with scoped for each OF child loop
      cdx: Simplify with scoped for each OF child loop
      cdx: Use mutex guard to simplify error handling
      clk: imx: imx27: Simplify with scoped for each OF child loop
      clk: imx: imx31: Simplify with scoped for each OF child loop
      dmaengine: fsl_raid: Simplify with scoped for each OF child loop
      cpufreq: s5pv210: Simplify with scoped for each OF child loop
      media: samsung: exynos4-is: Simplify with scoped for each OF child loop

 .clang-format                                       |  1 +
 arch/arm/mach-at91/pm.c                             |  7 ++-----
 arch/arm/mach-exynos/exynos.c                       |  8 ++------
 arch/powerpc/platforms/44x/fsp2.c                   |  5 +----
 arch/powerpc/platforms/embedded6xx/hlwd-pic.c       |  4 +---
 drivers/cdx/cdx.c                                   | 15 ++++-----------
 drivers/clk/imx/clk-imx27.c                         |  7 ++-----
 drivers/clk/imx/clk-imx31.c                         |  7 ++-----
 drivers/cpufreq/s5pv210-cpufreq.c                   | 10 ++++------
 drivers/dma/fsl_raid.c                              |  4 +---
 drivers/media/platform/samsung/exynos4-is/fimc-is.c |  8 +++-----
 include/linux/of.h                                  |  7 +++++++
 scripts/dtc/dt-extract-compatibles                  |  1 +
 13 files changed, 31 insertions(+), 53 deletions(-)
---
base-commit: 4d27ce1b1abefb22e277e715901cc52acdc5af2c
change-id: 20260105-of-for-each-compatible-scoped-285b3dbda253

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


