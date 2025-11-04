Return-Path: <linux-media+bounces-46256-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA36CC2FC73
	for <lists+linux-media@lfdr.de>; Tue, 04 Nov 2025 09:13:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4DE8018956FE
	for <lists+linux-media@lfdr.de>; Tue,  4 Nov 2025 08:13:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48552310621;
	Tue,  4 Nov 2025 08:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QkEPgSTC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C2UOVtVJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C064C3128DF
	for <linux-media@vger.kernel.org>; Tue,  4 Nov 2025 08:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762243940; cv=none; b=Tkqk91NMmqVKp+zq5W3eQnCNMW+CIC2Yr/BGhqeSyUaZY484P08R6J/ZeZCqZeMLvKFMJ9g+dS1JlUf2396JnOJJ1NsDHO5NqD22dWoE6hGBzYcZJtJwmT5OeK8NFodfiXXujiFhwuv5wiPgRRydVVFsxyXnhJ+WnjI8IrvfSTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762243940; c=relaxed/simple;
	bh=fJoAPc83wR1LgHrDfr408IQ1A/7ZxGfeFvE/M2rCaic=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uD5qLVrN1adELaO9/AcIkQfRSL7ee6H7fxsk3YSdOPCH3WBC3Ks7TPKLDpOGIAl2V/ABQYshZjaxomuHpE5rFNrh+G//i3pkyagp8W6nbPoFisLAVP/i7Elk8dKGiVKhJd3jeHaiFkstlVS7dFSFBHpVoGX6+OAlYntrGfzuG7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QkEPgSTC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C2UOVtVJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A43aekt3846633
	for <linux-media@vger.kernel.org>; Tue, 4 Nov 2025 08:12:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ovGBUB15DEWLk0DVrQSRCkCYrN6zQfyDDY5aUsiUaHo=; b=QkEPgSTCiDSwM2az
	Ujb/thaUTaAwKqohEi0r2hWpU24E/K+FCqcV5IjCZLybTQlizkFjQVU0xlU2ucnw
	9J6dpa5gUmlmPg8S04g1xI+AToT61YUfcgn2KyDe03Cjb+6o5Hn82DKyV/bAaeCG
	qrdxZEamZykavbxqpvaXVNPBe/Pduc5zb8Ry60FM3IxPwhA0/OBKZueGFEmCggaH
	xwn6kg83Sf/SG+9FNCs5K6Hi6RZSbeKJglejU20zzJO7ClTvYC7OnZlxoEApv8Pd
	TBF3iqVjZl6ZLeK0Lwg/W0c4mziVi60DUoND474SFvGz83W0+H2t84Qirzdvdc9q
	GlPnAw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a70f1j6p8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 04 Nov 2025 08:12:17 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-340bc4ef67fso3967177a91.3
        for <linux-media@vger.kernel.org>; Tue, 04 Nov 2025 00:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762243936; x=1762848736; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ovGBUB15DEWLk0DVrQSRCkCYrN6zQfyDDY5aUsiUaHo=;
        b=C2UOVtVJByiYuhtGesiJQPYyrW2waYodzxBgmQAAW+SisUJMsQWmz+qho33CN1Cep/
         +7iNhmnI35XbBUCTOIyHGWbfm4Fmmwbdxwoe1ShRpD8b4h4fGD9X0RkWuDNmyvpC6XvZ
         /vu75EDFSHsR9F13xYHZ2h0TVRU7vrxWSFkkWPEkEAwv9rAZ/jRMZx9bXUe++bAvW/vq
         bXETcu7H6g/hxd84IIeKxJqKyfXF/f7g02hSj3nCFlNYq5DD0lZAQll7kgoFkyy5F22u
         JCvTfo9QAI3KPoHpGsoZeeCvuW9NbaXnAHj3zC3eRDz5JxvFoj4O8BM20kPTAul5cSsf
         HpcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762243936; x=1762848736;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ovGBUB15DEWLk0DVrQSRCkCYrN6zQfyDDY5aUsiUaHo=;
        b=JDGkUnPL2tjcNKJcHA1PTCkUi58WsCtwUNZ7X3Aja1yEYzAvBkn+6R4qnm3chNGHn+
         /UYnHzMfcbDi+/PXhfVg/nznsomX+1TjhgxjjhGf4qCFBkDLBzu6LsLWkYdvQqMyxIOp
         3lYfQZFvGUTstsXP3ay6ZloC51SUhW1ooy+xQ1GkSEnhyJrMmgh6lLh39cscH56Qd4ph
         AtiTizW4qv6yt8eaAsbV6uDOsGFePY1mTzrgHEt9TwuSF4gq1nsv390Tfs+Dq1a2E5jb
         2CVt83bnwD/xHOr/S17YN15qAVOyUfwLZk62gBOO7TRZKNX1tLdz5itFg0OXCZilhhYz
         qc7Q==
X-Gm-Message-State: AOJu0YzpvlLjdf10XzYq6yxwyVbsR7UfVyECDPlGx2eqDuhCOs9RL9g1
	YUAcDrXkTa+NtmpXX+/RuCdA5wXXTAQdHqzhlPokhOdkgW98vqwjomxUI204eTOhwQ6DkW30CF4
	DzITFPuF+TOdsYZdSvj0QUCqJmJDTlagucONiHTNh7kC/0+3s5NlfNfrhirzxzG4O0g==
X-Gm-Gg: ASbGncviQlwAHDWl87GQKkd6FRoUc9sOC/17VbE/QFZyBjXDKQ465HHqZnRODKLDWza
	VqQtPUthzJROhuGrYr/vgn5xdZoO3yrJ5W3LBGag51xeCyZRVGao3GXs9FZq55gs/D3MzngbBVq
	X9jS/h1iR979juWbNv+Wrn8cjrVeJ9DTA/RTncHt7UUBfUwE1V4WE3P9yexdPzQx6PxAfR7uy/D
	qAy7PPRieF9RNxZn6dnS1vOCVoVILe3ImIzLZtAnRgUoTiO25aAksND7g7sJRyFuSJwnDe6x7SN
	QdXkW8KZ8C6/a0MmiECSpRei8gUQZg0Y3aw4vNJFZNGXNGdlGGqa/yYyUAENWGtIt/gG0dH5UIS
	OQ0+zHfGjXfhSlu/5OS5l0wEcb7YVH8oVuEkY0WUITClPfEK6fPOr427tlJ0nj9ZHAlASS7P/GA
	==
X-Received: by 2002:a17:90b:2b4d:b0:340:ec8f:82d8 with SMTP id 98e67ed59e1d1-340ec8f87fcmr10541867a91.12.1762243936478;
        Tue, 04 Nov 2025 00:12:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE/AabkJTPh5krRwgPsv6Ln4KTaXbwzylXrpyEKBYfRobrKqMA5DOKC9cLklniqODSS0ep+Tg==
X-Received: by 2002:a17:90b:2b4d:b0:340:ec8f:82d8 with SMTP id 98e67ed59e1d1-340ec8f87fcmr10541832a91.12.1762243935969;
        Tue, 04 Nov 2025 00:12:15 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3415a1c2f12sm3601755a91.5.2025.11.04.00.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 00:12:15 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Tue, 04 Nov 2025 16:11:48 +0800
Subject: [PATCH v3 4/5] media: qcom: iris: Add flip support for encoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-iris_encoder_enhancements-v3-4-63b0c431b4d0@oss.qualcomm.com>
References: <20251104-iris_encoder_enhancements-v3-0-63b0c431b4d0@oss.qualcomm.com>
In-Reply-To: <20251104-iris_encoder_enhancements-v3-0-63b0c431b4d0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762243916; l=5542;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=fJoAPc83wR1LgHrDfr408IQ1A/7ZxGfeFvE/M2rCaic=;
 b=XcD4aIGY4/vv3mqzLanPyBWhYQruDFibo9YL1B+7hEEMht/D1FljFmQNW7rVE8UYjrfKUHcHk
 kzAv1Jc88JBAQ6sv8XVJIzelQQoSdBoRBX+5Pde5rDYk3STwbvCC3Lv
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=JLQ2csKb c=1 sm=1 tr=0 ts=6909b561 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=uxdc-9wEpbf47THqrzgA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDA2NiBTYWx0ZWRfXzLWvCJMINk5J
 CPQ65NBNmuirZEWkgBc+NqouphSBkjUZu/t/5BYwFNy0Gg3Up9twsNTGET1ugyu8dwYsZDh2RoN
 AoYf+34gsPuYmuyUAMtQpunZ6aO5hcnzjvN5Ns2ev2dw9W+BB66ShLEc533xDeyKWwaITREwpZT
 A0SAaPWmCPp9Hi7Dp/skN4p6P3aZToeoMWggfkdmsTmOZ2K+NiDfVnYa+r4jGVtJVw1zqKSMg66
 DJth46dOyScfq0c1w4aoH4eMaUGNAvFcge6YFCMIzxU0Nl1UePcy4fxrXDdU+wBWPd1nhsiMVa1
 nqNiRm+SGeYQ1zdA3nJqELekWIUg4cyAROLIJ57qJJvdc/00Zl8LxFI7RMCtjeK2x/PIvZWS6PR
 sQstU6rFmsA8s3/sOJitOIEYZFYg/Q==
X-Proofpoint-ORIG-GUID: x-EDqraLDKTpdGHxh4DDsdYRo0CIOhpd
X-Proofpoint-GUID: x-EDqraLDKTpdGHxh4DDsdYRo0CIOhpd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511040066

Add support for V4L2_CID_HFLIP and V4L2_CID_VFLIP controls in encoder.

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
index 00949c207ddb0203e51df359214bf23c3d8265d0..8f74c12f2f41f23d75424819c707aff61ea61b33 100644
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
@@ -917,6 +925,25 @@ int iris_set_rotation(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
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
index 4edcce7faf5e2f74bfecfdbf574391d5b1c9cca5..0f92468dca91cbb2ca9b451ebce255180066b3a4 100644
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
index 9a4232b1c64eea6ce909e1e311769dd958b84c6e..284d6bde6d6bcdf70016646d1c92e6ae7f067efc 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -141,6 +141,8 @@ enum platform_inst_fw_cap_type {
 	B_FRAME_QP_H264,
 	B_FRAME_QP_HEVC,
 	ROTATION,
+	HFLIP,
+	VFLIP,
 	INST_FW_CAP_MAX,
 };
 
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index c1f83e179d441c45df8d6487dc87e137e482fb63..e74bdd00a4bb2f457ec9352e0acaebc820dae235 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -598,6 +598,28 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
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


