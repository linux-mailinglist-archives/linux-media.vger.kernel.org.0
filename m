Return-Path: <linux-media+bounces-59951-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8LpvA0PN8WlckgEAu9opvQ
	(envelope-from <linux-media+bounces-59951-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 11:20:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E8D491C02
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 11:20:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AE6AE3030149
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 09:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8799B3C2770;
	Wed, 29 Apr 2026 09:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n9C3ic/B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BdfpNIxF"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA29397689
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 09:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777454222; cv=none; b=Cf/bdLNx3Pcgk9dG6qhqKRUPyHvNs7+b6lbjsetWHUbTqTvl8/Nq/W5hIMeHA8FEneIgOV50lGo5APIKljQ/HT0L+m+VxbJECn0cGmEwMKf2k9RKg+p6uxNJegG4LQVOgVyBs3IyryKYQIHd25mxAyIOxa1SHv+Svv0FDj8AEMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777454222; c=relaxed/simple;
	bh=1SuR6UH2DsN7PTT/NUCgzSGsYpfp8unFOGhnizEc+WA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jJIup6iodkcwfOwEZK/FaaPfB8HKBWhfSxxJsg0Cz12CpOchWCb3NxTu0ZY0n1HXjmf4qZhA9DyvbkFKG+oXoKChjN4kyZKmc1X950/d8Vs0MrfoJ1LxQZNDZIRDZMRlsKq98RiHiJPeyARFpVxM+34akbckMHkR5R01BbVjNCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n9C3ic/B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BdfpNIxF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8qjQK2016320
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 09:17:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aHuTkaAZtY5ZkKn7XTvSxnz29uYRoxbW0NTxEIzBxS4=; b=n9C3ic/Bv5HcPC3Y
	tMICNSpH66R+6cuMAxdyoddld3fN3zFgfydWns2/OeLFpktmyXisxWb0FM9dtY1A
	pd1cUOTE8ukuXEcweUvaWlVobHganl70swB1PDly7ewCzTA6uyA6XKa5GUPxotAB
	fpPfiwK4NRSp2SQbj82VlpIaycDtFoS3X8IBHO2jBUzJYO240k2ySzElNUt7vbac
	VqNhN10oZIttmL2leHeFWwKwB1M5iiJ2Kr0T6y1GRzm5Ks5bO+Qdz5X2kioG/rP3
	B+SNNmPi7zvcVg04gPgiZWy9jG47XFn3UYDxGGtCJzSiJtDIwdlU0Ez7BorjRHZ0
	2rfLJw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du1eeb21q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 09:16:59 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c76cb2dce57so7677531a12.1
        for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 02:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777454219; x=1778059019; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aHuTkaAZtY5ZkKn7XTvSxnz29uYRoxbW0NTxEIzBxS4=;
        b=BdfpNIxF3Sz/FKm3jJINYqiKkOPH18cCRkIHXmgRfjsrs5/+0SlI2yOKE0Nyh//Oxo
         9diMtnahjDsj6VSA7wQwJcPP+MzbmGgmg0ecYXZ9rVm1NaDEs7TI94Ye0s0O2NIU3r2+
         QfoRD2b8fZ/xEMSwrUrZaywvUHuxMfP5VK175Ke2d1NxVOk74v7gs4XiLw4JjrqeOkPD
         /WzzcRG2rgVfxU7Y0YGaH8yu4JVG1lAElMCOFORbtUpMPxHfJzT9dTzWTkw7faXp4+KT
         fO8B+W9QvgfWoNBs68GiZ9eOU368hZrb+K8rMEmSJ6duEehi81X3GmRojCQOiUICMAyJ
         8EyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777454219; x=1778059019;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aHuTkaAZtY5ZkKn7XTvSxnz29uYRoxbW0NTxEIzBxS4=;
        b=jhE+ee5iFE7rxAvEVr0x0NvWWRwMgTdKhcWUxmAFhW+iwelp40cqjJclRrOUcADYvz
         b41gpKpYkINhg0iF7qmnuxrMFuzRyB1lp8ma9eKEBr8twn+bWvk6e3HcM6otNjLvsszF
         omn35Pv4Xw63ld/4n4x4CBFcEGAeSxPg8pU2beMtgG2Li5BfhjmLR6UB9zfrDq9Zt9gF
         U3Qo1nyy3jejHsRWQfRKuwMCIZPYnV8C7E+xJYCI9dLN9zaoS+6RpFHWgpRZeFiJsmLk
         NOovWSLe+J4qpiXJBGl7I+2yT5vy027JBpn0VaH4lzKPR3zP0tCaXEjDdxVYZZudRIJ2
         DLUg==
X-Forwarded-Encrypted: i=1; AFNElJ8wWSGeAM/r5WiHIUBOjJiDzKx/hD0Z/QlbQ90So1rPzvJIvoPqNxnrmDSE3PyOqkA3vDTLdy7Rn/fmRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1ZOBTdMcFfiwhlHN1Ais3XaLK5L0K+8v31HclN00A0OAUepVV
	K1Gr+EgM4UZnaRWsXR70Kv12vXftnRZ0WZrPpXRmaO6kvO5zRigsIC0Kg3Sq3U4T2vJDuAylRnK
	sd0accQj/2Hq4NSohMDD2cm3qFDKEKmhk+J2CQs31rdAYGM4IEdaSeEb+Zh+U8OaD7A==
X-Gm-Gg: AeBDiesgLlpP53Xpko5AaNhVy52niSlWfXPtmcdRkqCxsjMWn6AJ/1ZIhDTgJ8CJlMw
	+/0jjEAD7PCkyktQHZiiRAydATnHNYVW/SgV+1P413qyy7smWGePUdpE8XQsgNgicTINPJlNO1+
	XRPX0wjPGsNTyecAjo1DVG3jc6shH8xrbfCBuWgelQvR+mptgDHtSFV1tGK/xYK/9spf5etPL6V
	bW8Bqpe+zU2x/MinNKY0qUGLuHAlARbuV/EvE+VNhFHubMrOKy2Jyy9siYOmcjMdbPMe0/47uKi
	bO2mp7G3Fj43EVS+OehCZyo2i4PJeBzCPtEk9XXP5d28uXwazIA1JkcVv30igI+R4o/q2OAqu0X
	GPUlc5HrOomv+A/Rx72aPKj3JvF56nUSQ6s7pjaTDcPJ+hd7gt0xW1w2k4hh1AqLALjx1NloKgo
	6T4n0XlNY6L/mWtHp4OYxBcrSVaCg/dI0=
X-Received: by 2002:a05:6a00:cc7:b0:82f:8b84:50c0 with SMTP id d2e1a72fcca58-834ddc8af4emr6280187b3a.45.1777454219204;
        Wed, 29 Apr 2026 02:16:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:cc7:b0:82f:8b84:50c0 with SMTP id d2e1a72fcca58-834ddc8af4emr6280164b3a.45.1777454218693;
        Wed, 29 Apr 2026 02:16:58 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed80dfa6sm1496340b3a.57.2026.04.29.02.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 02:16:58 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 17:16:48 +0800
Subject: [PATCH 1/2] media: qcom: iris: improve gop size support for gen1
 encoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-dynamic_encode-v1-1-c9fb691d8b3a@oss.qualcomm.com>
References: <20260429-dynamic_encode-v1-0-c9fb691d8b3a@oss.qualcomm.com>
In-Reply-To: <20260429-dynamic_encode-v1-0-c9fb691d8b3a@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: quic_qiweil@quicinc.com, Renjiang Han <renjiang.han@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777454211; l=3022;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=1SuR6UH2DsN7PTT/NUCgzSGsYpfp8unFOGhnizEc+WA=;
 b=bDgr0ClfssHc7JudQ1BZLoZxKlcJPCvhZddeJP8cso7nLCPANcctGSJMXGhfYDM41uSI9PaDm
 RpyEtTLP7zvCL7rBESoF6X4apgi5QoLxTWgr3eBbvomwJEXEy4Rk3Ps
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=C/7ZDwP+ c=1 sm=1 tr=0 ts=69f1cc8b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=J-oyWT7ATPDHrUoQIokA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA5MiBTYWx0ZWRfXzORFcNpg/Fsa
 OQQa+AdXKPm4JYTbZk/XRpvW1hqWyoDwq2ZtAiAvgxJsmhrRvYu04bzHZx82oIVYBCOaTxNRZqz
 vqpmyoTDfntG/nUZCIStTmbIf80P6f+uD0B9FXHcuq0wd4uFvtTG2w948wiQ7XLuS3P4yyMsfPw
 vV3KyMjEtfv73Si8af+GkTGc7kUuzhRVLE5uuMn8H4BDakIm9MbKNe5yUfjPVTZzuq1nsYpxmm0
 72WJuyX0PjtzigVDmT4B0rJSKH1xuI8r1E8HA5kK9327JUBlFcXRvBLHY/sWxibeTfJuvQSAw65
 WfM+2LQLOJLp4Yw1WLreAGPrhPAWHg5X4z7DVrWQXV9wY0jFV3LAFyfUkdIIY4Yy/d288KvgV88
 jLheAtPyQ9TUql4NG5A4URw2vlg2VOq3I/NQIoCmJ2O5xlR79tR/SzTU/p7yg+MNIox4zi6/r38
 nDCMHaedUUIWIVxb5jw==
X-Proofpoint-GUID: 59sMhVttgwYbccFX7o8Ph6CuP3ACxDqV
X-Proofpoint-ORIG-GUID: 59sMhVttgwYbccFX7o8Ph6CuP3ACxDqV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290092
X-Rspamd-Queue-Id: 87E8D491C02
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59951-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]

The GOP_SIZE cap was missing an hfi_id, so it would not interact with the
firmware but could still save the parameter passed by the client.
INTRA_PERIOD was acting as GOP_SIZE here. The code was redundant, so the
two caps have been merged.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c           |  2 +-
 drivers/media/platform/qcom/iris/iris_platform_common.h |  1 -
 drivers/media/platform/qcom/iris/iris_platform_gen1.c   | 14 +++-----------
 3 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 2ae0d1aa11f8a529b8916ae0ac96e3298e250355..51eb644f2f1aba95b72a6cc8706beb3d2d67451a 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -1293,7 +1293,7 @@ int iris_set_use_and_mark_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_
 int iris_set_intra_period(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 {
 	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
-	u32 gop_size = inst->fw_caps[GOP_SIZE].value;
+	u32 gop_size = inst->fw_caps[cap_id].value;
 	u32 b_frame = inst->fw_caps[B_FRAME].value;
 	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
 	struct hfi_intra_period intra_period;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 3efe3121459c610af55ad2f930b21c376f0a085b..e1e8cff01f5be2554ce4704f74bcd76d2477a413 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -172,7 +172,6 @@ enum platform_inst_fw_cap_type {
 	USE_LTR,
 	MARK_LTR,
 	B_FRAME,
-	INTRA_PERIOD,
 	LAYER_ENABLE,
 	LAYER_TYPE_H264,
 	LAYER_TYPE_HEVC,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
index 65156584326a1a83588e8055f1318ba1b62e6510..a1988f22f8aac72eb64f944f0d341a49e8b8ee5c 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
@@ -193,7 +193,9 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
 		.max = (1 << 16) - 1,
 		.step_or_mask = 1,
 		.value = 30,
-		.set = iris_set_u32
+		.hfi_id = HFI_PROPERTY_CONFIG_VENC_INTRA_PERIOD,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_intra_period,
 	},
 	{
 		.cap_id = ENTROPY_MODE,
@@ -303,16 +305,6 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
 		.value = 0,
 		.flags = CAP_FLAG_OUTPUT_PORT,
 	},
-	{
-		.cap_id = INTRA_PERIOD,
-		.min = 0,
-		.max = 1,
-		.step_or_mask = 1,
-		.value = 0,
-		.hfi_id = HFI_PROPERTY_CONFIG_VENC_INTRA_PERIOD,
-		.flags = CAP_FLAG_OUTPUT_PORT,
-		.set = iris_set_intra_period,
-	},
 	{
 		.cap_id = LAYER_ENABLE,
 		.min = 0,

-- 
2.43.0


