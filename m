Return-Path: <linux-media+bounces-52389-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uNQFBJqtiWndAgUAu9opvQ
	(envelope-from <linux-media+bounces-52389-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 10:49:14 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB1510DC28
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 10:49:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 757C030479D7
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 09:46:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08F46365A12;
	Mon,  9 Feb 2026 09:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b/EGgu0y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ftLkY7C4"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45EC53659F2
	for <linux-media@vger.kernel.org>; Mon,  9 Feb 2026 09:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770630371; cv=none; b=Ug1uH+CQuJmvsQTuNn6Q+3qkZMap4Iu0x2e/5Ao4bLn3dOpigkJzJGZZ75JUTsK2fX8l16s1VV3LnNSEuxZhXQqoSaCCb+lvab0cnZaROfke6UQfErsGpV7Z9wuRo7oOarK93SPTT30A6cuOlCw8GwrtvDvJkBPhztTwCldHOaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770630371; c=relaxed/simple;
	bh=IQ0e3U+S18cU6feftl6lZUy0c6+odiSJgtdVNR0dd78=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LxKp+iXpQ3y6xaW9Qwm8haDmY7SyRt/eOG8NQdWI0kgBvxt7jId7LuaiRyZTpdB3AOnWLcUbl6cRRRIiGep/AoqcltsPPD6a+AayTmWfvDmBrghmeOBfaL6zqxZr6fYpI/HOocKdhmX/DBzplD5yzevndDpGBaV6IZxSjExS/UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b/EGgu0y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ftLkY7C4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6195jFrf1461653
	for <linux-media@vger.kernel.org>; Mon, 9 Feb 2026 09:46:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J0st88zXaPvsYHpPh6Jq0JH/VbPghzPRzWWaPLmGPLk=; b=b/EGgu0y829eziZx
	3mZOEM0+soOhRJFL4sZBt2BK8DKk/+o3Flq5LUdVo2ZeO0XMyNDB6sRFD8wMTJpO
	MzTj/7FLYkkPxMOooN7tJRU1HBSVo1LF8+i03Uf3v3P4p21IRlY86T9HShL/Npo/
	rXaYrtgHAm+ND2w2IcNEXvYMbVpDGlza42sV3qeZr32fn2aMlyq8w5o4xnaRHT5j
	F1GkKW5R3ujNABJ1NtB0yBbfcpHnP0LSNHU+54Dju5D+mwCDaMC8OyAyzIOs8ONK
	FiSOLyCPaKH7o3lRxFRtEtQAhVql9g3WxVstK/DYjaltTWpEc7yS+Gvtcwk/Ss1g
	y6Ys/g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c6g65ayyk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 09 Feb 2026 09:46:10 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c629a3276e9so8214936a12.2
        for <linux-media@vger.kernel.org>; Mon, 09 Feb 2026 01:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770630369; x=1771235169; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J0st88zXaPvsYHpPh6Jq0JH/VbPghzPRzWWaPLmGPLk=;
        b=ftLkY7C4ZKhJeuIbhumu5OB4tAnnA6qPLUQydHINYxiOvCFtVdJQFHAllWFdPrAVjk
         auv9w7LBqB6caVW9sXQ3Qe3ynfG/mdYTEAp7SCW9hXLKipFg9GKErQ9M59GvJKVtKAJa
         9ZnKi+8B9RnaJJzKL0BswXOQgAoI8/MZPiDpUvnlQLH96OMeZc0bVZhQ7aGWSIyXnhwn
         kOIk+XP2KwNXDwgDHMEG7o4KYA22QmzPPPk3sp0rAStbrNygPKyuGgt8qOI55uw1birp
         ZWLIjUHcYyrE/lvO52coYp3zdpLmmG/iqqQbZJEKrCarE6NT4HeKOQ3F/MuCQnIfu7aI
         ts3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770630369; x=1771235169;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J0st88zXaPvsYHpPh6Jq0JH/VbPghzPRzWWaPLmGPLk=;
        b=XwZEsONz5MGz56k1vyNUhhh+yeG4LLKzJpD0bb33juNrzZ+M0HX/b779tiZFECdbeL
         0FS08oecZPq2L+6wQo4Y/MOHmYGBuBni+V8uRTQhkjUYL1VeXN3e0jcvyQGH7SBxApef
         JxVeCSZCYoBRj4l4xRZafCRvcKnxxlkRitCKB54qI2v39KnIDnzSD1V1cH4dYPSKQCaV
         zczffRIyhbcpQccXcf3I6mqlgy7PzGuZ5DwiDnwf9NUIxSnH+Euwm7ndPv2QzQDHJVPb
         7w8iJFGyBKoeltDVQUBMRIIo/bJF0bT5ZzOAG1KwL/eqQt3kilxBxpBgmNQ0wOERgW/J
         GxQw==
X-Gm-Message-State: AOJu0YzmUNl+UAkhkM7MlKIppKTTtMfSC8uN4462hc7AwCHO5oHSM/lD
	/GxYOb+KWBSeI8lpqgJ1a2pLwnHpzbLoLzIVR6JFzB8LZE++36CsarCPQmFGMBlRqhOgpmB+Gfz
	5BIShL5Rlju8FziiFKx9tsREXxj8OwwYHlP8iUzepE7tngUs4UFdCYsn2H9jJ+4iZRw==
X-Gm-Gg: AZuq6aLjeXvxlhwDjQy1lh+XTcuTts6Qm7GsWeF7kMExxLmbKcgtQrvp+VfSFCclN9e
	kZLDJowajrY4KvNXgDMS7p87oKXXvc71g7bEdFdpbTuBSDXTFI/pUUPBR4gCPGGAqABFX29/ulD
	N9+tLqXIxzOew1q2nlng7nHRIC6Nay4nvBMTJaTeyFo74eudQaq4BYaqjwK+vmd69/y68qreIas
	J/r8s323DkTtqYHmh8jGrR/X6xFnUbQz01cltIFmOjDEVfrY6MaVhpy8+3p77QIQvOn3m7DHX8D
	mJudJ95ya7G5KTsXHMtDBy9sM+0nFvVy0IYoMnmzVMz/bxKF0fmNqlkTzwTrNthMoBsi+5BGioB
	gGYhVR0WISy+VA44BfCwYDf1qdv2/Ad/kDSJEihgKcaUQgoQ=
X-Received: by 2002:a05:6a20:a11f:b0:35f:549a:b0b3 with SMTP id adf61e73a8af0-393acffdd84mr9834178637.23.1770630369310;
        Mon, 09 Feb 2026 01:46:09 -0800 (PST)
X-Received: by 2002:a05:6a20:a11f:b0:35f:549a:b0b3 with SMTP id adf61e73a8af0-393acffdd84mr9834156637.23.1770630368809;
        Mon, 09 Feb 2026 01:46:08 -0800 (PST)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a95eedbceesm76884925ad.84.2026.02.09.01.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 01:46:08 -0800 (PST)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Mon, 09 Feb 2026 15:15:25 +0530
Subject: [PATCH 1/2] media: iris: Initialize HFI ops after firmware load in
 core init
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260209-iris_sc7280_gen2_support-v1-1-390000a4fa39@oss.qualcomm.com>
References: <20260209-iris_sc7280_gen2_support-v1-0-390000a4fa39@oss.qualcomm.com>
In-Reply-To: <20260209-iris_sc7280_gen2_support-v1-0-390000a4fa39@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770630362; l=3249;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=IQ0e3U+S18cU6feftl6lZUy0c6+odiSJgtdVNR0dd78=;
 b=s/m2RbZgyvaMTsJCwwvf6ERBbRCqWWJ7oOIm/BvcxL0zNwWSc5ufwAjM2wqiQr9BTGUQAgPgU
 t3Bk/H+B6InAq12sZ2wCmZCjmM4apknhz0vVEu6nguR5t0zebHGx8zG
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Authority-Analysis: v=2.4 cv=GqNPO01C c=1 sm=1 tr=0 ts=6989ace2 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=3tfMAF2nT37deXqZlAYA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: Fd3X-CQzhRSZH9Zy_x34TeGElSuPUrDx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDA4MSBTYWx0ZWRfX5ssYm+FKL070
 +LEwwFNrJGdyztKOONSG/QepkfRxss9HrGG5gzC/psa//XFbOEdCXEgduFwTH3xXZMkohbTq8uF
 U1mST3aL4uK949k5fVbsaWjkXjSPT+5mt6n+1f3+Lay7dgapXbVNO/QKFodCQGhynAqQmg0hz+e
 icvkcvWREDyBYA4QheKvJJ+h1Vp8mMCQ1bR40INj8CvhErT9zMedtpyuSUi8CAMZJi8JtPGscYs
 Bue7snmkzBLIwnR6rm1IeG+GGycb8NDS6fsjglaVF04yKQ1nWL6LpeW7Y7wHmGZtMv/+5/pO7+G
 7xM/EBi5awAXS4QqVZVOpTIXv50oQaoKW7KQr/Qvr0iLHJM/ZuTldqK92SdlAZ/GRSZNr7FlIT8
 ZfvQnjBywondbKJraOWitJD6fVOacfZUGndGtuq8h5LcbSRHp6sAChI3HyeCT7F2bjIS89CUMcb
 YJfE+ciQjyutGcUxghQ==
X-Proofpoint-GUID: Fd3X-CQzhRSZH9Zy_x34TeGElSuPUrDx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090081
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52389-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6AB1510DC28
X-Rspamd-Action: no action

The HFI command/response ops were previously initialized in probe(), but
we don't have firmware loaded at probe time. Since HFI is tightly
coupled to firmware, initialize the HFI ops after firmware has been
successfully loaded and booted.

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.c       | 2 ++
 drivers/media/platform/qcom/iris/iris_hfi_common.c | 6 ++++++
 drivers/media/platform/qcom/iris/iris_hfi_common.h | 1 +
 drivers/media/platform/qcom/iris/iris_probe.c      | 2 --
 4 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
index 8406c48d635b6eba0879396ce9f9ae2292743f09..8e4cc6d6123069dea860062f0172f1e4b90cfc13 100644
--- a/drivers/media/platform/qcom/iris/iris_core.c
+++ b/drivers/media/platform/qcom/iris/iris_core.c
@@ -75,6 +75,8 @@ int iris_core_init(struct iris_core *core)
 	if (ret)
 		goto error_unload_fw;
 
+	iris_init_hfi_ops(core);
+
 	ret = iris_hfi_core_init(core);
 	if (ret)
 		goto error_unload_fw;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.c b/drivers/media/platform/qcom/iris/iris_hfi_common.c
index 92112eb16c11048e28230a2926dfb46e3163aada..bbca17edf281a11142d7582178cd7562be053b45 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.c
@@ -74,6 +74,12 @@ u32 iris_hfi_get_v4l2_matrix_coefficients(u32 hfi_coefficients)
 	}
 }
 
+void iris_init_hfi_ops(struct iris_core *core)
+{
+	core->iris_platform_data->init_hfi_command_ops(core);
+	core->iris_platform_data->init_hfi_response_ops(core);
+}
+
 int iris_hfi_core_init(struct iris_core *core)
 {
 	const struct iris_hfi_command_ops *hfi_ops = core->hfi_ops;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
index 3edb5ae582b49bea2e2408c4a5cfc0a742adc05f..498a08314cdeb65b4b621e2200aae8685f4a025b 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
@@ -149,6 +149,7 @@ struct hfi_subscription_params {
 u32 iris_hfi_get_v4l2_color_primaries(u32 hfi_primaries);
 u32 iris_hfi_get_v4l2_transfer_char(u32 hfi_characterstics);
 u32 iris_hfi_get_v4l2_matrix_coefficients(u32 hfi_coefficients);
+void iris_init_hfi_ops(struct iris_core *core);
 int iris_hfi_core_init(struct iris_core *core);
 int iris_hfi_pm_suspend(struct iris_core *core);
 int iris_hfi_pm_resume(struct iris_core *core);
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index ddaacda523ecb9990af0dd0640196223fbcc2cab..22c7b3410710328b900fc49459cd399aa0e89b02 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -252,8 +252,6 @@ static int iris_probe(struct platform_device *pdev)
 	disable_irq_nosync(core->irq);
 
 	iris_init_ops(core);
-	core->iris_platform_data->init_hfi_command_ops(core);
-	core->iris_platform_data->init_hfi_response_ops(core);
 
 	ret = iris_init_resources(core);
 	if (ret)

-- 
2.34.1


