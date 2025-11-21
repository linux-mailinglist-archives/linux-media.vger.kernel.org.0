Return-Path: <linux-media+bounces-47544-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC73C774A5
	for <lists+linux-media@lfdr.de>; Fri, 21 Nov 2025 05:46:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id ED7E03600F4
	for <lists+linux-media@lfdr.de>; Fri, 21 Nov 2025 04:44:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECBF92F49FD;
	Fri, 21 Nov 2025 04:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fB0uXKKT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gYJLEkk+"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A899B2F1FEC
	for <linux-media@vger.kernel.org>; Fri, 21 Nov 2025 04:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763700234; cv=none; b=cJdXw1wka0oxKBsCOywoU9jWlruzokGW39FQwDQ6TwVTm8XOtrY30YndljyzQRuA/+pWqUqr5tFD3t10LTvGlBckuHz6mUeOlJNszND20ju0oNkIae7YhMHqxOL9OHtDNYUhsFLPQ13NlL0C6+jfHYl7gFuu2v9QNFU9SGhuovU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763700234; c=relaxed/simple;
	bh=3QdjZvYokFkYzksvR9JE/DnqxUC72qU9ux2zv/3+rSs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BV3wNPn40nmBqeI657Oi/YYdvp3lGHAH/ISLCvftYjT01zmXbf+gU9iBnYLxCVEGP5bhrUhLn5Xh7cStnZPZ44Z5+V9oxxyMlRCfMBATGtV+gYG1nnEkSWGE/Umqyjxe82z5JE1MuLAoA+uOxgI3/ZA826gO7ldO6tIaswnX9+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fB0uXKKT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gYJLEkk+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AL3i6Sq2746339
	for <linux-media@vger.kernel.org>; Fri, 21 Nov 2025 04:43:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IcXgK2n5jAG1mriGbPmsrkH1L/P4MAnAlREwQeeAink=; b=fB0uXKKTbLMQUR6l
	wELygVZOTuuLlsnIWchh38SKqfx/YbZraB6Fv0sKL83e03rPy442vIfRKTxVItrW
	ZqPsOTy1LVuNJZQuYXE/rXodLJjxC/w20JMnu2TdGhEDM4hcaYNRM/xESFHMAxbd
	juJ6dLVZVtotap9yMsz1HcNwAbCGbIMLf0oAzZShPoB0Vn/m800SPxuPUTgzkiE5
	wPl/K/A9ytLmCvsfuXBmOZah2+NMZDS8K/Whsn67ocna6dflQxSVl8NJTt46RguH
	aKrC0SvzI2ykaOxbW1beRHmc+BDf+5GBNp5WXFUqQtKVoKXIa2c4yS+pkm0+n0gS
	Qpmgng==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajgeh04hn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 21 Nov 2025 04:43:47 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-450be8a012cso2783854b6e.0
        for <linux-media@vger.kernel.org>; Thu, 20 Nov 2025 20:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763700226; x=1764305026; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IcXgK2n5jAG1mriGbPmsrkH1L/P4MAnAlREwQeeAink=;
        b=gYJLEkk+UXV4vn/RNuLOzCCo6/QaYv3PBeso4i9mIrvHvYtmL1k5jOHmwgmBu/RsgQ
         UX5T+hvqZIt6EuTeQl5Wxq+kYZg28UjIxJFMaJ1hhYv/P4RRIrL/aWK5DoQtq/pGI9+x
         eIQQApYE8ucK7k2gXutgBR6ZVyJBBgm6GwhdRVe7PEVvbWqWPV7zRgOvHZGfYXUqawfh
         52/NllgLEOdQ1rAOY116e/NC1lywEzuJFlp2afJxULFmpsP4KtnTWdkcCaJHsh9UcC+s
         WoMLTwa/JYMNI/4uo1+FFVFCjWZy4EzyUwosAZL6oslVtEfgRmG1ZBi7EVuvXZBoxlgU
         5HYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763700226; x=1764305026;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IcXgK2n5jAG1mriGbPmsrkH1L/P4MAnAlREwQeeAink=;
        b=ppa6NqUdKsqApqoxTc8q+X9DXNHaXuu0Y0soZySIoFA+y5ygAh87o8CSkay1IvIzg4
         tPmmgghHE9s+qj0FFE2ebMEJwAXilf+LJSW4DMpxPhXbS+DYvuCn4zEZwLKgBYR4eI1S
         9x3wUDPfo8cJ1l7zkT1ihtecHw+vqKGy+CL2nizVACfGlzP1z3uLrujzuIJ41TjqjrPW
         J6ixRVhfG2981OFvrvFLbgcBzxlgLDP+CJ65VUTRrDdJU3c9y1ttsU2H7qWXeKYQOlQi
         xPFxwtEzziUlASDIt/0d+jyoX916K4fW/wR5hYHUpssWTTFIHfVW3IYfnIE5+Gl2FnI9
         UXQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYQCBGwlSLK0U5x9o/5iaMnDA5+i7krOjZXVCNzNMDez7KxZ0yQ1Alwq21NqbWwVult19mFnmWKzq6Kw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJpS/bDpdgizYTZxMTfe+amPe2p27meub1UwG84nEyWOF4c7cq
	18aCc0HBsDSFHMih4HvP1MIdkmbh+tQzf7IpSgijdZRlq1UGDNeihYfjJPygLwucjg4R+W6GCuw
	i4oypBdiEquVsLaWLZjOjIF18mrLywlFsi6PrQZeiMf825iGStfmlXX+nWIejEv6QyA==
X-Gm-Gg: ASbGncvm33M65Y/miFOxDWBgmXAzsrR3T51pdEGAAoUXfXhaqTsUEvRuDV/R826vflt
	NcQPdbn8rM0aR8TCrYQPUfnHxAsVqN4tSZQBVuProxReb837XYVizvpZCsYZBpvQkvowtHBSFfH
	dotf3XnG9c7FYMQW4CT1qwgLpd2tSuPrKLfzlZ8EHaxXfWNBLHDgGOkCOpd+elbCRqeMc7NACPk
	bf5NsXzEGRXjecQ2FZRM4d76HGjMwnPDGswJEAH1nMygrIzGu4c9PCy45/FYuIyZ1j5Md6Cx8Bl
	f0iSXO+5qNOTNnxrsZZqVpOptgVxyi3qzMaXNmxzIvQkl2Q12gSIW/flNc+TabIjoD4zh6nMARr
	4XA4vudpo6YtL+7gmCMDr6bETFuqosMDUBNg0P2uoxmTYH3SQiRogD89tje9AiOLP
X-Received: by 2002:a05:6808:4fec:b0:450:d693:4d1b with SMTP id 5614622812f47-45115a32f6bmr328907b6e.26.1763700226310;
        Thu, 20 Nov 2025 20:43:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE5xDv/j1gozr0rstq4O8NMpvM+Vp/dtqvslXpWF+00NhXGxfm7PBhjadcba4Wn80bdIebLAQ==
X-Received: by 2002:a05:6808:4fec:b0:450:d693:4d1b with SMTP id 5614622812f47-45115a32f6bmr328880b6e.26.1763700225734;
        Thu, 20 Nov 2025 20:43:45 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3ec9dc2185dsm2198927fac.13.2025.11.20.20.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 20:43:45 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Thu, 20 Nov 2025 20:43:13 -0800
Subject: [PATCH v7 1/5] media: dt-bindings: Add CAMSS device for Kaanapali
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251120-add-support-for-camss-on-kaanapali-v7-1-de27f9a67ce6@oss.qualcomm.com>
References: <20251120-add-support-for-camss-on-kaanapali-v7-0-de27f9a67ce6@oss.qualcomm.com>
In-Reply-To: <20251120-add-support-for-camss-on-kaanapali-v7-0-de27f9a67ce6@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDAzNCBTYWx0ZWRfX0OSa72Eqbdxi
 wM7b0+w4YBkCKHXwuaQC5rfo8sri+qv7HR3i6Lzi9d/Qq/NijaI4hQEKVvP+qFFJDnLNufjmp5d
 BKun1HgaXjX6VB0AoeBnLCrma6Zix+MyIvT/mSXXDHKM6micdS4QFlL1NnH03NQil1ougm2+WLQ
 HZs5MdG1VjUAk0jNVsuCwnIpWdzkLrTOMKLCcvOF9HkY7HQm3vW+WXdTi9gO8cTbYLVtgaC5W0u
 Nq8PEV9+HntgVqKKIlKyzi7O/jY3YIURck6QSb/XUQ7zYEbX1qjZcfY1DYx0tyXd70K8Z1WKIWg
 KaNe/WmL6DAF1Id2jCk5tvoQIR812XdtDEuaP0UsjwOVuDoIqAU85AQeI4nBeuqiG8QlP9h8o8Y
 MKxbqJOSeRVD+1wmfFB3hqMAebfBAA==
X-Proofpoint-GUID: TeEJYM3lSixhOpJ-mcx08lbClBG9o8v-
X-Authority-Analysis: v=2.4 cv=AubjHe9P c=1 sm=1 tr=0 ts=691fee03 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=78032wgmgAfrEkmTq9UA:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: TeEJYM3lSixhOpJ-mcx08lbClBG9o8v-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_02,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210034

Add the compatible string "qcom,kaanapali-camss" to support the Camera
Subsystem (CAMSS) on the Qualcomm Kaanapali platform.

The Kaanapali platform provides:
- 3 x VFE, 5 RDI per VFE
- 2 x VFE Lite, 4 RDI per VFE Lite
- 3 x CSID
- 2 x CSID Lite
- 6 x CSIPHY

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 .../bindings/media/qcom,kaanapali-camss.yaml       | 647 +++++++++++++++++++++
 1 file changed, 647 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
new file mode 100644
index 000000000000..094287c01a79
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
@@ -0,0 +1,647 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,kaanapali-camss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Kaanapali Camera Subsystem (CAMSS)
+
+maintainers:
+  - Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
+
+description:
+  This binding describes the camera subsystem hardware found on Kaanapali
+  Qualcomm SoCs. It includes submodules such as CSIPHY (CSI Physical layer)
+  and CSID (CSI Decoder), which comply with the MIPI CSI2 protocol.
+
+  The subsystem also integrates a set of real-time image processing engines
+  and their associated configuration modules, as well as non-real-time engines.
+
+  Additionally, it encompasses a test pattern generator (TPG) submodule.
+
+properties:
+  compatible:
+    const: qcom,kaanapali-camss
+
+  reg:
+    items:
+      - description: Registers for CSID 0
+      - description: Registers for CSID 1
+      - description: Registers for CSID 2
+      - description: Registers for CSID Lite 0
+      - description: Registers for CSID Lite 1
+      - description: Registers for CSIPHY 0
+      - description: Registers for CSIPHY 1
+      - description: Registers for CSIPHY 2
+      - description: Registers for CSIPHY 3
+      - description: Registers for CSIPHY 4
+      - description: Registers for CSIPHY 5
+      - description: Registers for VFE (Video Front End) 0
+      - description: Registers for VFE 1
+      - description: Registers for VFE 2
+      - description: Registers for VFE Lite 0
+      - description: Registers for VFE Lite 1
+      - description: Registers for ICP (Imaging Control Processor) 0
+      - description: Registers for ICP 0 SYS
+      - description: Registers for ICP 1
+      - description: Registers for ICP 1 SYS
+      - description: Registers for IPE (Image Processing Engine)
+      - description: Registers for JPEG DMA & Downscaler
+      - description: Registers for JPEG Encoder
+      - description: Registers for OFE (Offline Front End)
+      - description: Registers for RT CDM (Camera Data Mover) 0
+      - description: Registers for RT CDM 1
+      - description: Registers for RT CDM 2
+      - description: Registers for RT CDM 3
+      - description: Registers for RT CDM 4
+      - description: Registers for TPG 0
+      - description: Registers for TPG 1
+      - description: Registers for TPG 2
+
+  reg-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid_lite0
+      - const: csid_lite1
+      - const: csiphy0
+      - const: csiphy1
+      - const: csiphy2
+      - const: csiphy3
+      - const: csiphy4
+      - const: csiphy5
+      - const: vfe0
+      - const: vfe1
+      - const: vfe2
+      - const: vfe_lite0
+      - const: vfe_lite1
+      - const: icp0
+      - const: icp0_sys
+      - const: icp1
+      - const: icp1_sys
+      - const: ipe
+      - const: jpeg_dma
+      - const: jpeg_enc
+      - const: ofe
+      - const: rt_cdm0
+      - const: rt_cdm1
+      - const: rt_cdm2
+      - const: rt_cdm3
+      - const: rt_cdm4
+      - const: tpg0
+      - const: tpg1
+      - const: tpg2
+
+  clocks:
+    maxItems: 60
+
+  clock-names:
+    items:
+      - const: camnoc_nrt_axi
+      - const: camnoc_rt_axi
+      - const: camnoc_rt_vfe0
+      - const: camnoc_rt_vfe1
+      - const: camnoc_rt_vfe2
+      - const: camnoc_rt_vfe_lite
+      - const: cam_top_ahb
+      - const: cam_top_fast_ahb
+      - const: csid
+      - const: csid_csiphy_rx
+      - const: csiphy0
+      - const: csiphy0_timer
+      - const: csiphy1
+      - const: csiphy1_timer
+      - const: csiphy2
+      - const: csiphy2_timer
+      - const: csiphy3
+      - const: csiphy3_timer
+      - const: csiphy4
+      - const: csiphy4_timer
+      - const: csiphy5
+      - const: csiphy5_timer
+      - const: gcc_hf_axi
+      - const: vfe0
+      - const: vfe0_fast_ahb
+      - const: vfe1
+      - const: vfe1_fast_ahb
+      - const: vfe2
+      - const: vfe2_fast_ahb
+      - const: vfe_lite
+      - const: vfe_lite_ahb
+      - const: vfe_lite_cphy_rx
+      - const: vfe_lite_csid
+      - const: qdss_debug_xo
+      - const: camnoc_ipe_nps
+      - const: camnoc_ofe
+      - const: gcc_sf_axi
+      - const: icp0
+      - const: icp0_ahb
+      - const: icp1
+      - const: icp1_ahb
+      - const: ipe_nps
+      - const: ipe_nps_ahb
+      - const: ipe_nps_fast_ahb
+      - const: ipe_pps
+      - const: ipe_pps_fast_ahb
+      - const: jpeg
+      - const: ofe_ahb
+      - const: ofe_anchor
+      - const: ofe_anchor_fast_ahb
+      - const: ofe_hdr
+      - const: ofe_hdr_fast_ahb
+      - const: ofe_main
+      - const: ofe_main_fast_ahb
+      - const: vfe0_bayer
+      - const: vfe0_bayer_fast_ahb
+      - const: vfe1_bayer
+      - const: vfe1_bayer_fast_ahb
+      - const: vfe2_bayer
+      - const: vfe2_bayer_fast_ahb
+
+  interrupts:
+    maxItems: 30
+
+  interrupt-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid_lite0
+      - const: csid_lite1
+      - const: csiphy0
+      - const: csiphy1
+      - const: csiphy2
+      - const: csiphy3
+      - const: csiphy4
+      - const: csiphy5
+      - const: vfe0
+      - const: vfe1
+      - const: vfe2
+      - const: vfe_lite0
+      - const: vfe_lite1
+      - const: camnoc_nrt
+      - const: camnoc_rt
+      - const: icp0
+      - const: icp1
+      - const: jpeg_dma
+      - const: jpeg_enc
+      - const: rt_cdm0
+      - const: rt_cdm1
+      - const: rt_cdm2
+      - const: rt_cdm3
+      - const: rt_cdm4
+      - const: tpg0
+      - const: tpg1
+      - const: tpg2
+
+  interconnects:
+    maxItems: 4
+
+  interconnect-names:
+    items:
+      - const: ahb
+      - const: hf_mnoc
+      - const: sf_icp_mnoc
+      - const: sf_mnoc
+
+  iommus:
+    items:
+      - description: VFE non-protected stream
+      - description: ICP0 shared stream
+      - description: ICP1 shared stream
+      - description: IPE CDM non-protected stream
+      - description: IPE non-protected stream
+      - description: JPEG non-protected stream
+      - description: OFE CDM non-protected stream
+      - description: OFE non-protected stream
+      - description: VFE / VFE Lite CDM non-protected stream
+
+  power-domains:
+    items:
+      - description:
+          VFE0 GDSC - Global Distributed Switch Controller for VFE0.
+      - description:
+          VFE1 GDSC - Global Distributed Switch Controller for VFE1.
+      - description:
+          VFE2 GDSC - Global Distributed Switch Controller for VFE2.
+      - description:
+          Titan GDSC - Global Distributed Switch Controller for the entire camss.
+      - description:
+          IPE GDSC - Global Distributed Switch Controller for IPE.
+      - description:
+          OFE GDSC - Block Global Distributed Switch Controller for OFE.
+
+  power-domain-names:
+    items:
+      - const: vfe0
+      - const: vfe1
+      - const: vfe2
+      - const: top
+      - const: ipe
+      - const: ofe
+
+  vdd-csiphy0-0p8-supply:
+    description:
+      Phandle to a 0.8V regulator supply to CSIPHY0 core block.
+
+  vdd-csiphy0-1p2-supply:
+    description:
+      Phandle to a 1.2V regulator supply to CSIPHY0 pll block.
+
+  vdd-csiphy1-0p8-supply:
+    description:
+      Phandle to a 0.8V regulator supply to CSIPHY1 core block.
+
+  vdd-csiphy1-1p2-supply:
+    description:
+      Phandle to a 1.2V regulator supply to CSIPHY1 pll block.
+
+  vdd-csiphy2-0p8-supply:
+    description:
+      Phandle to a 0.8V regulator supply to CSIPHY2 core block.
+
+  vdd-csiphy2-1p2-supply:
+    description:
+      Phandle to a 1.2V regulator supply to CSIPHY2 pll block.
+
+  vdd-csiphy3-0p8-supply:
+    description:
+      Phandle to a 0.8V regulator supply to CSIPHY3 core block.
+
+  vdd-csiphy3-1p2-supply:
+    description:
+      Phandle to a 1.2V regulator supply to CSIPHY3 pll block.
+
+  vdd-csiphy4-0p8-supply:
+    description:
+      Phandle to a 0.8V regulator supply to CSIPHY4 core block.
+
+  vdd-csiphy4-1p2-supply:
+    description:
+      Phandle to a 1.2V regulator supply to CSIPHY4 pll block.
+
+  vdd-csiphy5-0p8-supply:
+    description:
+      Phandle to a 0.8V regulator supply to CSIPHY5 core block.
+
+  vdd-csiphy5-1p2-supply:
+    description:
+      Phandle to a 1.2V regulator supply to CSIPHY5 pll block.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    description:
+      CSI input ports.
+
+patternProperties:
+  "^port@[0-5]$":
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    unevaluatedProperties: false
+    description:
+      Input ports for receiving CSI data on CSIPHY 0-5.
+
+    properties:
+      endpoint:
+        $ref: video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            minItems: 1
+            maxItems: 4
+
+        required:
+          - data-lanes
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - interconnects
+  - interconnect-names
+  - iommus
+  - power-domains
+  - power-domain-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        isp@9253000 {
+            compatible = "qcom,kaanapali-camss";
+
+            reg = <0x0 0x09253000 0x0 0x5e80>,
+                  <0x0 0x09263000 0x0 0x5e80>,
+                  <0x0 0x09273000 0x0 0x5e80>,
+                  <0x0 0x092d3000 0x0 0x3880>,
+                  <0x0 0x092e7000 0x0 0x3880>,
+                  <0x0 0x09523000 0x0 0x2000>,
+                  <0x0 0x09525000 0x0 0x2000>,
+                  <0x0 0x09527000 0x0 0x2000>,
+                  <0x0 0x09529000 0x0 0x2000>,
+                  <0x0 0x0952b000 0x0 0x2000>,
+                  <0x0 0x0952d000 0x0 0x2000>,
+                  <0x0 0x09151000 0x0 0x20000>,
+                  <0x0 0x09171000 0x0 0x20000>,
+                  <0x0 0x09191000 0x0 0x20000>,
+                  <0x0 0x092dc000 0x0 0x1300>,
+                  <0x0 0x092f0000 0x0 0x1300>,
+                  <0x0 0x0900e000 0x0 0x1000>,
+                  <0x0 0x0900d000 0x0 0x1000>,
+                  <0x0 0x0902e000 0x0 0x1000>,
+                  <0x0 0x0902d000 0x0 0x1000>,
+                  <0x0 0x090d7000 0x0 0x20000>,
+                  <0x0 0x0904e000 0x0 0x1000>,
+                  <0x0 0x0904d000 0x0 0x1000>,
+                  <0x0 0x09057000 0x0 0x40000>,
+                  <0x0 0x09147000 0x0 0x580>,
+                  <0x0 0x09148000 0x0 0x580>,
+                  <0x0 0x09149000 0x0 0x580>,
+                  <0x0 0x0914a000 0x0 0x580>,
+                  <0x0 0x0914b000 0x0 0x580>,
+                  <0x0 0x093fd000 0x0 0x400>,
+                  <0x0 0x093fe000 0x0 0x400>,
+                  <0x0 0x093ff000 0x0 0x400>;
+            reg-names = "csid0",
+                        "csid1",
+                        "csid2",
+                        "csid_lite0",
+                        "csid_lite1",
+                        "csiphy0",
+                        "csiphy1",
+                        "csiphy2",
+                        "csiphy3",
+                        "csiphy4",
+                        "csiphy5",
+                        "vfe0",
+                        "vfe1",
+                        "vfe2",
+                        "vfe_lite0",
+                        "vfe_lite1",
+                        "icp0",
+                        "icp0_sys",
+                        "icp1",
+                        "icp1_sys",
+                        "ipe",
+                        "jpeg_dma",
+                        "jpeg_enc",
+                        "ofe",
+                        "rt_cdm0",
+                        "rt_cdm1",
+                        "rt_cdm2",
+                        "rt_cdm3",
+                        "rt_cdm4",
+                        "tpg0",
+                        "tpg1",
+                        "tpg2";
+
+            clocks = <&camcc_cam_cc_camnoc_nrt_axi_clk>,
+                     <&camcc_cam_cc_camnoc_rt_axi_clk>,
+                     <&camcc_cam_cc_camnoc_rt_vfe_0_main_clk>,
+                     <&camcc_cam_cc_camnoc_rt_vfe_1_main_clk>,
+                     <&camcc_cam_cc_camnoc_rt_vfe_2_main_clk>,
+                     <&camcc_cam_cc_camnoc_rt_vfe_lite_clk>,
+                     <&camcc_cam_cc_cam_top_ahb_clk>,
+                     <&camcc_cam_cc_cam_top_fast_ahb_clk>,
+                     <&camcc_cam_cc_csid_clk>,
+                     <&camcc_cam_cc_csid_csiphy_rx_clk>,
+                     <&camcc_cam_cc_csiphy0_clk>,
+                     <&camcc_cam_cc_csi0phytimer_clk>,
+                     <&camcc_cam_cc_csiphy1_clk>,
+                     <&camcc_cam_cc_csi1phytimer_clk>,
+                     <&camcc_cam_cc_csiphy2_clk>,
+                     <&camcc_cam_cc_csi2phytimer_clk>,
+                     <&camcc_cam_cc_csiphy3_clk>,
+                     <&camcc_cam_cc_csi3phytimer_clk>,
+                     <&camcc_cam_cc_csiphy4_clk>,
+                     <&camcc_cam_cc_csi4phytimer_clk>,
+                     <&camcc_cam_cc_csiphy5_clk>,
+                     <&camcc_cam_cc_csi5phytimer_clk>,
+                     <&gcc_gcc_camera_hf_axi_clk>,
+                     <&camcc_cam_cc_vfe_0_main_clk>,
+                     <&camcc_cam_cc_vfe_0_main_fast_ahb_clk>,
+                     <&camcc_cam_cc_vfe_1_main_clk>,
+                     <&camcc_cam_cc_vfe_1_main_fast_ahb_clk>,
+                     <&camcc_cam_cc_vfe_2_main_clk>,
+                     <&camcc_cam_cc_vfe_2_main_fast_ahb_clk>,
+                     <&camcc_cam_cc_vfe_lite_clk>,
+                     <&camcc_cam_cc_vfe_lite_ahb_clk>,
+                     <&camcc_cam_cc_vfe_lite_cphy_rx_clk>,
+                     <&camcc_cam_cc_vfe_lite_csid_clk>,
+                     <&camcc_cam_cc_qdss_debug_xo_clk>,
+                     <&camcc_cam_cc_camnoc_nrt_ipe_nps_clk>,
+                     <&camcc_cam_cc_camnoc_nrt_ofe_main_clk>,
+                     <&gcc_gcc_camera_sf_axi_clk>,
+                     <&camcc_cam_cc_icp_0_clk>,
+                     <&camcc_cam_cc_icp_0_ahb_clk>,
+                     <&camcc_cam_cc_icp_1_clk>,
+                     <&camcc_cam_cc_icp_1_ahb_clk>,
+                     <&camcc_cam_cc_ipe_nps_clk>,
+                     <&camcc_cam_cc_ipe_nps_ahb_clk>,
+                     <&camcc_cam_cc_ipe_nps_fast_ahb_clk>,
+                     <&camcc_cam_cc_ipe_pps_clk>,
+                     <&camcc_cam_cc_ipe_pps_fast_ahb_clk>,
+                     <&camcc_cam_cc_jpeg_clk>,
+                     <&camcc_cam_cc_ofe_ahb_clk>,
+                     <&camcc_cam_cc_ofe_anchor_clk>,
+                     <&camcc_cam_cc_ofe_anchor_fast_ahb_clk>,
+                     <&camcc_cam_cc_ofe_hdr_clk>,
+                     <&camcc_cam_cc_ofe_hdr_fast_ahb_clk>,
+                     <&camcc_cam_cc_ofe_main_clk>,
+                     <&camcc_cam_cc_ofe_main_fast_ahb_clk>,
+                     <&camcc_cam_cc_vfe_0_bayer_clk>,
+                     <&camcc_cam_cc_vfe_0_bayer_fast_ahb_clk>,
+                     <&camcc_cam_cc_vfe_1_bayer_clk>,
+                     <&camcc_cam_cc_vfe_1_bayer_fast_ahb_clk>,
+                     <&camcc_cam_cc_vfe_2_bayer_clk>,
+                     <&camcc_cam_cc_vfe_2_bayer_fast_ahb_clk>;
+            clock-names = "camnoc_nrt_axi",
+                          "camnoc_rt_axi",
+                          "camnoc_rt_vfe0",
+                          "camnoc_rt_vfe1",
+                          "camnoc_rt_vfe2",
+                          "camnoc_rt_vfe_lite",
+                          "cam_top_ahb",
+                          "cam_top_fast_ahb",
+                          "csid",
+                          "csid_csiphy_rx",
+                          "csiphy0",
+                          "csiphy0_timer",
+                          "csiphy1",
+                          "csiphy1_timer",
+                          "csiphy2",
+                          "csiphy2_timer",
+                          "csiphy3",
+                          "csiphy3_timer",
+                          "csiphy4",
+                          "csiphy4_timer",
+                          "csiphy5",
+                          "csiphy5_timer",
+                          "gcc_hf_axi",
+                          "vfe0",
+                          "vfe0_fast_ahb",
+                          "vfe1",
+                          "vfe1_fast_ahb",
+                          "vfe2",
+                          "vfe2_fast_ahb",
+                          "vfe_lite",
+                          "vfe_lite_ahb",
+                          "vfe_lite_cphy_rx",
+                          "vfe_lite_csid",
+                          "qdss_debug_xo",
+                          "camnoc_ipe_nps",
+                          "camnoc_ofe",
+                          "gcc_sf_axi",
+                          "icp0",
+                          "icp0_ahb",
+                          "icp1",
+                          "icp1_ahb",
+                          "ipe_nps",
+                          "ipe_nps_ahb",
+                          "ipe_nps_fast_ahb",
+                          "ipe_pps",
+                          "ipe_pps_fast_ahb",
+                          "jpeg",
+                          "ofe_ahb",
+                          "ofe_anchor",
+                          "ofe_anchor_fast_ahb",
+                          "ofe_hdr",
+                          "ofe_hdr_fast_ahb",
+                          "ofe_main",
+                          "ofe_main_fast_ahb",
+                          "vfe0_bayer",
+                          "vfe0_bayer_fast_ahb",
+                          "vfe1_bayer",
+                          "vfe1_bayer_fast_ahb",
+                          "vfe2_bayer",
+                          "vfe2_bayer_fast_ahb";
+
+            interrupts = <GIC_SPI 601 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 603 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 605 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 376 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 89 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 433 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 436 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 457 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 606 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 377 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 271 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 277 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 463 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 657 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 372 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 475 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 456 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 664 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 702 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 348 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 349 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 413 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 416 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 417 IRQ_TYPE_EDGE_RISING>;
+            interrupt-names = "csid0",
+                              "csid1",
+                              "csid2",
+                              "csid_lite0",
+                              "csid_lite1",
+                              "csiphy0",
+                              "csiphy1",
+                              "csiphy2",
+                              "csiphy3",
+                              "csiphy4",
+                              "csiphy5",
+                              "vfe0",
+                              "vfe1",
+                              "vfe2",
+                              "vfe_lite0",
+                              "vfe_lite1",
+                              "camnoc_nrt",
+                              "camnoc_rt",
+                              "icp0",
+                              "icp1",
+                              "jpeg_dma",
+                              "jpeg_enc",
+                              "rt_cdm0",
+                              "rt_cdm1",
+                              "rt_cdm2",
+                              "rt_cdm3",
+                              "rt_cdm4",
+                              "tpg0",
+                              "tpg1",
+                              "tpg2";
+
+            interconnects = <&gem_noc_master_appss_proc QCOM_ICC_TAG_ACTIVE_ONLY
+                             &config_noc_slave_camera_cfg QCOM_ICC_TAG_ACTIVE_ONLY>,
+                            <&mmss_noc_master_camnoc_hf QCOM_ICC_TAG_ALWAYS
+                             &mc_virt_slave_ebi1 QCOM_ICC_TAG_ALWAYS>,
+                            <&mmss_noc_master_camnoc_sf_icp QCOM_ICC_TAG_ALWAYS
+                             &mc_virt_slave_ebi1 QCOM_ICC_TAG_ALWAYS>,
+                            <&mmss_noc_master_camnoc_sf QCOM_ICC_TAG_ALWAYS
+                             &mc_virt_slave_ebi1 QCOM_ICC_TAG_ALWAYS>;
+            interconnect-names = "ahb",
+                                 "hf_mnoc",
+                                 "sf_icp_mnoc",
+                                 "sf_mnoc";
+
+            iommus = <&apps_smmu 0x1c00 0x00>,
+                     <&apps_smmu 0x18c0 0x00>,
+                     <&apps_smmu 0x1980 0x00>,
+                     <&apps_smmu 0x1840 0x00>,
+                     <&apps_smmu 0x1800 0x00>,
+                     <&apps_smmu 0x18a0 0x00>,
+                     <&apps_smmu 0x1880 0x00>,
+                     <&apps_smmu 0x1820 0x00>,
+                     <&apps_smmu 0x1860 0x00>;
+
+            power-domains = <&camcc_cam_cc_vfe_0_gdsc>,
+                            <&camcc_cam_cc_vfe_1_gdsc>,
+                            <&camcc_cam_cc_vfe_2_gdsc>,
+                            <&camcc_cam_cc_titan_top_gdsc>,
+                            <&camcc_cam_cc_ipe_gdsc>,
+                            <&camcc_cam_cc_ofe_gdsc>;
+            power-domain-names = "vfe0",
+                                 "vfe1",
+                                 "vfe2",
+                                 "top",
+                                 "ipe",
+                                 "ofe";
+
+            vdd-csiphy0-0p8-supply = <&vreg_0p8_supply>;
+            vdd-csiphy0-1p2-supply = <&vreg_1p2_supply>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    csiphy_ep0: endpoint {
+                        data-lanes = <0 1>;
+                        remote-endpoint = <&sensor_ep>;
+                    };
+                };
+            };
+        };
+    };

-- 
2.34.1


