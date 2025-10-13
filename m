Return-Path: <linux-media+bounces-44229-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DB871BD12E5
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 04:10:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 752703B1C76
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 02:09:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFFBE2F1FD9;
	Mon, 13 Oct 2025 02:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gP6kFrnX"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF912EC564
	for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 02:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760321351; cv=none; b=dlHxrmw3c2czcgN/vPq8Zuqfma5Fq3WwUoH98lT0N7TAp31viMx/WAd4BuO6AKPCfrhwk8qNan+uobreWREUsbHgwxUeGJjm9oKCBwu1UHx59iAxAKVf09gn+C1+aWW6uYSV2MXFoICkQBlFIvbOdJxEv6TbekrqVscc6UZZ/OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760321351; c=relaxed/simple;
	bh=/XlkIw+30ImRJ1vZ+oZYrGWc5+GeaSVpL8dMGuZakzQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iisp1b1YvLphd/2uwxv+68eaqFoXiRI2MT/2z5KNyLug6KI6VkdUZACfdjsgLEPuoqUKHb5OT66EQ9Ph0iM9uY4yY7GyRvLM5UTm1nGmIuCvOwI7R0dqRF9wdGnA1rvcN8s/j+DeGmdI4EEqK4ee6Y3/RdgiNg36MBQnkwk13Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gP6kFrnX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59CNpCIH021775
	for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 02:09:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HUM+cJTKntoj0TSOmVPixlbOh3sBmLzYWf/L9aPHlHQ=; b=gP6kFrnXKYN0RT+d
	iFkIR/mogp5yA4zrWnnHcrsL0cfbsLQ0j1AkOrvk08zbro9HWO31sCs4qf35swkA
	X4HPq8M5OFafrnI9Xtb7jdYYcZi8AHt1QFfg0D7CThcP97F2pNeNDf9UZ9mua5YK
	Uw/fYAITIO5GPJRw+z+wPuXIgj0Epy9VHTxqvJKQqxdy2CtBJYCmHXoocpgnfkGQ
	QmCej3c1yNmil1v68IPaSlP0mtXP264ccpX+vcTHoGMIJEFHMRKfBxcbMrC6KYsG
	SjGMWuz+tSfmQYqfjTms7DXr1tqAMCcNJSVBILv6C30llCanWTBbMy3/ViozYjpI
	3QSSgg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfm5axny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 02:09:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8544316ef6aso24757385a.1
        for <linux-media@vger.kernel.org>; Sun, 12 Oct 2025 19:09:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760321347; x=1760926147;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HUM+cJTKntoj0TSOmVPixlbOh3sBmLzYWf/L9aPHlHQ=;
        b=dNtRtVa7m2FGk+KgrGfFbNLSSD25E+SZodrYBNSjht3q/5bk2s1dI+Mygqrse93f0R
         4Dq4h87wsRk+tvxm0DiC5x7+KvKBXmbxAKAAJoJkGTypQIGaphSlbmBgcs8rCQd5CNCX
         KTUBv6Hejk1FyqJGNnO40rPqzT3cqBTAqf6e7aUaGxRLDv1OI+VnEC4KGHKRwF1mElxl
         eo0PGWYREPEnenMRr8SpfzpuLjFNoRzC6gWJJUIV7UZ3cVgVUIzkmaiE2SIzuF1PNka/
         /7DV83cwZ19ekBNe5RAG8l9dBp7l6jFYK4ZDQt4nRBH4i04bpClVNWd30gWEYqe9nozq
         +Spg==
X-Gm-Message-State: AOJu0YxWBiyUEHFhx2OcvNzCKKwsB6Jk5SLCIK58HDxpFYbn58B79KMh
	0OqQTiuVkfi8Z0FjTsWHLac5RQUUPqswYWWbVZ6ydb+7YPU3KbPCLZonB+A1MVBXfzUUZpqBsic
	j7cymb/g3hKTFnS7sqnTpQ6aWlAbrAMPnVqJP0zhmR/3WxoOq1LaaLHW5wmK4DDhSqQ==
X-Gm-Gg: ASbGncuuG1F5mgIyJc3votJLUTd6R0yFNrDnK45TTZLNQNYxtFJ0IpVE3WlAVEa/Flt
	VS7nwnml0QakqhvtH1zmpip8LlcexItPqzzGJIS14z41J5Q5D7IWOJqDBlHXbJ60e2/IqPmdPcR
	BKa9Kjqznsywi0DzNfrgLZrI7tyn64EhWUCzY47Ini5reUSgY/JRDBI17M0f24XEk6wqDSexD14
	2xnqyotm8k6eJX3L0CxJ4Ej6xDjFklm66IqhVvsC3EYPzOHWchF/LwTQ78MJNkvWGUgtBsYKt/I
	v66/hyjF9X0OBS5QG5NwmsPoMU5//xAOSgsdmfttU71aU/LsqwarhmFZCptn4Q0nxmGqMVaowr6
	gMmECwVeWBZQNxwUJXVKxf3sQeFl25ChPevl2SplY9KGSmTN66wbk
X-Received: by 2002:a05:620a:471f:b0:815:630d:2cbd with SMTP id af79cd13be357-883525bfc34mr2648056785a.34.1760321346820;
        Sun, 12 Oct 2025 19:09:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHc9zi5G7Np9PMmpTV08gJ5PED9SMZ8Oj12OF4Yfr9cRxtew0QXsK0KpIUqXoJdVs7LGsoCcg==
X-Received: by 2002:a05:620a:471f:b0:815:630d:2cbd with SMTP id af79cd13be357-883525bfc34mr2648054585a.34.1760321346372;
        Sun, 12 Oct 2025 19:09:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4f99sm3563419e87.7.2025.10.12.19.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 19:09:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 05:08:58 +0300
Subject: [PATCH v3 4/8] media: iris: stop encoding PIPE value into fw_caps
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-iris-sc7280-v3-4-f3bceb77a250@oss.qualcomm.com>
References: <20251013-iris-sc7280-v3-0-f3bceb77a250@oss.qualcomm.com>
In-Reply-To: <20251013-iris-sc7280-v3-0-f3bceb77a250@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3598;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/XlkIw+30ImRJ1vZ+oZYrGWc5+GeaSVpL8dMGuZakzQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo7F85xROBnEcvVuuG8608RC5WqpC8IFzBcFptO
 Ft0Is5mx0aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaOxfOQAKCRCLPIo+Aiko
 1fULB/4420l6VWC4Zg6CIgJOKWiRt+6rwPgw181gT2rS9I00mI+4SMS1vgESudXdlIOsjdTmFBd
 SiX0U8Pi3BLpPEImPVRx226jc5bk6B31gy6NrUCrk9iqLFRLfrfdkZdiIjai7AU5cERAn/d9zye
 xkM8OUnYd6xW5RBX/pXVDai3Q3y3ZIwk0tstijzI4mXBfI/vt+TQ5N0FTFpoBKwRM9Bauv2zwPX
 eI90tbyT8rPuco7UnUtjL9TMPQlwfurKziel4iDWKBy56Wr12EcidfQWhfS82uXd6GUa4YydzKQ
 PxZTeZqs+mIhB2D63bP7jG3NQX+qsfHWP1iblU4aQSfeg1rU
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: EhRQNyTQxu2MjbP7IyVeH0V6GioV7Wc2
X-Proofpoint-ORIG-GUID: EhRQNyTQxu2MjbP7IyVeH0V6GioV7Wc2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMCBTYWx0ZWRfXy9NPKqamMvDR
 w2tAEYN262P+skWfVuq0rVpXE6rdDiDCXQelZE1hVx58/5O+rM9Q9ozXTifUJAGgiM1Fgqytlzk
 3RD6CtH1jPYQCIU2nJBx/aEu3b0t2gXgPydrLr1Oq3Tq0cvIEp9NsTXJueMwm6O0eqKGySM2TB2
 3Tj1K1JwCwophAxBIhLn+BM3XsPsA9uv6uYb0xOvcmDQebjwN9ThhcKOKcIERfX5yA2fukBaU+w
 FejCIT64l5yhhrcy/pqXbGp4SoTyNMTiRcW9TBmYks2ItGQ+bABsm2R1Jztm1VEc9KLeuCf53tw
 SiJ6jYO35L+zfq00hT91yhE7k+xhNMazBIIztAWLoEIteOF4fL3Lz5XDIVv2VJSX83gVMPozkU8
 tgsKQNUT/skXdQ3OCwkEPkPFEXHnJQ==
X-Authority-Analysis: v=2.4 cv=V71wEOni c=1 sm=1 tr=0 ts=68ec5f43 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=Fn2TP4Vc3OsuT4lKjqUA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110020

The value of the PIPE property depends on the number of pipes available
on the platform and is frequently the only difference between several
fw_caps. In order to reduce duplciation, use num_vpp_pipe from the
iris_platform_data rather than hardcoding the value into the fw_cap.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c            | 6 +++++-
 drivers/media/platform/qcom/iris/iris_platform_gen2.c    | 4 ++--
 drivers/media/platform/qcom/iris/iris_platform_qcs8300.h | 4 ++--
 drivers/media/platform/qcom/iris/iris_platform_sm8250.c  | 4 ++--
 4 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 0e9adb3982a49cfd7cbe5110cfd5f573f0f7bb38..8db3fa222bdb92a7ffff3dfe62d33f16c0550757 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -318,7 +318,11 @@ void iris_session_init_caps(struct iris_core *core)
 			continue;
 
 		core->inst_fw_caps_dec[cap_id].idx = i;
-		core->inst_fw_caps_dec[cap_id].value = caps[i].value;
+		if (cap_id == PIPE)
+			core->inst_fw_caps_dec[cap_id].value =
+				core->iris_platform_data->num_vpp_pipe;
+		else
+			core->inst_fw_caps_dec[cap_id].value = caps[i].value;
 	}
 
 	caps = core->iris_platform_data->inst_fw_caps_enc;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index b444e816355624bca8248cce9da7adcd7caf6c5b..7ad03a800356ae9fb73bdbd6d09928d0b500cb3c 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -161,9 +161,9 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
 	{
 		.cap_id = PIPE,
 		.min = PIPE_1,
-		.max = PIPE_4,
+		/* .max is set via platform data */
 		.step_or_mask = 1,
-		.value = PIPE_4,
+		/* .value is set via platform data */
 		.hfi_id = HFI_PROP_PIPE,
 		.set = iris_set_pipe,
 	},
diff --git a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
index 87517361a1cf4b6fe53b8a1483188670df52c7e7..612526a938eed0554fc0da99e12c26d22e04bb6e 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
@@ -147,9 +147,9 @@ static const struct platform_inst_fw_cap inst_fw_cap_qcs8300_dec[] = {
 	{
 		.cap_id = PIPE,
 		.min = PIPE_1,
-		.max = PIPE_2,
+		/* .max is set via platform data */
 		.step_or_mask = 1,
-		.value = PIPE_2,
+		/* .value is set via platform data */
 		.hfi_id = HFI_PROP_PIPE,
 		.set = iris_set_pipe,
 	},
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
index 66a5bdd24d8a0e98b0554a019438bf4caa1dc43c..2b3b8bd00a6096acaae928318d9231847ec89855 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
@@ -21,9 +21,9 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
 	{
 		.cap_id = PIPE,
 		.min = PIPE_1,
-		.max = PIPE_4,
+		/* .max is set via platform data */
 		.step_or_mask = 1,
-		.value = PIPE_4,
+		/* .value is set via platform data */
 		.hfi_id = HFI_PROPERTY_PARAM_WORK_ROUTE,
 		.set = iris_set_pipe,
 	},

-- 
2.47.3


