Return-Path: <linux-media+bounces-46062-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 84308C24473
	for <lists+linux-media@lfdr.de>; Fri, 31 Oct 2025 10:54:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1324C1B212F8
	for <lists+linux-media@lfdr.de>; Fri, 31 Oct 2025 09:53:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AD713370F3;
	Fri, 31 Oct 2025 09:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XSXjFdaS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JRjbQsvG"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A4D336EC0
	for <linux-media@vger.kernel.org>; Fri, 31 Oct 2025 09:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761904312; cv=none; b=mizH+iZ1X3vybVAe/I+Iz6dNTMeRnrlyHrR4i9xt19MwMFxaI3un5yRw25IhdMLyDN3tHdDt3ZWRdSyWo4UDO+kd2dkd4sp25MwQZHh6Jvh1ZxsJQ/B4XVDb2epVkoZMyWTea1Eba6PjRM6zJ9MxXgXhODnmXzHzrj9SYv6PYdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761904312; c=relaxed/simple;
	bh=IJkf+YIwrITwSassNOIm3Z8YdfOmrJJE6k+78c9So9k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ImvmG97h4Fw41UfkkhJC4X+p78D3gZsKBqeqXCy3B4h9XXIq98Ru87/3nCGyi5OBukyAvOWEBfMrmPWorlkdp7dNxcnZ/RDtokfGFWeCg3JExmOGkExO6FVxMlqEoueOxkLwAYCSmp8cP2hK76aZUEz4xT+z1K9niC0MRNOIXrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XSXjFdaS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JRjbQsvG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V7pfpV832746
	for <linux-media@vger.kernel.org>; Fri, 31 Oct 2025 09:51:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YI8Yr8bBFNMts1VlPfmxf6DTF8i4ARw9RijhfrG4oGo=; b=XSXjFdaS3dYcq8cw
	LyD7eUTAl0MQDEjs1OO6AUM4DoD1epArloHXugZvIARpFag0VASarqxLj40EeHuA
	Cozo7AOJN3qQ6CCJs+zF9FW9XA3CP5UIIXSjAtRKqRm7Nf0UJjWlohBAdTefEeQJ
	rep3W67tpGwIKZHgtQ8naPAW/z05PwxMKYZHkyV8Rc1KiFxt6O5qVPX2mkpgKSJx
	Bx2bk3HZDn0LEyVMrBgIHxregdXy+UmZw2aoGWAGPV2vpumfg8EnYTjclDP7hH/r
	pkEWLaJFC9WKoIfSb//8FN4f5JiQr3Vtrlpuu+7zZixngv4vFPOfBGhh0nfPC0+y
	q/OpfA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4ffb1sfd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 31 Oct 2025 09:51:50 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2930e2e8e7fso19297515ad.2
        for <linux-media@vger.kernel.org>; Fri, 31 Oct 2025 02:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761904310; x=1762509110; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YI8Yr8bBFNMts1VlPfmxf6DTF8i4ARw9RijhfrG4oGo=;
        b=JRjbQsvGmIoR0QAqwiXuY1eKQ3HenUm0tkxv9R+bfsOxwW63hZIJSzZ1uZm4ZSl6r8
         p13cpSRrv8rvcZw+NZKYgBaOzVq2hcDniEWICEGLLUR02ULimHIKYMpHXALDX+1Hu0c2
         vqqVu5wbmO1nsx0xAv4PMAlxRwxxJ5ZCcLZ+HLHyNxpeS1HK43MQ4Mmb4LZwSQaV4PM2
         9ZRu7LlyMpN27eEGKK4PXDZIx2ZwpWYmdzHK9T7CJSzaWF6hZojrp7G1JHEp26qsSRgY
         NY0oy4gSpZ2iSbAgD0s6F5Lo2Fhe5sUW208Tig9sai6MXZFJKj29wGxLVIHEt2AsbA+b
         qTIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761904310; x=1762509110;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YI8Yr8bBFNMts1VlPfmxf6DTF8i4ARw9RijhfrG4oGo=;
        b=FUxur78PWhJ4lgULzTM1arGuKLXp9Qb4YZQ76K6YgKPwee8BLlAnxqKMdB6B92OAlD
         /U04pG3HZRN4AKcHUQr7vi2VhOjGMEeKpC2rbsxrVFSd8jkHCqzyWRc6j/hRd7jLvd59
         wvrC7aMRQYVookcKZYSgNw92ONsPIWLBqV7ApHC1nPxOJAHzUxMaXCwMMkEMAFv6H+PD
         tcK8j8I/tcxeHkblOlWosnTkkSVWLprsmipQOqxTgy4Ff/mRMiQ/2bVRE0JFjvrCHK+r
         HvN4MXhYSFZXAg3hXA9Z9tGhVBPpS8+EeBnWD1/L9BYmtuy25qb6tJCd0YqgQ62dtxgm
         E5Fw==
X-Gm-Message-State: AOJu0YyZt6scEVNodctNEmyqpsUkEudni2+1psHxMM3EO5fqCPNrdxBa
	cmQUdITtMuATXLZfI0N52teEaRTKA4j00QRxyj88HC65XVgtN+BWATtQSl3JsdYRbzyCGCEf0CS
	uQTkpMCaf/oyEDjvicoR1fuGTQsnYgSuf29nJBPwA3vYfcRiN5V2ijLrU58ficNQ1ew==
X-Gm-Gg: ASbGncs2gjgboKiyiEBszqW2oCzQwqGx2CUfrTYe7yySlbGLK1F/w05lV3Ge0vXaPmn
	KVwewkhX6E6ygOOJg1yimKNe88L8ZW1NpznURIS1tcbApdgbu7fvbHTGtkhhMPGD0OzFBqUI9I9
	0FkIknUusQyZZ4XroX9CVRZ3icsPJnM3pXxiBLxq4C9VFxGfpC7TVNORzT7yCDSvQKz6v6ltKGW
	6C1VA+AIbEGdnkz/YkQ03Xq3NIEcvdRm90UXp0d2y/Qg5d84eaJKApVCpxaScv5vfq2oHkkK2g2
	FPceROFUkLJ9qqg4kPq8iCCIqEVaV27T0soYjHCDGAvg0wJuElpJO1oTF5CNiM4agz45PKuR/DG
	aleJXp8iMHcNv/ITpuHdEjDbcQLcrRwPIle/rWksXhE3uk9D0jQKdAy6znlp16Nc0nM3lEANUwQ
	==
X-Received: by 2002:a17:902:ecd2:b0:295:2cb6:f494 with SMTP id d9443c01a7336-2952cb6f57amr15103105ad.6.1761904309589;
        Fri, 31 Oct 2025 02:51:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsTN996IzqiFwKphs97HCXFiPxo6pwN7H8m2DAtx7ATrx5QxirKCakwpVUtElaFe5wAGkXcw==
X-Received: by 2002:a17:902:ecd2:b0:295:2cb6:f494 with SMTP id d9443c01a7336-2952cb6f57amr15102695ad.6.1761904309042;
        Fri, 31 Oct 2025 02:51:49 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-295268716e4sm17913115ad.9.2025.10.31.02.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 02:51:48 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Fri, 31 Oct 2025 17:50:42 +0800
Subject: [PATCH v2 4/5] media: qcom: iris: Add flip support for encoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-iris_encoder_enhancements-v2-4-319cd75cbb45@oss.qualcomm.com>
References: <20251031-iris_encoder_enhancements-v2-0-319cd75cbb45@oss.qualcomm.com>
In-Reply-To: <20251031-iris_encoder_enhancements-v2-0-319cd75cbb45@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>, quic_qiweil@quicinc.com,
        quic_renjiang@quicinc.com
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761904292; l=5471;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=IJkf+YIwrITwSassNOIm3Z8YdfOmrJJE6k+78c9So9k=;
 b=K35f/ZHVJTu2oQJcWIZut+CcfRQe39O3PZFjqUTVMGrfZhbqbLNHhZhmXkww06vIB17GXEtuj
 9Z+aucb82OrBPB8CBUuSMA4FbjpeQ8jHTWgHNoioguzMTJPQ/TcUTmw
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-GUID: 5uOpCKAoFZiaOCAvOyzeQGjZPk-JaMmT
X-Authority-Analysis: v=2.4 cv=fpjRpV4f c=1 sm=1 tr=0 ts=690486b6 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=uxdc-9wEpbf47THqrzgA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 5uOpCKAoFZiaOCAvOyzeQGjZPk-JaMmT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDA4OSBTYWx0ZWRfXw/Eae3UbgHAt
 ZQY6UIvob2TujuqZUzltpmiCr6wlV+7DPH5YjUQvqX7lCm9cBE//P2HST/yzhGg2nPicWxFsh7u
 E3bYzvfkIRciS4QSaEPYPB2uE7vczK6LOAyEHZ2dgduCKQk5c2yup6mcH560GUAAey7SrUlp5Vi
 KX1pW6kwEyf/hkVIz7QZCqasJAU1CgSqyF6BY9aKoYFv+XP1O3TQctcACmpR9//ddo3vzaIMsGc
 7pQpJEN59kQukKtfv1lBhiWtYcAai4weyfyYUwRn6kyNqRZgidjVVka14wW8VkZl//s9ZUvPZ9g
 6cJo0zRLiVPL6YAaPTWRqQzhf2KABQsyYOelWT4VMGIZXitKliQVyLUnVplWnJCZqseaGHxlVD0
 3eTiWETQPls0VkrEOqG8luazf6GA5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310089

Add support for V4L2_CID_HFLIP and V4L2_CID_VFLIP controls in encoder.

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


