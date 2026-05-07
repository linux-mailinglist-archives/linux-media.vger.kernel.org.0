Return-Path: <linux-media+bounces-60869-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GF6cBqUX/WlLXgAAu9opvQ
	(envelope-from <linux-media+bounces-60869-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 00:52:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2494EFF3A
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 00:52:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BE21F30237E2
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 22:50:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 606133D1CB1;
	Thu,  7 May 2026 22:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a66+iYEc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OZgddfL5"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312FE3D525B
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 22:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778194227; cv=none; b=U6CMS/240qKP+0zxZ81SxgsalAm+CEvUspKcHW7XsO8X9eRJQZZtLiYSAwgIe4nZHmvbZYyUh6EWZ0yemdvmtwnMiwF3YwCrzy2K081qieFHmptqlvC+kTpTkV5POGZ+p37PCI3FSYI/N5AMyG2xASLlfM1rxrun+Dk2fTnfp9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778194227; c=relaxed/simple;
	bh=BEE5xtYLMIHM5H/+X+OLu6ImhtuWkEKhW4lS9LNnceo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h00ric9aAN6S2+uXCAjqSSqEgU1p2JgqUw1RY5Tx49H9qIxAilCeVYsLl9ljNTevUIL2PimQpSPvddPmCEoSrnoikHNAoQwFdNep6Ppt4nI2hd2NbBv2mlmZwae0nS9ECyjZKqxYET1MpZT6y5F7GMZ9nWVtObhWKoUddFQLQrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a66+iYEc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OZgddfL5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647J7Phi2531299
	for <linux-media@vger.kernel.org>; Thu, 7 May 2026 22:50:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hJybU2elZh0mwCIYOkkkEG3pKmTbc3qa3OZ8DwGiHk4=; b=a66+iYEcSaiNMUCx
	6Wke6HFpcgqlrVazEMty9Dfmz+yQ13FDpAbDaNvHB2iqOwhEhKWmBA6mTSzsS5mj
	TVMvo0JgEtaycOTvc86KcgzZCaE9gKh0RrK1NLKzBOIkQ1/a48rl3cffFWScbo9e
	ItOwD0H3u+hHapsuPNzPBE68svW2LgxQiI+K5oEKRn5h30XlohXVafFwhcohXzfZ
	vUD55UTcqXvDEuDldgegUEyDL3dpsuaAW0CygHOrKltC1bp/LsqWFrNq+Y61rotm
	hXdvhlQ4XW70LJ6DbFJ8qBTj9173gz+M+YgGkuC+4+uxSr7PZHkSKIPqzjS7PZPF
	jlNItQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e10m9rm31-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 07 May 2026 22:50:24 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-62eae604ac8so1071193137.1
        for <linux-media@vger.kernel.org>; Thu, 07 May 2026 15:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778194223; x=1778799023; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hJybU2elZh0mwCIYOkkkEG3pKmTbc3qa3OZ8DwGiHk4=;
        b=OZgddfL50ztMgPQv7kJMVLYb08KX0Xj+xL/iArZ9hCBD92RijvbljdBB5W0Ujy5gAM
         wgcfwJ7UaFfChXKxMNiGaK9GwJzt+sspJmPeDljGvnAryCckowZj6KAPbqLyHzUY0yrE
         LsM5mmW1jb1VhSoFbncQ7HyiFIFHk0KopRlmnDHXPOLecrFW128lCfe0eUV1UKv/FDwn
         Qpy7M6rpsDWh/YpHO58dMJf+X8fJ2IHX8s7A0P4XModqqnBtyQG4tsBGFCpv77uxOheJ
         3Oywycq5S6z2wiRwygWXgAX7vNjtxEHzhJonEEj5FkfWmqQxornyTo/Qfse/sOg+rEsO
         Qtmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778194223; x=1778799023;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hJybU2elZh0mwCIYOkkkEG3pKmTbc3qa3OZ8DwGiHk4=;
        b=LdWxjfuhK1jI+MEbtMupwizOY5qPz7VerEtRRJLtIDdZdZyB5RwlGZQP8VonMT7wRV
         /hO98VKKlO1YGV0koyg/Vd2KiJj91+pUWpbrvxRy9fGlZzJzWOiWGwT7ouJcxtzb4OXB
         yt4k+VimIybMRMbIBtewS+5wgCgmEGZo0wjRzd32KiqY7E+crJ6LHT7vKzHTss6HcC6Z
         AoiKqllRaiLSkAKT26Tljm/IBmi13OioWKv8Hq3ndMLAlgIvyzN1dQa6EnbA9twR6dbi
         w3r3KBdWsMaE7nc13i3No/9MZoZiBxvtTJJyEIzJts9IPhn6OHxBKgmYRdoeEu/3SZ4v
         8K8Q==
X-Gm-Message-State: AOJu0YyeJ/0Y8+CuRV/AlWO3p3meK8uon/Gf3HqeL77Rzt59Rcbq1eup
	0x4aWsuuK2NTAm/dlQz/FZBXp+9j34llXb1O0AmmKRHz9UteHnKjTXbjX4YuNE5PV+zGAh7MH8E
	VWLufk/NfQ4W0wh+HhBN3qgSMrs7qw+ks/YFApmfZNiQG+5jK8JY/x2Sv8VSECNV0BQ==
X-Gm-Gg: AeBDieuZ/ee133qOWS8lWnfzve7rTIgRFY3GRUPZ+QmzzI39YEkhw8dENCH97A7UPjM
	j+5os2aYihVu7i+oGCJHY5UfVq78q0Cnh7NtwqEC0HEkgiu8gaeUfURXu7Pp3rqZdLeroHHdOF/
	M1iZbU0brUGU5ng24b/1H3h+TAP0EDxOmpUrcgdS0cpMLaUG5BvV+RkWoAr1GTRHvTqUXl4EafJ
	ajXQ2Sk2r6iqxbMd6ZAIqTc4Z+NpWourkY1VrXLJYayjIc1Ft8JtCM8Rw353n4RTYULQH4iAQBh
	AWv7VyIM87fnT7TWld1fufVBDcTpKH1Gd56ARck5WTYmc3OpsygdziU5tKtbjUg2vWz/koYXDLC
	AjuLrR5k9wstT0gQ+NWtm3/PBRWJmUKqkzOoeDFUwBxhVjaEvsg8zYYT135PGKciyX7GpwnhUsB
	8DkR1HncgfDUX8NRT5
X-Received: by 2002:a05:6102:54ab:b0:62f:3cb7:8652 with SMTP id ada2fe7eead31-6313e9f142dmr64750137.13.1778194223112;
        Thu, 07 May 2026 15:50:23 -0700 (PDT)
X-Received: by 2002:a05:6102:54ab:b0:62f:3cb7:8652 with SMTP id ada2fe7eead31-6313e9f142dmr64726137.13.1778194222561;
        Thu, 07 May 2026 15:50:22 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:b16a:3475:ec42:bcfa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac4359dbesm102466b.48.2026.05.07.15.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 15:50:21 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 08 May 2026 00:49:21 +0200
Subject: [PATCH v3 06/15] media: qcom: camss: Add camss-isp-pipeline helper
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260508-camss-isp-ope-v3-6-bb1055274603@oss.qualcomm.com>
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
X-Proofpoint-GUID: _L6Q5WHe860Z1xyVaJE-Sx2M4NTDOmx3
X-Authority-Analysis: v=2.4 cv=VP3tWdPX c=1 sm=1 tr=0 ts=69fd1730 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=0HvUUkHzQstEScuQiJkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDIzMSBTYWx0ZWRfX3KR6vjGQSY7p
 iKmQ+XX5KIRT7lDdf0dAABsEKolgSEhZc37J7ZwZXJw/aM0yHmJJAgeTRRPXGz71zUAah44UAqE
 XXd7k6fTO1KJ/eUaTVhW8Gmhc5P8upbDyW6kfTWTl/gezNtNdTac9AB+iKYG/AVgIRGqvfW/SDK
 3kVUnOKrrO5+LWMUkJqTRUrN5cLO8p2HL5VYXGc/t3RK4gUs2lmv4JmdfFTOf8S50bwyFeyVIFm
 1VuAKR504+JCiQNwMFzbTvK5M6yn8rqVwsFaLU6ZFXnV2qJ6HblxlJ1Fb1ZTzTaWTpyd2ROsoy7
 mpoxC//n+pTmr7VgqcfrmhYywuWogKRycCefAw2opOjTDUkYfl1+/+Lr/PFlwK6OND3X2UKface
 W0yJKGHLrQ2n/DPUqrlNKRiSlO6yRGrRnLV8t7MBKRe2mFbOfZbIRTPElIfQlFkjSki6DrhGs0J
 lhtD8g+2GowQ+qApFtg==
X-Proofpoint-ORIG-GUID: _L6Q5WHe860Z1xyVaJE-Sx2M4NTDOmx3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070231
X-Rspamd-Queue-Id: 1F2494EFF3A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60869-lists,linux-media=lfdr.de];
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


