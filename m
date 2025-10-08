Return-Path: <linux-media+bounces-43943-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB43BC4364
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 11:53:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 547E14022BB
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 09:53:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFED62F60CB;
	Wed,  8 Oct 2025 09:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V7L+cCo8"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D3A2F5A23
	for <linux-media@vger.kernel.org>; Wed,  8 Oct 2025 09:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759917174; cv=none; b=Xp1W2N8ZX8EB24wrc9lzLBqgw4PgkaBk0EtwjwdL0wEwnl43gRZNwIHCPbKO9cleUslUlUf4dMt2lRLMusKSTAUUKF3SlODQROieu5lzoFSr3XuPrNTlgIxlI+kbTKdUy//L/IQtqTTtdVIVuwX1vkKgRarhNzcDbjdQJct9bqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759917174; c=relaxed/simple;
	bh=W1z8dmd1zOKmRAB45rBCsy2K3g/McfdDaZiFHL25crI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q0vwfq4HIHe54mur2qu1BTqYxxZybEY0wCX/VjV+wEU2H1gj6vmW4fpWNnAwVHDwD/uTWyVYyBOYYGpahQpXHRjupwx40XLWWcwjBD/Dp0N2SyfNu68X9FQ0jtqNm8m/Z5K4Kj0QnPB21wJBQYossnzlpQ1l6OYvMHaFanVq2Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V7L+cCo8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59891NbO010772
	for <linux-media@vger.kernel.org>; Wed, 8 Oct 2025 09:52:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PS+fbM6Xqqglpg+9rAO7OJS9ghN31fp4ByCJ49cYoLU=; b=V7L+cCo8L1kZPnbZ
	cLnrZ0Ve77phwg42inO3Gsq9du5uRT8LTgla62Mg8tFVY5rWlazrd/Hld9825IUY
	Ju8Y/LWx+57UeDiJ465Dh2HZo6ekqjhao4H0q8jRK8HtDgJM1zqdsHl6lOBgGawY
	6+D3CEXuTWpSz7ZfDPoN54uzDs2JNJQTP14+KJgbi5K01/2lqE/TFg00Cvwh/cnV
	yixlDVqZdd3IvARgZjW2ZG0spt1rffV8dHvxhJCedhMr+kzfIpMPoExsKpyCaxBV
	L+/vDvjn5h/OmYEJjNr2JPjHagF1hDym+AIuc/dkJTr6te981zlROnLYRqgDrgZv
	Ik7brg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49junua18c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 08 Oct 2025 09:52:49 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3307af9b55eso6462375a91.2
        for <linux-media@vger.kernel.org>; Wed, 08 Oct 2025 02:52:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759917168; x=1760521968;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PS+fbM6Xqqglpg+9rAO7OJS9ghN31fp4ByCJ49cYoLU=;
        b=qTFFjDrLdhBrW8WFi/TJ41efjXkZHdUwHLx2/BnvnslK2uLGdDzcH2t8fpLg25uEvv
         cPzZOJBqk3EHCGZxG4IoWrzDcToCm/c9G9EVii+OhZIK+xXnybr8jzhQ2KIJhgln1wcS
         jdyz/h61uuGlxdE7rlLzGpPScWJpsqU+8oaYdNBUK4pD7KF+//8LOWyO09O/lYLGPjvx
         E/aYcNuyuW9wj5Ms7UrwR//YLJn77nKe/ymmgLDpYibr2MgMu6Z0Wtlu2qe13jc4OnVf
         P5pSkoO5w/kke0X/MUs5liXAHF7Vo1bJO3oD8k48GAfme2IFr+b4Ik1y9hzRMNTPHW3U
         1bsg==
X-Gm-Message-State: AOJu0YxxfOZEys0r4Bktl8uFJHL1To8kWZgWpw254AkP1JER/9/adna2
	iN997N9L+GGYMyJDTdcJhh3BQ5Ip2BmX84SJSfCryZVqvou+ulTKkiugF5IOi7h5099t/JyZBHT
	esKRyqwmcUXk3uYqyQJ7D+ufq/Z6HOnKDpzZyyFl5fuBxx9TGVcfWA7p2Zc533bHlBQ==
X-Gm-Gg: ASbGncvlvBTn07hcOYd9k/Y/Ci7peKMEsXj6YC6zDCpWKtuE8A9qqIbkNdeF7ezsuBS
	wGBoUryzue28y+knvTIwpDZV6uM+AboBUD0obYPL9aoVcxwbIWICR9+DC6VXuUTs1Br3DNrFkZV
	30J0UqbKNBX2mXAuz+UFEsmir1KzZ7jdEp3fXroYH50cYjxLQgKFidgzzmI2FPnRSiXqkDi9Bpe
	rA+oelLYHW7K9FNsWrL0dI0uaKiZGHylM+K6rCwidEJO/cEB3kaxnthMxEMTNqN64zhXqJyyzV1
	7lIO1Sy12P9EFjBqAGZ9u4Vub2hyodwwyV4dM3Lltr4+fJDy1QBYueRTeq1AlwdYj6wG7xfMK04
	Eo3aLgzc=
X-Received: by 2002:a17:90b:3b4d:b0:329:f630:6c3 with SMTP id 98e67ed59e1d1-33b513757fcmr3882399a91.20.1759917168316;
        Wed, 08 Oct 2025 02:52:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtFXLOASAwz6WPj42R/oo1fsa2LvdMmKLzHl2FAZVlJffubHQGs07trttPJ3wDEJJvddjqWw==
X-Received: by 2002:a17:90b:3b4d:b0:329:f630:6c3 with SMTP id 98e67ed59e1d1-33b513757fcmr3882359a91.20.1759917167728;
        Wed, 08 Oct 2025 02:52:47 -0700 (PDT)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b510e91d4sm2763833a91.1.2025.10.08.02.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 02:52:47 -0700 (PDT)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Wed, 08 Oct 2025 15:22:26 +0530
Subject: [PATCH v2 2/3] media: iris: Add support for QC08C format for
 decoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251008-video-iris-ubwc-enable-v2-2-478ba2d96427@oss.qualcomm.com>
References: <20251008-video-iris-ubwc-enable-v2-0-478ba2d96427@oss.qualcomm.com>
In-Reply-To: <20251008-video-iris-ubwc-enable-v2-0-478ba2d96427@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759917158; l=9913;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=W1z8dmd1zOKmRAB45rBCsy2K3g/McfdDaZiFHL25crI=;
 b=oFXIek9JfwGgLTn68u/voUP0dXHWxgg23vIFfdbxsAqf/jRETnSZNzvqZ4wpumh7dy2K1jPq4
 CkJc//jSn+nDh3uvbzzfkXjTx3Q7DhLKpqj8B8i5dgW/OwU4dmq5t9i
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Proofpoint-ORIG-GUID: pgOdzNvx2-eK4JRikJcGx2ZBBWoOCpiJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyMyBTYWx0ZWRfXyUFzw+1++Wnn
 ZvX2uT1WR3unVWNDGFR0G8imiZvxraMNb0MP26cMLtRnJ9npgH5N/bnJnX94clDrK/ncX7LZ16w
 ave1J+Am1tvfWc1W/cMtfVHKGYeB9DhDtpmOrCv5zwcZSazJa580AC3IbJi9ZeAI00L1w6zlCDM
 Tfk31K7HS10laPvbPlcl2sIS5yUtIlrSARMwB8JupGflRNihRSAeiRRo22GEAzh5iqWcrC/NT20
 kBINnRd5XbQIh7Li7QBAZGHbS9ywhMbVK51nTs1RjTbeIvtwajE6rcDsh5y5v0ApnkdpvC34NI1
 GEZYbItNtJDwA9qbdmkwJOh0XLnX6AW7aP3imyS3HCe7UD4xhtv3hhgt2dW4BDrMC6RLtFwAaFp
 m8f7JBtTWFANpcXQWm+hYvZXP1dOrA==
X-Authority-Analysis: v=2.4 cv=CbIFJbrl c=1 sm=1 tr=0 ts=68e63472 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=zeDBRBm57Unpba6ABZkA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: pgOdzNvx2-eK4JRikJcGx2ZBBWoOCpiJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040023

Introduce handling for the QC08C format in the decoder. QC08C format is
NV12 with UBWC compression. Update format checks and configuration to
enable decoding of QC08C streams.

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c     |  5 +-
 .../platform/qcom/iris/iris_hfi_gen1_command.c     | 12 +++--
 .../platform/qcom/iris/iris_hfi_gen2_command.c     |  3 +-
 drivers/media/platform/qcom/iris/iris_instance.h   |  7 ++-
 drivers/media/platform/qcom/iris/iris_utils.c      |  3 +-
 drivers/media/platform/qcom/iris/iris_vdec.c       | 61 ++++++++++++++++++----
 6 files changed, 72 insertions(+), 19 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index c0900038e7defccf7de3cb60e17c71e36a0e8ead..83dcf49e57ec1473bc4edd26c48ab0b247d23818 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -261,7 +261,10 @@ int iris_get_buffer_size(struct iris_inst *inst,
 		case BUF_INPUT:
 			return iris_dec_bitstream_buffer_size(inst);
 		case BUF_OUTPUT:
-			return iris_yuv_buffer_size_nv12(inst);
+			if (inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC08C)
+				return iris_yuv_buffer_size_qc08c(inst);
+			else
+				return iris_yuv_buffer_size_nv12(inst);
 		case BUF_DPB:
 			return iris_yuv_buffer_size_qc08c(inst);
 		default:
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index e1788c266bb1080921f17248fd5ee60156b3143d..e458d3349ce09aadb75d056ae84e3aab95f03078 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -774,20 +774,21 @@ static int iris_hfi_gen1_set_raw_format(struct iris_inst *inst, u32 plane)
 		pixelformat = inst->fmt_dst->fmt.pix_mp.pixelformat;
 		if (iris_split_mode_enabled(inst)) {
 			fmt.buffer_type = HFI_BUFFER_OUTPUT;
-			fmt.format = pixelformat == V4L2_PIX_FMT_NV12 ?
-				HFI_COLOR_FORMAT_NV12_UBWC : 0;
+			fmt.format = HFI_COLOR_FORMAT_NV12_UBWC;
 
 			ret = hfi_gen1_set_property(inst, ptype, &fmt, sizeof(fmt));
 			if (ret)
 				return ret;
 
 			fmt.buffer_type = HFI_BUFFER_OUTPUT2;
-			fmt.format = pixelformat == V4L2_PIX_FMT_NV12 ? HFI_COLOR_FORMAT_NV12 : 0;
+			fmt.format = pixelformat == V4L2_PIX_FMT_NV12 ?
+				HFI_COLOR_FORMAT_NV12 : HFI_COLOR_FORMAT_NV12_UBWC;
 
 			ret = hfi_gen1_set_property(inst, ptype, &fmt, sizeof(fmt));
 		} else {
 			fmt.buffer_type = HFI_BUFFER_OUTPUT;
-			fmt.format = pixelformat == V4L2_PIX_FMT_NV12 ? HFI_COLOR_FORMAT_NV12 : 0;
+			fmt.format = pixelformat == V4L2_PIX_FMT_NV12 ?
+				HFI_COLOR_FORMAT_NV12 : HFI_COLOR_FORMAT_NV12_UBWC;
 
 			ret = hfi_gen1_set_property(inst, ptype, &fmt, sizeof(fmt));
 		}
@@ -806,6 +807,9 @@ static int iris_hfi_gen1_set_format_constraints(struct iris_inst *inst, u32 plan
 	const u32 ptype = HFI_PROPERTY_PARAM_UNCOMPRESSED_PLANE_ACTUAL_CONSTRAINTS_INFO;
 	struct hfi_uncompressed_plane_actual_constraints_info pconstraint;
 
+	if (inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC08C)
+		return 0;
+
 	pconstraint.buffer_type = HFI_BUFFER_OUTPUT2;
 	pconstraint.num_planes = 2;
 	pconstraint.plane_format[0].stride_multiples = 128;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 56ced61de924eff3388c7df096f8235136bf473d..5ad202d3fcdc57a2b7b43de15763a686ce0f7bd7 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -443,7 +443,8 @@ static int iris_hfi_gen2_set_colorformat(struct iris_inst *inst, u32 plane)
 
 	if (inst->domain == DECODER) {
 		pixelformat = inst->fmt_dst->fmt.pix_mp.pixelformat;
-		hfi_colorformat = pixelformat == V4L2_PIX_FMT_NV12 ? HFI_COLOR_FMT_NV12 : 0;
+		hfi_colorformat = pixelformat == V4L2_PIX_FMT_NV12 ?
+			HFI_COLOR_FMT_NV12 : HFI_COLOR_FMT_NV12_UBWC;
 	} else {
 		pixelformat = inst->fmt_src->fmt.pix_mp.pixelformat;
 		hfi_colorformat = pixelformat == V4L2_PIX_FMT_NV12 ? HFI_COLOR_FMT_NV12 : 0;
diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index 5982d7adefeab80905478b32cddba7bd4651a691..62fbb30691ff967212022308fa53ff221fa24ce9 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -15,12 +15,17 @@
 #define DEFAULT_WIDTH 320
 #define DEFAULT_HEIGHT 240
 
-enum iris_fmt_type {
+enum iris_fmt_type_out {
 	IRIS_FMT_H264,
 	IRIS_FMT_HEVC,
 	IRIS_FMT_VP9,
 };
 
+enum iris_fmt_type_cap {
+	IRIS_FMT_NV12,
+	IRIS_FMT_QC08C,
+};
+
 struct iris_fmt {
 	u32 pixfmt;
 	u32 type;
diff --git a/drivers/media/platform/qcom/iris/iris_utils.c b/drivers/media/platform/qcom/iris/iris_utils.c
index 85c70a62b1fd2c409fc18b28f64771cb0097a7fd..e2f1131de43128254d8211343771e657e425541e 100644
--- a/drivers/media/platform/qcom/iris/iris_utils.c
+++ b/drivers/media/platform/qcom/iris/iris_utils.c
@@ -34,7 +34,8 @@ int iris_get_mbpf(struct iris_inst *inst)
 
 bool iris_split_mode_enabled(struct iris_inst *inst)
 {
-	return inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_NV12;
+	return inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_NV12 ||
+		inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC08C;
 }
 
 void iris_helper_buffers_done(struct iris_inst *inst, unsigned int type,
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index ae13c3e1b426bfd81a7b46dc6c3ff5eb5c4860cb..96844325b24e25497f1d59750f34c67177fdddc7 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -67,7 +67,7 @@ void iris_vdec_inst_deinit(struct iris_inst *inst)
 	kfree(inst->fmt_src);
 }
 
-static const struct iris_fmt iris_vdec_formats[] = {
+static const struct iris_fmt iris_vdec_formats_out[] = {
 	[IRIS_FMT_H264] = {
 		.pixfmt = V4L2_PIX_FMT_H264,
 		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
@@ -82,12 +82,35 @@ static const struct iris_fmt iris_vdec_formats[] = {
 	},
 };
 
+static const struct iris_fmt iris_vdec_formats_cap[] = {
+	[IRIS_FMT_NV12] = {
+		.pixfmt = V4L2_PIX_FMT_NV12,
+		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+	},
+	[IRIS_FMT_QC08C] = {
+		.pixfmt = V4L2_PIX_FMT_QC08C,
+		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+	},
+};
+
 static const struct iris_fmt *
 find_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 {
-	unsigned int size = ARRAY_SIZE(iris_vdec_formats);
-	const struct iris_fmt *fmt = iris_vdec_formats;
+	const struct iris_fmt *fmt = NULL;
+	unsigned int size = 0;
 	unsigned int i;
+	switch (type) {
+	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
+		fmt = iris_vdec_formats_out;
+		size = ARRAY_SIZE(iris_vdec_formats_out);
+		break;
+	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
+		fmt = iris_vdec_formats_cap;
+		size = ARRAY_SIZE(iris_vdec_formats_cap);
+		break;
+	default:
+		return NULL;
+	}
 
 	for (i = 0; i < size; i++) {
 		if (fmt[i].pixfmt == pixfmt)
@@ -103,8 +126,21 @@ find_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 static const struct iris_fmt *
 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 {
-	const struct iris_fmt *fmt = iris_vdec_formats;
-	unsigned int size = ARRAY_SIZE(iris_vdec_formats);
+	const struct iris_fmt *fmt = NULL;
+	unsigned int size = 0;
+
+	switch (type) {
+	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
+		fmt = iris_vdec_formats_out;
+		size = ARRAY_SIZE(iris_vdec_formats_out);
+		break;
+	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
+		fmt = iris_vdec_formats_cap;
+		size = ARRAY_SIZE(iris_vdec_formats_cap);
+		break;
+	default:
+		return NULL;
+	}
 
 	if (index >= size || fmt[index].type != type)
 		return NULL;
@@ -126,9 +162,10 @@ int iris_vdec_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f)
 		f->flags = V4L2_FMT_FLAG_COMPRESSED | V4L2_FMT_FLAG_DYN_RESOLUTION;
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
-		if (f->index)
+		fmt = find_format_by_index(inst, f->index, f->type);
+		if (!fmt)
 			return -EINVAL;
-		f->pixelformat = V4L2_PIX_FMT_NV12;
+		f->pixelformat = fmt->pixfmt;
 		break;
 	default:
 		return -EINVAL;
@@ -157,7 +194,7 @@ int iris_vdec_try_fmt(struct iris_inst *inst, struct v4l2_format *f)
 		}
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
-		if (f->fmt.pix_mp.pixelformat != V4L2_PIX_FMT_NV12) {
+		if (!fmt) {
 			f_inst = inst->fmt_dst;
 			f->fmt.pix_mp.pixelformat = f_inst->fmt.pix_mp.pixelformat;
 			f->fmt.pix_mp.width = f_inst->fmt.pix_mp.width;
@@ -238,10 +275,11 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
 		inst->crop.height = f->fmt.pix_mp.height;
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
+		if (!(find_format(inst, f->fmt.pix_mp.pixelformat, f->type)))
+			return -EINVAL;
+
 		fmt = inst->fmt_dst;
 		fmt->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
-		if (fmt->fmt.pix_mp.pixelformat != V4L2_PIX_FMT_NV12)
-			return -EINVAL;
 		fmt->fmt.pix_mp.pixelformat = f->fmt.pix_mp.pixelformat;
 		fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, 128);
 		fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, 32);
@@ -268,7 +306,8 @@ int iris_vdec_validate_format(struct iris_inst *inst, u32 pixelformat)
 {
 	const struct iris_fmt *fmt = NULL;
 
-	if (pixelformat != V4L2_PIX_FMT_NV12) {
+	fmt = find_format(inst, pixelformat, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+	if (!fmt) {
 		fmt = find_format(inst, pixelformat, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
 		if (!fmt)
 			return -EINVAL;

-- 
2.34.1


