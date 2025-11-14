Return-Path: <linux-media+bounces-47037-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 786E1C5B13D
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 04:13:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8A9E84EA06C
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 03:11:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3272726056D;
	Fri, 14 Nov 2025 03:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hbIPfG+m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T9H6hJUK"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD7D257AFB
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 03:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763089873; cv=none; b=JG5ESHYhZY6L0ACV+/pUlWxG0hCOvntCfKGsdli6XMx1UFy8UBbUgcpdiFdpXxomvausrLvJ+TKMotyE6R0KldA4U2R44wLkHExnLtQYLXWeHI9kvK5UIQRzYHZwiVm7kyQPGr5fha39+wfNeGIw7dhKOm2rUTg/4obj167NQus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763089873; c=relaxed/simple;
	bh=N+lXfS+h75q3UY+fVI5mCZ5Y22WmQkMvX7JwoqZwoAQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=evOFi6UO0W+1Vt7hf3Zc+D/2/e5glff/6Je6IG7/4JYmoDWSf4o5mwmvFbuWCnM5JeJkNT06QgJklksX1Is6NqlKmM+nRB+bIyMjUJ0wgacTCFDqXydk75Ae0lYfepxFwIvfnvAd3d11sLCaBO7zSQO3G+X05evXc8/PI/9lpo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hbIPfG+m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T9H6hJUK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMaarP1484477
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 03:11:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EpCPhfZHViyrEGxLAAC7R6Rt+0rXawz53+v5Rmp3lUI=; b=hbIPfG+mAsy3ZpmW
	u6cJPIeKrkbO6joJy1tJ1ZN1AmTeytIlBUrbzjmWf/Tl8oBMSS08HMl6mqxp38a0
	zAFCGKquBEPt5ME2/6TuDMyrJchSq8iOmdvSLz5BaTUgyVBAtEnUCx95GnL9Oesh
	JD05kdHaYM6UqIejb83bEvKW92zODfa5QnpEeAAnC8mnpLyfxnIqk/+Fk+AsxE27
	hJY5QOOt/B4/jx9JU6GAcOyEp8AG1ei47PXJTdkGIqlF6YGk0RwkjA5rcEh6TIMN
	Wri1xLXipuP7EbTqUVKfZBZtt2RQ6qpnLDwt2cnC0CYz6nYDWd+ktg9B7ulOupTs
	eGw0kA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9cgn3y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 03:11:11 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b9b9e8b0812so3404778a12.0
        for <linux-media@vger.kernel.org>; Thu, 13 Nov 2025 19:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763089870; x=1763694670; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EpCPhfZHViyrEGxLAAC7R6Rt+0rXawz53+v5Rmp3lUI=;
        b=T9H6hJUKx8jdpamDLI6QL4m7W/8p1ZqfcvdWVfoy4zWqbBqUsLO5jbumg9W942D56b
         bVBoalvFA920jrJCbQznIpxgicUbbDoS68IDI6LXaZT7uQTyVgp7eEkWb7Qjqf8nWPm7
         rM9ux+0RNLx3NalJZSPPnJ00AM2lTs/bWpS4EQ3diMCsF3q07onnCHLv1YFd0rYIgX/w
         lUFCPU+bhsElMPVy9m5tdH9IPzxuQ9PhHTDZAZnJiGCmaLdWy//pVpWPsr5cO5oc/2US
         3a6HRh2VSdJppAth0Svq3/TbGCDrxG2y8aFCBCvl0VB1CTL/drJ+vSLNdo99JEyBUxBs
         UfMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763089870; x=1763694670;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EpCPhfZHViyrEGxLAAC7R6Rt+0rXawz53+v5Rmp3lUI=;
        b=rnjiS868OD26Uvqq4cNAJnFNGtfVC7Ee/5Hg/pkhEq2qdDb/+G3CuLRHjyupgsPdKb
         ai3gScbeJfe8Ct6XXA5R5DpxCxIkIFVYTN/aumbrR0N/qN+RoSCJ4L7kOjaxlQy8euug
         1/bQwdokbeiA8ETu1R1oDBK9HttN2kDfpZ5VniIKl77kMUpQxRyRzaH/RFJShdz529rS
         /TYR7SH1cI8SoHbibQ8z2wWBAzkTkePPJGiLg/ymGn4yoXYmuIMtZOfc6N5yKKfn7KPO
         +kcLEKMQrYQnf4F/r9OliBXMsw9JXlAbK33ZcwlzR+UpDY82sHww1Y3eYQP/MgqwQbyQ
         7alw==
X-Gm-Message-State: AOJu0YxY4W4Tw2cDQYA5ccq4a+pndUj3u5oJe6/8haEPcn9V2sgO/Y+V
	kTHy7BZ1pChfnZxEcK4QqHjOtXntKuy/l6G7cSemC1aQpVcViq7EQHKtpk3brnoPdQVtuHXpptl
	PgYNe5Q6snz0a8P9jekw+wt3wMrkhCos8ryT8XUYA9qX8t//ZL5d+oTEAezI4dauzhg==
X-Gm-Gg: ASbGnct+xuZr6FfdywPwlyY+2MJGtbq272URIcmJ6KqvBV30sEFSyW38xwX9n1H3r11
	0P5iTyMbIR27C4CT8BkhbD4lFY4CiFUYPCX9Oyth5yre1RbPRdolLxfGNqt26JeYrZ+AsRXwk1S
	hefBkXjcG3nZ+AumFUjgICCfCx/Z2rKZE58o63oXCfridyP1iseNF6/ArPRY1U5Ra4LO0s5Dvra
	tTQseIVbPDm+XLaxZoTX8HJlAGNj2QZqj9zeolc/CL9zXw0ISjEgyPAMNaEhczOLv5SiryiM2Q9
	oPVEuKdSdEXglIG+3Gez98m51QOcLhfN4Dvrud4LVx4lVVeHs+gs6NqP29tEXVR4Nvg9gIYcD0M
	gGgYSQRltYjhvIwiw630h/aF2B+2MbEk/Y4BV0o7w3z+D630GekX1tApA+qoaNO0xyFhU1t2rcp
	reqlZQzD9Z
X-Received: by 2002:a05:6a20:6a21:b0:342:a261:e2bc with SMTP id adf61e73a8af0-35b9f7802fdmr2393615637.10.1763089870323;
        Thu, 13 Nov 2025 19:11:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEByt/YnJC8UImZHFW2IHOtUBhlJhhnk9FlWz7pgABAyEcJcAFKXFvnd6hkwgZSwPjj4UBvHw==
X-Received: by 2002:a05:6a20:6a21:b0:342:a261:e2bc with SMTP id adf61e73a8af0-35b9f7802fdmr2393577637.10.1763089869767;
        Thu, 13 Nov 2025 19:11:09 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b92714e298sm3598555b3a.34.2025.11.13.19.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 19:11:09 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 11:08:59 +0800
Subject: [PATCH v6 2/6] media: qcom: iris: Improve crop_offset handling for
 encoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-iris_encoder_enhancements-v6-2-d6d35a92635d@oss.qualcomm.com>
References: <20251114-iris_encoder_enhancements-v6-0-d6d35a92635d@oss.qualcomm.com>
In-Reply-To: <20251114-iris_encoder_enhancements-v6-0-d6d35a92635d@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>, quic_qiweil@quicinc.com,
        quic_renjiang@quicinc.com
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763089858; l=2964;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=N+lXfS+h75q3UY+fVI5mCZ5Y22WmQkMvX7JwoqZwoAQ=;
 b=C+soZyehMFoq7OZ6xSqp4YsD1PBaO8egsolYdKpTMbXI3OSrrky7+1R9TAtwyXACd2pwUciYU
 7Tfh8+5JhruDJRxYFxIDVgHL8YvG1ihloATL8whan22wR8KpCVSEeAk
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-GUID: mTwgWIa5kF2rTfOD5kGfpwxmRZK3r9Ki
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDAyMiBTYWx0ZWRfX0IIQb2VDHzPQ
 bKsALYwIBohti1ztb04lXkCjoU1QsNPR+fH2X6eFAhrEVzg/MikDTWjibKteEStVmhai7QmrCHX
 qK16nnFMAMV7DUbQUUu2IbPcqNPn34FNOWT6gK1NiU7sPHdsqm+wCwJ2Lj2DAH9jmxyvr4GJ+Ar
 maW2xmbIUFrTLzxZ0mEs+3+NHYMBavGZxI9BV3hXcj3SxEq3oeU+s9Bizhc4Esqb5K4wSLOQEK8
 HiV0JnAs/sFjuMlIc9SKSbFW/yh2lxMlmpARpdDZKhzr0s2Q/Cr/elHk5L2wMJ7YTL2OXRr8QZO
 9SyxQ4GjJytRA341M0n9fn3zK2Bg14mihSrhJZpatse235TQatWotZPjzKF9cdfr7MTiVhKZEet
 2axNetrqLrCtaXMgXA71uk0UDF2Pyw==
X-Authority-Analysis: v=2.4 cv=MNdtWcZl c=1 sm=1 tr=0 ts=69169dcf cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=FFraBxrx14SkMf4OJSEA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: mTwgWIa5kF2rTfOD5kGfpwxmRZK3r9Ki
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140022

The setting of HFI_PROP_CROP_OFFSETS for the OUTPUT port is correct,
but on the CAPTURE port it is used to inform the firmware about the
region of interest, so crop_offset needs to be handled accordingly.

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 .../media/platform/qcom/iris/iris_hfi_gen2_command.c | 20 +++++++++++++++-----
 drivers/media/platform/qcom/iris/iris_venc.c         |  4 ++--
 2 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index b5ae3d4745c6a7b354ab8907aacd532b81b48aab..8250e0d6f0a8916f3389be60dba762f3b4f3c690 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -215,7 +215,7 @@ static int iris_hfi_gen2_set_crop_offsets(struct iris_inst *inst, u32 plane)
 	u32 port = iris_hfi_gen2_get_port(inst, plane);
 	u32 bottom_offset, right_offset;
 	u32 left_offset, top_offset;
-	u32 payload[2];
+	u32 payload[2], codec_align;
 
 	if (inst->domain == DECODER) {
 		if (V4L2_TYPE_IS_OUTPUT(plane)) {
@@ -230,10 +230,20 @@ static int iris_hfi_gen2_set_crop_offsets(struct iris_inst *inst, u32 plane)
 			top_offset = inst->compose.top;
 		}
 	} else {
-		bottom_offset = (inst->fmt_src->fmt.pix_mp.height - inst->crop.height);
-		right_offset = (inst->fmt_src->fmt.pix_mp.width - inst->crop.width);
-		left_offset = inst->crop.left;
-		top_offset = inst->crop.top;
+		codec_align = inst->codec == V4L2_PIX_FMT_HEVC ? 32 : 16;
+		if (V4L2_TYPE_IS_OUTPUT(plane)) {
+			bottom_offset = (inst->enc_raw_height - inst->crop.height);
+			right_offset = (inst->enc_raw_width - inst->crop.width);
+			left_offset = inst->crop.left;
+			top_offset = inst->crop.top;
+		} else {
+			bottom_offset = (ALIGN(inst->fmt_dst->fmt.pix_mp.height, codec_align) -
+					inst->fmt_dst->fmt.pix_mp.height);
+			right_offset = (ALIGN(inst->fmt_dst->fmt.pix_mp.width, codec_align) -
+					inst->fmt_dst->fmt.pix_mp.width);
+			left_offset = 0;
+			top_offset = 0;
+		}
 	}
 
 	payload[0] = FIELD_PREP(GENMASK(31, 16), left_offset) | top_offset;
diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index 07ffcd4d20969c8c33084dc8b03156913e8c89fc..71f4263ada898ce8333086db59e386e91b34ed60 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -62,8 +62,8 @@ int iris_venc_inst_init(struct iris_inst *inst)
 
 	inst->crop.left = 0;
 	inst->crop.top = 0;
-	inst->crop.width = f->fmt.pix_mp.width;
-	inst->crop.height = f->fmt.pix_mp.height;
+	inst->crop.width = DEFAULT_WIDTH;
+	inst->crop.height = DEFAULT_HEIGHT;
 
 	inst->operating_rate = DEFAULT_FPS;
 	inst->frame_rate = DEFAULT_FPS;

-- 
2.43.0


