Return-Path: <linux-media+bounces-60942-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sD4nHB4z/mmHnwAAu9opvQ
	(envelope-from <linux-media+bounces-60942-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 21:01:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C3F4FAD59
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 21:01:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 210D63028B2C
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2026 19:01:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7234841322B;
	Fri,  8 May 2026 19:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H30PgFuI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WRAx2i6V"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B873FB7DB
	for <linux-media@vger.kernel.org>; Fri,  8 May 2026 19:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778266864; cv=none; b=CstVX8Rek7wtDdLMN+5jardGR0OAlRmWXt5HEIWCVxyu7lAQyRY45OCXmRe6WCZj97T5HoUeFmS+ceKPgA+w2/+abdsPxc1Ra+LuQCII5+oy/JRUPH8ZSnMvD07R1BDFFDuzsZmmXW5gCGmfmq26qyCjQm04FFwEisAG605Or3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778266864; c=relaxed/simple;
	bh=KiXuVUk8f5ROMtDUgjaTz7+prNR9bmBTgAeAT+6V4KA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bTtQmbCAYTjye53wMnHVXQZk+8eLAd/Ol/KJXVBHbuBLfMehfHKMHS1N/2zxrZbPf3ZNkLWfEfd7D0O0BtNfyqiw0oQPDkXCkfT3KbzgeSFrOUJ0S68JrP/DA7Zda8yq5aqoDo0kXNh29SgSIsr7cvVLyfqdqc/0uroyc+x/M6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H30PgFuI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WRAx2i6V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648G4Ln71094270
	for <linux-media@vger.kernel.org>; Fri, 8 May 2026 19:01:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nSH30GGE8av6HezR9dT6kdpTEbioXtP5Ir1fDXax7/U=; b=H30PgFuIOWFar7PT
	rgcH6ReOZdJ/nusVsZIu95k087ZykWalSLacMrjPmXk/pu7srtTEFu426vARX/9t
	HVwJEHDATJmo4wxGOf8pGPIEcrxHcRMNv9HLIApfe7+HFioPLiGug2eyK9CH5DI2
	kSLPus2tRm4esB7Uka81cGuHX1VHa3LAEpKev/37/AEiLOf4tW1lzqIbAFHohuo0
	sKIV90kmoieQHaDakQu40Vcd88RCeeChYnwhJpxbJoXhpwAhYYYpEpcYX4+OQJn+
	Fi1fjCpe6tmgF++ZHzqKa9KoBFKMCDvWbpS8EVf7bBQCIGffz6wgs7MwJ7yZi78O
	m9PTDA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1k1d0mfp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 08 May 2026 19:01:02 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c802545ae0eso1482834a12.2
        for <linux-media@vger.kernel.org>; Fri, 08 May 2026 12:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778266862; x=1778871662; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nSH30GGE8av6HezR9dT6kdpTEbioXtP5Ir1fDXax7/U=;
        b=WRAx2i6VnkRIEeMXwE4tFtNH0oX9WaLparKXoBbzifjRGU2Fp3s3uU5bhWTZwX35iw
         HXpze9Dzkg3gwfrkFoJEbgBVfrcOiZlt3c9cNXzKtmi9lDxriI0zQ2P9HU/rpcvOS2Mv
         IG1yulgTHLLWnk61NP6SHa9CopWpuxOoU0IDZ8N+gf9AHR0TKTStfSJ9u6tB3kgL4F3g
         dxCEb3zgCyuBfd5scs9CGX6NCGNcLdQg92KpPK9dLw9g2KYRcjJyOiouhhawuK0NvGsN
         +/qmbY+SXZFHcJ9owTmss5gb7A81JZ1fwnwP8kwK2o2kpVvFIQFAcs9y8+Uu1MX9rgsK
         jBjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778266862; x=1778871662;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nSH30GGE8av6HezR9dT6kdpTEbioXtP5Ir1fDXax7/U=;
        b=Q3xiSiGg/7pIXdHSKMF/XCkqVkAknnhqM+bA7yXUouKhVos3dVczUa5JqPuUO/Pc6E
         sBgpWx4/B1qgozOqlVypxkgPkFQCoxoFsg7KfaNIOTLI1AwLUnaYppR0dilSaP9AqkRD
         8r4JHY8kqWyANyV0ih7yGfAuiyUL0/BVJjrZq1LlmLo7n2EpWvQRRVUD9M0fbBVucFvA
         7AZCBfZjAkxDq4CBmJGWGfKXOYEaU3Yxqf5bpAqb3aiwA8BaRhncRQzm/C64G6X+eSz2
         2v8PqHshLRZZ2zxIPjOYTUfW6Pa3CmpbWAcu+rbpWqVq/DnEdITYoHKzzGTEXYWPKdSB
         ndrw==
X-Forwarded-Encrypted: i=1; AFNElJ9+AhQZaMV8DJMjhiPthLOhkO1qzb2N9syARdr3aqSmNbpESyg2ewNXaBzp0P8NDqS6qDwnbjR0mputMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwyEw28/aHpdRpO4hxFiYdpQsLCE30PQXlVwyCmIL73oVpGlJvt
	OMn6fdJ5yhLIsGKNR3gEsLxyPRhRFyGIkuH+iCqK1MhBtu39Jbg9/Oqv9ylOafGrqfaob/ShSaF
	KnGzrPjPvuSVfSURZwoeuyLEhlpzQj2rodFo7nnnZhmWhG+QbPKDaCPcCO1ihwos2hk3uUZ7Z3w
	==
X-Gm-Gg: AeBDiesCvVzswGPsA41NnHuHDQIbhijr+OR9PeOdKZ+qjUZ3B0MMp2KC7V8l5SnUBsQ
	saPlCr8fd9Zo4l3M3NY0FBuxSa5yEXkyYQhLc7l229Y/xRiyGFjq+5c/9ZCim8sT8n/eeaAJN6U
	e4RkNR4XgTeLJXp2eDRGYcf4ni1KyzHN4+urPRW3cgZnTBbw0xpq7pprTbPSdcD0xJn9hFAqOvy
	wzOjQSTA8BWnlempa2JKRfAUWVNq70jwrjJYEEjWDCPhe6oPG7mfAbeDbDQ4Ooiy+OjL3+oX89T
	bwGr87lk1VfjRqq4xnVp+U5fIWmUcj920Nneuu525wN2vA9hBPSs9AFbHDA+i/TAzpl5TfVr56A
	xLT6do21Z9ImRVAwDIvlz4f9r/0lcZxfMO8GGDEHKTSJMN6LTvcCnlCk=
X-Received: by 2002:a05:6a00:1248:b0:82c:d9d0:f482 with SMTP id d2e1a72fcca58-83a5e34c689mr14024574b3a.46.1778266861487;
        Fri, 08 May 2026 12:01:01 -0700 (PDT)
X-Received: by 2002:a05:6a00:1248:b0:82c:d9d0:f482 with SMTP id d2e1a72fcca58-83a5e34c689mr14024480b3a.46.1778266860675;
        Fri, 08 May 2026 12:01:00 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965a3e3ecsm13395550b3a.19.2026.05.08.12.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 12:01:00 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sat, 09 May 2026 00:29:50 +0530
Subject: [PATCH v5 01/14] media: iris: Add iris vpu bus support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260509-glymur-v5-1-7fbb340c5dbd@oss.qualcomm.com>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
In-Reply-To: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778266845; l=5067;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=52EKURZCx0iONFkZ6Gam+KM/I7Qv+TkHOEbMgjnm0ZY=;
 b=xwNOosr4zZSY/kkC5jN4RuFPftj3txidBOZKTYPPLpEYuELOnegY0moCnT47NsBKdFtrRqbmG
 duF8LGNX3JWAZZl4vn4aGwr69PnXTk0XzamqgquN1CLNXLrLMafUxSg
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDE5MCBTYWx0ZWRfXyvmYXjELIR2Z
 0aSnGWC/3MSzWKkvf+Z54PrLA6Fy712dCh39W0tvCPnSGFTOPxF1G/YXi56nipU0H8zylMysq8Z
 3RhnSbIP9EQasmSbcOx9AWwqxCOdcUpCfjY7p1rAz5fMdZbe1ZjQedtvxyH2Nit/GbDqtIXLx2F
 DTJR1/6U2Sdcfhy8YHb8pr9glZuSTw5mdEOyZwSfvrzoLL2H3FG78abmvFWvEp+QRCAbckF0xY3
 ZXw3R2TYaVBfz+sVD3cexeyDH604kJdqT/pkKnEkUK3xOb/d+EJaWfsd1Rg4liOjEs2BYWak0gb
 wnA+0e7C23utwcp95vSERtO9pM2LqGbOzJzuvWwnPD/4bN7RPrvSzDFpczlYKz/+tP6/Rtk0itp
 /JrN76zbHp85jtljq6UFvKvssProAU1khBVAVcEe7VVZXL80bEpxDKVC3hfrmrCrXhD1FseHSdZ
 UF6gQ+FCjX28j90JGag==
X-Authority-Analysis: v=2.4 cv=GLU41ONK c=1 sm=1 tr=0 ts=69fe32ee cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ZVWlKI4yLptaSbO15nIA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: WXrQcxG2gAmLJOdfFEA75bdRMsyVFKGX
X-Proofpoint-GUID: WXrQcxG2gAmLJOdfFEA75bdRMsyVFKGX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080190
X-Rspamd-Queue-Id: 74C3F4FAD59
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60942-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

On glymur platform, firmware loading needs a separate IOMMU mapping with
its own stream ID. This stream ID is defined in the device tree with the
assosiated firmware function ID in the iommu-map property. To create this
mapping, a separate child device is needed so the firmware memory can be
isolated in its own IOMMU context.

Introduced a new bus called iris-vpu-bus. This creates a dynamic device,
and its dma_configure() callback calls of_dma_configure_id() with the
function ID provided by the client to map the corresponding stream ID.
This sets up a dedicated IOMMU context for the child device.

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/Kconfig        |  4 ++
 drivers/media/platform/qcom/iris/Makefile       |  1 +
 drivers/media/platform/qcom/iris/iris_vpu_bus.c | 69 +++++++++++++++++++++++++
 include/linux/iris_vpu_bus.h                    | 25 +++++++++
 4 files changed, 99 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/Kconfig b/drivers/media/platform/qcom/iris/Kconfig
index 5498f48362d1..025280ef1221 100644
--- a/drivers/media/platform/qcom/iris/Kconfig
+++ b/drivers/media/platform/qcom/iris/Kconfig
@@ -1,3 +1,6 @@
+config QCOM_IRIS_VPU_BUS
+        bool
+
 config VIDEO_QCOM_IRIS
         tristate "Qualcomm iris V4L2 decoder driver"
         depends on VIDEO_DEV
@@ -6,6 +9,7 @@ config VIDEO_QCOM_IRIS
         select QCOM_MDT_LOADER
         select QCOM_SCM
         select VIDEOBUF2_DMA_CONTIG
+        select QCOM_IRIS_VPU_BUS
         help
           This is a V4L2 driver for Qualcomm iris video accelerator
           hardware. It accelerates decoding operations on various
diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 2abbd3aeb4af..79bc67980339 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -31,3 +31,4 @@ qcom-iris-objs += iris_platform_gen1.o
 endif
 
 obj-$(CONFIG_VIDEO_QCOM_IRIS) += qcom-iris.o
+obj-$(CONFIG_QCOM_IRIS_VPU_BUS) += iris_vpu_bus.o
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_bus.c b/drivers/media/platform/qcom/iris/iris_vpu_bus.c
new file mode 100644
index 000000000000..15ba4d9c563e
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_vpu_bus.c
@@ -0,0 +1,69 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/device.h>
+#include <linux/iris_vpu_bus.h>
+#include <linux/of_device.h>
+
+static int iris_vpu_bus_dma_configure(struct device *dev)
+{
+	const u32 *iommu_fid = dev_get_drvdata(dev);
+
+	return of_dma_configure_id(dev, dev->parent->of_node, true, iommu_fid);
+}
+
+const struct bus_type iris_vpu_bus_type = {
+	.name = "iris-vpu-bus",
+	.dma_configure = iris_vpu_bus_dma_configure,
+};
+EXPORT_SYMBOL_GPL(iris_vpu_bus_type);
+
+static void release_iris_vpu_bus_device(struct device *dev)
+{
+	kfree(dev);
+}
+
+struct device *create_iris_vpu_bus_device(struct device *parent_device, const char *name,
+					  u64 dma_mask, const u32 *iommu_fid)
+{
+	struct device *dev;
+	int ret;
+
+	dev = kzalloc_obj(*dev);
+	if (!dev)
+		return ERR_PTR(-ENOMEM);
+
+	dev->release = release_iris_vpu_bus_device;
+	dev->bus = &iris_vpu_bus_type;
+	dev->parent = parent_device;
+	dev->coherent_dma_mask = dma_mask;
+	dev->dma_mask = &dev->coherent_dma_mask;
+
+	dev_set_name(dev, "%s", name);
+	dev_set_drvdata(dev, (void *)iommu_fid);
+
+	ret = device_register(dev);
+	if (ret) {
+		put_device(dev);
+		return ERR_PTR(ret);
+	}
+
+	return dev;
+}
+EXPORT_SYMBOL_GPL(create_iris_vpu_bus_device);
+
+static int __init iris_vpu_bus_init(void)
+{
+	int ret;
+
+	ret = bus_register(&iris_vpu_bus_type);
+	if (ret) {
+		pr_err("iris-vpu-bus registration failed: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+postcore_initcall(iris_vpu_bus_init);
diff --git a/include/linux/iris_vpu_bus.h b/include/linux/iris_vpu_bus.h
new file mode 100644
index 000000000000..7437a2ba411c
--- /dev/null
+++ b/include/linux/iris_vpu_bus.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _LINUX_IRIS_VPU_BUS_H
+#define _LINUX_IRIS_VPU_BUS_H
+
+#include <linux/device.h>
+
+#ifdef CONFIG_QCOM_IRIS_VPU_BUS
+extern const struct bus_type iris_vpu_bus_type;
+
+struct device *create_iris_vpu_bus_device(struct device *parent_device, const char *name,
+					  u64 dma_mask, const u32 *iommu_fid);
+#else
+static inline struct device *create_iris_vpu_bus_device(struct device *parent_device,
+							const char *name, u64 dma_mask,
+							const u32 *iommu_fid)
+{
+	return ERR_PTR(-ENODEV);
+}
+#endif
+
+#endif /* _LINUX_IRIS_VPU_BUS_H */

-- 
2.34.1


