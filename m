Return-Path: <linux-media+bounces-25784-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 89294A2BDDC
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 09:26:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 021EA3AA6B4
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 08:26:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A765235BE4;
	Fri,  7 Feb 2025 08:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NYz2dgPI"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1517623497C;
	Fri,  7 Feb 2025 08:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738916731; cv=none; b=dp7eHXXj/zNvCsPhflNnzVSpPYG8req69ByVV99cJh2b8R7DItf9uQNevUzpk7ou/p7cpAcag4T2IWIU6Hfj2WG1Cm1zbVfGsaHtJuXdusuYtZuAxETWR5Ux2AmFbKgN7ySABztVyCGd0nioVdiClt+DrGRZ89AZgPSDivGYDrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738916731; c=relaxed/simple;
	bh=jyxVh72zpOzeJT4UKUZq97UvMPLjQY6a4C2jg+FkD5o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=HHl4WRDSG8TN8Wu5EtRFConJJcKDXSu0HBvtqIarckdNRPMgGSnIn25Es5iUzXGfbzKrEx6aCH8FNXSOg7DTey2RAu1w1oYjJe8D0gjbf6OdhDUQ2mmK8dmXTFvlfl87O/aNUMxQDVO1bW72H11BV1JL2z/54J/5ukXQEexzGtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NYz2dgPI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5175HV58022342;
	Fri, 7 Feb 2025 08:25:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QNoEP/x9RjeXJQhOtJc2kXmTr7UWnAk64kC/+PqHe+s=; b=NYz2dgPIgh+fsha9
	UdyA+Pt/CqXrvmY6y0rtFblUQ3b1Ex1AV0EHWzYLpCq/GMCXdG08tY3baUqtU2nx
	555oi0jg76hZPC/G9g8mItvvskXv9H/A6148kG20d3znuLYQOg9Yh067PUbvwvAw
	DgyyIugAEG+y0cryyrIEX5BlWEgn1cn7DSKO8Y0WovEviKhqm0C9RjRI+HeXyMZ0
	39rB5PAEZ9U9aKGV1Go64bbxeITTmW77r3XoHgCy5pzmU+6e187go4M54JJLLuq2
	jvr33pITovXBLQG0uJe4ILF6vCgoJmpLnZWwAKtjn/6EE5JHodgK0qczwh1S5rkl
	o6AEkw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44nbvure52-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Feb 2025 08:25:25 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5178POhr016528
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Feb 2025 08:25:24 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 7 Feb 2025 00:25:20 -0800
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Date: Fri, 7 Feb 2025 13:54:51 +0530
Subject: [PATCH v4 3/4] media: venus: hfi: add check to handle incorrect
 queue size
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250207-venus_oob_2-v4-3-522da0b68b22@quicinc.com>
References: <20250207-venus_oob_2-v4-0-522da0b68b22@quicinc.com>
In-Reply-To: <20250207-venus_oob_2-v4-0-522da0b68b22@quicinc.com>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hans.verkuil@cisco.com>
CC: Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab+samsung@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>, <stable@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738916708; l=1783;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=jyxVh72zpOzeJT4UKUZq97UvMPLjQY6a4C2jg+FkD5o=;
 b=zBrvp8k8AraB+2Ej3dCEqz3C3kyi+8vsYCoB3wS+CCYzRAPAXBQf5psGFXJreYTN+4mZkhOan
 jlxcYFT4nr7B7Ic+lrJ5R52bm53vURyWVEHJES8IxUm1sY2JJAmahaY
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: W1SbfUam_auGH50EIa8x8CXNyL57hIch
X-Proofpoint-ORIG-GUID: W1SbfUam_auGH50EIa8x8CXNyL57hIch
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_04,2025-02-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 mlxscore=0
 mlxlogscore=657 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502070063

qsize represents size of shared queued between driver and video
firmware. Firmware can modify this value to an invalid large value. In
such situation, empty_space will be bigger than the space actually
available. Since new_wr_idx is not checked, so the following code will
result in an OOB write.
...
qsize = qhdr->q_size

if (wr_idx >= rd_idx)
 empty_space = qsize - (wr_idx - rd_idx)
....
if (new_wr_idx < qsize) {
 memcpy(wr_ptr, packet, dwords << 2) --> OOB write

Add check to ensure qsize is within the allocated size while
reading and writing packets into the queue.

Cc: stable@vger.kernel.org
Fixes: d96d3f30c0f2 ("[media] media: venus: hfi: add Venus HFI files")
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
 drivers/media/platform/qcom/venus/hfi_venus.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index f9437b6412b91c2483670a2b11f4fd43f3206404..6b615270c5dae470c6fad408c9b5bc037883e56e 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -187,6 +187,9 @@ static int venus_write_queue(struct venus_hfi_device *hdev,
 	/* ensure rd/wr indices's are read from memory */
 	rmb();
 
+	if (qsize > IFACEQ_QUEUE_SIZE / 4)
+		return -EINVAL;
+
 	if (wr_idx >= rd_idx)
 		empty_space = qsize - (wr_idx - rd_idx);
 	else
@@ -255,6 +258,9 @@ static int venus_read_queue(struct venus_hfi_device *hdev,
 	wr_idx = qhdr->write_idx;
 	qsize = qhdr->q_size;
 
+	if (qsize > IFACEQ_QUEUE_SIZE / 4)
+		return -EINVAL;
+
 	/* make sure data is valid before using it */
 	rmb();
 

-- 
2.34.1


