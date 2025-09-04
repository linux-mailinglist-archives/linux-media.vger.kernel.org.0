Return-Path: <linux-media+bounces-41786-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C7105B44609
	for <lists+linux-media@lfdr.de>; Thu,  4 Sep 2025 21:01:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41ABC188DDA3
	for <lists+linux-media@lfdr.de>; Thu,  4 Sep 2025 19:01:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A7D920102B;
	Thu,  4 Sep 2025 19:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="g9PWZNCz"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0287172625
	for <linux-media@vger.kernel.org>; Thu,  4 Sep 2025 19:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757012475; cv=none; b=rT4VKdSeqQXVdkalyL6mESnJYDTL3hyzXE/xz8f7mKdRiBqm2jz3U0k3fnP/GdbAwTBFcPvO9KHRVzmWFy/UxbPRL7Qs5nEFy4Jk49EeNbceoTPcaDIvvqdR/clKL6BF6biYarlE7HMXsSgmpKNaX65WHzjocnTnGAJQrbmJ+nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757012475; c=relaxed/simple;
	bh=UPe6zD/+rFOP/gTCq56rDAQuEHvtNUDVFIVbAeXrQCk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cxZr1JZmtuThgNKl7smh47p7TnF34eUbMVUPNHc3gpAt0RujD2dOt+Dn6swkHrXlZMVSOguzTa30QT+UVGElKHkOrivAeCtUQ+8Q7rN40H7VXgVUGWiUeZyXCgKIyYKnPpnLx+uBb8td4jwodfnXo1gSJGG6/uXVsrWkjhmutz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=g9PWZNCz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584Hk7h7013506;
	Thu, 4 Sep 2025 19:01:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=nxeVzWW8Hx/+c0ZVszcdYC
	DmliLF/DqB0LI/8FbXeDM=; b=g9PWZNCz0dBbS0Ha1RXm6XN+hQzgYeoZUbGbY/
	FpeUOYGv6yXYjYj2DBJRyOQAboKusP69lqGN5Gzi2+92IOXf2ft677u/Nll7BG8e
	ggjnulHU0DLQELRiVUvK0KQtG5pbi6hZtDotfw7ZX1Fg3Au6smDk1fLUOjOCbqdB
	e0/FaqbGJmY4rzxIJwqrKeXSOGsk/SrlzG+vVdKEmvEpo7JxpepzVi0Uim8SI2FT
	AwXuljTM04L4hWLrhWgSaZBhPh/oswAu5V+aJx0Ur/BTWrav3m6IODOsJrpjaG3/
	LIW1JMcRALqTYf+yv4BzMKKQt+lUDvq6iYhHKRWstSXzklBw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wychxu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Sep 2025 19:01:08 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 584J17ex001522
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 4 Sep 2025 19:01:07 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Thu, 4 Sep 2025 12:00:43 -0700
From: Vikash Garodia <quic_vgarodia@quicinc.com>
To: <linux-media@vger.kernel.org>, <krzk@kernel.org>, <nicolas@ndufresne.ca>
CC: <vikash.garodia@oss.qualcomm.com>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>
Subject: [PATCH v2] media: MAINTAINERS: Update Vikash Garodia's email address
Date: Fri, 5 Sep 2025 00:30:03 +0530
Message-ID: <20250904190003.2478464-1-quic_vgarodia@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68b9e1f4 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=7CQSdrXTAAAA:8 a=LpQP-O61AAAA:8
 a=QyXUC8HyAAAA:8 a=JfrnYn6hAAAA:8 a=KKAkSRfTAAAA:8 a=tkQdDF7_VpdWqMXMBxYA:9
 a=TjNXssC_j7lpFel5tvFf:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=pioyyrs4ZptJ924tMmac:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Z1hfF_TGXcYjton-GCYmbVVo7DmRbTIJ
X-Proofpoint-ORIG-GUID: Z1hfF_TGXcYjton-GCYmbVVo7DmRbTIJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfX9Y/PbL2xALlw
 jAur5NzpHdGi8Fz5pmRaMOq64RFOaxiZEzuE/+sS6vkvxJuQFrsLVy82WM+agp8+mwooUQ9f6HT
 2JmGcEY7o8HfW2I742zQ5ZcZooWu04Dsn0gLgkZx+PkA46REprlRYjZY5HhNvzHnkINuUY226Of
 +HLBoJL9O2g1uL135H3A7dRGwUeiL8eDDuned13p1Xhoj/llggH60EGQtqaL/K/mzfyMqho1LEH
 iKWMBXrOyDEmN/43qhlElr2YKl0tF/F40hEylPHo8DN79KJXFNK97RcI7+W5YPeDI6d3BG3uvEw
 Bf+sdaY5zDx0Wj/xmmIUdu0jhjPn0pMr8hMx4ehzOW3bdJiRDp2CsjRP3za9/zrZEkqWR/uX0iP
 sY2EMOt3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_06,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101

Replace my quicinc.com address with oss.qualcomm.com email in the
MAINTAINERS file for both IRIS and VENUS video accelerator drivers.
Also update mailmap to ensure proper attribution across historical
commits.

Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
Changes in v2:
- Added MAINTAINERS file update (Krzysztof)
- Dropped multiple SOB (Krzysztof)

Link to v1: https://lore.kernel.org/all/20250902152224.1150300-1-quic_vgarodia@quicinc.com/

 .mailmap    | 3 ++-
 MAINTAINERS | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/.mailmap b/.mailmap
index a124aeed52a2..c3935bcf6473 100644
--- a/.mailmap
+++ b/.mailmap
@@ -814,7 +814,8 @@ Valentin Schneider <vschneid@redhat.com> <valentin.schneider@arm.com>
 Veera Sundaram Sankaran <quic_veeras@quicinc.com> <veeras@codeaurora.org>
 Veerabhadrarao Badiganti <quic_vbadigan@quicinc.com> <vbadigan@codeaurora.org>
 Venkateswara Naralasetty <quic_vnaralas@quicinc.com> <vnaralas@codeaurora.org>
-Vikash Garodia <quic_vgarodia@quicinc.com> <vgarodia@codeaurora.org>
+Vikash Garodia <vikash.garodia@oss.qualcomm.com> <vgarodia@codeaurora.org>
+Vikash Garodia <vikash.garodia@oss.qualcomm.com> <quic_vgarodia@quicinc.com>
 Vinod Koul <vkoul@kernel.org> <vinod.koul@intel.com>
 Vinod Koul <vkoul@kernel.org> <vinod.koul@linux.intel.com>
 Vinod Koul <vkoul@kernel.org> <vkoul@infradead.org>
diff --git a/MAINTAINERS b/MAINTAINERS
index 6dcfbd11efef..976a62414af6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20839,7 +20839,7 @@ F:	Documentation/devicetree/bindings/regulator/vqmmc-ipq4019-regulator.yaml
 F:	drivers/regulator/vqmmc-ipq4019-regulator.c
 
 QUALCOMM IRIS VIDEO ACCELERATOR DRIVER
-M:	Vikash Garodia <quic_vgarodia@quicinc.com>
+M:	Vikash Garodia <vikash.garodia@oss.qualcomm.com>
 M:	Dikshita Agarwal <quic_dikshita@quicinc.com>
 R:	Abhinav Kumar <abhinav.kumar@linux.dev>
 R:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
@@ -20911,7 +20911,7 @@ F:	Documentation/devicetree/bindings/usb/qcom,pmic-*.yaml
 F:	drivers/usb/typec/tcpm/qcom/
 
 QUALCOMM VENUS VIDEO ACCELERATOR DRIVER
-M:	Vikash Garodia <quic_vgarodia@quicinc.com>
+M:	Vikash Garodia <vikash.garodia@oss.qualcomm.com>
 M:	Dikshita Agarwal <quic_dikshita@quicinc.com>
 R:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
 L:	linux-media@vger.kernel.org
-- 
2.34.1


