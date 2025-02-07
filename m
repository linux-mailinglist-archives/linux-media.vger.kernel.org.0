Return-Path: <linux-media+bounces-25781-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFC1A2BDCE
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 09:25:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 889FF3A9248
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 08:25:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E41CA1ACED5;
	Fri,  7 Feb 2025 08:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OqaDJMPg"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6DAA1A5B99;
	Fri,  7 Feb 2025 08:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738916724; cv=none; b=oT0O/5Z2QPgqVneu0LQ6/uun2UtnoqOE+GHx+Gz486f45qfW3eWsNb58bJrAE9nTTFUamckmKfrHVccbtiv1uq1xHFqon8lQHbqjUsIUg2BYpr/b8MW7ipiO/Dm0PmisTTjbPj+gWKPr0+mOpYwaMV2T3YdFVJVvsh0iaQDcHq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738916724; c=relaxed/simple;
	bh=vasLdR5xzPmHQhWCRdllH7ov1hK5Cv9xjkARl1JuHHs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=kcqG6Vx8rZsY/TuK2T3XCQg0c1v/cOlYqVny2OH1jH0HS0P5UeFMD9nmhLcTg3t8GRMFBqAzPkZ7YpX4MkM7mddU0opapyAp+PEIdURLZRoM13RXSmFSl4YqsadRNtrQ0OKe9tkTpVCIzKgP/y+3YAEW+W52EQ6kGs2wRSKoJ4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OqaDJMPg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5176WWM1008285;
	Fri, 7 Feb 2025 08:25:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sB1WwGIB0/DXu7ay8qZ+cxTOrlJa03yPeewfM/F811w=; b=OqaDJMPgyRskZdnv
	LH9SL6CGzbkoLpgfl8C0WmNDpzwZBAqpPMHlXcO9ADSJ2KcBvo/UaADbJbnSARFt
	QPRaq2LMnVum7s0nAUnZxpzT+n1lSZzeeAom2qpRrLIIvO+zz/Q3yhKtLavw7fe5
	O6ZQpEn9NQT8v1SnpCcBnmt9+mlu2t/irPyAnKxIiw8ITQFS9gjHkyWefe0cEymv
	n1nrFffv9JBF3WpcHtjuZHQgde5YQ7qIz4TQxWCmvp7XIyyI/YnLkB2HbGtu0m25
	36WsrkyulYe7F0nU2Jq9SaoExr60K3Cd2TD+ybg4MdatwgfAUGSMynt9YRyjeAQ6
	6W+Vvw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44nd0f0970-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Feb 2025 08:25:17 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5178PGY1003180
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Feb 2025 08:25:16 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 7 Feb 2025 00:25:12 -0800
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Date: Fri, 7 Feb 2025 13:54:49 +0530
Subject: [PATCH v4 1/4] media: venus: hfi_parser: add check to avoid out of
 bound access
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250207-venus_oob_2-v4-1-522da0b68b22@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738916708; l=1268;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=vasLdR5xzPmHQhWCRdllH7ov1hK5Cv9xjkARl1JuHHs=;
 b=5suPcq1T4ITpXNNte6uRqpDMZH3XTJ2lcGE7IjVkndSN07OskHEYo2/PecHjlWvfczbJ7o634
 ZC+8AdMfUruB7zG3LDhXTZ+S53WdzrZiG6pfcG6L5ajph3oOTIEdIi0
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: B8H16JErPRgGq8YYvERaChyDUY0IGGh0
X-Proofpoint-GUID: B8H16JErPRgGq8YYvERaChyDUY0IGGh0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_04,2025-02-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0
 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502070063

There is a possibility that init_codecs is invoked multiple times during
manipulated payload from video firmware. In such case, if codecs_count
can get incremented to value more than MAX_CODEC_NUM, there can be OOB
access. Reset the count so that it always starts from beginning.

Cc: stable@vger.kernel.org
Fixes: 1a73374a04e5 ("media: venus: hfi_parser: add common capability parser")
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
 drivers/media/platform/qcom/venus/hfi_parser.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
index 3df241dc3a118bcdeb2c28a6ffdb907b644d5653..1cc17f3dc8948160ea6c3015d2c03e475b8aa29e 100644
--- a/drivers/media/platform/qcom/venus/hfi_parser.c
+++ b/drivers/media/platform/qcom/venus/hfi_parser.c
@@ -17,6 +17,7 @@ typedef void (*func)(struct hfi_plat_caps *cap, const void *data,
 static void init_codecs(struct venus_core *core)
 {
 	struct hfi_plat_caps *caps = core->caps, *cap;
+	core->codecs_count = 0;
 	unsigned long bit;
 
 	if (hweight_long(core->dec_codecs) + hweight_long(core->enc_codecs) > MAX_CODEC_NUM)

-- 
2.34.1


