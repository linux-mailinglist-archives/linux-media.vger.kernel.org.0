Return-Path: <linux-media+bounces-22201-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D3C9DB263
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 06:06:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06B7916476F
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 05:06:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8048D1474CF;
	Thu, 28 Nov 2024 05:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MyZd2ybC"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDA613D893;
	Thu, 28 Nov 2024 05:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732770340; cv=none; b=rtO8k6DoVhu4vfPup0fIEqmjQEbESmtDGE/WRoLQLzC/cyTicAtsUG9eNqLKCKzh1qSPtyfPrP56VJ0pD9+pFvy1lzedKjO47glXIY4jkORpabZbluo8+2qB1V4DSWu65MYzs5kfEZwiYoJeHfo6pkQInEuJfiPO0P1ITr4KG+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732770340; c=relaxed/simple;
	bh=fNHU+7Khoi1sWwvyzvZ7mMCWDf62+ZMBgq5o6LZY6Ok=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=vCkA1WQ//o5+M7CYNc5JYBduSJR96N+gy3Yq4ZaMxDPioXKoQ8n8/1hdMJgLBBq1L+6X3UPDR2pK0Rs2XV3N6kgvynIhVkcSZDZ6rx5b59TZsnPPxHbHScOqlklFpqRtA2tI3PlT+Ube3fFcNnfhoXH4TMCNf8paWZJE8XP4jVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MyZd2ybC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ARGQp62028646;
	Thu, 28 Nov 2024 05:05:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/SzrY/qrhDl/no6+92M34M3F2ytZ4+21hmBn1SvPs3k=; b=MyZd2ybC9aEHtgef
	0iy5ODErzsKD96sF14D9540Y2J86jMRUElmb8dG5mcy/FgGqyPBxFRD9lRQHkRtF
	L0Gollvy9brXphYngIu4nlw73Z53KrmkuR6jJx5dz/zRX+5OG6ltSE7bGRJrBAPm
	9OkP9YwXhPn0ULQ/tAAsaCYumaltpOIGBmufIpznlsmINvpGI3wGM+XwfQW32ziU
	P8PzDrVk0Sdkjw/xfh9eUQOuZoYFZ7hd+XxpIKLLBfUcaF7ksjv4ZIlOBzhk8eC/
	xVWCa0nCF7WxL2rFYQUWWKMiaEZW5dge5z2RXrCtVjDqe8vrUTpih0X5Lc2wZeBW
	0CA94Q==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4366xwscat-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Nov 2024 05:05:26 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AS55QB5003047
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Nov 2024 05:05:26 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 27 Nov 2024 21:05:22 -0800
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Date: Thu, 28 Nov 2024 10:35:11 +0530
Subject: [PATCH v2 1/4] media: venus: hfi_parser: add check to avoid out of
 bound access
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241128-venus_oob_2-v2-1-483ae0a464b8@quicinc.com>
References: <20241128-venus_oob_2-v2-0-483ae0a464b8@quicinc.com>
In-Reply-To: <20241128-venus_oob_2-v2-0-483ae0a464b8@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732770318; l=1208;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=fNHU+7Khoi1sWwvyzvZ7mMCWDf62+ZMBgq5o6LZY6Ok=;
 b=F5PK1bwvYsNFqDM4BBznum85afpQA2W2Pl59s/3tC/Z+h6dYlc2n7TEwW04v9tcQwJfzp0VGI
 j5tDWnx5QzcCpCJC1wn6wnzpK4bnecSH6bdLVbLXLingDA242BfPY+u
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: g6c8OSjScI_srl1Xt5j7X-SvqqVpQrMZ
X-Proofpoint-ORIG-GUID: g6c8OSjScI_srl1Xt5j7X-SvqqVpQrMZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 priorityscore=1501 mlxscore=0 clxscore=1011 lowpriorityscore=0
 mlxlogscore=999 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2411280039

There is a possibility that init_codecs is invoked multiple times during
manipulated payload from video firmware. In such case, if codecs_count
can get incremented to value more than MAX_CODEC_NUM, there can be OOB
access. Reset the count so that it always starts from beginning.

Cc: stable@vger.kernel.org
Fixes: 1a73374a04e5 ("media: venus: hfi_parser: add common capability parser")
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


