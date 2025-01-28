Return-Path: <linux-media+bounces-25329-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F20A207C9
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 10:57:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A4FE18898E1
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 09:57:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAD0719CC36;
	Tue, 28 Jan 2025 09:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LashF0Qq"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C752419D09C;
	Tue, 28 Jan 2025 09:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738058229; cv=none; b=Msyykzp1ANfmXlgW/JpJ4ILtXozUbRrlEcsiN/mhasFNjePHrvbYWbWcbN6ELytD4f/M3fzAkN0i+IR5GNGFlUzL6T1zoibQDVKl5TX4qXVYosdiSsCAp+MJKkWxM35DjdiizI9MnhjJT6d2yDqx3SL/PfbjvD5jWzkcWkFpbdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738058229; c=relaxed/simple;
	bh=vasLdR5xzPmHQhWCRdllH7ov1hK5Cv9xjkARl1JuHHs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=fUPXSjiwv46fCTII/ilYCMMgtCwTADkQ4ZtVjw1aJ++Jr4nRSwf1yIk7xHfFxvpqUgGjNn1K8He80pc8Lml6ib0nbWAzZ8BrXG6HhBwP+gRoElN+7Sg1+YWt3K0Y+gqjbbYsnIPaddQzmopqM0CyvqXos3KXDz3xhpCuhdpcvsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LashF0Qq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50S1epV1006644;
	Tue, 28 Jan 2025 09:57:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sB1WwGIB0/DXu7ay8qZ+cxTOrlJa03yPeewfM/F811w=; b=LashF0QqnBQqS8Dr
	Hp6g2uiX5A7VbAQuo6VcCJ7sz+gW9v9NjoN0X/1MwIFmHaNBx9wzZ0NeiW+zvCz4
	IoJU8dHrJEECSichFXtx7eSGnp8pYUVQosjyVcTgU4I0/WmMyY+W4boYyLjon4Am
	Dnaic5S04xTKqKnFvTIoIO8c2mEvs8uEATUiUlBPiSReUzhoxrQVLF1RSdyiyEwl
	NF3R7wxJd4jN+KZ4We4gciPOFYeIHIaEGMkaiO2H0k/NNr3d+mgRvQjFNnuIFXse
	TILgUlZQpMxjBqmFllrAaTUcGMEhKW7GeEswtKPY7eCZL65FRliZPkR0yPi+AiJA
	rKUejQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ekhw12gn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jan 2025 09:57:02 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50S9v1Vh023381
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jan 2025 09:57:01 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 28 Jan 2025 01:56:57 -0800
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Date: Tue, 28 Jan 2025 15:24:36 +0530
Subject: [PATCH v3 1/4] media: venus: hfi_parser: add check to avoid out of
 bound access
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250128-venus_oob_2-v3-1-0144ecee68d8@quicinc.com>
References: <20250128-venus_oob_2-v3-0-0144ecee68d8@quicinc.com>
In-Reply-To: <20250128-venus_oob_2-v3-0-0144ecee68d8@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738058213; l=1268;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=vasLdR5xzPmHQhWCRdllH7ov1hK5Cv9xjkARl1JuHHs=;
 b=Qmbu/08egk6wkTzYXRENqdblb/ne6DZ9RfinuGHaEug3ojfBPAOtqT6gJm4dAQscUIjsxvLjV
 AjuXGu45nWECK4XEv6ksw7mCkYBlmD5fLnv78X3H/C7ATUS9DrzXcDe
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: kV-rU7FuGQSfQUNGTSCfiOC7yJMRB9gS
X-Proofpoint-GUID: kV-rU7FuGQSfQUNGTSCfiOC7yJMRB9gS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_03,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 mlxlogscore=999
 clxscore=1015 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501280077

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


