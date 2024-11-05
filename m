Return-Path: <linux-media+bounces-20896-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDF89BC867
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 09:56:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 95FA61F222BB
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 08:56:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FF211D07B0;
	Tue,  5 Nov 2024 08:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="n4nWjmJm"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A3C1CF7DB;
	Tue,  5 Nov 2024 08:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730796947; cv=none; b=rvSHiqxJJ1GRjuHPkFPPtqNSazX6EWObWUTOtrlzSJWQhIwkI+ZCTyA6qCyocwD5hQmRByk8YTdVuPyLqgVm/IIPk+N2LSW0+48FNAsoyTa1CKZvC+QyuQi2iFnGlMT8dMPpbyVyl3I+GsNzbETpoLoEWHx7V/fDaf59zipvC0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730796947; c=relaxed/simple;
	bh=EdhemXF0eIO5JpJZj2+v9kl8I4P66PGAOaIYD7GJGFw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=NRC58RiqEn2YFhwSQH4q+ieHbrwpjerKPW/RdE4aDHt3ed6USFANyD0WK6qnjdgHLohnyngsPpM1V5b9PoVua2J5wt6FGr+T5coSYbkW90QKSDNkmPr6F/UW5Zpc8xq43+XdbQbMiPQEf4xc9UMnx1kzQ6kRLuHp6X4vWXs4txQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=n4nWjmJm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4LJ2Q0009869;
	Tue, 5 Nov 2024 08:55:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KbR1KGvMEcEeQAvgLJ+vWskcYhK25HHq7X+QRrCn9Zg=; b=n4nWjmJmlHqZ0RPG
	hzQJxg4y9h/f0Vr3Ku8fnnKruWc/DoVHKqkw6RV4HaQYv5Q2XuC12SFDaAmetdxv
	sodO3BbjNANxL9TsCbnf20DTlwxN9Qo4SssjcNKHqSWJv25092+KEiAlulNbdiQY
	oYMiXLYhi/HcxofjL4IDoxBdjI3ejKMIEFwYnOnwLfaOmjt6v6CbUPH+WrvyAW/z
	x8kG/hBnqDOCH/JdLureEn68g2Sr8sZp+4C4TGfFvnrjEnszc72Gaw7ElxpvMIVO
	yUWrUU5unKgyJv1D/jtwczUeFjPvGIwAeWP1KmPnf6+ft2SIVo5OhZ6r3mhyHGjn
	htUk6w==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd4uq104-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 08:55:40 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A58tdRW029209
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 5 Nov 2024 08:55:39 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 5 Nov 2024 00:55:37 -0800
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Date: Tue, 5 Nov 2024 14:24:54 +0530
Subject: [PATCH 1/4] media: venus: hfi_parser: add check to avoid out of
 bound access
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241105-venus_oob-v1-1-8d4feedfe2bb@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730796934; l=1496;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=EdhemXF0eIO5JpJZj2+v9kl8I4P66PGAOaIYD7GJGFw=;
 b=fpxU/vRAmcLMOOhJ7wgqe+gBHiZyYjn5cfR9k2lantrPwGNzVaUf3+7JUahLRPO3vFY9B4Y0x
 M8WAe3g5UDcDQhB2YjUB6tpiECOX5ALI7xRjP/q+ooVJOkTePQz579V
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: CaJNlBNEhiSvwlZ9rpfCHlhcNzcfbJxD
X-Proofpoint-ORIG-GUID: CaJNlBNEhiSvwlZ9rpfCHlhcNzcfbJxD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 mlxlogscore=862 impostorscore=0 suspectscore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411050065

There is a possibility that init_codecs is invoked multiple times during
manipulated payload from video firmware. In such case, if codecs_count
can get incremented to value more than MAX_CODEC_NUM, there can be OOB
access. Keep a check for max accessible memory before accessing it.

Cc: stable@vger.kernel.org
Fixes: 1a73374a04e5 ("media: venus: hfi_parser: add common capability parser")
Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
 drivers/media/platform/qcom/venus/hfi_parser.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
index 3df241dc3a118bcdeb2c28a6ffdb907b644d5653..27d0172294d5154f4839e8cef172f9a619dfa305 100644
--- a/drivers/media/platform/qcom/venus/hfi_parser.c
+++ b/drivers/media/platform/qcom/venus/hfi_parser.c
@@ -23,6 +23,8 @@ static void init_codecs(struct venus_core *core)
 		return;
 
 	for_each_set_bit(bit, &core->dec_codecs, MAX_CODEC_NUM) {
+		if (core->codecs_count >= MAX_CODEC_NUM)
+			return;
 		cap = &caps[core->codecs_count++];
 		cap->codec = BIT(bit);
 		cap->domain = VIDC_SESSION_TYPE_DEC;
@@ -30,6 +32,8 @@ static void init_codecs(struct venus_core *core)
 	}
 
 	for_each_set_bit(bit, &core->enc_codecs, MAX_CODEC_NUM) {
+		if (core->codecs_count >= MAX_CODEC_NUM)
+			return;
 		cap = &caps[core->codecs_count++];
 		cap->codec = BIT(bit);
 		cap->domain = VIDC_SESSION_TYPE_ENC;

-- 
2.34.1


