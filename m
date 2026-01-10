Return-Path: <linux-media+bounces-50349-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 065E1D0DBE9
	for <lists+linux-media@lfdr.de>; Sat, 10 Jan 2026 20:40:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B74843073E2E
	for <lists+linux-media@lfdr.de>; Sat, 10 Jan 2026 19:38:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 338952C0F95;
	Sat, 10 Jan 2026 19:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E6VOGJUG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MpsH7al6"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5204D1DF97C
	for <linux-media@vger.kernel.org>; Sat, 10 Jan 2026 19:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768073892; cv=none; b=F6NXWtgNAqp4peAESE+GJndSxXZOh9+ECM0yu1RielqrpPEB5diTHSR/giF1QqHvrVZPZvAN1kLHFtLnzFPAvl2Nf3PUv7J3SdzNGo6Ng5JXqSmmkDUqJIDL0ypINtYZCRz/gBGbglsLLs8t2wecE5CD2ala3OpB9pamD5vkaPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768073892; c=relaxed/simple;
	bh=wPApkxuh4lfLkguH9VNNQc3BFntt8VOiO6TMdbr3Zds=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WhxF1H1lcvETCnNRA2mHayT++OIMOOj3gFaIqmG/EyMo5YaHZfaB/yGQ2loVOD0HqdzWfzvo3s2uXIU20/TIQvDu53NwJ0hauzS5S4o5UTonO78dUZpjYMNjfJ0BMBENuNSZT9ry79+LakIYK2h1uD5sgM4e6jmSDfm27ekpb9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E6VOGJUG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MpsH7al6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60AJ9I1p830003
	for <linux-media@vger.kernel.org>; Sat, 10 Jan 2026 19:38:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gK+pnJ21j1i9U/bbLvHtPo8Y26e9MJOkY3Hs+TWsP98=; b=E6VOGJUGy61sVQhC
	sTL6ONEeLNvGbeqIEZSCr7OTYTbQQKSl3okuOUlb6Ptntc4xzteoRxhxUZQaFXVm
	2RRSkCuTUdH6U0C/yz9XjzGgt84YdUDtukdixmVfzQ+Yu6vdUY6+Tiz/mk8in0zn
	uRXBI7v49eCpFQnRyIVh1GY5sY6lIDAMgH4HJUelFLIE84mD36TPNUSpUNYqmbSv
	JpaO1Cn5n5wkV6xrCLGJQ0WV60idtUdXl8ZH5gB4bMQ2RWr+vjFchfgPwaj/IlYZ
	vWaCmBZBQAXKATq5U9fFmQQJ1xZhaJ9BpXBROTmu2ZFdFs0dTsp5Nwmn6PsbT0xk
	+jgc9g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkfhah3rv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 10 Jan 2026 19:38:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b2de6600c0so1440912885a.1
        for <linux-media@vger.kernel.org>; Sat, 10 Jan 2026 11:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768073886; x=1768678686; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gK+pnJ21j1i9U/bbLvHtPo8Y26e9MJOkY3Hs+TWsP98=;
        b=MpsH7al6JKA2YwDpYFcuQOAZLwVW04RD5+qZAkJ1lpiRXmzig1QyEKYVKWAUdfV4Ua
         QX6fjmwt8IcqrFysoJEFbracevQx2tpdjdxO0a0srqGqrq6F/nVuMrgSpsOMWCltyz66
         Fh08QGtdy+vaRx3Z04uJjO3JWj6X0K1eHzfCZQiI74XsmmjGw5XmwzyNTVfFjWwGTcy2
         obBoB2qz/0ZD8lxMr2rTOT4N9+hOGecXFT0d+0Sk/fq6vyH92ooxuHl7WmSkSKTcPipY
         disHqDEcuUpR8XguIUh7woNY872gTZcRry/6mkvaPZsl6sHg4JvCbGB2WOuSXF3RFqJ9
         agzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768073886; x=1768678686;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gK+pnJ21j1i9U/bbLvHtPo8Y26e9MJOkY3Hs+TWsP98=;
        b=sQOuKJqCwsUPjRjGD6E5gBekRWi7TRFJ+zR5BV+tq9By0SY414DTBZLh34KNPi1dU8
         XSW5BlqJcTOBDJzdrcAkBSPVFfwdtrIfsvqI00CGTMG7hBdmEDFuoZOcRRUxNnMVkbKz
         S+C1gQSjpaZcNcQl/rzL1oO/wuwDMo/N0KoRcJrYJpJv+CPVjZIELFsAOnbmxC+2pkM7
         7n1sB+VaDykmqLN/c+FpCoJECpWFpaS+OEMNT6gWn6+cHLKsKh22WXIDJX1irycH5+kj
         dEhR933B8w792uQGJztEZPp+feX2fmPZBHT6xClHzD6J8Bzr9iURrCcUGjT36kT87OcU
         a9Rg==
X-Forwarded-Encrypted: i=1; AJvYcCUpluY3m842OxteCRKVtckZmNd3JlONes4KuDoLJayAcRIVqo+BuLIfSvE2GDc7K3VBa4Cwx2UjvCLNaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyheblOjyO4NM3lAn669HrB8jzPS5ZOvGdvuCbmPgKN19hDsC7u
	nf7aE91kyTM/Bnj8A9Bo+wFLGpYfyHcddKqgIkMcwTLJFigXvD91PjJBWnRmOMDMsgfK54ce1Vc
	LXXWa+sz+z8bmHQX+pGpFFr/TL/FEH+XbQrqyq/exMlLSKKoT983OWsy+IJgDoxUFVg==
X-Gm-Gg: AY/fxX5bX8GS6FwEn0OhEB8fTOXZaa+1L0useb0A92ID4kuDOYwOWRlkoxb+jRTAvTH
	7+K5NIcQHkSOua7HD/04yBqu9pf8yQSOR5roVLlxq03Pl2+hZDwYTV7qOiW3jyXMaYlZQgNxHk7
	u5lcdtr37+eYUl5DFvnMA5M6w90EY6X1nigpyYSPq/6ot1VbFpzV5uW2XmwGkW4fiOJkNCsJ6Rp
	Y802bIKBo1PmI4EErJhRM9jX7lJpgjwth5W1DDf8453EBQIurRpgpBmM5DcF54TDbkFPSv57vI2
	6OuYaR9xjKMz0yxjVNLRADRAX3mkuFGZruJV1LMGVUMvP5iabEbwruDzHyK9XsBBHwAY6B7PreZ
	ui2xCl6LyfX4mXmAPf5RmOcRLgY9MShckScWSpkNW+uGZLci1StUy7txIaaEvyjNm0AsT3X6Lt5
	eSj/Tb6yx0uhts7wJ9+vuYBwI=
X-Received: by 2002:a05:620a:1925:b0:8b2:ea3f:2f91 with SMTP id af79cd13be357-8c38941be22mr1791695685a.81.1768073885493;
        Sat, 10 Jan 2026 11:38:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEIKWgn/ESS0qupy6xBZrxuNNEEt1VDukrNT5CaPVcHGZGReo2NFsBi2b+nv6ZXh9qRMm0aJg==
X-Received: by 2002:a05:620a:1925:b0:8b2:ea3f:2f91 with SMTP id af79cd13be357-8c38941be22mr1791693585a.81.1768073885052;
        Sat, 10 Jan 2026 11:38:05 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d0f6absm3539700e87.42.2026.01.10.11.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 11:38:04 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 10 Jan 2026 21:37:58 +0200
Subject: [PATCH 06/11] media: iris: don't specify ubwc_swizzle in the
 source code
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260110-iris-ubwc-v1-6-dd70494dcd7b@oss.qualcomm.com>
References: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
In-Reply-To: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
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
        linux-media@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3036;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=wPApkxuh4lfLkguH9VNNQc3BFntt8VOiO6TMdbr3Zds=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpYqqTqJmApBFFw10nL1vWSv+/MlslTeTh12Vy7
 IceARZggeaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWKqkwAKCRCLPIo+Aiko
 1QHuB/9SDh8YAvc7H5s3wL2CsuB8vGeKPCPurzevmcKRHH1YnrOFa7QKcZ37MhNPhXNFF6K1xxp
 jsh+JHZLsbflUJExjO1oH36XdfZg2hDrpk47mqwbOhd6x6RKZJBVUwJOxbYS+qofypTKBbliKEw
 qMJfjCjO8jHHO7/a7U5SSxk+QREto7FgnTdDPK0DbjzWAPIh9E/RX05mQmDDqq/VFCXNHyk8YJR
 Ka8rPLLcuK6cTDY8ZxwEhTMtt8934hmWXJEikYkHY90pN6ShtsSOU0N69ORl5JUbekwAuxb9nHz
 bCX2FMRAD/6/NTjuZQvhq8GbuxVkYsnoaCdJ8cwYzGuYjoPH
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: _09Kwl8UETX8ytH6SHQh_HHu3XiwNeP8
X-Authority-Analysis: v=2.4 cv=bOEb4f+Z c=1 sm=1 tr=0 ts=6962aa9e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=DVbmZvK3Bkzfg3EmCNkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: _09Kwl8UETX8ytH6SHQh_HHu3XiwNeP8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEwMDE3MyBTYWx0ZWRfX/qJtb5DrE0I4
 4Hm5k1R1ZPyJIhd0P6hbwg+v+dIEYuW6nJIeKKyulaSMAYEU8vTYnfDpZqeFqSSi8cWz1m4wmdA
 Oehc8/G4w2ZyJvLEs4yzlZhlX0eBzMnWrVROgHOXz43HpnExndR1OiVEmCThC8C5f1Ubbmi7Igs
 ++bh44cevOHXevhPZ1qKxDYET61DmKD7FChb3Nven02ksUiuzGHnh8Wmi7VTRNEBIOa9pvNGg1Q
 1nqD18jXRU4lSltuOYYov3M6aw9591haMlxsWViNQ7xZaJ8qMQ9QvirPD4FOteRPfcEuo7pfyt9
 hLmyOs8AwyStCQqfXTfA3Q+py+KRrjezB31mYCSIWM2HenwqtlBJJ44jD0JtyFiGhKwHRbSEl6A
 lc04j5cmqMQMnwzHIh/qIZa/Q3FgsrGgJlkG/D5p/rXIngKqh/iQ9/mPncrd5Vy8AJpknUP1goD
 zjdyooo4luXBXGCUpwA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-10_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 adultscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601100173

The UBWC swizzle is specified both in the Iris driver and in the
platform UBWC config. Use the platform UBWC configuration instead of
specifying it directly in the source.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 6 +++---
 drivers/media/platform/qcom/iris/iris_platform_common.h | 3 ---
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 3 ---
 3 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index a4e60e9d32a4..a880751107c7 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -169,7 +169,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->bank_swzl_level;
+	payload = !!(ubwc->ubwc_swizzle & UBWC_SWIZZLE_ENABLE_LVL1);
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_BANK_SWZL_LEVEL1,
 				    HFI_HOST_FLAGS_NONE,
@@ -179,7 +179,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->bank_swz2_level;
+	payload = !!(ubwc->ubwc_swizzle & UBWC_SWIZZLE_ENABLE_LVL2);
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_BANK_SWZL_LEVEL2,
 				    HFI_HOST_FLAGS_NONE,
@@ -189,7 +189,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->bank_swz3_level;
+	payload = !!(ubwc->ubwc_swizzle & UBWC_SWIZZLE_ENABLE_LVL3);
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_BANK_SWZL_LEVEL3,
 				    HFI_HOST_FLAGS_NONE,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 8421711dbe60..9f9ee67e4732 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -73,9 +73,6 @@ struct tz_cp_config {
 
 struct ubwc_config_data {
 	u32	max_channels;
-	u32	bank_swzl_level;
-	u32	bank_swz2_level;
-	u32	bank_swz3_level;
 	u32	bank_spreading;
 };
 
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 5ae996d19ffd..0f06066d814a 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -633,9 +633,6 @@ static const struct platform_clk_data sm8550_clk_table[] = {
 
 static struct ubwc_config_data ubwc_config_sm8550 = {
 	.max_channels = 8,
-	.bank_swzl_level = 0,
-	.bank_swz2_level = 1,
-	.bank_swz3_level = 1,
 	.bank_spreading = 1,
 };
 

-- 
2.47.3


