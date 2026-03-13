Return-Path: <linux-media+bounces-55571-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDDMHVaus2kvZwAAu9opvQ
	(envelope-from <linux-media+bounces-55571-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 07:27:34 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE0427E159
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 07:27:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C87593086DF4
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 06:22:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6BF436B072;
	Fri, 13 Mar 2026 06:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DlZwUR87";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GcPDczfj"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2555936BCCC
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 06:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773382535; cv=none; b=GmNgN4VGb/hUpLgs3CrDL4aRgIIkWu8XbhETZkpW+f0dzLfeG68Veo1sDFSyBXbHlaqpzuktku2Awc8LKhtBrJla7YbENs43OxSC4SeM97OqDLvQet9ouvISxVjV9uJDA5OZWyJOFvytDYU9ROXYTE8MSUnetflFGoxdAQlUMfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773382535; c=relaxed/simple;
	bh=5DZS9GSd/hIZWXSubbViRdbfcO745TS0DY497dYcopc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kdshVMuOb4E/B0ei8QdswiXDKrJ1lqwKSBdZeNSKWpEctGUoss8dJABf35HNNseLawO8LjfbBd5wuArQ/WvWs0LUyzRfRI4IXvNIJaQsZLyP25vaeUMGfkG1Hny3Hduus77cOJ+IjBpAIwiGsLGd0iOF9uBwEmgBg6juMDIfgR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DlZwUR87; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GcPDczfj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tePP4140749
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 06:15:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	61ttEl6K3A+izyyS3SXrwsC2uSLyIaKlBcFdzlpVJ3M=; b=DlZwUR87ia2pVYZE
	PjZ3Xv+aC4TxnbMMF7YCcxM7dYYvPI4zhgI8INXzKhP5PpoffUJCDWbVlQUb+EcT
	rhdPWUnX2V71ID8MXdpWJ6jDxNT8lhhLovdBXCvO/t3sOrgosHVzCYuWrSfGzZ3j
	EXh5IS56dT2kr3wv2TJGL4QujhEzK9PAk5qb99jwH8rtPbOo+44h2/9zp3rXqlLQ
	EZ10MD8mCoNWoCU2JcvDC17mcBD82M82cZkpDaAXbXr5To/67DNdpFEym5C/vEkR
	O0skTHBi6aa++NxtBdpv0QboI+Z1qnxwm0tpmLw4vnE/FNOdaUbNFP4GA9NBC7PJ
	LA5vAg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvbn288ss-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 06:15:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd85e08fddso1793656685a.1
        for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 23:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773382530; x=1773987330; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=61ttEl6K3A+izyyS3SXrwsC2uSLyIaKlBcFdzlpVJ3M=;
        b=GcPDczfjKdRk0OLpHJt/0KzZ0A/2/l2DIM7anuRejHP1MGEWCHnZdPV/FPczJYWlau
         MEijrOlgvlbM/Hb48ptHV21/q+p4pjhabzF9mrSgmWKO40I23Cncqt8iJ9WNPCNLBCKK
         gs8cqfJOO+9y1KR5dYK8CBOp8eoM9NHlF69sFTScyiiHeg86v0/oxna/r9RWYGi2cXic
         0K0QU9+2ri8CRjK/231EpP0IwNjC/7q2wcFL0lMbHEts7dYqCuPucO48fSMu+Wgze8k3
         oV2mtRjE0ZROJn4KQYSdwM9GLByX22gMLK68LNPthw9U4WrkHU/FwV+cj9V87apYwHJA
         5HEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773382530; x=1773987330;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=61ttEl6K3A+izyyS3SXrwsC2uSLyIaKlBcFdzlpVJ3M=;
        b=TFagLqjdHrwfze3JbTh6DcS7YQmSIpXMygKGUe3pJ2yZY77j0IIeOpgPxt9AOH0GST
         zZ4+M2l54Y73bbtarciE1uromfENxOi8Qt0Tgrjud6Da9HArV6i+ZzPYQ112TiITWIuj
         W0MrmDMjf6vKFhieeuHH7Go/WG+qFmhCc2PCeCgR4Kze5UUTiM7CIRzgL0DwQQFkAXF4
         3jAZnXJ4Bcu8efcXgmmpJKMgd2g6ZXo8CgE109PAx6B4Mgn+1GRZ5pD0R2JDQoOkeFIv
         2tI1ypQ/rmEjJUWbisWAlC/k0bCxaZxJpcb5dhQUNaUnGhMggX73vpgYWz9or0o49y+n
         ogmw==
X-Forwarded-Encrypted: i=1; AJvYcCVJnEkG4+c9TBcvJFfsUwA3Yrxj1JzVzWWELCVd6ailYR3a9YbJdielkw8+ZELCq7f3mgsWtcck5harbg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yym4fPM8Gtqnwyk+iRflqHGLuBZWpD5eugMhOOerMUIj7xFhLTZ
	1Bfh//Udvr7ryXmRMcgBu6XrfZKh3tCKZnKuSx6s/ODH/EO/lFTXMJiHAn51KzwUhwq14tVUtU4
	xntAYMide2jIHtMhXkynwrHZ1w6bgG5hwybYcmkX5icOzJpEe/CyhnijjnPobtTDv2Q==
X-Gm-Gg: ATEYQzy3yaPEXyA+jLqTZilwCDxdGBJhAEXoUTEBQuKuZIPhh26C5sAvfMlWh3UP4ew
	LTiU+RCPXWVqNXCQjS/5Ko0qG3zCLJqoU656G7ae/PDjv5GPo/XLdLNfB618E8nPKFDKw0otatg
	a0ORfNi3IE1CyBhS6nQ3SuzS43wwieVLPqqPgUaMYqwJAIloBRujsOWxAq8fs6+UZ9jFQgCJqo5
	jOeIP5x5uZlb3MZ3k9MzKBG1D9ItPb3/wjTf8Xt2qfpF+VH7ACobHgU1OsJ9aYBb86EBID2/86e
	UpPZt5HuO5clc8uVfb63Ix2/XIP5ldijaNNFc12MRW0vZ27zvctqyJUzZLc1RFjQbr5KFrWeMR8
	u14tGsVL8mFcKdXdXIRn9/ik/6cMzmq/ZwUOL9dR13dZM7O7AH546WyX9bxs3ZeoACUxAC8249Z
	/sd9/ZloG+eL4w
X-Received: by 2002:a05:620a:3709:b0:8c6:af59:5e28 with SMTP id af79cd13be357-8cdb5a5d108mr313601185a.22.1773382530156;
        Thu, 12 Mar 2026 23:15:30 -0700 (PDT)
X-Received: by 2002:a05:620a:3709:b0:8c6:af59:5e28 with SMTP id af79cd13be357-8cdb5a5d108mr313599885a.22.1773382529636;
        Thu, 12 Mar 2026 23:15:29 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cda1fc09e4sm502265185a.3.2026.03.12.23.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 23:15:29 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 14:15:04 +0800
Subject: [PATCH v9 1/3] media: qcom: camss: Add common TPG support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-camss_tpg-v9-1-b9095de6525b@oss.qualcomm.com>
References: <20260313-camss_tpg-v9-0-b9095de6525b@oss.qualcomm.com>
In-Reply-To: <20260313-camss_tpg-v9-0-b9095de6525b@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773382521; l=19369;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=5DZS9GSd/hIZWXSubbViRdbfcO745TS0DY497dYcopc=;
 b=XAT/T7IIfTqTd9/OIPwQ61J/oEJ4lCGiVhMm8FkNzvFvv+5JTNT0tqAgnRxnvn+fnodP9mVF5
 NQrv5pjPB4zAOdeicHtuh8Iipnws1z5qr+riAQ/267pVmtMKtEEoKL5
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: CYM8Vj1TxjY5YpoSKSUM2PMgSVciFbkg
X-Proofpoint-GUID: CYM8Vj1TxjY5YpoSKSUM2PMgSVciFbkg
X-Authority-Analysis: v=2.4 cv=ZKfaWH7b c=1 sm=1 tr=0 ts=69b3ab83 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=C6Fd2oMUCFXsb_HVK5cA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA0OCBTYWx0ZWRfX2ZPwsccNqEWE
 Cijyzo0JH9/NGYNDuk446zqF1aRJwE8zmHGYiRhX43/4txEUR5htNvNiO2Dq82W4BdjZkHCiMdK
 MJ4zhcGA5cJHm5qjL4LYPHtabfFqkzFUoKDhFlTixIbwPjvoutVwLjQC3MzZ1Uvmhw8c5QvJqRL
 gJii93ZGCWdVcgJHDo6EcKS/ww+js5AnyETq9ayffpMQ13L8SpUwBYY7aXCVACgqV1sypwHRKAg
 huTFDopM9+oREiSJUiQc0sKmhgJPMv8oRuIn/Ctd675DIl7YY9mTDbDHVeHDsm06zxKlYJCEcw/
 qjPxbmoEsX3g4X8/1c7j9eKBH/fFepWdq0rCfP8VfLaYfH0mFg843HP8/v5an4qWfKZvnbs0pla
 eskwUPbQTFlVyyYYilo21TMCV39cw4YZ6VgaIp6R0V0ql+HJYIRffUvxHZjnIrzgOk63Fx8aCcO
 h9Pv2cF0rRGzCxMtioA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_03,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130048
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-55571-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EFE0427E159
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Introduce a new common Test Pattern Generator (TPG) implementation for
Qualcomm CAMSS. This module provides a generic interface for pattern
generation that can be reused by multiple platforms.

Unlike CSID-integrated TPG, this TPG acts as a standalone block
that emulates both CSIPHY and sensor behavior, enabling flexible test
patterns without external hardware.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/Makefile    |  11 +-
 drivers/media/platform/qcom/camss/camss-tpg.c | 519 ++++++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-tpg.h | 118 ++++++
 drivers/media/platform/qcom/camss/camss.h     |   5 +
 4 files changed, 648 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index 5e349b4915130c71dbff90e73102e46dfede1520..d747aa7db3c12ad27d986e0b2b85a44870f89ad3 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -10,10 +10,13 @@ qcom-camss-objs += \
 		camss-csid-680.o \
 		camss-csid-gen2.o \
 		camss-csid-gen3.o \
+		camss-csiphy.o \
 		camss-csiphy-2ph-1-0.o \
 		camss-csiphy-3ph-1-0.o \
-		camss-csiphy.o \
+		camss-format.o \
 		camss-ispif.o \
+		camss-tpg.o \
+		camss-vfe.o \
 		camss-vfe-4-1.o \
 		camss-vfe-4-7.o \
 		camss-vfe-4-8.o \
@@ -21,11 +24,9 @@ qcom-camss-objs += \
 		camss-vfe-340.o \
 		camss-vfe-480.o \
 		camss-vfe-680.o \
-		camss-vfe-gen3.o \
 		camss-vfe-gen1.o \
+		camss-vfe-gen3.o \
 		camss-vfe-vbif.o \
-		camss-vfe.o \
-		camss-video.o \
-		camss-format.o \
+		camss-video.o
 
 obj-$(CONFIG_VIDEO_QCOM_CAMSS) += qcom-camss.o
diff --git a/drivers/media/platform/qcom/camss/camss-tpg.c b/drivers/media/platform/qcom/camss/camss-tpg.c
new file mode 100644
index 0000000000000000000000000000000000000000..c5b75132add44b1392806e65a1985a1e28da3b0b
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-tpg.c
@@ -0,0 +1,519 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *
+ * Qualcomm MSM Camera Subsystem - TPG Module
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+#include <linux/clk.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <media/media-entity.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-subdev.h>
+#include <media/mipi-csi2.h>
+
+#include "camss-tpg.h"
+#include "camss.h"
+
+static const struct tpg_format_info formats_gen1[] = {
+	{
+		MEDIA_BUS_FMT_SBGGR8_1X8,
+		MIPI_CSI2_DT_RAW8,
+		ENCODE_FORMAT_UNCOMPRESSED_8_BIT,
+		8,
+	},
+	{
+		MEDIA_BUS_FMT_SGBRG8_1X8,
+		MIPI_CSI2_DT_RAW8,
+		ENCODE_FORMAT_UNCOMPRESSED_8_BIT,
+		8,
+	},
+	{
+		MEDIA_BUS_FMT_SGRBG8_1X8,
+		MIPI_CSI2_DT_RAW8,
+		ENCODE_FORMAT_UNCOMPRESSED_8_BIT,
+		8,
+	},
+	{
+		MEDIA_BUS_FMT_SRGGB8_1X8,
+		MIPI_CSI2_DT_RAW8,
+		ENCODE_FORMAT_UNCOMPRESSED_8_BIT,
+		8,
+	},
+	{
+		MEDIA_BUS_FMT_SBGGR10_1X10,
+		MIPI_CSI2_DT_RAW10,
+		ENCODE_FORMAT_UNCOMPRESSED_10_BIT,
+		10,
+	},
+	{
+		MEDIA_BUS_FMT_SGBRG10_1X10,
+		MIPI_CSI2_DT_RAW10,
+		ENCODE_FORMAT_UNCOMPRESSED_10_BIT,
+		10,
+	},
+	{
+		MEDIA_BUS_FMT_SGRBG10_1X10,
+		MIPI_CSI2_DT_RAW10,
+		ENCODE_FORMAT_UNCOMPRESSED_10_BIT,
+		10,
+	},
+	{
+		MEDIA_BUS_FMT_SRGGB10_1X10,
+		MIPI_CSI2_DT_RAW10,
+		ENCODE_FORMAT_UNCOMPRESSED_10_BIT,
+		10,
+	},
+	{
+		MEDIA_BUS_FMT_SBGGR12_1X12,
+		MIPI_CSI2_DT_RAW12,
+		ENCODE_FORMAT_UNCOMPRESSED_12_BIT,
+		12,
+	},
+	{
+		MEDIA_BUS_FMT_SGBRG12_1X12,
+		MIPI_CSI2_DT_RAW12,
+		ENCODE_FORMAT_UNCOMPRESSED_12_BIT,
+		12,
+	},
+	{
+		MEDIA_BUS_FMT_SGRBG12_1X12,
+		MIPI_CSI2_DT_RAW12,
+		ENCODE_FORMAT_UNCOMPRESSED_12_BIT,
+		12,
+	},
+	{
+		MEDIA_BUS_FMT_SRGGB12_1X12,
+		MIPI_CSI2_DT_RAW12,
+		ENCODE_FORMAT_UNCOMPRESSED_12_BIT,
+		12,
+	},
+	{
+		MEDIA_BUS_FMT_Y8_1X8,
+		MIPI_CSI2_DT_RAW8,
+		ENCODE_FORMAT_UNCOMPRESSED_8_BIT,
+		8,
+	},
+	{
+		MEDIA_BUS_FMT_Y10_1X10,
+		MIPI_CSI2_DT_RAW10,
+		ENCODE_FORMAT_UNCOMPRESSED_10_BIT,
+		10,
+	},
+};
+
+const struct tpg_formats tpg_formats_gen1 = {
+	.nformats = ARRAY_SIZE(formats_gen1),
+	.formats = formats_gen1
+};
+
+const struct tpg_format_info *tpg_get_fmt_entry(const struct tpg_format_info *formats,
+						unsigned int nformats,
+						u32 code)
+{
+	unsigned int i;
+
+	for (i = 0; i < nformats; i++)
+		if (code == formats[i].code)
+			return &formats[i];
+
+	return ERR_PTR(-EINVAL);
+}
+
+static int tpg_set_clock_rates(struct tpg_device *tpg)
+{
+	struct device *dev = tpg->camss->dev;
+	int i, ret;
+
+	for (i = 0; i < tpg->nclocks; i++) {
+		struct camss_clock *clock = &tpg->clock[i];
+		long round_rate;
+
+		if (clock->freq) {
+			round_rate = clk_round_rate(clock->clk, clock->freq[0]);
+			if (round_rate < 0) {
+				dev_err(dev, "clk round rate failed: %ld\n",
+					round_rate);
+				return -EINVAL;
+			}
+
+			ret = clk_set_rate(clock->clk, round_rate);
+			if (ret < 0) {
+				dev_err(dev, "clk set rate failed: %d\n", ret);
+				return ret;
+			}
+		}
+	}
+
+	return 0;
+}
+
+static int tpg_set_power(struct v4l2_subdev *sd, int on)
+{
+	struct tpg_device *tpg = v4l2_get_subdevdata(sd);
+	struct device *dev = tpg->camss->dev;
+
+	if (on) {
+		int ret;
+
+		ret = pm_runtime_resume_and_get(dev);
+		if (ret < 0)
+			return ret;
+
+		ret = tpg_set_clock_rates(tpg);
+		if (ret < 0) {
+			pm_runtime_put_sync(dev);
+			return ret;
+		}
+
+		ret = camss_enable_clocks(tpg->nclocks, tpg->clock, dev);
+		if (ret < 0) {
+			pm_runtime_put_sync(dev);
+			return ret;
+		}
+
+		tpg->res->hw_ops->reset(tpg);
+
+		tpg->res->hw_ops->hw_version(tpg);
+	} else {
+		camss_disable_clocks(tpg->nclocks, tpg->clock);
+
+		pm_runtime_put_sync(dev);
+	}
+
+	return 0;
+}
+
+static int tpg_set_stream(struct v4l2_subdev *sd, int enable)
+{
+	struct tpg_device *tpg = v4l2_get_subdevdata(sd);
+	int ret;
+
+	if (enable) {
+		ret = v4l2_ctrl_handler_setup(&tpg->ctrls);
+		if (ret < 0) {
+			dev_err(tpg->camss->dev,
+				"could not sync v4l2 controls: %d\n", ret);
+			return ret;
+		}
+	}
+
+	return tpg->res->hw_ops->configure_stream(tpg, enable);
+}
+
+static struct v4l2_mbus_framefmt *
+__tpg_get_format(struct tpg_device *tpg,
+		 struct v4l2_subdev_state *sd_state,
+		 unsigned int pad,
+		 enum v4l2_subdev_format_whence which)
+{
+	if (which == V4L2_SUBDEV_FORMAT_TRY)
+		return v4l2_subdev_state_get_format(sd_state,
+						    pad);
+
+	return &tpg->fmt;
+}
+
+static void tpg_try_format(struct tpg_device *tpg,
+			   struct v4l2_mbus_framefmt *fmt)
+{
+	unsigned int i;
+
+	for (i = 0; i < tpg->res->formats->nformats; i++)
+		if (tpg->res->formats->formats[i].code == fmt->code)
+			break;
+
+	if (i >= tpg->res->formats->nformats)
+		fmt->code = MEDIA_BUS_FMT_SBGGR8_1X8;
+
+	fmt->width = clamp_t(u32, fmt->width, TPG_MIN_WIDTH, TPG_MAX_WIDTH);
+	fmt->height = clamp_t(u32, fmt->height, TPG_MIN_HEIGHT, TPG_MAX_HEIGHT);
+	fmt->field = V4L2_FIELD_NONE;
+	fmt->colorspace = V4L2_COLORSPACE_SRGB;
+}
+
+static int tpg_enum_mbus_code(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *sd_state,
+			      struct v4l2_subdev_mbus_code_enum *code)
+{
+	struct tpg_device *tpg = v4l2_get_subdevdata(sd);
+
+	if (code->index >= tpg->res->formats->nformats)
+		return -EINVAL;
+
+	code->code = tpg->res->formats->formats[code->index].code;
+
+	return 0;
+}
+
+static int tpg_enum_frame_size(struct v4l2_subdev *sd,
+			       struct v4l2_subdev_state *sd_state,
+			       struct v4l2_subdev_frame_size_enum *fse)
+{
+	struct tpg_device *tpg = v4l2_get_subdevdata(sd);
+	unsigned int i;
+
+	if (fse->index != 0)
+		return -EINVAL;
+
+	for (i = 0; i < tpg->res->formats->nformats; i++)
+		if (tpg->res->formats->formats[i].code == fse->code)
+			break;
+
+	if (i >= tpg->res->formats->nformats)
+		return -EINVAL;
+
+	fse->min_width = TPG_MIN_WIDTH;
+	fse->min_height = TPG_MIN_HEIGHT;
+	fse->max_width = TPG_MAX_WIDTH;
+	fse->max_height = TPG_MAX_HEIGHT;
+
+	return 0;
+}
+
+static int tpg_get_format(struct v4l2_subdev *sd,
+			  struct v4l2_subdev_state *sd_state,
+			  struct v4l2_subdev_format *fmt)
+{
+	struct tpg_device *tpg = v4l2_get_subdevdata(sd);
+	struct v4l2_mbus_framefmt *format;
+
+	format = __tpg_get_format(tpg, sd_state, fmt->pad, fmt->which);
+	if (!format)
+		return -EINVAL;
+
+	fmt->format = *format;
+
+	return 0;
+}
+
+static int tpg_set_format(struct v4l2_subdev *sd,
+			  struct v4l2_subdev_state *sd_state,
+			  struct v4l2_subdev_format *fmt)
+{
+	struct tpg_device *tpg = v4l2_get_subdevdata(sd);
+	struct v4l2_mbus_framefmt *format;
+
+	format = __tpg_get_format(tpg, sd_state, fmt->pad, fmt->which);
+	if (!format)
+		return -EINVAL;
+
+	tpg_try_format(tpg, &fmt->format);
+	*format = fmt->format;
+
+	return 0;
+}
+
+static int tpg_init_formats(struct v4l2_subdev *sd,
+			    struct v4l2_subdev_fh *fh)
+{
+	struct v4l2_subdev_format format = {
+		.pad = MSM_TPG_PAD_SRC,
+		.which = fh ? V4L2_SUBDEV_FORMAT_TRY :
+			      V4L2_SUBDEV_FORMAT_ACTIVE,
+		.format = {
+			.code = MEDIA_BUS_FMT_SBGGR8_1X8,
+			.width = 1920,
+			.height = 1080,
+		}
+	};
+
+	return tpg_set_format(sd, fh ? fh->state : NULL, &format);
+}
+
+static int tpg_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct tpg_device *tpg = container_of(ctrl->handler,
+					      struct tpg_device, ctrls);
+	int ret = -EINVAL;
+
+	switch (ctrl->id) {
+	case V4L2_CID_TEST_PATTERN:
+		ret = tpg->res->hw_ops->configure_testgen_pattern(tpg, ctrl->val);
+		break;
+	}
+
+	return ret;
+}
+
+static const struct v4l2_ctrl_ops tpg_ctrl_ops = {
+	.s_ctrl = tpg_s_ctrl,
+};
+
+int msm_tpg_subdev_init(struct camss *camss,
+			struct tpg_device *tpg,
+			const struct camss_subdev_resources *res, u8 id)
+{
+	struct platform_device *pdev;
+	struct device *dev;
+	int i, j;
+
+	dev  = camss->dev;
+	pdev = to_platform_device(dev);
+
+	tpg->camss = camss;
+	tpg->id = id;
+	tpg->res = &res->tpg;
+	tpg->res->hw_ops->subdev_init(tpg);
+
+	tpg->base = devm_platform_ioremap_resource_byname(pdev, res->reg[0]);
+	if (IS_ERR(tpg->base))
+		return PTR_ERR(tpg->base);
+
+	tpg->nclocks = 0;
+	while (res->clock[tpg->nclocks])
+		tpg->nclocks++;
+
+	if (!tpg->nclocks)
+		return 0;
+
+	tpg->clock = devm_kcalloc(dev, tpg->nclocks,
+				  sizeof(*tpg->clock), GFP_KERNEL);
+	if (!tpg->clock)
+		return -ENOMEM;
+
+	for (i = 0; i < tpg->nclocks; i++) {
+		struct camss_clock *clock = &tpg->clock[i];
+
+		clock->clk = devm_clk_get(dev, res->clock[i]);
+		if (IS_ERR(clock->clk))
+			return PTR_ERR(clock->clk);
+
+		clock->name = res->clock[i];
+
+		clock->nfreqs = 0;
+		while (res->clock_rate[i][clock->nfreqs])
+			clock->nfreqs++;
+
+		if (!clock->nfreqs) {
+			clock->freq = NULL;
+			continue;
+		}
+
+		clock->freq = devm_kcalloc(dev, clock->nfreqs,
+					   sizeof(*clock->freq), GFP_KERNEL);
+		if (!clock->freq)
+			return -ENOMEM;
+
+		for (j = 0; j < clock->nfreqs; j++)
+			clock->freq[j] = res->clock_rate[i][j];
+	}
+
+	return 0;
+}
+
+static int tpg_link_setup(struct media_entity *entity,
+			  const struct media_pad *local,
+			  const struct media_pad *remote, u32 flags)
+{
+	if (flags & MEDIA_LNK_FL_ENABLED)
+		if (media_pad_remote_pad_first(local))
+			return -EBUSY;
+
+	return 0;
+}
+
+static const struct v4l2_subdev_core_ops tpg_core_ops = {
+	.s_power = tpg_set_power,
+};
+
+static const struct v4l2_subdev_video_ops tpg_video_ops = {
+	.s_stream = tpg_set_stream,
+};
+
+static const struct v4l2_subdev_pad_ops tpg_pad_ops = {
+	.enum_mbus_code = tpg_enum_mbus_code,
+	.enum_frame_size = tpg_enum_frame_size,
+	.get_fmt = tpg_get_format,
+	.set_fmt = tpg_set_format,
+};
+
+static const struct v4l2_subdev_ops tpg_v4l2_ops = {
+	.core = &tpg_core_ops,
+	.video = &tpg_video_ops,
+	.pad = &tpg_pad_ops,
+};
+
+static const struct v4l2_subdev_internal_ops tpg_v4l2_internal_ops = {
+	.open = tpg_init_formats,
+};
+
+static const struct media_entity_operations tpg_media_ops = {
+	.link_setup = tpg_link_setup,
+	.link_validate = v4l2_subdev_link_validate,
+};
+
+int msm_tpg_register_entity(struct tpg_device *tpg,
+			    struct v4l2_device *v4l2_dev)
+{
+	struct v4l2_subdev *sd = &tpg->subdev;
+	struct device *dev = tpg->camss->dev;
+	int ret;
+
+	v4l2_subdev_init(sd, &tpg_v4l2_ops);
+	sd->internal_ops = &tpg_v4l2_internal_ops;
+	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
+		     V4L2_SUBDEV_FL_HAS_EVENTS;
+	snprintf(sd->name, ARRAY_SIZE(sd->name), "%s%d",
+		 "msm_tpg", tpg->id);
+	sd->grp_id = TPG_GRP_ID;
+	v4l2_set_subdevdata(sd, tpg);
+
+	ret = v4l2_ctrl_handler_init(&tpg->ctrls, 1);
+	if (ret < 0) {
+		dev_err(dev, "Failed to init ctrl handler: %d\n", ret);
+		return ret;
+	}
+
+	tpg->testgen_mode = v4l2_ctrl_new_std_menu_items(&tpg->ctrls,
+							 &tpg_ctrl_ops, V4L2_CID_TEST_PATTERN,
+							 tpg->testgen.nmodes, 0, 0,
+							 tpg->testgen.modes);
+	if (tpg->ctrls.error) {
+		dev_err(dev, "Failed to init ctrl: %d\n", tpg->ctrls.error);
+		ret = tpg->ctrls.error;
+		goto free_ctrl;
+	}
+
+	tpg->subdev.ctrl_handler = &tpg->ctrls;
+
+	ret = tpg_init_formats(sd, NULL);
+	if (ret < 0) {
+		dev_err(dev, "Failed to init format: %d\n", ret);
+		goto free_ctrl;
+	}
+
+	tpg->pad.flags = MEDIA_PAD_FL_SOURCE;
+
+	sd->entity.ops = &tpg_media_ops;
+	ret = media_entity_pads_init(&sd->entity, 1, &tpg->pad);
+	if (ret < 0) {
+		dev_err(dev, "Failed to init media entity: %d\n", ret);
+		goto free_ctrl;
+	}
+
+	ret = v4l2_device_register_subdev(v4l2_dev, sd);
+	if (ret < 0) {
+		dev_err(dev, "Failed to register subdev: %d\n", ret);
+		media_entity_cleanup(&sd->entity);
+		goto free_ctrl;
+	}
+
+	return 0;
+
+free_ctrl:
+	v4l2_ctrl_handler_free(&tpg->ctrls);
+
+	return ret;
+}
+
+void msm_tpg_unregister_entity(struct tpg_device *tpg)
+{
+	v4l2_device_unregister_subdev(&tpg->subdev);
+	media_entity_cleanup(&tpg->subdev.entity);
+	v4l2_ctrl_handler_free(&tpg->ctrls);
+}
diff --git a/drivers/media/platform/qcom/camss/camss-tpg.h b/drivers/media/platform/qcom/camss/camss-tpg.h
new file mode 100644
index 0000000000000000000000000000000000000000..7fb35a97dd068f8992a02d8d81cccfda8e556daf
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-tpg.h
@@ -0,0 +1,118 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * camss-tpg.h
+ *
+ * Qualcomm MSM Camera Subsystem - TPG Module
+ *
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+#ifndef QC_MSM_CAMSS_TPG_H
+#define QC_MSM_CAMSS_TPG_H
+
+#include <linux/clk.h>
+#include <linux/bitfield.h>
+#include <media/media-entity.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-mediabus.h>
+#include <media/v4l2-subdev.h>
+
+#define ENCODE_FORMAT_UNCOMPRESSED_8_BIT	0x1
+#define ENCODE_FORMAT_UNCOMPRESSED_10_BIT	0x2
+#define ENCODE_FORMAT_UNCOMPRESSED_12_BIT	0x3
+#define ENCODE_FORMAT_UNCOMPRESSED_14_BIT	0x4
+#define ENCODE_FORMAT_UNCOMPRESSED_16_BIT	0x5
+#define ENCODE_FORMAT_UNCOMPRESSED_20_BIT	0x6
+#define ENCODE_FORMAT_UNCOMPRESSED_24_BIT	0x7
+
+#define MSM_TPG_PAD_SRC		0
+#define MSM_TPG_ACTIVE_VC		0
+#define MSM_TPG_ACTIVE_DT		0
+
+#define TPG_MIN_WIDTH   1
+#define TPG_MIN_HEIGHT  1
+#define TPG_MAX_WIDTH   8191
+#define TPG_MAX_HEIGHT  8191
+
+#define TPG_GRP_ID 0
+
+enum tpg_testgen_mode {
+	TPG_PAYLOAD_MODE_DISABLED = 0,
+	TPG_PAYLOAD_MODE_INCREMENTING = 1,
+	TPG_PAYLOAD_MODE_ALTERNATING_55_AA = 2,
+	TPG_PAYLOAD_MODE_RANDOM = 5,
+	TPG_PAYLOAD_MODE_USER_SPECIFIED = 6,
+	TPG_PAYLOAD_MODE_COLOR_BARS = 9,
+	TPG_PAYLOAD_MODE_NUM_SUPPORTED_GEN1 = 9,
+};
+
+struct tpg_testgen_config {
+	enum tpg_testgen_mode mode;
+	const char * const*modes;
+	u8 nmodes;
+};
+
+struct tpg_format_info {
+	u32 code;
+	u8 data_type;
+	u8 encode_format;
+	u8 bpp;
+};
+
+struct tpg_formats {
+	unsigned int nformats;
+	const struct tpg_format_info *formats;
+};
+
+struct tpg_device;
+
+struct tpg_hw_ops {
+	int (*configure_stream)(struct tpg_device *tpg, u8 enable);
+	int (*configure_testgen_pattern)(struct tpg_device *tpg, s32 val);
+	u32 (*hw_version)(struct tpg_device *tpg);
+	int (*reset)(struct tpg_device *tpg);
+	void (*subdev_init)(struct tpg_device *tpg);
+};
+
+struct tpg_subdev_resources {
+	u8 lane_cnt;
+	const struct tpg_formats *formats;
+	const struct tpg_hw_ops *hw_ops;
+};
+
+struct tpg_device {
+	struct camss *camss;
+	u8 id;
+	struct v4l2_subdev subdev;
+	struct media_pad pad;
+	void __iomem *base;
+	struct camss_clock *clock;
+	int nclocks;
+	struct tpg_testgen_config testgen;
+	struct v4l2_mbus_framefmt fmt;
+	struct v4l2_ctrl_handler ctrls;
+	struct v4l2_ctrl *testgen_mode;
+	const struct tpg_subdev_resources *res;
+	u32 hw_version;
+};
+
+struct camss_subdev_resources;
+
+const struct tpg_format_info *tpg_get_fmt_entry(const struct tpg_format_info *formats,
+						unsigned int nformats,
+						u32 code);
+
+int msm_tpg_subdev_init(struct camss *camss,
+			struct tpg_device *tpg,
+			const struct camss_subdev_resources *res, u8 id);
+
+int msm_tpg_register_entity(struct tpg_device *tpg,
+			    struct v4l2_device *v4l2_dev);
+
+void msm_tpg_unregister_entity(struct tpg_device *tpg);
+
+extern const struct tpg_formats tpg_formats_gen1;
+
+extern const struct tpg_hw_ops tpg_ops_gen1;
+
+#endif /* QC_MSM_CAMSS_TPG_H */
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 6d048414c919e963d6eb0cba2a287015cb25416f..9ffc777d4bd7227166509bd836f73be15dae8cd0 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -21,6 +21,7 @@
 #include "camss-csid.h"
 #include "camss-csiphy.h"
 #include "camss-ispif.h"
+#include "camss-tpg.h"
 #include "camss-vfe.h"
 #include "camss-format.h"
 
@@ -52,6 +53,7 @@ struct camss_subdev_resources {
 	char *interrupt[CAMSS_RES_MAX];
 	union {
 		struct csiphy_subdev_resources csiphy;
+		struct tpg_subdev_resources tpg;
 		struct csid_subdev_resources csid;
 		struct vfe_subdev_resources vfe;
 	};
@@ -105,6 +107,7 @@ struct camss_resources {
 	enum camss_version version;
 	const char *pd_name;
 	const struct camss_subdev_resources *csiphy_res;
+	const struct camss_subdev_resources *tpg_res;
 	const struct camss_subdev_resources *csid_res;
 	const struct camss_subdev_resources *ispif_res;
 	const struct camss_subdev_resources *vfe_res;
@@ -112,6 +115,7 @@ struct camss_resources {
 	const struct resources_icc *icc_res;
 	const unsigned int icc_path_num;
 	const unsigned int csiphy_num;
+	const unsigned int tpg_num;
 	const unsigned int csid_num;
 	const unsigned int vfe_num;
 };
@@ -122,6 +126,7 @@ struct camss {
 	struct media_device media_dev;
 	struct device *dev;
 	struct csiphy_device *csiphy;
+	struct tpg_device *tpg;
 	struct csid_device *csid;
 	struct ispif_device *ispif;
 	struct vfe_device *vfe;

-- 
2.34.1


