Return-Path: <linux-media+bounces-59680-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPLEG4Jc72m3AgEAu9opvQ
	(envelope-from <linux-media+bounces-59680-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 14:54:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DA3472DEC
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 14:54:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 203B630A26F1
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 12:48:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECEA43C8728;
	Mon, 27 Apr 2026 12:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pZwNEPuY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Anb3hwMl"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC7C3BAD9B
	for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 12:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777294020; cv=none; b=JkDGAQzg6tzTL+qkcVDyQ5W/WV6QS/5STLNf97wjpUXiWUdxfYHf/R/LwhnPmgXDVrJUeqXo7wM07hXC8qdXLNNorBHBIw8oyZXVtQmlIq7J5xZASBqZ9eqVKkhF8lF9zx8eCnfX5RqLE+ZLWU7RR5ItcaRlaDQWC8ZP+V427G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777294020; c=relaxed/simple;
	bh=ZQlKG4lDzXyaqGSPFJgTd5YAx0ybEvqo7MO3JGSvZSU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xtto0LE47DVd4VnwE3/INzJsb1EK01Vz1HTFdKen5Y4YeI2eiTgRxiIxvwwql9p9q7I07J9PpjFqZ2U4vYTbeYtpzXPf6YoZc8j70/qTZtjaTtzoTDrE/M0eZJ58KH12MZ2z/DMyB4Yu31HhTMT+v2E3hSFq79j6E7zW6lOZTyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pZwNEPuY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Anb3hwMl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TBtC2793156
	for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 12:46:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6CxZxIRAyhpEt1Z9NG+XcoFGfUkZoM/tpt7JPmbxHt8=; b=pZwNEPuYznxiEzxQ
	elsLWQ00CAh1xtjVDqrlNr2NAOyTCo3byAmUDYzGE4buUnFee8ZcnZjKZPWDAgTy
	lSvqvxaKdLL0oobiuu1AbqrdtFf9RvklZSXYYnhSKGaMJ/9xtfZ02CdUiC1VKAwC
	SR28qbkVgPraZCc8Gc3zvYcgQw6om7I4yWvOlykl11585KAAU7a1NhIM9PeFqbi/
	KhrYhXjLWHFuwjk8PhT2gVgekycUfepDcEvdzLhOvQjKzdsFUuxB9Ow2ZTr6oKvA
	qbXc2Z88k2d9lr28Y4YWoYbSMNR9WAyTTaOUCeg8tIIylHF5LoZXlW/DMwcmPbI1
	3pC5fw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dsa4uv6xx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 12:46:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50f817c3240so98938731cf.1
        for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 05:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777294017; x=1777898817; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6CxZxIRAyhpEt1Z9NG+XcoFGfUkZoM/tpt7JPmbxHt8=;
        b=Anb3hwMlRGGphE2p+G9NbjynEXq6/2A1b5kywhKumMwy2fgdY8MPIPObLl+KfcHSKa
         01hfpnMjsSFr29weT1WUVQyqYBeqaz6PNmLoyI1YZ31n9EG4uFAufLn7qiWpybKhshjh
         XMdJhtUPJQlwv6uRXMuAK84QdiQ4PvWb0xGFE1kDuIKXmrx/H80NGtcYEHNRe7FEe3w5
         K1hunMDd7D44o0iejB+769F0+ZiWGJgVwGSUvRhYN9NGbh3NmwLtMxxIQ/1Kiw2wyboV
         MJ8ByxsN7h1vy08HW9xMtz/e7rdpnBqMxPZju6/41VIGeY3OjSvBuw74F5Bmj661sc1j
         FT6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777294017; x=1777898817;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6CxZxIRAyhpEt1Z9NG+XcoFGfUkZoM/tpt7JPmbxHt8=;
        b=Aoc4B2yySlQQqD10kct57A99VOkv/O69ZJSm9Yfpj6EcpeOngPmVyZvMaDhdDpLWOn
         EszSKFOP9pSsX037S9dew6xq0/Dx7v5Ufk4QZKVBgwC8wNm9hDCdUP12VWtMT8LnskaG
         P5DwIlqX6MLAi8G1D+GXYo1mFetNC9AIhqs9Y3qgpHE3l8YB+ft0lFbpY4WoPZvYhiCm
         b/7ZUdAIsr+VwY5Hvl3zGIlHHTfUDnfRedf46l/2Tux4WPG1BvRGcZqegG8fMiA/N3tV
         7bZ1Ehe6tckH5AlehUcOhxDizSGrBSJ3iZtj5btGqUh35Luq+bQynt3oVMmUc2W1p1uN
         bajQ==
X-Gm-Message-State: AOJu0Yy0UwxgLoaVUm/FW9FBux/8AB6NyRpyaHmaiTxEHW9OhcWHEexC
	/SLG+qWsdlsm/Er2HRmS2QnQPnKlynEP5MYTo1073lSUCz4Kf34nPqiuhmM7gBnl+IoeASfxtgE
	yK70cr8SR3bE1uvZlw6Zed4O4aKNY2AEA2Eo8Ar7lMvncvmgSbJfng/2Q9k781cJG7w==
X-Gm-Gg: AeBDieu43Ht5rXuflsK5KDeSXRgo4o1XBxW6IfPMvb8a0dxQH4ome46rIjUxulAAFEK
	zPEHEjBeF3a36Q4XmnMDlyhkqjJgLQYTBn0m3wyrmLnsp3+9Q+sBgaGxZQRXYIkZLOmjV9m903E
	iCRzHKIQTEd7TPPmRqauXehqQIND+1ASztdNZVWHuMlgWT+p8yrse4lBMKKesxif2lnj9hHu9pr
	Ws5DXH0TpjlZRC/1fxlhkkuLFF52555zqukP4nbSP0Zy7sVY5q4pjr9cYzJOhYsWlemqs6FXLeb
	VOmNR1Sy2Ub9zdmcm6l4K9QqrMmdiX7GONEB8iPcly7LQ//3f3kQOQJb6kK20aIrZCDg4bmoe50
	eOzORVzgqxhEx4MOg3qjPBVaOaC+98OBqT9MAC5vCXIEMdZr0SW+WXRd2NjxNlDQa4Z0Y2vLoAS
	6MPiHGTb0u9PYu3XwD6U+juw+2Pfc=
X-Received: by 2002:a05:622a:1aa0:b0:50b:37a6:4f0a with SMTP id d75a77b69052e-50e5b2c1ba9mr496627981cf.57.1777294016933;
        Mon, 27 Apr 2026 05:46:56 -0700 (PDT)
X-Received: by 2002:a05:622a:1aa0:b0:50b:37a6:4f0a with SMTP id d75a77b69052e-50e5b2c1ba9mr496627531cf.57.1777294016431;
        Mon, 27 Apr 2026 05:46:56 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:653f:4d28:6a78:a6ca])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba454d1bd19sm1091496866b.37.2026.04.27.05.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 05:46:55 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 14:43:39 +0200
Subject: [PATCH v2 12/14] media: uapi: Add CAMSS ISP configuration
 definition
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-camss-isp-ope-v2-12-f430e7485009@oss.qualcomm.com>
References: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
In-Reply-To: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: XJBPH8gCrMwL32MEDgUdUyAzqQUIG3pU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEzNSBTYWx0ZWRfX5aieCASKXPA4
 rWS5euzlh9sPK0fWkgfyoUbw+9Z3qHpSwXb9dM/A/CuQ0D9WWvok+lglPqdIlw0sXtN8+xMks1H
 IyF09zG9gmI5FJcUh2q+zQAO0CGN16IPcsDbqx83Dp/iriKs69PGmTGEegR3YgiP6SyTAFtLNsr
 SGOpD6c31EuPCXNk4xyRgiUJK19qy0R7g7IjQN2EiQN5o320K1m5kuqDIsniLGJUAIJ9TryPNmz
 saihiZ3ANJZLfHww4eSurbbB0LX0OeCRQtzJ0glK8VKHqKF3xWoYBkKnanzQbtDua0jEBIVA/z6
 ziQZ/hnmrrvY9X+CvLR/MIcKjTtjUdjBgDOczlfyZTk8wiwdYRtCyqISPPIcWBy8x8QZrZggPzV
 03ciahz1ENU4zH6aWXj5cqwcGmPufRlI+Wmzjc43lO4+Z2YYrN0F3NSL0XLmhKgVZ27DULcRrTo
 TQmpOQbcWel3lAeZDiA==
X-Proofpoint-ORIG-GUID: XJBPH8gCrMwL32MEDgUdUyAzqQUIG3pU
X-Authority-Analysis: v=2.4 cv=J/GaKgnS c=1 sm=1 tr=0 ts=69ef5ac2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=GU9a0yZhNO0hLPa97fIA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270135
X-Rspamd-Queue-Id: 17DA3472DEC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-59680-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Add the uapi header camss-config.h defining the ISP parameter
structures used by the CAMSS Offline Processing Engine (OPE) driver.
This includes structures for white balance, chroma enhancement and
color correction configuration.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 include/uapi/linux/camss-config.h | 118 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 118 insertions(+)

diff --git a/include/uapi/linux/camss-config.h b/include/uapi/linux/camss-config.h
new file mode 100644
index 0000000000000000000000000000000000000000..2e15f03f16025c4a4852ad62afc39a5df6542422
--- /dev/null
+++ b/include/uapi/linux/camss-config.h
@@ -0,0 +1,118 @@
+/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
+/*
+ * Qualcomm CAMSS ISP parameters UAPI
+ *
+ * Uses the generic V4L2 extensible ISP parameters buffer format defined in
+ * <uapi/linux/media/v4l2-isp.h>.
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _UAPI_LINUX_CAMSS_CONFIG_H
+#define _UAPI_LINUX_CAMSS_CONFIG_H
+
+#include <linux/types.h>
+#include <linux/media/v4l2-isp.h>
+
+#include <linux/videodev2.h>
+
+/**
+ * enum camss_params_block_type - CAMSS ISP parameter block identifiers
+ *
+ * Each value identifies one ISP processing block.  The value is placed in
+ * the @type field of &struct v4l2_isp_params_block_header.
+ */
+enum camss_params_block_type {
+	CAMSS_PARAMS_WB_GAIN = 1,
+	CAMSS_PARAMS_CHROMA_ENHAN = 2,
+	CAMSS_PARAMS_COLOR_CORRECT = 3,
+	CAMSS_PARAMS_MAX,
+};
+
+/**
+ * struct camss_params_wb_gain - White Balance gains
+ *
+ * @header:   generic block header; @header.type = CAMSS_PARAMS_WB_GAIN
+ * @g_gain:   green channel gain (15uQ10)
+ * @b_gain:   blue channel gain (15uQ10)
+ * @r_gain:   red channel gain (15uQ10)
+ */
+struct camss_params_wb_gain {
+	struct v4l2_isp_params_block_header header;
+	__u16 g_gain;
+	__u16 b_gain;
+	__u16 r_gain;
+	__u16 _pad;
+} __attribute__((aligned(8)));
+
+/**
+ * struct camss_params_chroma_enhan - RGB to YUV colour matrix
+ *
+ * Implements the CLC_CHROMA_ENHAN pipeline module. All coefficients are
+ * signed 12-bit fixed-point Q3.8 (range roughly -8.0 to +7.996).
+ *
+ * Luma (Y) row of the matrix:
+ * @luma_v0:  R-to-Y coefficient (12sQ8, e.g. 0x04d = 0.299)
+ * @luma_v1:  G-to-Y coefficient (12sQ8, e.g. 0x096 = 0.587)
+ * @luma_v2:  B-to-Y coefficient (12sQ8, e.g. 0x01d = 0.114)
+ * @luma_k:   Y output offset    (9s,  0 = no offset)
+ *
+ * Chroma (Cb) row:
+ * @coeff_ap: Cb positive coefficient (12sQ8, e.g. 0x0e6 =  0.886)
+ * @coeff_am: Cb negative coefficient (12sQ8, e.g. 0xfb3 = -0.338)
+ * @kcb:      Cb output offset        (11s,   128 = +128)
+ *
+ * Chroma (Cr) row:
+ * @coeff_cp: Cr positive coefficient (12sQ8, e.g. 0x0b3 =  0.701)
+ * @coeff_cm: Cr negative coefficient (12sQ8, e.g. 0xfe3 = -0.114)
+ * @coeff_dp: Cr positive coefficient (12sQ8)
+ * @coeff_dm: Cr negative coefficient (12sQ8)
+ * @kcr:      Cr output offset        (11s,   128 = +128)
+ *
+ * @header: generic block header; @header.type = CAMSS_PARAMS_CHROMA_ENHAN
+ */
+struct camss_params_chroma_enhan {
+	struct v4l2_isp_params_block_header header;
+	__u16 luma_v0;
+	__u16 luma_v1;
+	__u16 luma_v2;
+	__u16 luma_k;
+	__u16 coeff_ap;
+	__u16 coeff_am;
+	__u16 coeff_cp;
+	__u16 coeff_cm;
+	__u16 coeff_dp;
+	__u16 coeff_dm;
+	__u16 kcb;
+	__u16 kcr;
+} __attribute__((aligned(8)));
+
+/**
+ * struct camss_params_color_correct - colour correction matrix
+ *
+ * signed 12-bit fixed-point (Qm)
+ *
+ * Out_ch0 (g) = A0*G+B0*B+C0*R + K0
+ * Out_ch1 (b) = A1*G+B1*B+C1*R + K1
+ * Out_ch2 (r) = A2*G+B2*B+C2*R + K2
+ *
+ * m = 0x0 - Coefficients are signed 12sQ7 numbers
+ * m = 0x1 - Coefficients are signed 12sQ8 numbers
+ * m = 0x2 - Coefficients are signed 12sQ9 numbers
+ * m = 0x3 - Coefficients are signed 12sQ10 numbers
+ */
+struct camss_params_color_correct {
+	struct v4l2_isp_params_block_header header;
+	__u16 a[3];
+	__u16 b[3];
+	__u16 c[3];
+	__u16 k[3];
+	__u16 m;
+} __attribute__((aligned(8)));
+
+#define CAMSS_PARAMS_MAX_PAYLOAD		\
+	(sizeof(struct camss_params_wb_gain)	+\
+	 sizeof(struct camss_params_chroma_enhan)	+\
+	 sizeof(struct camss_params_color_correct))
+
+#endif /* _UAPI_LINUX_CAMSS_CONFIG_H */

-- 
2.34.1


