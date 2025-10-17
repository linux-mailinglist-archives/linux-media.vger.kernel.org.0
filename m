Return-Path: <linux-media+bounces-44788-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5656BBE65D5
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 07:07:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A7089188C153
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 05:07:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B445130F7E4;
	Fri, 17 Oct 2025 05:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UkzfYaF0"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A30630F53A
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 05:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760677586; cv=none; b=YnSn4owlJ6FlhCHU+zlaPaN7Ue9YFETOierd3tAhelvCqBiDgJC11hoAxXCQ7YadDYFk+j56Y/m8c2SrMu/yBhuNRhvkf9z5H6xZHMouTMy4iNEenxIzN1V15hNOffFv+xJVASVhCYNhcEzsPruBeKyIMPJXyJrwuB2yho3aJ5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760677586; c=relaxed/simple;
	bh=BbxqArpZujgief7ydqM3Itr2/h7C8RDvqE3q8AqcUrU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fv9Flx6UQjlbg/6nrTnjEvMAgSnSEHwsFFpQLKqjWTVoxAIDzs+6eU/5EpPNOqjb35uMSdNkgLAEhf6Yd2i2UNiN2Ki0TobvJL5ZSu+Y4SvfAGqZRTt00hw2+i8kDtxGigOjlW6VLLIabPXthvStLbB3+EK+06+s4SBp6d4DRVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UkzfYaF0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GKLNa4008868
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 05:06:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J/v4quuUw+RjaUbXDOUK+PnQy+lYXBpTQGM+trB+qdg=; b=UkzfYaF0oKxMNmZf
	LoRPRRf+OFWN2Z8+/ig/GRbRav2dTCjHKzUJOi37bM2MMcI9PhrZDfKQo486701R
	oSn82Fwhy+GMqcp4vzOwztCgudZW1X3SfgtkMct46NoanTT1w5ipWk+Dcz4viN5r
	ol9/5377bVbHjXhQFKkfvOcfnklUiF7eZKjfioIGZlLJZ2u82T8XF1oA24AYJZzW
	QQojDL1Zx32NhW6rXIOL9stNw6Xnffyujijkq1Vfqz1WXt+NQx6M9UKT7AwbdLL+
	O9EA3AJZu4f/oCwL0CeBIiE0fAQE1eiZOBxUNYlEUxz9sDKKBlx879UpH9ZDsBHn
	qxazng==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rw1aq53x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 05:06:23 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-87c14264340so26223006d6.2
        for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 22:06:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760677582; x=1761282382;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J/v4quuUw+RjaUbXDOUK+PnQy+lYXBpTQGM+trB+qdg=;
        b=SzVuRTCbKS2mCBzMf47pReRTviRidy6fhANVO/+4qoKBwVwxsZM2ZtOuLot/YL7KKH
         UwvIT+5o4ZmhTOobV2+P8FE3xkwjeOkEh2K2J/mmPhTB/Q2EviptEa0cclsjTQzghF79
         R4BIQTvKIadFs89UquBrXVeF0ANLnn6XnkUJt4WO9FuXPZ0Yf4c37Ifve5N104UqQ2Vq
         vJ8xpDaHGqSunQam9PPJf0Q+FEaq9zpfDXX985As7BJXtjgUEc3Wntnvyep+ZfhpMFOo
         fx73V/oGIW+cW9njzAEghUm7IyUjZcNKsFJsrQ6/8z7xa/mDrERnNlRFOG3I3Of3bQP8
         wNVA==
X-Forwarded-Encrypted: i=1; AJvYcCVjD07S5FyqAA+ul9CJ3eKwHUrJIyNPIhkseIYgu7sQ9GjKS6ZqR3JgUtIr2PHhuK5k/w+iMHA3uVOwKw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpGEY9fVvqm8BKTSQ0yftc0V3wWjNfiILwkGf7b1TE22IE0zc3
	Pg3SR5EGsEc/MCDi6vvIbUZ5hiKmeq0AhBvoi6MVC2X9Kv/a8XZJrB2aCqlPQ3LYuoPn5E4mc5v
	b3znNT3p0HfpZ7EnV+xVEY6D6sFtrw4SX0f4tioIO+U5yllP1Ic9U4mQidaOK5r6igQ==
X-Gm-Gg: ASbGnctYK++w0YBdVepsiVDv999ygBNa3CpUcsAv0vWQWgf2XyDoXsr9pXpLSSzmuWb
	sSrkox6SL8J+jx7mKClISuabJzmWfYs3Ss8T/fIfO9YOolSdl06w6vso9jTx0lXTmOo6BAQB7MK
	FyFq35hijlsI3Cm4YX9YDB3zLckiprdns0bFmXbYWBcZ77GlQ0n6ID2VAAFX/DhJA7DsVFW5LJe
	tm/qpODrp1pKtLVQwYcmknYi0Y3TmHMz2IfNdls8I1sn9z9dJDsyZXbsI8FVQuKdrHNmQm1/wj0
	0L84QIRoWnqjtzLsJZSUqikkYW+nKSaM1I/t76NuVssFffSPLKgojt8d+aTotULRqdwnBRHJDJU
	TfzsdIBcuB7Mi6eFZR5NFewZcDE4BYe5/T2qBI/rwg2P2czhhLnLskK8azi1qh0nSRg==
X-Received: by 2002:a05:6214:43c4:b0:87c:20f5:84e2 with SMTP id 6a1803df08f44-87c20f5873cmr44080106d6.25.1760677582121;
        Thu, 16 Oct 2025 22:06:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELAxtIRSGqAXjFQy6MLCXx7B0d3VbWr1P43dLXizUbawOPzNA9SL/c/9A4nSOwErpS2MY2Fw==
X-Received: by 2002:a05:6214:43c4:b0:87c:20f5:84e2 with SMTP id 6a1803df08f44-87c20f5873cmr44079796d6.25.1760677581662;
        Thu, 16 Oct 2025 22:06:21 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87c0128c9d8sm57641916d6.33.2025.10.16.22.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 22:06:21 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 17 Oct 2025 13:06:03 +0800
Subject: [PATCH v5 3/3] media: qcom: camss: tpg: Add TPG support for LeMans
 and Monaco
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-camss_tpg-v5-3-cafe3ad42163@oss.qualcomm.com>
References: <20251017-camss_tpg-v5-0-cafe3ad42163@oss.qualcomm.com>
In-Reply-To: <20251017-camss_tpg-v5-0-cafe3ad42163@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760677563; l=13291;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=BbxqArpZujgief7ydqM3Itr2/h7C8RDvqE3q8AqcUrU=;
 b=yMccrbq6PzHNcW6Lh4WshmaLlphd82ewzRpsPgwQ5b1d0Z+rB5t19VffkbrY7zogfn+l8qnHO
 lg/ThrnPOXeCNNaBFJQriwLtiewBWjAfUzDbiRT6FcHguAw/fPnGQoK
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=K88v3iWI c=1 sm=1 tr=0 ts=68f1cecf cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=PpfPPmXnh0snnf3BrX0A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: gAbUoO0rdQVA6xkHlTpxJLUsfprCMk6_
X-Proofpoint-ORIG-GUID: gAbUoO0rdQVA6xkHlTpxJLUsfprCMk6_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAzNSBTYWx0ZWRfX0xqANofqv4By
 9AG5cAGK49B3brgmFPT9NKkpj14qhDArROpnoj7Q8RrhTKsiFefAXQ7mAqxO0epYn8zZ52HxzuV
 16N8BnWuhOGOx5Tmol+5BRTyZXiZanRg7VIQpW4LBIuVcWbq5p+TRpS79TxBB3sgRIIvUmEkLaS
 cKzpPM7pU5fndRG2fG6w8RSj9zykdfT1GVt+ERCZ4Piog2Kgtup7E7w7uUqCDTvdBhtKxf/p8Rx
 gokhkDvlCQJgWD4zR2YVhVHyQ7l4SyW4tl6g0QlQQW5nQxUlJQ5GV4cPNd+4Zk81UtGEZTit3xs
 wbi56obs0nH7PtDJDMvYvesTp8gEwq+YaAeYHMZn5HVW6kx8PfpjXcetxY6bbda8GRcjBA+/oxr
 UTpxqvecE7lHayzh4QdzVz4gZTtMbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130035

Add support for TPG found on LeMans and Monaco.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/Makefile         |   1 +
 .../media/platform/qcom/camss/camss-csid-gen3.c    |  17 ++
 drivers/media/platform/qcom/camss/camss-tpg-gen1.c | 220 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.c          |  67 +++++++
 4 files changed, 305 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index 0eda4b18ad0e93f5e63135fabd5a02ae67bcd5ad..28bc3d9ba16dfa34a8fd35973beed0c3f2b67e00 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -27,5 +27,6 @@ qcom-camss-objs += \
 		camss-video.o \
 		camss-format.o \
 		camss-tpg.o \
+		camss-tpg-gen1.o \
 
 obj-$(CONFIG_VIDEO_QCOM_CAMSS) += qcom-camss.o
diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
index 664245cf6eb0cac662b02f8b920cd1c72db0aeb2..8e0b0cbaa0010f4b4a156877ac2fe805e5c4422e 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
@@ -66,6 +66,8 @@
 #define		CSI2_RX_CFG0_VC_MODE		3
 #define		CSI2_RX_CFG0_DL0_INPUT_SEL	4
 #define		CSI2_RX_CFG0_PHY_NUM_SEL	20
+#define		CSI2_RX_CFG0_TPG_NUM_EN		27
+#define		CSI2_RX_CFG0_TPG_NUM_SEL	28
 
 #define CSID_CSI2_RX_CFG1		0x204
 #define		CSI2_RX_CFG1_ECC_CORRECTION_EN	BIT(0)
@@ -109,11 +111,26 @@ static void __csid_configure_rx(struct csid_device *csid,
 				struct csid_phy_config *phy, int vc)
 {
 	int val;
+	struct camss *camss;
+	struct tpg_device *tpg;
 
+	camss = csid->camss;
 	val = (phy->lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
 	val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
 	val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX) << CSI2_RX_CFG0_PHY_NUM_SEL;
 
+	if (camss->tpg) {
+		tpg = &camss->tpg[phy->csiphy_id];
+
+		if (tpg->testgen.mode > 0) {
+			val |= (phy->csiphy_id + 1) << CSI2_RX_CFG0_TPG_NUM_SEL;
+			val |= 1 << CSI2_RX_CFG0_TPG_NUM_EN;
+		} else {
+			val |= 0 << CSI2_RX_CFG0_TPG_NUM_SEL;
+			val |= 0 << CSI2_RX_CFG0_TPG_NUM_EN;
+		}
+	}
+
 	writel(val, csid->base + CSID_CSI2_RX_CFG0);
 
 	val = CSI2_RX_CFG1_ECC_CORRECTION_EN;
diff --git a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
new file mode 100644
index 0000000000000000000000000000000000000000..ba463c16a8436cb40c61d1b483c6343c010b9744
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
@@ -0,0 +1,220 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *
+ * Qualcomm MSM Camera Subsystem - TPG (Test Patter Generator) Module
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+#include <linux/bitfield.h>
+#include <linux/completion.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/of.h>
+
+#include "camss-tpg.h"
+#include "camss.h"
+
+#define TPG_HW_VERSION		0x0
+# define HW_VERSION_STEPPING		GENMASK(15, 0)
+# define HW_VERSION_REVISION		GENMASK(27, 16)
+# define HW_VERSION_GENERATION		GENMASK(31, 28)
+
+#define TPG_HW_STATUS		0x4
+
+#define TPG_VC_n_GAIN_CFG(n)		(0x60 + (n) * 0x60)
+
+#define TPG_CTRL		0x64
+# define TPG_CTRL_TEST_EN		BIT(0)
+# define TPG_CTRL_PHY_SEL		BIT(3)
+# define TPG_CTRL_NUM_ACTIVE_LANES	GENMASK(5, 4)
+# define TPG_CTRL_VC_DT_PATTERN_ID	GENMASK(8, 6)
+# define TPG_CTRL_OVERLAP_SHDR_EN	BIT(10)
+# define TPG_CTRL_NUM_ACTIVE_VC		GENMASK(31, 30)
+#  define NUM_ACTIVE_VC_0_ENABLED		0
+#  define NUM_ACTIVE_VC_0_1_ENABLED		1
+#  define NUM_ACTIVE_VC_0_1_2_ENABLED		2
+#  define NUM_ACTIVE_VC_0_1_3_ENABLED		3
+
+#define TPG_VC_n_CFG0(n)	(0x68 + (n) * 0x60)
+# define TPG_VC_n_CFG0_VC_NUM			GENMASK(4, 0)
+# define TPG_VC_n_CFG0_NUM_ACTIVE_DT		GENMASK(9, 8)
+#  define NUM_ACTIVE_SLOTS_0_ENABLED			0
+#  define NUM_ACTIVE_SLOTS_0_1_ENABLED			1
+#  define NUM_ACTIVE_SLOTS_0_1_2_ENABLED		2
+#  define NUM_ACTIVE_SLOTS_0_1_3_ENABLED		3
+# define TPG_VC_n_CFG0_NUM_BATCH		GENMASK(15, 12)
+# define TPG_VC_n_CFG0_NUM_FRAMES		GENMASK(31, 16)
+
+#define TPG_VC_n_LSFR_SEED(n)	(0x6C + (n) * 0x60)
+
+#define TPG_VC_n_HBI_CFG(n)	(0x70 + (n) * 0x60)
+
+#define TPG_VC_n_VBI_CFG(n)	(0x74 + (n) * 0x60)
+
+#define TPG_VC_n_COLOR_BARS_CFG(n)		(0x78 + (n) * 0x60)
+# define TPG_VC_n_COLOR_BARS_CFG_PIX_PATTERN		GENMASK(2, 0)
+# define TPG_VC_n_COLOR_BARS_CFG_QCFA_EN		BIT(3)
+# define TPG_VC_n_COLOR_BARS_CFG_SPLIT_EN		BIT(4)
+# define TPG_VC_n_COLOR_BARS_CFG_NOISE_EN		BIT(5)
+# define TPG_VC_n_COLOR_BARS_CFG_ROTATE_PERIOD		GENMASK(13, 8)
+# define TPG_VC_n_COLOR_BARS_CFG_XCFA_EN		BIT(16)
+# define TPG_VC_n_COLOR_BARS_CFG_SIZE_X			GENMASK(26, 24)
+# define TPG_VC_n_COLOR_BARS_CFG_SIZE_Y			GENMASK(30, 28)
+
+#define TPG_VC_m_DT_n_CFG_0(m, n)		(0x7C + (m) * 0x60 + (n) * 0xC)
+# define TPG_VC_m_DT_n_CFG_0_FRAME_HEIGHT	GENMASK(15, 0)
+# define TPG_VC_m_DT_n_CFG_0_FRAME_WIDTH	GENMASK(31, 16)
+
+#define TPG_VC_m_DT_n_CFG_1(m, n)		(0x80 + (m) * 0x60 + (n) * 0xC)
+# define TPG_VC_m_DT_n_CFG_1_DATA_TYPE		GENMASK(5, 0)
+# define TPG_VC_m_DT_n_CFG_1_ECC_XOR_MASK	GENMASK(13, 8)
+# define TPG_VC_m_DT_n_CFG_1_CRC_XOR_MASK	GENMASK(31, 16)
+
+#define TPG_VC_m_DT_n_CFG_2(m, n)		(0x84 + (m) * 0x60 + (n) * 0xC)
+# define TPG_VC_m_DT_n_CFG_2_PAYLOAD_MODE		GENMASK(3, 0)
+# define TPG_VC_m_DT_n_CFG_2_USER_SPECIFIED_PAYLOAD	GENMASK(27, 4)
+# define TPG_VC_m_DT_n_CFG_2_ENCODE_FORMAT		GENMASK(31, 28)
+
+#define TPG_VC_n_COLOR_BAR_CFA_COLOR0(n)	(0xB0 + (n) * 0x60)
+#define TPG_VC_n_COLOR_BAR_CFA_COLOR1(n)	(0xB4 + (n) * 0x60)
+#define TPG_VC_n_COLOR_BAR_CFA_COLOR2(n)	(0xB8 + (n) * 0x60)
+#define TPG_VC_n_COLOR_BAR_CFA_COLOR3(n)	(0xBC + (n) * 0x60)
+
+/* Line offset between VC(n) and VC(n-1), n form 1 to 3 */
+#define TPG_VC_n_SHDR_CFG	(0x84 + (n) * 0x60)
+
+#define TPG_CLEAR		0x1F4
+
+#define TPG_USER_SPECIFIED_PAYLOAD_DEFAULT	0xBE
+#define TPG_HBI_CFG_DEFAULT			0x4701
+#define TPG_VBI_CFG_DEFAULT			0x438
+#define TPG_LFSR_SEED_DEFAULT			0x12345678
+#define TPG_COLOR_BARS_CFG_STANDARD \
+	FIELD_PREP(TPG_VC_n_COLOR_BARS_CFG_ROTATE_PERIOD, 0xA)
+
+static int tpg_stream_on(struct tpg_device *tpg)
+{
+	struct tpg_testgen_config *tg = &tpg->testgen;
+	struct v4l2_mbus_framefmt *input_format;
+	const struct tpg_format_info *format;
+	u8 lane_cnt = tpg->res->lane_cnt;
+	u8 dt_cnt = 0;
+	u8 i;
+	u32 val;
+
+	/* Loop through all enabled VCs and configure stream for each */
+	for (i = 0; i < tpg->res->vc_cnt; i++) {
+		input_format = &tpg->fmt[MSM_TPG_PAD_SRC + i];
+		format = tpg_get_fmt_entry(tpg,
+					   tpg->res->formats->formats,
+					   tpg->res->formats->nformats,
+					   input_format->code);
+
+		val = FIELD_PREP(TPG_VC_m_DT_n_CFG_0_FRAME_HEIGHT, input_format->height & 0xffff) |
+		      FIELD_PREP(TPG_VC_m_DT_n_CFG_0_FRAME_WIDTH, input_format->width & 0xffff);
+		writel(val, tpg->base + TPG_VC_m_DT_n_CFG_0(i, dt_cnt));
+
+		val = FIELD_PREP(TPG_VC_m_DT_n_CFG_1_DATA_TYPE, format->data_type);
+		writel(val, tpg->base + TPG_VC_m_DT_n_CFG_1(i, dt_cnt));
+
+		val = FIELD_PREP(TPG_VC_m_DT_n_CFG_2_PAYLOAD_MODE, tg->mode - 1) |
+		      FIELD_PREP(TPG_VC_m_DT_n_CFG_2_USER_SPECIFIED_PAYLOAD,
+				 TPG_USER_SPECIFIED_PAYLOAD_DEFAULT) |
+		      FIELD_PREP(TPG_VC_m_DT_n_CFG_2_ENCODE_FORMAT, format->encode_format);
+		writel(val, tpg->base + TPG_VC_m_DT_n_CFG_2(i, dt_cnt));
+
+		writel(TPG_COLOR_BARS_CFG_STANDARD, tpg->base + TPG_VC_n_COLOR_BARS_CFG(i));
+
+		writel(TPG_HBI_CFG_DEFAULT, tpg->base + TPG_VC_n_HBI_CFG(i));
+		writel(TPG_VBI_CFG_DEFAULT, tpg->base + TPG_VC_n_VBI_CFG(i));
+
+		writel(TPG_LFSR_SEED_DEFAULT, tpg->base + TPG_VC_n_LSFR_SEED(i));
+
+		/* configure one DT, infinite frames */
+		val = FIELD_PREP(TPG_VC_n_CFG0_VC_NUM, i) |
+		      FIELD_PREP(TPG_VC_n_CFG0_NUM_FRAMES, 0);
+		writel(val, tpg->base + TPG_VC_n_CFG0(i));
+	}
+
+	val = FIELD_PREP(TPG_CTRL_TEST_EN, 1) |
+		  FIELD_PREP(TPG_CTRL_PHY_SEL, 0) |
+		  FIELD_PREP(TPG_CTRL_NUM_ACTIVE_LANES, lane_cnt - 1) |
+		  FIELD_PREP(TPG_CTRL_VC_DT_PATTERN_ID, 0) |
+		  FIELD_PREP(TPG_CTRL_NUM_ACTIVE_VC, tpg->res->vc_cnt - 1);
+	writel(val, tpg->base + TPG_CTRL);
+
+	return 0;
+}
+
+static void tpg_stream_off(struct tpg_device *tpg)
+{
+	writel(0, tpg->base + TPG_CTRL);
+	writel(1, tpg->base + TPG_CLEAR);
+}
+
+static void tpg_configure_stream(struct tpg_device *tpg, u8 enable)
+{
+	if (enable)
+		tpg_stream_on(tpg);
+	else
+		tpg_stream_off(tpg);
+}
+
+static int tpg_configure_testgen_pattern(struct tpg_device *tpg, s32 val)
+{
+	if (val > 0 && val <= TPG_PAYLOAD_MODE_COLOR_BARS)
+		tpg->testgen.mode = val;
+
+	return 0;
+}
+
+/*
+ * tpg_hw_version - tpg hardware version query
+ * @tpg: tpg device
+ *
+ * Return HW version or error
+ */
+static u32 tpg_hw_version(struct tpg_device *tpg)
+{
+	u32 hw_version;
+	u32 hw_gen;
+	u32 hw_rev;
+	u32 hw_step;
+
+	hw_version = readl(tpg->base + TPG_HW_VERSION);
+	hw_gen = FIELD_GET(HW_VERSION_GENERATION, hw_version);
+	hw_rev = FIELD_GET(HW_VERSION_REVISION, hw_version);
+	hw_step = FIELD_GET(HW_VERSION_STEPPING, hw_version);
+	dev_dbg_once(tpg->camss->dev, "tpg HW Version = %u.%u.%u\n",
+		     hw_gen, hw_rev, hw_step);
+
+	return hw_version;
+}
+
+/*
+ * tpg_reset - Trigger reset on tpg module and wait to complete
+ * @tpg: tpg device
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int tpg_reset(struct tpg_device *tpg)
+{
+	writel(0, tpg->base + TPG_CTRL);
+	writel(1, tpg->base + TPG_CLEAR);
+
+	return 0;
+}
+
+static void tpg_subdev_init(struct tpg_device *tpg)
+{
+	tpg->testgen.modes = testgen_payload_modes;
+	tpg->testgen.nmodes = TPG_PAYLOAD_MODE_NUM_SUPPORTED_GEN1;
+}
+
+const struct tpg_hw_ops tpg_ops_gen1 = {
+	.configure_stream = tpg_configure_stream,
+	.configure_testgen_pattern = tpg_configure_testgen_pattern,
+	.hw_version = tpg_hw_version,
+	.reset = tpg_reset,
+	.subdev_init = tpg_subdev_init,
+};
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 2ede19e1347ae32f2f6919905b535352bcd134be..446d3fb94f35412178b72c803274a5159c57c852 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2745,6 +2745,62 @@ static const struct camss_subdev_resources csiphy_res_8775p[] = {
 	},
 };
 
+static const struct camss_subdev_resources tpg_res_8775p[] = {
+	/* TPG0 */
+	{
+		.regulators = {  },
+		.clock = { "csiphy_rx", "camnoc_axi" },
+		.clock_rate = {
+			{ 400000000 },
+			{ 400000000 },
+		},
+		.reg = { "tpg0" },
+		.interrupt = { "tpg0" },
+		.tpg = {
+			.lane_cnt = 4,
+			.vc_cnt = 1,
+			.formats = &tpg_formats_gen1,
+			.hw_ops = &tpg_ops_gen1
+		}
+	},
+
+	/* TPG1 */
+	{
+		.regulators = {  },
+		.clock = { "csiphy_rx", "camnoc_axi" },
+		.clock_rate = {
+			{ 400000000 },
+			{ 400000000 },
+		},
+		.reg = { "tpg1" },
+		.interrupt = { "tpg1" },
+		.tpg = {
+			.lane_cnt = 4,
+			.vc_cnt = 1,
+			.formats = &tpg_formats_gen1,
+			.hw_ops = &tpg_ops_gen1
+		}
+	},
+
+	/* TPG2 */
+	{
+		.regulators = {  },
+		.clock = { "csiphy_rx", "camnoc_axi" },
+		.clock_rate = {
+			{ 400000000 },
+			{ 400000000 },
+		},
+		.reg = { "tpg2" },
+		.interrupt = { "tpg2" },
+		.tpg = {
+			.lane_cnt = 4,
+			.vc_cnt = 1,
+			.formats = &tpg_formats_gen1,
+			.hw_ops = &tpg_ops_gen1
+		}
+	},
+};
+
 static const struct camss_subdev_resources csid_res_8775p[] = {
 	/* CSID0 */
 	{
@@ -4217,6 +4273,13 @@ static int camss_probe(struct platform_device *pdev)
 	if (!camss->csiphy)
 		return -ENOMEM;
 
+	if (camss->res->tpg_num > 0) {
+		camss->tpg = devm_kcalloc(dev, camss->res->tpg_num,
+					  sizeof(*camss->tpg), GFP_KERNEL);
+		if (!camss->tpg)
+			return -ENOMEM;
+	}
+
 	camss->csid = devm_kcalloc(dev, camss->res->csid_num, sizeof(*camss->csid),
 				   GFP_KERNEL);
 	if (!camss->csid)
@@ -4394,11 +4457,13 @@ static const struct camss_resources qcs8300_resources = {
 	.version = CAMSS_8300,
 	.pd_name = "top",
 	.csiphy_res = csiphy_res_8300,
+	.tpg_res = tpg_res_8775p,
 	.csid_res = csid_res_8775p,
 	.csid_wrapper_res = &csid_wrapper_res_sm8550,
 	.vfe_res = vfe_res_8775p,
 	.icc_res = icc_res_qcs8300,
 	.csiphy_num = ARRAY_SIZE(csiphy_res_8300),
+	.tpg_num = ARRAY_SIZE(tpg_res_8775p),
 	.csid_num = ARRAY_SIZE(csid_res_8775p),
 	.vfe_num = ARRAY_SIZE(vfe_res_8775p),
 	.icc_path_num = ARRAY_SIZE(icc_res_qcs8300),
@@ -4408,11 +4473,13 @@ static const struct camss_resources sa8775p_resources = {
 	.version = CAMSS_8775P,
 	.pd_name = "top",
 	.csiphy_res = csiphy_res_8775p,
+	.tpg_res = tpg_res_8775p,
 	.csid_res = csid_res_8775p,
 	.csid_wrapper_res = &csid_wrapper_res_sm8550,
 	.vfe_res = vfe_res_8775p,
 	.icc_res = icc_res_sa8775p,
 	.csiphy_num = ARRAY_SIZE(csiphy_res_8775p),
+	.tpg_num = ARRAY_SIZE(tpg_res_8775p),
 	.csid_num = ARRAY_SIZE(csid_res_8775p),
 	.vfe_num = ARRAY_SIZE(vfe_res_8775p),
 	.icc_path_num = ARRAY_SIZE(icc_res_sa8775p),

-- 
2.34.1


