Return-Path: <linux-media+bounces-44967-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE2FBEE03B
	for <lists+linux-media@lfdr.de>; Sun, 19 Oct 2025 10:02:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CEE7402551
	for <lists+linux-media@lfdr.de>; Sun, 19 Oct 2025 08:02:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0661F230BCB;
	Sun, 19 Oct 2025 08:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jNbM4sh7"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E390C2309AA
	for <linux-media@vger.kernel.org>; Sun, 19 Oct 2025 08:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760860941; cv=none; b=fNXb2wq2yJ5ud813+y+lAhKIQi7lbmkSd9yBc/dZlZcr+YmIoGS4VHaP6uC9La0A8vkcfxqFPntBgd35vwp3Ua9yUiQAiGFfJZaAEHnv72JMY2tvx7drtLFi7tJbMI7p11c46k6EOKu2WQUDYEhbjrX6ChkGZzkHJLEce+euZ+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760860941; c=relaxed/simple;
	bh=GaGviXQd1BmdQPJXtm3IcR1CGQVbHCroCtuSPzMiyZM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hwjWunNvEmiKkCfeZrQbA/J37k0s6S14JsAHhflXhflDBhOy2X1sdOysX9E9otvxhPBH4DS9cnEZJX8damwxqxecTFLdextyfw6o4tTKebx6SOGPx24LfvATh5SFq1evEMLRA4dA1cfIhyakjnkG6xX8o+Awt12rmEwS80YbSG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jNbM4sh7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59J3OOou029335
	for <linux-media@vger.kernel.org>; Sun, 19 Oct 2025 08:02:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BwC8FmuoUnU
	oxcHFn7z7n4laBB5CxBLWjXPUGBg9F7s=; b=jNbM4sh7ncRMuYWt7JhkzzLwrqZ
	n7EdPrOBV6R5IrgLpRoMWbLStWIjD0jSzoZYbv3eUXScE4/g69PIcjBQADuukvBt
	SCL3uF90CBPhOHrO10FnXYieiVTV+qFUaoMmepcl93VYClHyo8mTbYPmqND5Xy3y
	AoP0UB5JLyTJXmA2rr2sN0E3abZYjP7gltFxZ/EOSr6xp8F/OBjnEqPv7QFQQ6vv
	sP+esU9H4vVYZutjuzEq0Y/4f9M6y0nGLGDsfyJ88T9C2T0OYIjknA1KQn/E2zhn
	gpwc2/QsbDh82bQgyQ5zp9XNdtvmjpcTjLwuNLy5UtWlIB76Vdnaod3WTuw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v343t05m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 19 Oct 2025 08:02:19 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-78e30eaca8eso159163516d6.2
        for <linux-media@vger.kernel.org>; Sun, 19 Oct 2025 01:02:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760860938; x=1761465738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BwC8FmuoUnUoxcHFn7z7n4laBB5CxBLWjXPUGBg9F7s=;
        b=WUIY2+LWdBsmCzY02/FlSVkN1kcln/wDJeKFDFVNjMAnLSvDmKc3WRlM3cUwXzVgWo
         uh2jLvC2+BVU5RrqQAjRJjW9JW/zlc3mW9UfhgG+CVfLJUcrno7KjeTr/v8XQ7xQQ+Qw
         kaIxG1HDBrtI+0abkCEU/F6yaYiTZnrU3hk0mEwt1Q0us9xiX4lpGz8lE+Cg95wmFyrY
         nkCBzf2yhC9vynI/JDprUinUSkt0VnpLj0ss9h0FXV9R94k85sGsyWfYiRmyLr2vhegK
         snZXpeqrZj5+KCuzflUZJfrAC9Peu4RGU5rMB4kaXNSQNj9kSnnNdaEIkjk5R3/cPVDe
         xSWw==
X-Forwarded-Encrypted: i=1; AJvYcCW1CXeQtLIVuShZE/l3pjECGOIpUrRt2vxbAlTDRNxbT03f8+chpe8P+viOZODyzo/XTGsU6zBJqrkl0A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzlv2nem3xq96z8fvtVtsVbEVusuDhKy1A+XuRlK+ja7RyFaftr
	5HZPkN4VF3lHPFcq6errDEqQGLgFBcRjSgH0o7o8orVwMfHGShwGTvTKYoNLKn/o4pjpBjBQaoP
	OhlaeJP+NvnVIehYTdkYPfgE+vpsXYO4u3S40+N12bsK0eTDBs2olWZU4XlK6yTbJOw==
X-Gm-Gg: ASbGncsxPRG2L3N8Ui4n1nOAn5gPZNE471n7SPg6b98ygdQY+uqvY02xMyahD2MNMF5
	MDShmk1zwYw7kiiO31i87dShegMy8FC62R+kXZ4ju61BU8AXcSuhNmHsyPLpn0ADJVycpRDAQS9
	qhKNhJq+b5Nmy+pNN6CiGBrr1NESPWGgBggIe0mRHKxrKLf8NE8peG4jlU1vW7XraiIHIS+FUlJ
	+YNuTFUeDoxwSQxuFfuP0PbdQ2F3302FMkgtdB1gcOglov7X4FVmo/BApkJMHzvRrmPtHmEbz2p
	pdL4p1G5SJPKqH032cPayH+0h7wpqp3nxy5EWqXGcJaEK/sYp6HXkimVv2CnB0hH3t6JshazBwR
	SjMLaI+zpFpbKCjFQu8TH5VXOEitfiyHd4ShBl7MeUQB/+p2qLN5As8rq670RygaEEPj/MeAzJn
	uUoijcXcJUwgk=
X-Received: by 2002:a05:622a:1105:b0:4e8:bb14:d974 with SMTP id d75a77b69052e-4e8bb14db56mr14028241cf.79.1760860937729;
        Sun, 19 Oct 2025 01:02:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFgROKJadVhIUNVMF01hU3nVkXc/7jxLb8qkxJ3NF/RnkVk/qap4lUw3OWoXvUlCtfMQ2i+Q==
X-Received: by 2002:a05:622a:1105:b0:4e8:bb14:d974 with SMTP id d75a77b69052e-4e8bb14db56mr14027871cf.79.1760860937290;
        Sun, 19 Oct 2025 01:02:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591def1695fsm1353170e87.61.2025.10.19.01.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 01:02:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <quic_bvisredd@quicinc.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Subject: [PATCH 2/2] media: iris: move more common register definitions to the header
Date: Sun, 19 Oct 2025 10:59:02 +0300
Message-ID: <20251019080212.142623-4-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251019080212.142623-3-dmitry.baryshkov@oss.qualcomm.com>
References: <0251017-knp_video-v2-5-f568ce1a4be3@oss.qualcomm.com>
 <20251019080212.142623-3-dmitry.baryshkov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: roFwhnGsDC5HGzUtt8u6hTp_dFwnHMeG
X-Proofpoint-ORIG-GUID: roFwhnGsDC5HGzUtt8u6hTp_dFwnHMeG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMyBTYWx0ZWRfX9Zq/roOL8Osv
 Q/xoDC0MXBQRTNTieiCf4xHMS+abOhv542t55T+Uomqw7GnWyGPUEZYyvGRRfllZxwKAXVq0Go+
 jLecNM+kVZ7aHNeI5I5e1D75IGSclUD4eOaEqAkz4pEkgQz3+aAc8sI4OiA4uQJjNOmJy4Dv0dX
 kybs2UHb8c0iEJbL9obkQvuPJpYsxT/N7ihy78b64c9ts5cVxXw77+2SBAfGlhigxQnbETTAaZ6
 FYKQtcS2kJFBcJXpscswTF2xQ9OGeElgK/tuINUpvidUjE0TlOh5v3gY5lbd4tZBaqTxe0biP/y
 hmwZ+tw5i7mIClt6ta1iML2Xme2Lumrju9o6nAZx5qUtAxlWcKobvyKbhmYkI7rsSiwz4pWWCxN
 y22Y1ZqZrFpy6+sae44/12qH1hClcQ==
X-Authority-Analysis: v=2.4 cv=E/vAZKdl c=1 sm=1 tr=0 ts=68f49b0b cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=q6RJ1b41Wj0UoLORaoAA:9
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-19_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180023

Simplify adding new platforms by moving common registers definitions
from VPU 3.x and "common" file to the header with other register
defines.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu3x.c |  6 -----
 .../platform/qcom/iris/iris_vpu_common.c      | 20 ----------------
 .../qcom/iris/iris_vpu_register_defines.h     | 23 +++++++++++++++++++
 3 files changed, 23 insertions(+), 26 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index 0ac6373c33b7..cd53bcda3b3e 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -11,12 +11,6 @@
 #include "iris_vpu_common.h"
 #include "iris_vpu_register_defines.h"
 
-#define CORE_CLK_RUN				0x0
-/* VPU v3.5 */
-#define WRAPPER_IRIS_VCODEC_VPU_WRAPPER_SPARE_0	(WRAPPER_BASE_OFFS + 0x78)
-
-#define VIDEO_NOC_RESET_REQ			(BIT(0) | BIT(1))
-
 #define AON_WRAPPER_MVP_NOC_CORE_SW_RESET	(AON_BASE_OFFS + 0x18)
 #define SW_RESET				BIT(0)
 #define AON_WRAPPER_MVP_NOC_CORE_CLK_CONTROL	(AON_BASE_OFFS + 0x20)
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 4dc7aac78553..2d6548e47d47 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -11,10 +11,6 @@
 #include "iris_vpu_common.h"
 #include "iris_vpu_register_defines.h"
 
-#define CPU_IC_BASE_OFFS			(CPU_BASE_OFFS)
-
-#define CPU_CS_A2HSOFTINTCLR			(CPU_CS_BASE_OFFS + 0x1C)
-#define CLEAR_XTENSA2HOST_INTR			BIT(0)
 
 #define CTRL_INIT				(CPU_CS_BASE_OFFS + 0x48)
 #define CTRL_STATUS				(CPU_CS_BASE_OFFS + 0x4C)
@@ -32,22 +28,6 @@
 #define UC_REGION_ADDR				(CPU_CS_BASE_OFFS + 0x64)
 #define UC_REGION_SIZE				(CPU_CS_BASE_OFFS + 0x68)
 
-#define CPU_CS_H2XSOFTINTEN			(CPU_CS_BASE_OFFS + 0x148)
-#define HOST2XTENSA_INTR_ENABLE			BIT(0)
-
-#define CPU_IC_SOFTINT				(CPU_IC_BASE_OFFS + 0x150)
-#define CPU_IC_SOFTINT_H2A_SHFT			0x0
-
-#define WRAPPER_INTR_STATUS			(WRAPPER_BASE_OFFS + 0x0C)
-#define WRAPPER_INTR_STATUS_A2HWD_BMSK		BIT(3)
-#define WRAPPER_INTR_STATUS_A2H_BMSK		BIT(2)
-
-#define WRAPPER_INTR_MASK			(WRAPPER_BASE_OFFS + 0x10)
-#define WRAPPER_INTR_MASK_A2HWD_BMSK		BIT(3)
-#define WRAPPER_INTR_MASK_A2HCPU_BMSK		BIT(2)
-
-#define WRAPPER_TZ_CPU_STATUS			(WRAPPER_TZ_BASE_OFFS + 0x10)
-
 static void iris_vpu_interrupt_init(struct iris_core *core)
 {
 	u32 mask_val;
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
index 1c3ff6cab343..72168b9ffa73 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
@@ -16,10 +16,21 @@
 #define VCODEC_SS_IDLE_STATUSN			(VCODEC_BASE_OFFS + 0x70)
 
 #define AON_WRAPPER_MVP_NOC_RESET_REQ		(AON_MVP_NOC_RESET + 0x000)
+#define VIDEO_NOC_RESET_REQ			(BIT(0) | BIT(1))
 
 #define AON_WRAPPER_MVP_NOC_RESET_ACK		(AON_MVP_NOC_RESET + 0x004)
 
 #define CPU_CS_BASE_OFFS			(CPU_BASE_OFFS)
+#define CPU_IC_BASE_OFFS			(CPU_BASE_OFFS)
+
+#define CPU_CS_A2HSOFTINTCLR			(CPU_CS_BASE_OFFS + 0x1C)
+#define CLEAR_XTENSA2HOST_INTR			BIT(0)
+
+#define CPU_CS_H2XSOFTINTEN			(CPU_CS_BASE_OFFS + 0x148)
+#define HOST2XTENSA_INTR_ENABLE			BIT(0)
+
+#define CPU_IC_SOFTINT				(CPU_IC_BASE_OFFS + 0x150)
+#define CPU_IC_SOFTINT_H2A_SHFT			0x0
 
 #define CPU_CS_AHB_BRIDGE_SYNC_RESET		(CPU_CS_BASE_OFFS + 0x160)
 #define CORE_BRIDGE_SW_RESET			BIT(0)
@@ -29,6 +40,14 @@
 #define MSK_SIGNAL_FROM_TENSILICA		BIT(0)
 #define MSK_CORE_POWER_ON			BIT(1)
 
+#define WRAPPER_INTR_STATUS			(WRAPPER_BASE_OFFS + 0x0C)
+#define WRAPPER_INTR_STATUS_A2HWD_BMSK		BIT(3)
+#define WRAPPER_INTR_STATUS_A2H_BMSK		BIT(2)
+
+#define WRAPPER_INTR_MASK			(WRAPPER_BASE_OFFS + 0x10)
+#define WRAPPER_INTR_MASK_A2HWD_BMSK		BIT(3)
+#define WRAPPER_INTR_MASK_A2HCPU_BMSK		BIT(2)
+
 #define WRAPPER_DEBUG_BRIDGE_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x54)
 #define WRAPPER_DEBUG_BRIDGE_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x58)
 #define WRAPPER_IRIS_CPU_NOC_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x5C)
@@ -39,8 +58,12 @@
 #define NOC_LPI_STATUS_DENY			BIT(1) /* Indicates the NOC handshake is denied */
 #define NOC_LPI_STATUS_ACTIVE			BIT(2) /* Indicates the NOC is active */
 
+#define WRAPPER_IRIS_VCODEC_VPU_WRAPPER_SPARE_0	(WRAPPER_BASE_OFFS + 0x78)
 #define WRAPPER_CORE_POWER_STATUS		(WRAPPER_BASE_OFFS + 0x80)
 #define WRAPPER_CORE_CLOCK_CONFIG		(WRAPPER_BASE_OFFS + 0x88)
+#define CORE_CLK_RUN				0x0
+
+#define WRAPPER_TZ_CPU_STATUS			(WRAPPER_TZ_BASE_OFFS + 0x10)
 
 #define WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG		(WRAPPER_TZ_BASE_OFFS + 0x14)
 #define CTL_AXI_CLK_HALT			BIT(0)
-- 
2.47.3


