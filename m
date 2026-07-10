Return-Path: <linux-media+bounces-67252-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id israOTa2UGpi3wIAu9opvQ
	(envelope-from <linux-media+bounces-67252-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 11:07:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C325A738D3C
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 11:07:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=irvF8Mfa;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bVBgYIOG;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67252-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-67252-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AA797304C0A7
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 09:05:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7CAF3DCD8F;
	Fri, 10 Jul 2026 09:05:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BD53DB31A
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 09:04:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783674301; cv=none; b=PowUWBU0kj7C1Ce+A1W9yf9Dq4RWo4UtcLEN1x9uIY0GAlqI9LSOGKSr30xvZt87M7sINUucxb1FlQu4stzuKR9mVUYYJKhbi0SJmWHR+58zrV7wvQ0ZFAScd7JLzSL6NmuSF1sgYxkjsr6iV6Ggm+8lMM5LEwLlv5NjB5mmdLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783674301; c=relaxed/simple;
	bh=QBbw+M6NM/7xN/mb/n4EhswLHY92P8G06BHphqlIqXQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SUgYZHmiT1l5cJFbyuOKVMg5A5dfBm3mOnw3ThuzMnf2+hfCIIdqvKRwtRri5xO+iro/gj4BcBJOBicHIGvT8+piEoL/apnvs2k1Rjr+V7dL7QKPjoQVqg18eiHBUzSvtw0joloH7/1VUEDb9W00ao5DAB2afVYuqjlS3R0aH9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=irvF8Mfa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bVBgYIOG; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A7dN68182277
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 09:04:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9beixJbeJJsoRWLUTkdRDRxoNyd2rNMiM72fJceYNRM=; b=irvF8MfaPyLrVmL6
	M+CIBFXO5yeirklARUCZDXTEV6g6ouCgEvsMrvecDmv2fuHYF87HhvhWG354WAcE
	ggjegVmBklfvX/KO1Dw80cTdXKCy3ITk1+COfVBsNv49dI8UnA5HvIaRMOayOat9
	9zXpJ9Ngj/aQVo/oUdU3Jy3mCsEMwxOIntmq//yI/qGYhN2d7MQ95PVxMa72caYH
	k8uC4wsfUOEtTsrvHf7WpNN4m+aRvTOVh26MXbdiRnuoIVkg2xjN34Sqj/jZOzSS
	gN88zk48iHQchDsngOTdLgn54H8Wy+CAaBLgdC7I9xKXKdApXeFcL+kJnvhkYDYS
	7ljBqA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fajte2aay-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 09:04:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51a8b0a08d2so5946711cf.0
        for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 02:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783674298; x=1784279098; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9beixJbeJJsoRWLUTkdRDRxoNyd2rNMiM72fJceYNRM=;
        b=bVBgYIOG321ZEjaVPvSyq62iCy7sc4GLVP6A1/3zUq7k8gVEFn01mKPVdpx2bwv5u3
         7wkuujmxc4hdarqnBm33lRI2U3YiIpqjPNbPhFOLL8mRO16kQ7QrpkensCsJcoYVU6Z7
         5Q/b6fauXiRgvs21bxKf0n+0l+QsXDOQk/dFJqlo2PDr0RQNIZt5o5nv+Bl/0PbgawmJ
         OkEQfnQ2vMNfgiHaI5DV2EaqV1qAZ8RQqcuDvFd4RDPP3oGjc3LnwArS9s4KImkZWr6S
         b/eGg6YCRAAFDGINdlqXzEtyOcURDk3C92dIqigVgUwqLHEP09ltqAvkd0zJ3KYFRWuZ
         9z4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783674298; x=1784279098;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9beixJbeJJsoRWLUTkdRDRxoNyd2rNMiM72fJceYNRM=;
        b=cTRJ/gGIoVRToNV+/67Fa6Czz3kY/LtDHUMNTN54kgNNhi4gTQHfIzT1epw5EUXAEc
         ZCzX39onixIOQV7LIpf6Q3ttm/TkxPfZayQQhFtIQDm+27E0Qog1awZhFfwl5A0shZv0
         BbQKsY0b0cWvmIJHagH64+il0z1HgL3OXlwtzbRYB0VAoQdceaTVID8tIy8CydD4toyc
         YVmI3vWr/KZHGXX1NFFjy6q0I0j6S4cOejzIX1w7Hjo8g+DHx+eFzJ3XuIflW+whl+f1
         VrUPFZCSmgZfWrZI9dosaO2OFtrbHwNMhTFrs4jjbL/AYGQQ/BNu7D0dM+GjCGjfmeOY
         d4mw==
X-Forwarded-Encrypted: i=1; AHgh+RrF8r0C7m/QFORy9YY3p5kD+GaXpVcy9vSQ4S9JbjoCIjoncKUE+GG00uUKXcneFx9Ptys9WKLbDFz8dQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxsdiQPlch5OZZuI9xy4rH1EW+fX4T2AqGN3FJFak6AeZdipK48
	QkWINZDtpyxljkDobvRXF7UO9aQVFvz7z7Y+RtQKILjo+YZ+DBQM775xE1r3EYhgK4nmNouqLH2
	2dq7+DQjsX6K+rSpBJgMfvUvWTlGDZBb9vwk4cbq0dv03s4Sk0kBuJ3YtLwj3FaFCXg==
X-Gm-Gg: AfdE7ckMWx6P5c9v/gMJU0xKqZDsHKpLRkb3WSfIvOQ+A8j6lLqWkGW+gjU9SFYCG4M
	yySRy768CmLQGUusph/JeI7nFgP+CKDkFXyJQXY6p7G7uhz2xAJkFv1mywSXLpKoMNbCk8woOx3
	V+RyUU2oKP4A05XTGxo6MhHLjY0CkT0qYnsb1l6wTmKhtWNF9hwrYwS1WfIUQtgjfHlHoVW0Dku
	l2DVutdH3rblXPO5KSF/jvLOIFQVbgzWzBSa8efo0ff55WtBAhGuUBxyQlK/B+RmDR3Z2IMevpk
	yphU3+LkmEPiPz0TDUaU0kO7Vr79Xrvz1TYR94MLRwuyoX6OABJ5ux9CNIgl5e1mBwUFk7uQjMX
	Myjfw7852k3rTH/R7IDEi5l25rXILASlmyiRAXKO7fe14LDuy0xxUfmUxjZb+Bfg4wuuCFCXPne
	KFEIvVJt4OEO73n1DakthNB2FuoofvQkg2/W6aAb1wbiwMoGLC/tifEnfOixmENw==
X-Received: by 2002:ac8:7d85:0:b0:51c:7b13:62f8 with SMTP id d75a77b69052e-51c8b438a5cmr111756921cf.78.1783674298052;
        Fri, 10 Jul 2026 02:04:58 -0700 (PDT)
X-Received: by 2002:ac8:7d85:0:b0:51c:7b13:62f8 with SMTP id d75a77b69052e-51c8b438a5cmr111756501cf.78.1783674297528;
        Fri, 10 Jul 2026 02:04:57 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([82.64.236.198])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15dfda815dsm259932266b.36.2026.07.10.02.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 02:04:56 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 11:04:48 +0200
Subject: [PATCH v4 2/7] media: qcom: camss: Add camss-params helper
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-camss-isp-ope-v4-2-51207a0319d8@oss.qualcomm.com>
References: <20260710-camss-isp-ope-v4-0-51207a0319d8@oss.qualcomm.com>
In-Reply-To: <20260710-camss-isp-ope-v4-0-51207a0319d8@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: ZGSJ5uHcgAmTQwE_4M-M_0U4UqmJv3Pn
X-Proofpoint-ORIG-GUID: ZGSJ5uHcgAmTQwE_4M-M_0U4UqmJv3Pn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA4OCBTYWx0ZWRfX3aZ7ugfrP1+A
 dfI1Jkg1B9s73yz5jJ7MSXZt7YAgQU7C2aBuqRPyQoahus8B6vTXd1mFyUVGIR8jZPIOQWHGE7w
 1g1EmHYpPPbVFa0YjO2TBkjMi901bm+eJ5kyIAFV6R3ptX3PCeDyMfV/NvwC0rlf/t4ik0XgNDp
 5LiVVcRBOENKEgLfZgkz6wbx/q+HZDP8Pi8A3KfCAtabEa54CCR8ajwFMI894XU904lWjgPS35W
 4ciOrpKJLmXfSG9nO9bbbj56dCcL/2QYqGaeoI5H04B2osl1aNzZHvGD2TcCRjOknKI+0cK/sEX
 sRRo9CUJq9ysF8BLO91EPOubn6lKpf1XO3dKhiAJaat3vrHHq0BJ34hMiuoPHffI5UxIadxHskh
 KQQgPI+UE0kZF1UeesVjDK76XZfTfwwJvE4oJqJYmcGlTFUW+6BkicHpMcDw6DzoZURgOV1HzI6
 kMoXyfF7uq5bGlhU+Lw==
X-Authority-Analysis: v=2.4 cv=N7MZ0W9B c=1 sm=1 tr=0 ts=6a50b5bb cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ELVW7ba-Z2avb-AJsJIA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA4OCBTYWx0ZWRfX2c3p2/7l87mI
 yxUl50WNopMRkvXIzI/o+A7FCRq4/mKPgJWj1lALUTudfY70OUcMlPj32S6CXsRNwzerAL9Nr9Q
 v2qVdeoqYOPIO+aP6s/yOKFp2NRQY4M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100088
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67252-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C325A738D3C

Add V4L2 ISP parameter buffer validation helpers for CAMSS ISP drivers.
Provides buffer size validation and per-block type validation for the
extensible V4L2 ISP parameters buffer format.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/Makefile       |  1 +
 drivers/media/platform/qcom/camss/camss-params.c | 67 ++++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-params.h | 62 ++++++++++++++++++++++
 3 files changed, 130 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index 0d133ddc08be088678994820c0ac64e761884611..5678621efb6780b67a043ec8a2e914cce02d9b98 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -28,5 +28,6 @@ qcom-camss-objs += \
 		camss-video.o \
 		camss-format.o \
 		camss-pipeline.o \
+		camss-params.o \
 
 obj-$(CONFIG_VIDEO_QCOM_CAMSS) += qcom-camss.o
diff --git a/drivers/media/platform/qcom/camss/camss-params.c b/drivers/media/platform/qcom/camss/camss-params.c
new file mode 100644
index 0000000000000000000000000000000000000000..ebb75a191d37551b4616a048ed39408f219d7daa
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-params.c
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * camss-params.c
+ *
+ * CAMSS ISP parameter buffer parser.
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/kernel.h>
+#include <media/videobuf2-core.h>
+#include <media/v4l2-isp.h>
+
+#include "camss-params.h"
+
+int camss_isp_params_apply(struct device *dev,
+			   struct vb2_buffer *vb,
+			   const struct v4l2_isp_params_block_type_info *type_info,
+			   const camss_isp_params_handler_fn *handlers,
+			   unsigned int num_handlers,
+			   void *priv)
+{
+	const struct v4l2_isp_params_buffer *buf;
+	unsigned int remaining;
+	unsigned int offset = 0;
+	int ret;
+
+	ret = v4l2_isp_params_validate_buffer_size(dev, vb,
+					v4l2_isp_params_buffer_size(CAMSS_PARAMS_MAX_PAYLOAD));
+	if (ret)
+		return ret;
+
+	buf = vb2_plane_vaddr(vb, 0);
+
+	ret = v4l2_isp_params_validate_buffer(dev, vb, buf, type_info, num_handlers);
+	if (ret)
+		return ret;
+
+	dev_dbg(dev, "params: version=%u data_size=%u\n", buf->version, buf->data_size);
+
+	remaining = buf->data_size;
+
+	while (remaining >= sizeof(struct v4l2_isp_params_block_header)) {
+		const union camss_isp_params_block *block =
+			(const union camss_isp_params_block *)&buf->data[offset];
+		u16 type  = block->header.type;
+		u32 bsize = block->header.size;
+
+		if (type < num_handlers && handlers[type])
+			handlers[type](priv, block);
+		else
+			dev_dbg(dev, "params: no handler for block type %u\n", type);
+
+		offset += bsize;
+		remaining -= bsize;
+	}
+
+	dev_dbg(dev, "params: buffer parsed successfully\n");
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(camss_isp_params_apply);
+
+MODULE_DESCRIPTION("CAMSS ISP parameter buffer parser");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/platform/qcom/camss/camss-params.h b/drivers/media/platform/qcom/camss/camss-params.h
new file mode 100644
index 0000000000000000000000000000000000000000..058e3f158b42d39512301d412a983fb2f34dab21
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-params.h
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * camss-params.h
+ *
+ * CAMSS ISP parameter buffer parser.
+ *
+ * Wraps the upstream v4l2_isp_params_validate_buffer() validation and adds
+ * a dispatch layer: after validation each block is forwarded to a
+ * driver-supplied handler.
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef CAMSS_PARAMS_H
+#define CAMSS_PARAMS_H
+
+#include <linux/types.h>
+#include <media/v4l2-isp.h>
+#include <uapi/linux/camss-config.h>
+
+#define CAMSS_ISP_PARAMS_FMT_INIT \
+	{ .fourcc = V4L2_META_FMT_QCOM_ISP_PARAMS, .depth = 8, .align = 0, .num_planes = 1 }
+
+#define CAMSS_ISP_PARAMS_FL_BLOCK_DIRTY   (1U << V4L2_ISP_PARAMS_FL_DRIVER_FLAGS(0))
+
+struct device;
+struct vb2_buffer;
+struct camss_isp_fmt;
+
+union camss_isp_params_block {
+	struct v4l2_isp_params_block_header header;
+	struct camss_params_wb_gain         wb_gain;
+	struct camss_params_chroma_enhan   chroma_enhan;
+	struct camss_params_color_correct  color_correct;
+};
+
+typedef void (*camss_isp_params_handler_fn)(void *priv, const union camss_isp_params_block *block);
+
+/**
+ * camss_isp_params_apply - validate and dispatch a params buffer
+ *
+ * @dev:          device for error logging
+ * @vb:           the vb2 buffer (used for size validation)
+ * @type_info:    per-block-type validation info, indexed by block type
+ * @handlers:     per-block-type handlers, indexed by block type
+ * @num_handlers: number of entries in @type_info and @handlers
+ * @priv:         opaque pointer forwarded to each handler
+ *
+ * Calls v4l2_isp_params_validate_buffer_size(), then
+ * v4l2_isp_params_validate_buffer(), then walks the validated block stream
+ * dispatching each block to its handler.
+ *
+ * Returns 0 on success, negative errno on validation failure.
+ */
+int camss_isp_params_apply(struct device *dev,
+			   struct vb2_buffer *vb,
+			   const struct v4l2_isp_params_block_type_info *type_info,
+			   const camss_isp_params_handler_fn *handlers,
+			   unsigned int num_handlers,
+			   void *priv);
+
+#endif /* CAMSS_PARAMS_H */

-- 
2.34.1


