Return-Path: <linux-media+bounces-47040-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FD2C5B13A
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 04:13:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5279D3BB914
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 03:12:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CE8A2701D9;
	Fri, 14 Nov 2025 03:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i31WRdue";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h14PID4W"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5E926ED3A
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 03:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763089884; cv=none; b=IxeJHCiD2LAjPGkUy+dQOvJtErTgJJmjMOXz+Qvl2FYXtzEM9A6aU5bqCdaSbL+yRfS8WKjpToGh7CxqBSAhdYSI3Fv5sJHyj37GDTVAN6uqG5dqCqc0eTsPLkfHMbF1SzkBwM/rKvT1kX9QWGo1JLHjXTPEcDH7JzEcgZOeXkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763089884; c=relaxed/simple;
	bh=R1p84crC5VtccNS08vkOh+RSw1ieCXi42DlZbvlNRiQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q3Nsgv8CoIz5J1VG9M1pASd+ghiK2A1DLyupvIqVIVyy3fI4JDQT7MEChQt8GUVtn6ODe34Vihh8KKEQA1TE9KePpD1by+5/QmoqdFsU4h42h31ut5iw3OpnJ0jGeg8xqN+qzUb8w37IagYmEESqMnWczt2MZurLQlwUgqb6KoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i31WRdue; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h14PID4W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMaevh1629391
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 03:11:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KEPTF78OVwqVGnBtPdXvR6dY2VzppJKnDtqEv/zDnV0=; b=i31WRdueflMlEqgE
	LVvrwCrTvbiBzMkAkknqZbPk8XID6ZbnKPzYbnRlbHZXfuufdGhbs5XpmFJg99p2
	sINHGaxFqQBvEEUoC4Sa89exGfKKNGPdaGo+rZzz/yu+vhS87+VNtc5PS8Mj+ijt
	2hYf6pZT/MiRg4Y2VFzt0PKpemEjRxHXBEqTZfsucnXqDNBB4CKPYBuV28ZlpNE6
	7ymTndzk8kpqgB92otG81/PLjMRmIRZRLB8oGdpJ+RfbqigZ5DU24yPMKjT2ODVB
	sUWqhHRLWokwZBxZNiYzLQh+IFBuF8dq7HlZtzdWHtz0CDGIFYNXQh9sRJ3wkY/1
	MB8ANQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9d8mug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 03:11:22 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7b96038aa68so1497250b3a.0
        for <linux-media@vger.kernel.org>; Thu, 13 Nov 2025 19:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763089881; x=1763694681; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KEPTF78OVwqVGnBtPdXvR6dY2VzppJKnDtqEv/zDnV0=;
        b=h14PID4W4Te+IxylBy/uTFXoVH+760SW4UNG1JEMSyidRhdSd5oDmo5YOdBzpP/E+8
         b1oAl7oBKCRIX4jHCk6qqEsLl9DjVLclBQBGpTpE/V7urlam0KN0lrrf5Ji/T9C9o7s7
         Nl6hDfwyoGCmCkZGNLL2P0r2vd+gQMlA20MnzM9SIktQTRmv8JyAuwQfACuXfLbiIUqX
         12cCKFaDNlsNOwNkzk8BlTY0Z9YxLaIxv0LLI+M305P0HjoI/VECQorONZtNhvsLaZRT
         ohapqmZYjsFzQEC1HG/QOtKxFwBFSErkPwT9phFeHTGEiidesFI9dYIASt+OBj0e0g7J
         Dcdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763089882; x=1763694682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KEPTF78OVwqVGnBtPdXvR6dY2VzppJKnDtqEv/zDnV0=;
        b=d3xvxTz0Rrgm0j7+AlPTGcLjrU9mT0yplnzo4NsQF/C5mgM7w3kuAcXHjATSsEImNb
         p1fptQ3NPfhNO1gCIkMYQsjx9hzYmt/qYiqcXAGu28YfUgN67jcoXB2D0UDjQx8fhowF
         jLjk3xcs4cRT8ijeSzjjLeD1Kf025B3F9I084vEoHQesl/m3aT8Vf1m/WLXulyydY+PM
         QCGuEsPWzkkAp3sAEiZ2AT1c3DMjpQR8XZbA/ueB/MNf9lI4Bhy7ofU7X5LuOQ4AnKq3
         DdHgjM2qyAZQ8df2B+/Ds8gYxPcF0RwYdkBJgkCzncopyCQmlHpF8TGlaaOXt4gaS5BS
         kdvw==
X-Gm-Message-State: AOJu0YzNu4swlX3xXO7tFbeh6gZO2rh1O93jV/XbmZ5YxB64fgR6PeLv
	niN3z3CpX0g0T4E++nQW9BkDZ4hzwj1+EJSGIfgKGB85rDZMM9JXxVcEyiCVCs186vvE+Tz74zQ
	cRccGSzksK/siOJ0IXTxL/RPnOt/MLFjtx71IX3vOkfRlVEBdeiG93iP47C4GnK9ljA==
X-Gm-Gg: ASbGncvAFzOGr1E1KWEWJiFPr6xtbqCJU8+HT4nm79U5u/AcWULyzWviGYfPDa/J1pH
	TMlhw1ZoE+ubBS5KWwvKFx+4XgOy0sH+GYF83vWbRwT0GpML0pvQk8XCHeQCBKgcrKDtvFt+Vo8
	ziM4zm/x1veqq0SE7sv5qiNq4Jh8wEK8CASFgIn2HStN2ceubMnhE6Vxg8p78bYGYRPVr03vZPh
	TyXLdGsyYd26SHqrLF5eVPz/gl3hOzy3ieDTponcMPYkkgk6ebviTMpCzjv2yQqb45shqSkA7aD
	2GfmDiHmbPgf/kNXZBFkS4eAYZYNs3fiJFlnc6BnmL2QP3kxzyymUkx0gJ/XxAgAUWa8tYJIk4z
	9e7hw1cXkMTS/aRNDbtrDMiyICmRji1LVFsz4yp7fybHkd6JGY2xMJBKwX+hLHdglAhQM0TFD1r
	pxHbKjmjRm
X-Received: by 2002:a05:6a00:2ea6:b0:7ad:1907:5756 with SMTP id d2e1a72fcca58-7ba34972361mr2211645b3a.12.1763089881483;
        Thu, 13 Nov 2025 19:11:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEb9gyVqDbJQjCOvFNJIIMXQ3aA6AoF9yTZf7TpcLO+twFq7yRdsQODTS/Ls/yYidRHBDl3LQ==
X-Received: by 2002:a05:6a00:2ea6:b0:7ad:1907:5756 with SMTP id d2e1a72fcca58-7ba34972361mr2211600b3a.12.1763089880934;
        Thu, 13 Nov 2025 19:11:20 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b92714e298sm3598555b3a.34.2025.11.13.19.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 19:11:20 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 11:09:02 +0800
Subject: [PATCH v6 5/6] media: qcom: iris: Add flip support for encoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-iris_encoder_enhancements-v6-5-d6d35a92635d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763089858; l=5615;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=R1p84crC5VtccNS08vkOh+RSw1ieCXi42DlZbvlNRiQ=;
 b=R22WdADZMZwaGgfSOqDwoTBGjYWYQuN+IIX/gCNyNSdYMaEDylaecFkcU/wKdX/G7lAopY3ZU
 yxMLQfBMelDAffc8RjeHFKN05Amw7Le4yICnagLgtK+2BZFpAQ8CuMI
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-GUID: aki1_rWpwbS9PpEdnJLXY36JaO-moGaw
X-Authority-Analysis: v=2.4 cv=Rdidyltv c=1 sm=1 tr=0 ts=69169dda cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=I7aUD2eJchsgA4-ozh8A:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: aki1_rWpwbS9PpEdnJLXY36JaO-moGaw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDAyMyBTYWx0ZWRfXyGvQ10HZcKPY
 d9m2Z2sb21pDBf/0DjJ93b/Qy8ZW5gaSgo8OWeCDfD1Y6vC5r6taVEmtwiA2Y7Uibm0VlvCQSh2
 5Ht2VTF0oFbXfkgz1yENhLjFtQ1a4WzAbfUT7MJW5TJmSYUPast/4X8+ORl+2b/Ziw0EysoaJhr
 39jssGC1hg7JjHshAZzlxWcVWj5YGcdGd5H3Ln/JVS8Edrs4/HNTeXtefH+82DsAfz1zoGkaZsG
 M/FL89r50E2FopY0+2YibXBo3t9uAz+xBEMYu9CoOEnteseoe5n3wwIzhyMrsIZfnAMP4oWA6+R
 pgNzr0M6scV3+BpohMsDhylsvDNOnLkRbcBa3mXiWiHmMBXCo0j52gaHyHG6WaTMAlxj8xQzUxI
 Lx4tumpiaYxj8Lr5+SaCn64BP0+/8A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140023

Add support for V4L2_CID_HFLIP and V4L2_CID_VFLIP controls in encoder.

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 27 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  8 +++++++
 .../platform/qcom/iris/iris_platform_common.h      |  2 ++
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 22 ++++++++++++++++++
 5 files changed, 60 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 9c20db9eaa1808941b8d1c9213c7dcd36464b4c7..72abf1ccefc9102d54fb25ffdc180d6e51cc5ffe 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -100,6 +100,10 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
 		return B_FRAME_QP_HEVC;
 	case V4L2_CID_ROTATE:
 		return ROTATION;
+	case V4L2_CID_HFLIP:
+		return HFLIP;
+	case V4L2_CID_VFLIP:
+		return VFLIP;
 	default:
 		return INST_FW_CAP_MAX;
 	}
@@ -189,6 +193,10 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
 		return V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_QP;
 	case ROTATION:
 		return V4L2_CID_ROTATE;
+	case HFLIP:
+		return V4L2_CID_HFLIP;
+	case VFLIP:
+		return V4L2_CID_VFLIP;
 	default:
 		return 0;
 	}
@@ -927,6 +935,25 @@ int iris_set_rotation(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
 					     &hfi_val, sizeof(u32));
 }
 
+int iris_set_flip(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	u32 hfi_val = HFI_DISABLE_FLIP;
+
+	if (inst->fw_caps[HFLIP].value)
+		hfi_val |= HFI_HORIZONTAL_FLIP;
+
+	if (inst->fw_caps[VFLIP].value)
+		hfi_val |= HFI_VERTICAL_FLIP;
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					     HFI_HOST_FLAGS_NONE,
+					     iris_get_port_info(inst, cap_id),
+					     HFI_PAYLOAD_U32_ENUM,
+					     &hfi_val, sizeof(u32));
+}
+
 int iris_set_properties(struct iris_inst *inst, u32 plane)
 {
 	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
index 3ea0a00c7587a516f19bb7307a0eb9a60c856ab0..355a592049f3fcc715a1b9df44b4d1398b052653 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.h
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
@@ -33,6 +33,7 @@ int iris_set_max_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_i
 int iris_set_frame_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_qp_range(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_rotation(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_flip(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_properties(struct iris_inst *inst, u32 plane);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index 53cb1849055364106beaeaf179dd836d9c2e7a3c..c9e93d97fb01ec8d9c4b38ea932aae21c1df0943 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -92,6 +92,14 @@ enum hfi_rotation {
 };
 
 #define HFI_PROP_ROTATION			0x0300014b
+
+enum hfi_flip {
+	HFI_DISABLE_FLIP    = 0x00000000,
+	HFI_HORIZONTAL_FLIP = 0x00000001,
+	HFI_VERTICAL_FLIP   = 0x00000002,
+};
+
+#define HFI_PROP_FLIP				0x0300014c
 #define HFI_PROP_SIGNAL_COLOR_INFO		0x03000155
 #define HFI_PROP_PICTURE_TYPE			0x03000162
 #define HFI_PROP_DEC_DEFAULT_HEADER		0x03000168
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 5337ea836470253130cf47a790abbb023f4d5acd..2774b20d0740c445316244edc8399c7ad6a0d798 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -144,6 +144,8 @@ enum platform_inst_fw_cap_type {
 	B_FRAME_QP_H264,
 	B_FRAME_QP_HEVC,
 	ROTATION,
+	HFLIP,
+	VFLIP,
 	INST_FW_CAP_MAX,
 };
 
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 5f598d6028077a611d5dcdd453e62676f5c1ae8d..27ee146b8d4b442ca9b02f09d0eb9ced218d6261 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -596,6 +596,28 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.flags = CAP_FLAG_OUTPUT_PORT,
 		.set = iris_set_rotation,
 	},
+	{
+		.cap_id = HFLIP,
+		.min = 0,
+		.max = 1,
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROP_FLIP,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_flip,
+	},
+	{
+		.cap_id = VFLIP,
+		.min = 0,
+		.max = 1,
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROP_FLIP,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_flip,
+	},
 };
 
 static struct platform_inst_caps platform_inst_cap_sm8550 = {

-- 
2.43.0


