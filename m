Return-Path: <linux-media+bounces-47039-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2D7C5B143
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 04:14:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4620E4E7580
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 03:12:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1756226E6EB;
	Fri, 14 Nov 2025 03:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SG9FBZu9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OMFLOreD"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F29825783C
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 03:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763089881; cv=none; b=KLHbaDLqIENmDTiCUqY6SYtPCrvGEq/o5jkgPDoOtD9NRODf4oDwJ9qkj1LLAN1JhisEsVOsyqJsEQ7/jz80AtW/1Z+BSQC2ZbF0XcTtFUpf08qEdJdQAPGKZabNg/EejxbY52T+VUj2HBx0GnEvSMP96E9aGHn5y+ZPeALpw/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763089881; c=relaxed/simple;
	bh=oL5dAWu67nMWj9elYY6TpZu6ly6sGSrd/2TbVB1R82s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qrm47mhQRpkZrVDU2SuA/4+gKVJzQDRjHL3yYlMoZJcUGc4yJkQuHeaGQHEc7B/+05dm+rHPMGxjydbea/jE1wSZaU33LKjrR0WMqpXJfXYZnmrF2bxRC8eAybWzFVQuw7j6NISuMSDG+oELWUAXgud3D1iC8tV8WUQ2PSS+svM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SG9FBZu9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OMFLOreD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMaobF1629664
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 03:11:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pk9f+4OOCJ8o6XMs6Vn+C/tafSb+E8hKTE80nWkqEGs=; b=SG9FBZu9duxi4wtr
	f0rifUDedzfw5AkKQ2vVWkdxqaVE0sHfsh20S5lwqryupgpF+eVaXpURiE9axGbH
	bfiKQK735Sn7i1lpZEvW2Acq1uxin/FUijdvXA9emm4CdXSU8w/Nrqb+VNq8Ed2g
	z/l4/NSyfQbKLW/azqghStM7EMIWGehbQxaQ+Yhmwp8h3xW8tvHJyPEyvjfwsAe3
	HsrOTzM5dPjRsKUyyBmYbhq0wA+yiyXckAXnTA0ijdj73zRgg1ETQI6yLdlIBZOa
	/oKBmwRk90vKgsPtrHA4AgMi5RSq4MWv4A2UNvPdoqzMRT8/8XVYzT3/3MGVFwt6
	LH19UA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9d8mu9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 03:11:18 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7b9321b9312so3427708b3a.1
        for <linux-media@vger.kernel.org>; Thu, 13 Nov 2025 19:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763089878; x=1763694678; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pk9f+4OOCJ8o6XMs6Vn+C/tafSb+E8hKTE80nWkqEGs=;
        b=OMFLOreDARC/lfblUu1WpLr/xX/1BBC8btEXaeVtLUNiFNI7wm9a9WxBtZLNnZAvyr
         eQ7hf9FRsE7+PuSYqjYMLb81tgjMOnSQ0BkptP9dEkPQleueDhPzQRljMr8kN9+Xuo1v
         vfndR7AzvOIg9YPDJbhh1S+R69R0Hxt339L1Yy8V2Y5llMi3pFM51hLDTGRe/4be958K
         Zx1bBhS3xEaX7Qh9q569dgIbzjSpXDC0f7cnCb1sGeRrYVYpaItcem0VYlUWSmqL0dsS
         DQuLQmsDydWMnNEQrQztqrqgSoI7X8J7q8+/aIlTQEAv/0u6MU4ym6qLpIa1s2x8W31p
         D+PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763089878; x=1763694678;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pk9f+4OOCJ8o6XMs6Vn+C/tafSb+E8hKTE80nWkqEGs=;
        b=MTo9xww2CVPj5VrWrxVxXSKcDmU9sYhvee0QBQkVk9rpMRAdHH+JfbuaEBZfJLeNmt
         /Bos9u/pMBOgjWMfa/UKIPZa5qNq3eboLCWMazTq08EA/Hem99Cz41W5F8kqNGd+Yoy5
         zOtJZYX8d3XdEi5tXut3LZNAlpE1WDd4STm1xz2jpbYqyPl+IfMnMTFb/ETbq6leQ5PE
         OTZjmUwHWufVVeg4sjzSSVjqo9XjcHX1Yrqb34/H7r36cdgEVfYnnAxOb79/eq32tUFd
         ytXBMhOT+j4xkjRiK9mtDqKF1sThx4U2u+XFCfWSrc63qUj7DO4wXa152lTsQPnvLdej
         pXpQ==
X-Gm-Message-State: AOJu0YxSje13Szcil0vQvF0ccjUEevdaLSyU5rNByFT1pKTYZE4DMY4C
	xRw6immwvOTqBa79jb69gbjNmuS4QFSkHAB5p7z1TGF8dqhuxfSaKljRmbzGga8tsk2RzsqgRHF
	nP+EBXvsbMImVbiBiiqjjulTQGFIW16lZc/dt3hpXm8t83vPCuQLL5hpt3olxHHX53A==
X-Gm-Gg: ASbGncvyOiySgJGhJQLdtCi8hg9eITD3vs4i9wHgH2Ae+sYG+K83wBUmPGKVef2u4/m
	iIuO7iRmItApyVmdkcZAq2Ostq+DkW91z4lC35G47e5pA++L6Ir9oy9M5wYTLYaMXVCv+32ZzGi
	jmgn6vGy4oBe029H8qXJxKPcMt5Z6plTHOlWI1PGOWP4HAMtfAi3AXoyFzp9tWD8ohgWplTK8cu
	6tFYgk9iaopze1Y82GT0GUzRG1rjKaMOEE+lhV5ELnirxEDpIm7nLoX3ZN2C4RRhVt/6S3zWzaa
	V1mYvSPp2kRgXUGgFfvN6ZaStwSV8O3ZV1lIE2fEKbJ0Av0vGx/acyCvKO2d4fXBykvIoALlm8M
	Yk4GqumXVL8DncJuEVT5GKqs3L57f+PS0RJdLbwFVy94i16gvTzUs/LA3qQdkGYUBZjRc6NjjQ6
	WvKN+D7sFH
X-Received: by 2002:a05:6a00:a28:b0:7b8:a505:3f40 with SMTP id d2e1a72fcca58-7ba39bea46fmr1958188b3a.13.1763089878011;
        Thu, 13 Nov 2025 19:11:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHlvJ8Y3eFcIbvnW+6xKfF9o6Jc9K8Q7WjAKs60mlokvqs1ICK+dgYQG0Rx29pCLc0XJu2kig==
X-Received: by 2002:a05:6a00:a28:b0:7b8:a505:3f40 with SMTP id d2e1a72fcca58-7ba39bea46fmr1958157b3a.13.1763089877422;
        Thu, 13 Nov 2025 19:11:17 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b92714e298sm3598555b3a.34.2025.11.13.19.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 19:11:16 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 11:09:01 +0800
Subject: [PATCH v6 4/6] media: qcom: iris: Add rotation support for encoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-iris_encoder_enhancements-v6-4-d6d35a92635d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763089858; l=14682;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=oL5dAWu67nMWj9elYY6TpZu6ly6sGSrd/2TbVB1R82s=;
 b=abEyiBogQhkthW8lx3tq4AWXY65TyVN5mRChzo+ve9igAH3vuORG7N0/7kBqdmfD9Lj/zuGPa
 HjY9+QwGfXVC6QEJ2fztnCVgMAl3CALWMOoZla2PeOou/HWbMrkxCzB
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-GUID: QjK9jaORvL6yL4JiRdBmQPZpXm0oalg4
X-Authority-Analysis: v=2.4 cv=Rdidyltv c=1 sm=1 tr=0 ts=69169dd6 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=0PQ7lrkXE1FeiLWnmyUA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: QjK9jaORvL6yL4JiRdBmQPZpXm0oalg4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDAyMyBTYWx0ZWRfX4Ijd6FHnD4NI
 hQ+EnGG+5PTcHAgIIvJ6BnpS01oW5P0dwjk+U0CzntNt7xEItk2TsvGSHO9rD/1F/gCIFpLrgL/
 btZHBo6gxfYr2r3tQAXYwww20zOxK4DwMbkHXnGtnt4uURBKLFbkDQ8m/fpm7g24B5akfKm0jXi
 HE10CSBWv0cs1amYx9WUUWCSfD9DXOJ8qZ5MsN5JTDLFE1RBt3YJwIfa0daOCLu/Q9LyCLLHIOe
 Y5/+oLNG+jA4POw8lHnueNIAnlF7W1x8h488pF/QxaE2BvQhU+H2gcoa5tiFMkhwNRjJNQVn/T1
 s4GQosKfb7LrPuZnUbi0j9efW03z80W3/LtAMlI8Pvycm7XDKk4JdE3zSSkKI+gI80ZIOp43IQ2
 w/QA7wPazlsHm7VGBP6x349WdaQZoA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140023

Add rotation control for encoder, enabling V4L2_CID_ROTATE and handling
 90/180/270 degree rotation.

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Co-developed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 34 +++++++++++++++
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 41 ++++++++++++-----
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  9 ++++
 .../platform/qcom/iris/iris_platform_common.h      |  1 +
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 10 +++++
 drivers/media/platform/qcom/iris/iris_utils.c      |  6 +++
 drivers/media/platform/qcom/iris/iris_utils.h      |  1 +
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 51 +++++++++++++---------
 9 files changed, 123 insertions(+), 31 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index c0b3a09ad3e3dfb0a47e3603a8089cf61390fda8..9c20db9eaa1808941b8d1c9213c7dcd36464b4c7 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -98,6 +98,8 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
 		return B_FRAME_QP_H264;
 	case V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_QP:
 		return B_FRAME_QP_HEVC;
+	case V4L2_CID_ROTATE:
+		return ROTATION;
 	default:
 		return INST_FW_CAP_MAX;
 	}
@@ -185,6 +187,8 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
 		return V4L2_CID_MPEG_VIDEO_H264_B_FRAME_QP;
 	case B_FRAME_QP_HEVC:
 		return V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_QP;
+	case ROTATION:
+		return V4L2_CID_ROTATE;
 	default:
 		return 0;
 	}
@@ -893,6 +897,36 @@ int iris_set_qp_range(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
 				     &range, sizeof(range));
 }
 
+int iris_set_rotation(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	u32 hfi_val;
+
+	switch (inst->fw_caps[cap_id].value) {
+	case 0:
+		hfi_val = HFI_ROTATION_NONE;
+		return 0;
+	case 90:
+		hfi_val = HFI_ROTATION_90;
+		break;
+	case 180:
+		hfi_val = HFI_ROTATION_180;
+		break;
+	case 270:
+		hfi_val = HFI_ROTATION_270;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					     HFI_HOST_FLAGS_NONE,
+					     iris_get_port_info(inst, cap_id),
+					     HFI_PAYLOAD_U32,
+					     &hfi_val, sizeof(u32));
+}
+
 int iris_set_properties(struct iris_inst *inst, u32 plane)
 {
 	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
index 30af333cc4941e737eb1ae83a6944b4192896e23..3ea0a00c7587a516f19bb7307a0eb9a60c856ab0 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.h
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
@@ -32,6 +32,7 @@ int iris_set_min_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_i
 int iris_set_max_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_frame_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_qp_range(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_rotation(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_properties(struct iris_inst *inst, u32 plane);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 94c996c6eeceb36d5e63e3ddb0d402d7138f94c4..84a117e8201c54de2d0b86840cbd9b3dda23f015 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -180,22 +180,36 @@ static int iris_hfi_gen2_set_raw_resolution(struct iris_inst *inst, u32 plane)
 						  sizeof(u32));
 }
 
+static inline u32 iris_hfi_get_aligned_resolution(struct iris_inst *inst, u32 width, u32 height)
+{
+	u32 codec_align = inst->codec == V4L2_PIX_FMT_HEVC ? 32 : 16;
+
+	return (ALIGN(width, codec_align) << 16 | ALIGN(height, codec_align));
+}
+
 static int iris_hfi_gen2_set_bitstream_resolution(struct iris_inst *inst, u32 plane)
 {
 	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
 	u32 port = iris_hfi_gen2_get_port(inst, plane);
 	enum hfi_packet_payload_info payload_type;
-	u32 resolution, codec_align;
+	u32 width, height;
+	u32 resolution;
 
 	if (inst->domain == DECODER) {
-		resolution = inst->fmt_src->fmt.pix_mp.width << 16 |
-			inst->fmt_src->fmt.pix_mp.height;
+		width = inst->fmt_src->fmt.pix_mp.width;
+		height = inst->fmt_src->fmt.pix_mp.height;
+		resolution = iris_hfi_get_aligned_resolution(inst, width, height);
 		inst_hfi_gen2->src_subcr_params.bitstream_resolution = resolution;
 		payload_type = HFI_PAYLOAD_U32;
 	} else {
-		codec_align = inst->codec == V4L2_PIX_FMT_HEVC ? 32 : 16;
-		resolution = ALIGN(inst->enc_scale_width, codec_align) << 16 |
-			ALIGN(inst->enc_scale_height, codec_align);
+		if (is_rotation_90_or_270(inst)) {
+			width = inst->enc_scale_height;
+			height = inst->enc_scale_width;
+		} else {
+			width = inst->enc_scale_width;
+			height = inst->enc_scale_height;
+		}
+		resolution = iris_hfi_get_aligned_resolution(inst, width, height);
 		inst_hfi_gen2->dst_subcr_params.bitstream_resolution = resolution;
 		payload_type = HFI_PAYLOAD_32_PACKED;
 	}
@@ -237,10 +251,17 @@ static int iris_hfi_gen2_set_crop_offsets(struct iris_inst *inst, u32 plane)
 			left_offset = inst->crop.left;
 			top_offset = inst->crop.top;
 		} else {
-			bottom_offset = (ALIGN(inst->enc_scale_height, codec_align) -
-					inst->enc_scale_height);
-			right_offset = (ALIGN(inst->enc_scale_width, codec_align) -
-				       inst->enc_scale_width);
+			if (is_rotation_90_or_270(inst)) {
+				bottom_offset = (ALIGN(inst->enc_scale_width, codec_align) -
+						inst->enc_scale_width);
+				right_offset = (ALIGN(inst->enc_scale_height, codec_align) -
+					       inst->enc_scale_height);
+			} else {
+				bottom_offset = (ALIGN(inst->enc_scale_height, codec_align) -
+						inst->enc_scale_height);
+				right_offset = (ALIGN(inst->enc_scale_width, codec_align) -
+					       inst->enc_scale_width);
+			}
 			left_offset = 0;
 			top_offset = 0;
 		}
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index 1b6a4dbac828ffea53c1be0d3624a033c283c972..53cb1849055364106beaeaf179dd836d9c2e7a3c 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -83,6 +83,15 @@ enum hfi_seq_header_mode {
 };
 
 #define HFI_PROP_SEQ_HEADER_MODE		0x03000149
+
+enum hfi_rotation {
+	HFI_ROTATION_NONE = 0x00000000,
+	HFI_ROTATION_90   = 0x00000001,
+	HFI_ROTATION_180  = 0x00000002,
+	HFI_ROTATION_270  = 0x00000003,
+};
+
+#define HFI_PROP_ROTATION			0x0300014b
 #define HFI_PROP_SIGNAL_COLOR_INFO		0x03000155
 #define HFI_PROP_PICTURE_TYPE			0x03000162
 #define HFI_PROP_DEC_DEFAULT_HEADER		0x03000168
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 8d8cdb56a3c7722c06287d4d10feed14ba2b254c..5337ea836470253130cf47a790abbb023f4d5acd 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -143,6 +143,7 @@ enum platform_inst_fw_cap_type {
 	P_FRAME_QP_HEVC,
 	B_FRAME_QP_H264,
 	B_FRAME_QP_HEVC,
+	ROTATION,
 	INST_FW_CAP_MAX,
 };
 
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index f1f9ee8a93560c0875a396f6197d4b42e3d2612c..5f598d6028077a611d5dcdd453e62676f5c1ae8d 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -586,6 +586,16 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.flags = CAP_FLAG_OUTPUT_PORT,
 		.set = iris_set_u32,
 	},
+	{
+		.cap_id = ROTATION,
+		.min = 0,
+		.max = 270,
+		.step_or_mask = 90,
+		.value = 0,
+		.hfi_id = HFI_PROP_ROTATION,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_rotation,
+	},
 };
 
 static struct platform_inst_caps platform_inst_cap_sm8550 = {
diff --git a/drivers/media/platform/qcom/iris/iris_utils.c b/drivers/media/platform/qcom/iris/iris_utils.c
index e2f1131de43128254d8211343771e657e425541e..cfc5b576ec56bd680c2d0ad34018368ed1011814 100644
--- a/drivers/media/platform/qcom/iris/iris_utils.c
+++ b/drivers/media/platform/qcom/iris/iris_utils.c
@@ -125,3 +125,9 @@ int iris_check_core_mbps(struct iris_inst *inst)
 
 	return 0;
 }
+
+bool is_rotation_90_or_270(struct iris_inst *inst)
+{
+	return inst->fw_caps[ROTATION].value == 90 ||
+		inst->fw_caps[ROTATION].value == 270;
+}
diff --git a/drivers/media/platform/qcom/iris/iris_utils.h b/drivers/media/platform/qcom/iris/iris_utils.h
index 75740181122f5bdf93d64d3f43b3a26a9fe97919..b5705d156431a5cf59d645ce988bc3a3c9b9c5e2 100644
--- a/drivers/media/platform/qcom/iris/iris_utils.h
+++ b/drivers/media/platform/qcom/iris/iris_utils.h
@@ -51,5 +51,6 @@ void iris_helper_buffers_done(struct iris_inst *inst, unsigned int type,
 int iris_wait_for_session_response(struct iris_inst *inst, bool is_flush);
 int iris_check_core_mbpf(struct iris_inst *inst);
 int iris_check_core_mbps(struct iris_inst *inst);
+bool is_rotation_90_or_270(struct iris_inst *inst);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
index db5adadd1b39c06bc41ae6f1b3d2f924b3ebf150..1e54ace966c74956208d88f06837b97b1fd48e17 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -556,6 +556,22 @@ static u32 iris_vpu_dec_scratch1_size(struct iris_inst *inst)
 		iris_vpu_dec_line_size(inst);
 }
 
+static inline u32 iris_vpu_enc_get_bitstream_width(struct iris_inst *inst)
+{
+	if (is_rotation_90_or_270(inst))
+		return inst->fmt_dst->fmt.pix_mp.height;
+	else
+		return inst->fmt_dst->fmt.pix_mp.width;
+}
+
+static inline u32 iris_vpu_enc_get_bitstream_height(struct iris_inst *inst)
+{
+	if (is_rotation_90_or_270(inst))
+		return inst->fmt_dst->fmt.pix_mp.width;
+	else
+		return inst->fmt_dst->fmt.pix_mp.height;
+}
+
 static inline u32 size_bin_bitstream_enc(u32 width, u32 height,
 					 u32 rc_type)
 {
@@ -638,10 +654,9 @@ static inline u32 hfi_buffer_bin_enc(u32 width, u32 height,
 static u32 iris_vpu_enc_bin_size(struct iris_inst *inst)
 {
 	u32 num_vpp_pipes = inst->core->iris_platform_data->num_vpp_pipe;
+	u32 height = iris_vpu_enc_get_bitstream_height(inst);
+	u32 width = iris_vpu_enc_get_bitstream_width(inst);
 	u32 stage = inst->fw_caps[STAGE].value;
-	struct v4l2_format *f = inst->fmt_dst;
-	u32 height = f->fmt.pix_mp.height;
-	u32 width = f->fmt.pix_mp.width;
 	u32 lcu_size;
 
 	if (inst->codec == V4L2_PIX_FMT_HEVC)
@@ -676,9 +691,8 @@ u32 hfi_buffer_comv_enc(u32 frame_width, u32 frame_height, u32 lcu_size,
 
 static u32 iris_vpu_enc_comv_size(struct iris_inst *inst)
 {
-	struct v4l2_format *f = inst->fmt_dst;
-	u32 height = f->fmt.pix_mp.height;
-	u32 width = f->fmt.pix_mp.width;
+	u32 height = iris_vpu_enc_get_bitstream_height(inst);
+	u32 width = iris_vpu_enc_get_bitstream_width(inst);
 	u32 num_recon = 1;
 	u32 lcu_size = 16;
 
@@ -958,9 +972,8 @@ u32 hfi_buffer_non_comv_enc(u32 frame_width, u32 frame_height,
 static u32 iris_vpu_enc_non_comv_size(struct iris_inst *inst)
 {
 	u32 num_vpp_pipes = inst->core->iris_platform_data->num_vpp_pipe;
-	struct v4l2_format *f = inst->fmt_dst;
-	u32 height = f->fmt.pix_mp.height;
-	u32 width = f->fmt.pix_mp.width;
+	u32 height = iris_vpu_enc_get_bitstream_height(inst);
+	u32 width = iris_vpu_enc_get_bitstream_width(inst);
 	u32 lcu_size = 16;
 
 	if (inst->codec == V4L2_PIX_FMT_HEVC) {
@@ -1051,9 +1064,8 @@ u32 hfi_buffer_line_enc_vpu33(u32 frame_width, u32 frame_height, bool is_ten_bit
 static u32 iris_vpu_enc_line_size(struct iris_inst *inst)
 {
 	u32 num_vpp_pipes = inst->core->iris_platform_data->num_vpp_pipe;
-	struct v4l2_format *f = inst->fmt_dst;
-	u32 height = f->fmt.pix_mp.height;
-	u32 width = f->fmt.pix_mp.width;
+	u32 height = iris_vpu_enc_get_bitstream_height(inst);
+	u32 width = iris_vpu_enc_get_bitstream_width(inst);
 	u32 lcu_size = 16;
 
 	if (inst->codec == V4L2_PIX_FMT_HEVC) {
@@ -1069,9 +1081,8 @@ static u32 iris_vpu_enc_line_size(struct iris_inst *inst)
 static u32 iris_vpu33_enc_line_size(struct iris_inst *inst)
 {
 	u32 num_vpp_pipes = inst->core->iris_platform_data->num_vpp_pipe;
-	struct v4l2_format *f = inst->fmt_dst;
-	u32 height = f->fmt.pix_mp.height;
-	u32 width = f->fmt.pix_mp.width;
+	u32 height = iris_vpu_enc_get_bitstream_height(inst);
+	u32 width = iris_vpu_enc_get_bitstream_width(inst);
 	u32 lcu_size = 16;
 
 	if (inst->codec == V4L2_PIX_FMT_HEVC) {
@@ -1292,9 +1303,8 @@ static inline u32 hfi_buffer_scratch1_enc(u32 frame_width, u32 frame_height,
 static u32 iris_vpu_enc_scratch1_size(struct iris_inst *inst)
 {
 	u32 num_vpp_pipes = inst->core->iris_platform_data->num_vpp_pipe;
-	struct v4l2_format *f = inst->fmt_dst;
-	u32 frame_height = f->fmt.pix_mp.height;
-	u32 frame_width = f->fmt.pix_mp.width;
+	u32 frame_height = iris_vpu_enc_get_bitstream_height(inst);
+	u32 frame_width = iris_vpu_enc_get_bitstream_width(inst);
 	u32 num_ref = 1;
 	u32 lcu_size;
 	bool is_h265;
@@ -1390,9 +1400,8 @@ static inline u32 hfi_buffer_scratch2_enc(u32 frame_width, u32 frame_height,
 
 static u32 iris_vpu_enc_scratch2_size(struct iris_inst *inst)
 {
-	struct v4l2_format *f = inst->fmt_dst;
-	u32 frame_width = f->fmt.pix_mp.width;
-	u32 frame_height = f->fmt.pix_mp.height;
+	u32 frame_height = iris_vpu_enc_get_bitstream_height(inst);
+	u32 frame_width = iris_vpu_enc_get_bitstream_width(inst);
 	u32 num_ref = 1;
 
 	return hfi_buffer_scratch2_enc(frame_width, frame_height, num_ref,

-- 
2.43.0


