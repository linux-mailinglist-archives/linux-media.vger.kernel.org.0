Return-Path: <linux-media+bounces-44966-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A553BEE037
	for <lists+linux-media@lfdr.de>; Sun, 19 Oct 2025 10:02:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 598584E41BE
	for <lists+linux-media@lfdr.de>; Sun, 19 Oct 2025 08:02:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E03AE22FDE6;
	Sun, 19 Oct 2025 08:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jWH/HZBi"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B107221A95D
	for <linux-media@vger.kernel.org>; Sun, 19 Oct 2025 08:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760860939; cv=none; b=qdpC0DIix/mXglz+VeLXo3M+g45t+k52tNyXDF8IkpeWxrlP79E5RjxyKv98/uDG9lnCJ9DAWMPgyYcdgi+zlpeG6S9oxjr3oVVjoX7M87WX8Xk/M+nGqlts14v/ApHv+DyNkoHneQha/Ub6rxLoADZXga6T3NkIF2PRBDjo/CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760860939; c=relaxed/simple;
	bh=IhkNdhV1hTAXKq74opsigwyH+OgEAhY4flHRuC9QW9s=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GB4XHI/ky5qr+pfGmK7nEPWnGW94UVy6blIhRdN+Bkx6fZ3gqsQgeiZdfYuIVB6A9Sv7q6bGVagtH9Fis5QBpLuuUBQ5qIxTiO7iO2yjdWsXPtCRalgfd/MJz6212vMngnP64Jb9tdqKLRt0uCmx5U1jJ3mMZFwEUzh6QOYBlio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jWH/HZBi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59J4rRqX031392
	for <linux-media@vger.kernel.org>; Sun, 19 Oct 2025 08:02:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PCu0f4HoNX7
	caVYPLTD2PG4lkgiTCB9Bw+ris27XvNs=; b=jWH/HZBioTNnNbZLKnZuw6hhCP0
	7cHT8I5DO1jk/q4JLcPhxPEzYbIcwbW6vMT0XDrg1t1bpaOZzA9909N1dl5Xz9mK
	0hiBVwwvowpmaJGUXF9aGklsSrowfN7c4BQ6R7iipwWGXUTD2eVD/j4/6IHrB++G
	0JlDNiLNx+cWFSyXWpPm4/tTXhXA4ocitX0kLnb3VIEsV19oBPRFrn0rhoPleWJn
	APvwwOnYMquD3JHIiFtcWizTVlSoIDRBrhLNwymKgTSzTk0XYaRk3Xx0QTUlt3Dh
	B9awR4tIohWO+ExAnjP9PvzvPNptlhaUYbL+OrJrlpC+w2il/ZSDER00tOA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v1usa596-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 19 Oct 2025 08:02:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-871614ad3efso1214330685a.0
        for <linux-media@vger.kernel.org>; Sun, 19 Oct 2025 01:02:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760860936; x=1761465736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PCu0f4HoNX7caVYPLTD2PG4lkgiTCB9Bw+ris27XvNs=;
        b=Oa0VHNbZl44Pm1uncfVjEK1yEcPh8VhJ6lQviOsMYEGdb2QFxOezSAWa5zNPnSMZ+v
         EdmKdfAs0Unn+lZ8+x1XiIcBT0v8jQu/saNrWZsiGXz4N8VGTAYHSTH8DN8gWnlnX1W6
         wq6cxo8ETv4dThm8fzP8gxviKPhDvtofOZOm1VUz6OA238WMvE1/KhwrXn1+CitzKKkA
         Vn4jz1T7QPGRkh66AyN/p1hNuQfmWYi/3ihYSG1l93nUGgQTng7usxgNkPDXhM+UmROT
         U/5iZ4OscWQq3b259qT5PZzZ+k72AiSTVCzh8vFSjerWEBChw8feIQRokzayJlS4o/KJ
         UXHA==
X-Forwarded-Encrypted: i=1; AJvYcCVORxek6EzZ8/xl9oaAF9P5X+GPY4zaE4H+VDqH3YJcdFoi5T1yWmLbV1+wHE2U6kkn6e3aL/QiHvDYiA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzNZ/XrFaKqaYEG7xTJsLYCi5o25l4P+E4Hd64JWzWofm92fFP
	/wp+KL3bz7omzJmn6Lzfe2j3eNj0DL0pFiAY+TWaYokpc3wlC+vR9pi1ub/cgB5xs8SMXhKbqEr
	+vruHgxmS0zzCdVk9RH8pWOLM8MImaaDZbaWLgUeiGCp9OeN7qw6wZPcxUJAYiZodGw==
X-Gm-Gg: ASbGncsd2TFtppYkeHk01Wnq4rlTQ0+PISVDyWD9hEsBu3xcH7XKFEkHt/RFQRjaZKm
	YY9Jqfh4fr4IjYcd8WcndGFnW7gZBJ/Qwgph1611TvTrkqgSJJikDE8lNpHlRlMtXbuYiOT6top
	3Xawbn28Z6T0V+57hgqDd1OCC+ffoCPTT4QmrIt7yJMN3g+30YXtmSERnLLIoNYQdgKW/YENbal
	hMf5OQ9iQldE1bWdkR/qMgQ42LIlqiGnb5Hnze0xg1PmZn4FA26cFh7N6jANCo7p/OkHz+vo5qf
	CPVgGtkWKaW7rsjkYhV6lv8peDpRfL5h9EbonbgsJ5R6mk/Le+6vzjLOfKN47WGukjice7UjoK/
	CNvSZ8tv7de3ZE/PcNT0fPch75mD6CljCUrXgQTYVxbCFC5XMPiv7k8KlMGNKew77PfIdo7D6jy
	jcHNlCuadew7M=
X-Received: by 2002:a05:622a:1a87:b0:4e8:a359:b798 with SMTP id d75a77b69052e-4e8a359be46mr88922591cf.67.1760860935541;
        Sun, 19 Oct 2025 01:02:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1eVAe3sKqBxqT4zkB9fpGbudrcKFbHhI0WnnRPaKtVd0Wn3A5JdSj2juSSn+NQSfKGzlVYw==
X-Received: by 2002:a05:622a:1a87:b0:4e8:a359:b798 with SMTP id d75a77b69052e-4e8a359be46mr88922131cf.67.1760860935059;
        Sun, 19 Oct 2025 01:02:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591def1695fsm1353170e87.61.2025.10.19.01.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 01:02:14 -0700 (PDT)
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
Subject: [PATCH 1/2] media: iris: sort out common register definitions
Date: Sun, 19 Oct 2025 10:59:01 +0300
Message-ID: <20251019080212.142623-3-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <0251017-knp_video-v2-5-f568ce1a4be3@oss.qualcomm.com>
References: <0251017-knp_video-v2-5-f568ce1a4be3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: bVKLOcKZmSmY7xWawJDHxY9UhlqlWfWE
X-Proofpoint-GUID: bVKLOcKZmSmY7xWawJDHxY9UhlqlWfWE
X-Authority-Analysis: v=2.4 cv=XuT3+FF9 c=1 sm=1 tr=0 ts=68f49b08 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=zaoXWFKIo8GWO-w5zvgA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxNCBTYWx0ZWRfX9oHnDzsRAoNO
 nwTdgEFBRNjw2Ek95h1T1GnnllC2hopOplO30ZgDuMMugbPu+Ql1y4mpOK326Og13xJ86fgb/nk
 8oe2xlVFc7teM6D6kZV6Y4WKtzNaLRuJ6jBvPseMK3wiPEaoLQmCKdgrfX8BBD5Nb3iGKOSh0F6
 TuiyzjFAp3xuXNpJuXQ25LbkaJEfeasrN+knHGcLyIEWktjL7MCIDZqYgrLIPt4uwi7+Mnf1U+5
 Ws4Gwua7eySLwJDxA6TpRRDV5SQuOR5aizwotg5o0LjYPELN9eo/mDuK/3Ffa9RVBGn1p6lDPBp
 LzBAZ8Xr3MDoFLRop+vw4GI+UZ2dOr1w0zbAeurf/GXu8fbzQhpIoFNt15W3F54cPRMnjrUSw7e
 53uVkWbsxT/3LF3g8yBDnVSEivXcMg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-19_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180014

In order to make it easier to modify the file, sort the definitions
by the register base and then by the offset. Also move bits definitions
next to the registers which they describe (as it was done before).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---

Vikash, I have dropped these patches from SC7280 patchseries as they are
no longer required. If the series gets resent, please feel free to pick
these two patches in or to squash them into the corresponding patch.

---

 .../qcom/iris/iris_vpu_register_defines.h     | 47 +++++++++++--------
 1 file changed, 28 insertions(+), 19 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
index 6474f561c8dc..1c3ff6cab343 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
@@ -7,40 +7,49 @@
 #define __IRIS_VPU_REGISTER_DEFINES_H__
 
 #define VCODEC_BASE_OFFS			0x00000000
+#define AON_MVP_NOC_RESET			0x0001F000
 #define CPU_BASE_OFFS				0x000A0000
 #define WRAPPER_BASE_OFFS			0x000B0000
-#define AON_BASE_OFFS				0x000E0000
 #define WRAPPER_TZ_BASE_OFFS			0x000C0000
-#define AON_MVP_NOC_RESET			0x0001F000
+#define AON_BASE_OFFS				0x000E0000
 
-#define CPU_CS_BASE_OFFS			(CPU_BASE_OFFS)
+#define VCODEC_SS_IDLE_STATUSN			(VCODEC_BASE_OFFS + 0x70)
 
-#define WRAPPER_CORE_POWER_STATUS		(WRAPPER_BASE_OFFS + 0x80)
-#define WRAPPER_CORE_CLOCK_CONFIG		(WRAPPER_BASE_OFFS + 0x88)
-#define AON_WRAPPER_MVP_NOC_LPI_CONTROL		(AON_BASE_OFFS)
-#define WRAPPER_DEBUG_BRIDGE_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x54)
-#define WRAPPER_DEBUG_BRIDGE_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x58)
-#define WRAPPER_IRIS_CPU_NOC_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x5C)
-#define WRAPPER_IRIS_CPU_NOC_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x60)
-#define WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG		(WRAPPER_TZ_BASE_OFFS + 0x14)
-#define CPU_CS_AHB_BRIDGE_SYNC_RESET		(CPU_CS_BASE_OFFS + 0x160)
-#define CPU_CS_X2RPMH				(CPU_CS_BASE_OFFS + 0x168)
 #define AON_WRAPPER_MVP_NOC_RESET_REQ		(AON_MVP_NOC_RESET + 0x000)
+
 #define AON_WRAPPER_MVP_NOC_RESET_ACK		(AON_MVP_NOC_RESET + 0x004)
-#define VCODEC_SS_IDLE_STATUSN			(VCODEC_BASE_OFFS + 0x70)
-#define AON_WRAPPER_MVP_NOC_LPI_STATUS		(AON_BASE_OFFS + 0x4)
-#define WRAPPER_TZ_QNS4PDXFIFO_RESET		(WRAPPER_TZ_BASE_OFFS + 0x18)
 
+#define CPU_CS_BASE_OFFS			(CPU_BASE_OFFS)
+
+#define CPU_CS_AHB_BRIDGE_SYNC_RESET		(CPU_CS_BASE_OFFS + 0x160)
 #define CORE_BRIDGE_SW_RESET			BIT(0)
 #define CORE_BRIDGE_HW_RESET_DISABLE		BIT(1)
+
+#define CPU_CS_X2RPMH				(CPU_CS_BASE_OFFS + 0x168)
 #define MSK_SIGNAL_FROM_TENSILICA		BIT(0)
 #define MSK_CORE_POWER_ON			BIT(1)
-#define CTL_AXI_CLK_HALT			BIT(0)
-#define CTL_CLK_HALT				BIT(1)
+
+#define WRAPPER_DEBUG_BRIDGE_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x54)
+#define WRAPPER_DEBUG_BRIDGE_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x58)
+#define WRAPPER_IRIS_CPU_NOC_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x5C)
 #define REQ_POWER_DOWN_PREP			BIT(0)
-#define RESET_HIGH				BIT(0)
+
+#define WRAPPER_IRIS_CPU_NOC_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x60)
 #define NOC_LPI_STATUS_DONE			BIT(0) /* Indicates the NOC handshake is complete */
 #define NOC_LPI_STATUS_DENY			BIT(1) /* Indicates the NOC handshake is denied */
 #define NOC_LPI_STATUS_ACTIVE			BIT(2) /* Indicates the NOC is active */
 
+#define WRAPPER_CORE_POWER_STATUS		(WRAPPER_BASE_OFFS + 0x80)
+#define WRAPPER_CORE_CLOCK_CONFIG		(WRAPPER_BASE_OFFS + 0x88)
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
+
 #endif
-- 
2.47.3


