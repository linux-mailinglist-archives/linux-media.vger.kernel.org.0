Return-Path: <linux-media+bounces-49911-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D4745CF3F41
	for <lists+linux-media@lfdr.de>; Mon, 05 Jan 2026 14:53:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 62D6231B0928
	for <lists+linux-media@lfdr.de>; Mon,  5 Jan 2026 13:45:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FC6929A9FA;
	Mon,  5 Jan 2026 13:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MIb4tc2o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kXTq6m3J"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3367A29ACC0
	for <linux-media@vger.kernel.org>; Mon,  5 Jan 2026 13:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767620039; cv=none; b=jLk11MORs7ikJLlugx/TGx+yyn818K3RR/ouwCuPDmjOvziVr5J70djhZFH0C68rLowMhTp0Dyh45J2YbNpRCmrX4sMEf2dz8cc+qm6HNcueClwKnfbdeCuiTirg+gC+snSHixT/PTrwHDtJySOfIjpx4ewyeWm1zAKKg5Nxo3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767620039; c=relaxed/simple;
	bh=LOzUYd+dRmkv3oMmU7xQB3tIB1OpRm86ei1dR0EieQM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VOksfoLkihO3D5aySmbZ3S8MIbG60yRZlyh+OxP0WubRniuuaLEn0qsKnHQ22q314MvdgQ1RjPPK7NzdtQsXSGQIDsuz+wnkM6STT+3gH83fE0XfYZsagrevBx1P1Ppf80w/392DIaatHl8gp3BzMXuUz0oxOtidSU+Oreewygw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MIb4tc2o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kXTq6m3J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6058JLB13803597
	for <linux-media@vger.kernel.org>; Mon, 5 Jan 2026 13:33:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=eBLWi/Kbuhx9TqF7mhxf1H
	8jWhbGxH4EXAW6f0Ac6FE=; b=MIb4tc2omLHC+vOEDy0doL7yPHZHY3nhgmuou4
	tYf+C7eylsOinYlUZQnPWRjlT4buir1bjJnhXin1wqH5aHgV88H5mYY8r8dv72xP
	q/F8xrIpvv8VwuMU0MtOQ7cGLH5qZ0qtXt55KUUW1lGFeqthcRgPUZfMMOwJWF3X
	rXJ0Bz8xQSaTbbDEEvB1oaxjA20tmKa2910eoYv53t1kCjospC0LPgy2U9e4kZCL
	OVzWgnhkwPtXTXcGKLui980aI6cvSzj8E0XktjoMwI5OiJQrm16siZNsBan9ekBk
	DQ1R0+DI7W+cR5JNb3nZffJHN82h/WNKN4SRT/AQKXKJKHoA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4beuvd4k7t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 05 Jan 2026 13:33:56 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee0c1c57bcso574511451cf.2
        for <linux-media@vger.kernel.org>; Mon, 05 Jan 2026 05:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767620035; x=1768224835; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eBLWi/Kbuhx9TqF7mhxf1H8jWhbGxH4EXAW6f0Ac6FE=;
        b=kXTq6m3J5gZEheCKTxzhp1OdcUwahLhwoBUQEZTTjcG94T96cwxSqatt8gXBSKHsQr
         uzmi0zlS9L8CtfCRhSbWQWrg2NKfCCGhbkHd+1sqJy9ae8SfvPdqm0EMqpZCAF/dcXwb
         dVZjuIAZt22UQgbN0spfucgb99acD7YNj03YvVSHhVemZ90g4hWjXD/YOMiUjXadjfnb
         9w2wMjhuNFLktWZSryCqs7RtzOYk2ifS18nQ7Kc/eK/nHy8EZKOwklYMLmcJnsFzv4eY
         lrKA8P8O2Rvf7tTGx3FZZEUeutsH1+ik5HWcUpcR0/hvvHzvycGUiwJD2/iKutWjI2US
         St0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767620035; x=1768224835;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eBLWi/Kbuhx9TqF7mhxf1H8jWhbGxH4EXAW6f0Ac6FE=;
        b=DLHnrusgqaDOcGxVJS8XvXKHucKx5s1ZILygZOy2EG+UhntkqwZFYOHA/ZlARqwhhZ
         R6iKVK6vQRWqDZeV9uTe5XGPIlbjh7X+MvvPmK9eLgarFnt3bDpCKrHxIJOweEK8l2al
         oOq8ZhddhdDxkoSBwJu4GxeWsyN/vpSBGsUPwTbxrwx/y/EQnA0GhYoJAnq5rapDxCma
         r22oj3HvZB61Cup2ccmp7951tNiWVZRMDuGkq2kXymQK6mev5x5g40b6MnNLBy/ClP51
         JpKHFWUUFlDc4EniqC/iwuFSwyOUMqBSDsQYwe7aImer3iPPKcAdHBZAFseLSYlZfDSp
         iJTg==
X-Forwarded-Encrypted: i=1; AJvYcCXBGcTVGHYFSd/1Xmc0YJmz0MoobhBQ75aXma4Stzyu757uCqCiMgvlMdFoneW1xv+/AdCynQl4RsCyjw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyeYcnMffrj7XPJZYM4megI2E+GlNTgJzheyrfBHCykqUB5KkDM
	2C0sljvKrOh9gXDZIC5Z2TaWQCrGIXKvoKQ/CKM/nXOUhxqMdrww75Nms+eJzP1lZUm7cYfaaJq
	SSvx9H/MjQZ+OyEsbISGq+NgKOIu7hnfCLrqOVRA6Q82KSxXS9L+zhVrTGbXrOosOgw==
X-Gm-Gg: AY/fxX72kycMAyHTFL0wMGIPxZKqaad6PGBM+xvSFM/awo0Uaxda7vx/+HVjKZrVPfw
	9DiYUeBrcJQPq8WZlWfVFj/hSApks0kAG4YALkz7OgFEAfusDBBYtFemvkstAqTRmlxaGKPKF0w
	Z/9Qh1EvM8SWI9rC6fBjILGfX2YjlpSiJUN9KHlh3SrDZiVRSGaP1kn5V786qXBse9sF673IJuz
	H+xvej6nhPeKZ5bH7NZWfel/rtDp84pGIB8Vl7MlzsQXYW369miiCnDF5Pxi1epplbQtbsmyR2y
	S8v0N5yKB1agldVFjTSAHFel9UrsPDHWOxfAuez/JOyqcu7CKdBLs1vqWPvorFuR5WuELQcBkto
	j3DUGc/dGGO9FiVwY+KzRp7GpQtl3MPQC4w==
X-Received: by 2002:ac8:6f0d:0:b0:4e8:93a1:7464 with SMTP id d75a77b69052e-4f4abcb8d23mr696751551cf.15.1767620035222;
        Mon, 05 Jan 2026 05:33:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJyENY1AnKxxs/GvCTILXx+88Wewnlpw6vtBkZZehwqeQb52jMZGVzw5b/PZHtR1M+E/dfEA==
X-Received: by 2002:ac8:6f0d:0:b0:4e8:93a1:7464 with SMTP id d75a77b69052e-4f4abcb8d23mr696751151cf.15.1767620034778;
        Mon, 05 Jan 2026 05:33:54 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d143f75sm147211015e9.5.2026.01.05.05.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 05:33:54 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 00/11] of/treewide: Simplify with
 for_each_compatible_node_scoped()
Date: Mon, 05 Jan 2026 14:33:38 +0100
Message-Id: <20260105-of-for-each-compatible-scoped-v1-0-24e99c177164@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALK9W2kC/x3MSwqDMBAA0KvIrB2IkUjpVcRFPhMz0GZCIiKId
 2/o8m3eDY0qU4P3cEOlkxtL7pjGAXyyeSfk0A1a6UVNyqBEjFKRrE/o5Vvswe5D2LwUCqhfxs3
 BBavNDP0olSJf/3/dnucHfr4aQG8AAAA=
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2238;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=LOzUYd+dRmkv3oMmU7xQB3tIB1OpRm86ei1dR0EieQM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpW7212LDD9aWpmO2pXajLqrMXSfYpdw8+/wsif
 01n3q4kghCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVu9tQAKCRDBN2bmhouD
 1/fJD/9T1pJUb2ZATSYxfBTsBulhDfg4M2cKxMAn3j5J2ZUJ0IpQxNIT0HTjj1huRozwEiSTEz8
 jbTVcl4uwbM2MppZBpdsT7l0qa2DcDLLsicU2afLE40cOYHueRcPJ0yCOWOeVopVIZ0ooCjHwMQ
 IFQhnUiEIOjtB0CNSBe7uYU/43VB4uovE1YiNWZHBHuRQYShbjHtDQObKlx0H0wW+jxBmZLbjnZ
 uQNYKHFL5PGqilIwKhBt9yWAWSSse5KGau0nb9iBuI/OJCNaEEoGmv9ozbm/jkvLQ7tFZA5BTBR
 d13IEKUNKAbdek4MPdbypLIp8yag7xIgPxRGSnLnmHIS2+vtASaXW+CqNg2GdYAq0jQjo9PAeyh
 rS/S5zJ30SOZxVJTNuJC7lTcBOLv379N2H6pvnRejAzj690y8b+uJRDSMHpLeqqKZ/VoZgutyP6
 ZJqJy4SMwUqO+G0EuIFfAFXgxMF3NyEJ4XMZu6rTRncQxM8TbfHJiof8isywUEkxs/iCcDvlSXs
 2Dejv85c5Kqs93S9INZGOwQrv9mQp2rfKM4GC+VOT279jb/n4qFaJcOW6iiW/ipRYmtPvDgBqJA
 trjLF6akNFp8akjaJCMwOEw6cZOkvAqoK2RTjO5BkrsLl5ZmYP20XaNI237J0dPJhrDpUIm61s6
 10hjLcSwFVNVocw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: URc-cRIYCx9fk8NyWaw1enDxRG85kklH
X-Proofpoint-GUID: URc-cRIYCx9fk8NyWaw1enDxRG85kklH
X-Authority-Analysis: v=2.4 cv=OuhCCi/t c=1 sm=1 tr=0 ts=695bbdc4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=d9g9ln5aRjr3gUnP3tUA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDExOCBTYWx0ZWRfXxzYday1A/Y6U
 wtAepqUwKDc7ZDfkJQiN8Fg/FQuYo/2vh5MUM3EhD+WZIR54it+7BqC4yQi3vdcGfM5lJPE4cp8
 JUnt/rRmg8ETIQQ8616CT+dD12ijLVRYkkMggpOJIAlz1wULe7xyeEQLYKJOLm122FZx1X6pe9o
 8V7NjfZJjOl4Smevrt/gLrXTtg/t6q85soVCUTHeU+aDbt/6npumxedIMk0FpdIOJ4SxJKPvjL7
 31iFIOvN941R95JSSrL1Nf63mw4ecPgnlXnzXD0GsQODeJJXcYj94KOa42v1i6jAb1zav51Yeqb
 bN97Mm2XfNswxQ31Q7C6R+RKeY0jS1XTIODL7hjXP9iq+y21f2hGnxftp7a9vln9XUtkaAfzYtp
 6ANQRSka3Wb+5dz2PiSQXBw0qeNiNnWnnSGkiCosJI+OtOqN4ARRrK4lQr07nSCxp9pUTNZHehr
 Q/aCcnUuOPtYJI65BpA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050118

Dependencies/merging
====================
1. First patch is a prerequisite for entire set, so either everything
   goes via same tree, the further patches wait a cycle or stable tag is
   shared from DT tree.

2. The last media patch depends on my earlier cleanup.

Description
===========
Simplify for_each_compatible_node() users with a new helper -
for_each_compatible_node_scoped().

Best regards,
Krzysztof

---
Krzysztof Kozlowski (11):
      of: Add for_each_compatible_node_scoped() helper
      ARM: at91: Simplify with scoped for each OF child loop
      ARM: exynos: Simplify with scoped for each OF child loop
      powerpc/fsp2: Simplify with scoped for each OF child loop
      powerpc/wii: Simplify with scoped for each OF child loop
      cdx: Simplify with scoped for each OF child loop
      clk: imx: imx27: Simplify with scoped for each OF child loop
      clk: imx: imx31: Simplify with scoped for each OF child loop
      dmaengine: fsl_raid: Simplify with scoped for each OF child loop
      media: samsung: exynos4-is: Simplify with scoped for each OF child loop
      cpufreq: s5pv210: Simplify with scoped for each OF child loop

 .clang-format                                       |  1 +
 arch/arm/mach-at91/pm.c                             |  7 ++-----
 arch/arm/mach-exynos/exynos.c                       |  8 ++------
 arch/powerpc/platforms/44x/fsp2.c                   |  5 +----
 arch/powerpc/platforms/embedded6xx/hlwd-pic.c       |  4 +---
 drivers/cdx/cdx.c                                   |  4 +---
 drivers/clk/imx/clk-imx27.c                         |  7 ++-----
 drivers/clk/imx/clk-imx31.c                         |  7 ++-----
 drivers/cpufreq/s5pv210-cpufreq.c                   | 10 ++++------
 drivers/dma/fsl_raid.c                              |  4 +---
 drivers/media/platform/samsung/exynos4-is/fimc-is.c |  8 +++-----
 include/linux/of.h                                  |  7 +++++++
 12 files changed, 27 insertions(+), 45 deletions(-)
---
base-commit: 4d27ce1b1abefb22e277e715901cc52acdc5af2c
change-id: 20260105-of-for-each-compatible-scoped-285b3dbda253

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


