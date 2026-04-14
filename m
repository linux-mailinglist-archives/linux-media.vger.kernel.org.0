Return-Path: <linux-media+bounces-58697-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qH99FN7K3WlGjQkAu9opvQ
	(envelope-from <linux-media+bounces-58697-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 07:04:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A43BC3F5A19
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 07:04:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9E79530C80B1
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 05:01:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 481AC29D27A;
	Tue, 14 Apr 2026 05:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L5L3neXs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YCXBJYGw"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6208424E4C3
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 05:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776142863; cv=none; b=Ueas/713BXedJnxSpdyEytmIpCwwwAxt0JTKvzpx1FR5kbExnfb9/XMB4fVZlmrIks7SV8PjaWjINFGczSSQ78wY+8bGzb9TbYxQiXgL+bwrL/TNQARKazlYtlKOTbrtz621hrm4ohGNlpeLcyZ0VlskTnHkyKAc+8JoIqHLSD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776142863; c=relaxed/simple;
	bh=edy2kMVwJlZrgW1tBAid4oqEWe4R7zlJ4fxPhhm9PSs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tldF7ZEfLv606bFisnH8L0EB3Autn7KOjVLsqSAuoMD5iB3LwDRN+UA8b02W+VKTyc2dlo1VS5Mxj3KUPI4WosLohkdUULvmEWeRljDTCf+7DLeDnn74XbhCMuuQ0VqpJpMIhmBgs/eGKDFrTzLPpJmLGC1motnRMz0T8bHoUxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L5L3neXs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YCXBJYGw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DLBIb62510997
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 05:01:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VsDgmQ4paNxvBDrunB3lIADe+Nf7UCMYP+LaiT3KX5o=; b=L5L3neXsZs848hg/
	l6VdIGmUzEXMYr19S+e8iv7Xy3hoDBcEIABJvCB1916Q4cyYVGs3YKdypRtJiiY0
	BAMmxssGm4N6UoWYH/4ahQhg9nVkJodsWnwrc5n0X1JC5LYao6AQOUkVp6e1eJxO
	rlcbV7X2Wqm/SiLxW5hzDfJ+l4fhF75WDPdCC/3ORz6UAg8dIPJ/hm7+MBwFomuM
	KI+2v/RDMbFDetThWntSa0enKl4LkMs6+pGrMlxNHloiZJ9wGPi2cutaBsYvX2v/
	AdSgZ7fOQlmM3IIkJg6NGRSPjHD+sZpUfjFovc08+Clj/e3SZwRdJd+KR5IejFZt
	wCX3nw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh867s22e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 05:01:01 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b461b36990so17298435ad.3
        for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 22:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776142860; x=1776747660; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VsDgmQ4paNxvBDrunB3lIADe+Nf7UCMYP+LaiT3KX5o=;
        b=YCXBJYGwYSFbrShUKuYZbFK+ny6I/ZPH6pUBW6U+h/zeenR5YJooH1ke3SUjpI5UHT
         5aXTCRn2CFeK6oaefyILNua9/BEXXv6v+cHGVvolCpdDY/LOkrzGA4yijFceh70wUc1D
         V6HQOX2BIiCLu9K8ZEj00QP+JanshafwAZpEvbFopYP4Zsl8bzWGKOchrEEP4uqYEBPZ
         uGpoZfHPFszpxcD33wisHPXYtjIhYQgvWG4kqCFOz6nwhkOp1rFa2tumBEY4pO94WkDW
         /0LYVOgXj8VnFm3qZiDs3qvokwu3dXqedaT/HgL2lIaBxWVnhCuwxmjOSMYHcXvjzM3S
         367A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776142860; x=1776747660;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VsDgmQ4paNxvBDrunB3lIADe+Nf7UCMYP+LaiT3KX5o=;
        b=QIHQaZEcwfkZy5P4FLPI1s1GLxLYO5Y7FK02tRoFbEwG9OtLBmp18oChUn/6uf+EVq
         YARp0CEekZVXCnza7qdbW6LgSYQoY5VW4BQDaMHbKsHvbHUa+/zkq3U4RbCs8diEJKej
         EX/bLZj4lIrRHDsqJ7Y/P7g+u5jumj1BrHW6YwdfGMVDTGycYB28d+33oNon4Ufy45G0
         uzQSNggNZ06Pmjg5S6dwB4lOunBkhYibc0u5Z8pCnVTNgS5qhEGZBlnThywrZD8S+Kqx
         ejyaoAX/AtLwUmuVVZfrEzfxO3iHP4j0CY9x2o/RWT5nVvw9YWnPSAuOxTS3MIDV1pFY
         9lUQ==
X-Gm-Message-State: AOJu0YyVQ2Pni3FpVqYvQDaFi7m+RtD7JteBX1DoX5kKjXYktMB8uuwq
	bAs0mQ6lXzIIjzyNMcfr6d9Gu8RCBsQUQCAcgE/W7opiGnQI47SrE7XddQ10ic0GlfT6IwyDdFm
	TMngMCWF6NQhmh3NhbemYaoFyqt1ODh2Cz1tLqT7JK1KgqUkmy5vFs0/Z614kuq9kog==
X-Gm-Gg: AeBDieuUeNBkK37VY8Muy875Hogg7tWSZbjbHX5JiCG3qRndfrUl//buxNbZxN1+dAA
	+b1zRCeIyJXMaWGk6tT3c0V6X5PdUC3t8lZclBjisiG5RAPeyqGhDY+PYKEmxNMYavB9C2YX8Pv
	rZdVIqzVw0gvtCeVGjOYhIk+cCg1DuSjqzhBGBY5IEl6/MN6Iby2V7r7JqTM7216NGG3oV1bqld
	KRIbCyONkTdtJzoGjzuLAsKI6x1/lAbe1lOI3t8f8gmlPruz/VuB8IZMyA/vcZ8j4m4HreBBjG6
	mludPlGT88tOHlyjSjPnLTzt+csBj+cPj0YNEUvbH//QYYu9aSRefXSsLHgsI91mC2GQT8r9oMh
	DGpjd2q8jyVX0V3ovvcZwLtvBv2WzqxMddmQpOhZIF+Hk05N+B8IP0F8=
X-Received: by 2002:a17:903:2c10:b0:2b2:e6e8:3c09 with SMTP id d9443c01a7336-2b2e6e83e45mr89105365ad.40.1776142860056;
        Mon, 13 Apr 2026 22:01:00 -0700 (PDT)
X-Received: by 2002:a17:903:2c10:b0:2b2:e6e8:3c09 with SMTP id d9443c01a7336-2b2e6e83e45mr89104685ad.40.1776142859413;
        Mon, 13 Apr 2026 22:00:59 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4db198asm134678425ad.3.2026.04.13.22.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 22:00:59 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 10:30:01 +0530
Subject: [PATCH 05/11] media: iris: Enable Secure PAS support with IOMMU
 managed by Linux
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-glymur-v1-5-7d3d1cf57b16@oss.qualcomm.com>
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
In-Reply-To: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776142821; l=6543;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=AK/IikVbNscMxyS51GbRl4z1SBPDNtAAb/8F+AsSepE=;
 b=L2f4JzXOExhbuC0QmwJjObxFietbVV6/UlJnKknEqH/nhBNVsZBo6DSZ3kjuaQRH8kxVlLYQu
 /gJ7ARIx+pPACOhxXHylsS+h9GM3TQp7p5K+BNwKSqDJZAjdQvGWPkb
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-ORIG-GUID: j0J99Qis2xx84syes0WLZ-4wx0U1tZRc
X-Proofpoint-GUID: j0J99Qis2xx84syes0WLZ-4wx0U1tZRc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA0NSBTYWx0ZWRfX60EHnQHhp2Gp
 stuQXCoolDOprVgogI47PmeyAKUg4w5Sd2/qXQNQdD7Nn5eSfFogZGKcNEZmZBSsfRegcyWAdrv
 ufHMzKUUheORchZ6es8lQZrcQ896RXMvEUAtlrfm5oMs6kko+nry6lxsseOZhunJcOT3Iiv0qWW
 6Rs+uMix8dDSOFOZJZzHEsGRz+El4+D89j8Y4uzFyEbWMLvbnN/CJTIuyvXi6q5pIbyK9l6ProO
 gye7lI0PkTtBHJSWeVw2eYcQXmABNj4mji3gqOGWlHBPQ+upnNB81HWx5ZRdGc2OgYfCDICWHvP
 hQGTCLo9zCR91mM+SGbK/Y/ql/4/xAez+thk2+I+aLoL0qU/udZVOa9FDk3kjWKCBcUHj4oOrcI
 7XhMwG500SsopNxfi4/2JkILZ9X4RR3UOZ9EHtWX+ydk+rxnBAp8S06kVeRoUCpCyKlSKkNuZuo
 IpCElT9DGy2WyK/5KEw==
X-Authority-Analysis: v=2.4 cv=etzvCIpX c=1 sm=1 tr=0 ts=69ddca0d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=XipGDMX4SS2hnaP5fVAA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140045
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58697-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A43BC3F5A19
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

Most Qualcomm platforms feature a proprietary hypervisor (such as Gunyah
or QHEE), which typically handles IOMMU configuration. This includes
mapping memory regions and device memory resources for remote processors
by intercepting qcom_scm_pas_auth_and_reset() calls. These mappings are
later removed during teardown. Additionally, SHM bridge setup is required
to enable memory protection for both remoteproc metadata and its memory
regions.

When the hypervisor is absent, the operating system must perform these
configurations instead.

Support for handling IOMMU and SHM setup in the absence of a hypervisor
is now in place. Extend the Iris driver to enable this functionality on
platforms where IOMMU is managed by Linux (i.e., non-Gunyah, non-QHEE).

Additionally, the Iris driver must map the firmware and its required
resources to the firmware SID, which is now specified via iommu-map in
the device tree.

Co-developed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.h     |  4 ++
 drivers/media/platform/qcom/iris/iris_firmware.c | 71 +++++++++++++++++++++---
 2 files changed, 66 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index fb194c967ad4..aa7abef6f0e0 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -34,6 +34,8 @@ enum domain_type {
  * struct iris_core - holds core parameters valid for all instances
  *
  * @dev: reference to device structure
+ * @dev_fw: reference to the context bank device used for firmware load
+ * @ctx_fw: SCM PAS context for authenticated firmware load and shutdown
  * @reg_base: IO memory base address
  * @irq: iris irq
  * @v4l2_dev: a holder for v4l2 device structure
@@ -77,6 +79,8 @@ enum domain_type {
 
 struct iris_core {
 	struct device				*dev;
+	struct device				*dev_fw;
+	struct qcom_scm_pas_context		*ctx_fw;
 	void __iomem				*reg_base;
 	int					irq;
 	struct v4l2_device			v4l2_dev;
diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
index 5f408024e967..93d77996c83f 100644
--- a/drivers/media/platform/qcom/iris/iris_firmware.c
+++ b/drivers/media/platform/qcom/iris/iris_firmware.c
@@ -5,6 +5,7 @@
 
 #include <linux/firmware.h>
 #include <linux/firmware/qcom/qcom_scm.h>
+#include <linux/iommu.h>
 #include <linux/of_address.h>
 #include <linux/of_reserved_mem.h>
 #include <linux/soc/qcom/mdt_loader.h>
@@ -13,12 +14,15 @@
 #include "iris_firmware.h"
 
 #define MAX_FIRMWARE_NAME_SIZE	128
+#define IRIS_FW_START_ADDR	0
 
 static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 {
+	struct device *dev = core->dev_fw ? core->dev_fw : core->dev;
 	u32 pas_id = core->iris_platform_data->pas_id;
 	const struct firmware *firmware = NULL;
-	struct device *dev = core->dev;
+	struct qcom_scm_pas_context *ctx_fw;
+	struct iommu_domain *domain;
 	struct resource res;
 	phys_addr_t mem_phys;
 	size_t res_size;
@@ -29,13 +33,17 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 	if (strlen(fw_name) >= MAX_FIRMWARE_NAME_SIZE - 4)
 		return -EINVAL;
 
-	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
+	ret = of_reserved_mem_region_to_resource(core->dev->of_node, 0, &res);
 	if (ret)
 		return ret;
 
 	mem_phys = res.start;
 	res_size = resource_size(&res);
 
+	ctx_fw = devm_qcom_scm_pas_context_alloc(dev, pas_id, mem_phys, res_size);
+	if (IS_ERR(ctx_fw))
+		return PTR_ERR(ctx_fw);
+
 	ret = request_firmware(&firmware, fw_name, dev);
 	if (ret)
 		return ret;
@@ -52,9 +60,27 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 		goto err_release_fw;
 	}
 
-	ret = qcom_mdt_load(dev, firmware, fw_name,
-			    pas_id, mem_virt, mem_phys, res_size, NULL);
+	ctx_fw->use_tzmem = !!core->dev_fw;
+	ret = qcom_mdt_pas_load(ctx_fw, firmware, fw_name, mem_virt, NULL);
+	if (ret)
+		goto err_mem_unmap;
+
+	if (ctx_fw->use_tzmem) {
+		domain = iommu_get_domain_for_dev(core->dev_fw);
+		if (!domain) {
+			ret = -ENODEV;
+			goto err_mem_unmap;
+		}
+
+		ret = iommu_map(domain, IRIS_FW_START_ADDR, mem_phys, res_size,
+				IOMMU_READ | IOMMU_WRITE | IOMMU_PRIV, GFP_KERNEL);
+		if (ret)
+			goto err_mem_unmap;
+	}
 
+	core->ctx_fw = ctx_fw;
+
+err_mem_unmap:
 	memunmap(mem_virt);
 err_release_fw:
 	release_firmware(firmware);
@@ -62,6 +88,19 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 	return ret;
 }
 
+static void iris_fw_iommu_unmap(struct iris_core *core)
+{
+	bool use_tzmem = core->ctx_fw->use_tzmem;
+	struct iommu_domain *domain;
+
+	if (!use_tzmem)
+		return;
+
+	domain = iommu_get_domain_for_dev(core->dev_fw);
+	if (domain)
+		iommu_unmap(domain, IRIS_FW_START_ADDR, core->ctx_fw->mem_size);
+}
+
 int iris_fw_load(struct iris_core *core)
 {
 	const struct tz_cp_config *cp_config;
@@ -79,10 +118,10 @@ int iris_fw_load(struct iris_core *core)
 		return -ENOMEM;
 	}
 
-	ret = qcom_scm_pas_auth_and_reset(core->iris_platform_data->pas_id);
+	ret = qcom_scm_pas_prepare_and_auth_reset(core->ctx_fw);
 	if (ret)  {
 		dev_err(core->dev, "auth and reset failed: %d\n", ret);
-		return ret;
+		goto err_unmap;
 	}
 
 	for (i = 0; i < core->iris_platform_data->tz_cp_config_data_size; i++) {
@@ -93,17 +132,31 @@ int iris_fw_load(struct iris_core *core)
 						     cp_config->cp_nonpixel_size);
 		if (ret) {
 			dev_err(core->dev, "qcom_scm_mem_protect_video_var failed: %d\n", ret);
-			qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
-			return ret;
+			goto err_pas_shutdown;
 		}
 	}
 
+	return 0;
+
+err_pas_shutdown:
+	qcom_scm_pas_shutdown(core->ctx_fw->pas_id);
+err_unmap:
+	iris_fw_iommu_unmap(core);
+
 	return ret;
 }
 
 int iris_fw_unload(struct iris_core *core)
 {
-	return qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
+	int ret;
+
+	ret = qcom_scm_pas_shutdown(core->ctx_fw->pas_id);
+	if (ret)
+		return ret;
+
+	iris_fw_iommu_unmap(core);
+
+	return ret;
 }
 
 int iris_set_hw_state(struct iris_core *core, bool resume)

-- 
2.34.1


