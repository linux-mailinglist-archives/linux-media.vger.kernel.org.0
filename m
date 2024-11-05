Return-Path: <linux-media+bounces-20897-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2854B9BC86B
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 09:56:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A0BE1C224E7
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 08:56:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95A181D172B;
	Tue,  5 Nov 2024 08:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TwAAB4An"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CB71D0DC4;
	Tue,  5 Nov 2024 08:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730796949; cv=none; b=fzLY3i3Q23ZaTFHqRv5ANkOwtR8qsZYNpSMdS3N3GCMtrAKOH9ySl81V6lRLdtc3JFsW2ZvEH8GGmKHUuViJS7q1UqwavRIMPAYDgujw+TwfOU/GFQEccR1jLOZTGezgsTUPgQzrsV6JQIvS7f7nilJBmX9s8WRryU9uU+8AMO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730796949; c=relaxed/simple;
	bh=HL7531T4uNLuWwjsJ+/SljWOxOUWOBfrl+zLCP/SyRk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=FfZoFKrIVuhhkusfH7aP9fPQXNPO2WhwZ2fTx0s9o3xq/NxcegN654MT3uTdbuhdf/VfsXNMGP7+x7bu+iSg4MRgd+lVFMjqwOei2gSJkIXCS9o4vnrgM0dgRtpMUWHlOmSvbrKw36ccJahaKmmW3BlOZpHVyVyZzfk9hyEWQAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TwAAB4An; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4LImoX009202;
	Tue, 5 Nov 2024 08:55:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	02Qbxpf4NKettv9l8vTyxekPsOPC+VJJ0Q7jDnl20MU=; b=TwAAB4AnB1/rxv1O
	U7mJbSPLU8haq5qw5MPiWtHh/laudrXB/0zM4Kvi83K4rc8g/3w2wP5qNgFf6jMm
	TYwVcD/uIDnMmx31nMQWKBJQ13o6s419ANZM/dko300xfEQwXShJ2YqXyA1+VfJ3
	GgJOIc6G1/U8+FcZoqdYnxt9eQ9UfQJouVV1atllZ+Na/A1kWDBEpm4wYbSvgcgS
	2/WK8o21Cg4DyC097cu9o1GcJSo9icHYJREAatrAH1gRa0IeR8RI+YOmsZqdrdBy
	Eg8QKC+gAF4dGgcsCgZsH5oD+g0G7+Fa4wQ7x+3hR3QnM5czJqSZQ/N8lqyhrkV1
	c1Fsxw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd4uq108-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 08:55:43 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A58tg6M001158
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 5 Nov 2024 08:55:42 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 5 Nov 2024 00:55:39 -0800
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Date: Tue, 5 Nov 2024 14:24:55 +0530
Subject: [PATCH 2/4] media: venus: hfi_parser: avoid OOB access beyond
 payload word count
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241105-venus_oob-v1-2-8d4feedfe2bb@quicinc.com>
References: <20241105-venus_oob-v1-0-8d4feedfe2bb@quicinc.com>
In-Reply-To: <20241105-venus_oob-v1-0-8d4feedfe2bb@quicinc.com>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>, <stable@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730796934; l=1134;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=HL7531T4uNLuWwjsJ+/SljWOxOUWOBfrl+zLCP/SyRk=;
 b=Jq5jNkpRUTLKv/J+VvbK6PojAVFzzdukT85oD3UdTswaOVW5zh8ZpUuLP5uakkon8vhwXJGVF
 nKbuNiA9KQFB0prpPf8F2HtnOp5eOZbcXo8If9Vr5YmOZKn21058ERG
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: XlEVop417EZQqrEdBw_TKc77FN_eMn5V
X-Proofpoint-ORIG-GUID: XlEVop417EZQqrEdBw_TKc77FN_eMn5V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 mlxlogscore=703 impostorscore=0 suspectscore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411050065

words_count denotes the number of words in total payload, while data
points to payload of various property within it. When words_count
reaches last word, data can access memory beyond the total payload.
Avoid this case by not allowing the loop for the last word count.

Cc: stable@vger.kernel.org
Fixes: 1a73374a04e5 ("media: venus: hfi_parser: add common capability parser")
Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
 drivers/media/platform/qcom/venus/hfi_parser.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
index 27d0172294d5154f4839e8cef172f9a619dfa305..20d9ea3626e9c4468d5f7dbd678743135f027c86 100644
--- a/drivers/media/platform/qcom/venus/hfi_parser.c
+++ b/drivers/media/platform/qcom/venus/hfi_parser.c
@@ -303,7 +303,7 @@ u32 hfi_parser(struct venus_core *core, struct venus_inst *inst, void *buf,
 		memset(core->caps, 0, sizeof(core->caps));
 	}
 
-	while (words_count) {
+	while (words_count > 1) {
 		data = word + 1;
 
 		switch (*word) {

-- 
2.34.1


