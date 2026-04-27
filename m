Return-Path: <linux-media+bounces-59677-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJg/Cilc72m3AgEAu9opvQ
	(envelope-from <linux-media+bounces-59677-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 14:52:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C64472D7D
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 14:52:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A9D6130D5DBC
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 12:47:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A27AD3C345A;
	Mon, 27 Apr 2026 12:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WxzE5sKU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Eiagujgi"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978E53BFE4A
	for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 12:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777294015; cv=none; b=KgX+yqKcYo/mn+HaI9KKlhWop8CECapQ82VOhzdPHXeM7eJEuZDOkJd/p1VHP+9zvEOBcLwwMyiZbm5/azq43DCJJDn0Seph6Ks8msEl6PSGGIV1/1oJWSvX3ICZ6vDQT354I0YA7QZWKld+qSjxA7+0veKlZDA2ReaqrIGefFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777294015; c=relaxed/simple;
	bh=KTYQxoDHRK+AaxLzVW7P0uYiEE/yFjt5Rigb2R9yyTw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NCRnzliHfPvAz+jZLyld/AUxxCBbcWwwNVbb9QqW6k4MyA1n1AmxhCztRZl1tR/2yX/c4ZqZI9UYyGMerB5h69VFHVnJhYNfvmzjPsnkO1aTk0EM4G0Qmq8nOsX466+EBabRdTHT9ir4Oxg0iP06m3hEXX/EHVy7Pd3j1Aokn+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WxzE5sKU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Eiagujgi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TAK2665646
	for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 12:46:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gnBfolT3jX6CNISr4JxMcRA7ySnkS3THYsCQYykqpxA=; b=WxzE5sKUJY2CJxiK
	nESqJSdcWh/FJc+J3JBtN8HnTz1fuuzS2hrg2UBweobcL19MDT/Ouoo/xFeQd3ef
	brOpMDIlzKWfnwMzo0vpi96xZNEYl3/6sFYyfM3JpDQwuo17LIbvTzSYExoOtuOx
	w/UGwb+fLTsRArABEHW8tBnA9/yv7t73qemSza51qf4KcM5QKRNW0BkWiCAHw/XR
	rbmYp7hgCbOvaLbsjXY6PLz/OsVyAH78giWn9zdIk59Kw0W0glVd/Dbmxu7KposP
	48DeUl1MXSf+mwNN8sNf6FZBBX3F4//h/6Ub13Z2qk9IobI5uozO2qGEsLUMfbqc
	ieehiQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt30n1d45-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 12:46:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8eaee67d1bcso1402791985a.0
        for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 05:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777294012; x=1777898812; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gnBfolT3jX6CNISr4JxMcRA7ySnkS3THYsCQYykqpxA=;
        b=Eiagujgi36awTPYrqmRdkgP6OU+ORKOONattM93eKzMuWQOYUkncHbu2czqXE0FikC
         1nzb/NaoPYD9OuRu6Fi6sUA9IIcsbvZz2+jYtTf0iQnP5rfBBqpzuESUl4knkuLUpbkk
         oo1t4YinT12rgK9ig+igwq8TslHxiO2CrbAJLNPQRjEhdOeIKofSTXGyXOPvA2WskqYi
         XSulytnKA/Q2u9KxiZKENzeaHlpNZRHdumLZENklZxNExhO1aI6zUkyUn5lbqeCj6UAV
         4c8bq4shcRPJhHHcu5ykPpdRRuG6UI60NzCyXwKfqt3g7bs8kkaseDI+wZW+YUqL7pon
         DxAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777294012; x=1777898812;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gnBfolT3jX6CNISr4JxMcRA7ySnkS3THYsCQYykqpxA=;
        b=ZNMIUS8bs40MPtdtQJH868t2eHdU2aKnlYpF/TCHcnvSd+q866BZdCPbi+hHHRtob6
         I2nYifw4Ys6oitqcFTm0szb9grXzZWXDHv36se05iqDY71BWaR0U92dt7Z4EYdxneBJ6
         xIu+hZR1A5iClIseKUvHq/EP+EyED3ZT+YYeF4l1ZUcRdhAdHl0GEaa2xdChumrfkVLo
         k2WbU0NZkpqYBcyrajuO1CYifpr4JMexYsptW+mySSTpJ1IJ1cXQG8guhvDNlAF+l4zC
         bth09GRLF6VuXxVN/cbRMoBRYtswTADJghgKWu3vwNB2xDaSRQEcxkIxEw/Ujbu5jEQq
         VR2w==
X-Gm-Message-State: AOJu0YymD8Cd00n7CsTwByZXbVauTe+nB5CdL5FNRh+72fyCxok1cCBd
	UAxOImEPryUR01yWFrHY760mgh7jp6fiQUbWHWBS1SoS42NLK1E9MxfzwNufFElXohdaiwycDMF
	IxuoDMJJte/sviqcu1iv7d971J8I1mvCXdQnC2ZPTNRi5Q2E/Si21JqtwaEcNuoui1Q==
X-Gm-Gg: AeBDies6AmmdRbpAwYfMtVUo1c4JLd8BGkxeLCjAvrOFubBFDlh9zniCW2WEddpWLHf
	el9P2UKGndLyjBve2zReNw52FikVQdYt1aWzpxvuKhZebJ15kMoCbxOEQVRASvSCp+P6Ft8pkT5
	U02/0byahFpbcPN5wcflPFpj/d5bwUcckzhHW5ZmoPJ44fvpXfHlroiWHKyIPbRKBuiK+Gwz1te
	BGgphnBsi1+kip9ZnFdabJ+BqYvbwVVNc2IGvHQYHXHMMYLqwq8KgBQ7waCbWPR2d1w9MwQtXZL
	CQkSWmUT/XXtvyEx1k7EJ+v5UUSJiAGELp2DEaBbERVst6MCR0RCj5fKhh4An6l7xDNeWbni+jh
	3y0mILpK/j34n+gSDkM6lC3+Y3wyABjnvggde8i10xrOUb7iL7egVtbs9IwFs1HoFC2LWUnd4jG
	8NOr1QzG8ikFKBAPlOFEWbVp+yuNs=
X-Received: by 2002:ac8:5895:0:b0:50d:ce35:6e67 with SMTP id d75a77b69052e-50e36eba371mr600763551cf.42.1777294011610;
        Mon, 27 Apr 2026 05:46:51 -0700 (PDT)
X-Received: by 2002:ac8:5895:0:b0:50d:ce35:6e67 with SMTP id d75a77b69052e-50e36eba371mr600763061cf.42.1777294011031;
        Mon, 27 Apr 2026 05:46:51 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:653f:4d28:6a78:a6ca])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba454d1bd19sm1091496866b.37.2026.04.27.05.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 05:46:50 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 14:43:36 +0200
Subject: [PATCH v2 09/14] media: qcom: camss: Add camss-isp-params helper
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-camss-isp-ope-v2-9-f430e7485009@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEzNSBTYWx0ZWRfX1GbDgfGKwtj7
 fwAWZjFSVyniQWG7fudGbn8aggQ5eJLZuJtO+iGduPhyH6NAKDv3UaRaUt3qUU7lMG+8SlCKB6q
 Wb3868w9V8o692rebDuk1yP++vp0FDTMBPSlQKJwVmAqqmQn0FHuTLUEA08s/aBYaXDPj79YHLE
 UmbkMjCLugJDyN9x/t7Lx3eFPIth5GnGBLG99VZ7PDFs3z/dCeUBCPfjIv+rrQW1tNAflkFyogu
 IEN2+YaGbtT6bQrRtJJtstgUJrGaCjwqyPD6uTli8Pb5X8LkLmkvV3OFFYxReV/09ybNkMb+nWJ
 vsp+VxHKx/FabwACFv2giBQwz4yk64nRyDqqi3IqY241uUeKSTIdyRUr8Feozwt2IgpIs2gcNwq
 n1DQR51CYv5w0mAXOgqn1kEtnkQZUaVL/bnZ/dLUbiAji0vTxMY21uuxo4I9dLgQBtXO7AYmAyW
 sa69oIPiNrZZF9jL/cQ==
X-Proofpoint-GUID: ZFW5dALX3OHKe12aI3PLYl6AqS_txE3J
X-Authority-Analysis: v=2.4 cv=efANubEH c=1 sm=1 tr=0 ts=69ef5abc cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=ELVW7ba-Z2avb-AJsJIA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: ZFW5dALX3OHKe12aI3PLYl6AqS_txE3J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270135
X-Rspamd-Queue-Id: 72C64472D7D
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
	TAGGED_FROM(0.00)[bounces-59677-lists,linux-media=lfdr.de];
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

Add an ISP parameter buffer parser for CAMSS offline ISP drivers.
camss_isp_params_apply() wraps the upstream v4l2-isp buffer validation
and adds a dispatch layer: after validation each block is forwarded
to a driver-supplied handler indexed by block type.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/Makefile         |  3 +-
 .../media/platform/qcom/camss/camss-isp-params.c   | 67 ++++++++++++++++++++++
 .../media/platform/qcom/camss/camss-isp-params.h   | 62 ++++++++++++++++++++
 3 files changed, 131 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index f3acb1b54b6c1455d72e2d947c860f0c337648de..fba6f34b8d9f70ea258f7ae1a293a8d58d866498 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -32,7 +32,8 @@ obj-$(CONFIG_VIDEO_QCOM_CAMSS) += qcom-camss.o
 
 qcom-camss-isp-objs := camss-isp-bufq.o \
 		camss-isp-sched.o \
-		camss-isp-pipeline.o
+		camss-isp-pipeline.o \
+		camss-isp-params.o
 
 obj-$(CONFIG_VIDEO_QCOM_CAMSS_ISP) += qcom-camss-isp.o
 
diff --git a/drivers/media/platform/qcom/camss/camss-isp-params.c b/drivers/media/platform/qcom/camss/camss-isp-params.c
new file mode 100644
index 0000000000000000000000000000000000000000..66dc717bb3a2a26707d206e537691deb4d58f04d
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-isp-params.c
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * camss-isp-params.c
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
+#include "camss-isp-params.h"
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
diff --git a/drivers/media/platform/qcom/camss/camss-isp-params.h b/drivers/media/platform/qcom/camss/camss-isp-params.h
new file mode 100644
index 0000000000000000000000000000000000000000..4cedfbc745f81655569ff8bdd8e389b35f2c67a7
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-isp-params.h
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * camss-isp-params.h
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
+#ifndef CAMSS_ISP_PARAMS_H
+#define CAMSS_ISP_PARAMS_H
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
+#endif /* CAMSS_ISP_PARAMS_H */

-- 
2.34.1


