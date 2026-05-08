Return-Path: <linux-media+bounces-60952-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLAnJYE0/mnYnwAAu9opvQ
	(envelope-from <linux-media+bounces-60952-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 21:07:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6704FAF36
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 21:07:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ACEDA30C6ED7
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2026 19:02:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECF4742316B;
	Fri,  8 May 2026 19:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WyYuZ52H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T7qViXSM"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA323F7AAE
	for <linux-media@vger.kernel.org>; Fri,  8 May 2026 19:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778266941; cv=none; b=Mer/usgbUSYqnI+AGQUGj57yJu3E9TCCQ87Xo9MwRtx+Tlo9CTAUq5OtW8SE5SF2Dh12RfjIBo9bAPLgNAjbWa6EK3WsFMQfLa0nOMttMSG4KyUJq2exO3eYUAte40wsQJWfr2m5D7g1ELfk86cw3dY1rq+QnZnzcdHIXa+0BOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778266941; c=relaxed/simple;
	bh=xSTCuduleCdTS3ksmwRYWM8cOaNbocIn1Ie2DQQi3e8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JUSgw2QSCMIlI2FjWg1caW/yG2U22cEZoLMcsSQ/Csz8jLZKDD5UgLp6bbWqdmuUXXSQe+tRIB7xixaaZEI4VC40vg/1Wf0m3NVV7YqFFlJ0ksDBVU9RBw9qMvVGiHMU/MgId7YIhxp3M1/dn2b7g0VV0PsI5d6PdssrRTUVMYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WyYuZ52H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T7qViXSM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648CGq3S852271
	for <linux-media@vger.kernel.org>; Fri, 8 May 2026 19:02:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CX/mLQxL0XM122mOD78xRebannrP0Pl/tNL9f8AVJkY=; b=WyYuZ52HjufpGIos
	+yiGavtnaKFdJEsWGHuMjHU4fSai5vk2WY+LarwyeWYJPuii8uIer4OkNnekvx13
	ut+2/SR2NMAlUUYtYC7Zaenra6m7rMIfOKuH02wIYWYNqulsM1exILeKrEIKabOu
	5iEduw3ygAqC13auVux0LhLKzwChbaLUYWqfHVxasTq+3CMN46sBBAOkVmromFw9
	xX6Zae6TravoAE4T7AUUc74C3L0qsUBAuus/HYVZ3AvTJxz/dua0qtTD3sL31bO4
	bTIRAHigzfd28hv81UzHgQiKXxJXhFv6xMoaENUZYuCyxZfJB9xKKiweyPtj8cs7
	Fi6p1A==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1fpthk6f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 08 May 2026 19:02:18 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f6e6a3a76so2324623b3a.0
        for <linux-media@vger.kernel.org>; Fri, 08 May 2026 12:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778266937; x=1778871737; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CX/mLQxL0XM122mOD78xRebannrP0Pl/tNL9f8AVJkY=;
        b=T7qViXSMOBZ4SGdAFUgqRYRuy+NwvQr0IduO2nn7I7sOzGMpLsXJtGsmcw+DvjaUCP
         0kqBP3BLVkDJgiUHfHSqeWFBVTmQAOHYKEbI39pjyhpr7/mgwQS3PGS2vnccHmBnyEnx
         Jz7Vu4ZHAvnvr26GHhn0MgZuyXAdq9RexhgpXojtwGX8kQvs/EeseMFn3Zb3eFRhSWmO
         jSTU3waIJgmFhc4CuoyesShToDtRNSapyzoxRbEJL3IkB9AzZlbdcaT6cJUnNhmQVbrU
         KkD08HywmgSWNfBO1kFRlJBQiUNqu7rtfMysICuTiDtW32C1Ka5X3DriSpLf4lyLbdu2
         EfpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778266937; x=1778871737;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CX/mLQxL0XM122mOD78xRebannrP0Pl/tNL9f8AVJkY=;
        b=Vn+yV1H86veuZwvERtKd3datF1/fyz0iYUQp7u/LGD8nabwElYfQ2w/MQBg0eK5w/Z
         yxY8+Ef2j/lKCbP92LQ4ZG4ekoqh4o+cxlP42dF6S9nxXgo3ORupZ4DS4pGlgvCdc5q2
         CNf4jyfP6DtbFjlb7u+ngoFeVFvkJG0tTs+cJCAMhLny4EWH3QVq2mUwHYtfl8vEyQwt
         6M5ien8NCcRvGS9CfO1wB/ZgJHrUKctDkSsQ7B2B8ZZyXatUVTdWPi2BTikVRLSHexNC
         QohDCrhD8bx/xeFyjAdvdcD804wHavB0CLdvZrNqXqYlshqtfvnh6dYmWzVn/mUC5hPD
         g4Ug==
X-Forwarded-Encrypted: i=1; AFNElJ++tH4UQfZWWN0G0TeP6oQQk0t8geBJKWhSohmi77KmgpLW26PbqD0Zuf8ZEOrV0hi3CBk6BWUk7NnuVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwG1GbDvvLoNJX2RJ0DSlrnJJrkMjU9DzOeKBaM8zED75hmlJVU
	Y04LkoNfG1ZVh5UquLkprEgk2GvrrIzbsxtPn6bAw2mObkiUMcT8inLFS22suIot4cXZP0eWNUv
	QaAFan/k0Z3Dp1TE6jPlxMQjs0/VYFajYpUq/WseFUthAJdF0IKQDwA+2C5QojctTS0x5Qid7FQ
	==
X-Gm-Gg: AeBDietfEgVjGOQkzknQqHJxLmbng5W1A4ftt1OfFWaO+DpcZ4U88o52kP2TJ/VcYrc
	jdY3Gg+9B2WVWtoHGqxZhToTCimqrSdXWmLnZvga9qPXtVAXd4/6HcPHGXHFeLEO8sYoAcM0K2R
	L5a+DtDRfklLWWKjIFKeTTK3tlYxl3zhrH3R5YoSaiEJuKkS/1CegE08HOh88ErgiP0i+JNUCcb
	VPTsTfleCTfWi+w+x0bOGwZF8mLB6bA3b5g3wlLBJj0bGChxWc/QSTKL+eOfDsx6MLzbOb16lI6
	gWfmL5WY4kEX84hmumXUa/R6rxS6sF4wr0lo29rjlKGTts7jzwxWDUn6XoScc8O0GY9YYrI70kP
	1yhjL1ZmuRt8g443cj/sujAZ56NyFnXOpldvVepQBbtLzwyrfH5GYto0=
X-Received: by 2002:a05:6a00:2411:b0:82c:e0d7:2682 with SMTP id d2e1a72fcca58-83a5df487e9mr13633898b3a.25.1778266937127;
        Fri, 08 May 2026 12:02:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:2411:b0:82c:e0d7:2682 with SMTP id d2e1a72fcca58-83a5df487e9mr13633803b3a.25.1778266936365;
        Fri, 08 May 2026 12:02:16 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965a3e3ecsm13395550b3a.19.2026.05.08.12.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 12:02:15 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sat, 09 May 2026 00:30:00 +0530
Subject: [PATCH v5 11/14] media: iris: Add support to select core for dual
 core platforms
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260509-glymur-v5-11-7fbb340c5dbd@oss.qualcomm.com>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
In-Reply-To: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778266845; l=13228;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=xSTCuduleCdTS3ksmwRYWM8cOaNbocIn1Ie2DQQi3e8=;
 b=Ch8yJ0r7/VA/fvTdggbVVY033Dd8GshfLUvSqE5JorukITqbv6j6Zol6oOvHHxrGusVJYJvpP
 XlV45BZTORxDOKDKHpf3OHok3nfZEADEgb4AEhyOAgcAuLVsMqS0Dbz
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-ORIG-GUID: FMN_wFl8VZ2YRBpqICGlw9-X3x3EYWjA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDE5MCBTYWx0ZWRfX3cs/1Cp2kxB4
 C+FZhrVI+VarypO3NPZ5Q7jaN+pdlnnNGXa/DZLS/74UxNRVzSG5rzGkbn0gsovLQNVpQUkFbrA
 nqNdpF3i2sFGKYMmj2YO8Rs252jLHHUrFxUsNt7KMYzABJR2hwhX1g9L6iv4YM0bas4yDqiLjo0
 oAOlkTP9onawu3rs/Yab+j7DpdWIECOwCEuwZ5tvTd9XswMyU0pGOTNRhwgPxzboleDMeDgJN5x
 F2RKcKsD9ZD2XtDand1PR84T4Tc5vo0SI9Q47chszmo70oQ24aDYvKzIl5/uhqoUL5uxvRbkf/K
 BvDp2dZ7WmVaGGYngwFhvOpLgjjyUbat3wJzbWNVg2DgSQlio/23vDsXyGdfwUyuU8JJsv6+o2a
 d9emFCYQttI4zcJ7n9rs+hbiNbemiUSrnt4nQTCQN5dTFLACU4/yezNwnS/N39qVZvk9HHz78lN
 9sCDjr8Ig8thxTzv7iA==
X-Proofpoint-GUID: FMN_wFl8VZ2YRBpqICGlw9-X3x3EYWjA
X-Authority-Analysis: v=2.4 cv=IYi3n2qa c=1 sm=1 tr=0 ts=69fe333a cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=bXJvY2iSGLnMjMWPEVkA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080190
X-Rspamd-Queue-Id: 3A6704FAF36
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60952-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On platforms with dual vcodec cores, select the hardware core for a
session based on current load. Assign the session to vcodec0 if its
MBPF/MBPS capacity allows it, otherwise assign to vcodec1. Communicate
the selected core to firmware using the new HFI_PROP_CORE_ID property.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_common.c     | 10 +++
 drivers/media/platform/qcom/iris/iris_common.h     |  1 +
 drivers/media/platform/qcom/iris/iris_core.h       |  5 ++
 drivers/media/platform/qcom/iris/iris_hfi_common.h |  1 +
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 19 ++++++
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
 drivers/media/platform/qcom/iris/iris_instance.h   |  2 +
 .../platform/qcom/iris/iris_platform_common.h      |  1 +
 drivers/media/platform/qcom/iris/iris_power.c      | 11 ++--
 drivers/media/platform/qcom/iris/iris_utils.c      | 75 ++++++++++++++++------
 drivers/media/platform/qcom/iris/iris_vb2.c        |  4 ++
 drivers/media/platform/qcom/iris/iris_vidc.c       |  6 +-
 12 files changed, 113 insertions(+), 23 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_common.c b/drivers/media/platform/qcom/iris/iris_common.c
index 7f1c7fe144f7..3b3fc482e194 100644
--- a/drivers/media/platform/qcom/iris/iris_common.c
+++ b/drivers/media/platform/qcom/iris/iris_common.c
@@ -46,6 +46,16 @@ void iris_set_ts_metadata(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf)
 	inst->metadata_idx++;
 }
 
+int iris_set_core_id(struct iris_inst *inst)
+{
+	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+
+	if (!inst->core->iris_platform_data->dual_core)
+		return 0;
+
+	return hfi_ops->session_set_core_id(inst, inst->core_id);
+}
+
 int iris_process_streamon_input(struct iris_inst *inst)
 {
 	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
diff --git a/drivers/media/platform/qcom/iris/iris_common.h b/drivers/media/platform/qcom/iris/iris_common.h
index b2a27b781c9a..34e32c60f768 100644
--- a/drivers/media/platform/qcom/iris/iris_common.h
+++ b/drivers/media/platform/qcom/iris/iris_common.h
@@ -11,6 +11,7 @@ struct iris_buffer;
 
 int iris_vb2_buffer_to_driver(struct vb2_buffer *vb2, struct iris_buffer *buf);
 void iris_set_ts_metadata(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf);
+int iris_set_core_id(struct iris_inst *inst);
 int iris_process_streamon_input(struct iris_inst *inst);
 int iris_process_streamon_output(struct iris_inst *inst);
 int iris_session_streamoff(struct iris_inst *inst, u32 plane);
diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index b396c8cf595e..54a8649841e4 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -30,6 +30,11 @@ enum domain_type {
 	DECODER	= BIT(1),
 };
 
+enum iris_vcodec_core_id {
+	IRIS_VCODEC0 = 1,
+	IRIS_VCODEC1,
+};
+
 /**
  * struct iris_core - holds core parameters valid for all instances
  *
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
index 3edb5ae582b4..fbaf852a6b99 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
@@ -124,6 +124,7 @@ struct iris_hfi_command_ops {
 	int (*session_drain)(struct iris_inst *inst, u32 plane);
 	int (*session_resume_drain)(struct iris_inst *inst, u32 plane);
 	int (*session_close)(struct iris_inst *inst);
+	int (*session_set_core_id)(struct iris_inst *inst, u32 core_id);
 };
 
 struct iris_hfi_response_ops {
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 30bfd90d423b..9d9fae587297 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -1300,6 +1300,24 @@ static int iris_hfi_gen2_session_release_buffer(struct iris_inst *inst, struct i
 					inst_hfi_gen2->packet->size);
 }
 
+static int iris_hfi_gen2_set_core_id(struct iris_inst *inst, u32 core_id)
+{
+	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
+	u32 payload = core_id;
+
+	iris_hfi_gen2_packet_session_command(inst,
+					     HFI_PROP_CORE_ID,
+					     HFI_HOST_FLAGS_NONE,
+					     HFI_PORT_NONE,
+					     inst->session_id,
+					     HFI_PAYLOAD_U32,
+					     &payload,
+					     sizeof(u32));
+
+	return iris_hfi_queue_cmd_write(inst->core, inst_hfi_gen2->packet,
+					inst_hfi_gen2->packet->size);
+}
+
 static const struct iris_hfi_command_ops iris_hfi_gen2_command_ops = {
 	.sys_init = iris_hfi_gen2_sys_init,
 	.sys_image_version = iris_hfi_gen2_sys_image_version,
@@ -1317,6 +1335,7 @@ static const struct iris_hfi_command_ops iris_hfi_gen2_command_ops = {
 	.session_drain = iris_hfi_gen2_session_drain,
 	.session_resume_drain = iris_hfi_gen2_session_resume_drain,
 	.session_close = iris_hfi_gen2_session_close,
+	.session_set_core_id = iris_hfi_gen2_set_core_id,
 };
 
 void iris_hfi_gen2_command_ops_init(struct iris_core *core)
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index cecf771c55dd..600e9dc07669 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -56,6 +56,7 @@
 #define HFI_PROP_BUFFER_HOST_MAX_COUNT		0x03000123
 #define HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT	0x03000124
 #define HFI_PROP_PIC_ORDER_CNT_TYPE		0x03000128
+#define HFI_PROP_CORE_ID			0x030001a9
 
 enum hfi_rate_control {
 	HFI_RC_VBR_CFR		= 0x00000000,
diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index 16965150f427..dd341ca5be57 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -37,6 +37,7 @@ struct iris_fmt {
  *
  * @list: used for attach an instance to the core
  * @core: pointer to core structure
+ * @core_id: specifies the hardware core on which the session runs
  * @session_id: id of current video session
  * @ctx_q_lock: lock to serialize queues related ioctls
  * @lock: lock to seralise forward and reverse threads
@@ -79,6 +80,7 @@ struct iris_fmt {
 struct iris_inst {
 	struct list_head		list;
 	struct iris_core		*core;
+	u32				core_id;
 	u32				session_id;
 	struct mutex			ctx_q_lock;/* lock to serialize queues related ioctls */
 	struct mutex			lock; /* lock to serialize forward and reverse threads */
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 8995136ad29e..502d7099085c 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -258,6 +258,7 @@ struct iris_platform_data {
 	const struct tz_cp_config *tz_cp_config_data;
 	u32 tz_cp_config_data_size;
 	u32 core_arch;
+	bool dual_core;
 	u32 hw_response_timeout;
 	struct ubwc_config_data *ubwc_config;
 	u32 num_vpp_pipe;
diff --git a/drivers/media/platform/qcom/iris/iris_power.c b/drivers/media/platform/qcom/iris/iris_power.c
index 91aa21d4070e..b72ce5b596b8 100644
--- a/drivers/media/platform/qcom/iris/iris_power.c
+++ b/drivers/media/platform/qcom/iris/iris_power.c
@@ -77,9 +77,9 @@ static int iris_vote_interconnects(struct iris_inst *inst)
 
 static int iris_set_clocks(struct iris_inst *inst)
 {
+	u64 vcodec0_freq = 0, vcodec1_freq = 0;
 	struct iris_core *core = inst->core;
 	struct iris_inst *instance;
-	u64 freq = 0;
 	int ret;
 
 	mutex_lock(&core->lock);
@@ -87,11 +87,14 @@ static int iris_set_clocks(struct iris_inst *inst)
 		if (!instance->max_input_data_size)
 			continue;
 
-		freq += instance->power.min_freq;
+		if (instance->core_id == IRIS_VCODEC0)
+			vcodec0_freq += instance->power.min_freq;
+		else
+			vcodec1_freq += instance->power.min_freq;
 	}
 
-	core->power.clk_freq = freq;
-	ret = iris_opp_set_rate(core->dev, freq);
+	core->power.clk_freq = max(vcodec0_freq, vcodec1_freq);
+	ret = iris_opp_set_rate(core->dev, core->power.clk_freq);
 	mutex_unlock(&core->lock);
 
 	return ret;
diff --git a/drivers/media/platform/qcom/iris/iris_utils.c b/drivers/media/platform/qcom/iris/iris_utils.c
index cfc5b576ec56..da8a89d3dd41 100644
--- a/drivers/media/platform/qcom/iris/iris_utils.c
+++ b/drivers/media/platform/qcom/iris/iris_utils.c
@@ -90,40 +90,79 @@ struct iris_inst *iris_get_instance(struct iris_core *core, u32 session_id)
 	return NULL;
 }
 
-int iris_check_core_mbpf(struct iris_inst *inst)
+static u32 iris_get_mbps(struct iris_inst *inst)
 {
-	struct iris_core *core = inst->core;
+	u32 fps = max(inst->frame_rate, inst->operating_rate);
+
+	return iris_get_mbpf(inst) * fps;
+}
+
+static int iris_check_and_assign_core(struct iris_inst *inst, bool mbpf)
+{
+	const struct iris_platform_data *platform_data = inst->core->iris_platform_data;
+	u32 max_load = mbpf ? platform_data->max_core_mbpf : platform_data->max_core_mbps;
+	u32 max_session_cnt = platform_data->max_session_count;
+	u32 core0_session_cnt = 0, core1_session_cnt = 0;
+	bool dual_core = platform_data->dual_core;
+	u32 core0_load = 0, core1_load = 0;
+	bool select_core0, select_core1;
 	struct iris_inst *instance;
-	u32 total_mbpf = 0;
+	u32 load, new_load;
 
-	mutex_lock(&core->lock);
-	list_for_each_entry(instance, &core->instances, list)
-		total_mbpf += iris_get_mbpf(instance);
-	mutex_unlock(&core->lock);
+	inst->core_id = 0;
 
-	if (total_mbpf > core->iris_platform_data->max_core_mbpf)
+	list_for_each_entry(instance, &inst->core->instances, list) {
+		load = mbpf ? iris_get_mbpf(instance) : iris_get_mbps(instance);
+
+		if (instance->core_id == IRIS_VCODEC0) {
+			core0_load += load;
+			core0_session_cnt++;
+		} else if (instance->core_id == IRIS_VCODEC1) {
+			core1_load += load;
+			core1_session_cnt++;
+		}
+	}
+
+	new_load = mbpf ? iris_get_mbpf(inst) : iris_get_mbps(inst);
+
+	select_core0 = core0_load + new_load <= max_load && core0_session_cnt < max_session_cnt;
+	select_core1 = dual_core && core1_load + new_load <= max_load &&
+		     core1_session_cnt < max_session_cnt;
+
+	if (select_core0 && select_core1)
+		inst->core_id = (core0_load <= core1_load) ? IRIS_VCODEC0 : IRIS_VCODEC1;
+	else if (select_core0)
+		inst->core_id = IRIS_VCODEC0;
+	else if (select_core1)
+		inst->core_id = IRIS_VCODEC1;
+	else
 		return -ENOMEM;
 
 	return 0;
 }
 
-int iris_check_core_mbps(struct iris_inst *inst)
+int iris_check_core_mbpf(struct iris_inst *inst)
 {
 	struct iris_core *core = inst->core;
-	struct iris_inst *instance;
-	u32 total_mbps = 0, fps = 0;
+	int ret;
 
 	mutex_lock(&core->lock);
-	list_for_each_entry(instance, &core->instances, list) {
-		fps = max(instance->frame_rate, instance->operating_rate);
-		total_mbps += iris_get_mbpf(instance) * fps;
-	}
+	ret = iris_check_and_assign_core(inst, true);
 	mutex_unlock(&core->lock);
 
-	if (total_mbps > core->iris_platform_data->max_core_mbps)
-		return -ENOMEM;
+	return ret;
+}
 
-	return 0;
+int iris_check_core_mbps(struct iris_inst *inst)
+{
+	struct iris_core *core = inst->core;
+	int ret;
+
+	mutex_lock(&core->lock);
+	ret = iris_check_and_assign_core(inst, false);
+	mutex_unlock(&core->lock);
+
+	return ret;
 }
 
 bool is_rotation_90_or_270(struct iris_inst *inst)
diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
index bf0b8400996e..5a05f7d65501 100644
--- a/drivers/media/platform/qcom/iris/iris_vb2.c
+++ b/drivers/media/platform/qcom/iris/iris_vb2.c
@@ -176,6 +176,10 @@ int iris_vb2_start_streaming(struct vb2_queue *q, unsigned int count)
 	if (ret)
 		goto error;
 
+	ret = iris_set_core_id(inst);
+	if (ret)
+		goto error;
+
 	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
 		if (inst->domain == DECODER)
 			ret = iris_vdec_streamon_input(inst);
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 5eb1786b0737..a1ce3cd524a3 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -41,16 +41,20 @@ static void iris_v4l2_fh_deinit(struct iris_inst *inst, struct file *filp)
 
 static void iris_add_session(struct iris_inst *inst)
 {
+	u32 max_session_count = inst->core->iris_platform_data->max_session_count;
 	struct iris_core *core = inst->core;
 	struct iris_inst *iter;
 	u32 count = 0;
 
+	if (inst->core->iris_platform_data->dual_core)
+		max_session_count *= 2;
+
 	mutex_lock(&core->lock);
 
 	list_for_each_entry(iter, &core->instances, list)
 		count++;
 
-	if (count < core->iris_platform_data->max_session_count)
+	if (count < max_session_count)
 		list_add_tail(&inst->list, &core->instances);
 
 	mutex_unlock(&core->lock);

-- 
2.34.1


