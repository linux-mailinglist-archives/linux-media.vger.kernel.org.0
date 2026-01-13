Return-Path: <linux-media+bounces-50582-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F285D1A79E
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 17:58:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0094F305FDD7
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 16:57:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 810C2350D42;
	Tue, 13 Jan 2026 16:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oEN4LSf/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ea86nPAR"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6681F35028D
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 16:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768323454; cv=none; b=crkXZFrfmRy7O1GKm1jZcZjEm+krlJD8EBTZzliwn5WbPArK3p8RVbUxLDJm4VQjPySVqaRY3jHejoVGigm85OSJ6VSx0NEpXsI33rPNVoHIdq021yX5HJEu0VKyfJn9Qa9qC7QCDpJiFiWUnkR+OAbMbVkTWxP2MDwwGZ3ZGfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768323454; c=relaxed/simple;
	bh=HxFHaMd8bpe8kcSdhwDEmlVS7rhk4N3Se+Zkawib6CY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GJBSORzYqzUpTa5cMlQmZ5qynC3u7dPkPgJjbIjFrMNSfKuzD4+iLgYB0tRoJohcv+iC/ItNBSSdtKQq9LsppbIpURmg6Vsjl8i977RWf/SDgQlQ39yG/cJDjEgqEyhrYf9eEMMlqevTbKNCWOGMiwZvmHrt5MiTPHp03QDL9ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oEN4LSf/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ea86nPAR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DCEOch2865836
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 16:57:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ro+3CJlEZW1JxIMktHpjPjGXooS/+lR4TeEfoGxJw10=; b=oEN4LSf/uh3mgGvI
	JCHyBf3lbKGN++C7Jb9zdIeogeT9ndns0wEy7On3NA/ag02QEaRLTF9R/Gkd5I/0
	UhM3le1hj6yabFUg/RLfphzP/Oc32aHNk+7UcyMLo9Snj94O5zpVLnxIKt9iXmEy
	WMnZi+YOZXoqjWpphuFqyDpSjNE8vtexAtBb1wQ8CY6gW9EThcO+UcZlCvqwzRQ2
	gDh3sEW7QyuUF0zJFDrc16G/ZdJD4Wqx7hSX2jWTtfGUZ6ND1eqpesThkcGB2D4j
	DHT4yKyQxqGmVOf5lnwDmZfyjSBh6a9vu0UoKECAA4IPAejiYTRKq8FxpyI83gyL
	3Lb4qw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnfjha9h0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 16:57:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2e19c8558so600487685a.2
        for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 08:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768323452; x=1768928252; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ro+3CJlEZW1JxIMktHpjPjGXooS/+lR4TeEfoGxJw10=;
        b=Ea86nPARXDHm4An1WLjSCoWqblDF6uRbh8IFb2P1+X/8zFbZ7zBCOhu9W4MkhGhZna
         uw8mjv5sKFtcZ8aONfUY9deWii/68s92sUjgWCb+CjW0OR8brU3EY5hbmuZh+tAKYK/Z
         KytgmiMllLGs9JzIgJdvnuPMVo6I3Iur5ZDzTp1TYXqo1T+WcSBWiW42+dZLOnAtq1PY
         w4jTS0kn5qCA/f+j73FgAcXBgAGuMrGwwkzSalQ4qXGRJ+W8B6gq+x+SdC06TgN/yfUp
         NOKfV6AQvNKd/X5qcgElZf96lLCmgmyiCytj5Zxsaq6myG1WV7cdATxKkPZieuKFw1LF
         qkmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768323452; x=1768928252;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ro+3CJlEZW1JxIMktHpjPjGXooS/+lR4TeEfoGxJw10=;
        b=V5uL5K41rY82/r++ERZ2YurOGpqrT7MX/8F3EuLBxYchDdplkbBM+rd4HVgUdN1ypc
         cCDY0w7gcrN7sMahgIYVIi2yFvhLTvlfgMPiPqLK8ANg8C6tskVik15Bb65HNWW92fbV
         wEfnSuuRyvOCMGmQ2xbl6KT8faKAitfNjWV2/53DsMQPwXFPWQybbJLSlVZT5Bq6E1oR
         /8Yigcr9VN5xG+1KEe2PCXyi8gfmeiEflsjYdGK5vcqLuQElVBoo3dHLZEhblIygR6S/
         EkuMR9uSSd4h0MUuIaPXSiIMXZ6w19+SZi0b1X0vIDBWHKzAJDr2Ig01p4Qah5/Q1153
         kR0w==
X-Forwarded-Encrypted: i=1; AJvYcCXWl3edtqCFi7wGmgh4b+IPPvjDpZQ+ASRFrn4+bhGVbK5Zdef/OoT3puOICTcgiktYgwTXRXcfYHV4yw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzURJ50UavMz+BE8mPjmz34h2XZvUeYfBZ2R0oPrS2gv3TmyB6t
	9swCjQdMbyxPoM2Wc055dNFBLFDh4uvSIh72OGAVGT6rr/7T897vwh8O7M8MzZx6bsciCoCAaU+
	fM3L7R/SvcGEucV0KYo2jzdxJnhbT/7RRk3cCGn/dXGSrSlm14LaZhuO3ZrjcIi/8dQ==
X-Gm-Gg: AY/fxX7P7G5EWB3wnJoNr0XI5fygL989zD2yxl4yCIcCgvTMKRI9861qRo9ObXBTlHG
	T83JD9cLaX8r8J3tOsmK0aSDNZyXpg3MVF4TnYtBROdPTxQFLsjFeAdM1ukSi1SbwiPsD7nCUq7
	WoUTKwaSkwSnJZsgZPwHZoFGyBvBXBUFAHFoCJp+sqAvQmoTi53C6JnJePFaVcQSZ0gyWv9lIRk
	YZq3+7xxB88DLxBhfCZeCcH+Yq6VY79kh4EELIrtsYKh0q3LW93uYpEWwXBCWdSBvvhYgLbbqr1
	ugxziomSJzhItVAzNLgRMdK2vYh4qLF0UnggI4dPR2ZhNh18K/BHKMtMbwK98vFXP8v3tHU8bvD
	E5XZs+D9YRcjkyZpaMQ5ptGonoQu7EbN5ACOSr8m8xpdGIwFcin3GsKBgVDFobYbF9uZSTlQSDL
	BOq4cHOClBPtIMz8BBSZinEyw=
X-Received: by 2002:a05:620a:410d:b0:85b:cd94:71fe with SMTP id af79cd13be357-8c38939d0b3mr3069764985a.33.1768323451749;
        Tue, 13 Jan 2026 08:57:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEPHLZZnThHtTThEN8TS1xdqz6/f67rjIpBLh9wnaWrGH00fV2A1b/2bIaew/04IQxVVL+JJQ==
X-Received: by 2002:a05:620a:410d:b0:85b:cd94:71fe with SMTP id af79cd13be357-8c38939d0b3mr3069760785a.33.1768323451032;
        Tue, 13 Jan 2026 08:57:31 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b72af5ed2sm4788677e87.58.2026.01.13.08.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 08:57:30 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 18:57:18 +0200
Subject: [PATCH v2 03/11] media: iris: retrieve UBWC platform configuration
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-iris-ubwc-v2-3-4346a6ef07a9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3148;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=HxFHaMd8bpe8kcSdhwDEmlVS7rhk4N3Se+Zkawib6CY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpZnlzPuHC0ez/0yoHc10b5Tkr41czJWLTpbCaa
 hgBcrNbGT+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWZ5cwAKCRCLPIo+Aiko
 1eZUB/9+N0Ywz0eY1QGt5LDLkbXaFL0+wZkWQlc8fWbBMZ+R/ROFJY13kyW35e+x+2EuVe/w8S0
 BLMKr+OCrK3VcH+GPkUwfu0XeMGQAzGE6LxGg0vmHgYXhZNt5ivjMYIEjLv8Z5uFMQmRwA1A6XA
 pfZjiO92Dt072IUGnIlqlLZWauMNFX+U1GbZAdQerwamJ7mkjJoU5Yq7RDazTNfENgvLWXnGsRF
 eVm8hwK0a3Ukv+E6BJaT6JguMAagAyzjYALEFSwMLBfYwcUEWikDUScPfCgkFbtjns1YfExJgQY
 +vlkETBKu38DBiJutiZc3IErf1Ll3g7sd6GfFZUeM4cOpJKz
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE0MCBTYWx0ZWRfX7/OzVSmX1ZX8
 0V7GctweH+CyeVAfN17zzgqkQyFY8gkHmO6mEjMBiP6ck0UaYTLtIh438O/EwuO3MUpQg/NeRyI
 ubWf5YsHIVJKJiMniupkisTRpfapXI5yRi+iPOEIz4HQ6KbtxB7HIVqI4zsObF5MHDGgIavhB4m
 Tv/YCKi4e07WFdRyRjAQmmZxGmx0/qN9ksfXX0mfjcrIIbpWQt0QYChmYGucCEqcn+SHQTXmA5Y
 aDzTRdDbhWsU0vf8KMIc3WwXifKTUoZH+fFWsy97tZtJhoV96Yrxhv7ThKEEnW2tlmWRibEHOon
 aNlqfa+t1NCd95ttTDVTu871FZPjWhq+jE8PKVtSTM211paBrmvcXCwfnMxGUmWqVguRNEoewoS
 YzeJVmlswCGKrfWm3Lvh+axzPNkn4Tw/8Ka1a4uoGOf2Xjn6uQdWvOou+imroTdxeIBXVwi/PhG
 zyAPWgDmVTlPnS28tlw==
X-Proofpoint-GUID: -707lFHNN_fBfx6yiZs2v5FaTkxRJ9Uq
X-Proofpoint-ORIG-GUID: -707lFHNN_fBfx6yiZs2v5FaTkxRJ9Uq
X-Authority-Analysis: v=2.4 cv=XJQ9iAhE c=1 sm=1 tr=0 ts=6966797c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=KZIT3C-7-F78qrtZtU8A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130140

Specifying UBWC data in each driver doesn't scale and is prone to
errors. Request UBWC data from the central database in preparation to
using it through the rest of the driver.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/Kconfig      | 1 +
 drivers/media/platform/qcom/iris/iris_core.h  | 4 ++++
 drivers/media/platform/qcom/iris/iris_probe.c | 5 +++++
 3 files changed, 10 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/Kconfig b/drivers/media/platform/qcom/iris/Kconfig
index 3c803a05305a..39b06de6c3e6 100644
--- a/drivers/media/platform/qcom/iris/Kconfig
+++ b/drivers/media/platform/qcom/iris/Kconfig
@@ -5,6 +5,7 @@ config VIDEO_QCOM_IRIS
         select V4L2_MEM2MEM_DEV
         select QCOM_MDT_LOADER if ARCH_QCOM
         select QCOM_SCM
+        select QCOM_UBWC_CONFIG
         select VIDEOBUF2_DMA_CONTIG
         help
           This is a V4L2 driver for Qualcomm iris video accelerator
diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index fb194c967ad4..d10a03aa5685 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -30,6 +30,8 @@ enum domain_type {
 	DECODER	= BIT(1),
 };
 
+struct qcom_ubwc_cfg_data;
+
 /**
  * struct iris_core - holds core parameters valid for all instances
  *
@@ -52,6 +54,7 @@ enum domain_type {
  * @resets: table of iris reset clocks
  * @controller_resets: table of controller reset clocks
  * @iris_platform_data: a structure for platform data
+ * @ubwc_cfg: UBWC configuration for the platform
  * @state: current state of core
  * @iface_q_table_daddr: device address for interface queue table memory
  * @sfr_daddr: device address for SFR (Sub System Failure Reason) register memory
@@ -95,6 +98,7 @@ struct iris_core {
 	struct reset_control_bulk_data		*resets;
 	struct reset_control_bulk_data		*controller_resets;
 	const struct iris_platform_data		*iris_platform_data;
+	const struct qcom_ubwc_cfg_data		*ubwc_cfg;
 	enum iris_core_state			state;
 	dma_addr_t				iface_q_table_daddr;
 	dma_addr_t				sfr_daddr;
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 9bc9b34c2576..85e531b35ecf 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -10,6 +10,7 @@
 #include <linux/pm_opp.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
+#include <linux/soc/qcom/ubwc.h>
 
 #include "iris_core.h"
 #include "iris_ctrls.h"
@@ -248,6 +249,10 @@ static int iris_probe(struct platform_device *pdev)
 
 	core->iris_platform_data = of_device_get_match_data(core->dev);
 
+	core->ubwc_cfg = qcom_ubwc_config_get_data();
+	if (IS_ERR(core->ubwc_cfg))
+		return PTR_ERR(core->ubwc_cfg);
+
 	ret = devm_request_threaded_irq(core->dev, core->irq, iris_hfi_isr,
 					iris_hfi_isr_handler, IRQF_TRIGGER_HIGH, "iris", core);
 	if (ret)

-- 
2.47.3


