Return-Path: <linux-media+bounces-58694-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0KfqGk7K3WknjQkAu9opvQ
	(envelope-from <linux-media+bounces-58694-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 07:02:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF603F597C
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 07:02:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 98735307ABBC
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 05:00:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 183D7223DCE;
	Tue, 14 Apr 2026 05:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aTER+EvD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HVCA+Dhw"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B89423E342
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 05:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776142844; cv=none; b=a5wtwyLG0aaVpEkTz5Os14WfSzfs6y6kuzRic5ku5t2xmYjKqd6sQxcBudFTzAxOneNTflSLkc7Vs0etBdfjwVxcYNXvj0fzViZVG2HRf4N7p8b+/4UgtLqkAtiVwDyHUH4r5GnvdSvsnGRQCXnaa3EldR1bLoHE7abqMV3D+ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776142844; c=relaxed/simple;
	bh=O/+LYBNLdxSQKzsqIETsJYp7ERapNlu6dOUA1n/zY1c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pokLIr8fimwcpbWDOLnSK56y8hH9al3dpjGqTDNEEYDWHONhYsI3YQxcWH6QUGzVncy4+A2cZmsb3/0Nb3kQPDgVj8VIY6zME5GkrvS96aeCPpPvqjGKLNYnLOc8EtyPLM8aNPGxJNSOMw4M9rnGv78QKHgI/ODAS9fAgPN46j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aTER+EvD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HVCA+Dhw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DLCbGI967304
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 05:00:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aMuxr0+9TcjyPSsVh1aKRVut6k2RFbAyhAme7P42Vtk=; b=aTER+EvDjXvlAJW5
	TlY5GnyLlKiAQsaeWrVAVP9RxVQZfv11bAGqCoh3DCxVVZjzaW8tvnWyMhIKwMnC
	oGDB3RtMERTZG4jB8MIB6gl9o35WJveIkbNvJyUOk0zLrVl2j8UlP/0MO77tqzOH
	3m6G1dLimpXTSileapV3ClkdmbdF+kvMCsQ+lN1l09FmIc5/twjboYrQs0dQyPlg
	YDouvOnq5DMS+97jSK7hCW3kqgXh+wTyLr46C1mZpzhIs1Cc92dvWvx2DALgzmQy
	DLXciOipw+pwHhmzDvdgDIlfdFSvpWDYmsiVL5RIJU68Yz3vUSCdjVwr0rjKhbTT
	AoOtMA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86v11tp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 05:00:42 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b250d3699aso102673165ad.2
        for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 22:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776142841; x=1776747641; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aMuxr0+9TcjyPSsVh1aKRVut6k2RFbAyhAme7P42Vtk=;
        b=HVCA+Dhw3OXNvx5G9at/vCZm/umettXjmlJ+CSyaVjMWpnGq1i9vhlgpDklJFkODjw
         He/6e8Uynrtfxc0+IJqe8Vmgcrj7ebhw/c15OekJYg5snJUhN95/qPgezQQh+kAQe9No
         f7xiU2jqwGIPU6lLgeqdevScQsmkZwTeDPUtBfXKn68wwuKZlyGEIYzPzbYZV62bm1g1
         smskCNIoiV7N1cC6TY3bFunMaGVFuOc59bgmUcFNfNM8FtP5MY+14x08rV/uszudGGbQ
         7eWnL/LrAVovJxk3yDwtSs04bPb9AlIWwbnPLwE6Kodlh1H+2xaH4GDcOXy4uduXS+mv
         cpmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776142841; x=1776747641;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aMuxr0+9TcjyPSsVh1aKRVut6k2RFbAyhAme7P42Vtk=;
        b=lOEy6mYD+2Tb2fjixl58YxnB//YLrQx1mUd+rrYHGhHgfMZaHfI+1Zov1KNy7F6Q78
         cHJ9zvvhAOa50Z8CwItrv0f9qtMjKjs2tB6vbIfkmwjod1ac5kqts1WTNRaFpjtaN+dL
         c3Zjre2LnPtzorpE73nlRhE1X7m7BX4xQb9MC7GHjGhlfhTH6NkNIMqxvEB1H7YTOxae
         FV+WqkiG9MjQFAsV5IwIU0OPmOiz1RY2wOvTWwwRfQYcLtCNtZFrnF9feyZBM1JfZL8N
         +qjh7+BDJG6e5pWQE/SbDtKRV1ZUD2TeaCwQmir8ppbkcfUvdZixAkZag4XWvOLk2D/U
         yJuA==
X-Gm-Message-State: AOJu0YzBEZE6cjAwqvD1+LaybOYQP2a+7NDInJN7jAngTjoT7+RBIAWG
	jCUAoysd2FYcWs9tHMZODaebRbC9Dgz4AHBTfUouFeCQYe7rwwxpbXSWgBe3s4TwvFqeAMW+kcO
	4cJWqR1zOFQ9Sm2wUhuy2McbiGXYPiG0Z7vLn+nmuZNgbOuj//onclKLTK4H6fP+7FA==
X-Gm-Gg: AeBDietuIi97mNA1qfcOG3eDbSWbeuTTHDeVUMKFQPptHN01LmxEFpxWPUtpJ4uph2x
	ZM7hsAtka4FYqRr5u8Y1EmBWtr1EV+HCoXwqbuiKYKWB0JiAuwNFWskbEX0etOgDaZ9CzHDiNzY
	7wfzdJPjpm4MBynk4zHsBbeMi21ibMCO1q3AT/YCACo+G3gSgrw0ZRs+34ENSmHvIjNiDj/aFyi
	5hQJPyiMs+sTQEjTGt/WqgDsMmt1v0NfRO1PpKDkJ5bc2ROBbHPLCCDLj0xQJzVlBgd8HkzCp9t
	qwj0Mlsn1/qh5raIbYCeWxVWBVcV3Wr/T9Wrjw9aitFJlfdy5DgS1ak0gM1OD17D5uAkwcp53Wk
	zCGPHPtfJWXsqOLejgG4TmIEViZSjxu4NlmE3XXvBY6+ncHefDDJd9GU=
X-Received: by 2002:a17:903:1a8f:b0:2b0:7531:b61e with SMTP id d9443c01a7336-2b2d5a64f08mr163149455ad.41.1776142841093;
        Mon, 13 Apr 2026 22:00:41 -0700 (PDT)
X-Received: by 2002:a17:903:1a8f:b0:2b0:7531:b61e with SMTP id d9443c01a7336-2b2d5a64f08mr163149055ad.41.1776142840556;
        Mon, 13 Apr 2026 22:00:40 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4db198asm134678425ad.3.2026.04.13.22.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 22:00:40 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 10:29:58 +0530
Subject: [PATCH 02/11] media: iris: Add iris vpu bus support and register
 it with iommu_buses
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-glymur-v1-2-7d3d1cf57b16@oss.qualcomm.com>
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
In-Reply-To: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776142821; l=3184;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=BLj6gT5dri/81+O7yZmqLEqPFKVnYkph8y79xh/glKQ=;
 b=CoGStrTZzo2YY89yPHj3q/r7F4MIOhu+D9erCHhYmDQtaV1B3scc6o2IWeu9zxPQyPiT3+/xc
 h1eQmTmUADyDR0dF+fULi7AeeXpqUSCxBO8lK/QAXPRHgt9Zaxy9Tes
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA0NSBTYWx0ZWRfXyqNh6PZvRCXK
 lumBfGMgtvDrgpxEJ2FZjetGz0iRYmcJv7nHlwqlXQXxDoW7yK/MvPK+tmxa54wZWKnWuq32Wag
 J2oCvtjBldpcxBJ6QCQ7BVV6htQSOFvxEHE5lZz2YjQTJWGm+5Z3l0i+E5nZeNU/KgUOtT1/tEC
 0Y8yDJ2oXSNyui61alMpkLgnlAxSdJIHT3lG/+pDFC/1LEdPZCnmte1tMI1bdeThA0wB8v72VNb
 bp09BZyzEhETnyqJPtSFpnHDqivc69zG3qWMVNN53nuBOrnnh3BybHfVtJNQLyCRr4zIheBrCDT
 My0ApdaMWwBhhWUH4jsehr0V3WP3HpuwbfiqJ3fbGEHTbM250PwaaAcfxyPaMXaBqYm5Lxr0Nid
 Xsfpv3VgPlbCzalcLIsHFo8LUMNFy3kaC6+ecfdB4Cqdm+Xa91gaqffBM4mTV33Uat4EsoqN/Jc
 BNmKsaKtntY4L41VMkw==
X-Proofpoint-ORIG-GUID: CEv5pv8TEl7VO3sL-kkfMDF8k7Zq5Kg1
X-Authority-Analysis: v=2.4 cv=Iowutr/g c=1 sm=1 tr=0 ts=69ddc9fa cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Liwi-oTqB0IuMEU3Zn0A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: CEv5pv8TEl7VO3sL-kkfMDF8k7Zq5Kg1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140045
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58694-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DAF603F597C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

Add a dedicated iris VPU bus type and register it into the iommu_buses
list. Iris devices require their own bus so that each device can run its
own dma_configure() logic.

Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/iommu/iommu.c                           |  4 ++++
 drivers/media/platform/qcom/iris/Makefile       |  4 ++++
 drivers/media/platform/qcom/iris/iris_vpu_bus.c | 32 +++++++++++++++++++++++++
 include/linux/iris_vpu_bus.h                    | 13 ++++++++++
 4 files changed, 53 insertions(+)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 61c12ba78206..d8ed6ef70ecd 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -13,6 +13,7 @@
 #include <linux/bug.h>
 #include <linux/types.h>
 #include <linux/init.h>
+#include <linux/iris_vpu_bus.h>
 #include <linux/export.h>
 #include <linux/slab.h>
 #include <linux/errno.h>
@@ -179,6 +180,9 @@ static const struct bus_type * const iommu_buses[] = {
 #ifdef CONFIG_CDX_BUS
 	&cdx_bus_type,
 #endif
+#if IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS)
+	&iris_vpu_bus_type,
+#endif
 };
 
 /*
diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 2abbd3aeb4af..6f4052b98491 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -31,3 +31,7 @@ qcom-iris-objs += iris_platform_gen1.o
 endif
 
 obj-$(CONFIG_VIDEO_QCOM_IRIS) += qcom-iris.o
+
+ifdef CONFIG_VIDEO_QCOM_IRIS
+obj-y += iris_vpu_bus.o
+endif
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_bus.c b/drivers/media/platform/qcom/iris/iris_vpu_bus.c
new file mode 100644
index 000000000000..b51bb4b82b0e
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_vpu_bus.c
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/device.h>
+#include <linux/of_device.h>
+
+#include "iris_platform_common.h"
+
+static int iris_vpu_bus_dma_configure(struct device *dev)
+{
+	const u32 *f_id = dev_get_drvdata(dev);
+
+	if (!f_id)
+		return -ENODEV;
+
+	return of_dma_configure_id(dev, dev->parent->of_node, true, f_id);
+}
+
+const struct bus_type iris_vpu_bus_type = {
+	.name = "iris-vpu-bus",
+	.dma_configure = iris_vpu_bus_dma_configure,
+};
+EXPORT_SYMBOL_GPL(iris_vpu_bus_type);
+
+static int __init iris_vpu_bus_init(void)
+{
+	return bus_register(&iris_vpu_bus_type);
+}
+
+postcore_initcall(iris_vpu_bus_init);
diff --git a/include/linux/iris_vpu_bus.h b/include/linux/iris_vpu_bus.h
new file mode 100644
index 000000000000..5704b226f7d6
--- /dev/null
+++ b/include/linux/iris_vpu_bus.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef __IRIS_VPU_BUS_H__
+#define __IRIS_VPU_BUS_H__
+
+#if IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS)
+extern const struct bus_type iris_vpu_bus_type;
+#endif
+
+#endif /* __IRIS_VPU_BUS_H__ */

-- 
2.34.1


