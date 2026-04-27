Return-Path: <linux-media+bounces-59672-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOg9KU5b72mWAgEAu9opvQ
	(envelope-from <linux-media+bounces-59672-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 14:49:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 297BD472C0E
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 14:49:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C905630221DE
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 12:47:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A58ED3BA244;
	Mon, 27 Apr 2026 12:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="onozB9Fk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AlmHr04M"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C003BC687
	for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 12:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777294008; cv=none; b=qMbrDiWLegyJtbgfH60HL3U25cFat5p+nySdXRrtXj6Xk80KyrFuWGehGelwZtGPAUwHz7JgHG5mxrUJhgLEAThOKiwfQGPzn7QWXYpPbnsbrqNtCVA2ufRJb+W1zEZZ43vi30u6JBOoR0+1plDTcFE5B1Bz5vqP0WiYJATa4cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777294008; c=relaxed/simple;
	bh=WcsQ1A2YxNcqZOtl9cSQ1R0tPKuBbn7v12WXFUOf7gA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sJAUlwvtBXTH9sIIM5ZnrALbCICR5BN0v7oXKL4usJTMVefTyCu8PSPMAiSUxHaHCHoaIs6dXBvt7XFsngU86RhKc+gMnGnuy0z3VYZBlRepBPzxgJlp5pASwAYYKomGIndKjsisSSv3IqBEyfwzd4NNuWZZJ8LA2rzNq7S4JCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=onozB9Fk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AlmHr04M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R9Oc2d3825223
	for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 12:46:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	51hUPVD+vSajWa56BxpGzwnPphsgTAXfhVqxxWUWJ2A=; b=onozB9Fk2So+31yc
	6n8zto0WVmWOWM7tC3ZnIxzQGo0enUF+9w9nizPp6/tIgDiw1YfKZExvV1VxAvIH
	VwUaxVxQiaMtf2Lx77RBQAEhfjpi1WnuL9zz4YEWcN7aH605q5wu8kcNaKKx+DrP
	WsllUYQHuvEWsZsMz5qoUlLhb2ghlAPu0kW+f0riXoDZWRDvLalwk9B89GxLftl/
	lkBTzSqhp66uwbDUjHc9izohJxouSL4pKrF0soAl8VD2kJapUvmnS97GZ0EuJBHC
	nF9l98pA4r6eQWDaxWC12GgOhVL3MmZjQihDDwodxg7Sx42frZFtvk3OBnim5/bd
	CbyFfQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt5550r1c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 12:46:46 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d812c898cso270493841cf.1
        for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 05:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777294005; x=1777898805; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=51hUPVD+vSajWa56BxpGzwnPphsgTAXfhVqxxWUWJ2A=;
        b=AlmHr04M38iTcj87LzwsNtybHGwHYg9Uqf4Po6ZlgVzof83CyGpRzj0X8tQaLMBMkU
         pJK+u3KlruQXRdguVWww3eGlS8Ne0dGWdLbNqiBj2gSOZ3dj1g1RtApLu5JOt9IKrVJz
         Qrr9ePePQ2TY0KexStWgSwhu0LHwpRH0IRpIDZMRomnblYB/k7cFG3rW1otQ9xvbkI20
         2evT8gU9pS2Bu8eelEskXo4ZQoHMhfsjK6dZE0gby/qjRNInK0IwOOV/42tw26rGr9pN
         jkvTksdo5684KVeXz+vmmzOM/6S/xXAvoU8C9+vsTHCwj54UOtsxWa3oeip1MGFwbW71
         IGAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777294005; x=1777898805;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=51hUPVD+vSajWa56BxpGzwnPphsgTAXfhVqxxWUWJ2A=;
        b=I/HEbMpDnB48+88qK3oyvkK6TLOuvL/OixoVjFcTtqnPB6vHBHtrSCkeU1rcHcgPCg
         6kJaXjpsHX1g6+Ht0E0AVCMO4n8g6b0coidmDc2+toNXPp1VOLXacNuN8r8dX+zPkSAE
         0GecvRwDktS/hIexRli/HuG1xDeWPOI/X357YTYQk38dM3r40AInbxaxxYNAiTaEAlYb
         0oSm4wKHDv/8Pu98sTMFi8Wzu04K6mac+IYNM+6JkshDFixy1yTRdxZp/dWmwGKTdYA8
         OCVSCPAr2hfvGZNyp6or0bq7yauB46iBT2+KdWo59YzoeeCec/AtjIbnV/ofh08eHEgt
         j0WA==
X-Gm-Message-State: AOJu0YxJYul8cje0K3sXbRHhmPXZdCyUZZWkgdjYZsZPgFqd4xnNf+vJ
	/02qBlUx2bTfCDT8dvHiVC6O5ocn8T2UuHxAAP40IY2zxPXApLXIg6J7oqf4K+jkqob9MkKsH4X
	EdR7f06LETNFcum198yvvzYHTktfzORDeHV/6GTKo94Z0K2mCm9+kg636LOK0S2k1Mg==
X-Gm-Gg: AeBDietPKcZNnpoAswEhqHJd2RUlgNu7JiwT5lnIAfL/L+1Wpp/eOpBvwvJgwXd7btd
	gPfMW4ypaSzwk2ByX8lJOYxuMPjp59Mj8eSlcTvRwkvayBUaknkE2tOIczeusmvasB7UPgMThyP
	b10S2WpZAmisEoztGH1QjDTqTdOkysZi+Z9L03yClznApMRCDYbS2o26NM4psPxvkB6z/KHYfGL
	P+sTZwQH5XcwOKNvpaMWxNYYk+Ibhq/Q7FywlnZVqVJuSzOFw0CK3VJAMi8dCy7+bR0Day6EvpK
	WhwLvFG691Uy/GhyMURTQAWqhW1dWLalppRonIoT2ixBiSSlbUqPTEDMu1gZ3kpVK+saDexV1sR
	AkS2lr9QwigZHMi5akUTZUkJ9lxzYqaKOWiMeoOxG9Qw8r44XKF1eOqBOp5fQMnHroX85y+N79d
	6uBr9nK4QZ+qaiph24yz0KbKOrWLU=
X-Received: by 2002:a05:622a:8404:10b0:50e:57de:40d7 with SMTP id d75a77b69052e-50e57de4894mr368758161cf.19.1777294005363;
        Mon, 27 Apr 2026 05:46:45 -0700 (PDT)
X-Received: by 2002:a05:622a:8404:10b0:50e:57de:40d7 with SMTP id d75a77b69052e-50e57de4894mr368757181cf.19.1777294004003;
        Mon, 27 Apr 2026 05:46:44 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:653f:4d28:6a78:a6ca])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba454d1bd19sm1091496866b.37.2026.04.27.05.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 05:46:43 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 14:43:32 +0200
Subject: [PATCH v2 05/14] media: qcom: camss: Add camss-isp-bufq helper
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260427-camss-isp-ope-v2-5-f430e7485009@oss.qualcomm.com>
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
X-Proofpoint-GUID: -lefIaO50DaOa_vVFHD-9-74ao_XGSqh
X-Authority-Analysis: v=2.4 cv=CJEamxrD c=1 sm=1 tr=0 ts=69ef5ab6 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=jGd-OSDL_v5yqi5i-noA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEzNSBTYWx0ZWRfX1idES0xEOSr8
 qJ3DyGYvYW+ulP704TMYsKJ/Kl+5WjZPZce4biyAp3F7libYef4eMbhphiUYfOSkGPexlkt+nAs
 Ncwx2CrE2OKwzoHAYTQrNSj/CvOP843cfO4CAktl5ACiKykl3g3pBc2uBvJLstNHCPnAyvyyqCD
 mqwCc33UDQX8mYbIxsqZLxuBQYH27snqxxNED+z96U/hQsyWraRtb66hrFVFClJvN1QGP7DxUKe
 dlTaaMsgulr7WsTRcyHDgh4X7YE7DtiLgYJ+a8vAqMsfyTSbJ5CAyP4paP8yu0HybLgZCT7cGkU
 zpca0KaRIrA0szPgifruz5Hjacw8O95qkjKTt+R7xyoL9/Jrfy5vIWqzW1fIJVURuIevaxD2t8u
 IIlSUFOpT7Q624N3EALn9QtUtpnJkDSlRFsN9loWgFytg+KAx1Jc/CW2iW6Myu6u1iaejGL7qk8
 c0eWP7R+fu58E/5QFLQ==
X-Proofpoint-ORIG-GUID: -lefIaO50DaOa_vVFHD-9-74ao_XGSqh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270135
X-Rspamd-Queue-Id: 297BD472C0E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-59672-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Add a per-queue ready-buffer FIFO helper for CAMSS offline ISP drivers.
camss_isp_bufq provides N spinlock-protected FIFO lists of ready vb2
buffers, one per queue index. This can help multi-queues management
and synchronization in ISP context.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/Kconfig          |  14 +++
 drivers/media/platform/qcom/camss/Makefile         |   5 +
 drivers/media/platform/qcom/camss/camss-isp-bufq.c | 101 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-isp-bufq.h |  85 +++++++++++++++++
 4 files changed, 205 insertions(+)

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
index 0000000000000000000000000000000000000000..2f04e38cb1cd198f180d744b0b9869b6f2b8ef46
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-isp-bufq.h
@@ -0,0 +1,85 @@
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
+struct camss_isp_bufq *camss_isp_bufq_init(unsigned int num_queues);
+void camss_isp_bufq_release(struct camss_isp_bufq *bufq);
+
+void camss_isp_bufq_queue(struct camss_isp_bufq *bufq, unsigned int queue_idx,
+			   struct vb2_v4l2_buffer *vbuf);
+
+struct vb2_v4l2_buffer *camss_isp_bufq_next(struct camss_isp_bufq *bufq,
+					     unsigned int queue_idx);
+
+struct vb2_v4l2_buffer *camss_isp_bufq_remove(struct camss_isp_bufq *bufq,
+					       unsigned int queue_idx);
+
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


