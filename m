Return-Path: <linux-media+bounces-52689-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GjOCGm/jmm+EQEAu9opvQ
	(envelope-from <linux-media+bounces-52689-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 07:06:33 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B87401332C1
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 07:06:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E47D330D4E46
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 06:05:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7379529B204;
	Fri, 13 Feb 2026 06:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GIu2/Weh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BIQ/qJxs"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7778A299937
	for <linux-media@vger.kernel.org>; Fri, 13 Feb 2026 06:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770962707; cv=none; b=LyzmktpQxC7nvC5cc4PznjIsUy8/6jE2z1QB8KOz0k+cym2j+e2MkP5sInHKfxuZmtJXbJtw1yKIJRjJg1zXzuS+MJ6PcUhjJcckBmNjq7oqxbAi5jTtJieqp0tXYpoL/GMLcIo7jJ3xMOyq6OBxQZLDSH1/YPeHVJ5lUe9g8ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770962707; c=relaxed/simple;
	bh=ySNGbTePnk4va2FMeuQoXD6nEAhOChf7Q7nhI0WTzVM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t7XcDyyz1RkXH3niGCWh+qZU3VrTb0EqiNx1frDJUTbwYr72fwH2L6RlZTlnz/eVpVyJGIBxIbGUp/Tt+Mqp3pyXKCu/eHTulsvx604KO4uXgG4wN2VNbAP+K5q71q8ge5EakvDN56YafSE+nhBkUXgyn81ZQQqjan39mf9PBdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GIu2/Weh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BIQ/qJxs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CLGqgq1068459
	for <linux-media@vger.kernel.org>; Fri, 13 Feb 2026 06:05:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5rVgrXPBo1w7VpG7jZes9WHvYCqoFRDKvkKblghukdk=; b=GIu2/WehLrhgqvmA
	tuTsnhPGQfZAF4DmiFe5pBhYQ03SzkKcFD08fLILn7IATG4BeQaf4DcATNsk7Zc3
	6M8UCGKFaCEuCQhrwtOMofFWYiTXSIZVvmrCWY85Bc+K7JdhXvmbDTzTW3zDD7/K
	ho7S8wnQh7fH7PCdBuI3YlbT+NYAeJ6A+BGOgPNRpw2UisAs7evwxEJzKZAvE0g8
	bZheJYAhpB+kUnO02v++R2vmZJBlgZ5oTTvaXp2MREQCZ09n8eEa0v7bPnqJYjiF
	tq0x215hJFOH7aPw7cA0EwIXWwKmgA2ChS6jM3qxs8FnAl9Hmi8qblSYYBwRu2A3
	EOnaXw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9d09ksvy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Feb 2026 06:05:05 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-824af3c6c0cso443732b3a.3
        for <linux-media@vger.kernel.org>; Thu, 12 Feb 2026 22:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770962705; x=1771567505; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5rVgrXPBo1w7VpG7jZes9WHvYCqoFRDKvkKblghukdk=;
        b=BIQ/qJxslbpiYprojg/zP49/pS8YbBiQN3eU0UO2GCEFnnFfTWigHAAz3B0icFiOXq
         j30ocqcYjGD5Y2MrrVGczFfc58HKUbx82Kt8UhL8iPAChGCK0wRpk4Uc6EEy5LfQ7ALv
         rZwlgikjfULD9MSwwzZZG/O4SESZCK3x2cTkBAALkshKkrLbDoNFxz1eZDn2LV42VOij
         aaQsMnfIU21stvYB5Wx+J2xp8E97qX5b5StKsfxkndwTCZAwqn7MnPjYuhWMMG+iR+aS
         BONREoAR4X+PBQsVZAxhUzBWU0mSi6WaWFuULIviwm1Px9A2u5P+VdJSEE/LlAGHxZ5c
         XKog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770962705; x=1771567505;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5rVgrXPBo1w7VpG7jZes9WHvYCqoFRDKvkKblghukdk=;
        b=cS/xym12GVMRkvjNfPx3+K6OclVhJzXq3Kmkb1sdwym2RysZFKy9qKmfMYvAH3HGwg
         1ylZxyb6wzM+d+Czb2JnTyaop/SY4pHkvTWt0bQaDY1p4D60WauDG/1bIJPzLOOaBkij
         UTZcbw0zUrPQeGfPQDnvUMRLgzjRv/GLuhpIG/5oJ5vxQ548RfKcG0qobFpiHSn3tVeC
         TcMT/4fuKBrECyWe8bUB44AYJcgOtwPI3K1cCCAXPcIV6sQlcE6/r7pxaNjfmd8Gilch
         QJIGYX56WQrmr5rcu96w4ltcrIVaG3ZwhZkxHxpKNg+uttFASupoJJ7gHGyI/2Qse2Fu
         M18w==
X-Gm-Message-State: AOJu0YyxhE1BZM8tbn3ASBiw5jB+udKajqg9SNehIyDP2wcHzdH/NkSa
	sKb0ng6zrTzq5wpB+c+pEJt2zu6mn0klsCeihCVLmr6Ighszq7vDtMv8o0vLd7XvPEzp842ZBtP
	bDr2s/3u7V4Xeb0BQAeFBjx8qn1YdLqrWo+moNZU2tM7H41DiZ6xI2kOCup2ek7gua6mwVyQHGQ
	==
X-Gm-Gg: AZuq6aKdSCLUJIlImMBiJcajh9NY/hBUgJmyNjGlsS0zqkXS0nFNyWrBXoCFXMBa0rw
	feATrSnbT9wq4HNPk5D5BqC1uoa8N5SSlQNyYgRbME0T+o09svCqPZrrg0DEEnntAJZd0dThwt6
	B0p9yd4U8gA6q+SH08zBxF4lahRon+I60QBOpLv0cTruhYN6AM1DGQKidazlMTKm/3G5+fnFg3f
	YVG/WmsEqNWEiBM9ClUrcNnNzE9GWRbqcJQjCMhTLdiK5SVBxX+uHvV0dVnjIEf919Elmsv/QN2
	fwlHeJpfKMdVH/Mq0kQGlbqRJXVDWvYKALhSo7rJqi9Z8yy6idK1ARMkFNCYmN3l3w/hCvsGhQM
	N979sBT0DlUT39p/zJ59C1SctcVKRTucZWgApaqcwBfJkd8YBeAPi
X-Received: by 2002:a05:6a00:139d:b0:824:ae74:571f with SMTP id d2e1a72fcca58-824c963ecb8mr1134494b3a.40.1770962704480;
        Thu, 12 Feb 2026 22:05:04 -0800 (PST)
X-Received: by 2002:a05:6a00:139d:b0:824:ae74:571f with SMTP id d2e1a72fcca58-824c963ecb8mr1134458b3a.40.1770962703915;
        Thu, 12 Feb 2026 22:05:03 -0800 (PST)
Received: from hu-sachinku-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6a2afeesm1342853b3a.2.2026.02.12.22.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 22:05:03 -0800 (PST)
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Date: Fri, 13 Feb 2026 11:34:46 +0530
Subject: [PATCH 2/2] media: iris: add new rate control type MBR for encoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-b4-add_sc7280_mbr-v1-2-e8d95b4e4809@oss.qualcomm.com>
References: <20260213-b4-add_sc7280_mbr-v1-0-e8d95b4e4809@oss.qualcomm.com>
In-Reply-To: <20260213-b4-add_sc7280_mbr-v1-0-e8d95b4e4809@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770962693; l=10637;
 i=sachin.garg@oss.qualcomm.com; s=20260211; h=from:subject:message-id;
 bh=ySNGbTePnk4va2FMeuQoXD6nEAhOChf7Q7nhI0WTzVM=;
 b=zbu9l1HWv1IqnLW/TmEjtUyR6l+6Yn5vaHjf9fiBcB0dsobjYJ9RNge6Pw8Fhn/NvNVu8IXra
 6O1D1NH20ADAH0UpHm+cC0E3RYFSK1i7f56kwM9NUC7gEgxCChx+UXQ
X-Developer-Key: i=sachin.garg@oss.qualcomm.com; a=ed25519;
 pk=KcRhp4CP9cR1V2tg6xSNRnB2STYaU0vVigdUF4Actu0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDA0MyBTYWx0ZWRfX9hMpYTHgXLkY
 RzUrqQQCZ8vbX84moOgQ4sS6iX5n5zpyZXnTYb7PWZ7Hx8kqcL7pFnOdrW8GMgKRXNORKRJBpaq
 q6dcQkW70APzp6jc7RM99flqbi32OMwEtLZYNEjd4Gm1Jr8cEW6jrnMHiroDIfII2cLv1QAHO1o
 U64Og0KSh8qvMKUt2TySIC9I7hsoSugcZli38bVKfvUwBV9u7hAKn268ZYxO2N6FY5F7nwej9su
 ka4dBgDpYoVaHLqwwf3mp7pJL80lobioc9C+ArhHWNGCPD/Mu1wQWn2zRVnV1MNUpKFQ6/hTgTE
 8k1E49O9BpQRIN6pVg9V9aDTmayhk81Pyt2dQDJdQot/YLAHtaY1y4YIW4O1VR0Bancb11r4qPs
 cyoGq+inPogwIK1QZoWnV9+Iztm+HE+sSGlaAFkpDaAG25ATajVQXu7QGaOeLN8XWOlJfZJiV4x
 nTfK3rc1Z1uYNbKeEuw==
X-Proofpoint-GUID: vaTWp-R45F_s1zggCHlXIHGAEn_W2Wyl
X-Authority-Analysis: v=2.4 cv=Y6j1cxeN c=1 sm=1 tr=0 ts=698ebf11 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=WvbiMNAvyKgqmwFEuVYA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: vaTWp-R45F_s1zggCHlXIHGAEn_W2Wyl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_05,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602130043
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-52689-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sachin.garg@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B87401332C1
X-Rspamd-Action: no action

Introduce V4L2_MPEG_VIDEO_BITRATE_MODE_MBR rate control to Encoder.
Encoder will choose appropriate quantization parameter and
do the smart bit allocation to set the frame maximum bitrate
level as per the Bitrate value configured.
---
 drivers/media/platform/qcom/iris/iris_ctrls.c      |   2 +
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |   1 +
 .../media/platform/qcom/iris/iris_platform_gen1.c  |   9 +-
 .../platform/qcom/iris/iris_platform_sc7280.h      | 202 +++++++++++++++++++++
 4 files changed, 207 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 3cec957580f5..dba3a4ba5d26 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -628,6 +628,8 @@ int iris_set_bitrate_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap
 		rc_mode = frame_skip ? HFI_RATE_CONTROL_CBR_VFR : HFI_RATE_CONTROL_CBR_CFR;
 	else if (bitrate_mode == V4L2_MPEG_VIDEO_BITRATE_MODE_CQ)
 		rc_mode = HFI_RATE_CONTROL_CQ;
+	else if (bitrate_mode == V4L2_MPEG_VIDEO_BITRATE_MODE_MBR)
+		rc_mode = HFI_RATE_CONTROL_MBR;
 
 	inst->hfi_rc_type = rc_mode;
 
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
index 42226ccee3d9..6f3688bfbf58 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
@@ -130,6 +130,7 @@
 #define HFI_RATE_CONTROL_VBR_CFR		0x1000003
 #define HFI_RATE_CONTROL_CBR_VFR		0x1000004
 #define HFI_RATE_CONTROL_CBR_CFR		0x1000005
+#define HFI_RATE_CONTROL_MBR			0x1000006
 #define HFI_RATE_CONTROL_CQ				0x1000008
 
 #define HFI_H264_ENTROPY_CAVLC			0x1
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
index df8e6bf9430e..286f623e60d3 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
@@ -15,11 +15,6 @@
 
 #include "iris_platform_sc7280.h"
 
-#define BITRATE_MIN		32000
-#define BITRATE_MAX		160000000
-#define BITRATE_PEAK_DEFAULT	(BITRATE_DEFAULT * 2)
-#define BITRATE_STEP		100
-
 static struct iris_fmt platform_fmts_sm8250_dec[] = {
 	[IRIS_FMT_H264] = {
 		.pixfmt = V4L2_PIX_FMT_H264,
@@ -419,8 +414,8 @@ const struct iris_platform_data sc7280_data = {
 	.inst_caps = &platform_inst_cap_sm8250,
 	.inst_fw_caps_dec = inst_fw_cap_sm8250_dec,
 	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8250_dec),
-	.inst_fw_caps_enc = inst_fw_cap_sm8250_enc,
-	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8250_enc),
+	.inst_fw_caps_enc = inst_fw_cap_sc7280_enc,
+	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sc7280_enc),
 	.tz_cp_config_data = tz_cp_config_sm8250,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8250),
 	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sc7280.h b/drivers/media/platform/qcom/iris/iris_platform_sc7280.h
index 0ec8f334df67..3f220c4c9cc0 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sc7280.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_sc7280.h
@@ -6,6 +6,13 @@
 #ifndef __IRIS_PLATFORM_SC7280_H__
 #define __IRIS_PLATFORM_SC7280_H__
 
+#include "iris_platform_common.h"
+
+#define BITRATE_MIN		32000
+#define BITRATE_MAX		160000000
+#define BITRATE_PEAK_DEFAULT	(BITRATE_DEFAULT * 2)
+#define BITRATE_STEP		100
+
 static const struct bw_info sc7280_bw_table_dec[] = {
 	{ ((3840 * 2160) / 256) * 60, 1896000, },
 	{ ((3840 * 2160) / 256) * 30,  968000, },
@@ -28,4 +35,199 @@ static const char * const sc7280_opp_clk_table[] = {
 	NULL,
 };
 
+static const struct platform_inst_fw_cap inst_fw_cap_sc7280_enc[] = {
+	{
+		.cap_id = STAGE,
+		.min = STAGE_1,
+		.max = STAGE_2,
+		.step_or_mask = 1,
+		.value = STAGE_2,
+		.hfi_id = HFI_PROPERTY_PARAM_WORK_MODE,
+		.set = iris_set_stage,
+	},
+	{
+		.cap_id = PROFILE_H264,
+		.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
+		.max = V4L2_MPEG_VIDEO_H264_PROFILE_MULTIVIEW_HIGH,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
+				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
+				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
+				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_HIGH) |
+				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_STEREO_HIGH) |
+				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_MULTIVIEW_HIGH),
+		.value = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
+		.hfi_id = HFI_PROPERTY_PARAM_PROFILE_LEVEL_CURRENT,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_profile_level_gen1,
+	},
+	{
+		.cap_id = PROFILE_HEVC,
+		.min = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
+		.max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10),
+		.value = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
+		.hfi_id = HFI_PROPERTY_PARAM_PROFILE_LEVEL_CURRENT,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_profile_level_gen1,
+	},
+	{
+		.cap_id = LEVEL_H264,
+		.min = V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
+		.max = V4L2_MPEG_VIDEO_H264_LEVEL_5_1,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_0) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1B) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_1) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_2) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_3) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_0) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_1) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_2) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_0) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_1) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_2) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_0) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_1) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_2) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_0) |
+				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_1),
+		.value = V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
+		.hfi_id = HFI_PROPERTY_PARAM_PROFILE_LEVEL_CURRENT,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_profile_level_gen1,
+	},
+	{
+		.cap_id = LEVEL_HEVC,
+		.min = V4L2_MPEG_VIDEO_HEVC_LEVEL_1,
+		.max = V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_1) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_5) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_6) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_6_1) |
+				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2),
+		.value = V4L2_MPEG_VIDEO_HEVC_LEVEL_1,
+		.hfi_id = HFI_PROPERTY_PARAM_PROFILE_LEVEL_CURRENT,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_profile_level_gen1,
+	},
+	{
+		.cap_id = HEADER_MODE,
+		.min = V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE,
+		.max = V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE) |
+				BIT(V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME),
+		.value = V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME,
+		.hfi_id = HFI_PROPERTY_CONFIG_VENC_SYNC_FRAME_SEQUENCE_HEADER,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_header_mode_gen1,
+	},
+	{
+		.cap_id = BITRATE,
+		.min = BITRATE_MIN,
+		.max = BITRATE_MAX,
+		.step_or_mask = BITRATE_STEP,
+		.value = BITRATE_DEFAULT,
+		.hfi_id = HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_bitrate,
+	},
+	{
+		.cap_id = BITRATE_MODE,
+		.min = V4L2_MPEG_VIDEO_BITRATE_MODE_VBR,
+		.max = V4L2_MPEG_VIDEO_BITRATE_MODE_MBR,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_BITRATE_MODE_VBR) |
+				BIT(V4L2_MPEG_VIDEO_BITRATE_MODE_CBR) |
+				BIT(V4L2_MPEG_VIDEO_BITRATE_MODE_MBR),
+		.value = V4L2_MPEG_VIDEO_BITRATE_MODE_VBR,
+		.hfi_id = HFI_PROPERTY_PARAM_VENC_RATE_CONTROL,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_bitrate_mode_gen1,
+	},
+	{
+		.cap_id = FRAME_SKIP_MODE,
+		.min = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED,
+		.max = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED) |
+				BIT(V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT),
+		.value = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+	},
+	{
+		.cap_id = FRAME_RC_ENABLE,
+		.min = 0,
+		.max = 1,
+		.step_or_mask = 1,
+		.value = 1,
+	},
+	{
+		.cap_id = GOP_SIZE,
+		.min = 0,
+		.max = (1 << 16) - 1,
+		.step_or_mask = 1,
+		.value = 30,
+		.set = iris_set_u32
+	},
+	{
+		.cap_id = ENTROPY_MODE,
+		.min = V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC,
+		.max = V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC) |
+				BIT(V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC),
+		.value = V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC,
+		.hfi_id = HFI_PROPERTY_PARAM_VENC_H264_ENTROPY_CONTROL,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_entropy_mode_gen1,
+	},
+	{
+		.cap_id = MIN_FRAME_QP_H264,
+		.min = MIN_QP_8BIT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MIN_QP_8BIT,
+		.hfi_id = HFI_PROPERTY_PARAM_VENC_SESSION_QP_RANGE_V2,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_qp_range,
+	},
+	{
+		.cap_id = MIN_FRAME_QP_HEVC,
+		.min = MIN_QP_8BIT,
+		.max = MAX_QP_HEVC,
+		.step_or_mask = 1,
+		.value = MIN_QP_8BIT,
+		.hfi_id = HFI_PROPERTY_PARAM_VENC_SESSION_QP_RANGE_V2,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_qp_range,
+	},
+	{
+		.cap_id = MAX_FRAME_QP_H264,
+		.min = MIN_QP_8BIT,
+		.max = MAX_QP,
+		.step_or_mask = 1,
+		.value = MAX_QP,
+		.hfi_id = HFI_PROPERTY_PARAM_VENC_SESSION_QP_RANGE_V2,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_qp_range,
+	},
+	{
+		.cap_id = MAX_FRAME_QP_HEVC,
+		.min = MIN_QP_8BIT,
+		.max = MAX_QP_HEVC,
+		.step_or_mask = 1,
+		.value = MAX_QP_HEVC,
+		.hfi_id = HFI_PROPERTY_PARAM_VENC_SESSION_QP_RANGE_V2,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_qp_range,
+	},
+};
+
 #endif

-- 
2.34.1


