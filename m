Return-Path: <linux-media+bounces-50590-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E53A1D1A7C2
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 18:00:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DB7F33023134
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 16:58:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F492350297;
	Tue, 13 Jan 2026 16:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p0Vq7b0Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TKseAphW"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DF1350286
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 16:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768323469; cv=none; b=KDccka/6QqW5V9PrAXLKR+RPOIq45WqJSSIHk2/oATRy732xiYOxwlRSr3ItxNjMpp8nkSfpn2kGe+jiCYuBfaWYFqc12sKRB+zf1qcRsOslzLy7h73AMsBHbb8ECnwXMUmmXlY6PRuZ36eeeELxsiMJcOlWiU+uZw81zZTT6gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768323469; c=relaxed/simple;
	bh=AhTbHQYj1BGt1/wq9IUIForMIZJ5fEv6IZwtGavSJvk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MMh5dyjH9Pv7iA29Jf6xFNoHWggY6E87wI5Jk6oqgXZPxfaqTpj8GKW2WpMFwk7CKhwLhzCSJim0bdl7AzsRXUKCFA7hxEHHOKnWiK0BwZJR3lGZCP3+o9RSxG4Uj0bOsMnMP7b2G4e2A2+JNrT5Af8xRBaEkqyDLpQqBMP/uyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p0Vq7b0Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TKseAphW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DCQU263637257
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 16:57:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GLGqN4t9/fHBGxOm0fea01TzjR6zf1CFg50+jZFBdiY=; b=p0Vq7b0ZjxkZDsGJ
	6GFEe/6Q9AI+3NSr4+vFRD4eo6OwFegXeuJIg/gZjzoRTSysBPbWuXX7IjGO+jW3
	ml9t5rGswBUcLPbEwJzDlr9wtu+B7Sa4yESVT64P1rwsX/IfCzUJ5WnWKJnNY8Xr
	Ln56hTTFSFKUv4WYkwUiEJemJUQctD93DzwbNoi5//zpaCF94+4p6LsjfEHSKcFh
	fAgu34NK1u9kyS42tvFP/Jah7dJkUoP54bLOukjEx7L8GSooQDd/3t7vvkLoIJY4
	2pVvuxsm2RfeD8kMzCVATTYnjB37d3cvnhjV0/nONFSfGUgCz818y0/TouPgw7fy
	o3ZK2g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bng2c26k0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 16:57:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c52af6855fso69590585a.1
        for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 08:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768323459; x=1768928259; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GLGqN4t9/fHBGxOm0fea01TzjR6zf1CFg50+jZFBdiY=;
        b=TKseAphWkZFByhjk8+U8okfisCgiy8PUKa12eCK8eZQ70P3PEVMOf40lfaS5tw1drt
         XMxm+D361365nFih4iYnzW4/M04gmO8mXQUzkqLDHShcxMcfndFCsf04ENolFp1+HNh0
         wTJE5p6qOVudZIxyEp1JzpKhKs+JaolckDJjfCaH368j0S1+W9lZJoc2r8vH8wpViQy3
         BDRgNtIIjG7/uxG9l+3tou5tOL0emqwtn+Own16bbew0LYOadkou+j0PdtkX6E+fX9kQ
         XB+fsKOpNFjCzrIKlWcTuStDvgsqzidrhAdUun2lsU1YPprMh1EcvKVblBnUuvS3Jwaj
         P18A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768323459; x=1768928259;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GLGqN4t9/fHBGxOm0fea01TzjR6zf1CFg50+jZFBdiY=;
        b=Mdym1QyWSE+Rm5SacdzJDOZGUcS3yjCCUlN8dP0St9qlZCl45IqMN3cM9cMWSTDNGa
         3bHrClTxWXmFV9h5exugGpZNcUlCrSrwcV2isQ27QjxHlrs8r3gbXyYKiLlU4U7tEiVM
         f8me3jdPmFbASAD9tY1u8hT1VqaxMMIwfexrEGmWIRE+C4atN/GkKE6/JoJCKIRXIBCX
         RlebqUhIXrCTSvIYdGkwnD5zZe8Lv7gPvabJ6cjZbWj7YzlGVpiaY4mL1ATtMkPRhv/8
         4Imqgcc/mIce4juE7eg9U3o/8bQVOKYxIOWXZUFssz10vHzf5VQS/JO2pvf4WdHsPijZ
         uFqA==
X-Forwarded-Encrypted: i=1; AJvYcCViAAVVc6LLOMsv9nV8FAahrXtW8EU6208fCYwLTexJ/Noz0L00MA3rbLOC60DSKwie0ZTIo7N9zpnK+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTjjSXrblCEeDLX6zSTxTieyfFAEkQqk9VSuup91g3LW5+jYti
	Huy7NDGzE/n8u/AISj2pLm2R6DQPkx5oGvyw97oOvKuWdaF1bw80HGV/1G+cgGjHroIXIFrcLd0
	lpHyg6WX2S5MMzxsM6nM2DP28gHyKf1Ts7mmpYzELLLm/ODuUp7eqRWa4W6xRyEUanA==
X-Gm-Gg: AY/fxX5lKvxy3eGrGREU/sleKgQxAKHsONvWQ5uUWefVHYYwwUOSYAhSA7QGOdp89H0
	tK3s/UzLT54eJWFJdoOgFS4awcscD3qOdESrGuCfiU7HFuCxOsQHRqqLvXr/wPMxDgeKtfuQm7D
	IdYrqhZmxFX/weeuOr3CoEdTfNcGSkM2d+kK9wPVYpJAGOfsPPXNpCEX2v4QWUQptptLfkEGxa8
	8W++feb6IQDKqtLm+T8/AHzqrV0V4WX8yoMWTvf/if3NPInoGS8gJkaZa1mm9Xg0KSM7+edjHV+
	KhA+1mPTkx874g7FWqsz4LKFulzBJf6xnJWqOLZ8dN7L2EzrhRtoATuIVcdbs4vwwIULNYcamct
	RYMO0YNNX/i++QBHeWpJhjtEDqq8tvZy2z1FbfOChKBQl3jIeb2/g1yNOI1CUjPZxHJZNQwTuow
	gk4BTlvzSpyLiAKIymvbLsy4c=
X-Received: by 2002:a05:620a:4708:b0:8b2:ea3f:2fa5 with SMTP id af79cd13be357-8c3893e0447mr2835349985a.69.1768323459214;
        Tue, 13 Jan 2026 08:57:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFXwgZ0fK0yC9neD9oD7YWJrX33cXmHUqEqwH/rowxMvNIvSZblKRs3crCDW3RZIb0RPAUEBA==
X-Received: by 2002:a05:620a:4708:b0:8b2:ea3f:2fa5 with SMTP id af79cd13be357-8c3893e0447mr2835345185a.69.1768323458692;
        Tue, 13 Jan 2026 08:57:38 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b72af5ed2sm4788677e87.58.2026.01.13.08.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 08:57:38 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 18:57:22 +0200
Subject: [PATCH v2 07/11] media: iris: don't specify bank_spreading in the
 source code
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-iris-ubwc-v2-7-4346a6ef07a9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2279;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=AhTbHQYj1BGt1/wq9IUIForMIZJ5fEv6IZwtGavSJvk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpZnlzSaIPzdYafLuiolUkERDzWfFPViyXu9dW4
 oRCsUXW3TOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWZ5cwAKCRCLPIo+Aiko
 1fuHCACspYQ1kmZkSJT9/nB0zOed8vpYRIJzry11R9PuiH4hxBuD+9wDeG3gIJ+6y3f+vcNLlz0
 OFQdv8P8wGk2cgTOO9mhDIJO9oTDEJTEtfQDUv49EY3j3Mo4AwQ2RKCSIufNf7WT4gJk8D946e4
 w4aiiQhK7RTP280nagnNT945p6ccLzZPCKLS9YBri5gDsfV+kpTYBIrn1UxTOdvpCBcXxgk2eup
 eog7euByTfuBdVZz4urV0CrTaOm5F/fyfEl03Ti9226WIJHVvGybXNzwvQ2Q0+3SDNU+j8FrZyl
 DH14P31Bmuw8oTxGmXsC9UANAALUEGwg3MuMyesCaT8g/U8E
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE0MCBTYWx0ZWRfX6DNsw3ns/obi
 7VVmNXtO6+OqPQGQofi4x0ebhATNfDorgs1bLfa3+SWIKySPYboKqMhGilFBPzMGglXqFYxG/x+
 tHb7SdYDwlmbAvTU/o0ftta3cksb0McfLGfNw4BkDTFRnRJaJ9JSIbQ5W3MSlFJi+dBagQr+0Lh
 0BKPbmRkO6RM29A37A85HiRwCKSGiU+l9Ma+/RUt3F1SEqnFWs7HQgRMz6htdeAGVYjjo5Hk0Ot
 39nM3zePeP/fQBiQ+xGksQI9Zr2bSEVQkpcGLM+Kwit4HNHpmpH5FCFEkdT2Ix9NGw4jMVMk19g
 6BsNQ/PyptID6gkfs51hq4jRxxKd00tpBI86ofdAwXaUnK5ZmjOYGHBIUKCSNz2vnHHE9Y8wtak
 VdMV1/Z1uohXrxhGwezD7+rLWX/wydYxTSlgqRkNSDj6gG+650vNWSY5/aNEMtyWFuLMuq3A5LZ
 e2k2u/dQgnz3fDa+X8A==
X-Authority-Analysis: v=2.4 cv=C5TkCAP+ c=1 sm=1 tr=0 ts=69667984 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=2VIzI6ABkMI1kr12n-IA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: sQdE0a-yhwkf2hHP6_lU3Y3Xt7gEHGeK
X-Proofpoint-ORIG-GUID: sQdE0a-yhwkf2hHP6_lU3Y3Xt7gEHGeK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 impostorscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130140

The UBWC bank spreading is specified both in the Iris driver and in the
platform UBWC config. Use the platform UBWC configuration instead of
specifying it directly in the source.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 2 +-
 drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 1 -
 3 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index a880751107c7..9945c939cd29 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -199,7 +199,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->bank_spreading;
+	payload = ubwc->ubwc_bank_spread;
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_BANK_SPREADING,
 				    HFI_HOST_FLAGS_NONE,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 9f9ee67e4732..f99fcbb8fced 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -73,7 +73,6 @@ struct tz_cp_config {
 
 struct ubwc_config_data {
 	u32	max_channels;
-	u32	bank_spreading;
 };
 
 struct platform_inst_caps {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 0f06066d814a..c967db452dec 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -633,7 +633,6 @@ static const struct platform_clk_data sm8550_clk_table[] = {
 
 static struct ubwc_config_data ubwc_config_sm8550 = {
 	.max_channels = 8,
-	.bank_spreading = 1,
 };
 
 static struct tz_cp_config tz_cp_config_sm8550 = {

-- 
2.47.3


