Return-Path: <linux-media+bounces-45810-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 07238C14735
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 12:48:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 68B8E4FAD07
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 11:46:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 640B430DD2A;
	Tue, 28 Oct 2025 11:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OMELb2oO"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71D730BB91
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 11:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761651992; cv=none; b=Nb9uBENlsrEnZlHSANSUKwuQtPayKkCGM0D/cCCDyVnV+3jarutu8+mdKRUv6sfJ1o/grLznFW8uXcbvvOn8bu4AiSEPkzHMujYXnh3/5JN+U+8RvgzFF0zQsF3SMzbsFr8bJqWbWq73SglC9DQyMREq8eokU9jQvdKLYkFwFOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761651992; c=relaxed/simple;
	bh=ldL9oE1EfZtAElQ9+XdqptYGe8dQAepD7NU7eZWefTg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gU8tKATltHTITzCKZBC6EZIiajBYvUppi8ZaTXGM+HCL2O/6bN/F1S6HJZRn3Fm5FUBP0S+7GHKa+trEavWbEX6atDnEtTbXs9MkTEA2kGkvGIrF8FBO0uWAuDdzuvTJjXV0+5/XoSgqMo7yGLpbYqUHTjo1AsbjL7C+PDpei3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OMELb2oO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SBcnf01559663
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 11:46:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9sFi95zbIL6V8R4aDxrgHCEKkWfw05sk4v9zJGzSxic=; b=OMELb2oO1DHiul5f
	6q8YmPDpDM6VzW+4YsEM3Lcl0AfJlUwdVF5wvsGPEK+glYp5lxzQxPmWLuYFWDzC
	ZCxepFqm7kGlD7JIsOIFpHtCXrdV926vMP0Jc1gjfkPqzX3Nculx50zFHuFa0wmI
	1nNrqlzxpZ3w2ulZgSkc+tVdUj6ZKeNOaNiu31nS3yCjoUxIsxsL+o7cEGPmPQkU
	uZ2NOsRVPcTg3FnWBGMdJs96kzG+YLxnrxWmOtzmw7hp5/V0vOG00GOX6XvQmEni
	NcTbJ9bSJ+PQHPjvYnmNV3DIplCka8a/Vq4ZIW7P1qugak90E4wxav0a28I43o8N
	C9biTw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2w51r0gv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 11:46:29 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ecf2adbd3bso15679401cf.2
        for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 04:46:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761651989; x=1762256789;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9sFi95zbIL6V8R4aDxrgHCEKkWfw05sk4v9zJGzSxic=;
        b=Fc5hMWktL2EvLtiFgXUTt6FQ5Yhvctq9W2xHVycw7VHTYXOKriUeKyiGACYvcNOClW
         vEEFfxlM3fYzRG/yYI4go3UfHxye3zWH/AaJAwwgfiv8ypi3q01rz5pcJmK6CZjwzMAr
         XSlFyrMI0WDaBCTI21kpYHIbvRzq1Kq03+fxbBb+EZu5GKtMk/6IFRT+SvwIK1BD6Bmj
         OYuvYi1IlAFZiy0UoX5NJoyDZwwRC9Bza0P8ghVlPH1CiH80KLI88iom2KSCIgDhFU2q
         k5JSgKuIgm4JlNbPXF5Gereegx1tucu+kJvzVsnsWUimZ3bFpxQbfu7ycGM2JLey2Qxy
         hZaw==
X-Gm-Message-State: AOJu0YyeezxoIDtvbyGsXvQvM3juC+1QtahjyFEs29wVH3TiwyKzLHQK
	tlyiZFQeMZ+VHIYRFmBID9Yuym5/u1jaAhGLe3Mk+0hhuiHIRfm887JbQTHQSK+UuFBfM+faqe+
	QUxrv1Gn8zIYZCvwWt8nIBjuu6Ak/El3khhDBAJx5xLQ08M+L5mR3AN8BuSuQpvEQIw==
X-Gm-Gg: ASbGnctwASH/K5Ayn+6g8Nztd9oIdyAPRn+PkgADwLu8bQeuNE29RutwA5EmQLaZhUi
	xAhuK5lk8zAAmQdWJ3zO8O7/mDLfodfiGXMTaoGwSHZCRQ6fuF0yUmttzzto4v0lsV4y6nfZ1D3
	Q1Z3VZJ4p97r+pytSN8jM7paihLPPBUjtT+BfRkjHpCzC9ff5uHEtNkJoNph6168zo0AUfLG8vn
	l88Tv2gFXzDh98I/z4zrTyqrKkpV87mjPcLTCk+bPitASY6Hmn9/cN/p66Cl/7EzsHdwZTRWkA2
	U7c+de08K6f7zvyxGWjUjsFu1jyVCqrqLdNVKYLfRH3fu5W0zc8SQZBkDxevzuzFGJwKaEzrcrh
	WUIMeEbXlY74dQDppLHST0g/+A7b+1kH88eMiuUzLmpXxRNCM4DldDzulG5z5mmgb5DYlTDdbuV
	X4msr/4zGDQZWg
X-Received: by 2002:ac8:5889:0:b0:4eb:9c54:d5b6 with SMTP id d75a77b69052e-4ed0748c9camr39204641cf.6.1761651988984;
        Tue, 28 Oct 2025 04:46:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9vT0CM7OEuXCJAqgI3e5Sn889W0tqPBqPRQuHqsEVUGC0/IeZ52/+FOTEZP4YQqfzRnAGOw==
X-Received: by 2002:ac8:5889:0:b0:4eb:9c54:d5b6 with SMTP id d75a77b69052e-4ed0748c9camr39204161cf.6.1761651988295;
        Tue, 28 Oct 2025 04:46:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f41ce8sm3096564e87.6.2025.10.28.04.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 04:46:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 13:46:20 +0200
Subject: [PATCH v6 1/6] media: iris: turn platform caps into constants
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-iris-sc7280-v6-1-48b1ea9169f6@oss.qualcomm.com>
References: <20251028-iris-sc7280-v6-0-48b1ea9169f6@oss.qualcomm.com>
In-Reply-To: <20251028-iris-sc7280-v6-0-48b1ea9169f6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5023;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ldL9oE1EfZtAElQ9+XdqptYGe8dQAepD7NU7eZWefTg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpAK0RTpL7kVHP/R87l0pwYpQe88pQMS0unfm5G
 DKEVPfVfsiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaQCtEQAKCRCLPIo+Aiko
 1ahzB/9c6/BO3TNUaZ7lLjYibeZGgw9ZBo9e+LKOHBOWcj1sARmajUW8RxXD6JclBR3adpPBcWx
 llZYJQ5vpOqrkSMTCh/kLbSpmHUooixgdBqwPYFkObTgmfsPyqfdGX/6qZ9JB28BCN7PP+3ftyK
 9YmP+uMR5KQ7RSf/d14z3qDOm6mhQOdiMUSrYUmMR8Djyaxk6Sj8wQrFMLYiomgDiGunpknUsOH
 /+dZrzXCfhFsbbKWugM6fDX+DlT1P0bY+tuf8r82fv7IgJLdMf0/9vOMRiUC0HPHfWhNUJRWiZb
 PfMMrEsKn39z7MbC/f86ssJ933e7sr2nTu0iCyO8qgzh/13K
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: kMXdT23cO_Q0qFa-9WQ6zsLwW5XDh-rB
X-Authority-Analysis: v=2.4 cv=YMiSCBGx c=1 sm=1 tr=0 ts=6900ad16 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=4lT8O_Qwe5KXetiC_XUA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: kMXdT23cO_Q0qFa-9WQ6zsLwW5XDh-rB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA5OCBTYWx0ZWRfX4oEmHVXBCiFK
 icSg+9Uh9TfoQoLG1vT4W/RqsrxpGPL+HuirdtOvVOcK/W4niQ2BioQLdXB1V9AoSNSA0jOzdjn
 1OmHcp2h8P10qUDAzSr3rZGtOXPZekCDKsM7IOT4iE5hcd+Z51CXsRO74mSzjNsDJzbxgOUqSDV
 hBYW+pSTEh80Uovj90Tg3Sjrl9/MQy2kagyrOMLHPKhRmlfIndBQK+4NHQlQmT0VtjXaSPKXcjm
 a7mVIBSN3o3VmMCZDV0+2nbse/ep8TGrOJG3yOa+adOTPh0P45qqje6yjdAembPpJACaGAwYf3Z
 t9fOhKkQTbwlliRbLCfB9u/c/VrQHkuKRWanSkWMdRcg/2aR/bKLUQl9FeFq0NO14Kzxhi52jRi
 HG+naah7zuHMns9dZhmZcU73IcSXGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280098

Make all struct platform_inst_fw_cap instances constant, they are not
modified at runtime.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c            | 2 +-
 drivers/media/platform/qcom/iris/iris_platform_common.h  | 4 ++--
 drivers/media/platform/qcom/iris/iris_platform_gen2.c    | 4 ++--
 drivers/media/platform/qcom/iris/iris_platform_qcs8300.h | 4 ++--
 drivers/media/platform/qcom/iris/iris_platform_sm8250.c  | 4 ++--
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 754a5ad718bc37630bb861012301df7a2e7342a1..9da050aa1f7ce8152dfa46a706e2c27adfb5d6ce 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -301,7 +301,7 @@ int iris_ctrls_init(struct iris_inst *inst)
 
 void iris_session_init_caps(struct iris_core *core)
 {
-	struct platform_inst_fw_cap *caps;
+	const struct platform_inst_fw_cap *caps;
 	u32 i, num_cap, cap_id;
 
 	caps = core->iris_platform_data->inst_fw_caps_dec;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 58d05e0a112eed25faea027a34c719c89d6c3897..17ed86bf78bb3b0bc3f0862253fba6505ac3d164 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -215,9 +215,9 @@ struct iris_platform_data {
 	const char *fwname;
 	u32 pas_id;
 	struct platform_inst_caps *inst_caps;
-	struct platform_inst_fw_cap *inst_fw_caps_dec;
+	const struct platform_inst_fw_cap *inst_fw_caps_dec;
 	u32 inst_fw_caps_dec_size;
-	struct platform_inst_fw_cap *inst_fw_caps_enc;
+	const struct platform_inst_fw_cap *inst_fw_caps_enc;
 	u32 inst_fw_caps_enc_size;
 	struct tz_cp_config *tz_cp_config_data;
 	u32 core_arch;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 36d69cc73986b74534a2912524c8553970fd862e..cbf38e13f89e5c4c46e759fbb86777854d751552 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -19,7 +19,7 @@
 #define VIDEO_ARCH_LX 1
 #define BITRATE_MAX				245000000
 
-static struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
+static const struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
 	{
 		.cap_id = PROFILE_H264,
 		.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
@@ -203,7 +203,7 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
 	},
 };
 
-static struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
+static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 	{
 		.cap_id = PROFILE_H264,
 		.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
index 35ea0efade73caa687d300779c5b1dc3b17a0128..87517361a1cf4b6fe53b8a1483188670df52c7e7 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
@@ -5,7 +5,7 @@
 
 #define BITRATE_MAX				245000000
 
-static struct platform_inst_fw_cap inst_fw_cap_qcs8300_dec[] = {
+static const struct platform_inst_fw_cap inst_fw_cap_qcs8300_dec[] = {
 	{
 		.cap_id = PROFILE_H264,
 		.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
@@ -189,7 +189,7 @@ static struct platform_inst_fw_cap inst_fw_cap_qcs8300_dec[] = {
 	},
 };
 
-static struct platform_inst_fw_cap inst_fw_cap_qcs8300_enc[] = {
+static const struct platform_inst_fw_cap inst_fw_cap_qcs8300_enc[] = {
 	{
 		.cap_id = PROFILE_H264,
 		.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
index 16486284f8acccf6a95a27f6003e885226e28f4d..e29cba993fde922b579eb7e5a59ae34bb46f9f0f 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
@@ -17,7 +17,7 @@
 #define BITRATE_PEAK_DEFAULT	(BITRATE_DEFAULT * 2)
 #define BITRATE_STEP		100
 
-static struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
+static const struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
 	{
 		.cap_id = PIPE,
 		.min = PIPE_1,
@@ -38,7 +38,7 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
 	},
 };
 
-static struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
+static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
 	{
 		.cap_id = STAGE,
 		.min = STAGE_1,

-- 
2.47.3


