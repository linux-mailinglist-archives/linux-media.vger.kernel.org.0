Return-Path: <linux-media+bounces-53658-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2NS4ElI/oWnsrQQAu9opvQ
	(envelope-from <linux-media+bounces-53658-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 07:53:06 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CC21E1B3889
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 07:53:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 65CDF305E328
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 06:51:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D183A364941;
	Fri, 27 Feb 2026 06:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Br2U/9G0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y2KrLYJE"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2CAD3806BB
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 06:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772175078; cv=none; b=hU+iv8C5lPEw9XEJQrPflimLkS5FoA9IQqZp4MCQtJwyqfcYM2KTsBZK48mVfhtTAxImEgLMNv4Z4GU8ma7nZ/x2+6PJTMbhUdC8FCDUPT2ivr5+kWuIxAHmKrsk5F3BBS6EDRVGiSdaDYRXKax4NiFhjnseAx+vVAzesm4p42c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772175078; c=relaxed/simple;
	bh=FZ3ARdYGTQxmH6JaV2ra/jpTuBox548HjHD9kKuTQec=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qMUe2X8waJ/HrIHhq7tkXyCOYEX4T44TXE2uyrKvyiNVm+EUnFWx6+6WzMhbwkuSxNCwk+AhFx8QHV+7zjfCcfpSYBMvLHZjBMMqR7mG/Vnly6JK46+tMsmFFiesgjEZRDpoT1vyz4BnST5E/lhzHrPmdjHiYBTLKLisWtBiTgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Br2U/9G0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y2KrLYJE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R2KJaD2440245
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 06:51:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z/JqWa6Wha8fsH3fI3J8ue3gixQVohxYTLtBUxECfyM=; b=Br2U/9G0JyW69Yt8
	4O1rupikwWvCOXV9a5an1wEVtp6E0FIZ82FmcPeWtWjxi+5H6/JEmMZRXZvqyIvF
	plNuxZ8+fg2G3UNw9nGT9YYi6A/AH6X2ruBS098xG/7/a4736p+BcYnvxb96A2mU
	NQByd3jjCMe5BsG34g/mpOOZIHr42RK4/GNOI3QZukRGUg/0StHgof6xIM480Op7
	hTFJWZ5qK2aJZH21F8yhe7vl27sDMxZ8fBan/c2J6FFWZWUJSJ2C+KdytZksNvXk
	Fxvi/vUCWJeTMdoMBmXquFZCGQ1KDhpI7RSxHPS5/AcIvszB1ShGFeN23a+oJwPR
	tKfUmQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cju4r29y8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 06:51:16 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-354bc535546so1428620a91.3
        for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 22:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772175076; x=1772779876; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z/JqWa6Wha8fsH3fI3J8ue3gixQVohxYTLtBUxECfyM=;
        b=Y2KrLYJElZim03TuLGzxiXluFNthP1kPhPo7IIxFm0WUq/5rbhThagjUJllcBAS8OM
         6+6i/KovSE5wUN74zLFPzOak0lJFfmPQED93CQCEhfkliPfxI0QK0udjdVCJgEasVikT
         qnLcrznRpom9fNKbSIgFSkN9UYLRjpJwhtMwcUAyTgjQHETB1Qb03V5RVWmeGbShuIdl
         qw/9cC2zRilMavstbF+++oWXg4xvKjIjL2yGLClzsE7O2L5e2v+2bU2THJu0/2OhjWee
         c6jvcWwPUcApiYtyjaakS7H56xuP+8s+7RdkvMjiKIRX44080JBDKWzuO4xq9rgWLDYx
         DH9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772175076; x=1772779876;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z/JqWa6Wha8fsH3fI3J8ue3gixQVohxYTLtBUxECfyM=;
        b=suBqxGBXQkYDb+gNMsy4m4Bl8K1gb0JbR5ZYdlikMXFN5eKr5XggZjPuQxh2Gw+/q0
         y7ruSGmZeVGx5iuqo8Mv5trqToqwWeVdNesfXvjvWpqQ0OGbd8m5HtfL1Dnqgodtcafm
         VZ3NYI94aS8oCXlKPR8pMzq8W4hIaI6ZR0hgbCC0IIcNumku4X6ktcq+bhWVPsF1LwC+
         OorrX9BIpRx1OB9Kpv8VYg8tDAsv3qYf5sFGjXEG9USOBPrSyUtq1Wg6VtBlctXh8gh+
         gZMn3aD2yoAmyRXIKWKK2hMMI6yHf4/whOuRA/BJOOftML2ZbJBHS5Xp1ITu6XzLkMIv
         2FYA==
X-Gm-Message-State: AOJu0YxYwEivhOFfmC0e5kSJe9mAjjqPGw5PTzMlIly3n07bSAv4zCJj
	4zKAxDVxJInZOUZMB1imbLf0bdsDKIbKsz1t0vNHo2rT6tZLW6Ul3LnSct8Yo6f05x106jHOJ/O
	x8oftQ0JKjBPub+gd/psEfSxfN9JbDIZ+dQK6p81DXzUnBaCxq5HfGDyTkM4q8mhP2w==
X-Gm-Gg: ATEYQzzpooqpPQXuwxAt02wb6m0BUSV/AYVEtMcw/MYU4JJYm9I9YEv8rhU7IIiqA+M
	j+N4BAOkIxejC+PsYP77owIqiEgz279ORjEZ6vjuJQnAQd/N63jWu80M/GUSvADzoo4/Fb1r+jq
	Z9+5XY3FJjfzRQAQULla5MI6LXrxtuoEcjSuUwkd7OYq86k8dztsGcBbbLrN9E1z3uurkLuWuiP
	DHhnBEtLBcopXDCE67GuVb5LReoiayGkoyp3Q3QciL0C0RE/cVNOJ2vxDxIVBs5o1wtYeeDMQqg
	HOTMgZT22ECnxoLi4bzwoUzZAquLGNkg/Bzee+E1NqOGmSaXGCwbyRPZp1gea+rbvWNNCf15qoD
	8C8dIqe2t7QtitwUHht1joOaQFwd6Sbl3DRE1qd30D5YJhJg1V9qeQH24+Mo=
X-Received: by 2002:a05:6a20:258d:b0:395:151c:4eda with SMTP id adf61e73a8af0-395c3ae7748mr2004220637.45.1772175075600;
        Thu, 26 Feb 2026 22:51:15 -0800 (PST)
X-Received: by 2002:a05:6a20:258d:b0:395:151c:4eda with SMTP id adf61e73a8af0-395c3ae7748mr2004189637.45.1772175075075;
        Thu, 26 Feb 2026 22:51:15 -0800 (PST)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa5ea0dcsm3455880a12.3.2026.02.26.22.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 22:51:14 -0800 (PST)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 12:21:02 +0530
Subject: [PATCH v2 2/3] media: iris: Initialize HFI ops after firmware load
 in core init
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-iris_sc7280_gen2_support-v2-2-7e5b13d26542@oss.qualcomm.com>
References: <20260227-iris_sc7280_gen2_support-v2-0-7e5b13d26542@oss.qualcomm.com>
In-Reply-To: <20260227-iris_sc7280_gen2_support-v2-0-7e5b13d26542@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772175063; l=3309;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=FZ3ARdYGTQxmH6JaV2ra/jpTuBox548HjHD9kKuTQec=;
 b=KMnntYNUbenjJXL/p1ZcDIpmepXzrO5DsGgQ8grRfHj3nf49AavUjF+J4rGc//0Z4B6gRsjDL
 C0Vb85KsF1TDllCfO6TesEXUFe8D+EpyV7fk9WjCSEueDDC6Q/d1Pel
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA1NyBTYWx0ZWRfXxE2tB8iBM7AK
 SVsjAyb+dR/b2gHjQndIkxHdjI6tiBslSrbyGn3HumnzusoGruKGsdNnUH5rQBk1O3HDXKgeQA0
 +zMuI03vfumpelx+KdOoleyO1bHAoRF4l7TEZOMBVltY72SLuIOsc3/ktxtQz1S86xSVZv68Yx4
 tZ77g8L3MRCWbdvJrvFrwfeMkUz6UoIaS+kPn5z9WEMmlvZKl/s2Loh7T2nH8NnXcI+0f8u9Ztq
 g/COWst40dw0bPhCaTUgYXOp9kqqFb04OP4tLKtCfO4/5f/7MqSYb4mpXYyTULcY++BetUeq72P
 bab7RaXTqxp66Sy11UjS4bRoPnKjylq4fJVw5VWB/m9UZPuR/d82ySXkVd7Gxq93J50WOkHEJeV
 BWCMI+jcZjDl1OEROCRUbzS7Glv8IPIwtr9EsTw9cbMpKJohqrWm7JdB0n3+XWk0/7QilwCdFKl
 cIEwXd0dXLvu/Qfd8mw==
X-Proofpoint-GUID: w5shImTl3CCTdNSCrWZqt9BVeIMbsblF
X-Authority-Analysis: v=2.4 cv=KZzfcAYD c=1 sm=1 tr=0 ts=69a13ee4 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=3tfMAF2nT37deXqZlAYA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: w5shImTl3CCTdNSCrWZqt9BVeIMbsblF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602270057
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53658-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CC21E1B3889
X-Rspamd-Action: no action

The HFI command/response ops were previously initialized in probe()
but, we don't have firmware loaded at probe time. Since HFI is tightly
coupled to firmware, initialize the HFI ops after firmware has been
successfully loaded and booted.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.c       | 2 ++
 drivers/media/platform/qcom/iris/iris_hfi_common.c | 6 ++++++
 drivers/media/platform/qcom/iris/iris_hfi_common.h | 1 +
 drivers/media/platform/qcom/iris/iris_probe.c      | 2 --
 4 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
index dbaac01eb15a0e622e85635fddd29c1f7fc18662..259a1c4597a1ce76a4e0f254904b135c8fef549e 100644
--- a/drivers/media/platform/qcom/iris/iris_core.c
+++ b/drivers/media/platform/qcom/iris/iris_core.c
@@ -79,6 +79,8 @@ int iris_core_init(struct iris_core *core)
 	if (ret)
 		goto error_unload_fw;
 
+	iris_init_hfi_ops(core);
+
 	ret = iris_hfi_core_init(core);
 	if (ret)
 		goto error_unload_fw;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.c b/drivers/media/platform/qcom/iris/iris_hfi_common.c
index 621c66593d88d47ef3438c98a07cb29421c4e375..db48dfcc96b8d923ec49bb4b27e7a0ddaac263e8 100644
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


