Return-Path: <linux-media+bounces-26515-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BDAA3E270
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 18:28:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C78443B809F
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 17:21:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3EC52139AF;
	Thu, 20 Feb 2025 17:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Oqlp9wx/"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C082F213220;
	Thu, 20 Feb 2025 17:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740072051; cv=none; b=ceXv/1NTSL2wBTfwqpiAYEwjTdpZAew1Wzkme7lcNhgr+wmNARQPTTggrB4iNhN/Z0/s/8Pwc65keH/zWtUAN4itPcxpVdwPHZJUifFm/iZL6/75qvLn6+DUQ4KnEPJSqcExzqdx8YGof2O6kdws/l3fxm3WtsON+y0IqSDrh4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740072051; c=relaxed/simple;
	bh=TgffpkZs9Iu3Li5lsBD41UjOXddJ7MuGmxS9jY48LuA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=VGyGvtdeETk5YhY5CRgRBlzXOq3kNw4zgq6flp3go1IlpCQt4lHtG0B65LijGEfjwKyZ+6zevPyH8oXeCsrcJNGXEaajsaLQOQu52f3L7dj3Q0o0O51xxfbHriD8eizNOPb1p64a0R/a/WdcIbC89NG/tjYn+k7h084gnpVMYQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Oqlp9wx/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51KG0xY7012173;
	Thu, 20 Feb 2025 17:20:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yQTYK2ZYVXzzssbUfZcEzefTI+s5p6QqU5r4r1szj3Q=; b=Oqlp9wx/RXJ2aIsv
	Ji3ZBwxlyXJqfEggJcxChtZMxIVrCPm4uwuNQGRiP3xmXiZ+ae0e3wiF0mDgqSUX
	nMzBXsyCazS171R/VTGR/rVCesoEc/myCn+naioPVyAsWX/mMj05rTOFGVzPk1Wc
	8jxblAkJxSVosuHcM+gQFgM/oPJtq7Bsn8j1wGV6ekD9OtXHfIUglsm6c1sInr65
	tb8YNrhsdepNFh6cp5gm5tWFNyblWd+t4blmflQibmzpEVq2yHF10dyrlquA+MOl
	p/10A+IGhDLBs4JyDigddqcydnTtmXEOF+jsoUi/O8NxqNz/j9JE4CEp1Mc1tRqK
	rc1WXA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy1pwqs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 17:20:43 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51KHKhGh029092
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 17:20:43 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 20 Feb 2025 09:20:39 -0800
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Date: Thu, 20 Feb 2025 22:50:08 +0530
Subject: [PATCH v5 1/4] media: venus: hfi_parser: add check to avoid out of
 bound access
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250220-venus_oob_2-v5-1-4d29347c669a@quicinc.com>
References: <20250220-venus_oob_2-v5-0-4d29347c669a@quicinc.com>
In-Reply-To: <20250220-venus_oob_2-v5-0-4d29347c669a@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740072035; l=1216;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=TgffpkZs9Iu3Li5lsBD41UjOXddJ7MuGmxS9jY48LuA=;
 b=3k4xfYLPu9d+YxxTM0FCMUifO7YrBKZon7sPjp3xLZTncxNPDJ2Ky9ckHOhMeVaId10dwc6oa
 G3G6Zu8JPBeCTeFcegaNILM87puWedrxQM98oN06VDedPEbUNgJguYd
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Wb9bdlSJSUVa9NPU53DZZtTw10ukyYFc
X-Proofpoint-ORIG-GUID: Wb9bdlSJSUVa9NPU53DZZtTw10ukyYFc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_07,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 adultscore=0 malwarescore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 suspectscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502200121

There is a possibility that init_codecs is invoked multiple times during
manipulated payload from video firmware. In such case, if codecs_count
can get incremented to value more than MAX_CODEC_NUM, there can be OOB
access. Reset the count so that it always starts from beginning.

Cc: stable@vger.kernel.org
Fixes: 1a73374a04e5 ("media: venus: hfi_parser: add common capability parser")
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
 drivers/media/platform/qcom/venus/hfi_parser.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
index 3df241dc3a118bcdeb2c28a6ffdb907b644d5653..1425c69d9006694adbc3ee0a67264c0d69522854 100644
--- a/drivers/media/platform/qcom/venus/hfi_parser.c
+++ b/drivers/media/platform/qcom/venus/hfi_parser.c
@@ -19,6 +19,8 @@ static void init_codecs(struct venus_core *core)
 	struct hfi_plat_caps *caps = core->caps, *cap;
 	unsigned long bit;
 
+	core->codecs_count = 0;
+
 	if (hweight_long(core->dec_codecs) + hweight_long(core->enc_codecs) > MAX_CODEC_NUM)
 		return;
 

-- 
2.34.1


