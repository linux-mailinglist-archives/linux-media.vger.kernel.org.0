Return-Path: <linux-media+bounces-44917-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF4FBE92BA
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 16:24:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7B0F95694B1
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 14:19:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07AAF393DD2;
	Fri, 17 Oct 2025 14:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IH+kjjnK"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37AD336EEC
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 14:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760710670; cv=none; b=eo4YW/mtQ9OjfSRiYUqh8UmyCjb4leVQ/4omW2wgTEFhOWAJivbdSy57RVPYP5Pc7sEJ0X78cOXQgXJDd9uVzCrGpVOLrAgy55uwe8ptiuSkNknt5pj1z7MPSyeqFsciSYUo7d9kqocnTsbN5Z7P8C+FnP2EiwaSMMltQJl6Glk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760710670; c=relaxed/simple;
	bh=94zn2oaEs2/tPLmKQcuLmcTARdo0LUWMIIHm7rC4jyI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qoIY7NvWmnYoRFnwEfnnE9mEWqJbZvpL2+JysSbfL7pX56fMco4k3dNfVU953xGaK+jmSIVvOLOTFnESlvY/lNmTAV23gzREDgaWjueMICP1UMyWPGsogDb8EwGI6kF8JhFpesyEyWHzVR7WULb7f7cCLKHKNcLlsAni036bspE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IH+kjjnK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59H8fRCk002682
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 14:17:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZkUetV3KJGXhfQiLm06E+7IVEXhrZeYr95rdHWhTFog=; b=IH+kjjnKhPTI9d7I
	uHwlosNjcSa6+EsiiBnIEhaSsYnUOUXBp91TwSJ3DszSs78yO/towp0XHbjRpuDx
	KrjqoK6HFq+sI+L6Uwlo2aJP5/VJzwa62jAmdkC84V3vksXZ+of9FX8H1k2Ddfkn
	eqNBh9+tp2mNDtoc0TE3UXClIv+SSECUKkqzvXK53PXZ+UzY2tlpejfgWG0zvlyG
	kcUn55iZPerGq73bSk8uIZ4vSnnE8Ya+UKWn7zVJLqzd6ZlyHdJyaZvGWe7DwFn5
	QtX/TSk5cAKZyaVzSL6ShnqHI0xAJtijcG1sbpcLHcL/MwHf93Bf2w8sPnJyd6Tt
	VS/WeQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfd9chtm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 14:17:47 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b60968d52a1so3384025a12.0
        for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 07:17:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760710667; x=1761315467;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZkUetV3KJGXhfQiLm06E+7IVEXhrZeYr95rdHWhTFog=;
        b=QDmCUBpXOvBIls6bY/1ijH+2zb5TGhPBPEtYo120h9lhvguRG6I93KyhdYHhgmZWZp
         ugozlQ7Nc89k6YXBjQjOCh11dg54v01qxeyhkep5zdq7GcF0a5hZSJRvY37cEg3xhfAK
         u3jmUDySD1if2rW6vBm+M8b3zoAMJLHSqH6PdgdOlcA4XOkCPJvk4xmIPRES8TXuy17Y
         IFcWQIj3DQiQcdPjIaKiQRSA3Jko66nBeTgaXkhX6uLxdGTvaHWTW8EgBoCgIsi6+3yB
         NU817027z9Knc880X7Jw4mjFPH41l1Y+iyKUqGSuTko/DXHn8HAGq7Kdab5HZFPu1blV
         60rg==
X-Forwarded-Encrypted: i=1; AJvYcCU8vAMkXnI1rXvgnzfnfUr4ul9BwkfZoXn/zWNf5fY5xBKdhzmg+XSHtuWdBveiAmmJHZMkEID/nQYhOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCPwN4zilXXpbdEHm2y3/pC59nMLgTmxA0whbtotXTwCTK4ZUN
	3xh2TU736mJTziVUva2kMiw98nhq690YVoBcgt2g/bu2slisdM7/wWTjQLV/UY/PbLeGO5IIUrQ
	0RrtyfdGl3qma7jn793Bry3xN3OGoxVAEsSLJUBtlc6ZVXXNfsQvW5m8jB8bA0TVmUg==
X-Gm-Gg: ASbGncvLOiUtJc7tmRKmX0z+EOo+771FopSeejgf7B7VISIf5DQjD69XSAWbSJdYte3
	Kk8jTSOr/Vtd9fpo7JpYxDmpQpHqWD24TquO6lu1OGt4X7x9zXA3XfhUH7lS8tLot/MkWfPGTeG
	FBMyIrGxbkATIF5RaSXvf82iYO3q8LooQJu6heHHtc6+VXSJfo5tEiWSp8oaJ7LSvg7RBU5Yt+Y
	JV6Tmo7/ebAQ3wTwvrK5nzvYYoL+/Dvkgx5FjhQ+/TUP9lkocwT4z0QR2lrsqRZPxp3EECrP3bo
	S6/ku/Z11/MKR04/IYUnh48hESJlADEaGJYYG2BMygokBFequFQMyNAHKd3dQ2NF1uR9TXyt+sX
	AdeWeriY0ynxtClCNsq3ReCknwb+yvbmsHQ==
X-Received: by 2002:a05:6a20:42a3:b0:334:a82b:97d0 with SMTP id adf61e73a8af0-334a84cf411mr4798300637.22.1760710666461;
        Fri, 17 Oct 2025 07:17:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1K0BwIFhCxW9E7gPpQWafSheAdYCei9+vs2ra04WnLUz4ftpn6En0/NIln+gDf3YNJ5bVgA==
X-Received: by 2002:a05:6a20:42a3:b0:334:a82b:97d0 with SMTP id adf61e73a8af0-334a84cf411mr4798226637.22.1760710665576;
        Fri, 17 Oct 2025 07:17:45 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0966d7sm25895826b3a.40.2025.10.17.07.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 07:17:44 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 17 Oct 2025 19:46:29 +0530
Subject: [PATCH v2 8/8] media: iris: Add platform data for kaanapali
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-knp_video-v2-8-f568ce1a4be3@oss.qualcomm.com>
References: <20251017-knp_video-v2-0-f568ce1a4be3@oss.qualcomm.com>
In-Reply-To: <20251017-knp_video-v2-0-f568ce1a4be3@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <quic_bvisredd@quicinc.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760710621; l=8413;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=94zn2oaEs2/tPLmKQcuLmcTARdo0LUWMIIHm7rC4jyI=;
 b=as7o9C9nsEeN8DXB+6qFiEG1BQUd8dRFgYVoGup0byiSf1Y5WMnzktmgq1vC6Ibo6keD2RdjV
 kBSqAIzGCNoATIZQwDSQpS7hcdqjj89jngTXlEAqBRnWOMlu+31ZbBi
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-ORIG-GUID: dQRPRwLWQ6yj24nhq7oW33Rj253NZP9-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX2UFNU5UuskiN
 1O5nLR2pWtnt8L9yFPY1xHkKUj18eYhgOK7veDNJg7I3nOtqa3FqVnxEhQ9wE6auneQETSCULzi
 PFI4D5K55NG926EA+Enwr7PsVTQU84W8WnHA7hJV3g2t92pHTHkTBEuBAGqttwuLylwXK+6qavG
 km6Evwgizx0Pv7ty/sOb6ooJA0o1ZNEYEr22XoBaBZwL5ATcro0SwkuvrqESgPEFd4alVJjKF12
 Iw4x7KZRA+604gJsVhW8qvebr9+CzyNcpJMrWrNAv1uLQBi8kPCc2sXId6m1WHwKPIfo3GZUluH
 CKtj+uwIBV038CY8h82Y7FRIKXeOEhQmWYNBUnwwpw8Xgm9LK7yyU61Byxfl6+fCUEjoxKkTmEa
 M35g06hHUeXDdJa1KR5Lfi/04oHunA==
X-Proofpoint-GUID: dQRPRwLWQ6yj24nhq7oW33Rj253NZP9-
X-Authority-Analysis: v=2.4 cv=PdTyRyhd c=1 sm=1 tr=0 ts=68f2500b cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=253cHNSug-08pUEeBzYA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

Add support for the kaanapali platform by re-using the SM8550
definitions and using the vpu4 ops.
Move the configurations that differs in a per-SoC platform
header, that will contain SoC specific data.

Co-developed-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
Signed-off-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 .../platform/qcom/iris/iris_platform_common.h      |  1 +
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 86 ++++++++++++++++++++++
 .../platform/qcom/iris/iris_platform_kaanapali.h   | 63 ++++++++++++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |  4 +
 4 files changed, 154 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index d6d4a9fdfc189797f903dfeb56d931741b405ee2..f77bad531f067f59b48c3e4caa40a463d454c47e 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -41,6 +41,7 @@ enum pipe_type {
 	PIPE_4 = 4,
 };
 
+extern struct iris_platform_data kaanapali_data;
 extern struct iris_platform_data qcs8300_data;
 extern struct iris_platform_data sm8250_data;
 extern struct iris_platform_data sm8550_data;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 00c6b9021b98aac80612b1bb9734c8dac8146bd9..104c24fd47770dff770a5230cf957d78c89b01f7 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -12,6 +12,7 @@
 #include "iris_vpu_buffer.h"
 #include "iris_vpu_common.h"
 
+#include "iris_platform_kaanapali.h"
 #include "iris_platform_qcs8300.h"
 #include "iris_platform_sm8650.h"
 #include "iris_platform_sm8750.h"
@@ -744,6 +745,91 @@ static const u32 sm8550_enc_op_int_buf_tbl[] = {
 	BUF_SCRATCH_2,
 };
 
+struct iris_platform_data kaanapali_data = {
+	.get_instance = iris_hfi_gen2_get_instance,
+	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
+	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
+	.get_vpu_buffer_size = iris_vpu4x_buf_size,
+	.vpu_ops = &iris_vpu4x_ops,
+	.set_preset_registers = iris_set_sm8550_preset_registers,
+	.icc_tbl = sm8550_icc_table,
+	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
+	.clk_rst_tbl = kaanapali_clk_reset_table,
+	.clk_rst_tbl_size = ARRAY_SIZE(kaanapali_clk_reset_table),
+	.bw_tbl_dec = sm8550_bw_table_dec,
+	.bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
+	.pmdomain_tbl = kaanapali_pmdomain_table,
+	.pmdomain_tbl_size = ARRAY_SIZE(kaanapali_pmdomain_table),
+	.opp_pd_tbl = sm8550_opp_pd_table,
+	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
+	.clk_tbl = kaanapali_clk_table,
+	.clk_tbl_size = ARRAY_SIZE(kaanapali_clk_table),
+	.opp_clk_tbl = kaanapali_opp_clk_table,
+	/* Upper bound of DMA address range */
+	.dma_mask = 0xe0000000 - 1,
+	.fwname = "qcom/vpu/vpu40_p2_s7.mbn",
+	.pas_id = IRIS_PAS_ID,
+	.inst_caps = &platform_inst_cap_sm8550,
+	.inst_fw_caps_dec = inst_fw_cap_sm8550_dec,
+	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
+	.inst_fw_caps_enc = inst_fw_cap_sm8550_enc,
+	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8550_enc),
+	.tz_cp_config_data = tz_cp_config_kaanapali,
+	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_kaanapali),
+	.core_arch = VIDEO_ARCH_LX,
+	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
+	.ubwc_config = &ubwc_config_sm8550,
+	.num_vpp_pipe = 2,
+	.max_session_count = 16,
+	.max_core_mbpf = NUM_MBS_8K * 2,
+	.max_core_mbps = ((8192 * 4352) / 256) * 60,
+	.dec_input_config_params_default =
+		sm8550_vdec_input_config_params_default,
+	.dec_input_config_params_default_size =
+		ARRAY_SIZE(sm8550_vdec_input_config_params_default),
+	.dec_input_config_params_hevc =
+		sm8550_vdec_input_config_param_hevc,
+	.dec_input_config_params_hevc_size =
+		ARRAY_SIZE(sm8550_vdec_input_config_param_hevc),
+	.dec_input_config_params_vp9 =
+		sm8550_vdec_input_config_param_vp9,
+	.dec_input_config_params_vp9_size =
+		ARRAY_SIZE(sm8550_vdec_input_config_param_vp9),
+	.dec_output_config_params =
+		sm8550_vdec_output_config_params,
+	.dec_output_config_params_size =
+		ARRAY_SIZE(sm8550_vdec_output_config_params),
+
+	.enc_input_config_params =
+		sm8550_venc_input_config_params,
+	.enc_input_config_params_size =
+		ARRAY_SIZE(sm8550_venc_input_config_params),
+	.enc_output_config_params =
+		sm8550_venc_output_config_params,
+	.enc_output_config_params_size =
+		ARRAY_SIZE(sm8550_venc_output_config_params),
+
+	.dec_input_prop = sm8550_vdec_subscribe_input_properties,
+	.dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
+	.dec_output_prop_avc = sm8550_vdec_subscribe_output_properties_avc,
+	.dec_output_prop_avc_size =
+		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_avc),
+	.dec_output_prop_hevc = sm8550_vdec_subscribe_output_properties_hevc,
+	.dec_output_prop_hevc_size =
+		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_hevc),
+	.dec_output_prop_vp9 = sm8550_vdec_subscribe_output_properties_vp9,
+	.dec_output_prop_vp9_size =
+		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_vp9),
+
+	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
+	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
+	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
+	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
+
+	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
+	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
+};
+
 struct iris_platform_data sm8550_data = {
 	.get_instance = iris_hfi_gen2_get_instance,
 	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_kaanapali.h b/drivers/media/platform/qcom/iris/iris_platform_kaanapali.h
new file mode 100644
index 0000000000000000000000000000000000000000..247fb9d7cb632d2e9a1e9832d087cb03ac9b7cf3
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_platform_kaanapali.h
@@ -0,0 +1,63 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef __IRIS_PLATFORM_KAANAPALI_H__
+#define __IRIS_PLATFORM_KAANAPALI_H__
+
+#define VIDEO_REGION_VM0_SECURE_NP_ID		1
+#define VIDEO_REGION_VM0_NONSECURE_NP_ID	5
+
+static const char *const kaanapali_clk_reset_table[] = {
+	"bus0",
+	"bus1",
+	"core_freerun_reset",
+	"vcodec0_core_freerun_reset",
+};
+
+static const char *const kaanapali_pmdomain_table[] = {
+	"venus",
+	"vcodec0",
+	"vpp0",
+	"vpp1",
+	"apv",
+};
+
+static const struct platform_clk_data kaanapali_clk_table[] = {
+	{ IRIS_AXI_CLK, "iface" },
+	{ IRIS_CTRL_CLK, "core" },
+	{ IRIS_HW_CLK, "vcodec0_core" },
+	{ IRIS_AXI1_CLK, "iface1" },
+	{ IRIS_CTRL_FREERUN_CLK, "core_freerun" },
+	{ IRIS_HW_FREERUN_CLK, "vcodec0_core_freerun" },
+	{ IRIS_BSE_HW_CLK, "vcodec_bse" },
+	{ IRIS_VPP0_HW_CLK, "vcodec_vpp0" },
+	{ IRIS_VPP1_HW_CLK, "vcodec_vpp1" },
+	{ IRIS_APV_HW_CLK, "vcodec_apv" },
+};
+
+static const char *const kaanapali_opp_clk_table[] = {
+	"vcodec0_core",
+	"vcodec_apv",
+	"vcodec_bse",
+	"core",
+	NULL,
+};
+
+static struct tz_cp_config tz_cp_config_kaanapali[] = {
+	{
+		.cp_start = VIDEO_REGION_VM0_SECURE_NP_ID,
+		.cp_size = 0,
+		.cp_nonpixel_start = 0x01000000,
+		.cp_nonpixel_size = 0x24800000,
+	},
+	{
+		.cp_start = VIDEO_REGION_VM0_NONSECURE_NP_ID,
+		.cp_size = 0,
+		.cp_nonpixel_start = 0x25800000,
+		.cp_nonpixel_size = 0xda400000,
+	},
+};
+
+#endif /* __IRIS_PLATFORM_KAANAPALI_H__ */
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index ad82a62f8b923d818ffe77c131d7eb6da8c34002..a0902f3aaa1ca6021cfd414787da747a6dda1010 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -348,6 +348,10 @@ static const struct dev_pm_ops iris_pm_ops = {
 };
 
 static const struct of_device_id iris_dt_match[] = {
+	{
+		.compatible = "qcom,kaanapali-iris",
+		.data = &kaanapali_data,
+	},
 	{
 		.compatible = "qcom,qcs8300-iris",
 		.data = &qcs8300_data,

-- 
2.34.1


