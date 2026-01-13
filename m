Return-Path: <linux-media+bounces-50541-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F2292D180EB
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 11:33:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3F81E308E93C
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 10:29:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72A2338E5C6;
	Tue, 13 Jan 2026 10:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YGjlh2sb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PgnN3dps"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27B438BDD7
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 10:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768300120; cv=none; b=O8N+9WAR463mjh00t8MzNmaFdb+9mUaZyPMm8PkQporaLEKy4c0Th4htcrk80ZPb5BKutZdDGIPFx6tOuo042VH9/EmK282bau7Ip0tmmINjCt+h2jya0Xaqyu/tUvGE7DuKXYIiGsZyl/dLhsq9SxCO8D7e+BWhTbtn+QbB7XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768300120; c=relaxed/simple;
	bh=tLjqfdJ2PLGVcIn3OelP6kMzjCOZYcPVvGpP83m+mHE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tDoeRkvZgwcL7jLalkD3WQATGV7/8rImeYffUrc3QotgIctwjPgYQhSeGr79T5h9M8gBdCtLerTxy3UpMo/PGwoogU2ANaqcW4fSdzG87sbBFgSWX1EslLxiD2gUz8gQCvf7Jctf5gmemg2+BwVBwzm4OD/1l0AN5O0Fwfbp3pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YGjlh2sb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PgnN3dps; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D5SvfK3869220
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 10:28:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RDYDnmjv2ty4CIY9QK0XVJUfkKgguUupulKp5AkLzXA=; b=YGjlh2sbNvk59nHL
	zOA0ZUULf2r8+g726hqxauv3nsShJn4L8l8WwSrpwtHl1EcPHHk5krkWZICkdkXP
	XPJQivmF1g1vy1tYtMZVhRUc8vo3L4xkkjsbN4xr1mS2x5KTdQjEjslPb0r/xPo0
	PCCw6KiD4SZZBEQ2Ya0Mhz3TlOs0OTmG8FJvCiZLiatZWfJnZQ2xyNvneEM7mVQO
	x2giOS8pIPAnVWNTWcM0rTXxEj98munYrAmAHAsN+qX5Y75aR/V8L9t7ude2QOOO
	d0oTJ+7Nm0QdFTzFLIXIpYR2vVrGrrHUyZEHvyyLErZ8u/pyMA9d0W52W5WLHE+r
	laeIng==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnfxk8w3n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 10:28:36 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-12055b90b7bso28355455c88.0
        for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 02:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768300115; x=1768904915; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RDYDnmjv2ty4CIY9QK0XVJUfkKgguUupulKp5AkLzXA=;
        b=PgnN3dpsTHK1VpL6mupf0WtpwSYlcRebu6vA++3tkSyBJVBRFYvTcw9RwS/qzJEOHr
         3a4Ee9990MuhNXxZ8rsxEaktwIqOi5m4oaO6Wz46A1OpK5euT/CIXvZl5jxbZGLk1gZ3
         BlRNCTwzBHxtJumBUpKQCkokqHtryKWYHFbqv9plSOODpk/rB5kxMjHEpNAqOADtQhWQ
         /3ed9OMA+xoHDv5prhJg5+k1vWNFsNAN8hG+OOOyHfX4NX8JZYioJmlfNWlZQ+3VeAHg
         KFm+1oJGgZbqPZyeOG0eDra54mjPdvl4XkGmOZYYGMpVHFdNlRzS2cDCkE6ZGtiu3hs5
         cViw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768300115; x=1768904915;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RDYDnmjv2ty4CIY9QK0XVJUfkKgguUupulKp5AkLzXA=;
        b=hSsUbd5uX1hvu4ayMHTIPKc7NqnJzyXXb4/jkFMb3rBkMUG8F8qUyaCnixfkNQi2DN
         x6OISxpiR0fwFs5mZTXEDMRqObbKtBZ7WF+SYyBtknWYHd0QM6L0Ik1nEOdTPHELO3xk
         B9c4q5qlV1u5dm1mkLovNR05WRJoHL0G3Eo0MrpwgsKKKf8VseuBCzvQ7KXLIoOtSCw0
         J4HrOgmhP385ehjXjqQtvBXcVtezBCe06+zcb3e1DoauLnsfcl4HPzMPuyoN9DaGv2iy
         ytpdLYDAfmnbJTmzUpauYrIYTP+V5H6iwcqrcp21WEEGWxKV57hsgxJnLNUs0xGt73So
         w+4g==
X-Forwarded-Encrypted: i=1; AJvYcCVsgV6ZQ9d6Ep2OhAYvrQh+vMqiP+V7dc/cOerjWvMYwR2/VhfEtPNVMms5QPNlPAxefFUbwCsyu3Vzow==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpnAHm8/GcyxpMJ+j8fxN7Llds2JGX9f9Oa4YLwpkX9wcsCDZR
	bU+xmmk1MVD+JTdxIovJ8GUY76ZtV/fYjQHvDknArTZIYBHJ3GnwxBFKcUI+8o5ivUK81rRBd2w
	BuFYAp+1zAzSRpivmQ2ygKv10xaXphOcYaEwfoKgsr5RFQrg9Cb/iPrfNiw8BdUCyAe5Aey7FHJ
	AG
X-Gm-Gg: AY/fxX5eCHp5f+txTqj4iDsx1DaJD2b698Sz62rurA6ZlkfOui+KQXA9sJaed6xEqDc
	auFpqRDNx58q3tRKAyF+M7KjOXLiPNOeG2PrPQuTiDYw8DP+1w3+hlIGaH3nbPGby2Id6ZetUnc
	/L/SzkB373IrQrJgfrYo6oj8uxXlm8DeTIufkKo7pCFzrSqgYIPuliu195XXl3Bqweg4nFIY34D
	Me37EFVyHLUBMk+78c8/PpYkZelqk9cfKcnbKBFtNRtSdqS7dul568YGv84wmAAVk2Wr5kJY85k
	ErT8mew9Avd0dN6Vigh74S+jGyHlXPWoaRXot1PeuE+/UbGrtCg6JNc4lFk9OQAkqoVDKmECaTV
	5zs1ercrLmnMXzXMP72t6YXW+pprvy3K93CaBIRziNVkebvPX+Bq6bYLHkn6uiilh
X-Received: by 2002:a05:7022:51b:b0:11b:8f02:a876 with SMTP id a92af1059eb24-121f8b40bb1mr18615734c88.23.1768300114859;
        Tue, 13 Jan 2026 02:28:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGkP907j2dTOarSH7VwTHMEOaxbaLAxZnrftzh7Jgf0909KL0Bva8Rm9/d/Cn0MAy8hJ3OHTw==
X-Received: by 2002:a05:7022:51b:b0:11b:8f02:a876 with SMTP id a92af1059eb24-121f8b40bb1mr18615699c88.23.1768300114178;
        Tue, 13 Jan 2026 02:28:34 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f23b798asm21162429c88.0.2026.01.13.02.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 02:28:33 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 02:28:30 -0800
Subject: [PATCH v2 4/5] media: qcom: camss: csid: Add support for CSID 980
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-sm8750-camss-v2-4-e5487b98eada@oss.qualcomm.com>
References: <20260113-sm8750-camss-v2-0-e5487b98eada@oss.qualcomm.com>
In-Reply-To: <20260113-sm8750-camss-v2-0-e5487b98eada@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: GAUdJMdJwtrtIn8gl4ogWG1NCYtGbgBJ
X-Proofpoint-GUID: GAUdJMdJwtrtIn8gl4ogWG1NCYtGbgBJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA4OCBTYWx0ZWRfXxPJmQHDaBK6E
 FFVTBB2fqo8xKyjVHhLXKPdEadwWqZXdQkzm/Zwx74tDCCJzvr8uugfqjsOehNgsoX3KqZu//oR
 IuFuak/Fdl9vFf5tzAgMHwFvm7UZzzNORiK907lY/rDJ4+iaTH9RGfgnq7CTcLxpciPbI1EEKrv
 3GGdUaHJwimW8LJX3AiuG/fNewLxUvzq4lf30hvT4+dOSPVh3fv485CLk0opX8Mlv9uEWR8s7c4
 8HScFNsyk37or7iUDqZXMOIF7yk0Qmbxv79wlL1lNt2rcXA3PnB8YOWyc428RRPEHJ68S4uawNz
 B7+FlwTgdinSY2jUXvkZkWbW3hilMH/5ZUVuC9kXHHK74EZg0h8SUNNrkaWu88gN2YD9byyZNEE
 K4qdLYlQIFLdF7wlmY3Wzmhs9ceT9RHvh6jN0IpDZnh6FN+DYQql9WfoSYDIgaxaTEmY9GbIqb2
 327r/aq/iy1iMWXAXdA==
X-Authority-Analysis: v=2.4 cv=PvSergM3 c=1 sm=1 tr=0 ts=69661e54 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=63CfXtnvIBONjkcrFHoA:9
 a=Z-sH2BZsVlbqz-yA:21 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130088

Add more detailed resource information for CSID devices along with the
driver for CSID 980 that is responsible for CSID register
configuration, module reset and IRQ handling for BUF_DONE events.

In SM8750, RUP and AUP updates for the CSID Full modules are split into
two registers along with a SET register. However, CSID Lite modules
still use a single register to update RUP and AUP without the additional
SET register. Handled such differences in the driver.

Co-developed-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
Signed-off-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/Makefile         |   1 +
 drivers/media/platform/qcom/camss/camss-csid-980.c | 442 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-csid.h     |   1 +
 drivers/media/platform/qcom/camss/camss.c          |  75 ++++
 4 files changed, 519 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index ed8001ef90a6..45fd7fee59ba 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -8,6 +8,7 @@ qcom-camss-objs += \
 		camss-csid-4-7.o \
 		camss-csid-340.o \
 		camss-csid-680.o \
+		camss-csid-980.o \
 		camss-csid-gen2.o \
 		camss-csid-gen3.o \
 		camss-csid-gen4.o \
diff --git a/drivers/media/platform/qcom/camss/camss-csid-980.c b/drivers/media/platform/qcom/camss/camss-csid-980.c
new file mode 100644
index 000000000000..87d26a18081d
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-csid-980.c
@@ -0,0 +1,442 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * camss-csid-980.c
+ *
+ * Qualcomm MSM Camera Subsystem - CSID (CSI Decoder) Module
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+#include <linux/completion.h>
+#include <linux/delay.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/of.h>
+#include "camss.h"
+#include "camss-csid.h"
+#include "camss-csid-gen3.h"
+
+/* Reset and Command Registers */
+#define CSID_RST_CFG				0xC
+#define		RST_MODE				BIT(0)
+#define		RST_LOCATION				BIT(4)
+
+/* Reset and Command Registers */
+#define CSID_RST_CMD				0x10
+#define		SELECT_HW_RST				BIT(0)
+#define		SELECT_IRQ_RST				BIT(2)
+#define CSID_IRQ_CMD				0x14
+#define		IRQ_CMD_CLEAR				BIT(0)
+
+/* Register Update Commands, RUP/AUP */
+#define CSID_RUP_CMD				0x18
+#define CSID_AUP_CMD				0x1C
+#define		CSID_RUP_AUP_RDI(rdi)			(BIT(8) << (rdi))
+#define CSID_RUP_AUP_CMD			0x20
+#define		RUP_SET					BIT(0)
+#define		MUP					BIT(4)
+
+#define CSID_LITE_RUP_AUP_CMD			0x18
+#define		CSID_LITE_RUP_RDI(rdi)		(BIT(4) << (rdi))
+#define		CSID_LITE_AUP_RDI(rdi)		(BIT(20) << (rdi))
+
+/* Top level interrupt registers */
+#define CSID_TOP_IRQ_STATUS			(csid_is_lite(csid) ? 0x7C : 0x84)
+#define CSID_TOP_IRQ_MASK			(csid_is_lite(csid) ? 0x80 : 0x88)
+#define CSID_TOP_IRQ_CLEAR			(csid_is_lite(csid) ? 0x84 : 0x8C)
+#define CSID_TOP_IRQ_SET			(csid_is_lite(csid) ? 0x88 : 0x90)
+#define		INFO_RST_DONE				BIT(0)
+#define		CSI2_RX_IRQ_STATUS			BIT(2)
+#define		BUF_DONE_IRQ_STATUS			BIT(csid_is_lite(csid) ? 13 : 3)
+
+/* Buffer done interrupt registers */
+#define CSID_BUF_DONE_IRQ_STATUS		(csid_is_lite(csid) ? 0x8C : 0xA4)
+#define		BUF_DONE_IRQ_STATUS_RDI_OFFSET		(csid_is_lite(csid) ? 1 : 16)
+#define CSID_BUF_DONE_IRQ_MASK			(csid_is_lite(csid) ? 0x90 : 0xA8)
+#define CSID_BUF_DONE_IRQ_CLEAR			(csid_is_lite(csid) ? 0x94 : 0xAC)
+#define CSID_BUF_DONE_IRQ_SET			(csid_is_lite(csid) ? 0x98 : 0xB0)
+
+/* CSI2 RX interrupt registers */
+#define CSID_CSI2_RX_IRQ_STATUS			(csid_is_lite(csid) ? 0x9C : 0xB4)
+#define CSID_CSI2_RX_IRQ_MASK			(csid_is_lite(csid) ? 0xA0 : 0xB8)
+#define CSID_CSI2_RX_IRQ_CLEAR			(csid_is_lite(csid) ? 0xA4 : 0xBC)
+#define CSID_CSI2_RX_IRQ_SET			(csid_is_lite(csid) ? 0xA8 : 0xC0)
+
+/* CSI2 RX Configuration */
+#define CSID_CSI2_RX_CFG0			(csid_is_lite(csid) ? 0x200 : 0x400)
+#define		CSI2_RX_CFG0_NUM_ACTIVE_LANES		0
+#define		CSI2_RX_CFG0_DL0_INPUT_SEL		4
+#define		CSI2_RX_CFG0_PHY_NUM_SEL		20
+#define CSID_CSI2_RX_CFG1			(csid_is_lite(csid) ? 0x204 : 0x404)
+#define		CSI2_RX_CFG1_ECC_CORRECTION_EN		BIT(0)
+#define		CSI2_RX_CFG1_VC_MODE			BIT(2)
+
+#define MSM_CSID_MAX_SRC_STREAMS_980		(csid_is_lite(csid) ? 4 : 5)
+
+#define CSID_RDI_CFG0(rdi)                                  \
+	({                                                  \
+		__typeof__(rdi) _rdi = (rdi);               \
+		csid_is_lite(csid) ? 0x500 + 0x100 * _rdi : \
+				     0xE00 + 0x200 * _rdi;  \
+	})
+#define		RDI_CFG0_RETIME_BS			BIT(5)
+#define		RDI_CFG0_TIMESTAMP_EN			BIT(6)
+#define		RDI_CFG0_TIMESTAMP_STB_SEL		BIT(8)
+#define		RDI_CFG0_DECODE_FORMAT			12
+#define		RDI_CFG0_DT				16
+#define		RDI_CFG0_VC				22
+#define		RDI_CFG0_DT_ID				27
+#define		RDI_CFG0_EN				BIT(31)
+
+/* RDI Control and Configuration */
+#define CSID_RDI_CTRL(rdi)                                  \
+	({                                                  \
+		__typeof__(rdi) _rdi = (rdi);               \
+		csid_is_lite(csid) ? 0x504 + 0x100 * _rdi : \
+				     0xE04 + 0x200 * _rdi;  \
+	})
+#define		RDI_CTRL_START_CMD			BIT(0)
+
+#define CSID_RDI_CFG1(rdi)                                  \
+	({                                                  \
+		__typeof__(rdi) _rdi = (rdi);               \
+		csid_is_lite(csid) ? 0x510 + 0x100 * _rdi : \
+				     0xE10 + 0x200 * _rdi;  \
+	})
+#define		RDI_CFG1_DROP_H_EN			BIT(5)
+#define		RDI_CFG1_DROP_V_EN			BIT(6)
+#define		RDI_CFG1_CROP_H_EN			BIT(7)
+#define		RDI_CFG1_CROP_V_EN			BIT(8)
+#define		RDI_CFG1_PACKING_FORMAT_MIPI		BIT(15)
+
+/* RDI Pixel Store Configuration */
+#define CSID_RDI_PIX_STORE_CFG0(rdi)		(0xE14 + 0x200 * (rdi))
+#define		RDI_PIX_STORE_CFG0_EN			BIT(0)
+#define		RDI_PIX_STORE_CFG0_MIN_HBI		1
+
+/* RDI IRQ Status in wrapper */
+#define CSID_CSI2_RDIN_IRQ_STATUS(rdi) \
+	(csid_is_lite(csid) ? 0xEC : 0x114 + 0x10 * (rdi))
+#define CSID_CSI2_RDIN_IRQ_CLEAR(rdi) \
+	(csid_is_lite(csid) ? 0xF4 : 0x11C + 0x10 * (rdi))
+#define		INFO_RUP_DONE				BIT(23)
+
+static void __csid_full_aup_rup_trigger(struct csid_device *csid)
+{
+	/* trigger SET in combined register */
+	writel(RUP_SET, csid->base + CSID_RUP_AUP_CMD);
+}
+
+static void __csid_aup_update(struct csid_device *csid, int port_id)
+{
+	if (csid_is_lite(csid)) {
+		/* CSID Lites in v980 follow the legacy way of a combined RUP
+		 * and AUP commands without an explicit SET register.
+		 */
+		csid->reg_update |= CSID_LITE_AUP_RDI(port_id);
+		writel(csid->reg_update, csid->base + CSID_LITE_RUP_AUP_CMD);
+	} else {
+		csid->aup_update |= CSID_RUP_AUP_RDI(port_id);
+		writel(csid->aup_update, csid->base + CSID_AUP_CMD);
+
+		/* CSID Fulls in v980 split AUP and RUP commands, which requires
+		 * additional SET operation to make registers modification take
+		 * effect.
+		 */
+		__csid_full_aup_rup_trigger(csid);
+	}
+}
+
+static void __csid_rup_update(struct csid_device *csid, int port_id)
+{
+	if (csid_is_lite(csid)) {
+		/* CSID Lites in v980 follow the legacy way of a combined RUP
+		 * and AUP commands without an explicit SET register.
+		 */
+		csid->reg_update |= CSID_LITE_RUP_RDI(port_id);
+		writel(csid->reg_update, csid->base + CSID_LITE_RUP_AUP_CMD);
+	} else {
+		csid->rup_update |= CSID_RUP_AUP_RDI(port_id);
+		writel(csid->rup_update, csid->base + CSID_RUP_CMD);
+
+		/* CSID Fulls in v980 split AUP and RUP commands, which requires
+		 * additional SET operation to make registers modification take
+		 * effect.
+		 */
+		__csid_full_aup_rup_trigger(csid);
+	}
+}
+
+static void __csid_aup_rup_clear(struct csid_device *csid, int port_id)
+{
+	/* Hardware clears the registers upon consuming the settings */
+	if (csid_is_lite(csid)) {
+		csid->reg_update &= ~CSID_LITE_RUP_RDI(port_id);
+		csid->reg_update &= ~CSID_LITE_AUP_RDI(port_id);
+	} else {
+		csid->aup_update &= ~CSID_RUP_AUP_RDI(port_id);
+		csid->rup_update &= ~CSID_RUP_AUP_RDI(port_id);
+	}
+}
+
+static void __csid_configure_rx(struct csid_device *csid,
+				struct csid_phy_config *phy)
+{
+	int val;
+
+	val = (phy->lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
+	val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
+	val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX)
+	       << CSI2_RX_CFG0_PHY_NUM_SEL;
+	writel(val, csid->base + CSID_CSI2_RX_CFG0);
+
+	val = CSI2_RX_CFG1_ECC_CORRECTION_EN;
+	writel(val, csid->base + CSID_CSI2_RX_CFG1);
+}
+
+static void __csid_configure_rx_vc(struct csid_device *csid, int vc)
+{
+	int val;
+
+	if (vc > 3) {
+		val = readl(csid->base + CSID_CSI2_RX_CFG1);
+		val |= CSI2_RX_CFG1_VC_MODE;
+		writel(val, csid->base + CSID_CSI2_RX_CFG1);
+	}
+}
+
+static void __csid_ctrl_rdi(struct csid_device *csid, int enable, u8 rdi)
+{
+	int val = 0;
+	u32 rdi_ctrl_offset = CSID_RDI_CTRL(rdi);
+
+	if (enable)
+		val = RDI_CTRL_START_CMD;
+
+	writel(val, csid->base + rdi_ctrl_offset);
+}
+
+static void __csid_configure_rdi_pix_store(struct csid_device *csid, u8 rdi)
+{
+	u32 val;
+
+	/* Configure pixel store to allow absorption of hblanking or idle time.
+	 * This helps with horizontal crop and prevents line buffer conflicts.
+	 * Reset state is 0x8 which has MIN_HBI=4, we keep the default MIN_HBI
+	 * and just enable the pixel store functionality.
+	 */
+	val = (4 << RDI_PIX_STORE_CFG0_MIN_HBI) | RDI_PIX_STORE_CFG0_EN;
+	writel(val, csid->base + CSID_RDI_PIX_STORE_CFG0(rdi));
+}
+
+static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 vc)
+{
+	u32 val;
+	u8 lane_cnt = csid->phy.lane_cnt;
+
+	/* Source pads matching RDI channels on hardware.
+	 * E.g. Pad 1 -> RDI0, Pad 2 -> RDI1, etc.
+	 */
+	struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_FIRST_SRC + vc];
+	const struct csid_format_info *format = csid_get_fmt_entry(csid->res->formats->formats,
+								   csid->res->formats->nformats,
+								   input_format->code);
+
+	if (!lane_cnt)
+		lane_cnt = 4;
+
+	/*
+	 * DT_ID is a two bit bitfield that is concatenated with
+	 * the four least significant bits of the five bit VC
+	 * bitfield to generate an internal CID value.
+	 *
+	 * CSID_RDI_CFG0(vc)
+	 * DT_ID : 28:27
+	 * VC    : 26:22
+	 * DT    : 21:16
+	 *
+	 * CID   : VC 3:0 << 2 | DT_ID 1:0
+	 */
+	u8 dt_id = vc & 0x03;
+	u32 rdi_cfg0_offset = CSID_RDI_CFG0(vc);
+	u32 rdi_cfg1_offset = CSID_RDI_CFG1(vc);
+	u32 rdi_ctrl_offset = CSID_RDI_CTRL(vc);
+
+	val = RDI_CFG0_TIMESTAMP_EN;
+	val |= RDI_CFG0_TIMESTAMP_STB_SEL;
+	val |= RDI_CFG0_RETIME_BS;
+
+	/* note: for non-RDI path, this should be format->decode_format */
+	val |= DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DECODE_FORMAT;
+	val |= vc << RDI_CFG0_VC;
+	val |= format->data_type << RDI_CFG0_DT;
+	val |= dt_id << RDI_CFG0_DT_ID;
+	writel(val, csid->base + rdi_cfg0_offset);
+
+	val = RDI_CFG1_PACKING_FORMAT_MIPI;
+	writel(val, csid->base + rdi_cfg1_offset);
+
+	/* Configure pixel store using dedicated register in 980 */
+	if (!csid_is_lite(csid))
+		__csid_configure_rdi_pix_store(csid, vc);
+
+	val = 0;
+	writel(val, csid->base + rdi_ctrl_offset);
+
+	val = readl(csid->base + rdi_cfg0_offset);
+
+	if (enable)
+		val |= RDI_CFG0_EN;
+
+	writel(val, csid->base + rdi_cfg0_offset);
+}
+
+static void csid_configure_stream_980(struct csid_device *csid, u8 enable)
+{
+	u8 vc, i;
+
+	__csid_configure_rx(csid, &csid->phy);
+
+	for (vc = 0; vc < MSM_CSID_MAX_SRC_STREAMS_980; vc++) {
+		if (csid->phy.en_vc & BIT(vc)) {
+			__csid_configure_rdi_stream(csid, enable, vc);
+			__csid_configure_rx_vc(csid, vc);
+
+			for (i = 0; i < CAMSS_INIT_BUF_COUNT; i++) {
+				__csid_aup_update(csid, vc);
+				__csid_rup_update(csid, vc);
+			}
+
+			__csid_ctrl_rdi(csid, enable, vc);
+		}
+	}
+}
+
+static int csid_configure_testgen_pattern_980(struct csid_device *csid,
+					      s32 val)
+{
+	return 0;
+}
+
+static void csid_subdev_reg_update_980(struct csid_device *csid, int port_id,
+				       bool clear)
+{
+	if (clear)
+		__csid_aup_rup_clear(csid, port_id);
+	else
+		__csid_aup_update(csid, port_id);
+}
+
+/**
+ * csid_isr - CSID module interrupt service routine
+ * @irq: Interrupt line
+ * @dev: CSID device
+ *
+ * Return IRQ_HANDLED on success
+ */
+static irqreturn_t csid_isr_980(int irq, void *dev)
+{
+	struct csid_device *csid = dev;
+	u32 val, buf_done_val;
+	u8 reset_done;
+	int i;
+
+	val = readl(csid->base + CSID_TOP_IRQ_STATUS);
+	writel(val, csid->base + CSID_TOP_IRQ_CLEAR);
+
+	reset_done = val & INFO_RST_DONE;
+
+	buf_done_val = readl(csid->base + CSID_BUF_DONE_IRQ_STATUS);
+	writel(buf_done_val, csid->base + CSID_BUF_DONE_IRQ_CLEAR);
+
+	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS_980; i++) {
+		if (csid->phy.en_vc & BIT(i)) {
+			val = readl(csid->base + CSID_CSI2_RDIN_IRQ_STATUS(i));
+			writel(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
+
+			if (val & INFO_RUP_DONE)
+				csid_subdev_reg_update_980(csid, i, true);
+
+			if (buf_done_val & BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i))
+				camss_buf_done(csid->camss, csid->id, i);
+		}
+	}
+
+	val = IRQ_CMD_CLEAR;
+	writel(val, csid->base + CSID_IRQ_CMD);
+
+	if (reset_done)
+		complete(&csid->reset_complete);
+
+	return IRQ_HANDLED;
+}
+
+/**
+ * csid_reset - Trigger reset on CSID module and wait to complete
+ * @csid: CSID device
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int csid_reset_980(struct csid_device *csid)
+{
+	unsigned long time;
+	u32 val;
+	int i;
+
+	reinit_completion(&csid->reset_complete);
+
+	val = INFO_RST_DONE | BUF_DONE_IRQ_STATUS;
+	writel(val, csid->base + CSID_TOP_IRQ_CLEAR);
+	writel(val, csid->base + CSID_TOP_IRQ_MASK);
+
+	val = 0;
+	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS_980; i++) {
+		if (csid->phy.en_vc & BIT(i)) {
+			/*
+			 * Only need to clear buf done IRQ status here,
+			 * RUP done IRQ status will be cleared once isr
+			 * strobe generated by CSID_RST_CMD
+			 */
+			val |= BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i);
+		}
+	}
+	writel(val, csid->base + CSID_BUF_DONE_IRQ_CLEAR);
+	writel(val, csid->base + CSID_BUF_DONE_IRQ_MASK);
+
+	/* Clear all IRQ status with CLEAR bits set */
+	val = IRQ_CMD_CLEAR;
+	writel(val, csid->base + CSID_IRQ_CMD);
+
+	val = RST_LOCATION | RST_MODE;
+	writel(val, csid->base + CSID_RST_CFG);
+
+	val = SELECT_HW_RST | SELECT_IRQ_RST;
+	writel(val, csid->base + CSID_RST_CMD);
+
+	time = wait_for_completion_timeout(&csid->reset_complete,
+					   msecs_to_jiffies(CSID_RESET_TIMEOUT_MS));
+
+	if (!time) {
+		dev_err(csid->camss->dev, "CSID reset timeout\n");
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
+static void csid_subdev_init_980(struct csid_device *csid)
+{
+	csid->testgen.nmodes = CSID_PAYLOAD_MODE_DISABLED;
+}
+
+const struct csid_hw_ops csid_ops_980 = {
+	.configure_stream = csid_configure_stream_980,
+	.configure_testgen_pattern = csid_configure_testgen_pattern_980,
+	.hw_version = csid_hw_version,
+	.isr = csid_isr_980,
+	.reset = csid_reset_980,
+	.src_pad_code = csid_src_pad_code,
+	.subdev_init = csid_subdev_init_980,
+	.reg_update = csid_subdev_reg_update_980,
+};
+
diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index 75a113050eb1..7a3de10a2a88 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -223,6 +223,7 @@ extern const struct csid_hw_ops csid_ops_4_1;
 extern const struct csid_hw_ops csid_ops_4_7;
 extern const struct csid_hw_ops csid_ops_340;
 extern const struct csid_hw_ops csid_ops_680;
+extern const struct csid_hw_ops csid_ops_980;
 extern const struct csid_hw_ops csid_ops_gen2;
 extern const struct csid_hw_ops csid_ops_gen3;
 extern const struct csid_hw_ops csid_ops_gen4;
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 1f9a91178002..c52e6f7b6294 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4189,6 +4189,79 @@ static const struct camss_subdev_resources csiphy_res_8750[] = {
 	},
 };
 
+static const struct camss_subdev_resources csid_res_8750[] = {
+	/* CSID0 */
+	{
+		.clock = { "csid", "csid_csiphy_rx" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000, 480000000 } },
+		.reg = { "csid0" },
+		.interrupt = { "csid0" },
+		.csid = {
+			.is_lite = false,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.hw_ops = &csid_ops_980,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID1 */
+	{
+		.clock = { "csid", "csid_csiphy_rx" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000, 480000000 } },
+		.reg = { "csid1" },
+		.interrupt = { "csid1" },
+		.csid = {
+			.is_lite = false,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.hw_ops = &csid_ops_980,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID2 */
+	{
+		.clock = { "csid", "csid_csiphy_rx" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000, 480000000 } },
+		.reg = { "csid2" },
+		.interrupt = { "csid2" },
+		.csid = {
+			.is_lite = false,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.hw_ops = &csid_ops_980,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID_LITE0 */
+	{
+		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000, 480000000 } },
+		.reg = { "csid_lite0" },
+		.interrupt = { "csid_lite0" },
+		.csid = {
+			.is_lite = true,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.hw_ops = &csid_ops_980,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID_LITE1 */
+	{
+		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000, 480000000 } },
+		.reg = { "csid_lite1" },
+		.interrupt = { "csid_lite1" },
+		.csid = {
+			.is_lite = true,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.hw_ops = &csid_ops_980,
+			.formats = &csid_formats_gen2
+		}
+	}
+};
+
 static const struct resources_icc icc_res_sm8750[] = {
 	{
 		.name = "cam_ahb",
@@ -5628,8 +5701,10 @@ static const struct camss_resources sm8750_resources = {
 	.version = CAMSS_8750,
 	.pd_name = "top",
 	.csiphy_res = csiphy_res_8750,
+	.csid_res = csid_res_8750,
 	.icc_res = icc_res_sm8750,
 	.csiphy_num = ARRAY_SIZE(csiphy_res_8750),
+	.csid_num = ARRAY_SIZE(csid_res_8750),
 	.icc_path_num = ARRAY_SIZE(icc_res_sm8750),
 };
 

-- 
2.34.1


