Return-Path: <linux-media+bounces-48107-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 32787C9D499
	for <lists+linux-media@lfdr.de>; Wed, 03 Dec 2025 00:10:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2D45A34B304
	for <lists+linux-media@lfdr.de>; Tue,  2 Dec 2025 23:09:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4321F32B99F;
	Tue,  2 Dec 2025 23:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PId4Z6fQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UbVJD8CN"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E6A328637
	for <linux-media@vger.kernel.org>; Tue,  2 Dec 2025 23:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764716640; cv=none; b=rT5vz9VegeWVpQOO6rjgeSmfTOg6QGtYtfxpL2nn770QGaLsZtYvL5uE7ilkmB2dSKYfYu7xwUHgqF4stXDD2694FnYudXF7yqwh7CGqg9EZ7YnuLXXFdmuIeM5Othuwi6rXe7kNp3OiREvrnYzJDIT/bAe3arV3GYrXjIJrHNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764716640; c=relaxed/simple;
	bh=aZQblb9LYgNWetj5gIhZv5JduHkgrB0Vo7QFQ7KygGI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dX2pOi6bFQ8TTr/q6kCZV9KCjqNIw02EJy4jKSE0VVMYByKR//t4iHmYu2QKSl6E9+RK7MVaTCRYUzCnDGH07XlzFwcAZpbWQifaa7B29MLpSQhxwUpCLEmw/vREtud1A57ZFu5B+BAuuUdml36ZUoEOmzceNUpp+oN68zqxjks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PId4Z6fQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UbVJD8CN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B2JN3AU332103
	for <linux-media@vger.kernel.org>; Tue, 2 Dec 2025 23:03:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	73upf/s2bSkDIv8xEm3eLnGAZ91FfhbZg37C2kGZbOs=; b=PId4Z6fQIKGmxmus
	Qp/ucSvtVr6L6L2TC/G9308W0HPd9Lrvybv46K29ZodlYiHihffXXE+2ml9wQwR4
	zsX0bQROWV0QH/bc4AFyJMBTN8jW4YfknXMth1ev+t/zWNr0VQRfQlPUmbSj0JGP
	KZCvIPfwRzjiZFpk/6CCTjR4UpKErRxQY6pWbWFDSscrZdjLC5faOse3OxOBy8bz
	l9ARRLP0oKpEYih1wa5NjxV3q69LTPVSJ6+ZfFuvVq6+IoLM1MpsnInNRyf37v3j
	daYKFf9z9cCvhobE2BgAPr6m6Z4QzHv5B5dcgELgx/2fSbqUIv3+qft3p5z0QEb5
	ISKsTQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4at67c0h3b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 02 Dec 2025 23:03:56 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-297ea27c814so16623165ad.3
        for <linux-media@vger.kernel.org>; Tue, 02 Dec 2025 15:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764716635; x=1765321435; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=73upf/s2bSkDIv8xEm3eLnGAZ91FfhbZg37C2kGZbOs=;
        b=UbVJD8CN/HzG5XPjAs8rL36tdsyM4m8Qpqg6MIiFCUunqZPOQlPGzolBGGSodwCXy7
         gqD791QLCmj4DLczTZBw9UhDwA+GSIRabaUNR6ZeJyAP7KZNLpKhDnuxo6pzW/vvhOCx
         9+YZ8r93V+tKoOxgxyJnhoRFnYcPMP0a+GS1GNNIOPVTiNJpkETc+/uaj/L7GY0QsEbM
         PiLjtqnqKjOuFVkJ6htntxqaF0C40M8962rcEQgQcyVSWAm5iIx162WuWjKRwNd7uR9W
         rKPWMstkM+bI5VBVK3kk4dVwE1xetm1bBrKvttDqn7cUn6aFeEApBlXGYurEN+GCKcYN
         hJ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764716635; x=1765321435;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=73upf/s2bSkDIv8xEm3eLnGAZ91FfhbZg37C2kGZbOs=;
        b=S885P/S37n0VNK423DLFN0nnRC2v+B1aV9mPy4tsTR1RRIu7nPh0iF8p9/fo9j04dM
         5qzYOKXC8bXrGjH9oHatVLUzohUcrdWQ+qht1DbdWk9jbHbO1oUTLCFu72wFnsw4D0cG
         LBkiPp6Paad/rfOUbaIY7AMlCmMwlTj7GTOG9zVsZRsUtAJ6V/MLN7QLG8v+dUFXmKw0
         MslqT93RAVNIDrK+NixEHSmxlQK7l6+HmVwUixUc7fbNDE5kbB+KBUWpcR7iUgyRA0GW
         lBNxyl29WzwnzRmLFmJmxEN2BpWEoPz7uceCReS+oy+nRMWb3qJdVWU4dY7dnQrScI9d
         ks+A==
X-Gm-Message-State: AOJu0YzIlQL4fscWAtdnGWnFV1RXCY/B9Jise/o2tBIzoHS9vQgdjQJp
	efbEuX7GLw19J/aewpg8+rooFcEzk2KOWdbQ7ZFGJDYhiZ947yrABnlUstcLdH+ldLHH6MCJ7j3
	xMpeqK3EqgP5utOSrlXO94R3cn3lH56pPD21mlhymIEjx9D6XuBe99MSx9hoxLL/CTb1my7PMgw
	==
X-Gm-Gg: ASbGncswpKhYay5nWgwN8/RhfzwtGItkBzu65jMoQz3u6DwksbU3FkhWdR/qEQTYEs6
	QY/TS8e+PLpI6I/TuUhIXv+KRjBfggUbByYNwEI4VFtnUd7fvxQiWN2ATWbSablUiRmrRClW/f/
	qElNOMuZ6fb6qev3IYU8lgL9QJ+9Gvua0CxfBXQKZS3OQCtOfYl/ewz62iLJcQwbVKDX+afwOsd
	IFO6SqvM3mj97eCGfe5ascPDDoeQFYI6kNPUF11Kurga9GAgF4a+49OyxwHI+MQz+3qP2xBft8l
	WXqlj0az6y1e7ubl3fqXY3fBnr/GNnofNJCP9jbgxl3Fg+d79mAVlYWzHw8QmsfL22WGh3V6KX/
	Ynz3cmag587d+zvBjO+dQDLb13ERxFcCWNfKoSTlFw2BRWYN52vI3D7uqE0ZF4q1RJ2YCtA==
X-Received: by 2002:a05:7300:a947:b0:2a4:3593:5fc8 with SMTP id 5a478bee46e88-2ab92e20631mr201902eec.2.1764716634663;
        Tue, 02 Dec 2025 15:03:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG9yVS9zm6HSFx+wgl2pkO7KNZIW0eSOgbEefp4nuCXYwsJxZgX+qb/tSjESTM1yUGmm7h61g==
X-Received: by 2002:a05:7300:a947:b0:2a4:3593:5fc8 with SMTP id 5a478bee46e88-2ab92e20631mr201877eec.2.1764716633842;
        Tue, 02 Dec 2025 15:03:53 -0800 (PST)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a965ae9d06sm59214149eec.4.2025.12.02.15.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 15:03:53 -0800 (PST)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Tue, 02 Dec 2025 15:03:45 -0800
Subject: [PATCH v8 4/5] media: iris: Define AV1-specific platform
 capabilities and properties
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251202-av1d_stateful_v3-v8-4-2f74a81773b4@oss.qualcomm.com>
References: <20251202-av1d_stateful_v3-v8-0-2f74a81773b4@oss.qualcomm.com>
In-Reply-To: <20251202-av1d_stateful_v3-v8-0-2f74a81773b4@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764716630; l=23049;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=aZQblb9LYgNWetj5gIhZv5JduHkgrB0Vo7QFQ7KygGI=;
 b=KXtVkK22cJY/dL14Jui0UwQygN0up9hR/R6ljczrtdLN9IqIbb2BPs7KQhVHXLtzW+GAaSTRG
 +KD324oezGtB0ODNeI/9Z3za+Sj9dGtDt6h4GXhniqfUTaD0SxEN64W
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-ORIG-GUID: vTxNtSDuT_jv_z3s3OiRIm97J-1o7v_Y
X-Authority-Analysis: v=2.4 cv=W/c1lBWk c=1 sm=1 tr=0 ts=692f705c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=udLH2Pm8O0Z1g0iT3SAA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: vTxNtSDuT_jv_z3s3OiRIm97J-1o7v_Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDE4MiBTYWx0ZWRfX8GbPQ2EvMWap
 cJvNV0f6OQQ1MjtEoigM25AyTLhpRRaLdaYylsbMIsyb1E9P8oQa3h5bgVnxTLWzUQr+T0LhTme
 FFpfaEv4ZkB6RcLzZYKOT+APxQXUoxFcsoIpcOPqJH0Jl1ajIbK35lwkpBDryxv/L32BDVRlmJq
 kmwnNVk9ppvh9CeM3BX8bz+1FZhpqcq5tfXHsJrgvJ3j3Aq5Wmha9UmWgEhcuu7QJu+e5momo5Z
 YLDwK+bnvel6ovjZbyr55RjY2yrBerjxXW+5LAXjBztJQ4tSNblkWOtvEkFVjiF3Lh2zyKRT7WG
 VAw/Vz3cV907osHGrqyW0b7fiac67Q5JJzp8Cqsvq+0MNjloyMvl5MuuTCZ9u7SzV5raiJjNhWa
 cT2+qOViA0NJC97LVWNp0vQJa8piPQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512020182

Defining platform specific capabilities specific to AV1 decoder.
Set and subscribe to manadatory properties to firmware for AV1.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.h     |   1 +
 drivers/media/platform/qcom/iris/iris_ctrls.c      |   8 ++
 drivers/media/platform/qcom/iris/iris_hfi_common.h |   3 +
 .../platform/qcom/iris/iris_hfi_gen2_command.c     |  85 ++++++++++++++-
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  10 +-
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  22 ++++
 .../platform/qcom/iris/iris_platform_common.h      |  11 ++
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 119 ++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_vidc.c       |   1 +
 9 files changed, 256 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.h b/drivers/media/platform/qcom/iris/iris_buffer.h
index 325d30fce5c99185b61ff989fbfd4de9a56762b2..5ef365d9236c7cbdee24a4614789b3191881968b 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.h
+++ b/drivers/media/platform/qcom/iris/iris_buffer.h
@@ -42,6 +42,7 @@ enum iris_buffer_type {
 	BUF_SCRATCH_1,
 	BUF_SCRATCH_2,
 	BUF_VPSS,
+	BUF_PARTIAL,
 	BUF_TYPE_MAX,
 };
 
diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index c0b3a09ad3e3dfb0a47e3603a8089cf61390fda8..87f929442ec658f5d17646698f0bfa2acfe420d9 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -98,6 +98,10 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
 		return B_FRAME_QP_H264;
 	case V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_QP:
 		return B_FRAME_QP_HEVC;
+	case V4L2_CID_MPEG_VIDEO_AV1_PROFILE:
+		return PROFILE_AV1;
+	case V4L2_CID_MPEG_VIDEO_AV1_LEVEL:
+		return LEVEL_AV1;
 	default:
 		return INST_FW_CAP_MAX;
 	}
@@ -185,6 +189,10 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
 		return V4L2_CID_MPEG_VIDEO_H264_B_FRAME_QP;
 	case B_FRAME_QP_HEVC:
 		return V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_QP;
+	case PROFILE_AV1:
+		return V4L2_CID_MPEG_VIDEO_AV1_PROFILE;
+	case LEVEL_AV1:
+		return V4L2_CID_MPEG_VIDEO_AV1_LEVEL;
 	default:
 		return 0;
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
index b51471fb32c70acee44c37f8e9dce0c6bc0b6ccc..3edb5ae582b49bea2e2408c4a5cfc0a742adc05f 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
@@ -141,6 +141,9 @@ struct hfi_subscription_params {
 	u32	profile;
 	u32	level;
 	u32	tier;
+	u32	drap;
+	u32	film_grain;
+	u32	super_block;
 };
 
 u32 iris_hfi_get_v4l2_color_primaries(u32 hfi_primaries);
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 6a772db2ec33fb002d8884753a41dc98b3a8439d..b00594bb3c8871b80a5d7c0e4f4a84d983fd77e8 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -10,6 +10,7 @@
 
 #define UNSPECIFIED_COLOR_FORMAT 5
 #define NUM_SYS_INIT_PACKETS 8
+#define NUM_COMV_AV1 18
 
 #define SYS_INIT_PKT_SIZE (sizeof(struct iris_hfi_header) + \
 	NUM_SYS_INIT_PACKETS * (sizeof(struct iris_hfi_packet) + sizeof(u32)))
@@ -121,6 +122,7 @@ static u32 iris_hfi_gen2_get_port_from_buf_type(struct iris_inst *inst,
 		case BUF_COMV:
 		case BUF_NON_COMV:
 		case BUF_LINE:
+		case BUF_PARTIAL:
 			return HFI_PORT_BITSTREAM;
 		case BUF_OUTPUT:
 		case BUF_DPB:
@@ -380,6 +382,9 @@ static int iris_hfi_gen2_set_profile(struct iris_inst *inst, u32 plane)
 	case V4L2_PIX_FMT_H264:
 		profile = inst->fw_caps[PROFILE_H264].value;
 		break;
+	case V4L2_PIX_FMT_AV1:
+		profile = inst->fw_caps[PROFILE_AV1].value;
+		break;
 	}
 
 	inst_hfi_gen2->src_subcr_params.profile = profile;
@@ -409,6 +414,9 @@ static int iris_hfi_gen2_set_level(struct iris_inst *inst, u32 plane)
 	case V4L2_PIX_FMT_H264:
 		level = inst->fw_caps[LEVEL_H264].value;
 		break;
+	case V4L2_PIX_FMT_AV1:
+		level = inst->fw_caps[LEVEL_AV1].value;
+		break;
 	}
 
 	inst_hfi_gen2->src_subcr_params.level = level;
@@ -496,10 +504,12 @@ static int iris_hfi_gen2_set_linear_stride_scanline(struct iris_inst *inst, u32
 
 static int iris_hfi_gen2_set_tier(struct iris_inst *inst, u32 plane)
 {
-	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
 	u32 port = iris_hfi_gen2_get_port(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
 	u32 tier = inst->fw_caps[TIER].value;
 
+	tier = (inst->codec == V4L2_PIX_FMT_AV1) ? inst->fw_caps[TIER_AV1].value :
+							inst->fw_caps[TIER].value;
 	inst_hfi_gen2->src_subcr_params.tier = tier;
 
 	return iris_hfi_gen2_session_set_property(inst,
@@ -525,6 +535,40 @@ static int iris_hfi_gen2_set_frame_rate(struct iris_inst *inst, u32 plane)
 						  sizeof(u32));
 }
 
+static int iris_hfi_gen2_set_film_grain(struct iris_inst *inst, u32 plane)
+{
+	u32 port = iris_hfi_gen2_get_port(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
+	u32 film_grain = inst->fw_caps[FILM_GRAIN].value;
+
+	inst_hfi_gen2->src_subcr_params.film_grain = film_grain;
+
+	return iris_hfi_gen2_session_set_property(inst,
+						  HFI_PROP_AV1_FILM_GRAIN_PRESENT,
+						  HFI_HOST_FLAGS_NONE,
+						  port,
+						  HFI_PAYLOAD_U32_ENUM,
+						  &film_grain,
+						  sizeof(u32));
+}
+
+static int iris_hfi_gen2_set_super_block(struct iris_inst *inst, u32 plane)
+{
+	u32 port = iris_hfi_gen2_get_port(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
+	u32 super_block = inst->fw_caps[SUPER_BLOCK].value;
+
+	inst_hfi_gen2->src_subcr_params.super_block = super_block;
+
+	return iris_hfi_gen2_session_set_property(inst,
+						  HFI_PROP_AV1_SUPER_BLOCK_ENABLED,
+						  HFI_HOST_FLAGS_NONE,
+						  port,
+						  HFI_PAYLOAD_U32_ENUM,
+						  &super_block,
+						  sizeof(u32));
+}
+
 static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 plane)
 {
 	const struct iris_platform_data *pdata = inst->core->iris_platform_data;
@@ -548,6 +592,9 @@ static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 p
 		{HFI_PROP_LINEAR_STRIDE_SCANLINE,     iris_hfi_gen2_set_linear_stride_scanline },
 		{HFI_PROP_TIER,                       iris_hfi_gen2_set_tier                   },
 		{HFI_PROP_FRAME_RATE,                 iris_hfi_gen2_set_frame_rate             },
+		{HFI_PROP_AV1_FILM_GRAIN_PRESENT,     iris_hfi_gen2_set_film_grain             },
+		{HFI_PROP_AV1_SUPER_BLOCK_ENABLED,    iris_hfi_gen2_set_super_block            },
+		{HFI_PROP_OPB_ENABLE,                 iris_hfi_gen2_set_opb_enable             },
 	};
 
 	if (inst->domain == DECODER) {
@@ -561,6 +608,9 @@ static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 p
 			} else if (inst->codec == V4L2_PIX_FMT_VP9) {
 				config_params = pdata->dec_input_config_params_vp9;
 				config_params_size = pdata->dec_input_config_params_vp9_size;
+			} else if (inst->codec == V4L2_PIX_FMT_AV1) {
+				config_params = pdata->dec_input_config_params_av1;
+				config_params_size = pdata->dec_input_config_params_av1_size;
 			} else {
 				return -EINVAL;
 			}
@@ -615,6 +665,9 @@ static int iris_hfi_gen2_session_set_codec(struct iris_inst *inst)
 		break;
 	case V4L2_PIX_FMT_VP9:
 		codec = HFI_CODEC_DECODE_VP9;
+		break;
+	case V4L2_PIX_FMT_AV1:
+		codec = HFI_CODEC_DECODE_AV1;
 	}
 
 	iris_hfi_gen2_packet_session_property(inst,
@@ -780,6 +833,11 @@ static int iris_hfi_gen2_subscribe_change_param(struct iris_inst *inst, u32 plan
 		change_param_size =
 			core->iris_platform_data->dec_input_config_params_vp9_size;
 		break;
+	case V4L2_PIX_FMT_AV1:
+		change_param = core->iris_platform_data->dec_input_config_params_av1;
+		change_param_size =
+			core->iris_platform_data->dec_input_config_params_av1_size;
+		break;
 	}
 
 	payload[0] = HFI_MODE_PORT_SETTINGS_CHANGE;
@@ -862,6 +920,16 @@ static int iris_hfi_gen2_subscribe_change_param(struct iris_inst *inst, u32 plan
 				payload_size = sizeof(u32);
 				payload_type = HFI_PAYLOAD_U32;
 				break;
+			case HFI_PROP_AV1_FILM_GRAIN_PRESENT:
+				payload[0] = subsc_params.film_grain;
+				payload_size = sizeof(u32);
+				payload_type = HFI_PAYLOAD_U32;
+				break;
+			case HFI_PROP_AV1_SUPER_BLOCK_ENABLED:
+				payload[0] = subsc_params.super_block;
+				payload_size = sizeof(u32);
+				payload_type = HFI_PAYLOAD_U32;
+				break;
 			default:
 				prop_type = 0;
 				ret = -EINVAL;
@@ -917,6 +985,11 @@ static int iris_hfi_gen2_subscribe_property(struct iris_inst *inst, u32 plane)
 			subscribe_prop_size =
 				core->iris_platform_data->dec_output_prop_vp9_size;
 			break;
+		case V4L2_PIX_FMT_AV1:
+			subcribe_prop = core->iris_platform_data->dec_output_prop_av1;
+			subscribe_prop_size =
+				core->iris_platform_data->dec_output_prop_av1_size;
+			break;
 		}
 	}
 
@@ -1092,6 +1165,8 @@ static u32 iris_hfi_gen2_buf_type_from_driver(u32 domain, enum iris_buffer_type
 		return HFI_BUFFER_ARP;
 	case BUF_VPSS:
 		return HFI_BUFFER_VPSS;
+	case BUF_PARTIAL:
+		return HFI_BUFFER_PARTIAL_DATA;
 	default:
 		return 0;
 	}
@@ -1104,7 +1179,13 @@ static int iris_set_num_comv(struct iris_inst *inst)
 	u32 num_comv;
 
 	caps = core->iris_platform_data->inst_caps;
-	num_comv = caps->num_comv;
+
+	/*
+	 * AV1 needs more comv buffers than other codecs.
+	 * Update accordingly.
+	 */
+	num_comv = (inst->codec == V4L2_PIX_FMT_AV1) ?
+				NUM_COMV_AV1 : caps->num_comv;
 
 	return core->hfi_ops->session_set_property(inst,
 						   HFI_PROP_COMV_BUFFER_COUNT,
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index 3d56f257bc5620aacec2bb7e11253dc7c83b7db9..12b4c6517bf094e3e98332a1b2b70ac5a349b863 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -89,10 +89,18 @@ enum hfi_seq_header_mode {
 #define HFI_PROP_DEC_START_FROM_RAP_FRAME	0x03000169
 #define HFI_PROP_NO_OUTPUT			0x0300016a
 #define HFI_PROP_BUFFER_MARK			0x0300016c
+#define HFI_PROP_WORST_COMPRESSION_RATIO	0x03000174
+#define HFI_PROP_WORST_COMPLEXITY_FACTOR	0x03000175
 #define HFI_PROP_RAW_RESOLUTION		0x03000178
 #define HFI_PROP_TOTAL_PEAK_BITRATE		0x0300017C
-#define HFI_PROP_OPB_ENABLE			0x03000184
+#define HFI_PROP_AV1_FILM_GRAIN_PRESENT		0x03000180
+#define HFI_PROP_AV1_SUPER_BLOCK_ENABLED	0x03000181
+#define HFI_PROP_AV1_OP_POINT				0x03000182
+#define HFI_PROP_OPB_ENABLE                 0x03000184
+#define HFI_PROP_AV1_TILE_ROWS_COLUMNS      0x03000187
+#define HFI_PROP_AV1_DRAP_CONFIG            0x03000189
 #define HFI_PROP_COMV_BUFFER_COUNT		0x03000193
+#define HFI_PROP_AV1_UNIFORM_TILE_SPACING	0x03000197
 #define HFI_PROP_END				0x03FFFFFF
 
 #define HFI_SESSION_ERROR_BEGIN			0x04000000
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index 2f1f118eae4f6462ab1aa1d16844b34e6e699f1e..eb3373f0ad4a1b26fb847db02449ec8d8cb3bdbb 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -54,6 +54,8 @@ static u32 iris_hfi_gen2_buf_type_to_driver(struct iris_inst *inst,
 			return BUF_SCRATCH_2;
 	case HFI_BUFFER_PERSIST:
 		return BUF_PERSIST;
+	case HFI_BUFFER_PARTIAL_DATA:
+		return BUF_PARTIAL;
 	default:
 		return 0;
 	}
@@ -72,6 +74,7 @@ static bool iris_hfi_gen2_is_valid_hfi_buffer_type(u32 buffer_type)
 	case HFI_BUFFER_DPB:
 	case HFI_BUFFER_PERSIST:
 	case HFI_BUFFER_VPSS:
+	case HFI_BUFFER_PARTIAL_DATA:
 		return true;
 	default:
 		return false;
@@ -596,6 +599,10 @@ static void iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
 		inst->fw_caps[PROFILE_H264].value = subsc_params.profile;
 		inst->fw_caps[LEVEL_H264].value = subsc_params.level;
 		break;
+	case V4L2_PIX_FMT_AV1:
+		inst->fw_caps[PROFILE_AV1].value = subsc_params.profile;
+		inst->fw_caps[LEVEL_AV1].value = subsc_params.level;
+		break;
 	}
 
 	inst->fw_caps[POC].value = subsc_params.pic_order_cnt;
@@ -608,6 +615,11 @@ static void iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
 		iris_inst_change_state(inst, IRIS_INST_ERROR);
 	}
 
+	if (inst->codec == V4L2_PIX_FMT_AV1) {
+		inst->fw_caps[FILM_GRAIN].value = subsc_params.film_grain;
+		inst->fw_caps[SUPER_BLOCK].value = subsc_params.super_block;
+	}
+
 	inst->fw_min_count = subsc_params.fw_min_count;
 	inst->buffers[BUF_OUTPUT].min_count = iris_vpu_buf_count(inst, BUF_OUTPUT);
 	inst->buffers[BUF_OUTPUT].size = pixmp_op->plane_fmt[0].sizeimage;
@@ -711,6 +723,12 @@ static int iris_hfi_gen2_handle_session_property(struct iris_inst *inst,
 	case HFI_PROP_NO_OUTPUT:
 		inst_hfi_gen2->hfi_frame_info.no_output = 1;
 		break;
+	case HFI_PROP_AV1_FILM_GRAIN_PRESENT:
+		inst_hfi_gen2->src_subcr_params.film_grain = pkt->payload[0];
+		break;
+	case HFI_PROP_AV1_SUPER_BLOCK_ENABLED:
+		inst_hfi_gen2->src_subcr_params.super_block = pkt->payload[0];
+		break;
 	case HFI_PROP_QUALITY_MODE:
 	case HFI_PROP_STAGE:
 	case HFI_PROP_PIPE:
@@ -841,6 +859,10 @@ static void iris_hfi_gen2_init_src_change_param(struct iris_inst *inst)
 		subsc_params->profile = inst->fw_caps[PROFILE_H264].value;
 		subsc_params->level = inst->fw_caps[LEVEL_H264].value;
 		break;
+	case V4L2_PIX_FMT_AV1:
+		subsc_params->profile = inst->fw_caps[PROFILE_AV1].value;
+		subsc_params->level = inst->fw_caps[LEVEL_AV1].value;
+		break;
 	}
 
 	subsc_params->pic_order_cnt = inst->fw_caps[POC].value;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 6e8e762bd5cf704d7932536bea56d4bdfc1bc598..14a2f4dbe38ab271c30df301e20b78b20ac08f12 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -103,6 +103,13 @@ enum platform_inst_fw_cap_type {
 	LEVEL_H264,
 	LEVEL_HEVC,
 	LEVEL_VP9,
+	PROFILE_AV1,
+	LEVEL_AV1,
+	TIER_AV1,
+	DRAP,
+	FILM_GRAIN,
+	SUPER_BLOCK,
+	ENH_LAYER_COUNT,
 	INPUT_BUF_HOST_MAX_COUNT,
 	OUTPUT_BUF_HOST_MAX_COUNT,
 	STAGE,
@@ -241,6 +248,8 @@ struct iris_platform_data {
 	unsigned int dec_input_config_params_hevc_size;
 	const u32 *dec_input_config_params_vp9;
 	unsigned int dec_input_config_params_vp9_size;
+	const u32 *dec_input_config_params_av1;
+	unsigned int dec_input_config_params_av1_size;
 	const u32 *dec_output_config_params;
 	unsigned int dec_output_config_params_size;
 	const u32 *enc_input_config_params;
@@ -255,6 +264,8 @@ struct iris_platform_data {
 	unsigned int dec_output_prop_hevc_size;
 	const u32 *dec_output_prop_vp9;
 	unsigned int dec_output_prop_vp9_size;
+	const u32 *dec_output_prop_av1;
+	unsigned int dec_output_prop_av1_size;
 	const u32 *dec_ip_int_buf_tbl;
 	unsigned int dec_ip_int_buf_tbl_size;
 	const u32 *dec_op_int_buf_tbl;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index d5b74082ddaa3ba731913a467f47229a49e06d2d..56780003a03df84a2068dd118ce276c3479a51c7 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -64,6 +64,16 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
 		.set = iris_set_u32_enum,
 	},
+	{
+		.cap_id = PROFILE_AV1,
+		.min = V4L2_MPEG_VIDEO_AV1_PROFILE_MAIN,
+		.max = V4L2_MPEG_VIDEO_AV1_PROFILE_MAIN,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_AV1_PROFILE_MAIN),
+		.value = V4L2_MPEG_VIDEO_AV1_PROFILE_MAIN,
+		.hfi_id = HFI_PROP_PROFILE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_u32_enum,
+	},
 	{
 		.cap_id = PROFILE_VP9,
 		.min = V4L2_MPEG_VIDEO_VP9_PROFILE_0,
@@ -147,6 +157,33 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
 		.set = iris_set_u32_enum,
 	},
+	{
+		.cap_id = LEVEL_AV1,
+		.min = V4L2_MPEG_VIDEO_AV1_LEVEL_2_0,
+		.max = V4L2_MPEG_VIDEO_AV1_LEVEL_6_1,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_2_0) |
+				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_2_1) |
+				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_2_2) |
+				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_2_3) |
+				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_3_0) |
+				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_3_1) |
+				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_3_2) |
+				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_3_3) |
+				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_4_0) |
+				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_4_1) |
+				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_4_2) |
+				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_4_3) |
+				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_5_0) |
+				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_5_1) |
+				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_5_2) |
+				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_5_3) |
+				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_6_0) |
+				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_6_1),
+		.value = V4L2_MPEG_VIDEO_AV1_LEVEL_6_1,
+		.hfi_id = HFI_PROP_LEVEL,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_u32_enum,
+	},
 	{
 		.cap_id = TIER,
 		.min = V4L2_MPEG_VIDEO_HEVC_TIER_MAIN,
@@ -158,6 +195,53 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
 		.set = iris_set_u32_enum,
 	},
+	{
+		.cap_id = TIER_AV1,
+		.min = 0,
+		.max = 1,
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROP_TIER,
+		.flags = CAP_FLAG_INPUT_PORT,
+		.set = iris_set_u32,
+	},
+	{
+		.cap_id = DRAP,
+		.min = 0,
+		.max = 1,
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROP_AV1_DRAP_CONFIG,
+		.flags = CAP_FLAG_INPUT_PORT,
+		.set = iris_set_u32,
+	},
+	{
+		.cap_id = FILM_GRAIN,
+		.min = 0,
+		.max = 1,
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROP_AV1_FILM_GRAIN_PRESENT,
+		.flags = CAP_FLAG_VOLATILE,
+	},
+	{
+		.cap_id = SUPER_BLOCK,
+		.min = 0,
+		.max = 1,
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROP_AV1_SUPER_BLOCK_ENABLED,
+	},
+	{
+		.cap_id = ENH_LAYER_COUNT,
+		.min = 0,
+		.max = 1,
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROP_AV1_OP_POINT,
+		.flags = CAP_FLAG_INPUT_PORT,
+		.set = iris_set_u32,
+	},
 	{
 		.cap_id = INPUT_BUF_HOST_MAX_COUNT,
 		.min = DEFAULT_MAX_HOST_BUF_COUNT,
@@ -699,6 +783,19 @@ static const u32 sm8550_vdec_input_config_param_vp9[] = {
 	HFI_PROP_LEVEL,
 };
 
+static const u32 sm8550_vdec_input_config_param_av1[] = {
+	HFI_PROP_BITSTREAM_RESOLUTION,
+	HFI_PROP_CROP_OFFSETS,
+	HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
+	HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT,
+	HFI_PROP_PROFILE,
+	HFI_PROP_LEVEL,
+	HFI_PROP_TIER,
+	HFI_PROP_AV1_FILM_GRAIN_PRESENT,
+	HFI_PROP_AV1_SUPER_BLOCK_ENABLED,
+	HFI_PROP_SIGNAL_COLOR_INFO,
+};
+
 static const u32 sm8550_venc_input_config_params[] = {
 	HFI_PROP_COLOR_FORMAT,
 	HFI_PROP_RAW_RESOLUTION,
@@ -736,11 +833,18 @@ static const u32 sm8550_vdec_subscribe_output_properties_vp9[] = {
 	HFI_PROP_PICTURE_TYPE,
 };
 
+static const u32 sm8550_vdec_subscribe_output_properties_av1[] = {
+	HFI_PROP_PICTURE_TYPE,
+	HFI_PROP_WORST_COMPRESSION_RATIO,
+	HFI_PROP_WORST_COMPLEXITY_FACTOR,
+};
+
 static const u32 sm8550_dec_ip_int_buf_tbl[] = {
 	BUF_BIN,
 	BUF_COMV,
 	BUF_NON_COMV,
 	BUF_LINE,
+	BUF_PARTIAL,
 };
 
 static const u32 sm8550_dec_op_int_buf_tbl[] = {
@@ -805,11 +909,14 @@ const struct iris_platform_data sm8550_data = {
 		sm8550_vdec_input_config_param_vp9,
 	.dec_input_config_params_vp9_size =
 		ARRAY_SIZE(sm8550_vdec_input_config_param_vp9),
+	.dec_input_config_params_av1 =
+		sm8550_vdec_input_config_param_av1,
+	.dec_input_config_params_av1_size =
+		ARRAY_SIZE(sm8550_vdec_input_config_param_av1),
 	.dec_output_config_params =
 		sm8550_vdec_output_config_params,
 	.dec_output_config_params_size =
 		ARRAY_SIZE(sm8550_vdec_output_config_params),
-
 	.enc_input_config_params =
 		sm8550_venc_input_config_params,
 	.enc_input_config_params_size =
@@ -830,6 +937,9 @@ const struct iris_platform_data sm8550_data = {
 	.dec_output_prop_vp9 = sm8550_vdec_subscribe_output_properties_vp9,
 	.dec_output_prop_vp9_size =
 		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_vp9),
+	.dec_output_prop_av1 = sm8550_vdec_subscribe_output_properties_av1,
+	.dec_output_prop_av1_size =
+		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_av1),
 
 	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
 	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
@@ -899,6 +1009,10 @@ const struct iris_platform_data sm8650_data = {
 		sm8550_vdec_input_config_param_vp9,
 	.dec_input_config_params_vp9_size =
 		ARRAY_SIZE(sm8550_vdec_input_config_param_vp9),
+	.dec_input_config_params_av1 =
+		sm8550_vdec_input_config_param_av1,
+	.dec_input_config_params_av1_size =
+		ARRAY_SIZE(sm8550_vdec_input_config_param_av1),
 	.dec_output_config_params =
 		sm8550_vdec_output_config_params,
 	.dec_output_config_params_size =
@@ -924,6 +1038,9 @@ const struct iris_platform_data sm8650_data = {
 	.dec_output_prop_vp9 = sm8550_vdec_subscribe_output_properties_vp9,
 	.dec_output_prop_vp9_size =
 		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_vp9),
+	.dec_output_prop_av1 = sm8550_vdec_subscribe_output_properties_av1,
+	.dec_output_prop_av1_size =
+		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_av1),
 
 	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
 	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index c9b881923ef1831baaa86bea7c13c9734dbe6e4b..dfd94f4a84a9410d1e6b6a7c503c9d7bc4c7a1af 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -178,6 +178,7 @@ int iris_open(struct file *filp)
 	INIT_LIST_HEAD(&inst->buffers[BUF_SCRATCH_1].list);
 	INIT_LIST_HEAD(&inst->buffers[BUF_SCRATCH_2].list);
 	INIT_LIST_HEAD(&inst->buffers[BUF_VPSS].list);
+	INIT_LIST_HEAD(&inst->buffers[BUF_PARTIAL].list);
 	init_completion(&inst->completion);
 	init_completion(&inst->flush_completion);
 

-- 
2.34.1


