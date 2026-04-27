Return-Path: <linux-media+bounces-59676-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMqiOcdb72llAgEAu9opvQ
	(envelope-from <linux-media+bounces-59676-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 14:51:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A512E472CFD
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 14:51:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B8C0430598DB
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 12:47:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D16D3B9D91;
	Mon, 27 Apr 2026 12:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jgLRx+rz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RQsIWcUl"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6663BD22C
	for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 12:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777294015; cv=none; b=gFI4QC0WTnIlIpPDoQrU6nVD8Hh/sLF1zz02RfWAdvFKY3qBAyfeGrnHsCpAPiPzqZWq+llV2vqzlbJeE41/cvPFZ1+IDI48+ww3Z+FaTd7bmuc7XbkQ1DGpet3E35ocOSFvwgXlz5dydkz8JcUW3p9m4yP/uWA6hMpdxpXJgyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777294015; c=relaxed/simple;
	bh=BEE5xtYLMIHM5H/+X+OLu6ImhtuWkEKhW4lS9LNnceo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uScEOZ0kMPUDqxt5GZkKYXX0HKOLLgZcbRnQ1FmTa5YyGioEHnixvSqZHHuVRLBtZp9aeeQY54Aby9OFG2HAo4MXaLR+GgD48A5bPpl0MvtD1/uhri9UDROvr74QUKOp8pYpybAZlrjPAzc8dczAE8XGqMn0G5TgNJmsaFM9jFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jgLRx+rz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RQsIWcUl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TBhs2793126
	for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 12:46:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hJybU2elZh0mwCIYOkkkEG3pKmTbc3qa3OZ8DwGiHk4=; b=jgLRx+rzZgP4KP5M
	AVIpy+VUCzJW4b6Ru3qG4RzGzz8ug7kFG4hWUipt5DZ3bjBDf5vVynPEVpgwBVR+
	1VUJWJnlPyqclak3UHjX+FqPdhe6SZRrIdGE5vn/BcJTvoczNA1YLFB0K06pjRx5
	eiGU9KZAfQcuk5GIsI6n2qxBM1CLBsOXwDcbWGIQaDZHE++7/n+mTTX/6zNeTroG
	MOUI4HRwhrCmAu/5eWleYB9ZNlSccS4dlXuereGrEuwtDz7MKMKXEghKgeql/sB8
	ceapq30dqZ5LrVYz1fYXYDvdC95cHRiwucsvoXNs8Cy5/NWWG99c6T6Wxn8N5VaB
	Fl4NQw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dsa4uv6wg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 12:46:50 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d812c898cso270494711cf.1
        for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 05:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777294008; x=1777898808; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hJybU2elZh0mwCIYOkkkEG3pKmTbc3qa3OZ8DwGiHk4=;
        b=RQsIWcUlZepwL3U8bJ0EUX5nOTdCwCwRrfcClmWcw2ed4S7Iu5YyaSd0dD9cJm7KrG
         ZdgfxS/uROnrjKSyP61al9igkd6J2ltTkSbxwlevdNKWagYE3vKCxJDLljQwK8wkxSZq
         2cjI90eM2l4LTmf7Y0FOcUNdLOj3A/z2KccEyeze0pHukgdYQXMfDVOZeJDTIYTW41o8
         7fKAzMBVK+BgQerMLqSK6pSQgAUhM7CPpqvhubrZEp33/6Ky5erjZGxWQyls4svvR+ba
         nHrSW8szBFGdckkmp/HvF6KreArYAZAUGqvbBqI27E9SbQC34xLHr6HfW7CnJ/Qh5Rqg
         M8HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777294008; x=1777898808;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hJybU2elZh0mwCIYOkkkEG3pKmTbc3qa3OZ8DwGiHk4=;
        b=bL22Qvl2shnFxNBUGSPs0XzkGcOhpBB5183pxtrGU0WrtI82q5D6s/Nv1tPNu1trKE
         VpIQ+GN4Jvns+WExlus5SrPvD4Yu4S6pdiIbQm5sUrVD0sjIvwW0kLYjWzbHDOKPn405
         8WXNshCPkmWFfXdOuJFCIgxW2IW2r0RAjfI/TOr+Vzo5S5j74QLZXk5fQAJ7b6O3OBdS
         HHj2XFcGqkxWGiStvVPgN8rRmGd+5Fesm8Y7elIk3ypiUZERj/ftuhsqx+uPV4wam2jo
         oRU2qS2HocZQog+KXSBNmnARDYwY7WfTWVvluiqwFuh5fCYUbxUIhItok+h+rCM6w0gm
         QOXw==
X-Gm-Message-State: AOJu0YxTQ1AgkavBM9g4d5whhTAXkNb5rQNE+zkag9kwNl/e0lgADm2O
	qv+JDfeoQmGhf5YWJl6JQPnKgrDyV68k3J9tYCCDUpl8TpyD+mv3jkj39ixNjAxF0qEdRcRc5i7
	inmunGFEKPdVjExav34VAba9Wh6P5VG4SZojrgYbrI5byCvVwI3Uelt5Kiw3Gb/Cw+A==
X-Gm-Gg: AeBDies34OzPU38+Xl7CZ1kkecPprYOwmcG85LskazhpGtPxK438WmZhbJAhoEOWAlF
	99WHcN5v54C4tMrRz+RTDHeBLrH6afNMfBRw8bq68dmy74maFAIuCUBeUxSiAJaPAOACEMzSBiI
	xoq4IaDExc4H5rL33DfPTs7uvM8Q9PA26ONRP+e7p1y5/4c2WxRmUVSlTJiDkrO8pmkM9bdRgSh
	yll3US6sUef4IsPM/FbawORp8o65kBEreFOWnqNPDaknzpAbBgE+fBiO7xfTnKiut9jTnEaK0AB
	YMtKbSKVEyeGiElMsJr4mEXbp6lVHkz/foI1l9qShEuRuKGoOXVlYjZqY+yO5TBgjs+nsJokjCt
	tv0ZUN2HRH2dpogEOmW4XrDr1kM+kF/KRpjAp9b8xw8WEMtSoJq+PdfekZgWWstOY/xmRDKBLKi
	1+WeNSQGS1uL6FCGfyc8ID0Ebzk04=
X-Received: by 2002:ac8:5f09:0:b0:50f:ae67:96df with SMTP id d75a77b69052e-50fae679938mr458565981cf.50.1777294008249;
        Mon, 27 Apr 2026 05:46:48 -0700 (PDT)
X-Received: by 2002:ac8:5f09:0:b0:50f:ae67:96df with SMTP id d75a77b69052e-50fae679938mr458565501cf.50.1777294007639;
        Mon, 27 Apr 2026 05:46:47 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:653f:4d28:6a78:a6ca])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba454d1bd19sm1091496866b.37.2026.04.27.05.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 05:46:46 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 14:43:34 +0200
Subject: [PATCH v2 07/14] media: qcom: camss: Add camss-isp-pipeline helper
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260427-camss-isp-ope-v2-7-f430e7485009@oss.qualcomm.com>
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
X-Proofpoint-GUID: 2PfTqyr5xpYdIQdXgUvh0-Nlp5GvZ3zP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEzNSBTYWx0ZWRfX2ctajH/u2dR1
 xisImMqzNTwNFjw48a/hR5gltRrEZAU6u5mi1n4D6U1AWLWdGXdaEdIovAtl4IcAax9IQSRYEZr
 lHy/EbQ3a8EaSP3QppI5HkGXlfYutG+p5Cugjfl769HIa5N5P1+Mx5Zp1BsEb7VXDQZDFJ99yLu
 skfaivnH2N9uYw2iiq7gOAKbTlmBbrbAXF/amQnloi26UyxejjW32KA9rpNTs4TqUwfFQzn/5mz
 cIa4N8a3CG8Dluinw2qS4NOdPfpUWnE5Ncf3fZ/PiQmsP4luTk+9FWnMKPOD2Q26cSsNbEDrbvy
 LJtWZsy0h7vwfhgR56AZjMx8cHI0OngPR7vOLsoYOQxSrvhKWEkt10YXOrlVl/LGqW+Cph2AJ7U
 ujSVQuA+NoQWtQnOY4mTLZkldzxitd3p3t/kdJbdSomztQHy+3XpeeCK3ASOdvjePd3n+Owv7SF
 5DOuVyYG4V0S+jSSxcw==
X-Proofpoint-ORIG-GUID: 2PfTqyr5xpYdIQdXgUvh0-Nlp5GvZ3zP
X-Authority-Analysis: v=2.4 cv=J/GaKgnS c=1 sm=1 tr=0 ts=69ef5aba cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=0HvUUkHzQstEScuQiJkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270135
X-Rspamd-Queue-Id: A512E472CFD
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
	TAGGED_FROM(0.00)[bounces-59676-lists,linux-media=lfdr.de];
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

Add a declarative MC topology builder for CAMSS offline ISP drivers.
Drivers describe their entire media graph, entities (video devices,
subdevs, or base entities), their pads, and the links between them
in a static descriptor table. The builder validates the table,
allocates and registers all entities, and creates all MC pad links.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/Makefile         |   3 +-
 .../media/platform/qcom/camss/camss-isp-pipeline.c | 361 +++++++++++++++++++++
 .../media/platform/qcom/camss/camss-isp-pipeline.h | 228 +++++++++++++
 3 files changed, 591 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index f13c9f326cf81962bd165dc8dd2bb60207cd54a7..f3acb1b54b6c1455d72e2d947c860f0c337648de 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -31,7 +31,8 @@ qcom-camss-objs += \
 obj-$(CONFIG_VIDEO_QCOM_CAMSS) += qcom-camss.o
 
 qcom-camss-isp-objs := camss-isp-bufq.o \
-		camss-isp-sched.o
+		camss-isp-sched.o \
+		camss-isp-pipeline.o
 
 obj-$(CONFIG_VIDEO_QCOM_CAMSS_ISP) += qcom-camss-isp.o
 
diff --git a/drivers/media/platform/qcom/camss/camss-isp-pipeline.c b/drivers/media/platform/qcom/camss/camss-isp-pipeline.c
new file mode 100644
index 0000000000000000000000000000000000000000..8e44bedb0a41e3cf4fc7e3a138c1f48854f5efc8
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-isp-pipeline.c
@@ -0,0 +1,361 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * CAMSS ISP pipeline helper — declarative MC topology builder
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/slab.h>
+
+#include <media/media-device.h>
+#include <media/media-entity.h>
+#include <media/v4l2-dev.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-subdev.h>
+#include "camss-isp-pipeline.h"
+
+#if !IS_ENABLED(CONFIG_MEDIA_CONTROLLER)
+static inline int media_entity_pads_init(struct media_entity *e, u16 n,
+					 struct media_pad *p) { return 0; }
+static inline void media_entity_remove_links(struct media_entity *e) {}
+static inline int media_create_pad_link(struct media_entity *src, u16 sp,
+					struct media_entity *sink, u16 dp,
+					u32 flags) { return 0; }
+#endif
+
+/* -------- Internal elpers -------- */
+
+static enum vfl_devnode_direction isp_caps_to_vfl_dir(u32 caps)
+{
+	if (caps & (V4L2_CAP_VIDEO_M2M | V4L2_CAP_VIDEO_M2M_MPLANE))
+		return VFL_DIR_M2M;
+	if (caps & (V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_VIDEO_OUTPUT_MPLANE |
+		    V4L2_CAP_META_OUTPUT | V4L2_CAP_VBI_OUTPUT | V4L2_CAP_SDR_OUTPUT))
+		return VFL_DIR_TX;
+	return VFL_DIR_RX;
+}
+
+static unsigned int isp_count_pads(const struct camss_isp_pad_desc *pads)
+{
+	unsigned int n = 0;
+
+	if (!pads)
+		return 0;
+	while (pads[n].flags)
+		n++;
+	return n;
+}
+
+static struct media_entity *isp_pipeline_media_entity(struct camss_isp_pipeline *pipeline,
+						      unsigned int idx)
+{
+	struct camss_isp_pipeline_entity *slot = &pipeline->entities[idx];
+
+	switch (slot->obj_type) {
+	case MEDIA_ENTITY_TYPE_VIDEO_DEVICE:
+		return &slot->vdev.entity;
+	case MEDIA_ENTITY_TYPE_V4L2_SUBDEV:
+		return &slot->subdev.entity;
+	default:
+		return &slot->entity;
+	}
+}
+
+/* -------- Validation -------- */
+
+static int isp_pipeline_validate(struct device *dev,
+				 const struct camss_isp_entity_desc *descs,
+				 unsigned int num_entities)
+{
+	unsigned int i, pi;
+
+	for (i = 0; i < num_entities; i++) {
+		const struct camss_isp_pad_desc *pads = descs[i].pads;
+		unsigned int num_pads = isp_count_pads(pads);
+
+		for (pi = 0; pi < num_pads; pi++) {
+			const struct camss_isp_pad_desc *pad = &pads[pi];
+			const struct camss_isp_pad_desc *peer_pad;
+			unsigned int peer_num_pads;
+			int peer_ent = pad->peer_entity;
+
+			if (peer_ent < 0)
+				continue;
+
+			if ((unsigned int)peer_ent >= num_entities) {
+				dev_err(dev, "entity[%u].p%u: peer_entity %d out of range\n",
+					i, pi, peer_ent);
+				return -EINVAL;
+			}
+
+			peer_num_pads = isp_count_pads(descs[peer_ent].pads);
+			if (pad->peer_pad >= peer_num_pads) {
+				dev_err(dev, "entity[%u].p%u: peer_pad %u out of range\n",
+					i, pi, pad->peer_pad);
+				return -EINVAL;
+			}
+
+			peer_pad = &descs[peer_ent].pads[pad->peer_pad];
+
+			/* Links are SOURCE->SINK; reject SOURCE->SOURCE or SINK->SINK */
+			if (((pad->flags & MEDIA_PAD_FL_SOURCE) &&
+			     (peer_pad->flags & MEDIA_PAD_FL_SOURCE)) ||
+			    ((pad->flags & MEDIA_PAD_FL_SINK) &&
+			     (peer_pad->flags & MEDIA_PAD_FL_SINK))) {
+				dev_err(dev, "entity[%u].p%u -> entity[%d].p%u: invalid\n",
+					i, pi, peer_ent, pad->peer_pad);
+				return -EINVAL;
+			}
+
+			/* Verify back-reference consistency */
+			if (peer_pad->peer_entity >= 0 &&
+			    ((unsigned int)peer_pad->peer_entity != i ||
+			     peer_pad->peer_pad != pi)) {
+				dev_err(dev, "entity[%u].p%u <-> entity[%d].p%u: mismatch\n",
+					i, pi, peer_ent, pad->peer_pad);
+				return -EINVAL;
+			}
+		}
+	}
+
+	return 0;
+}
+
+/* -------- Allocation / Release -------- */
+
+struct camss_isp_pipeline *camss_isp_pipeline_alloc(unsigned int num_entities)
+{
+	struct camss_isp_pipeline *pipeline;
+
+	pipeline = kzalloc(struct_size(pipeline, entities, num_entities),
+			   GFP_KERNEL);
+	if (!pipeline)
+		return ERR_PTR(-ENOMEM);
+
+	pipeline->num_entities = num_entities;
+	return pipeline;
+}
+EXPORT_SYMBOL_GPL(camss_isp_pipeline_alloc);
+
+void camss_isp_pipeline_free(struct camss_isp_pipeline *pipeline)
+{
+	kfree(pipeline);
+}
+EXPORT_SYMBOL_GPL(camss_isp_pipeline_free);
+
+/* -------- Registration -------- */
+
+void camss_isp_pipeline_unregister(struct camss_isp_pipeline *pipeline)
+{
+	int i;
+
+	/* Unregister entities in reverse order */
+	for (i = (int)pipeline->num_entities - 1; i >= 0; i--) {
+		struct camss_isp_pipeline_entity *slot = &pipeline->entities[i];
+
+		switch (slot->obj_type) {
+		case MEDIA_ENTITY_TYPE_VIDEO_DEVICE:
+			if (slot->vdev.name[0])
+				video_unregister_device(&slot->vdev);
+			break;
+		case MEDIA_ENTITY_TYPE_V4L2_SUBDEV:
+			if (slot->subdev.name[0])
+				v4l2_device_unregister_subdev(&slot->subdev);
+			break;
+		case MEDIA_ENTITY_TYPE_BASE:
+			if (slot->entity.name) {
+				media_entity_remove_links(&slot->entity);
+				media_device_unregister_entity(&slot->entity);
+			}
+			break;
+		}
+
+		kfree(slot->pads);
+		slot->pads = NULL;
+	}
+
+	pipeline->v4l2_dev = NULL;
+}
+EXPORT_SYMBOL_GPL(camss_isp_pipeline_unregister);
+
+static int isp_register_vdev(struct camss_isp_pipeline_entity *slot,
+			     const struct camss_isp_entity_desc *desc,
+			     struct v4l2_device *v4l2_dev)
+{
+	struct video_device *vdev = &slot->vdev;
+	int ret;
+
+	strscpy(vdev->name, desc->name, sizeof(vdev->name));
+	vdev->vfl_dir     = isp_caps_to_vfl_dir(desc->vdev.caps);
+	vdev->v4l2_dev    = v4l2_dev;
+	vdev->device_caps = desc->vdev.caps;
+	vdev->release     = video_device_release_empty;
+	if (desc->vdev.fops)
+		vdev->fops = desc->vdev.fops;
+	if (desc->vdev.ioctl_ops)
+		vdev->ioctl_ops = desc->vdev.ioctl_ops;
+
+	vdev->entity.obj_type = MEDIA_ENTITY_TYPE_VIDEO_DEVICE;
+	vdev->entity.function = desc->function ? desc->function : MEDIA_ENT_F_IO_V4L;
+
+	ret = media_entity_pads_init(&vdev->entity, slot->num_pads, slot->pads);
+	if (ret)
+		return ret;
+
+	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
+	if (ret)
+		return ret;
+
+	video_set_drvdata(vdev, desc->vdev.drvdata);
+
+	return 0;
+}
+
+static int isp_register_subdev(struct camss_isp_pipeline_entity *slot,
+			       const struct camss_isp_entity_desc *desc,
+			       struct v4l2_device *v4l2_dev)
+{
+	struct v4l2_subdev *sd = &slot->subdev;
+	int ret;
+
+	v4l2_subdev_init(sd, desc->subdev.ops);
+	strscpy(sd->name, desc->name, sizeof(sd->name));
+	sd->entity.function = desc->function ?
+			      desc->function : MEDIA_ENT_F_V4L2_SUBDEV_UNKNOWN;
+
+	ret = media_entity_pads_init(&sd->entity, slot->num_pads, slot->pads);
+	if (ret)
+		return ret;
+
+	return v4l2_device_register_subdev(v4l2_dev, sd);
+}
+
+static int isp_register_base_entity(struct camss_isp_pipeline_entity *slot,
+				    const struct camss_isp_entity_desc *desc,
+				    struct v4l2_device *v4l2_dev)
+{
+	struct media_entity *entity = &slot->entity;
+	int ret;
+
+	entity->obj_type = MEDIA_ENTITY_TYPE_BASE;
+	entity->name     = desc->name;
+	entity->function = desc->function;
+
+	ret = media_entity_pads_init(entity, slot->num_pads, slot->pads);
+	if (ret)
+		return ret;
+
+	return media_device_register_entity(v4l2_dev->mdev, entity);
+}
+
+static int isp_alloc_pads(struct camss_isp_pipeline_entity *slot,
+			  const struct camss_isp_entity_desc *desc)
+{
+	unsigned int num_pads = isp_count_pads(desc->pads);
+	unsigned int i;
+
+	if (!num_pads)
+		goto done;
+
+	slot->pads = kcalloc(num_pads, sizeof(*slot->pads), GFP_KERNEL);
+	if (!slot->pads)
+		return -ENOMEM;
+
+	for (i = 0; i < num_pads; i++)
+		slot->pads[i].flags = desc->pads[i].flags;
+done:
+	slot->num_pads = num_pads;
+	return 0;
+}
+
+int camss_isp_pipeline_register(struct camss_isp_pipeline *pipeline,
+				struct v4l2_device *v4l2_dev,
+				const struct camss_isp_entity_desc *descs,
+				unsigned int num_entities)
+{
+	unsigned int i, pi;
+	int ret;
+
+	if (WARN_ON(num_entities != pipeline->num_entities))
+		return -EINVAL;
+
+	if (WARN_ON(!v4l2_dev || !v4l2_dev->mdev))
+		return -EINVAL;
+
+	ret = isp_pipeline_validate(v4l2_dev->dev, descs, num_entities);
+	if (ret)
+		return ret;
+
+	pipeline->v4l2_dev = v4l2_dev;
+
+	/* Register each entity */
+	for (i = 0; i < num_entities; i++) {
+		const struct camss_isp_entity_desc *desc = &descs[i];
+		struct camss_isp_pipeline_entity *slot = &pipeline->entities[i];
+
+		slot->obj_type = desc->obj_type;
+
+		ret = isp_alloc_pads(slot, desc);
+		if (ret)
+			goto err_unregister;
+
+		switch (desc->obj_type) {
+		case MEDIA_ENTITY_TYPE_VIDEO_DEVICE:
+			ret = isp_register_vdev(slot, desc, v4l2_dev);
+			break;
+		case MEDIA_ENTITY_TYPE_V4L2_SUBDEV:
+			ret = isp_register_subdev(slot, desc, v4l2_dev);
+			break;
+		case MEDIA_ENTITY_TYPE_BASE:
+		default:
+			ret = isp_register_base_entity(slot, desc, v4l2_dev);
+			break;
+		}
+		if (ret)
+			goto err_unregister;
+	}
+
+	/* Create links — only from SOURCE side to avoid duplicates */
+	for (i = 0; i < num_entities; i++) {
+		const struct camss_isp_entity_desc *desc = &descs[i];
+		unsigned int num_pads = isp_count_pads(desc->pads);
+
+		for (pi = 0; pi < num_pads; pi++) {
+			const struct camss_isp_pad_desc *pad = &desc->pads[pi];
+			struct media_entity *src_entity, *sink_entity;
+			unsigned int src_pad_idx, sink_pad_idx;
+			u32 lflags;
+
+			if (!(pad->flags & MEDIA_PAD_FL_SOURCE))
+				continue;
+			if (pad->peer_entity < 0)
+				continue;
+
+			src_entity   = isp_pipeline_media_entity(pipeline, i);
+			sink_entity  = isp_pipeline_media_entity(pipeline,
+								 (unsigned int)pad->peer_entity);
+			src_pad_idx  = pi;
+			sink_pad_idx = pad->peer_pad;
+
+			lflags = pad->link_flags ?
+				 pad->link_flags :
+				 (MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED);
+
+			ret = media_create_pad_link(src_entity,  src_pad_idx,
+						    sink_entity, sink_pad_idx,
+						    lflags);
+			if (ret)
+				goto err_unregister;
+		}
+	}
+
+	return 0;
+
+err_unregister:
+	camss_isp_pipeline_unregister(pipeline);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(camss_isp_pipeline_register);
+
+MODULE_DESCRIPTION("CAMSS ISP pipeline topology builder");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/platform/qcom/camss/camss-isp-pipeline.h b/drivers/media/platform/qcom/camss/camss-isp-pipeline.h
new file mode 100644
index 0000000000000000000000000000000000000000..5dfa32dcafc0a944ca2c160fb5846a2c73214acc
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-isp-pipeline.h
@@ -0,0 +1,228 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * CAMSS ISP pipeline helper — declarative MC topology builder
+ *
+ * Drivers describe their entire media graph — entities (video devices,
+ * subdevs, or base entities), their pads, and the links between them —
+ * in a single static descriptor table.  The builder validates the table,
+ * allocates and registers all entities, and creates all MC links.
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _CAMSS_ISP_PIPELINE_H
+#define _CAMSS_ISP_PIPELINE_H
+
+#include <linux/mutex.h>
+#include <media/media-device.h>
+#include <media/media-entity.h>
+#include <media/v4l2-dev.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-subdev.h>
+
+/**
+ * struct camss_isp_pad_desc - descriptor for one pad and its optional link
+ *
+ * @flags:       Pad flags: MEDIA_PAD_FL_SINK, MEDIA_PAD_FL_SOURCE,
+ *               MEDIA_PAD_FL_MUST_CONNECT.  A zero @flags value acts as
+ *               the sentinel that terminates the pad list.
+ * @peer_entity: Index of the peer entity in the descriptor array, or -1
+ *               if this pad has no link.
+ * @peer_pad:    Pad index on the peer entity to link to.
+ * @link_flags:  MC link flags (MEDIA_LNK_FL_*).  Defaults to
+ *               MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED when zero.
+ *
+ * Links are described from both sides (each endpoint references the other),
+ * but the builder only creates each link once — from the SOURCE side.
+ */
+struct camss_isp_pad_desc {
+	u32          flags;
+	int          peer_entity;
+	unsigned int peer_pad;
+	u32          link_flags;
+};
+
+/**
+ * struct camss_isp_entity_desc - descriptor for one entity in the pipeline
+ *
+ * @name:      Human-readable entity name (also used as video device name
+ *             suffix when @obj_type is MEDIA_ENTITY_TYPE_VIDEO_DEVICE).
+ * @obj_type:  MEDIA_ENTITY_TYPE_VIDEO_DEVICE, MEDIA_ENTITY_TYPE_V4L2_SUBDEV,
+ *             or MEDIA_ENTITY_TYPE_BASE.
+ * @function:  MEDIA_ENT_F_* function identifier.
+ * @pads:      Sentinel-terminated (flags == 0) array of pad descriptors.
+ *
+ * Fields used only for MEDIA_ENTITY_TYPE_VIDEO_DEVICE:
+ * @vdev.caps: V4L2_CAP_* device capabilities.
+ *             The video device direction (VFL_DIR_RX/TX/M2M) is derived
+ *             automatically from @caps by the builder.
+ * @vdev.drvdata: Opaque pointer set via video_set_drvdata() after registration.
+ * @vdev.fops:      File operations (may be NULL to use kernel defaults).
+ * @vdev.ioctl_ops: ioctl operations (may be NULL).
+ *
+ * Fields used only for MEDIA_ENTITY_TYPE_V4L2_SUBDEV:
+ * @subdev.ops: Subdev operations (may be NULL).
+ */
+struct camss_isp_entity_desc {
+	const char				*name;
+	u32					obj_type;
+	u32					function;
+	const struct camss_isp_pad_desc		*pads;
+
+	union {
+		/* MEDIA_ENTITY_TYPE_VIDEO_DEVICE */
+		struct {
+			u32					caps;
+			void					*drvdata;
+			const struct v4l2_file_operations	*fops;
+			const struct v4l2_ioctl_ops		*ioctl_ops;
+		} vdev;
+		/* MEDIA_ENTITY_TYPE_V4L2_SUBDEV */
+		struct {
+			const struct v4l2_subdev_ops		*ops;
+		} subdev;
+	};
+};
+
+/**
+ * struct camss_isp_pipeline_entity - one registered entity slot
+ *
+ * Internal to the pipeline; drivers access entities via the accessor helpers.
+ *
+ * @obj_type: mirrors the descriptor's @obj_type.
+ * @pads:     allocated pad array for this entity.
+ * @num_pads: number of entries in @pads.
+ * @vdev:     valid when @obj_type == MEDIA_ENTITY_TYPE_VIDEO_DEVICE.
+ * @subdev:   valid when @obj_type == MEDIA_ENTITY_TYPE_V4L2_SUBDEV.
+ * @entity:   valid when @obj_type == MEDIA_ENTITY_TYPE_BASE.
+ */
+struct camss_isp_pipeline_entity {
+	u32			 obj_type;
+	struct media_pad	*pads;
+	unsigned int		 num_pads;
+	union {
+		struct video_device  vdev;
+		struct v4l2_subdev   subdev;
+		struct media_entity  entity;
+	};
+};
+
+/**
+ * struct camss_isp_pipeline - registered ISP pipeline topology
+ *
+ * Allocate with camss_isp_pipeline_alloc(), register with
+ * camss_isp_pipeline_register(), tear down with
+ * camss_isp_pipeline_unregister(), free with camss_isp_pipeline_free().
+ *
+ * @v4l2_dev:     Pointer to the caller-provided V4L2 device.
+ * @drv_priv:     Driver-private pointer; not touched by the framework.
+ * @num_entities: Number of entries in @entities.
+ * @entities:     Per-entity state; flexible array.
+ */
+struct camss_isp_pipeline {
+	struct v4l2_device	*v4l2_dev;
+	void			*drv_priv;
+
+	unsigned int		 num_entities;
+	struct camss_isp_pipeline_entity entities[] __counted_by(num_entities);
+};
+
+/**
+ * camss_isp_pipeline_alloc() - allocate a pipeline for @num_entities entities
+ *
+ * Returns a pointer to the new pipeline or ERR_PTR on failure.
+ * Free with camss_isp_pipeline_free() if never registered, or call
+ * camss_isp_pipeline_unregister() followed by camss_isp_pipeline_free().
+ */
+struct camss_isp_pipeline *camss_isp_pipeline_alloc(unsigned int num_entities);
+
+/**
+ * camss_isp_pipeline_free() - free an unregistered pipeline
+ * @pipeline: pipeline to free (may be NULL)
+ */
+void camss_isp_pipeline_free(struct camss_isp_pipeline *pipeline);
+
+/**
+ * camss_isp_pipeline_register() - validate descriptors and register the graph
+ * @pipeline:    pipeline (allocated with camss_isp_pipeline_alloc())
+ * @v4l2_dev:    caller-owned and already-registered V4L2 device; its
+ *               associated media_device (v4l2_dev->mdev) must also be
+ *               initialised and registered before this call.
+ * @descs:       array of @num_entities entity descriptors
+ * @num_entities: number of entities; must equal pipeline->num_entities
+ *
+ * Validates the descriptor table (link direction consistency, index bounds),
+ * then registers all entities into the provided v4l2_device / media_device
+ * and creates all MC pad links.
+ *
+ * Returns 0 on success or a negative error code.
+ */
+int camss_isp_pipeline_register(struct camss_isp_pipeline *pipeline,
+				struct v4l2_device *v4l2_dev,
+				const struct camss_isp_entity_desc *descs,
+				unsigned int num_entities);
+
+/**
+ * camss_isp_pipeline_unregister() - tear down a registered pipeline
+ * @pipeline: pipeline to unregister
+ */
+void camss_isp_pipeline_unregister(struct camss_isp_pipeline *pipeline);
+
+/**
+ * camss_isp_pipeline_get_vdev() - return the video_device for entity @idx
+ * @pipeline: registered pipeline
+ * @idx:      entity index (must be MEDIA_ENTITY_TYPE_VIDEO_DEVICE)
+ *
+ * Returns NULL if @idx is out of range or the entity is not a video device.
+ */
+static inline struct video_device *
+camss_isp_pipeline_get_vdev(struct camss_isp_pipeline *pipeline,
+			    unsigned int idx)
+{
+	if (WARN_ON(idx >= pipeline->num_entities))
+		return NULL;
+	if (WARN_ON(pipeline->entities[idx].obj_type !=
+		    MEDIA_ENTITY_TYPE_VIDEO_DEVICE))
+		return NULL;
+	return &pipeline->entities[idx].vdev;
+}
+
+/**
+ * camss_isp_pipeline_get_subdev() - return the v4l2_subdev for entity @idx
+ * @pipeline: registered pipeline
+ * @idx:      entity index (must be MEDIA_ENTITY_TYPE_V4L2_SUBDEV)
+ *
+ * Returns NULL if @idx is out of range or the entity is not a subdev.
+ */
+static inline struct v4l2_subdev *
+camss_isp_pipeline_get_subdev(struct camss_isp_pipeline *pipeline,
+			      unsigned int idx)
+{
+	if (WARN_ON(idx >= pipeline->num_entities))
+		return NULL;
+	if (WARN_ON(pipeline->entities[idx].obj_type !=
+		    MEDIA_ENTITY_TYPE_V4L2_SUBDEV))
+		return NULL;
+	return &pipeline->entities[idx].subdev;
+}
+
+/**
+ * camss_isp_pipeline_get_entity() - return the media_entity for entity @idx
+ * @pipeline: registered pipeline
+ * @idx:      entity index (must be MEDIA_ENTITY_TYPE_BASE)
+ *
+ * Returns NULL if @idx is out of range or the entity is not a base entity.
+ */
+static inline struct media_entity *
+camss_isp_pipeline_get_entity(struct camss_isp_pipeline *pipeline,
+			      unsigned int idx)
+{
+	if (WARN_ON(idx >= pipeline->num_entities))
+		return NULL;
+	if (WARN_ON(pipeline->entities[idx].obj_type !=
+		    MEDIA_ENTITY_TYPE_BASE))
+		return NULL;
+	return &pipeline->entities[idx].entity;
+}
+
+#endif /* _CAMSS_ISP_PIPELINE_H */

-- 
2.34.1


