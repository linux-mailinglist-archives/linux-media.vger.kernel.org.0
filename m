Return-Path: <linux-media+bounces-60867-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8K/7J3sX/WlLXgAAu9opvQ
	(envelope-from <linux-media+bounces-60867-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 00:51:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E3B4EFF00
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 00:51:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 21B943014A0A
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 22:50:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 184663D333D;
	Thu,  7 May 2026 22:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aEqAB1J2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RX84c+y5"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2D73D3331
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 22:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778194220; cv=none; b=m5HVEVuPlWNitM8m9IsdmRUAhrYkkzixn1NZFPPzkFvfQRSBIEBE0qjdpAAfW6jxiCHE3GL/U2XmmrQx4sWaVl1Eijac/3+jXPsGLbbSosQmlSlZD+9JgLeLXQxQfSli1b9A1gByMWeo1ELlPf9pgvAjbydztirUTxWhSpxa6wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778194220; c=relaxed/simple;
	bh=7Krz7pN0WV1WEwE+SM/17Byvte7UfrNb2WulyP8M938=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KL2t4vweDo/aOsNxR4glQE8iILSWoUnqRDKGWPmY5p4CLgCZ3wUq0c3vVQ0K1pSYCBOKQYCCssVIewR5BRHkWt8zGp13Oitut34N5h8nFyz1sw4S8ej/h8nNA5cKndPAOglkF+PHOO06S7vonMCceDeWhDYsttQnlE4FYdk1aDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aEqAB1J2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RX84c+y5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647JrI3i2198979
	for <linux-media@vger.kernel.org>; Thu, 7 May 2026 22:50:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9MkPXhNFKpgj51RT3nXElFSkq09L7clUycFsPNU23WU=; b=aEqAB1J2DNsPcjx9
	jt6JhCscOwesf++9Opc/65eYqOp9+o9pH0P1OK0YX/DoQqFuGZkL6bKiMGyaGhBi
	PYIOBMk0+NKRy4Tc07QkEyMlUq3vNYLvjqJlmqHqwyLedYLUVGDy+dQOmVNMKj8m
	mHIa4qdfP9dcDxyrE0L0g8y0WhLJqpqMsJXW0Qa6W0Xw9uljkJ70x37gxigrp2ft
	MWo7nnRtFniQQMFnz7b2w6pA/+EYUq6F3cOvgdwXrb/ykr7CJPqHJdgbVw3MtgEu
	f4MPSYU8hA8KqaF7+CZV4meeTP7ow9Lss4NxwzHZVs3JtFCKDBC67E7ukK5cG97Y
	1N8SRQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e119sgg6h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 07 May 2026 22:50:17 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-95cc77982c5so4277156241.1
        for <linux-media@vger.kernel.org>; Thu, 07 May 2026 15:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778194217; x=1778799017; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9MkPXhNFKpgj51RT3nXElFSkq09L7clUycFsPNU23WU=;
        b=RX84c+y5180DBXRSkor5q/VBH98Zc5SnwB7x3xKVbxIEayRsx2JSYC434xN7OfTAIw
         8LQfeJ4544XSoh7IjBObFTtokzYachdLfh0OWVhN9JY9GjTh/4xTO/WtchVoe7aYY7u/
         WnZDkuDD/IrgMlikceSRDEBlwYfk6Ds+qWoBPvfTca6VtFlw73m1d8i3H4rfiyEaEcqD
         Kr7750m/nM3SNPwBvlPzhQRBeb0ipLHI9ftOcLYCkrGZihec5OpvYCTGUK7eUHPV9KyX
         4L3KV/VZJOXbowAZYvi0whJeHfltGeRqj+ya4Texw35MYLJyroyeBJ6AhF7qg8ydOifF
         Q4Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778194217; x=1778799017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9MkPXhNFKpgj51RT3nXElFSkq09L7clUycFsPNU23WU=;
        b=OCarvkmKUb1CpGqsAEko1zgT8VvQRWiSQ18DNmpdT9WypaLcizPMYF25Nhce7iHZgU
         3OllZ3xte/9nTr9wdospSjnCoU/CormQIWYcHrSrXQlfi/Eb5b+cFB7X4ggYbxgHzE11
         kKI2EllNXDFbLgeHUqvP7tO8/GxwAu+aEz1To1u3mXKOW0+lfuCVs0ZUKJJMNE9CsnSv
         sHt3jILktoQxl+dIGLWqDm8S+vj3YjyBT3/RY5N6QWZI5+qI0iJfAZbgBbx0u58zK/1r
         wX7yWheecXtenEXp0mI5/cHFgrQkdpQ+L1BM1Kxr8J7nv0Paq9EQsCyHQQe1iX1cug63
         RJdg==
X-Gm-Message-State: AOJu0YwsJ4N6oNjC5Fkh9f5NNK++nB8TyvOUH/PMDmRfvRX50IJlXcrg
	KrUBSSYWSjVNXwO5j4OCTuE7yjCfbnt6V6gG9oJ8z9SoTFmXvM8+rdieqDDdzLpfwufuYTZQVAD
	Yv0Rxa9NPln7/qr2l/6cOAo4EjIO9mGCb7o9CGt7NfkejCIHgOeJpHHrUZlWLLlNUj7f/LRbQ3g
	==
X-Gm-Gg: AeBDieteCRVWPXK19AsctGU5BrmMPAO/vrSKMN44l3EOUsQDiFqdP0XEwBpjCs9TJjJ
	bRIVRRZBGXgjqbAGdWSdfODgInTOL9osuM47xQxObkqGOkWRxS+ZxDk8pz85RuFqkDwj2brYqeb
	VYkmIZ5BS8c1sAE7NKGPMrWa0w8J/GYHC1kVd9d4WB6jHRMzjpJqQCkOG7rAQlVgo8YojaRYMMk
	GQMrdrbMIJbmFSEcZMP7kLZdz6g5d1zZf/LEkZrE92a/WnKSv288OlP0NM66jzC4A2JVqNy3j/L
	oDnbexZujNhfZiaZPSN6IsDen5J0IUf/U3uf9piL2WNi/d26hid9ILqCrHNOJW8G5/IctDv8E1f
	ZLnhCdCV4qL5TbA/CgSr+2vrtEbUynr2b+AO8apLv+YXzwZtAcQ7QZ3o/TkPyoeliiSfl/MN/LP
	5PGmw0aLmkIMnPh8denk+lf6Sqzok=
X-Received: by 2002:a05:6102:1497:b0:62f:4854:8c53 with SMTP id ada2fe7eead31-63115f8712cmr2441538137.12.1778194217103;
        Thu, 07 May 2026 15:50:17 -0700 (PDT)
X-Received: by 2002:a05:6102:1497:b0:62f:4854:8c53 with SMTP id ada2fe7eead31-63115f8712cmr2441524137.12.1778194216623;
        Thu, 07 May 2026 15:50:16 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:b16a:3475:ec42:bcfa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac4359dbesm102466b.48.2026.05.07.15.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 15:50:15 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 08 May 2026 00:49:19 +0200
Subject: [PATCH v3 04/15] media: qcom: camss: Add camss-isp-bufq helper
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260508-camss-isp-ope-v3-4-bb1055274603@oss.qualcomm.com>
References: <20260508-camss-isp-ope-v3-0-bb1055274603@oss.qualcomm.com>
In-Reply-To: <20260508-camss-isp-ope-v3-0-bb1055274603@oss.qualcomm.com>
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
        kieran.bingham@ideasonboard.com, johannes.goede@oss.qualcomm.com
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDIzMSBTYWx0ZWRfXwArhFL1JNh2r
 QO+Fmvhimo0YpoUbSDmUwAi6yKCukOb1l6yUVRZc5OQPZ73YygYEVAX6LOVHserYRUtkwn7tGK+
 Sl1nGEQLcHEBozuL9JuDoPZRoERn/HrgsOUxBQO5CKPKtdcXU4Ywnrp1JpNw0Qsbbj4uDoK8156
 g6qzl9x0TY7uYhofJ7xgaxWe0hOeL6Bkp3qlK6141jhHIyJ21OxEQD+/A2gyDGgpcmJQYJS1ObO
 HZ3pta6NikWnTSjXdGBrVlu8xLzw9AWtTithSNevh9MF2gmReV0FQnTdgE7251yzBR3wVAkAjWM
 A8f8lbEnfrdTEbpOKv4O/8ffMOGWL/ZYObRJsjM1cAA0o3VnU0vZkRJSFmBZODL/sKHabIS8Qpn
 VZ6rScpp3yi/P15oXBeiHBKXE9wSzdbn2P30TJWXGHQ+cSnXJ7UX3hcI+yM0nUhkdRnFnTCrUX2
 QMbM/96EiVeUwqjSfxQ==
X-Proofpoint-ORIG-GUID: -iL4bCgeErfIQ7bB0BE8GA6aKpumg9iV
X-Proofpoint-GUID: -iL4bCgeErfIQ7bB0BE8GA6aKpumg9iV
X-Authority-Analysis: v=2.4 cv=Dd4nbPtW c=1 sm=1 tr=0 ts=69fd1729 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=Rj2g1MzNgR17_EpZbusA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070231
X-Rspamd-Queue-Id: B9E3B4EFF00
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60867-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add a per-queue ready-buffer FIFO helper for CAMSS offline ISP drivers.
camss_isp_bufq provides N spinlock-protected FIFO lists of ready vb2
buffers, one per queue index. This can help multi-queues management
and synchronization in ISP context.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/Kconfig          |  14 +++
 drivers/media/platform/qcom/camss/Makefile         |   5 +
 drivers/media/platform/qcom/camss/camss-isp-bufq.c | 101 +++++++++++++++++
 drivers/media/platform/qcom/camss/camss-isp-bufq.h | 122 +++++++++++++++++++++
 4 files changed, 242 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/Kconfig b/drivers/media/platform/qcom/camss/Kconfig
index 4eda48cb1adf049a7fb6cb59b9da3c0870fe57f4..d77482f3f5eadc65856806b9b237d65ea484f267 100644
--- a/drivers/media/platform/qcom/camss/Kconfig
+++ b/drivers/media/platform/qcom/camss/Kconfig
@@ -7,3 +7,17 @@ config VIDEO_QCOM_CAMSS
 	select VIDEO_V4L2_SUBDEV_API
 	select VIDEOBUF2_DMA_SG
 	select V4L2_FWNODE
+
+config VIDEO_QCOM_CAMSS_ISP
+	tristate "Qualcomm CAMSS ISP common helpers"
+	depends on VIDEO_DEV
+	depends on MEDIA_CONTROLLER
+	select V4L2_ISP
+	select VIDEOBUF2_CORE
+	help
+	  Common helper library for Qualcomm CAMSS offline ISP drivers.
+	  Provides buffer queue management, job scheduling, MC pipeline
+	  topology builder, and ISP parameter buffer parsing.
+
+	  This module is selected automatically by drivers that need it.
+
diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index 5e349b4915130c71dbff90e73102e46dfede1520..bfc05db0eada1d801839ceb8a3b157baae613053 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -29,3 +29,8 @@ qcom-camss-objs += \
 		camss-format.o \
 
 obj-$(CONFIG_VIDEO_QCOM_CAMSS) += qcom-camss.o
+
+qcom-camss-isp-objs := camss-isp-bufq.o
+
+obj-$(CONFIG_VIDEO_QCOM_CAMSS_ISP) += qcom-camss-isp.o
+
diff --git a/drivers/media/platform/qcom/camss/camss-isp-bufq.c b/drivers/media/platform/qcom/camss/camss-isp-bufq.c
new file mode 100644
index 0000000000000000000000000000000000000000..b1dcf60afcc63d112eee7bd143f08a7b4aac9a18
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-isp-bufq.c
@@ -0,0 +1,101 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * camss-isp-bufq.c
+ *
+ * CAMSS ISP per-queue ready-buffer FIFO.
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/module.h>
+#include <linux/slab.h>
+
+#include "camss-isp-bufq.h"
+
+struct camss_isp_bufq *camss_isp_bufq_init(unsigned int num_queues)
+{
+	struct camss_isp_bufq *bufq;
+	unsigned int i;
+
+	bufq = kzalloc(struct_size(bufq, entries, num_queues), GFP_KERNEL);
+	if (!bufq)
+		return ERR_PTR(-ENOMEM);
+
+	bufq->num_queues = num_queues;
+
+	for (i = 0; i < num_queues; i++) {
+		INIT_LIST_HEAD(&bufq->entries[i].rdy_queue);
+		spin_lock_init(&bufq->entries[i].rdy_spinlock);
+	}
+
+	return bufq;
+}
+EXPORT_SYMBOL_GPL(camss_isp_bufq_init);
+
+void camss_isp_bufq_release(struct camss_isp_bufq *bufq)
+{
+	kfree(bufq);
+}
+EXPORT_SYMBOL_GPL(camss_isp_bufq_release);
+
+void camss_isp_bufq_queue(struct camss_isp_bufq *bufq, unsigned int queue_idx,
+			  struct vb2_v4l2_buffer *vbuf)
+{
+	struct camss_isp_buf *buf =
+		container_of(vbuf, struct camss_isp_buf, vb);
+	struct camss_isp_bufq_entry *entry = &bufq->entries[queue_idx];
+	unsigned long flags;
+
+	spin_lock_irqsave(&entry->rdy_spinlock, flags);
+	list_add_tail(&buf->list, &entry->rdy_queue);
+	entry->num_rdy++;
+	spin_unlock_irqrestore(&entry->rdy_spinlock, flags);
+}
+EXPORT_SYMBOL_GPL(camss_isp_bufq_queue);
+
+struct vb2_v4l2_buffer *camss_isp_bufq_next(struct camss_isp_bufq *bufq, unsigned int queue_idx)
+{
+	struct camss_isp_bufq_entry *entry = &bufq->entries[queue_idx];
+	struct camss_isp_buf *buf;
+	unsigned long flags;
+
+	spin_lock_irqsave(&entry->rdy_spinlock, flags);
+	buf = list_first_entry_or_null(&entry->rdy_queue,
+				       struct camss_isp_buf, list);
+	spin_unlock_irqrestore(&entry->rdy_spinlock, flags);
+
+	return buf ? &buf->vb : NULL;
+}
+EXPORT_SYMBOL_GPL(camss_isp_bufq_next);
+
+struct vb2_v4l2_buffer *camss_isp_bufq_remove(struct camss_isp_bufq *bufq, unsigned int queue_idx)
+{
+	struct camss_isp_bufq_entry *entry = &bufq->entries[queue_idx];
+	struct camss_isp_buf *buf;
+	unsigned long flags;
+
+	spin_lock_irqsave(&entry->rdy_spinlock, flags);
+	buf = list_first_entry_or_null(&entry->rdy_queue,
+				       struct camss_isp_buf, list);
+	if (buf) {
+		list_del(&buf->list);
+		entry->num_rdy--;
+	}
+	spin_unlock_irqrestore(&entry->rdy_spinlock, flags);
+
+	return buf ? &buf->vb : NULL;
+}
+EXPORT_SYMBOL_GPL(camss_isp_bufq_remove);
+
+void camss_isp_bufq_drain(struct camss_isp_bufq *bufq, unsigned int queue_idx,
+			  enum vb2_buffer_state state)
+{
+	struct vb2_v4l2_buffer *vbuf;
+
+	while ((vbuf = camss_isp_bufq_remove(bufq, queue_idx)))
+		camss_isp_buf_done(vbuf, state);
+}
+EXPORT_SYMBOL_GPL(camss_isp_bufq_drain);
+
+MODULE_DESCRIPTION("CAMSS ISP per-queue ready-buffer FIFO");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/platform/qcom/camss/camss-isp-bufq.h b/drivers/media/platform/qcom/camss/camss-isp-bufq.h
new file mode 100644
index 0000000000000000000000000000000000000000..1a8bc7b112a1b039233cfc7be573f1f40fcda7c9
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-isp-bufq.h
@@ -0,0 +1,122 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * camss-isp-bufq.h
+ *
+ * CAMSS ISP per-queue ready-buffer FIFO.
+ *
+ * Provides N spinlock-protected FIFO lists of ready vb2 buffers, one per
+ * queue index.  Drivers call these helpers from their vb2 ops and job
+ * completion paths.
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef CAMSS_ISP_BUFQ_H
+#define CAMSS_ISP_BUFQ_H
+
+#include <linux/list.h>
+#include <linux/spinlock.h>
+#include <linux/types.h>
+#include <media/videobuf2-v4l2.h>
+
+/**
+ * struct camss_isp_buf - vb2 buffer wrapper
+ *
+ * Use as vb2_queue.buf_struct_size so buffers can be placed on the
+ * ready lists managed by camss_isp_bufq.
+ *
+ * @vb:   The vb2 V4L2 buffer — must be first.
+ * @list: Entry in the per-queue ready list.
+ */
+struct camss_isp_buf {
+	struct vb2_v4l2_buffer	vb;	/* must be first */
+	struct list_head	list;
+};
+
+/**
+ * struct camss_isp_bufq_entry - per-queue ready-buffer state (opaque)
+ */
+struct camss_isp_bufq_entry {
+	struct list_head	rdy_queue;
+	spinlock_t		rdy_spinlock;
+	u32			num_rdy;
+};
+
+/**
+ * struct camss_isp_bufq - multi-queue ready-buffer state
+ *
+ * Allocate with camss_isp_bufq_init(), free with camss_isp_bufq_release().
+ *
+ * @num_queues: Number of entries in @entries.
+ * @entries:    Per-queue state; flexible array.
+ */
+struct camss_isp_bufq {
+	unsigned int			num_queues;
+	struct camss_isp_bufq_entry	entries[] __counted_by(num_queues);
+};
+
+/**
+ * camss_isp_bufq_init() - allocate a multi-queue ready-buffer state
+ * @num_queues: number of per-queue FIFO lists to create
+ *
+ * Returns a pointer to the new bufq or ERR_PTR on allocation failure.
+ */
+struct camss_isp_bufq *camss_isp_bufq_init(unsigned int num_queues);
+
+/**
+ * camss_isp_bufq_release() - free a bufq allocated with camss_isp_bufq_init()
+ * @bufq: bufq to free
+ */
+void camss_isp_bufq_release(struct camss_isp_bufq *bufq);
+
+/**
+ * camss_isp_bufq_queue() - append a buffer to the ready list for @queue_idx
+ * @bufq:      target bufq
+ * @queue_idx: queue index (must be < bufq->num_queues)
+ * @vbuf:      buffer to enqueue; must be embedded in a &struct camss_isp_buf
+ */
+void camss_isp_bufq_queue(struct camss_isp_bufq *bufq, unsigned int queue_idx,
+			   struct vb2_v4l2_buffer *vbuf);
+
+/**
+ * camss_isp_bufq_next() - peek at the head of the ready list without removing
+ * @bufq:      target bufq
+ * @queue_idx: queue index
+ *
+ * Returns the head buffer or NULL if the list is empty.
+ */
+struct vb2_v4l2_buffer *camss_isp_bufq_next(struct camss_isp_bufq *bufq,
+					     unsigned int queue_idx);
+
+/**
+ * camss_isp_bufq_remove() - dequeue and return the head of the ready list
+ * @bufq:      target bufq
+ * @queue_idx: queue index
+ *
+ * Returns the dequeued buffer or NULL if the list is empty.
+ */
+struct vb2_v4l2_buffer *camss_isp_bufq_remove(struct camss_isp_bufq *bufq,
+					       unsigned int queue_idx);
+
+/**
+ * camss_isp_bufq_drain() - return all ready buffers with the given state
+ * @bufq:      target bufq
+ * @queue_idx: queue index
+ * @state:     vb2 state to pass to vb2_buffer_done() for each buffer
+ */
+void camss_isp_bufq_drain(struct camss_isp_bufq *bufq, unsigned int queue_idx,
+			   enum vb2_buffer_state state);
+
+static inline u32 camss_isp_bufq_num_ready(struct camss_isp_bufq *bufq,
+					    unsigned int queue_idx)
+{
+	return bufq->entries[queue_idx].num_rdy;
+}
+
+static inline void camss_isp_buf_done(struct vb2_v4l2_buffer *vbuf,
+				       enum vb2_buffer_state state)
+{
+	vb2_buffer_done(&vbuf->vb2_buf, state);
+}
+
+#endif /* CAMSS_ISP_BUFQ_H */

-- 
2.34.1


