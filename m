Return-Path: <linux-media+bounces-22200-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 499D29DB25F
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 06:06:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E5C3A167EDA
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 05:06:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92BAD145B26;
	Thu, 28 Nov 2024 05:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="T4+xRzL+"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E51E1FAA;
	Thu, 28 Nov 2024 05:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732770338; cv=none; b=txvEk3GxOQ9lHey7/mm/pkTyye95qynEw6xYiD6PTlmbgwODatSrQLAahKHXGsCbcUlJcfsrmoi8q5VyRvoqRKub4uHBi37Rie4rZxYdVmg8sFqUKyr6AIzcLzLIzT3hRFXIDZ44H0pearQXexOCG5rKUBWnmBZSpXud6z8XwBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732770338; c=relaxed/simple;
	bh=1abPHHaOsFiT2AQfqpZsBixI9UnWqdtG8QeiGTPDS3Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=mp5IEDpaqZmgYee4g6GCoKUsM656FtDD1Cje2u+fOgO6eCOxhVowhz0xWDnK/lZGaun5BM72Za7YzK77jucEiDpI5jl4qmpu2yiftxZuWOvOyByMFn2VBT+3QLOyqOf/gMz01zRQkWcwSkcdkiIWg8mFbB6liJ29WuxHuUKa6sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=T4+xRzL+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ARGQahO004471;
	Thu, 28 Nov 2024 05:05:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mPfvUJnChTzJRALB+nmVbz0u/4AZKdtha0AiqiMd+nQ=; b=T4+xRzL+1aPCvit1
	V0whBDgpcaMwq2490+NhJq+EKJWCNEtkg+G4XrjUAKyUc+XPQiWe4P3dghAiwpdL
	UPOI5iz2CJbOOmYtns3tx3yEATcazJcrCIFv536P4R5gQrVkemH5FPMc9HXfmH2w
	/WVwTEqot3sCIVtzva/OEhoTqVP/540HRaIC1aZFkSCuYkFGzVd/IrSL4KB/iJ3q
	gnPkLPtXhu6BE5o/RBap4dGGkug8LVe7Dsg4v8IoML+p4U7sP6xRk1fRMjwYov8I
	SdocTuvJHs59Qa12l6ImplZMUflVtQ1ilxM3GvhdbuTYQuFCb7mC5o0zG6A5v7rE
	EVCDxw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4366xvhd06-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Nov 2024 05:05:30 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AS55Tx8013898
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Nov 2024 05:05:30 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 27 Nov 2024 21:05:26 -0800
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Date: Thu, 28 Nov 2024 10:35:12 +0530
Subject: [PATCH v2 2/4] media: venus: hfi_parser: avoid OOB access beyond
 payload word count
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241128-venus_oob_2-v2-2-483ae0a464b8@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732770318; l=4462;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=1abPHHaOsFiT2AQfqpZsBixI9UnWqdtG8QeiGTPDS3Y=;
 b=bP1h9ZpaCdm3HYwJ33U1yD9hvpv8U0/zaV3vgiEvpSbymuERgtqvFD4gfsSkRL0YFh+6SQNEU
 2QHbLjj6j9/D6ZonmdxqY7avOXiWsLoXGohY8he50z85/NuKhXmyH76
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: jpMVbGHwHIIU4UjBMr91EkIJ288LW8IQ
X-Proofpoint-ORIG-GUID: jpMVbGHwHIIU4UjBMr91EkIJ288LW8IQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 mlxlogscore=999 clxscore=1011 adultscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 spamscore=0 impostorscore=0
 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2411280039

words_count denotes the number of words in total payload, while data
points to payload of various property within it. When words_count
reaches last word, data can access memory beyond the total payload. This
can lead to OOB access. Refactor the parsing logic such that the
remaining payload is checked before parsing it.

Cc: stable@vger.kernel.org
Fixes: 1a73374a04e5 ("media: venus: hfi_parser: add common capability parser")
Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
 drivers/media/platform/qcom/venus/hfi_parser.c | 57 +++++++++++++++++++++-----
 1 file changed, 46 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
index 1cc17f3dc8948160ea6c3015d2c03e475b8aa29e..14349c2f84b205a8b79dee3acff1408bb63ac54a 100644
--- a/drivers/media/platform/qcom/venus/hfi_parser.c
+++ b/drivers/media/platform/qcom/venus/hfi_parser.c
@@ -282,8 +282,8 @@ static int hfi_platform_parser(struct venus_core *core, struct venus_inst *inst)
 u32 hfi_parser(struct venus_core *core, struct venus_inst *inst, void *buf,
 	       u32 size)
 {
+	u32 *words = buf, *payload, codecs = 0, domain = 0;
 	unsigned int words_count = size >> 2;
-	u32 *word = buf, *data, codecs = 0, domain = 0;
 	int ret;
 
 	ret = hfi_platform_parser(core, inst);
@@ -301,36 +301,71 @@ u32 hfi_parser(struct venus_core *core, struct venus_inst *inst, void *buf,
 	}
 
 	while (words_count) {
-		data = word + 1;
+		payload = words + 1;
 
-		switch (*word) {
+		switch (*words) {
 		case HFI_PROPERTY_PARAM_CODEC_SUPPORTED:
-			parse_codecs(core, data);
+			if (words_count < sizeof(struct hfi_codec_supported))
+				return HFI_ERR_SYS_INSUFFICIENT_RESOURCES;
+
+			parse_codecs(core, payload);
 			init_codecs(core);
+			words_count -= sizeof(struct hfi_codec_supported);
+			words += sizeof(struct hfi_codec_supported);
 			break;
 		case HFI_PROPERTY_PARAM_MAX_SESSIONS_SUPPORTED:
-			parse_max_sessions(core, data);
+			if (words_count < sizeof(struct hfi_max_sessions_supported))
+				return HFI_ERR_SYS_INSUFFICIENT_RESOURCES;
+
+			parse_max_sessions(core, payload);
+			words_count -= sizeof(struct hfi_max_sessions_supported);
+			words += sizeof(struct hfi_max_sessions_supported);
 			break;
 		case HFI_PROPERTY_PARAM_CODEC_MASK_SUPPORTED:
-			parse_codecs_mask(&codecs, &domain, data);
+			if (words_count < sizeof(struct hfi_codec_mask_supported))
+				return HFI_ERR_SYS_INSUFFICIENT_RESOURCES;
+
+			parse_codecs_mask(&codecs, &domain, payload);
+			words_count -= sizeof(struct hfi_codec_mask_supported);
+			words += sizeof(struct hfi_codec_mask_supported);
 			break;
 		case HFI_PROPERTY_PARAM_UNCOMPRESSED_FORMAT_SUPPORTED:
-			parse_raw_formats(core, codecs, domain, data);
+			if (words_count < sizeof(struct hfi_uncompressed_format_supported))
+				return HFI_ERR_SYS_INSUFFICIENT_RESOURCES;
+
+			parse_raw_formats(core, codecs, domain, payload);
+			words_count -= sizeof(struct hfi_uncompressed_format_supported);
+			words += sizeof(struct hfi_uncompressed_format_supported);
 			break;
 		case HFI_PROPERTY_PARAM_CAPABILITY_SUPPORTED:
-			parse_caps(core, codecs, domain, data);
+			if (words_count < sizeof(struct hfi_capabilities))
+				return HFI_ERR_SYS_INSUFFICIENT_RESOURCES;
+
+			parse_caps(core, codecs, domain, payload);
+			words_count -= sizeof(struct hfi_capabilities);
+			words += sizeof(struct hfi_capabilities);
 			break;
 		case HFI_PROPERTY_PARAM_PROFILE_LEVEL_SUPPORTED:
-			parse_profile_level(core, codecs, domain, data);
+			if (words_count < sizeof(struct hfi_profile_level_supported))
+				return HFI_ERR_SYS_INSUFFICIENT_RESOURCES;
+
+			parse_profile_level(core, codecs, domain, payload);
+			words_count -= sizeof(struct hfi_profile_level_supported);
+			words += sizeof(struct hfi_profile_level_supported);
 			break;
 		case HFI_PROPERTY_PARAM_BUFFER_ALLOC_MODE_SUPPORTED:
-			parse_alloc_mode(core, codecs, domain, data);
+			if (words_count < sizeof(struct hfi_buffer_alloc_mode_supported))
+				return HFI_ERR_SYS_INSUFFICIENT_RESOURCES;
+
+			parse_alloc_mode(core, codecs, domain, payload);
+			words_count -= sizeof(struct hfi_buffer_alloc_mode_supported);
+			words += sizeof(struct hfi_buffer_alloc_mode_supported);
 			break;
 		default:
 			break;
 		}
 
-		word++;
+		words++;
 		words_count--;
 	}
 

-- 
2.34.1


