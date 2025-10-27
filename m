Return-Path: <linux-media+bounces-45652-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 009ADC0D874
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 13:30:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72D89189EACD
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 12:28:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 528EF30F546;
	Mon, 27 Oct 2025 12:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aCVI8MW3"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F6A301716
	for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 12:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761568032; cv=none; b=Fbv9aL9RIg8us2t+4HoLFvJgU2YGcjyo3sXt4T+SVvhiV7ZyMy9aKEEN+eKJHbrJZ8OnAFHCndyDcSuJ5xpBxvfcRNrbyRP/W0E0oIyDVfcpMluU1tbbxGKdwsEVvHT5mXc+J96TUhy+qYbmYDJkjqjxclc7P4DB6fgDOcEBHn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761568032; c=relaxed/simple;
	bh=QlGdzJciH1h4gz5Q1SzqSd8IKkSpeYMEZtL7i2pFW/A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fi2kPbuh61SChSGx4n3pY+udR7zMnXq83+URcuD+yEmSez4JdctQ7IiFFBw5sH5s9xePGZyvj+pb+vJcXjUQFGMIXBRf+2MAgJc1Mulz09zdYqk2WBG/6WOfTH9bUojfQHxsqOLeZcRAZrOHG+ros55QNNyul389BJNRKpnaZyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aCVI8MW3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59R8iREe1150866
	for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 12:27:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p9c7rVUQ+8XQDwfJNgLXJyZIItXH+75/qbByZsGVfLU=; b=aCVI8MW3tUcM1t8x
	zIfn8mIioH9XK6Eg1Hj6/JSIIzmViCUKdjr57uPk+VeJXaeqyASOOoeMQyrIrpNQ
	PqTDWtHFObSA4SAmNcW9wBGxCz0jxw8OCpsFi9ETRsC5udJHt+vv9ZXhRIeO+f9q
	UUQa+kkqgjgb6aRjMr1nlj1wZ2b+ksS56RPkXi0cbJa2ixVCVSjNPiE+z7o/Rhfq
	n6PW7QELsJAUAPBQohipxnXPbuswce+FvF87y7jWE5cE1BH7XLDztPq+eCrr2O/B
	Bvs6OxuiUAElnRkwTWkcSfklT/HYTH1jIlA/+tPqp+64Yo9YobME2Jg5oU0c39yH
	fzcE0Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a0nnb4kn0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 12:27:09 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4eba90c163cso43826941cf.0
        for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 05:27:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761568029; x=1762172829;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p9c7rVUQ+8XQDwfJNgLXJyZIItXH+75/qbByZsGVfLU=;
        b=Y6mSKmY7KWpesIaEOgQXVo5ZCy0KdWlfq3vsVVewTKN0XSClYYdiC/e3E1WBB8W7do
         ZVVmzseI6bpr2ji0yTVccEr2Lhiqfsx5iczjuupKjrQ0aaUbgcJIRXxazYrnmq+R4+fb
         44g5RelArFZtRXQcgcCxUlvBYAs3m/xeMB5rvkUZxMh+WSnckfJsEACO2n+iJvxpWvxX
         tK7TzR5hWJe3gFgbZdOeQ4Cx9feV3mKTcBuQlpqDD69JPF/QAphQTo6dJhT+cTCgQPam
         Gjmz5LCJOVY7Olc+mDZcT14kDQ87tI+LoQ+dL3L9sTqCbKxBmanguRqL2LEj0H8+rhQM
         uT0w==
X-Gm-Message-State: AOJu0YwOBZuuVjcqwfSgTUtOG6W79kAvey73FBTp3cswv9lKn82C23Pe
	7ckwVYruGUSlkypVCCYnXHJ1EY7zcmL2+CBRZcB2AagXyV/lHyamSH1QeZZX/KrSdXqbPX7uuah
	/TU+5gSW324vl+dp3yn97PjpOFk5M/haeGnzRuTzPqb2nUM6DkribuXo5MkY/4x8USw==
X-Gm-Gg: ASbGnctJ8unMuuVay0Z8fl5u5Nk3fyLwEjRhTlLUYc00VF1z75NVZ6VAHR63IRFoHFy
	YeOu1dTA5KFKMP1r/pWEY07NGptSx4FVALsdx0wcoJLCCM7+MEZb/xXRapZg9bV/6k9TAyBhQcX
	ust+AqYIf6Kar0BsK2FFPEcYNqEJmADm4G+e3846TYfFJKYWfAqsyoTKY9jKP3njKlFSDUEB4zc
	HUUFHSLq6XHx/wLPYE20kBBRM1xaMVae6KhBllfsCrT9/SZ7PSDsJVsqhnuKMbnGshkxrxGUR1e
	OUP1MxKGXWZAEzb6wkjg+FsulbJpiC8Pq//hTB1a1RDwZhAD0gedkzDxA5pE+5kjK9lBb3J5KC+
	WlvZnuWFMjS0X8iikGX7QprrHJgfJnWkFAqWG9xqMw9m1kKQnCwluZ7cFAc0W9XtDWje6KJkOfW
	CFTQAbBU+GSQbP
X-Received: by 2002:ac8:58d5:0:b0:4eb:9fc2:791 with SMTP id d75a77b69052e-4eb9fc2147emr126089371cf.38.1761568027493;
        Mon, 27 Oct 2025 05:27:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcPSdiUDSlVMvky7hNGhRT/VQb6FqqH3OtzmbdmaiO2yoXvTHD9bnbqHMxNArUgUxGr0oY7A==
X-Received: by 2002:ac8:58d5:0:b0:4eb:9fc2:791 with SMTP id d75a77b69052e-4eb9fc2147emr126088211cf.38.1761568025520;
        Mon, 27 Oct 2025 05:27:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f83cb5sm2253474e87.102.2025.10.27.05.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 05:27:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 14:27:00 +0200
Subject: [PATCH v5 2/6] media: iris: turn platform data into constants
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-iris-sc7280-v5-2-5eeab5670e4b@oss.qualcomm.com>
References: <20251027-iris-sc7280-v5-0-5eeab5670e4b@oss.qualcomm.com>
In-Reply-To: <20251027-iris-sc7280-v5-0-5eeab5670e4b@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4328;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=QlGdzJciH1h4gz5Q1SzqSd8IKkSpeYMEZtL7i2pFW/A=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ8b/VNFPG1JmsVkammmVpvIKW7hE1Pad9m+6bruj4v2zc
 vObTJadjMYsDIxcDLJiiiw+BS1TYzYlh33YMbUeZhArE8gUBi5OAZjI66ns/2wNbH3Cb4nL5fx9
 pSYx7+aRy00nThubXuEICpyw0fFsafO9hiTWwOLQa9pqRVUqXtP0K9NnTlmY2VOyeU6Pj5zcTGb
 TtQ+1lugYXY0QfWWcP40zcPuKL1Yvd3bMi6rd8yVASkMpi2NnyBeeAMc7t3ScWywNH8yTNXNdeU
 WnJvNViLnkr6cZG4qjv8VP6/8eeL6n+0D04dAvUpflJz5c63XKX+zPz88pmx02O8n07OV+qnc0w
 HtTk/Bp+YlOR+y+yH39rd65te23vm+NUtUUiV7PPnVzmz2PpNJU69cz5XT+kc+64VA0OXTJgrre
 ponfp8ZujpLNe9X+cEmvdI9+cf5sBVPWQ9qtSqe2218EAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 64oWkf7eNxApd_YVW0ctL2au1s4b9LvA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDExNiBTYWx0ZWRfX/JiF0z5WgXxE
 48Xdid5LOeD6qbBWzcnReQg01FtDhyJlL06icAwDiUmvsmc9KS+TN2tFRSEXFQam4336z0gQ40u
 d/WSCGEaEPsdJF57nAjCGpUBLna+VVzIQIWO8rxm7zM1h8m/tv4oIKkFEvSfOZHRIgcsUUMl0Tl
 DOsPxK4VQUrKjlKrUVX9d3yAhm4a7GsGrEcpO5Nh7WcSaTPcttPmG7tIvyHEp5DgOGBstN6S48L
 MKNndI73vKoMaQcxr4NPLSujuM3IliKQeY6siem4Yd22akgEOD71TkDMUOGbEwHxG/C9XXKFVSs
 KogSg/5mhUEBbnMcH4Iw2p+B3EVgEpWutQ0ylYcibXPXp0aXgXC5l40aE9aRFil3MHj1IpTXI3U
 VdjCy+gtdgWFZrjgXGV+HdA5hOyeHQ==
X-Authority-Analysis: v=2.4 cv=AJoZt3K7 c=1 sm=1 tr=0 ts=68ff651e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=vHBkZ3WG4vhFy3QD8MgA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 64oWkf7eNxApd_YVW0ctL2au1s4b9LvA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270116

Make all struct iris_platform_data instances constant, they are not
modified at runtime.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_platform_common.h | 10 +++++-----
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   |  8 ++++----
 drivers/media/platform/qcom/iris/iris_platform_sm8250.c |  2 +-
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 17ed86bf78bb3b0bc3f0862253fba6505ac3d164..5ffc1874e8c6362b1c650e912c230e9c4e3bd160 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -41,11 +41,11 @@ enum pipe_type {
 	PIPE_4 = 4,
 };
 
-extern struct iris_platform_data qcs8300_data;
-extern struct iris_platform_data sm8250_data;
-extern struct iris_platform_data sm8550_data;
-extern struct iris_platform_data sm8650_data;
-extern struct iris_platform_data sm8750_data;
+extern const struct iris_platform_data qcs8300_data;
+extern const struct iris_platform_data sm8250_data;
+extern const struct iris_platform_data sm8550_data;
+extern const struct iris_platform_data sm8650_data;
+extern const struct iris_platform_data sm8750_data;
 
 enum platform_clk_type {
 	IRIS_AXI_CLK, /* AXI0 in case of platforms with multiple AXI clocks */
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index cbf38e13f89e5c4c46e759fbb86777854d751552..b444e816355624bca8248cce9da7adcd7caf6c5b 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -737,7 +737,7 @@ static const u32 sm8550_enc_op_int_buf_tbl[] = {
 	BUF_SCRATCH_2,
 };
 
-struct iris_platform_data sm8550_data = {
+const struct iris_platform_data sm8550_data = {
 	.get_instance = iris_hfi_gen2_get_instance,
 	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
 	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
@@ -827,7 +827,7 @@ struct iris_platform_data sm8550_data = {
  * - controller_rst_tbl to sm8650_controller_reset_table
  * - fwname to "qcom/vpu/vpu33_p4.mbn"
  */
-struct iris_platform_data sm8650_data = {
+const struct iris_platform_data sm8650_data = {
 	.get_instance = iris_hfi_gen2_get_instance,
 	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
 	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
@@ -912,7 +912,7 @@ struct iris_platform_data sm8650_data = {
 	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
 };
 
-struct iris_platform_data sm8750_data = {
+const struct iris_platform_data sm8750_data = {
 	.get_instance = iris_hfi_gen2_get_instance,
 	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
 	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
@@ -998,7 +998,7 @@ struct iris_platform_data sm8750_data = {
  * - inst_caps to platform_inst_cap_qcs8300
  * - inst_fw_caps to inst_fw_cap_qcs8300
  */
-struct iris_platform_data qcs8300_data = {
+const struct iris_platform_data qcs8300_data = {
 	.get_instance = iris_hfi_gen2_get_instance,
 	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
 	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
index e29cba993fde922b579eb7e5a59ae34bb46f9f0f..66a5bdd24d8a0e98b0554a019438bf4caa1dc43c 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
@@ -314,7 +314,7 @@ static const u32 sm8250_enc_ip_int_buf_tbl[] = {
 	BUF_SCRATCH_2,
 };
 
-struct iris_platform_data sm8250_data = {
+const struct iris_platform_data sm8250_data = {
 	.get_instance = iris_hfi_gen1_get_instance,
 	.init_hfi_command_ops = &iris_hfi_gen1_command_ops_init,
 	.init_hfi_response_ops = iris_hfi_gen1_response_ops_init,

-- 
2.47.3


