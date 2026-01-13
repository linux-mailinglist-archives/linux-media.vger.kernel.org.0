Return-Path: <linux-media+bounces-50585-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 340C3D1A7CB
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 18:00:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EB4E930848F2
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 16:58:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F15A9392C38;
	Tue, 13 Jan 2026 16:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oY6JolT9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OJVP0tPz"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1AA3803CE
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 16:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768323468; cv=none; b=uz+vDjxOGJK8wDHFn+RDjkJxbhVStkYcstPnjT2btSprzxStHKR4REAZYeyXNRKynf28+bIwCjxlNNQFELmgJ9ROdR01tc+b5TuKxm7BigKepVSPybsObrp2FaNEj9vnNN843BRBgjOz4ztbsrqCtq5OKAxV03J8Fkc/9Sio29o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768323468; c=relaxed/simple;
	bh=fQxY8GjWVfh28Faxz0ICvLnZ7XfYjrCODr7t/XZ3IT0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cCmoYHm217K/0AS6/1wK8J1J+u9vf0ozGnQ6Wde068RcXXQ04hLCYCuLTbyRHzgkBkgU5G4ZGt5DBA5kxaJGToXkR9E4s5GlTIBAXZXnQdlw2Y+Ayj8/gUvB9e1KFbEwresHnO+k+QFHhm48zaJ02lPLAxujcfmI7CObjaKCJ8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oY6JolT9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OJVP0tPz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DBDagG4164875
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 16:57:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KRFOrzDHl7Bw008RFEPBz4bPzE+gcbq5KL52MRaHq/8=; b=oY6JolT9I0bdB834
	OAkCxvkKSxiPh82IaeQNhYWatcuEMtj4MG+fJwYXVG7SZMjTuQuDN2WZ1K/B8I6V
	QcDxoABgcx/p/6kotNjkK/B9Wp+zQKeqgQ++xVHXBb+/O4cbc1mHFEzYt1s5Inpz
	OK7O2WUGzBIIwXZkDa+AqeZLidq3c/4R35TKi/PTwuN77ejXKzW/BOT5Xlug06OA
	k7HIBES0TJseoaaAIULW4eVbGiI8LisYVSDun+/wjcQMbV4MOsZg60P4l66MENSt
	BZPzKF7EgeVlylR+dZEuFa4dGc3e89PaVVNslg3YBfjjFGIPjdB+wO3VfPQyJ51I
	rsUlCw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnn06s4k9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 16:57:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b6963d163eso1967576885a.3
        for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 08:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768323458; x=1768928258; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KRFOrzDHl7Bw008RFEPBz4bPzE+gcbq5KL52MRaHq/8=;
        b=OJVP0tPzWF5CEd6UFDOt+6wGXVMNm9B0YbW/vwEgKjsk0cvWHFROjMbw2ohITfaIwu
         x0J+tnwX1EOEupYETe0N1BfLwr6qTM4Tl1Gjk93O7eBRz2PZrBtmygKQGF6sYCj19Hlg
         emy36uhHl4T0bPEduRR8SUpsaAQbdQG9nqU0R4Q9WN2yQ8ya5BB2O0t/YBwMVukd3yUD
         oSyaHiYz5vkVxyA/Y4DiyXLjiTkPtCw0QmOQIIojZND8v1R/pZk91i2Ngc9JOW+ckAXe
         2uOIOERb+y4QJ9viW3AmUG9iNfJ75fqKppUc1GTEKc2O0454/cFgj59ia/IFKeVTkP4c
         N6Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768323458; x=1768928258;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KRFOrzDHl7Bw008RFEPBz4bPzE+gcbq5KL52MRaHq/8=;
        b=pT9ABtYlBXelpB1hZhpYNapy3ko8ZUAreVD2zME+5ClLgngKmvbl97Ov3wJu87IxJV
         CXupZg1quWJOVBIgtsyHMfzapkRzaE30GUoXt7uo7A+Bw5CXKFDF3lWpVb8xRvFDedqx
         C3K9tlWTSx+Agil6dLVtbZjTzi9D3prMtbqb2fkaOxf57j62vlK8RtE34mtn2bf5mQgg
         +WmxBhDpPb3DY2NdI1/YdxJn7h8945wqaOn8aGK4Lt5CNkRZEZxiK/ICO46b2dc/JjxY
         LIetUFlDeHdE0wvu3LPSSZH7OwsalvoAe+vYQZvnirxXH5U8iFnlxK/UmweEtfkGfNBx
         /O9Q==
X-Forwarded-Encrypted: i=1; AJvYcCV2cdhIgsxJLTjYCCs5Vm9vdRtsorN2ZddjV1xcPStJ1Z0y1o4BD1LeEJpOoffYqHsl95h5dIVXPEDq6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYPlSCHQN2YwuaJsWHRVEUWIbcg8i5o1h7UIUDdiqLd44ynZ/a
	GsZ72Pngdee52geFEsWsTa9nVtDEvdv0JvChICtQ4CNfg8sv615pc3fLn+S+0o5OYSMBb6HBv2N
	L0iqZvxmjoKc/GHDCOoM3l0IFmEynDqID8YM6x3EPjZciUNjknEfFoRBppRgGmogE2w==
X-Gm-Gg: AY/fxX5+Er0A/ETTJutgaESmglXTKuk37ZREew8lZkxfAfe27sp/C4q/nWllNp6FLTh
	Ui4pRfwCQoUT2kQCOtuPIQKXdvhcHrZMGvsM18uT3e4MknI+W5YqI/y2Lt3MWm7UjIUODJ3iFAV
	XHh4RDtLPsBHA3R31E0u9FMe92YZhmic2pMV57Efmf2Auk22mzURuP1ZYEsMmGF+gQIDM62JhnR
	dangubA3AlSnDDvgdNIfeH+XGgAsEQQhWhJrbfbyecGAPKat3zVj3Z9Hi4qbkRx40vtz5TOqYXh
	DkVktJXbZHV4qmPKyYmFu/G+hsmwtvFTpjVg2fUzFZLxkXPIJLa6OLse+p/vd4JlpHt9K8vwatj
	2b6AeKnw/vko/NNje+g3JR5VGa2KN0Pyee/oX5uoxc3M3V3hRoI/pCS5w44V9RS9h73E/L7gcw7
	u+cG2ZMHqCXcIg8d5L4zQiJH8=
X-Received: by 2002:a05:620a:1901:b0:8b2:1fee:4029 with SMTP id af79cd13be357-8c3893eb52emr3097257685a.47.1768323458060;
        Tue, 13 Jan 2026 08:57:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHCnhBVZqobojQVLXPQjzAAmSKy7O7umppS6eUXYFfY2Ev9oYVzzadqdZ3a+yy/xKodNNnH/g==
X-Received: by 2002:a05:620a:1901:b0:8b2:1fee:4029 with SMTP id af79cd13be357-8c3893eb52emr3097253985a.47.1768323457373;
        Tue, 13 Jan 2026 08:57:37 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b72af5ed2sm4788677e87.58.2026.01.13.08.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 08:57:36 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 18:57:21 +0200
Subject: [PATCH v2 06/11] media: iris: don't specify ubwc_swizzle in the
 source code
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-iris-ubwc-v2-6-4346a6ef07a9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3157;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=fQxY8GjWVfh28Faxz0ICvLnZ7XfYjrCODr7t/XZ3IT0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpZnlz+/4rfxjX3nufGM9uL6JiabX0uiE7N679R
 /W3MXRZu8qJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWZ5cwAKCRCLPIo+Aiko
 1ZtWCACFa3FyEBbxtmnzw4nZsrVqgP+RQ90bdi2noxWSxt9Jv0Vu8dID28c57bkGJ4DXg7W5tDs
 whZCQvQgz2ACep+5MFJnQsVedpWDix0GBymlqJ3ddLERrjK0oYRvnxjAEG1INCvyBCn7krhos9B
 BGU+msHovll5fZ4X2aKmQsJ6AMulnTjzYc83msqWtPdQInGJe2qu9/eNY595ydBEGmkFPXaG32K
 lOamVuI9Zv8s/UuBg+cbiP9Lb08iqRiNhxnqVME9haId/SuHGiTMdmLgrUNWJoPFBd+jzTeK5f6
 pyCQEVprkq3/9sBHMdsi7Bq+Nw2c8/EJcc507SDOxQ/IAndn
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: O5N21SdPuqqEdI5f5Xboaj5bZfhS15YT
X-Authority-Analysis: v=2.4 cv=ZODaWH7b c=1 sm=1 tr=0 ts=69667983 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=19NtJfuW7GRvGFya53UA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: O5N21SdPuqqEdI5f5Xboaj5bZfhS15YT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE0MCBTYWx0ZWRfX6UpIrp7YmC7T
 /upDMufF5o3Vg8I64uCDT6lx+T9Zt7XyxS2dunmUQ4aR0rmTOLzEmTMvKRQqcPk3B+Fhr/iecG0
 r9vNdrkOMvTalwcb0y1SORMiICv0O5mcLuN5NF3zR8z4pP4DSjT5pKxfCAiWo6jBiacz6/007wm
 l4bzfzpyu3aExMVH6IuuGjaXfVWYcvn50UGvDFyrXP9IoBjAvYtn39hXUdw5uUGPFKc8rUhVp1F
 CkpWmz6grESXJhw53xkkecvAYJXLKOJV+uLeOl3uSEP7jVr2V2PhmZgnTPRX70z0ZQZYALccfNb
 KVsJeocvi2ZlsI1p2F3Tj5m6eMy2Q/+iu/IkOrXBk8aA7zKoObLCFcRf1k3t2NXz9P0DcNQVBrr
 ES/yRI/fSSIHJnfKqB2oc85ryNd0d1/FW822Ym9GNRKYYrNGa/I8mE+FxY84hxffKk7v+Vzuv1H
 +PUcLNxseQ24IibLcPA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130140

The UBWC swizzle is specified both in the Iris driver and in the
platform UBWC config. Use the platform UBWC configuration instead of
specifying it directly in the source.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
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


