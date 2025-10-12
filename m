Return-Path: <linux-media+bounces-44211-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDF7BD07AF
	for <lists+linux-media@lfdr.de>; Sun, 12 Oct 2025 18:28:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 290504F3643
	for <lists+linux-media@lfdr.de>; Sun, 12 Oct 2025 16:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35F4E2F28E0;
	Sun, 12 Oct 2025 16:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YNA4/nzR"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4AD62EFD9B
	for <linux-media@vger.kernel.org>; Sun, 12 Oct 2025 16:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760286242; cv=none; b=ICwNn1ulVbdl5hfAlo/P91NK/tsI9UPU6sZZ0/0WXL61ayB1I0lflDEG7zUvUXB2ndO57lrargK3ysn5hWhFT/n2tD9kjKd0VNaS4gTabEdcBhxzMfG69pqsI2bFARag7ihAdUD3KhuoVt+aSch0BnJPxPQjX2Hn9f4XSnfJZAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760286242; c=relaxed/simple;
	bh=Vp/ykzgKhfedpHBRbN7YilOuy87M0W8I3NU/Zs/Wn5c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RTYQ03q69UX0Sdd5C+gFHYkqrbkVC4BH7Ks9WPIEE1AXorrvCRTv/vbvfDlAdEchSw5MTtzcrtop4g+dHCjUd9O0JHTUrqlwN4IDdWmo8R8IPiHkdWXDoRRLb3TFMsCjaIzyk0ekAUmoyry17VYQlIPmB8KcPCSzAQZfw+ntAf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YNA4/nzR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59CCDTO7004226
	for <linux-media@vger.kernel.org>; Sun, 12 Oct 2025 16:23:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ctamzewqOXOp6USHp3dTDRf2YyPP8/Km6zYRt+SqkZ8=; b=YNA4/nzR5NPe+Sow
	p5oK8Yo9leJYuLMLo5mcexbucgc32kV2eFd62cNnxgDIylC7DjgKbDGBg56o3O4Q
	JeB6OWKEhcsXXtH92QWN+b1GTBEBcjE8TL5gLr7og+ILFyl/ty5oqSybLSIOeAl9
	05GRG4HGi6SNT+xcwhGylMIoacQFjYv7QuaPk1RuQXQbocC2fz/Sv1DKHjHMKfle
	J43rX8zPTl3jjNmL0Y6CwmRxMHxc1DWIlSFtCKTFumPWVFFefTBXeev8G+LJpol6
	j9HHyYNZiXdm5mwBdufHb60+Fn2IEOoDwsw5IzAnPGzt7idiKa6DmgG8CjYRm0EC
	nBq7/w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfdk28gf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 12 Oct 2025 16:23:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-859b89cd3f2so2032295285a.1
        for <linux-media@vger.kernel.org>; Sun, 12 Oct 2025 09:23:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760286228; x=1760891028;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ctamzewqOXOp6USHp3dTDRf2YyPP8/Km6zYRt+SqkZ8=;
        b=veJwTppNvv2bQ3GJGFRrQ9I7Ir6n+4ETNsLE2Vtn/Ge9rrRYl4RkeXwA1xO+TrGv2D
         T6VJ+aevesmrQy47k/hZt1d1wf69dLtAfKnS6ifws/qo+oDcThoJQJpZCDeTPDeicDEj
         JSy+uDlISs4qeH1tGvg1mgTpqU/y95pU5/J1tekzqjHkUv/nvhkbKWHF00XKyLN2Oh2k
         Elq/PQT/Z6W1187AABzOma1xFbeMBQn8x5vhTx3UhT1AGr1m8g/xzZWJDX0R49hYTp0a
         YOMZm/+GlxJT9u4608Cp6T45JNopqXvfqrxc9p0zdSiOdD4hpS9xFh36nR4tdRPyzzKc
         QB5Q==
X-Gm-Message-State: AOJu0YwN4dGlgAcGYJYOoVZ2Wtmp4NSrcP6CIU+FVBgd1LDncLryC/ez
	5YotLdV3uYarJHXyfHS7vbOfTXXBDyq5cTu5K93rZkkvUymDbPwA3xvfVxK/2YH4sdYry903q9I
	qUCZFZZENrWpGOBF8U3DlLg2nJR9VeZqxQ2pmT4IKC8n6Uqx9rwhClOgtnBnt1l2prQ==
X-Gm-Gg: ASbGnctIjW/f6tIVH4RWhSxlfTo93PVrRqphJrQ/qw2SbJ7SZ3MX53nsaIavNXo8irr
	DM/XvOiK9tUA7nAESZf3Ghp1lKSLGR7qO74joQlisHZ1nNC0+jw1fFG+4gZSD+u4xpr/fJXCOLE
	87B3xkC/MWG/+31FcJA6JwjynJIJsteIgiPaxOXrogUY7SVzMsYBFLe7m1ZA+anKrCsvEyBnPOz
	IBnVU0z9m8ilgdOAfudJfA9OMrhCyyR017BEjJqTNF9vCzZw9vgv5QgsQU4V9+NZF5grHvcPTLc
	q6YI0VoYXHp+ePHnSgKA3iZCMl6r0d98jyHsBd6vM5k9UPeiU1i5VVKNtf1RVGsj6Wmb97UZ9VS
	YahcEHsLWiYC2dfR6mNYY2T+bAvDnYd/iXYuyWrzBPNaJ3VDjUOpd
X-Received: by 2002:a05:620a:4589:b0:84a:af34:5b7f with SMTP id af79cd13be357-88352d9a115mr2697232385a.75.1760286228134;
        Sun, 12 Oct 2025 09:23:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCU9EriCEgZLwanEy7iBG53kjY57KtFtqY+aPx1kKvbLXWf/wFW8ji95TnuuFJmrOAa/fpkg==
X-Received: by 2002:a05:620a:4589:b0:84a:af34:5b7f with SMTP id af79cd13be357-88352d9a115mr2697229285a.75.1760286227620;
        Sun, 12 Oct 2025 09:23:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881fe5besm3112637e87.50.2025.10.12.09.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 09:23:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 12 Oct 2025 19:23:34 +0300
Subject: [PATCH v2 7/8] media: iris: move common register definitions to
 the header
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251012-iris-sc7280-v2-7-d53a1a4056c3@oss.qualcomm.com>
References: <20251012-iris-sc7280-v2-0-d53a1a4056c3@oss.qualcomm.com>
In-Reply-To: <20251012-iris-sc7280-v2-0-d53a1a4056c3@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8281;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Vp/ykzgKhfedpHBRbN7YilOuy87M0W8I3NU/Zs/Wn5c=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ8brayxvwg6nRppZMZw8xdu9ujimT2Su7ukqoYVSEw3CH
 +S7/zXrZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEpKXZ/5npTHp1rqzpw1nO
 n2yZfZa2kw/MmbyonmP9usg1svF6y2bOCDVsutl9sIFl4najT502blECYqaPJz3NfPzF6NiqBcW
 vneXn2Zsbi72Oa7zA9lH8pHmAdMSF6GO7/OJ6vneG9rD7MHwt71pjIJLdUvjM69iH62Z3HDNFZF
 4U9MT8Up2WwXzaK39xws9PPNY23zXWck+84yDUw+SWkXn6Q0fjyaz5b8Mv+B3YHBmpnfF3Svyn7
 pJYHc0XjK82XCw53Xns6jlm3qqHv/omKqSmb3837fnD7NDIhN/pW3reXLf7/S6AvZFre+5kpaCq
 NmvLuyvlMq5WxunymDzK5Itrqev99P6ttyTPoVX7GEX6AQ==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 2vv0LHBnyKWeXjazEFAugt0mvYuLX0DG
X-Authority-Analysis: v=2.4 cv=MrNfKmae c=1 sm=1 tr=0 ts=68ebd615 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=qUPVcWiRufo_Kb4lI7EA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 2vv0LHBnyKWeXjazEFAugt0mvYuLX0DG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfXwkAoQcDSWULJ
 WRzGDUjPaevNbhxQp6J4L1kiZBqex0aMbZhkfkw5ai4c+N0XtvwiTc2jmxfDvT++S/gxgS7lC/p
 2Bgj9w7+rsGCW3mkqWwrKSmbtXLpa/1xb2nBuoL8GgXSNzyhgUAAl7pAOlfgfnPVgyp0FIiA6Jb
 nAMTOw1s8KfujyL3kosbZx0KSApstAAAtahS5UWaNSXae3F6eR07KLjDEaN0NDhkAAtIKftL7zF
 +4UgowyF0nCvRBgEJr/uGRNO0nX/BkQA2T1G6T4vGmhvWWNQgTFvWRXNwtrywBfNLqEixuTBkTv
 e4cWYlasbJSqk0oEG6DjwzTEKEpZSDWm9sjmkFlscWGzXPcarbUJx8unjaM4h/acke2QdBc9TJH
 6Pvf1X4vMyem2jQFsqqAZ58+9++4AQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-12_06,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

Simplify adding new platforms by moving common registers definitions
from VPU 3.x and "common" file to the header with other register
defines.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 35 --------------
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 43 -----------------
 .../platform/qcom/iris/iris_vpu_register_defines.h | 56 ++++++++++++++++++++++
 3 files changed, 56 insertions(+), 78 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index 339776a0b4672e246848c3a6a260eb83c7da6a60..78aede9ac497abafc0545647c34a53c63c595f72 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -11,48 +11,13 @@
 #include "iris_vpu_common.h"
 #include "iris_vpu_register_defines.h"
 
-#define WRAPPER_TZ_BASE_OFFS			0x000C0000
-#define AON_BASE_OFFS				0x000E0000
 #define AON_MVP_NOC_RESET			0x0001F000
 
-#define WRAPPER_DEBUG_BRIDGE_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x54)
-#define WRAPPER_DEBUG_BRIDGE_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x58)
-#define WRAPPER_IRIS_CPU_NOC_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x5C)
-#define REQ_POWER_DOWN_PREP			BIT(0)
-#define WRAPPER_IRIS_CPU_NOC_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x60)
-#define NOC_LPI_STATUS_DONE			BIT(0) /* Indicates the NOC handshake is complete */
-#define NOC_LPI_STATUS_DENY			BIT(1) /* Indicates the NOC handshake is denied */
-#define NOC_LPI_STATUS_ACTIVE		BIT(2) /* Indicates the NOC is active */
-#define WRAPPER_CORE_CLOCK_CONFIG		(WRAPPER_BASE_OFFS + 0x88)
-#define CORE_CLK_RUN				0x0
-/* VPU v3.5 */
-#define WRAPPER_IRIS_VCODEC_VPU_WRAPPER_SPARE_0	(WRAPPER_BASE_OFFS + 0x78)
-
-#define WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG		(WRAPPER_TZ_BASE_OFFS + 0x14)
-#define CTL_AXI_CLK_HALT			BIT(0)
-#define CTL_CLK_HALT				BIT(1)
-
-#define WRAPPER_TZ_QNS4PDXFIFO_RESET		(WRAPPER_TZ_BASE_OFFS + 0x18)
-#define RESET_HIGH				BIT(0)
-
-#define CPU_CS_AHB_BRIDGE_SYNC_RESET		(CPU_CS_BASE_OFFS + 0x160)
-#define CORE_BRIDGE_SW_RESET			BIT(0)
-#define CORE_BRIDGE_HW_RESET_DISABLE		BIT(1)
-
-#define CPU_CS_X2RPMH				(CPU_CS_BASE_OFFS + 0x168)
-#define MSK_SIGNAL_FROM_TENSILICA		BIT(0)
-#define MSK_CORE_POWER_ON			BIT(1)
-
 #define AON_WRAPPER_MVP_NOC_RESET_REQ		(AON_MVP_NOC_RESET + 0x000)
 #define VIDEO_NOC_RESET_REQ			(BIT(0) | BIT(1))
 
 #define AON_WRAPPER_MVP_NOC_RESET_ACK		(AON_MVP_NOC_RESET + 0x004)
 
-#define VCODEC_SS_IDLE_STATUSN			(VCODEC_BASE_OFFS + 0x70)
-
-#define AON_WRAPPER_MVP_NOC_LPI_CONTROL		(AON_BASE_OFFS)
-#define AON_WRAPPER_MVP_NOC_LPI_STATUS		(AON_BASE_OFFS + 0x4)
-
 #define AON_WRAPPER_MVP_NOC_CORE_SW_RESET	(AON_BASE_OFFS + 0x18)
 #define SW_RESET				BIT(0)
 #define AON_WRAPPER_MVP_NOC_CORE_CLK_CONTROL	(AON_BASE_OFFS + 0x20)
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index bb98950e018fadf69ac4f41b3037f7fd6ac33c5b..2d6548e47d47967c1c110489cb8088130fb625fd 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -11,13 +11,6 @@
 #include "iris_vpu_common.h"
 #include "iris_vpu_register_defines.h"
 
-#define WRAPPER_TZ_BASE_OFFS			0x000C0000
-#define AON_BASE_OFFS				0x000E0000
-
-#define CPU_IC_BASE_OFFS			(CPU_BASE_OFFS)
-
-#define CPU_CS_A2HSOFTINTCLR			(CPU_CS_BASE_OFFS + 0x1C)
-#define CLEAR_XTENSA2HOST_INTR			BIT(0)
 
 #define CTRL_INIT				(CPU_CS_BASE_OFFS + 0x48)
 #define CTRL_STATUS				(CPU_CS_BASE_OFFS + 0x4C)
@@ -35,42 +28,6 @@
 #define UC_REGION_ADDR				(CPU_CS_BASE_OFFS + 0x64)
 #define UC_REGION_SIZE				(CPU_CS_BASE_OFFS + 0x68)
 
-#define CPU_CS_H2XSOFTINTEN			(CPU_CS_BASE_OFFS + 0x148)
-#define HOST2XTENSA_INTR_ENABLE			BIT(0)
-
-#define CPU_CS_X2RPMH				(CPU_CS_BASE_OFFS + 0x168)
-#define MSK_SIGNAL_FROM_TENSILICA		BIT(0)
-#define MSK_CORE_POWER_ON			BIT(1)
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
-#define WRAPPER_DEBUG_BRIDGE_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x54)
-#define WRAPPER_DEBUG_BRIDGE_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x58)
-#define WRAPPER_IRIS_CPU_NOC_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x5C)
-#define WRAPPER_IRIS_CPU_NOC_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x60)
-
-#define WRAPPER_TZ_CPU_STATUS			(WRAPPER_TZ_BASE_OFFS + 0x10)
-#define WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG		(WRAPPER_TZ_BASE_OFFS + 0x14)
-#define CTL_AXI_CLK_HALT			BIT(0)
-#define CTL_CLK_HALT				BIT(1)
-
-#define WRAPPER_TZ_QNS4PDXFIFO_RESET		(WRAPPER_TZ_BASE_OFFS + 0x18)
-#define RESET_HIGH				BIT(0)
-
-#define AON_WRAPPER_MVP_NOC_LPI_CONTROL		(AON_BASE_OFFS)
-#define REQ_POWER_DOWN_PREP			BIT(0)
-
-#define AON_WRAPPER_MVP_NOC_LPI_STATUS		(AON_BASE_OFFS + 0x4)
-
 static void iris_vpu_interrupt_init(struct iris_core *core)
 {
 	u32 mask_val;
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
index fe8a39e5e5a3fc68dc3a706ffdba07a5558163cf..9955367a9f8179d2e364c41dcfe8ad445a0a13f4 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
@@ -9,9 +9,65 @@
 #define VCODEC_BASE_OFFS			0x00000000
 #define CPU_BASE_OFFS				0x000A0000
 #define WRAPPER_BASE_OFFS			0x000B0000
+#define WRAPPER_TZ_BASE_OFFS			0x000C0000
+#define AON_BASE_OFFS				0x000E0000
+
+#define VCODEC_SS_IDLE_STATUSN			(VCODEC_BASE_OFFS + 0x70)
 
 #define CPU_CS_BASE_OFFS			(CPU_BASE_OFFS)
 
+#define CPU_CS_A2HSOFTINTCLR			(CPU_CS_BASE_OFFS + 0x1C)
+#define CLEAR_XTENSA2HOST_INTR			BIT(0)
+
+#define CPU_CS_H2XSOFTINTEN			(CPU_CS_BASE_OFFS + 0x148)
+#define HOST2XTENSA_INTR_ENABLE			BIT(0)
+
+#define CPU_IC_BASE_OFFS			(CPU_BASE_OFFS)
+#define CPU_IC_SOFTINT				(CPU_IC_BASE_OFFS + 0x150)
+#define CPU_IC_SOFTINT_H2A_SHFT			0x0
+
+#define CPU_CS_AHB_BRIDGE_SYNC_RESET		(CPU_CS_BASE_OFFS + 0x160)
+#define CORE_BRIDGE_SW_RESET			BIT(0)
+#define CORE_BRIDGE_HW_RESET_DISABLE		BIT(1)
+
+#define CPU_CS_X2RPMH				(CPU_CS_BASE_OFFS + 0x168)
+#define MSK_SIGNAL_FROM_TENSILICA		BIT(0)
+#define MSK_CORE_POWER_ON			BIT(1)
+
+#define WRAPPER_INTR_STATUS			(WRAPPER_BASE_OFFS + 0x0C)
+#define WRAPPER_INTR_STATUS_A2HWD_BMSK		BIT(3)
+#define WRAPPER_INTR_STATUS_A2H_BMSK		BIT(2)
+
+#define WRAPPER_INTR_MASK			(WRAPPER_BASE_OFFS + 0x10)
+#define WRAPPER_INTR_MASK_A2HWD_BMSK		BIT(3)
+#define WRAPPER_INTR_MASK_A2HCPU_BMSK		BIT(2)
+
 #define WRAPPER_CORE_POWER_STATUS		(WRAPPER_BASE_OFFS + 0x80)
+#define WRAPPER_DEBUG_BRIDGE_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x54)
+#define WRAPPER_DEBUG_BRIDGE_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x58)
+#define WRAPPER_IRIS_CPU_NOC_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x5C)
+#define REQ_POWER_DOWN_PREP			BIT(0)
+
+#define WRAPPER_IRIS_CPU_NOC_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x60)
+#define NOC_LPI_STATUS_DONE			BIT(0) /* Indicates the NOC handshake is complete */
+#define NOC_LPI_STATUS_DENY			BIT(1) /* Indicates the NOC handshake is denied */
+#define NOC_LPI_STATUS_ACTIVE			BIT(2) /* Indicates the NOC is active */
+
+#define WRAPPER_IRIS_VCODEC_VPU_WRAPPER_SPARE_0	(WRAPPER_BASE_OFFS + 0x78)
+
+#define WRAPPER_CORE_CLOCK_CONFIG		(WRAPPER_BASE_OFFS + 0x88)
+#define CORE_CLK_RUN				0x0
+
+#define WRAPPER_TZ_CPU_STATUS			(WRAPPER_TZ_BASE_OFFS + 0x10)
+
+#define WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG		(WRAPPER_TZ_BASE_OFFS + 0x14)
+#define CTL_AXI_CLK_HALT			BIT(0)
+#define CTL_CLK_HALT				BIT(1)
+
+#define WRAPPER_TZ_QNS4PDXFIFO_RESET		(WRAPPER_TZ_BASE_OFFS + 0x18)
+#define RESET_HIGH				BIT(0)
+
+#define AON_WRAPPER_MVP_NOC_LPI_CONTROL		(AON_BASE_OFFS)
+#define AON_WRAPPER_MVP_NOC_LPI_STATUS		(AON_BASE_OFFS + 0x4)
 
 #endif

-- 
2.47.3


