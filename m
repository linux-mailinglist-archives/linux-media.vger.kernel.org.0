Return-Path: <linux-media+bounces-46063-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D0061C2448B
	for <lists+linux-media@lfdr.de>; Fri, 31 Oct 2025 10:54:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6ECFE1895C77
	for <lists+linux-media@lfdr.de>; Fri, 31 Oct 2025 09:54:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6114335567;
	Fri, 31 Oct 2025 09:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n/bpTy2X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P16AFVMO"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47949337699
	for <linux-media@vger.kernel.org>; Fri, 31 Oct 2025 09:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761904317; cv=none; b=OfhGRRDYOWxL/aV8YEivFV45CrddZEFfx8pdtj9nu8N1cLr9pplq0/hHbbkqvHMHQL4om2WUHp+jiXh1X6JBcCMDuQ+MC2JDO30BJv1HEB0WvTFP3DkSfZMmVrmr4fXbqmTdJeh6uaN4mkOXrpunjTKD0T9CQdmstDxWOcIEmYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761904317; c=relaxed/simple;
	bh=yXQEX8LNu0TsL9VDTKU5gwOSUNtbhNTnq7C28ggjxog=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iiCiiVdAYffXIrk/x3JM2JKk/KK8iLgYouq3JtRObM9Jg09vEMPTJKLzyJFBTkE224gJfrmvutEDLVvKGlVO3fWQqo3jLnicq5iNRa4gdmdBA+dSbrgIHd7zainNeNMb4XvLKPMp3birobkU5rrh1XMh2dNZjglqshbmTV4VHe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n/bpTy2X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P16AFVMO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V2m4IE102819
	for <linux-media@vger.kernel.org>; Fri, 31 Oct 2025 09:51:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7mUbZvm4xfQOmMBtO789r8Kq5Frjmsno6H4x8WK3gJ4=; b=n/bpTy2XST7oSEfy
	Ppo83Jjbq67eV08S19JwJUWgkhk0HZUyDGSZlJ921pMeePmRqyjamtE1tnIbg9fh
	hmf0R48u+CFQjiXm0DHK5gA+vJDt52JQkeZxeVc58ZShs6G1cnAwhCU8Ze/XCRqA
	2QDtSMvrhHAGyoDAVvbwKfEko6WheXuSdv7lWrQi/tmFR/v+s7t7DRUSXEBDfUtP
	Pk4jVMrvlm/0VaxqE1/m3FdtWJTdSYTjPwRQC65g5VGdGybiurXDyBwwgTDPrFX1
	lFNapuHYkDn/FgqJT7Z16ZslvdwivkjAk0AunLRPcGYCBprprtWTLb/oIJ1u0CWw
	0aWAqA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4ahdjqyd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 31 Oct 2025 09:51:54 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3409a1854cdso631764a91.0
        for <linux-media@vger.kernel.org>; Fri, 31 Oct 2025 02:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761904313; x=1762509113; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7mUbZvm4xfQOmMBtO789r8Kq5Frjmsno6H4x8WK3gJ4=;
        b=P16AFVMOfU/XhaLl8hnHeFEFlqFR+jlol4rnj1M4crJnrnFP0zVgbB5fhkNgVPxiK3
         UbZbKq8nFa0eQrMNiRV7IWxxLwgLNbG8Az8LvyNtjy6S73ovu0bPvpEP/0pcK9oXZxz2
         YCPgbv2plwMO+P56yjD/jNsCOUdztAiUTQm+7BQaZH9gTg5EsQnvutFt+QOMvSr+kx40
         V4ZlMtl6xI86n0bND9oSo308C5bQUN5t+5jN4RdcKBnA3WStajZZ8RgWOzH44+3aJ4G3
         kZ1IYAO175s8aIJ5zQPpl1hkro85FpEJaitXehXvtHav+aT+gnRzF3hTsruf8OY89JEy
         huxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761904313; x=1762509113;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7mUbZvm4xfQOmMBtO789r8Kq5Frjmsno6H4x8WK3gJ4=;
        b=UdCx8vj6B/AmoviDK07cVxSRyG8PkHi8SN9ZpT685YP6XVjA/amx7Ik/yVSU6rR3BH
         u99/61iX/jqIumgRycavzOJrYM1eXgUkbBQjFztCda/CmQ4d5GOtCQQbfiYuCAhpyTlP
         bXR/4o84WZO2QUhp33gzFbpywb/EE7tgyD9vy0LZoLOuOiuelEw7dQbk0XWiz/HHoqRs
         JoxJahzvxEkMcdAAMqXbFnk8XlpRRW0vYpOxmwAuwNXIeBtdPIskKvCNQjitbUaLvj1l
         BaQRqTUcOMbV8O0Y8wenrSu6cY8Y+zuf6gjEntOXNLX0C70Kor+eWoMEObQs0A1qzTyi
         /jbA==
X-Gm-Message-State: AOJu0Ywj5uDU3MkichbDR0STqTRirbTsgcyKsktwFxEGi78Ud/dtdtNj
	t8JeyPa8hui+i6ICt23J1JPtO+qQSsK6/94B6yAi7F1GB9QpSO/8nCR0g1OX570hAdvs0h2zYk3
	/F6Rwg++imO2raURqquaCghUFfjHjZ8uoSS0SvyabgEm17ldYHe/xlj8GIunaOTp4CA==
X-Gm-Gg: ASbGnctbPLjh7DQbs9svafyTVNtCajP2MUpUlGEEwAXoFp3TeTw6eT0kk5EgaSiKwRm
	cvdOwPJ380PHM0+miMP5saEbQBta9B7XwiKSrVZszrVK6Z7ed8vOFTe8A7MAozU/2pRtsjbvyqZ
	mcblFYYGuch/feYvnnnpxOEbudlE3/fCpwrNUO6UXx8is8f2TuoAVHjbcP/hXwW/WjzV9W2Xkv3
	ivZ7kzjhQPZAwfSS1zv0tdkbOUnVIGWuNjJHV6/MgU77h7ZcTPsCbbKZtxUNShwnTLp4Ngj/PdZ
	rsG+0x5vp6A1KWsw1HZVLpPpGIih/7KE/8yhr6gyanIbTkJ17RGxEPVyl3zcw0BzDSoIx6+58TK
	4razO43tPfC6i1AVMS8MBcwcVDUIaCcIAZTbRbbj7R9dCDZkftzFUaPXE0Qo4T0wThjFErAK7QQ
	==
X-Received: by 2002:a17:902:eccd:b0:295:32ea:4ce5 with SMTP id d9443c01a7336-29532ea502fmr9348535ad.6.1761904312945;
        Fri, 31 Oct 2025 02:51:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXe9nQdng38o4OJMobcOH9bnesb6ZHCKFN3tvNJRYZ/D77oNVbQxA4cK+EffDly7a5xbachQ==
X-Received: by 2002:a17:902:eccd:b0:295:32ea:4ce5 with SMTP id d9443c01a7336-29532ea502fmr9348255ad.6.1761904312418;
        Fri, 31 Oct 2025 02:51:52 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-295268716e4sm17913115ad.9.2025.10.31.02.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 02:51:51 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Fri, 31 Oct 2025 17:50:43 +0800
Subject: [PATCH v2 5/5] media: qcom: iris: Add intra refresh support for
 encoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-iris_encoder_enhancements-v2-5-319cd75cbb45@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761904292; l=6258;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=yXQEX8LNu0TsL9VDTKU5gwOSUNtbhNTnq7C28ggjxog=;
 b=xJS+oQadNRx7R2wufglLZFEq4msH9/kXRJxJPCI0aNVjGHXc6OGbeZe+MIKIEOuHmUvQg1fhA
 9JUVktI7blHCQcRUWg7/286uLaFx8Vec9vxVeZL5ocLW/3i4CFCbR+h
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDA4OSBTYWx0ZWRfXzS4qd2zwydUx
 jq5zitS1JZE6nR/2b4nbCALCI8nKmKuUSX9YxMZX1EczAJnw91QQEA2qlIc6EVXZNNBBKKhRVHK
 l9pjlokB9+DKbFe+j1x0ZhyfQ6ip3pyp3eDZPLUHmnH5SMxrM0SrldztXn38o72D2ViwznzrQo/
 uuTlDz5RuZy/8PWXY9ZY8nQefY5uiXqXy5O8hEBSbDAOhMwpIEseyuNrIkkQjUgfEF2DCtfeGTg
 CUOWscQcAy7bCpLGHPD95CvqpNiSOwfsykhy4cwp9fuif2QVRMD7TKViIkNGW6TtGzoelU+wy8q
 AEDMVeGCUN6NNcJjf6uExo9fq2u6leYlsehI6gd2LeaNk3QbEqd8lw34aTfkkbRSUVPovE0IonP
 cT8j1qIt8tb5EtB1PMSq2Y2f7HiAtQ==
X-Proofpoint-GUID: eG47rAZsbSqBMu8FmgJajO1fx7Cj5hUm
X-Authority-Analysis: v=2.4 cv=TsnrRTXh c=1 sm=1 tr=0 ts=690486ba cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=-vM60OG-bLC5KXgFrusA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: eG47rAZsbSqBMu8FmgJajO1fx7Cj5hUm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510310089

Add support for V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD and
V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE controls.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 33 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  2 ++
 .../platform/qcom/iris/iris_platform_common.h      |  2 ++
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 19 +++++++++++++
 5 files changed, 57 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 8f74c12f2f41f23d75424819c707aff61ea61b33..14891569247318aaa7b2009b737f077d1cb45095 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -104,6 +104,10 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
 		return HFLIP;
 	case V4L2_CID_VFLIP:
 		return VFLIP;
+	case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE:
+		return IR_TYPE;
+	case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD:
+		return IR_PERIOD;
 	default:
 		return INST_FW_CAP_MAX;
 	}
@@ -197,6 +201,10 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
 		return V4L2_CID_HFLIP;
 	case VFLIP:
 		return V4L2_CID_VFLIP;
+	case IR_TYPE:
+		return V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE;
+	case IR_PERIOD:
+		return V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD;
 	default:
 		return 0;
 	}
@@ -944,6 +952,31 @@ int iris_set_flip(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 					     &hfi_val, sizeof(u32));
 }
 
+int iris_set_ir_period(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	struct vb2_queue *q = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
+	u32 ir_period = inst->fw_caps[cap_id].value;
+	u32 ir_type = 0;
+
+	if (inst->fw_caps[IR_TYPE].value ==
+			V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM) {
+		if (vb2_is_streaming(q))
+			return 0;
+		ir_type = HFI_PROP_IR_RANDOM_PERIOD;
+	} else if (inst->fw_caps[IR_TYPE].value ==
+			V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_CYCLIC) {
+		ir_type = HFI_PROP_IR_CYCLIC_PERIOD;
+	} else
+		return -EINVAL;
+
+	return hfi_ops->session_set_property(inst, ir_type,
+					     HFI_HOST_FLAGS_NONE,
+					     iris_get_port_info(inst, cap_id),
+					     HFI_PAYLOAD_U32,
+					     &ir_period, sizeof(u32));
+}
+
 int iris_set_properties(struct iris_inst *inst, u32 plane)
 {
 	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
index 355a592049f3fcc715a1b9df44b4d1398b052653..9518803577bc39f5c1339a49878dd0c3e8f510ad 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.h
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
@@ -34,6 +34,7 @@ int iris_set_frame_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
 int iris_set_qp_range(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_rotation(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_flip(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_ir_period(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_properties(struct iris_inst *inst, u32 plane);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index 0f92468dca91cbb2ca9b451ebce255180066b3a4..9e8fdddf2aef439e7f133c9bb2fafa6d95062b02 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -70,6 +70,7 @@ enum hfi_rate_control {
 #define HFI_PROP_QP_PACKED			0x0300012e
 #define HFI_PROP_MIN_QP_PACKED			0x0300012f
 #define HFI_PROP_MAX_QP_PACKED			0x03000130
+#define HFI_PROP_IR_RANDOM_PERIOD		0x03000131
 #define HFI_PROP_TOTAL_BITRATE			0x0300013b
 #define HFI_PROP_MAX_GOP_FRAMES			0x03000146
 #define HFI_PROP_MAX_B_FRAMES			0x03000147
@@ -108,6 +109,7 @@ enum hfi_flip {
 #define HFI_PROP_BUFFER_MARK			0x0300016c
 #define HFI_PROP_RAW_RESOLUTION		0x03000178
 #define HFI_PROP_TOTAL_PEAK_BITRATE		0x0300017C
+#define HFI_PROP_IR_CYCLIC_PERIOD		0x0300017E
 #define HFI_PROP_COMV_BUFFER_COUNT		0x03000193
 #define HFI_PROP_END				0x03FFFFFF
 
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 284d6bde6d6bcdf70016646d1c92e6ae7f067efc..30b98e769ad34c2b63dd63e7714bfeaa5b4f162c 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -143,6 +143,8 @@ enum platform_inst_fw_cap_type {
 	ROTATION,
 	HFLIP,
 	VFLIP,
+	IR_TYPE,
+	IR_PERIOD,
 	INST_FW_CAP_MAX,
 };
 
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index e74bdd00a4bb2f457ec9352e0acaebc820dae235..ce54aac766e2bf76fa2de64c884724ca63f05dcb 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -620,6 +620,25 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 			CAP_FLAG_DYNAMIC_ALLOWED,
 		.set = iris_set_flip,
 	},
+	{
+		.cap_id = IR_TYPE,
+		.min = V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM,
+		.max = V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_CYCLIC,
+		.step_or_mask = BIT(V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM) |
+			BIT(V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_CYCLIC),
+		.value = V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+	},
+	{
+		.cap_id = IR_PERIOD,
+		.min = 0,
+		.max = INT_MAX,
+		.step_or_mask = 1,
+		.value = 0,
+		.flags = CAP_FLAG_OUTPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_ir_period,
+	},
 };
 
 static struct platform_inst_caps platform_inst_cap_sm8550 = {

-- 
2.43.0


