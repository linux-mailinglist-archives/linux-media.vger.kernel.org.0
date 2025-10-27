Return-Path: <linux-media+bounces-45650-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D153DC0D858
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 13:30:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F87C189581B
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 12:27:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CA0D3016F5;
	Mon, 27 Oct 2025 12:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NSDLxgRI"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9FC302175
	for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 12:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761568029; cv=none; b=Z8Zmz9+I3Snj5XuLznFza8CVC1m9+9FfcvEjEbJy/xbh8xSJ22WsCD5XEhn3v4+lYGq94DBkNfQ2jWj+nAS+kDAd9C/l2+7zibO+xwRrHhj5Sjo5i16pZ9oQTnf8I53Oaj1r4swrAgjSdpbheqcFdbMVjVf4JoUQXiGd3p41daw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761568029; c=relaxed/simple;
	bh=ldL9oE1EfZtAElQ9+XdqptYGe8dQAepD7NU7eZWefTg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KwpQqyFStBB0Y2iCESYiG6upImjVnXOtWXSZluZgxQH3ooqzhSLvKGNe+xwMvGaBa7d7XuEU6sU2+iyRTNRnBG6JmDCQ7s0Z0Yx1e5+xXxkAJRQ9acAlqZmSK0/3QgHvomQjTcOHt1iZ6J+pKrXJgWP1z7kvFl+D/Ynpjf6nIrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NSDLxgRI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59R8YcVq851044
	for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 12:27:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9sFi95zbIL6V8R4aDxrgHCEKkWfw05sk4v9zJGzSxic=; b=NSDLxgRIO7oVdKY3
	bw3pXd1J1pkwGSAIV03Xm8hO2cjBMYtQaiAQ6JQT5qQu2z6heznf6pBfp7e4Z7GQ
	YI3MYcyTGi6NGefIADHTqxtKMbWCqxXUxbOejRedtCKY+DjXbxKg1Mmt+wyYdiQQ
	KsNLOBETrowWd3TMImnyjqOrB0ynJAeMOpxoko+ndtqB5E4gXakmpnSORrwi1PHD
	PXtEglHDo/QiqZY4dTZLjsaO78iteJmSfgpKM6UZWL1Oq7AawtMFZGdlnp2PqPb5
	MhP3H45r/+6e284o3Ed89W/4M98IG8aaEWS7y54GXPNehrZEP7H1mg6t/V61ErKz
	xfIEnQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a0px6mexh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 12:27:06 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4eceefa36d0so48448311cf.1
        for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 05:27:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761568026; x=1762172826;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9sFi95zbIL6V8R4aDxrgHCEKkWfw05sk4v9zJGzSxic=;
        b=RoXB8iHctn3lkWYWZ4l74CbTV1rSx2JMdtTmmUft0lnRtsZxmbqB7LtOBEH8Gy7OXd
         D65FIKTDUJz3Li7v5Nej5tZiszISh0L3r2XShRxsBsMMyggtu4hUgZIoJiOQECHiJfH5
         sLw7glILT42aXdI4EKNOs3OZ0sXC99Z5thMR6198yAtCPu3A0TJPs2xaTlPYLOQAtZX1
         omCAcvi7LkRpQmqudEL4XkaRMOOyoSuVFgL/cxjqhmM3AlFpOTri716pxs+SncdgsQrd
         O+llUD/HkX79v63Z6dpWF73p0dqmXRse/vgsU2NplQVZj9Re2XHriEsfAJg/7Lpa4a+i
         X1sg==
X-Gm-Message-State: AOJu0Yz8d/P4J+/qBgKkioptUz0mV0iVhV1Oj+eWbsUQiyRDo23pE6O6
	IkP5Way60bLACTKZHnGsnR/HuOh2c/zCAWeZWrWwK9wlW8PdzX8kaPH+ojIY6N0TAJqeEvLvFAi
	fYip/R6t3n6VF94U2+1wG9tbWERpvCkIFUab0HzmqCd0jnYekugnJ5e3chYe5xNh04w==
X-Gm-Gg: ASbGncsEyd2Tao+GPk1x/ox+sqr4BgjxxEO5VU72awAyQNe/E8wDGbgDcX+2wCF9bV5
	3YqxI2hRpkZ7IKGwTy8Q5RgX5RxZapulPO0IOdqII9ANx6Gavpr2fQNszTxm1hI45D6dYTbL2Pd
	B56LdXh4UnpbXKgbDDlTOGRz3puYdNyDD3JYImnz/7PU4FiXKF0UORkx+BOWnYXXpBQQC7qKx5M
	qMzfZTpfxP+K+6SJGJSVjoL5O9xm/Tbw+CmdRgCnDbg/N8iTQNFHtKl3ugNcdyELqudQIoxBJwU
	cXHKizLmh+2ETE+GWHl53+laA964HgS2hf2m089+/HpZOsIz4zke8qS+urStg7Lt9XeRlixUV8i
	4wQNDz50Z323G4Zw3gSLukrqaxlBCts+fa1wedNe0Y8ktgPDMWgeF7r2tx2iqu1WwZu7qF4iXw4
	OR8TypH1TFnTK4
X-Received: by 2002:a05:622a:8c03:b0:4e8:9e8a:294e with SMTP id d75a77b69052e-4e89e8a2d7cmr420613231cf.6.1761568026141;
        Mon, 27 Oct 2025 05:27:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHA1VQi2AqzCgMmnFVsnc9Klx/oWqFgMMvGA2NeD7Ke3xKd1zXHX3q6b0zno2C+ky7UPVKaUg==
X-Received: by 2002:a05:622a:8c03:b0:4e8:9e8a:294e with SMTP id d75a77b69052e-4e89e8a2d7cmr420612111cf.6.1761568024171;
        Mon, 27 Oct 2025 05:27:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f83cb5sm2253474e87.102.2025.10.27.05.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 05:27:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 14:26:59 +0200
Subject: [PATCH v5 1/6] media: iris: turn platform caps into constants
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-iris-sc7280-v5-1-5eeab5670e4b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5023;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ldL9oE1EfZtAElQ9+XdqptYGe8dQAepD7NU7eZWefTg=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ8b/VBEWvxWb4suvTi+02PKHK9kjyNuk975OXzBjZd/Zk
 8t63z7pZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEcq6z/5XUOevaZHNYxfHl
 6esd0+9WflnYe7acJy9hocfjpf+sy+Mcpe/sV1n9cF6o0HfjVzd3+DAlPeTwkMr/tkNDMj3/rYv
 qN9ZzW6UV/A3sMi7fWv5+0TSG2qq1WSLmGQmKRTVmN/fG13N3prX7NOVZMZwsnBXfOUe90GHi/L
 WzBA8b7JZZy3566gHRO2v6V184E2bvL5kYrSwo+UT9yj6WwsR1H/hMYhctDCr0bDpbqG5vPOsDx
 0qFijX9mzov6XxKXRYtWDtjB+8dl3N11RxHYl+HPpi7P6LvmEg4U65258efxwRWVb/xZPua/vE3
 2/U6y+i/V90e+q6/GrDe/XRENAdLqnGjTkGPbFeyi+ktAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDExNiBTYWx0ZWRfX08dDE9hV8QgL
 bts7OAzu5bmb0acbqNpzlob1uNfTXreWV7Z6gxu5Q64su5OP3SxPPh8rBy23qyfbc2xMoBMDcuH
 8d1tFi/DvNR00unS5lMeZNFQwIPVYWFzp+Cden5zOS7YhfUax/kT930HmE6pET4fIpYib5JeB5V
 6OTbumeSiiQ+PgMdexiMwo6MYHqAZ1qP6XrMsmlzrGA3NVy/xj06+fyGuNDIKclYTuaKJQZEb2g
 Iw1Kw4QI9GDpJiwbbELLU93o60EkiAOWsCjpevvwp/2FBJMIxTsGmanMa8Jdj8R2mgbHGdi3oZE
 7q1T724ornAwBVzu7wzCq76/vNpa12RlGa+zGxFT1MXUV7LeYB58Rxwrf/j8KAM4+7c5k/vlWbG
 HxVRmB9goM0gmbEJCvbSRxVMjB1zdw==
X-Proofpoint-ORIG-GUID: lmrmD3sd2XPA2-LcuuOTvgSrZZOwRBJB
X-Proofpoint-GUID: lmrmD3sd2XPA2-LcuuOTvgSrZZOwRBJB
X-Authority-Analysis: v=2.4 cv=WqMm8Nfv c=1 sm=1 tr=0 ts=68ff651b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=4lT8O_Qwe5KXetiC_XUA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270116

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


