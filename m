Return-Path: <linux-media+bounces-50834-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F30D2D327
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 08:29:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E0B853020538
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 07:28:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0338350D5B;
	Fri, 16 Jan 2026 07:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jwEcsGc9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LMuIECMn"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BB43502B8
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 07:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768548469; cv=none; b=H2smJSVcngtczXJTpoej9jdQPpjIiXBuIE22PDIL+uvKzFOsMM/DJpQBaslo5nc9SjkcUpb4qquUvqo1mXDeU0T7MDQ+eCH3Z2ATLCbr1mib3NsF0mVxRHNU6fleo0q8xDzaT1EvfFUrBi54FiKOaKmCjK3cbpk1EztHPf7GLDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768548469; c=relaxed/simple;
	bh=pVPYBG6Zmp4xvoeS1LqjWVdLu56/SMU4J5WCv0uhkCE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rmpTThLpisFe5uekNDhPmh6CuQHGvTZt2E6LpJHoOY+1EZegrgk9TH6mi/Q+Aqz7tKnPfVMHiJvhyopb+ZZZN+zvsLOJgZ0KrXrFcb+7SS7q+EwvcV8rY/Blkn4+dgSFi2/nEWa6bkBZtj0xb1g3CuEG9ZsqWREYnwQBzdvip00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jwEcsGc9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LMuIECMn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FMkt6v3582836
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 07:27:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4QuTSDWOVRIPQT/wdz2/Zb7Ib6ue0h9V6PsZa4P8oi4=; b=jwEcsGc98DU7te48
	UZ8K4r+eNk8yWijgY+bo8zeQDm/YCz/dCRodIJwAeO9ddRougzsHrbFcF0Q/dNFH
	nT7xGaPdWbwqk4HwyR4cgDn+ksRpOtidXvkwc7QP/xqGX4evTMd3mOiBoj7xSpoa
	Tc5FcBqC3wVcBiS5qgbHbnROsrh7drEzEHbMt6c/BmIpsWFkDOhhP9q14Vgz66qx
	7XOPmQF9cHiYAUVMZCKdVXC1YSoBCwtOxVWFF151HSoOs+MIk+BHuEAQudhlmfL7
	4npGMlOgTdkCvzUqaz19nApYcGQiOMEqBE2Lhd0Arb9oON6731jdEtS94arQCZqd
	fWucNw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq9ays7m5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 07:27:46 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5014c9ee70bso44027051cf.1
        for <linux-media@vger.kernel.org>; Thu, 15 Jan 2026 23:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768548466; x=1769153266; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4QuTSDWOVRIPQT/wdz2/Zb7Ib6ue0h9V6PsZa4P8oi4=;
        b=LMuIECMnzfXfMnRIwHKZobPbyDyHRBCYdO01dcNzKjePL/Ebcjr/WDldRnsPqf91vQ
         wgmqQ7CEP29nmTjXKfLqdcG3Xs9q3T0EHDE4DJpN1qdDdahvEmuGMXMxLnT9ZmXQ5SYg
         QFyBVRlF4+qXWBWNvWJSd+791iL5/pTLrSoti7yvfIr4qNcQNCUmDITg8NSirO7JgtM3
         X0x17v8qnttKNVIttYm0OcvaevxoeocIQFP+5xibwGnj987zpCH0UKLsA6xGfxTM+jVU
         dpe0BanXlIj/WExgrpFq/rq/vf2gdGvdX2CCDyG5ZzUKZjaYWy5RDcCxHlTxDXaQJd2P
         HUKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768548466; x=1769153266;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4QuTSDWOVRIPQT/wdz2/Zb7Ib6ue0h9V6PsZa4P8oi4=;
        b=j+hAtHq/VzvZLnWCCvdg1FhP8OLjG0M6jfC+SvdjAo4KVW9lRZOIvEgxuEJV1SkkNf
         8AMLUTqgVINeFuFtvZaBuQx7CVTo8Z7FdcQJWtMH1rAh2XBiN+rK/RjQzyYRdODHW+ya
         Q38mE0237niOL/XQ9qQ2twVNUdMEc3LFkTLVZ0jFFAUayIdGHHjHC5Nh3ctLjLz91h/4
         6qpCHK9SEePRSQuCF8jqyxST6B+AsaZylepQPqQw+oa5FTpLXFPM1Ct0usXvPdvfQTlx
         wB9SU3xpTTRVCR/wy1D3vm4cd1v2hEROvE2ZcHOsc+TpMyw/Na4YHtg5yyVmY1bdKktv
         JwAw==
X-Forwarded-Encrypted: i=1; AJvYcCWyci/KQH4Z1VQCXUV7NOgqeppgZ9fIKijjTaIvd5eSgWefBk3hd+QccjWHZoUMQO14nNhz/Gj33XOWzA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1UqLYwqQGO6q3NsCkxn85YdxGqjGZRSwafuAiNXO3itL90MPP
	+cmGzizXMgSo+Rm1sLfHcM4K8vOs3ZQCGb9KseMAvo6x+x3YHLaT5WQm1U2CB41RfZ8UaElAE07
	nN/j/cRpTsM+1p+75wA4dbxwivmfkQgl1TuqWCudHnaH9U/fxcniWWW6xxb6Jh6XErA==
X-Gm-Gg: AY/fxX6eLuaHD2z11irW0juckEvIxCixbm9mEmySPeVa3mwGK5GquryxIwA5HwLQbO/
	beHRMWN9Kw0xEIYIa1xlKFrS3PQlC5SRGm78NOtxZH6DX1ffr52lL+GUBcdM8XKqaoF/JM6Lp4V
	IiBrf93u2kUYagyhTQ3PIefanxs/tCBqcDE4llOOqqa89Bk10OkP8NQawY90fs9Nq1YfTlmIvI0
	8Sa14Cs1JRHw70NyJ/zp/oHcG5X8m8fnrnqZ5FbYWrvvWTTBBISN2zeQ96hARW3FbjZJUYR0jVA
	N2qdpM9RefRUiTzLDVyAzlPOflaPcS3J6Lzjo/FEiDLxbm7dl2nBKBi7ER3w2F5eGpaUKHBNlJl
	DNoD4qSyfvbBGRKSmAisdvis0L+5TXjd+3iOycn0wwWEmQOZUHEZoTYfRvYhHCu8RXABGqmmVBl
	e8eH/wU3FBAM1v3cC4XPJeB6k=
X-Received: by 2002:a05:620a:7103:b0:8a3:cd9e:e404 with SMTP id af79cd13be357-8c6a694817fmr279847485a.68.1768548465994;
        Thu, 15 Jan 2026 23:27:45 -0800 (PST)
X-Received: by 2002:a05:620a:7103:b0:8a3:cd9e:e404 with SMTP id af79cd13be357-8c6a694817fmr279846085a.68.1768548465578;
        Thu, 15 Jan 2026 23:27:45 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf3976dbsm516941e87.66.2026.01.15.23.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 23:27:44 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 09:27:38 +0200
Subject: [PATCH v3 4/9] media: iris: don't specify min_acc_length in the
 source code
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-iris-ubwc-v3-4-662ac0e0761f@oss.qualcomm.com>
References: <20260116-iris-ubwc-v3-0-662ac0e0761f@oss.qualcomm.com>
In-Reply-To: <20260116-iris-ubwc-v3-0-662ac0e0761f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3070;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=pVPYBG6Zmp4xvoeS1LqjWVdLu56/SMU4J5WCv0uhkCE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpaehp2eY0Q84sw5cRJw4R7iSUGowsdYMNzWW7r
 JQLLBZ79l+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWnoaQAKCRCLPIo+Aiko
 1YIbCACVmD5fbsmfPmtjA42tUN6J8zB91OoPnx5cfICq/UDX7ddZTudLik8pGDXE3yu06E6IJSL
 OhRUGFzSFDGcunSxXcJ/vN5fLa7C1dq3imzvrStL/A5L6ckNsAZQjnRM7okF9oElpyXKgWBXUxa
 tjOUnJn+eiE1YmkwrDOM6fkPlahm4oFvVbkZGxiG9DeaE19UNEdd7UlL+yC92XWTUp8rC+5Rwrn
 lLxRpjb/1RsePh5Py43aWvMyqoV0BycLQbBbSnjuZ5UnDacj5aiXMupG5/4i5RXliKX5bxQTq2D
 s6sZXiZjfsIpnUKo/ArMFu3eJ/NbZwQjhNzcWAjvIX//sdRx
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: qBs0KYcrNeeK5r4QA4n1z5DxX3Y98uLj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA1NyBTYWx0ZWRfXznp9R7a707qp
 cClS67XwMTsjA3ihOfl/wBEziYWlHDMrP64nznNWgLCm5gxTFk4w5o0z1WPv9wgyHvaMXaYUvgl
 VNNep6ZUZsOh1PBMG9weg538PggoRdI92cPVKN4eknQHdaCcyIplLSUE04iTBj4Rez1uaPoaV0y
 RFbErfF9n3C7Ve4kNgxR0P5jJdK5oLmtNDX7ue/sV1SS5E6ev0lktD6ULatbgKu8W0axOIenKgR
 ThgfW+ZCvUghYNL0Us1iNZch0u719M0zYACvbYFcJj6FPiHxrAkYJgCjZ0c2xp+vkaqw6PVnyZH
 dTvwq2aNgnSmloC8GqtaX27yRNvyW7+PXAgM4K8dCbkrP3PWwrBj5fCIa786Mn3QVfvPGJ0MC1s
 W9ums1/nZb00VMb/6GYoBd6qebV8OK754dN0fCTu9bYvgKiQySHTfuHmWD78fPdPE1AOP2vaqDQ
 552bKu21m3wE/9S5s8w==
X-Proofpoint-GUID: qBs0KYcrNeeK5r4QA4n1z5DxX3Y98uLj
X-Authority-Analysis: v=2.4 cv=NfDrFmD4 c=1 sm=1 tr=0 ts=6969e872 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=tw3gK4E_mqRpSwCFd0wA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_02,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160057

The min_acc length can be calculated from the platform UBWC
configuration. Use the freshly introduced helper and calculate min_acc
length based on the platform UBWC configuration instead of specifying it
directly in the source.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 6 +++++-
 drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 1 -
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index d77fa29f44fc..aa4520b27739 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -3,6 +3,9 @@
  * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <linux/printk.h>
+#include <linux/soc/qcom/ubwc.h>
+
 #include "iris_hfi_common.h"
 #include "iris_hfi_gen2.h"
 #include "iris_hfi_gen2_packet.h"
@@ -120,6 +123,7 @@ static void iris_hfi_gen2_create_packet(struct iris_hfi_header *hdr, u32 pkt_typ
 
 void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_header *hdr)
 {
+	const struct qcom_ubwc_cfg_data *ubwc = core->ubwc_cfg;
 	u32 payload = 0;
 
 	iris_hfi_gen2_create_header(hdr, 0, core->header_id++);
@@ -146,7 +150,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
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


