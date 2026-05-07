Return-Path: <linux-media+bounces-60717-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHUhOfwr/GnVMQAAu9opvQ
	(envelope-from <linux-media+bounces-60717-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 08:06:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C3E4E34C9
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 08:06:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A7BEA30022F2
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 06:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0495C33A032;
	Thu,  7 May 2026 06:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bQGKZvPi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e8OESJsk"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7B733B6C8
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 06:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778133970; cv=none; b=U41VAbJDEvOhaiK+xahCrl9dCwhDGzvqT6FbAFBGZaugrkTlN0oox0UMT1h7VnufJT1u22+cbl1xKhR0tnmh/ikprAj+lApRSVER392EgkfSeEKqqYenKGB8Z5e1cWFV/NfNkWSjR8r4zKbXtyRUD8Nb5e307Me0MKqIbmHmbQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778133970; c=relaxed/simple;
	bh=BV76FZTxuR79UwnFLOytW4izwseqS8eIvf/ctGiW7H4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TexFx7XKDxRqA2YRnz525xPS+P0iuKtUHtrPh7weBET/q3L0mfvDCDialD85Fog2li33wJE+IB0pTf6qVXYmi8/s5r289PsdWI4Q22xn89F1Bw8qCTRu7cjuJaWtER5gusJYJWsQddbRXwKZrxf8m0ho7MEoEzzz+aol8jdI+o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bQGKZvPi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e8OESJsk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6475Agp73925083
	for <linux-media@vger.kernel.org>; Thu, 7 May 2026 06:06:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2BEahBxH2nBriswLniQMhEwabckGVQqKY/AzXscAWeo=; b=bQGKZvPiwk6Cr0zH
	DshHHyvUpcPJfWrX1XxFnh8VqF0XNJ0ZzY9s7K+pr3wiZiLuTD5CnGogKC/EO7JL
	OKY0LV7YBp6Hd/n8xMECWegupQwriyLk2q4XOAnbdvXIx0nN94t/fCYyAApfOpLH
	xrbtB2CcsUNhU71qxyvDcwHLTQKnhmnrNdv8nH3RyLA19zcAXydYMcUgafsqaunm
	ipTvDuENYSV+1dkvvzRG0M9cSrNJiLLh1kiyrLyKXDIlviS8IEPClohRR1dm/XKe
	1BXh6daz+8xJhejVG3KIyLcCLtv1fqc4IZ6HhgfQ+F73oKFYPsD4W4pCnfvs4NQQ
	PCiySQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0c889p5u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 07 May 2026 06:06:07 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c70f19f0f37so323750a12.0
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 23:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778133967; x=1778738767; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2BEahBxH2nBriswLniQMhEwabckGVQqKY/AzXscAWeo=;
        b=e8OESJskIPlfPwFOqotlatMkOAD+ZgHap2lq57mqpmEwAjaQQ4CdSpjb/y8MWN52VR
         BWepQ7yEGOkqTIkL+PeaP/R/VdE6eW0J+k4rxbzDnZTM2/HvHEjuSHkNWyJnfw/qzNkS
         sfEOOxJyb4jXlxCbrN5cNs3KskZb2MjvHkFwZ+0tGh7U/dsTuVDx/CXIxWgGh43DfG0A
         iA6fUqnYp2vY+sn2J0Lizzi90gInyqbqMKkm+Oc8Yv7hzJ0Tt3au94O0WrNjeiNazmVn
         encmCp93ZoVsibpaq5KgIFj12H7ipouflXy0ERLHSmc0wQOWP/zEWI2bPIFdaBAy2loD
         t50Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778133967; x=1778738767;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2BEahBxH2nBriswLniQMhEwabckGVQqKY/AzXscAWeo=;
        b=na/37sZ/KYD4SPwphtwHcfQMh2GQfMCWSB7INXBPRP4x+DmimDeUK/ZO6713xnxUa0
         i/nGpYePqwK2MXRvM0R7JOpRw2M5dj/d6IeYRq3YGyM3a9n/NtLhA8CYFCftVO8X3kwk
         U8UvQPeXlw9H5wTLaSY1cOgPZIP1fsDVf6pncesPyCgXRtukgKIMuF76D2AnG7ApdrlW
         cbruc9LmSFd0e+DikNjwXwk7u55Sj+ll2PIBfCuqFgEysMkV4h395f7U0EKCQEJ23cSq
         ln9SmSIWHJrS/TjEKqioMUJcKqpMqB2l4JOYUrlSP4VxtB4cYmVOecmaFgpDROQ/eDCe
         1vIw==
X-Gm-Message-State: AOJu0YyRvqgyldSqWmPOIgFh0IWpPpgA2/bmHm9hS36wUQqaDtULLfbz
	4qxE4fXr0dKlXfnzhZBPAWjH1qf+C/4Gf0slgsFybH1jVs5N4dWDsa8fQJgK63Cz00nPQcNzUDP
	IUbhq2XYQe5i0Y1fVEEuaC/Plqf5PtlUG50IWxPRpSDTmvpMlljeBZa7XCwVdIIMNaw==
X-Gm-Gg: AeBDieskL64lhoauR/Ehhz89Cbg8JC+XUFGgj12tfckgw6FZ+f2pb/22Q+fBy8s3gFc
	Gbw9ASftDlZr5pl1Nc93khkFmSCpSDY7wMMCGvnoPnJbpspqV1Y09X1RNTWAxJZIvj8nQVMpJhE
	JATOpfv2tv2Ef8E3ozKl60gVzsqCdM4Qy4XRft0PQnRkYp84iCujKRybm9BVYVCc1kRBvli07gT
	W2ioeVr5LklJF9jCDGExheMvFpzCCyIb2QKeKa+oq/oNaggb3SqxvyZqamfIyvjX29kLQC7Nnug
	812mUl1yeyz++tZNXnYN4r3WHnWEDlvw6WkLmtH91jJecQqUUnM5iUPHEZfUumFzELCvECaarDj
	LYdvE3MupFNuzUEQs/3M7ty/tg8v+GxjzJCimArarG9GuipcPzFi+e3lbMJpkIG7FBYASuWWOaq
	8GhPhxM2nHbsv6YsCpUOaorOT8iGQOTX2S8Wrc1Ozdew==
X-Received: by 2002:a05:6a21:3399:b0:3a2:edff:2975 with SMTP id adf61e73a8af0-3aa8c1e7570mr1452902637.25.1778133966818;
        Wed, 06 May 2026 23:06:06 -0700 (PDT)
X-Received: by 2002:a05:6a21:3399:b0:3a2:edff:2975 with SMTP id adf61e73a8af0-3aa8c1e7570mr1452870637.25.1778133966270;
        Wed, 06 May 2026 23:06:06 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839685a3187sm7566187b3a.60.2026.05.06.23.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 23:06:05 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Thu, 07 May 2026 14:05:46 +0800
Subject: [PATCH v6 3/5] media: iris: Add platform data for X1P42100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-enable_iris_on_purwa-v6-3-48da505e23bf@oss.qualcomm.com>
References: <20260507-enable_iris_on_purwa-v6-0-48da505e23bf@oss.qualcomm.com>
In-Reply-To: <20260507-enable_iris_on_purwa-v6-0-48da505e23bf@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778133946; l=7932;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=BV76FZTxuR79UwnFLOytW4izwseqS8eIvf/ctGiW7H4=;
 b=vM8sQiLEKUyqFlPkH9n+9mtL4PH53qqLYG2ehDgBYSMOa4vuiR/rgQHDdp4VUM+jFGDtcatal
 n/TzIzvdsjmBb+eTaYFH1ATCwMuGUUYEjVYJRW6D4pVhGOaqMa/wMiM
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-ORIG-GUID: UScK0p1EyadJMTxzvpGWA7Iuvi9GlzbS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA1NyBTYWx0ZWRfX3TANtkwRuzZ4
 4E/+bbsLiEH8fhCO25SDjonC2oF9rYhW0GxwpMwu7awoWkgE6KTHQR6TgEwCzc2SdA8tr9LHCqr
 X8/mBH31azAwW7D6MqWI4TW11P5KK56wiiJC4FgnRTRpHcLy7UeAzdGzghMiIMzS9/gHIXDordi
 S7bWbe7G9O9+GldSsYsUkJHozkSfbteqD/9y0/2tE8I22BrnwNn9IVDPqWWoS6beo69APTtk1Yc
 F+ovbC66qv+YzypZ7gHcPX+6qgzERKWO3jEMyfz9mbRSazscbRAmXMI5vbRuOHg0nv1QCa2956y
 kWBK+4GWR/+zGnCKGzQCeYi3nBJRYXgEGRD2SR9L8iwSU2h1D3TFy1d0dRGO2Ydzk51C/lQsuV2
 raxODIJnw0e2/Fbu+X7mCE/oQcGjaB2AxcMpN/mL/CUc1wra27WuwjQRaqtKe2c8Poex6LEedCl
 cC9udaEq+BgdY14GeCg==
X-Proofpoint-GUID: UScK0p1EyadJMTxzvpGWA7Iuvi9GlzbS
X-Authority-Analysis: v=2.4 cv=X8Zi7mTe c=1 sm=1 tr=0 ts=69fc2bcf cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=jfxm0zpEqxNMAX7I8EwA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070057
X-Rspamd-Queue-Id: 98C3E4E34C9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-60717-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Introduce platform data for X1P42100, derived from SM8550 but using a
different clock configuration and a dedicated OPP setup.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 .../platform/qcom/iris/iris_platform_common.h      |   1 +
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 103 +++++++++++++++++++++
 .../platform/qcom/iris/iris_platform_x1p42100.h    |  22 +++++
 drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
 4 files changed, 130 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 5a489917580eb10022fdcb52f7321a915e8b239d..2e97360ddcd56a4b61fb296782b0c914b6154784 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -47,6 +47,7 @@ extern const struct iris_platform_data sm8250_data;
 extern const struct iris_platform_data sm8550_data;
 extern const struct iris_platform_data sm8650_data;
 extern const struct iris_platform_data sm8750_data;
+extern const struct iris_platform_data x1p42100_data;
 
 enum platform_clk_type {
 	IRIS_AXI_CLK, /* AXI0 in case of platforms with multiple AXI clocks */
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 5da90d47f9c6eab4a7e6b17841fdc0e599397bf7..da1dc76f5bd982d295c25a52ecf9469459a6cb92 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -15,6 +15,7 @@
 #include "iris_platform_qcs8300.h"
 #include "iris_platform_sm8650.h"
 #include "iris_platform_sm8750.h"
+#include "iris_platform_x1p42100.h"
 
 #define VIDEO_ARCH_LX 1
 #define BITRATE_MAX				245000000
@@ -1317,3 +1318,105 @@ const struct iris_platform_data qcs8300_data = {
 	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
 	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
 };
+
+/*
+ * Shares most of SM8550 data except:
+ * - clk_tbl and opp_clk_tbl for x1p42100
+ * - different firmware
+ * - different num_vpp_pipe
+ */
+const struct iris_platform_data x1p42100_data = {
+	.get_instance = iris_hfi_gen2_get_instance,
+	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
+	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
+	.get_vpu_buffer_size = iris_vpu_buf_size,
+	.vpu_ops = &iris_vpu3_ops,
+	.set_preset_registers = iris_set_sm8550_preset_registers,
+	.icc_tbl = sm8550_icc_table,
+	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
+	.clk_rst_tbl = sm8550_clk_reset_table,
+	.clk_rst_tbl_size = ARRAY_SIZE(sm8550_clk_reset_table),
+	.bw_tbl_dec = sm8550_bw_table_dec,
+	.bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
+	.pmdomain_tbl = sm8550_pmdomain_table,
+	.pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
+	.opp_pd_tbl = sm8550_opp_pd_table,
+	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
+	.clk_tbl = x1p42100_clk_table,
+	.clk_tbl_size = ARRAY_SIZE(x1p42100_clk_table),
+	.opp_clk_tbl = x1p42100_opp_clk_table,
+	/* Upper bound of DMA address range */
+	.dma_mask = 0xe0000000 - 1,
+	.fwname = "qcom/vpu/vpu30_1v.mbn",
+	.pas_id = IRIS_PAS_ID,
+	.inst_iris_fmts = platform_fmts_sm8550_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
+	.inst_caps = &platform_inst_cap_sm8550,
+	.inst_fw_caps_dec = inst_fw_cap_sm8550_dec,
+	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
+	.inst_fw_caps_enc = inst_fw_cap_sm8550_enc,
+	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8550_enc),
+	.tz_cp_config_data = tz_cp_config_sm8550,
+	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
+	.core_arch = VIDEO_ARCH_LX,
+	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
+	.ubwc_config = &ubwc_config_sm8550,
+	.num_vpp_pipe = 1,
+	.max_session_count = 16,
+	.max_core_mbpf = NUM_MBS_8K * 2,
+	.max_core_mbps = ((7680 * 4320) / 256) * 60,
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
+	.dec_input_config_params_av1 =
+		sm8550_vdec_input_config_param_av1,
+	.dec_input_config_params_av1_size =
+		ARRAY_SIZE(sm8550_vdec_input_config_param_av1),
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
+	.dec_output_prop_av1 = sm8550_vdec_subscribe_output_properties_av1,
+	.dec_output_prop_av1_size =
+		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_av1),
+
+	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
+	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
+	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
+	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
+
+	.enc_ip_int_buf_tbl = sm8550_enc_ip_int_buf_tbl,
+	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_ip_int_buf_tbl),
+	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
+	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
+};
diff --git a/drivers/media/platform/qcom/iris/iris_platform_x1p42100.h b/drivers/media/platform/qcom/iris/iris_platform_x1p42100.h
new file mode 100644
index 0000000000000000000000000000000000000000..d89acfbc1233dad0692f6c13c3fc22b10e5bdd80
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_platform_x1p42100.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __IRIS_PLATFORM_X1P42100_H__
+#define __IRIS_PLATFORM_X1P42100_H__
+
+static const struct platform_clk_data x1p42100_clk_table[] = {
+	{IRIS_AXI_CLK,		"iface"			},
+	{IRIS_CTRL_CLK,		"core"			},
+	{IRIS_HW_CLK,		"vcodec0_core"		},
+	{IRIS_BSE_HW_CLK,	"vcodec0_bse"		},
+};
+
+static const char *const x1p42100_opp_clk_table[] = {
+	"vcodec0_core",
+	"vcodec0_bse",
+	NULL,
+};
+
+#endif
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index ddaacda523ecb9990af0dd0640196223fbcc2cab..287f615dfa6479964ed68649f2829b5bbeed6cd6 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -374,6 +374,10 @@ static const struct of_device_id iris_dt_match[] = {
 		.compatible = "qcom,sm8750-iris",
 		.data = &sm8750_data,
 	},
+	{
+		.compatible = "qcom,x1p42100-iris",
+		.data = &x1p42100_data,
+	},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, iris_dt_match);

-- 
2.43.0


