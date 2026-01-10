Return-Path: <linux-media+bounces-50348-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F83D0DBE3
	for <lists+linux-media@lfdr.de>; Sat, 10 Jan 2026 20:40:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B6593071547
	for <lists+linux-media@lfdr.de>; Sat, 10 Jan 2026 19:38:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01F802BF00A;
	Sat, 10 Jan 2026 19:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GFyxemJ6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dGllY9ms"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819E026C39E
	for <linux-media@vger.kernel.org>; Sat, 10 Jan 2026 19:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768073891; cv=none; b=TYYfYw3TgCR0TGinRdEzHjAntcMqCX9MGv+YXvJKw4FyIC86OIzwavWkmOVrm25HSEmTms62aicV4YIX49fU72YNFAzJ/E6FZcDkd+dnvB5XwuuUujQYffaCatP1E5ocwYlpiuypjtLrvZxabfYvINp13N5E+kTtcBkTUBMfxfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768073891; c=relaxed/simple;
	bh=v7d6FVRClFDNhGg0CFfiHbvMTmzuP2fLLOXk0xkZx0w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RgMhgx5knSd7MKVIZBqmtQyj/EZyVqZK2RrqOHtxhrNd05FM8iymBdjEWZw3koazol48pzAaLBIynUypiYKzv3YYosDVMwV8TTZIl4kU7wjHLwteCVO7lQ1NIQXDXKCa2IF/jHW5d4bcnl+0lcWAf5Q940fNL544cQ3HPnIHBVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GFyxemJ6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dGllY9ms; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60AAplkd3879312
	for <linux-media@vger.kernel.org>; Sat, 10 Jan 2026 19:38:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4H2PI0YQ2vjQe2YmNVHHacsuAm4FcBR4Fa8tcnhZf1I=; b=GFyxemJ6WZXhF5YN
	99Z70WGCf7lKj+2MUVN/ohxcqbykpmJh9e9xj6YrJak8EZaHSzxGrEwlNrfOvFts
	9svoUT9FKFHJT915ZiHlgAsKfP30B1ccKopPTHUStQelqTCrqTkOpwbx/suY1At3
	cc7F9v6aOfM36evR+IYongvQolK8yDGFOLq6swAuAt3/38nqp93ll1232N2Nwefn
	BcVmDI5RKYsI2Fq/VWm1jbUhP/a5j4ifIMuKtPbWok/ZIZUdv8Ws1DVC9eLnqOpU
	HyI4ZJ0Nzx7FdVLKIvjmXJOLy9xbqpaBr3c0uk4bCrFKXXldP32pMLUKHX6lMymT
	msNQ7w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkdqqs9kf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 10 Jan 2026 19:38:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b9ff555d2dso1445710185a.0
        for <linux-media@vger.kernel.org>; Sat, 10 Jan 2026 11:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768073882; x=1768678682; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4H2PI0YQ2vjQe2YmNVHHacsuAm4FcBR4Fa8tcnhZf1I=;
        b=dGllY9msol4Bob0jMoR2xSRCVS5ynHMvz+J/WZ3YhZeBWXM5iS7Gp8VNj6ztoZuePi
         yzWf/8U81pirAupeHPM7KQNER4dC1Ara8vjfENvhvyo5MAaEMZo2Y3xrisafwDykGb6f
         tLmwrGe+FbXwmWDynvQjIGVaWpYGI+AUPAI/xAyKTKjZvYFeszo4846Q4Q0aGdI+QKD0
         mHcVcljkAE63UA1SsqaJiuByjVagAaOqvTPj32oOcsGFE1FpLzxmVdD8JQL+ZrEmBcqz
         cSc+j1C0+IFCdiev+dEHqh2jduEFRiKEhZJb0iLdIHiWpDBa7SoX/49lQ3NquZVxiIT0
         LJQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768073882; x=1768678682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4H2PI0YQ2vjQe2YmNVHHacsuAm4FcBR4Fa8tcnhZf1I=;
        b=I3qX4WKfD056EaoGCYRoh32/8Yegr43U5S9g9TV6NhQ3Ye8ZplMJt5qQn8Z9kPJLfs
         /4xklg6Vm7jfCZzJ/VTwE+PU4+q2z/QeIZ4YRTkmsVJFvxt7EJajpLwU88BOrRxtHSs/
         Tm3JJMTsTEWlPoop41Ed17CFMz0tKn3ZmYIZ/GKnpoPww4ex66hhblTYeYJwCOn0cK/Z
         mW41Q+ofpPzPdbrRBbhnPXLMw/UnYkBrMuSuZ+RWzN/ZAXfb/kS7+hRArwD1NWA/nNHu
         G5xBZ35DVrvWiTP2AVfAWmRvQBHyUyxl+BXWLg2zerAW9WPOOHfhIo6hfU2vzeO+Q96t
         L4RA==
X-Forwarded-Encrypted: i=1; AJvYcCVgGvEybYgY0iX5Ox1e4ZyM651Ery0JuKYWaQF+96zsmMf3rWH42L8PkSCig4CqPPBG6Cpry/HIH9ifLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvyAwqedBypSCVydiQ8WLirWsDB7LfQ9/wek+LFd/KVhX73JM9
	lElENUC8pZg9h2pPjRU5B4LWE5bm1YwbWxf7FKmetgXGYGnN3w0aBv8EVbLnL+eS3eMpW2Q6Goi
	djhY0Pdt1zOufvrngwA1RI9dzAFpQY7b81k9NpwmdBWtQEMjV6psqASU/KYloMAM5cA==
X-Gm-Gg: AY/fxX7lpiORJda7taP4NqEtI4K45YfA0KubVhWSs7FuUib3JAzqknxbX2SLyLXBz0F
	Jq2gJhFqA8VbnEGsCSDtONmiGS9BQAH4jZ0nJ9ZD400V66acOnviSpqqLQJLt2GiVaTZI/hCrBJ
	DkOlheUxDplWTBZ7HpFa/ssjwltToC7sccRYHqobvMaYf0IjvU7GpQNr81DZK9298UZLrR3P5lQ
	TYZ18MGMuuy5x4cP6aW53C9S/2HnxthEsOuWnVBKS+dveXkx4j0XalkGn8uu3kl0MD+7Hm95+BK
	jTiK3POYyq/ajGQGzzoZdIQqYV/AdYcpc/TtUba36Eoi+hrFnoELhDqjNrkWgAdnh4UH3IjMDR/
	hKR3IfWGzcdFl21Nm5rENp0FJn81+KvBuoMupY1dD7IOF/lH4w1tkstvJ1VCodYUCe/O4I8V5Op
	rnVy56Bxiw8naNXwEkGMjae8Y=
X-Received: by 2002:a05:620a:f84:b0:8b2:772b:5f65 with SMTP id af79cd13be357-8c38938491dmr1508449285a.22.1768073882157;
        Sat, 10 Jan 2026 11:38:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEvti4R1UNPB/QZuF9f+Ha4QcmnBP+0xwJq190qSad6tb2kK+hmD9j21s2+HaFiLOw8lNJz6w==
X-Received: by 2002:a05:620a:f84:b0:8b2:772b:5f65 with SMTP id af79cd13be357-8c38938491dmr1508447085a.22.1768073881639;
        Sat, 10 Jan 2026 11:38:01 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d0f6absm3539700e87.42.2026.01.10.11.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 11:38:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 10 Jan 2026 21:37:55 +0200
Subject: [PATCH 03/11] media: iris: retrieve UBWC platform configuration
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260110-iris-ubwc-v1-3-dd70494dcd7b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3088;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=v7d6FVRClFDNhGg0CFfiHbvMTmzuP2fLLOXk0xkZx0w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpYqqTYzvsLt9XVaTe3NM+J5bnKWTKGCVobJxGE
 OEo6WVBuQ+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWKqkwAKCRCLPIo+Aiko
 1e8XCACJ8JwvotX+6V5UDt9kUHKxTMGpeF/vKyGL5+5jYzkCcgyBi4APm1EMBmq6wsYeElyiKf2
 oy3JIC/F1GMe8XLEIzLTJ6ng9K02ee9WOWtUcdnZuRKORb+w/3ciePjqFoUNjddDUzQlwL8Ax6/
 BjcDyf54ZSNt/XixrqY26je+Q1ZXQKqVIYXByZS9b35btR8Ll7r9Kk1JpZimrnL1K7IGuYX28Jc
 gzDgr+/H1okdQaAfZMokxTqsdcAVfGg4P1rTlV2m8p4/lB1ZK6lfW6bHGTN1vV7pkwlRq+Y9Kyd
 U2pvyZ22rLQJdRDBw1TZBaknlz494WJPIg/4RoTibFNMLbX6
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: A_2ITP93uSa2LqoxlIWWBIy9oNp00lDk
X-Proofpoint-GUID: A_2ITP93uSa2LqoxlIWWBIy9oNp00lDk
X-Authority-Analysis: v=2.4 cv=a9M9NESF c=1 sm=1 tr=0 ts=6962aa9b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KZIT3C-7-F78qrtZtU8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEwMDE3MyBTYWx0ZWRfX+mtnHkXZ7R6n
 foB6wx4qR1bOaB5oVoLRjDFT5jS4J95epXl9/SLglMl9QpJ/4HnnyoFPiynDujMIZZpMhVjzHN6
 Ar2ChjUBP5O06Z84BXsvLXmaMaa2pefi0+WNj2Eq3XDB1MF1IZk5BwFrkfok6WyyqJlzTl0eb9K
 akpYBIo9Uy/MZhLIRA7fv6NlC6AqULo3uxZuhhMiz5TCBK4Hd2rA0N9bHT3PbFz0WKCrTHbuSVg
 JiW/6r8lL/BTpeF5/TEKQpGOJ1xQ0hVH/c2dJLLwszce/A/TF8fQmah2zLMAiZLciOqlAF8wT4y
 vrwEEwIbUJZc//iz0dchewgniD/eStlSd+fnwD8NPBbiUdohCbShJ7g7eGFb+cqaGa+9Nh8Yrgr
 J8c0GyOM98PM3IAMCvjyaTHIVrAzUA+IUHVMbDaGUEMayoozEcgyEOvbjFeNeTxj1JPDy9FRE/Z
 EC4GwezSaPU98TjdLAA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-10_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601100173

Specifying UBWC data in each driver doesn't scale and is prone to
errors. Request UBWC data from the central database in preparation to
using it through the rest of the driver.

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


