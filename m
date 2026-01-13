Return-Path: <linux-media+bounces-50583-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C01D1A785
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 17:58:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 516003016659
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 16:57:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC93E34F48F;
	Tue, 13 Jan 2026 16:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="madejXzh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="knXGQ+FZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD386350A08
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 16:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768323456; cv=none; b=iZqkBy/hInAE3N7UtserUNlfEH9plfvsCyFG3DhW8RAvGlQIsLPNpzfDw1LQfuI0tn0SwrPNjfmSlAEa7DO/XwhmeVcP60upQrTE41dUlW3A52xNVjPiePIkal/dBQNOR6IbNLpl7x2jfleQX59Fksf/BNd2OdCH4YOij50Xwhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768323456; c=relaxed/simple;
	bh=HMdQGGXMoxAFlMMe/K2Cq5GmygslrlUf47OHT0fh34c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YpZHKaB5EwJ1vkjyqApEA2fr23jfGuKcaHtkRQMkaWQ6EgTNJ3NbqLJsSIbnoqfv0Fn0obbPSKSJNFLfM1oqPA++BIKGMIAxtza9UsOOJfDYZPVm9yG3iN336TwdFSALtqjmvUfL6R/naWmmA6ZPUIp6kQcOpcwoOTPXDz/ajzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=madejXzh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=knXGQ+FZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DC06FI2865771
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 16:57:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hAD3t824tdcwEOLVZWqxMKdxBRPHELtlY/iZHePT5Uk=; b=madejXzh4uc1tB4k
	3DyD5z8f6SMhnGpiKPkDIOK4EpEWUYevdm9MjY2TkB1Nul8CyIXONtZzE7fIfaOs
	O4ZrErUNXCUuE2gOKfE+krCjaCfkN/16qkIrpOb86nB2YYvnhqExOuy2SwAlU9u5
	jLiQPSbpdmctYEgAwc/FQ6R8JQUsMIaCx/Tcj7L1SxUWMOjPimYKfnt7TDSx3TXR
	oeJSxcVp3HXxq0X4I7XWxNU/SAD2p6h5jHIXCPG0TURfwhUfMaExyHaMJNNwYPwa
	3ZkhPdsjRvIBi3LErColwNUXqyYaa/59BHEjoKYO6dHcSmVxHdO1A0mR8NRL1rXd
	geAAMg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnfjha9ha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 16:57:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b22ab98226so2297376585a.2
        for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 08:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768323453; x=1768928253; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hAD3t824tdcwEOLVZWqxMKdxBRPHELtlY/iZHePT5Uk=;
        b=knXGQ+FZXm/EAm7Q6/DpPIhoXcfBsv4/pT4E7iuy62I+FVAh2lwnFZG+TF6VHNawiU
         uFB/cpX5oLBtrVOmvpnBjVz6q+yutQcFKk6ZijqG8wQrZ1aMm1Lr9RGHiix9jNIiP/1S
         i5RmwOtu2pz/zaPb9X+lhwEPQETs7obOaOppc1MXiEjPxelZyeGZM/V0Y0gjRaJUIYtt
         ICjiIHvSoolmXn6kGm/2MIMHiTf+jfl4fJfl203TSsegZFKKDVHYBhcaG6GrXIIqNgKk
         F0jUEdE1lRY74e6ApA984FbhICkSJAS4+JzxKwY7YrW5F61YlYAiivn2lKj2njSgkpBI
         0JZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768323453; x=1768928253;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hAD3t824tdcwEOLVZWqxMKdxBRPHELtlY/iZHePT5Uk=;
        b=gimmdnEv6L6F4sDiO6weaKlrQYx2ZR+Tt868t2m9whFuEcQOk8HVom9bmCP1c06wb0
         63wO/lt2NnUzTd+qPezCumduQ5rijJh5q3lVfPSAtI2b1lVJ/puK4GSN0lwse/CFzgmS
         Olh96AcflDExOa3Iqp6ouD08kJZ6m2pevCf24pXY5c/X9+8iJkIbHPi1At0Yx6fOrpTc
         nbAH++tpFhS5H709js+O3rm3jCivGERBf1u+1hdcUNStMbbRi/DMK+ci/K7IBeIPQ4Za
         hsR2aMicSN9vZqWDjDAxXp6PMPoAhirfhxc6NaP42wcKq9X2P1v1t0PDp7kS6YAvXjh+
         Jg3g==
X-Forwarded-Encrypted: i=1; AJvYcCXr8xchlxHUWtARDW3Ya1cfUr4iSERcFCcD+sqmt3XwMlxFpVHCpPuRDABknAikdw3Mt4ZRnpvLX/iJCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRl6lU5CqrgcJHQkTZNCsT7X9IdOo3LZEFjyHH8LH4w/W2J0Zn
	0XN9a7Zc7YwERe2diCuJnmUub0BwSckQrgL3o2eD6ws9ctqeN7pcKZumLBueKBOP7aBl8a0E372
	kq4MlYVLdaktsqDMwReLJe+JeCCa4OB1a4RCbTGi1O/mkx2kJdfAnJMNugr3b+tidBQ==
X-Gm-Gg: AY/fxX56gRM+drUb9aGTivwn+rsd2mDkCQR2Mt6k/G10Mk4vRzBy14G3wPhTJoBVYch
	jjHiA7pHBWXiBJgYDp5G2jDTtmaD9HssRkWh7/xAblHUBH5lrxzWF60grS3Z6R0v3y1vy2zeJfr
	CAlKb9NaQGP3dbDjsxwdquAle7Fqjk/1VUIK/dZmxml6nycdNkqZZ8lDQKXb6br1zDj4WNmY3li
	QdwtZm9gJPKvfAAwe1QWMCRv48cEDlYOdifpyt3GLByTVE0HXB0bsFM+ak9Kz+sFV63eakJik0Z
	rE+QlaiMIse2cgwx8e4h2cAvpPKBOgKaZXXo5giKzgfsmIRivaF0WGN6w5wq3V85cztN882H4ql
	3St7FAjb9e1RTa97GDO5O8JMzfA+x6FZBcWYr95IjS9slueeIpDmqOHZOMO8YQi0tBGZyW5ut6l
	f3o2Ul0i7vVANZsqU0PtOacxM=
X-Received: by 2002:a05:620a:2954:b0:8c3:55bf:735b with SMTP id af79cd13be357-8c38941de7cmr3129015985a.81.1768323452937;
        Tue, 13 Jan 2026 08:57:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFzABrhjIiz68f42H+KyJlrj7ATlYywKpQYCMtXQALfTAzDdPFy4bgFmJXrf3a4G5QttWZWIw==
X-Received: by 2002:a05:620a:2954:b0:8c3:55bf:735b with SMTP id af79cd13be357-8c38941de7cmr3129011985a.81.1768323452433;
        Tue, 13 Jan 2026 08:57:32 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b72af5ed2sm4788677e87.58.2026.01.13.08.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 08:57:31 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 18:57:19 +0200
Subject: [PATCH v2 04/11] media: iris: don't specify min_acc_length in the
 source code
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-iris-ubwc-v2-4-4346a6ef07a9@oss.qualcomm.com>
References: <20260113-iris-ubwc-v2-0-4346a6ef07a9@oss.qualcomm.com>
In-Reply-To: <20260113-iris-ubwc-v2-0-4346a6ef07a9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2913;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=HMdQGGXMoxAFlMMe/K2Cq5GmygslrlUf47OHT0fh34c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpZnlz4MHU02rMucG+cyZiLqJlRZWRz6g5HU4W+
 KfbfV1BiDSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWZ5cwAKCRCLPIo+Aiko
 1fIXCACTE42T0FJo5xNb39ByhGFcdrV8xverwN05Qjuhb2jVPNg9926oLQ/wvG8U3GZcIcenLo3
 UAwLo27BulYDZ1b4e/7plg3EYDmEsrFti8FsPMMGPPnEBkBr06ll7RxNWoJNrcLNov1QGf39Js2
 KuUbntx21eZkLoI7aHUxIa5JwVEh7MHulA0QRMomUhZGi42jEZ8/Pje5rDNhiH1r7aL1yRX9isT
 61+939iKmPzrXBjBWB6aP8zrmLKW3+BvwG50e09+ZxGdDi6rGCUg6Xou59rdu5u9sKqV8R7D3y3
 lUj0dl/keUVzGO/KdJ0UBenoLtJWeg7Pwy1xLRjfjZJd3ep1
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE0MCBTYWx0ZWRfX86ijXPPZvn5L
 5GZ0qK4Nb1zdYWfn5hY4zKQSi3iOpVI/RSvAATtDlaUXqCdWZ68HS7c8lwZiAT0MxA6e4Wpev3Q
 rWcl/kA/aO6yqVYm6n5sgMoBwbrcCOYpbkO2GvJUnUjL5r6mRW1WeFPriC1Y4W58mQ5kXGoIBcc
 pUy/NK5alDBASewCQzmGGX7ZrsHAtc9u4NwKXJyxUjWV+dvhC0vF04D2bvj62QO3WcqRxWlNhG4
 y13sjV+CIHesZv9RFxQ7UAXCwcO0VYLsDPY0icmRAgrxy4sq2wYiMjdaIuy+8KgcfSEFv3gKpG9
 7d/07izOZU/kWsI2wFiB/pIJqWDo/mqpU6EtovR159hK6NLFiobeJkotmOz4cO5Glzp56quIwuj
 CMN6QfQq/OZF75ERy7JnMbkuq11bRZ/15b7NlL90r/uDpv9gxkbS2QT2hcVd0RE3igyYJk1JWuJ
 U22LFetdVevq5Xmyr3Q==
X-Proofpoint-GUID: vo2mTyTuPwLEmWrZEfmCeFhTDQD3LwPe
X-Proofpoint-ORIG-GUID: vo2mTyTuPwLEmWrZEfmCeFhTDQD3LwPe
X-Authority-Analysis: v=2.4 cv=XJQ9iAhE c=1 sm=1 tr=0 ts=6966797e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=tw3gK4E_mqRpSwCFd0wA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130140

The min_acc length can be calculated from the platform UBWC
configuration. Use the freshly introduced helper and calculate min_acc
length based on the platform UBWC configuration instead of specifying it
directly in the source.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 5 ++++-
 drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 1 -
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index d77fa29f44fc..878e61aa77c3 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -3,6 +3,8 @@
  * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <linux/soc/qcom/ubwc.h>
+
 #include "iris_hfi_common.h"
 #include "iris_hfi_gen2.h"
 #include "iris_hfi_gen2_packet.h"
@@ -120,6 +122,7 @@ static void iris_hfi_gen2_create_packet(struct iris_hfi_header *hdr, u32 pkt_typ
 
 void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_header *hdr)
 {
+	const struct qcom_ubwc_cfg_data *ubwc = core->ubwc_cfg;
 	u32 payload = 0;
 
 	iris_hfi_gen2_create_header(hdr, 0, core->header_id++);
@@ -146,7 +149,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->mal_length;
+	payload = qcom_ubwc_min_acc_length_64b(ubwc) ? 64 : 32;
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_MAL_LENGTH,
 				    HFI_HOST_FLAGS_NONE,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 8d8cdb56a3c7..3c5f3f68b722 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -73,7 +73,6 @@ struct tz_cp_config {
 
 struct ubwc_config_data {
 	u32	max_channels;
-	u32	mal_length;
 	u32	highest_bank_bit;
 	u32	bank_swzl_level;
 	u32	bank_swz2_level;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index c1989240c248..c70cfc2fc553 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -633,7 +633,6 @@ static const struct platform_clk_data sm8550_clk_table[] = {
 
 static struct ubwc_config_data ubwc_config_sm8550 = {
 	.max_channels = 8,
-	.mal_length = 32,
 	.highest_bank_bit = 16,
 	.bank_swzl_level = 0,
 	.bank_swz2_level = 1,

-- 
2.47.3


