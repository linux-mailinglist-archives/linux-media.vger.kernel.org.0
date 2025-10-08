Return-Path: <linux-media+bounces-43893-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 924C5BC34EA
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 06:33:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ACBB83C6743
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 04:33:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3A522BEFFD;
	Wed,  8 Oct 2025 04:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IBD9u0+x"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319452BEC21
	for <linux-media@vger.kernel.org>; Wed,  8 Oct 2025 04:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759897998; cv=none; b=VXsWrrg1j38sHoCucfTkw5bDOpW7OVDlIv6gg6+lvNAaEEit8Z7TPu/cNwt02PXCUipE7pLi2qcJCd1PBimw4EOzuowFkOfNUaPt37IEoAO5Ar3DSM42qY3HfWubamD1Cd1QJW1PU2804eDBYboEFcdVvDkdKeIN+mD+xwRG4TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759897998; c=relaxed/simple;
	bh=WVcPThemHWksAIsVmW4eiiuZ9R/8dpiWBdZgPjKT5Nc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GQ3r0175CZ2SEdpbKcmFxEJCC17xwj03AjR6fCy+AL8Myu9FJTrBFteHv0WrktZTe1YoA7XwNBhHoz4TJUNs1VD/XhTy6XfQIX7qTLCrq59H7y+bv0oOhrSrLZfDGfcaFSWYWki68bGnffpZ3YKe1/cxw9FmO2PSQzTB2b6dJ7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IBD9u0+x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59803nVx018990
	for <linux-media@vger.kernel.org>; Wed, 8 Oct 2025 04:33:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b3OkFKObasZHkBNUAbv6zxDXDlDmudDhGXc/cgtgK+Q=; b=IBD9u0+xBNhe4wvp
	ZILif3/oM9hWGm+ZwgyycymadCh6GdVbxfqkK5DYy4XNXg7C+wVTpyBEWQ7VjheX
	ikLeJdVhMOR/cR9j5XMs6XS4DCiTQ50x1dqqM7YRYkhiXTLMVHVcTgMXSXN6LRdF
	giYmHrXH5pC9f0sWP7ZRP09rGW1GQr0CJ8/SrBQgvAHhZ0sFvMFaNnLA9OFgQKVO
	G2eyUkxHHQNHpn4md8lqzRyoCx97/BptBpkIQqK6b9lx7nEhx1hhp2ieCipgN+oh
	4GnFmrDgtQE6ouYJYT60C0PdVw5yq7EZl4nhx/aZkd3eFlyrDkbzzo5NFbNO3+Yd
	enZc3Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jtwgsbxy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 08 Oct 2025 04:33:13 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-78e5b6f1296so137088976d6.2
        for <linux-media@vger.kernel.org>; Tue, 07 Oct 2025 21:33:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759897993; x=1760502793;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b3OkFKObasZHkBNUAbv6zxDXDlDmudDhGXc/cgtgK+Q=;
        b=a210Gc5VaRh06lWEoG3iWLyG08YnArO8PPKtse0lMBvQJmwadYNeVLE+CSUSGnTd6w
         cRLVRwqm70e+zi9Le/na+bcFsj45SDXNizUDXJJOcsUMBtq2nyHamDpzZl8pPYlfwmrB
         flSe7sMlCLwOn0HNgN1gEMSXqk6LZCs14LrmO8CRj4UL1qqTsGvj44VodOO7GbtOAN0j
         MwzPPd0vAoW1Tq1KNNdL3WNh2uOP+Z5uA893cU0+dg73MaSqGub2UGDH33nL2mdrXzE5
         Lr8/CoHxisUj25gco1zUtmOZLXwgDf5fOxjnLt2v8QyOkJw8B5U3qoX6wpvMFOlz9De+
         ws/g==
X-Gm-Message-State: AOJu0YzPn9XUHtmRhmv3ozoTzxuwV0HkGYnHRtaP+zMgbgGWNACzFBFo
	jHTqa/BYOP3pYIoCp7z3zwRe5yB0KiyGaPLswd9MBlTvgUZu97NAjQM/pPlRa/MuplpYL9l1b6f
	A9VZs6wy0d8wBwfms15vwYo3fs6bd/p9h4jW3L+tFjDvO/3fcK7yo49kAstCf4r370g==
X-Gm-Gg: ASbGncsvprt5GdeSHZWYAYHZ/iHZGvFDwFZIWMc78syGpL9aAasujLybFW0K+5kM4yg
	uDD0e2I6EUS9yVqHHkHmJ26E9W2kJqtMHDysWf1HQW5PB2hNp0LqvhLLRIFR04DVkrVSlBRXVKv
	oIz9aayGtw7PCv5FnSK8JjZ5Lh485c9tPez2MaTpahAQc+74e1B+Qbu1zwiJQ3vQVsgQSUTQJ7N
	hvlHWFWOmxg/xId3AGZ18lHzBYwARQYMnN81ZFwNqI01VR5hiE5986kSiarumzQkalAF/RSer/Z
	Je4dyUa7Nub/pzjB5mwDDrfO31QWeBUlrgVM/DadcCBBSP1wlWh1qzsyxmILITQv2mTtd/MQX9f
	PLUCwcJHbGmUSL9E9QspE4YL6MZo8WJ6Nr6kzprFhzhOH0VDsIbIz05efdA==
X-Received: by 2002:a05:6214:202b:b0:786:50ca:73dd with SMTP id 6a1803df08f44-87b2ef6dec8mr25060586d6.46.1759897992956;
        Tue, 07 Oct 2025 21:33:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5fSQzUEHlM9Sba1DnS9w73buYjBeWNYucwN0HTAHf5h2O3699qv7BAQEh0X1/W8ikiBVw7A==
X-Received: by 2002:a05:6214:202b:b0:786:50ca:73dd with SMTP id 6a1803df08f44-87b2ef6dec8mr25060406d6.46.1759897992532;
        Tue, 07 Oct 2025 21:33:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0119f461sm6751107e87.107.2025.10.07.21.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 21:33:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 08 Oct 2025 07:32:59 +0300
Subject: [PATCH 1/8] media: iris: turn platform caps into constants
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251008-iris-sc7280-v1-1-def050ba5e1f@oss.qualcomm.com>
References: <20251008-iris-sc7280-v1-0-def050ba5e1f@oss.qualcomm.com>
In-Reply-To: <20251008-iris-sc7280-v1-0-def050ba5e1f@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4833;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=WVcPThemHWksAIsVmW4eiiuZ9R/8dpiWBdZgPjKT5Nc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo5emCPIOQmXOHe3H3umhVm6Pti8BcuSKftq32V
 7ZuzDrWEK6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaOXpggAKCRCLPIo+Aiko
 1XuaB/oDRU5WDHN8I/Bco1ROv4ItfONcJkCZrGXR5Cl5LQl41bTyqOPKoekOgMKAnqFdZEYIXWp
 s03Of28XCTBbvMd1DxcvRusj540BikKox+2CHaH+V7L3cKFTRecdvCqZ5rH2Ujo7uVJJJi+AAY9
 9EmwCSXy3ivSS9vu5P2dleCoO66XkKaFw1b8jJxKhMm/Fmrx2bx1nA7zYYLsn+g08AqDLWyYc1i
 Ib6Sgi3T+72U3j3O9oNrhB3TVihzTnHWQwLyhot6KHkMI1r3n+b6+JaIyM5xImUYEzFD9xbGEgN
 rDa1mcdswSYVXzVDlRAz+mXNSIUkjJscqfgImPcPjvpHCeTQ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxOSBTYWx0ZWRfXwMWjW4QCVi7G
 u9/ksEnRhuVaSv5Tg1j5fuShwpGQPsGwByIpDKWqVnk7GoTZeFFPqBNKy1qDJ/d/980H5KzkAxx
 duaTSeI5yiCzg2/G6AUq+lbmpRhcbyryuV8Xbm0CBBGTdRsF/BeJbxIsDTyZ1SvXC7QJjd7vtHl
 cWab+luvKz+yCHWj6RjtBZjhEy2NXQXwHBPWi3D0q0Pkj3rgA+zZz4dtjERzLqZYtwDN70r24i0
 Skxx/rj0dypK25cMl9UGO32pwABM4RikCilXL9nZ33ZJpKesplan0L/HchmNNqQvSyErqyVfkEN
 0K96kJze9uVE7R1W0k0EXnuufr4DsCi2E9o24UrhdGKkZA9XbfWfHPfLQOOGz73ztb3Qlwa11fd
 9Gx4a54MDDiPurc2RMza+1Gl+5QIUQ==
X-Authority-Analysis: v=2.4 cv=B6O0EetM c=1 sm=1 tr=0 ts=68e5e989 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=4lT8O_Qwe5KXetiC_XUA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: 5-Q0zBywfFgmOuEse1pUsGfN7hHOVoAO
X-Proofpoint-ORIG-GUID: 5-Q0zBywfFgmOuEse1pUsGfN7hHOVoAO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510040019

Make all struct platform_inst_fw_cap instances constant, they are not
modified at runtime.

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


