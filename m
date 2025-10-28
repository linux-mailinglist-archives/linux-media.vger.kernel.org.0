Return-Path: <linux-media+bounces-45812-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F08BBC14717
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 12:47:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 659C21982C4F
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 11:47:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33FC930E0D4;
	Tue, 28 Oct 2025 11:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DBcJd9b3"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231FB30CDA2
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 11:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761651995; cv=none; b=Ym4+Yh0S1BpYFTERgdQnvyqLI5wJKghZNmvpzjJ+HyUHPhDnL9+IiZ0JlmjGnnf0lnX+wF3pIWZhGBauZ3EXIKtGGwHM9a1WfyW2u3OfOEriYBJ9jaZ1vSIb8swaVRe5+Y6A16kmiwpbf+pFZKdtDmFfY5hRO1Eq+Oa9Ax6roFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761651995; c=relaxed/simple;
	bh=OrNUcjAP0/mVj5wLtyJrkEUhxSXagTtUC+k62RnvC3Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kRcP+ByNGs1hlNKwpUkq1d1bPy+4IO0w5Z2g8XI85C71kzDbtZ2KDJKyIfQtT/Gr6Cq6G0ENes/3T4CoIPcuDsJWC3Jw9L9WFjAtOp97sqXE9mSZ5teLK/+NhGwzyhlVxMZh/PcVaFHKmydoKpgey/cV1CJZJppLbSqVcVPL61U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DBcJd9b3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59S8aEoG2881597
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 11:46:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	etuHGzHwtyNg+xWeOYWZVVrjCtlDmyW1Mkpygk3U9Q0=; b=DBcJd9b3S+FCSqfP
	oNop4H5x5kUVMkmWrjVFtQGVosQmsb/QHwlEEPPLRTQBbaOBHjoeaJE/E/x8bjM3
	mj6hRwcfXC9OmHjBap0+KIU0rDRFgpF4dmDL9qAqVY4VPCfyXi64tippAbApnfRW
	aIXUYz0EccoH+ukLbGtgv6Dbs57I5ahLmHSOfkErLO0bNyNWVs8EWo4pefEA1J+B
	YAOu9IXV8Svyp2MYTXA0ov9JdhvxWmtKQM617xrvy+b2y3djJUw43fzdBKxnewGC
	1whJ+mjMKpzwE2WhaH/S0zzp+2FH2H446erS2mBJ+9hf8iMZW9zIXpYd+c+o2DZL
	B6Cgkw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a29uhbnnp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 11:46:32 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4eb7853480dso184877361cf.0
        for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 04:46:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761651991; x=1762256791;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=etuHGzHwtyNg+xWeOYWZVVrjCtlDmyW1Mkpygk3U9Q0=;
        b=B/al+TWYLveobqTmKIn8VObLWTgdLgE1foWr/TNRB9brY0Z6OOIFxzI8foNPm1qeNh
         yVE+sjGe6WxkEeZVsMpZ67F4SexzApeVErwJ1aT2tpo4/8s75ynnXGd6vuhPxFuAWRwp
         VZ0Aze1WCaGGEZr/9ZOn2mVaP5FiB+38Wa1ekjbpo0A6ELhxydQOxj4BVEVEzevCGha/
         ptmMG/5t7uTyZeHiXRgeqGe6b5PhDbIdm89r8zXCvklf9vFWC3Hs6CWn2bARLMw8bVoI
         jzADGwIzJPVkPdDUMpIFsHBF/sR1zIyFb6yDT9vULqSSgTiuUW6bLApCovJdujjK+RuX
         4Akg==
X-Gm-Message-State: AOJu0YxKHmNI3+RCHhPqBzCJCHsZR7uTAtjuohW2qazXNLWYZCBihwy3
	tzMW7tug0tJgOMiy8ny6W+U9t5bNzVz5g1q5tIX+qbRsQeuwcdnhcJMOQg+LF9vOTHEF+CDj8xA
	M6j0YeHXH8a5OHlKuGmCfaT8GhOdRAPBTQ398Brz3IOlY+hixBRcsBev4ZvK24+ChXA==
X-Gm-Gg: ASbGnctMHIl8rSEWS5upCqfm2UAgmJiMp6NAoIHXIuhroUFVul565kR+liuYQzM4vwe
	w3SwdcOv0SiNHZkW34Ad92+Q3B5Pi2Bsh8bGDaOgLyYwjxmQ1MGPjMB41F/LYFwOWKE+Dor97Xz
	1CFTm2v2JOemTX5wpv4hKvv0TtSjiEwD2XW11nUc7Nt4i70yBBwrlLQSbVmMa9FdjxWjzkWR0d6
	cWg/AKlBuItgoEz2kayEg4M1iGiWoeQWJJhjJkStpvErx9j3fyYDceKWuImUVL2ZSzdSLQ9basD
	8RPUl/TTn3Ca2L2Ka45Uzw22iiiXiFdQUAt6BO7UzVQ5BA1sdVb9B8xyq7KzdcNWK8C11fDOysH
	soPjyfrsCN8Qtg0eU0MmhNPVOLDMm6Lp4Wp2ncWUSSFPoCjHOMkyfLynGne6MDqs2hD1e5ORdJy
	ewvWCiSPTvW5A5
X-Received: by 2002:a05:622a:2489:b0:4d1:ae10:5b1b with SMTP id d75a77b69052e-4ed0756e86fmr53141381cf.50.1761651991198;
        Tue, 28 Oct 2025 04:46:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIU/k7XUCuDQw01QgAVR96/HOedMb02J+alxeiL+wGryMoDPaa6RzoXRYU9W2EoZCif/x/nw==
X-Received: by 2002:a05:622a:2489:b0:4d1:ae10:5b1b with SMTP id d75a77b69052e-4ed0756e86fmr53140771cf.50.1761651990619;
        Tue, 28 Oct 2025 04:46:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f41ce8sm3096564e87.6.2025.10.28.04.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 04:46:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 13:46:22 +0200
Subject: [PATCH v6 3/6] media: iris: stop encoding PIPE value into fw_caps
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-iris-sc7280-v6-3-48b1ea9169f6@oss.qualcomm.com>
References: <20251028-iris-sc7280-v6-0-48b1ea9169f6@oss.qualcomm.com>
In-Reply-To: <20251028-iris-sc7280-v6-0-48b1ea9169f6@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4358;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=OrNUcjAP0/mVj5wLtyJrkEUhxSXagTtUC+k62RnvC3Q=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpAK0Rk0Dv/AiRxc1ErJIwDakxoKX9HWaRyc9i2
 xKpQxRlrwyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaQCtEQAKCRCLPIo+Aiko
 1ZyEB/40dxPik2yqkhQqzFjyXYn6rrT4nHsvMPoULZoJ1Bphjb3CkexIm3LmXVuX9sAocm8Oali
 9YsZ+hYEsqnMs6BuaQw4Gds8XQ7egquz905SHrtbeu93S1tuR4hbyD4QF+R/UwldA8GOWMJIoy5
 B4EABRcSOdHZUg2t17ZC2NoTuJU3jhbpNxpPHKPqTOBxAQ8XRBQzQPWGL6ohefkDDU5nHRm4xug
 ZfSAqzha+n3zwQbRxsXMCkGSJaMezBumSjd+/R8D3/zdFVxw6S252EzPQpsavJOBm1FVp4FNuk+
 bpBlusrWWcoluDcydH9gclU6O/9TfOS3mdGUDs18061/4TPF
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: v9KQopWcTrngaPfKIWJijeibR0xwFIm6
X-Proofpoint-GUID: v9KQopWcTrngaPfKIWJijeibR0xwFIm6
X-Authority-Analysis: v=2.4 cv=QuFTHFyd c=1 sm=1 tr=0 ts=6900ad18 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=SYGkZlDhJRt_0546ciQA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA5OSBTYWx0ZWRfXxIJgF69MrING
 ZuARQdgCFRXtiwTh2ErYw1rCLHwJumWlmG2WngyY6YrdL2a+1eAaarKrAdJF/WECB2UyXoHriml
 HY+rZQfvJcviPW6eom2AdsAjP5h8d7rDxUPGlJOXNHCuSn/kTI18lXKTHhbALRC+ow+ClY8ji0u
 rmGozwDM2YboUuWSMoDC4e60ZIdIxAj5STNkGx/Q+fG8vcqDDc4c7Qj69pzbwL231kKVHtKpjO0
 mhxhov2qaAtlW6WuHYbl3c9ohOt60OuvviJoivI/xsoVoYye/HwgjBhe8oTzg2XR8SPIh8t4cGO
 8RZPnY2ypcneaA1EE6jcHJJ1DdEAFtYCrDvYzsQJoIQ0ndEf9gS/YVC4MolnTw72IjihaZciHHR
 JQWDXgcDLr9hVgD+4hTaVrnq12atdQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280099

The value of the PIPE property depends on the number of pipes available
on the platform and is frequently the only difference between several
fw_caps. In order to reduce duplciation, use num_vpp_pipe from the
iris_platform_data rather than hardcoding the value into the fw_cap.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c            | 16 +++++++++++++---
 drivers/media/platform/qcom/iris/iris_platform_gen2.c    |  4 +---
 drivers/media/platform/qcom/iris/iris_platform_qcs8300.h |  4 +---
 drivers/media/platform/qcom/iris/iris_platform_sm8250.c  |  4 +---
 4 files changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 9da050aa1f7ce8152dfa46a706e2c27adfb5d6ce..c0b3a09ad3e3dfb0a47e3603a8089cf61390fda8 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -313,13 +313,23 @@ void iris_session_init_caps(struct iris_core *core)
 			continue;
 
 		core->inst_fw_caps_dec[cap_id].cap_id = caps[i].cap_id;
-		core->inst_fw_caps_dec[cap_id].min = caps[i].min;
-		core->inst_fw_caps_dec[cap_id].max = caps[i].max;
 		core->inst_fw_caps_dec[cap_id].step_or_mask = caps[i].step_or_mask;
-		core->inst_fw_caps_dec[cap_id].value = caps[i].value;
 		core->inst_fw_caps_dec[cap_id].flags = caps[i].flags;
 		core->inst_fw_caps_dec[cap_id].hfi_id = caps[i].hfi_id;
 		core->inst_fw_caps_dec[cap_id].set = caps[i].set;
+
+		if (cap_id == PIPE) {
+			core->inst_fw_caps_dec[cap_id].value =
+				core->iris_platform_data->num_vpp_pipe;
+			core->inst_fw_caps_dec[cap_id].min =
+				core->iris_platform_data->num_vpp_pipe;
+			core->inst_fw_caps_dec[cap_id].max =
+				core->iris_platform_data->num_vpp_pipe;
+		} else {
+			core->inst_fw_caps_dec[cap_id].min = caps[i].min;
+			core->inst_fw_caps_dec[cap_id].max = caps[i].max;
+			core->inst_fw_caps_dec[cap_id].value = caps[i].value;
+		}
 	}
 
 	caps = core->iris_platform_data->inst_fw_caps_enc;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index b444e816355624bca8248cce9da7adcd7caf6c5b..fb3fa1665c523fbe01df590f14d8012da3a8dd09 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -160,10 +160,8 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
 	},
 	{
 		.cap_id = PIPE,
-		.min = PIPE_1,
-		.max = PIPE_4,
+		/* .max, .min and .value are set via platform data */
 		.step_or_mask = 1,
-		.value = PIPE_4,
 		.hfi_id = HFI_PROP_PIPE,
 		.set = iris_set_pipe,
 	},
diff --git a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
index 87517361a1cf4b6fe53b8a1483188670df52c7e7..7ae50ab22f8c577675a10b767e1d5f3cfe16d439 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
@@ -146,10 +146,8 @@ static const struct platform_inst_fw_cap inst_fw_cap_qcs8300_dec[] = {
 	},
 	{
 		.cap_id = PIPE,
-		.min = PIPE_1,
-		.max = PIPE_2,
+		/* .max, .min and .value are set via platform data */
 		.step_or_mask = 1,
-		.value = PIPE_2,
 		.hfi_id = HFI_PROP_PIPE,
 		.set = iris_set_pipe,
 	},
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
index 66a5bdd24d8a0e98b0554a019438bf4caa1dc43c..805179fba0c41bd7c9e3e5de365912de2b56c182 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
@@ -20,10 +20,8 @@
 static const struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
 	{
 		.cap_id = PIPE,
-		.min = PIPE_1,
-		.max = PIPE_4,
+		/* .max, .min and .value are set via platform data */
 		.step_or_mask = 1,
-		.value = PIPE_4,
 		.hfi_id = HFI_PROPERTY_PARAM_WORK_ROUTE,
 		.set = iris_set_pipe,
 	},

-- 
2.47.3


