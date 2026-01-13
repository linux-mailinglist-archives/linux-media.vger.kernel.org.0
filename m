Return-Path: <linux-media+bounces-50584-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FE9D1A7B9
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 18:00:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4DD833033FB3
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 16:58:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 711871B3925;
	Tue, 13 Jan 2026 16:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ff/bs0zO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cY6Q8GFn"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B29352943
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 16:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768323459; cv=none; b=nXpx3lKbaNM+8kiz16pVR7edSQkQI6rMcALndsbsLoz2Ue7758yPEH7l0akcUziuyrzazrK/JRs8saZTBH9zc8EBvB+tfgRbHzUE/RgUvzbGppYZSu8FRhSjCKTdmyTuJltYhvw+eUbd0Kdy++Yb9C5jzErJyqPgNuRb/ABJlmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768323459; c=relaxed/simple;
	bh=21FS6ewfuqdGS3uFDKer0oeNOooIoTgNJcaXGQoNyaE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kTrQ7fJdl22+8t8gjW+KucZwnCTlaTf/++IjoHhO6VJyvEN0PASIOf5hJjJcFIvKW0fjsBPe+2WMS7783iFlgE1pVZzNi/t2D23KNR6BqZetdSTFN9/Y/at5T3E4bNt5b4mT903GmoXMLThLDrxWrZbRhy2qKh9FZ9SQvpI5eBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ff/bs0zO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cY6Q8GFn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DC6eG52865817
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 16:57:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3qd0rjFR/P4m9XN0g2YNicO9VxjDGq6AS9z8HKrb+Ek=; b=Ff/bs0zOvQrVqQDm
	ou3W1WkFr1Tnln1wod1rqtq7kzJ1TgxXTTtnqi2x5NYwXkbQzcuXsiTihxIY0eFO
	5tHoRzDe5TkGrvUmn/VkA7qn6HpClqo+t45pOF08jIzN6A66pUPYKJerRGNNlKZ2
	APcRUFOa3HjH45T2rgdcnm/ORfXCq2+7gJWCIiKWv0enLnfVwZRoh6wMr2tyAw2M
	d16swDxggPDlkKyuaOkNDJpS0bBKK4YAKOck2emZhF25h8RFV3GqATAalvHKWSw4
	6pewj+blt4iyeylJB/y/21Ozl3FkE7DQkjIrU1pQ+SwaFKpyHgWevYjvJy1PG44D
	/T4L8g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnfjha9hk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 16:57:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8ba026720eeso656247185a.1
        for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 08:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768323455; x=1768928255; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3qd0rjFR/P4m9XN0g2YNicO9VxjDGq6AS9z8HKrb+Ek=;
        b=cY6Q8GFnWB3q2gInv6hBDTPvzi4arH2kMZ88+RSO4QP7I7PHVxx1sykfTBMfgohlgX
         shSqXuispPLQMk+7AvJie2OPU/G+SuKYMfmUMfCXQMXq77u8qVgJoQ65wGXhQ2qcygq3
         LHq5HvQtrAVW6IGRusmMgGhWV4vcUCE4aHFqIl7kudz1sBtck7qaxYlxcWAbnTzHSAVw
         VYIP5aXhOhxZeOPJ6hO3vOjU9Jjm74qPW32hP8RFjJpnxhRaReVbzlzoUUYLDWXCR3P/
         1FZ3iFYzJqZL8budZreIga/6/5BGErEPcqmp3841fupv0xMSTzLxFpB2mMWYbqtID0Y2
         JaJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768323455; x=1768928255;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3qd0rjFR/P4m9XN0g2YNicO9VxjDGq6AS9z8HKrb+Ek=;
        b=CYYrgOzj/5Xecc++urWNNJGo3t+4xZ13SEAOVA52LnhzZKeB4P998H4w0NrVw8g4bD
         Ronhg4K6BuZJX/mh6v6gEeFTBmjNKjmStZW2Jf68fpc+I1r7im+8vGzb8FRyMmY6ExlN
         +CBo5dSHMrtOMBdP4R4UknaEYW143V3GL6/l9Swbg9jBtnl6MIxuVxWdal88js6/GjGx
         XHjUHa0NFaP3z1stHdjvoeVJbgB7SoKMwJ/3WhxCqNYorPTk1fx39ueK1PhnlW9ouDTx
         CAmXOHQwxcj3NlA7Vh30ArbBiiSfIF3G3+npCswx7Ybbtw8LrAIGMkk+yDYMdyoEPucY
         T2dg==
X-Forwarded-Encrypted: i=1; AJvYcCU/V7iaN2QYqY0vE3cOelrp4by9l8IoZvPwwIImAC2kaaqLNZbmY3VN9Ip4wilOTREkg0y43g1FgYlSWg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmUJqktj2AK6hH00FBSluAknscZO5y1ppDd7jqUcnb2OtMRRS/
	jIird01+2zhKqpctdUZJhTw35jAt2yFR6BT2h2zeNOUYrxonyeHHQxB8/pHsNL3nQkZQZOOkYUC
	q55BcPZFxo6d2rLMaFUroQeYBEYH/95/SkC9btIcF17Mp18jpVFrIy3DRe6wEqS9/aw==
X-Gm-Gg: AY/fxX5agC0e5sen7rIzrVDfw5NrRK8UaCyR0m1yOlr+ZWFRsQ1ErvlASRG4i1KKRqJ
	ypYcqykKSKbbmJwK5BkdmN4B/3j3HBNcqt5Y2c04YdvbBnypZOOZdoR57Oz1ugzHbVgOdskEoOy
	MUJBWQWZWdUHhaIQ4XKCe3jyoht/5qim3YbvflNgESYalsElFQdBOUPTCh8pBgpC98NOx6nKfzZ
	61JmSsjgEAxFoPa46hmB3qe72dYGT3bYNWHY5h/dUnWuNfGbsuB1C+sr0RbArnky74tflN8MFJi
	2bJJdidn9hpdNF6NTqZJf2RHa9c2N6vyoqU6LoS2ygtKR2d4fPelBif9uLagoF2KYkvq6KZxUqC
	jVfGP/rrAdqqmDFKoqkG2DKFFLV8wFxTbKOI5mWquQgVCzd90A+xBOyL0nUIR9UixYXRAmMkgqE
	fgAzuEbZ15DztJgF1F4M9v3Is=
X-Received: by 2002:a05:620a:8ca:b0:8c5:2ce6:dd1 with SMTP id af79cd13be357-8c52ce611b4mr133423485a.6.1768323455451;
        Tue, 13 Jan 2026 08:57:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHmMk/PsOtdj2Lo9u4l/QM6jZZRflGFrd3qJ+h6uRlPWq8U3aO6YVpu8Fjn1QQ3S+KyIwtYvw==
X-Received: by 2002:a05:620a:8ca:b0:8c5:2ce6:dd1 with SMTP id af79cd13be357-8c52ce611b4mr133421385a.6.1768323455017;
        Tue, 13 Jan 2026 08:57:35 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b72af5ed2sm4788677e87.58.2026.01.13.08.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 08:57:34 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 18:57:20 +0200
Subject: [PATCH v2 05/11] media: iris: don't specify highest_bank_bit in
 the source code
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-iris-ubwc-v2-5-4346a6ef07a9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2326;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=21FS6ewfuqdGS3uFDKer0oeNOooIoTgNJcaXGQoNyaE=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ2ZaZfG6U6/vWplOWVLdfkQt3qN896XahvD7t695FAj/V
 G3bafuyk9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQATyZrP/s9wQh37w3yRfxFO
 x7+FPapcxvtywb7TnI9yf4l+V5GvTxYPuhQRey7gQMrhyE+xFuXJX3NuX4u5ZblSbFWkwlOh7yL
 Cqns/7I8/f+34DkNZkbnsaktsgsO9BLKu+RW5dzS1yB74cE5y14+1r6o3zEhlCHySp6/Qy/XtrI
 2/VdjZ2f90N7ltrv9e/fmsoNyRUq3SmRvny78SfrZaIf7yeTsv8zQNhxzLbVqq52VUQsrn+++8n
 RvzP+xM4TVvG62wq3Zz3iowXE2b1SD1J6zH5XKYVVjjosdBn1gz2JQn3TgS9W59X6JPHbu2ftIL
 5tvW177qFH70eW2x09hG7KOASIRs/cw6OfbHmvmxPE5PAQ==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE0MCBTYWx0ZWRfXxt0Q+avDjE+M
 aURYMngfcUSJohCU1ui9Dnq5oPJdSbKiBiYlcKJTbmhJI6beP4605cG8LPXoL42rNW9DTHUQhRG
 dOJAk26QnVBhJTsZa97cBkDy584EUoIskQ4xYLpsStDmCgwrN7Gde44zGZJUghfDC0i+0C6fRF6
 W2i3vxcyfoYevTbICLxCHQ6S58r+wmcmdRyKWfF96pGLluI6IXAL31HvnDs0Adoh57BVgjWEW/s
 Fv6QapYbOmr6mqn+QoJpJ0n3DolcIZi2LhOizW1x9mQQivfL8bXVe806/k0SL+LxN24HukaR9Al
 GCl0ipCFyMFke3upVSUWiUvFu7BEciBvSRitJNE3cvZoczBu5YZsZg6fRKIVhbObptSegH8id/J
 Fr/QUvZSyyPksI+4iqPPMG+YbtMy01R8d//VI2mMwi5NhWSvZNYf1P5CVSNkih/2S4TwmiNCiKp
 Ksp8I5qiQCenSwt1nnw==
X-Proofpoint-GUID: uWX_hVUcEk9uCHU2g6yhNxhSJjC_qxtB
X-Proofpoint-ORIG-GUID: uWX_hVUcEk9uCHU2g6yhNxhSJjC_qxtB
X-Authority-Analysis: v=2.4 cv=XJQ9iAhE c=1 sm=1 tr=0 ts=69667980 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=2VIzI6ABkMI1kr12n-IA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130140

The highest_bank_bit param is specified both in the Iris driver and in
the platform UBWC config. Use the platform UBWC configuration instead of
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
index 878e61aa77c3..a4e60e9d32a4 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -159,7 +159,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->highest_bank_bit;
+	payload = ubwc->highest_bank_bit;
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_HBB,
 				    HFI_HOST_FLAGS_NONE,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 3c5f3f68b722..8421711dbe60 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -73,7 +73,6 @@ struct tz_cp_config {
 
 struct ubwc_config_data {
 	u32	max_channels;
-	u32	highest_bank_bit;
 	u32	bank_swzl_level;
 	u32	bank_swz2_level;
 	u32	bank_swz3_level;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index c70cfc2fc553..5ae996d19ffd 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -633,7 +633,6 @@ static const struct platform_clk_data sm8550_clk_table[] = {
 
 static struct ubwc_config_data ubwc_config_sm8550 = {
 	.max_channels = 8,
-	.highest_bank_bit = 16,
 	.bank_swzl_level = 0,
 	.bank_swz2_level = 1,
 	.bank_swz3_level = 1,

-- 
2.47.3


