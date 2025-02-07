Return-Path: <linux-media+bounces-25785-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FCEA2BDE0
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 09:27:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 572B63A76D0
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 08:26:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7085823642C;
	Fri,  7 Feb 2025 08:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dqMs2wG6"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C63B23497C;
	Fri,  7 Feb 2025 08:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738916736; cv=none; b=lwn/vjn/uGMZ+prPu4sqjOa1qbk71jvQ0qxhc84DkWtxQkWttLeRIVr/5fh6M58XwEJFiy1D6UDxyXeeMlWA4jZmKs7SlWZBv1BhcLEOjVyPCaS6JXGD9a3zdFZTcg2RN0OkwVOLl3fwKGbcJCK1RXfgloI0DxCbaS95tcGzD8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738916736; c=relaxed/simple;
	bh=momNFG7HmrlvZT1BkDBQhwhSFM+A1S+Ius0MDXLSgYE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=K7VFuUPVvUORlSlXevFjqAMUQ3ZwD7kgX8d92PnPN5taOyEr6/OR749uRTM7HLFjSrSSGSbrgn0DdrYxZba1IDptjzBuHWvuKWG3n6raykxccDNy4SlN+sZGmn1IqAzuTGvxPDx2RTcNaMh24XLvZq4MMH87nFmktxDZHEASaD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dqMs2wG6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5174KrMA008031;
	Fri, 7 Feb 2025 08:25:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dwccvR0I8r73vh8lHYvXtH8o48ByEI6FWFPxtm9adwg=; b=dqMs2wG6JDuc9E0C
	KB9Bgucm6jsPuNvs2/YVdrSloy0kWLsANaXsf2bF83BoTWocN57JjwKucsGKzgL2
	OuM99iGFoPpLPH77o0fZYCKztnDvGfQArVGxb4PmuVwShHArnRwT2Gw1QMM8FEwG
	AUN1T7LUFyN+6MaCZPL5EwnKgRoLhfL5mwy24VjWOafe5T5gO38l9VgZJ+F3m/eX
	ETA4rRC0HToqt5QOU+gxob3SHq2h7YiGTY9U8vqrgVHHbrC7/GfO2cS7Lv/u146U
	y5XjATf5wJs+eRl81AWzw+jFftHvXrnpS/YL22Eshtr/ZY9kUSD1/xObfgCTE1uE
	bGfBgw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44nb2m8jaj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Feb 2025 08:25:29 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5178PS48016556
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Feb 2025 08:25:28 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 7 Feb 2025 00:25:24 -0800
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Date: Fri, 7 Feb 2025 13:54:52 +0530
Subject: [PATCH v4 4/4] media: venus: hfi: add a check to handle OOB in sfr
 region
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250207-venus_oob_2-v4-4-522da0b68b22@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738916708; l=1564;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=momNFG7HmrlvZT1BkDBQhwhSFM+A1S+Ius0MDXLSgYE=;
 b=prPcLufdCupz/3NHyvik5CDUXSRa0eMiMXcZpkiIdANMwEo+EBNEfLMDfscRrVyktANLd+cVm
 xp+hyye1IcxB9CrqugCruLnz7NNWFA2erd2L/C4NU8XVgQbZQ5TQAbr
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: QKg2mcET48Ejmgl-RaoE7Xi2sM2yn7Ef
X-Proofpoint-ORIG-GUID: QKg2mcET48Ejmgl-RaoE7Xi2sM2yn7Ef
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_04,2025-02-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=964
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 mlxscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 clxscore=1015 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502070062

sfr->buf_size is in shared memory and can be modified by malicious user.
OOB write is possible when the size is made higher than actual sfr data
buffer. Cap the size to allocated size for such cases.

Cc: stable@vger.kernel.org
Fixes: d96d3f30c0f2 ("[media] media: venus: hfi: add Venus HFI files")
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
 drivers/media/platform/qcom/venus/hfi_venus.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index 6b615270c5dae470c6fad408c9b5bc037883e56e..c3113420d266e61fcab44688580288d7408b50f4 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -1041,18 +1041,23 @@ static void venus_sfr_print(struct venus_hfi_device *hdev)
 {
 	struct device *dev = hdev->core->dev;
 	struct hfi_sfr *sfr = hdev->sfr.kva;
+	u32 size;
 	void *p;
 
 	if (!sfr)
 		return;
 
-	p = memchr(sfr->data, '\0', sfr->buf_size);
+	size = sfr->buf_size;
+	if (size > ALIGNED_SFR_SIZE)
+		size = ALIGNED_SFR_SIZE;
+
+	p = memchr(sfr->data, '\0', size);
 	/*
 	 * SFR isn't guaranteed to be NULL terminated since SYS_ERROR indicates
 	 * that Venus is in the process of crashing.
 	 */
 	if (!p)
-		sfr->data[sfr->buf_size - 1] = '\0';
+		sfr->data[size - 1] = '\0';
 
 	dev_err_ratelimited(dev, "SFR message from FW: %s\n", sfr->data);
 }

-- 
2.34.1


