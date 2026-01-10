Return-Path: <linux-media+bounces-50350-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C0DD0DBF5
	for <lists+linux-media@lfdr.de>; Sat, 10 Jan 2026 20:40:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ECE0B3079C9F
	for <lists+linux-media@lfdr.de>; Sat, 10 Jan 2026 19:38:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9407827FD72;
	Sat, 10 Jan 2026 19:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="meN+wm9H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CKq4ng5H"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA26299949
	for <linux-media@vger.kernel.org>; Sat, 10 Jan 2026 19:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768073892; cv=none; b=HVa6Q4S/nbL9Tg3Zj8K4twJIzAzakHYumhVRn2a5AxStzo/Zpk0htov0LQ1Te64DlrmF4bxBgAiLst3TikHXVSxsdRTkLBIRFLz/Du+K9PSQkB4EleaOTePxvHhx3k0Qp+ZYpIuC2B9zs4W4E5qUGe23w42yASnZZba9tFHxi+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768073892; c=relaxed/simple;
	bh=Vy9tVwOAA5YcL1Np1wJJTKlwneoNR0tSHzfBWTZUVqY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XnErGrx4JBb3+BKHbqfHKn6cro5bbbE/XxQHKq3vzb5FrdPX34m4M54AnwLmkCAhnIKW++vj5PtdXx2ZyKhMIhKoMdXNcB3XP6YUaVHMVDbg5jefnfyn0j/pkSHlRt3HGjwfQCy9SfmdcJ3NDiU1fZ4TD7GdjAqkj/Xu5yB8Vjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=meN+wm9H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CKq4ng5H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60ACkoIR411417
	for <linux-media@vger.kernel.org>; Sat, 10 Jan 2026 19:38:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	phFObqSVTNQ2TW4bvrM5rdj1a9b0rssNIUHLJzOhHY4=; b=meN+wm9HFNYDDdz/
	bah9j1YQ2f6Yckc/k/3X4dNb1O7NwaR/boY+2gbznFpxUv+4YCfN/zmPcwlBo4/p
	40ACkzEieN7VwR10VYXfV+E47z6sEfS1Exh6/BTWrQ5H6tgccXpCbfh7FvZqhXFx
	gBar0a9gdXydIEKs5Ip9HqVcAOTOazT1Hx+CLlfC4BDN6G9Y0ocHYbntLzXAsxPC
	bclZoPq+URZoiAVAEXBRMuNkLcKFZLFtVspepeP+QPYd3lfMgdO6OBFjaQMrSLDa
	rOlT5hmuV8l6mtCF5oAS+b83WrDga+BduJ+0Pd8u0N22iKN79SjVUGON8sr3+WKY
	vyGgIw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkds599p6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 10 Jan 2026 19:38:05 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88a43d4cd2bso69132266d6.1
        for <linux-media@vger.kernel.org>; Sat, 10 Jan 2026 11:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768073885; x=1768678685; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=phFObqSVTNQ2TW4bvrM5rdj1a9b0rssNIUHLJzOhHY4=;
        b=CKq4ng5HNaOOB5Fm4tA9IowBvMhRqPVp9wZqnzqdMw7bJIyZc+Em6MN9VyRPw6KyPm
         VqcnOeXQ0x234k3UxtUTX8r905fRJgQT7uZoQnLSRuGDB3HAdM1rvgG+G2sfamLM6nbY
         Wv1cFka+dhM781ja2C5+QnzO1O9pDFo+aVB8bXUfyamsMWLmnsclofBGqXFUoLqMZUAS
         W21KGsy8n27LZBm33prbrJ5H1se+BbjU1nIdmvzLbDmHbkI3GOZR/IrkCP7OMC0hKKWE
         M+XcWCKY3ZqOQw1SrUNrfqeSBXBVdhnP0vrOymxKB4FW55t5pzKBhWRDD2EwVj1i+P/f
         7Pjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768073885; x=1768678685;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=phFObqSVTNQ2TW4bvrM5rdj1a9b0rssNIUHLJzOhHY4=;
        b=F9XVm3gud6uSJOUYEBQeDfpE6R8cQM6FobpbXW5UEoZYlg6lt0dTkIcDKy7BeFdZvu
         xKYG5b0Ge9uLwfvT+9V2VyDTnOi9a2FWwkpIevGEDZsW0sCRS+2eC98DkjOwA9KFiEKS
         UyYimOVD1PRT5EFlAtbfGMDaFojvmFnZaS5GxXXHuFWNFev2a1W1M6MtHg+zWN/2X3KD
         9pwOKH5sKu+QyLBzeSF8Yn1BRwo+1gmWnUZaHMpso3jbU2weBG54NQ4MZ/QR9ERf/TSW
         2Cp4iAszHqKeHzJ4F6PDdP0ElEmD0FU7pIGkHSJdGmHwAhwxpXCqKpsh24Ly5uaK25lF
         Cq+w==
X-Forwarded-Encrypted: i=1; AJvYcCU4NsQFxUraDMrw9kKMxEV5NrobSjCJbtkOMsjCRkatG2fMbfHrhNHRW6ZUjHgb8i/3KXotIvqiAlJHZA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy55koR42WJqKI5fytdOndBooCQdmFTRTP//z5/I20KDS7S8yUE
	kWpabOZqPcIE0LRc/Uo6wXO07P4yTg3HUc2XiYu6NYtYrg/JtennZ/jGuqejc7w4b+rfqN9766L
	xcOJXqQGfFKTuQXyIXHf9DI3lmEuNsA0+rpwVRsGw0P8dxt+rPK4xpoV3SqKvQMFW9w==
X-Gm-Gg: AY/fxX7a4jKkShCGNAR94iup6M3QReRHvgBQEPeis5YYF5ftszfz28G0VnUjTZDO4cX
	P31IoBMJBXOquBUQA5BJeu7V6E1vBPAY+gKmGzc5IUVgYe+9ZGpVHSjdzFufq36tfgbqZpO29Mm
	ReF5AN2PhO/suEazOtzV9zuULqIAYV39tUe9dXvdLNJ21x3wsXs3ZF7HMm79t5G4GPBO5uRJxN1
	Y4osSAVlHyDR5FsQHlmoLVmuHwmiEG7QLDiyWrel9fGZSsMSDrPfnUwXzWNqmow22Dl6dt/vi5G
	7fXcLQj5+WkKjMPjDSXtN+kvLvLvlu15FCKIm7FEch/dC+CQq7fZE8RoZzPR+144ohV3xTktzeR
	g+Jiz4Uwah7tYHaneUvOr9ga9v2vtWUlwZBhrHpnSm/FiLpjD1CCmCzAYNAO8Q/yYuvrVF8ADh+
	09oEfaLPLCDogxk6KhH2d6hi8=
X-Received: by 2002:a05:6214:202b:b0:87d:e456:4786 with SMTP id 6a1803df08f44-8908426ab50mr179708576d6.45.1768073884419;
        Sat, 10 Jan 2026 11:38:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFrvCJxK5E/lItE74kRDCtOeI+UlaEXrEZFIHoPd9qyQkcxz9NSymG2Cfr+eVovwlWWnTIhyg==
X-Received: by 2002:a05:6214:202b:b0:87d:e456:4786 with SMTP id 6a1803df08f44-8908426ab50mr179708326d6.45.1768073883937;
        Sat, 10 Jan 2026 11:38:03 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d0f6absm3539700e87.42.2026.01.10.11.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 11:38:03 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 10 Jan 2026 21:37:57 +0200
Subject: [PATCH 05/11] media: iris: don't specify highest_bank_bit in the
 source code
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260110-iris-ubwc-v1-5-dd70494dcd7b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2205;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Vy9tVwOAA5YcL1Np1wJJTKlwneoNR0tSHzfBWTZUVqY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpYqqTpbtQDEaVekUIxIorLinJK+7zjJlGSZMwM
 IVJk9KPFVqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWKqkwAKCRCLPIo+Aiko
 1eHlB/4kUeCqrKqRYoiDCTdAHwW+RQxJdDp+scPXwVIAisZhOAeXVsPpYM+t0YOd1l7pRcUZ1nh
 KKM5HfETppQXrnooOWhfprp32HjTruoZvQ/ySA7bMZk7n8IaLyW+Z7Ute1JeebTfVfWWm+p+Sc5
 nAOeI8+T/0TxChsPUAgiucmG8gotqLveV4inEzeyoUVZTuZ7abJUn/3CG5NmlakEt321MQy15VI
 80fRTK63d3lAwlw1js6cuGlSp1PTyWK2bk3B56afJghYwHnKg3mwE6nK6FVjrJ8gf+4EEMNGB2r
 NahK5yVFqDXNOzCLivlIoHa9GoccIsmhk01fIiI6MXDJQceA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: Mmo2VI_mhok3qaQjqYYis6ApRFx2wwrz
X-Authority-Analysis: v=2.4 cv=c76mgB9l c=1 sm=1 tr=0 ts=6962aa9d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=DVbmZvK3Bkzfg3EmCNkA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: Mmo2VI_mhok3qaQjqYYis6ApRFx2wwrz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEwMDE3MyBTYWx0ZWRfX5cr9qFfr62GI
 +hlPnwAOSzyHWXbQD8t4C4ByKUVNET5EVjaviGTTCb4f/X5Ilo/vbRJD7zkrPAWEQnzF0cGESYq
 H46OWny355QE6qQJkodAY4Epytv9Bly9WqLiKPQbLahgOEMheMzIeMqwLDO9SAatYYux8Kmf8lO
 3FwB7bMJ1laYu3OPE6RW92L+hbM+OYQYTmuJjMNpvajbvQbfNgK7nBevme/J9EyU3+0OVdQoLP6
 +vYuF3V/eSvTsI0pI8KrM8iESuBBrP5cKA+mCJEkLFUvSiSN4kxVZHrtGi+7mF4H5DQNd9vcqUJ
 Sxvjne6aDZiNfXjUytWgb1tGOrsNrsMWUNPgp9CTqIOeFqALZgq6EpaprmPr6oZ1YLG5GMDrXYj
 JrIovdKocjBm2nySKdxNDG5wwVXE3vBsMJNsAC8+ZnVR9nVdx3mRZBeKoQjs1cbjCJTc1H3ZjIy
 vSyijy4HObhnkrNZImw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-10_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 impostorscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601100173

The highest_bank_bit param is specified both in the Iris driver and in
the platform UBWC config. Use the platform UBWC configuration instead of
specifying it directly in the source.

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


