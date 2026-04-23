Return-Path: <linux-media+bounces-59399-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +E4LEksK6mm1sQIAu9opvQ
	(envelope-from <linux-media+bounces-59399-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 14:02:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E63451A76
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 14:02:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6D81730147B1
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 12:01:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99EEE3ECBCF;
	Thu, 23 Apr 2026 12:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GqO/A+Wg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eiQ62Q1M"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8E03ECBD0
	for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 12:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776945655; cv=none; b=c0a4tvgFIINCYB4K5wzFNL+fjAnJY6K7xtiU/nvf4rpp5Dm9SD4DKj+TPogoezhh9FvAovBPQqs1M7F4VraJCtmS1r7iwHj5akLlErLpQpXGGrxI3VUr0uSdmtkuRHhxpHRpLYDqzn9JDxpy/Xlf53zRnqPgCZypTLpI5n7NQ8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776945655; c=relaxed/simple;
	bh=6erPIlXGx13GlJZwWabtQ127np/SDC9i/rMkHX7eIHM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p5Tvvw6GDK62A0FRMRADLyaJCOI1EUe54F9Xpg1vh6lyximE0jD7TgsLx/pyamdBHdmibVmC8wvSFjtWsPERs9rT0us3Xb+QW6stS3p76ZVbT9KukIBNDHlrX0q3L6uX8Wzj6K2ClGknrylLaZdZKd7Gga+8PSsPSIDo9SPlECM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GqO/A+Wg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eiQ62Q1M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8u2AN366195
	for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 12:00:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cbQ90sXiYZv9VCLd9FROakxbCP8MmB1zAyP6+Do3MCg=; b=GqO/A+WgGXGd2GTS
	YXXdneToYWIa7Ogl/yZV3jhp8/AKH/Nd1d3OxwKyoNiYgvZcZKQtB6exto8aHXpX
	ywkWfwJ4Vq5PUYI0awQsG468orCI93gyWkUh5hh6annJTCe1j8xPPUkt+nu0U/uj
	eFAe5uk0DzMg4WLYTL98m5VPupWqrO/TRL3ZRnuDNwiPf0YistsmNCmDpY16IKp8
	U+WU+xy6HVY1JM+qnF9KZuYlw+V48d1Q22W6Xizu8I7wW0kt8y/A0fbJVwajL/af
	dYBnUbKijn/YfF19FRmPAoVZdF8E9I0g8EImRrKTLslTUu9n87Oi7YFUNwcGPVh+
	h3jIug==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq35rbbvn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 12:00:52 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b249975139so121445685ad.0
        for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 05:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776945652; x=1777550452; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cbQ90sXiYZv9VCLd9FROakxbCP8MmB1zAyP6+Do3MCg=;
        b=eiQ62Q1Mq/akqDz/mOPkK5zKsJUN5uNeoFk5jGDDfjKpC7LZ9m+oVJWUii/zfzgP+D
         H616rD1sCpIHtey8J64QKPP0EyeMxP2aZJGUqztRCQHHE0I2H9ufdPk1whUdYY0+JoTZ
         hp55EUAjXs0mDfIeLN/bzaa3iRmrhWKEd44d9+mzPUn27CC3IdbQyRvJ2NbpCrCUksnT
         BkHar9Nek9+cB2Q5muA6vZ7Tjf1h3T03a//bt7Ug1rrUbbmshRqy1prlpHw2Z8vTm9em
         JrIy0lv+8IZCun4Cm/sMxShqRPRwADZ6aXlLeFtd9FGh8gj8uMep1+n6oI4WdITX6EiA
         LgbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776945652; x=1777550452;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cbQ90sXiYZv9VCLd9FROakxbCP8MmB1zAyP6+Do3MCg=;
        b=eWqlxCQA4qE2gSf8ZNto5Zh3bGDmJvL57UOlv117dzkImLBdC1eKltlS0ED8Q3632U
         qb+meJeZorZwU4ofgw8/I0N2FaEwmbWs+e9xL0gkNSaxlUOLJ4ajMgMqjwItxIlvCb0w
         PotaohVJdr1/lXCDhS6ib1/lGc1I454K4JfCCa61sl7sXvHOW7mGR8czXCZSig2j6fo5
         Stx5kKNTwdnTmcoCle+fbJe2Qtx9s86e9Bv+gN245iTVk6EGM81Y/P1s0AaSkOnZJuXd
         IRZAJDbWHcEPTpBOx4NXw0OwITFQBFBfrjwIN8iC4KfdQJxmxhDQ/1KiMOYAEOQx7x2A
         URUQ==
X-Gm-Message-State: AOJu0YxV1/gPPn2CzG0WyJSEcu2ho9DS2cl/J/aItrwbL2nlfuhzfjCC
	Ej0U8p/pAUEBEphAglsqze+1oqvO8ZhB0lojmtc53/cMyz4caQocpZC7xRIIyS7a+4sSHVERZqK
	YY/yeLN+WGnWYhSfiGbW6bzbAR12jmSmR1m4KqTes5UenaexkkV78GARrRUb1prSB1Q==
X-Gm-Gg: AeBDiet9ferwAbt7OGvX4aFnCMYiyhPk2p7nVYpvieKAVkzBPVMgBIa/90H1g1vWQOi
	cT4kvxWIJxunw0uZ4h0ZvEJnA3ZJZmJyclNZu+A01Ct5cECsooHo2pjZpwYNHxf7WUUPQUeyDAZ
	J6897U/4uw2YJGY6pyyd99TdyjOViAHA6c+C2iPuR7omo1XwEGGwmqDXrHS2vh9L6+bQxd9rPsK
	73ejvwCZdG6JnxRwstMdX10bu27iilhgsof/6W0CLlWQt/aDff5UJS3KahjegUoEk1fI1g5we2C
	C4NOPcKZHXPIXZm5k6j75TvNngpcB0Uswzw/sSksBqxRtVzL0zH/KQvZcl12fVNYjwgB/NXoVb1
	ZMHi863dz/TSLC8MNRgXHlUfq3gpLsAUBZ0i+SmN7gu9m1fMyNVbAwtFB/22p4YaumR1u6g==
X-Received: by 2002:a17:902:9342:b0:2b0:a980:3687 with SMTP id d9443c01a7336-2b5f9eb06f8mr207924725ad.3.1776945651475;
        Thu, 23 Apr 2026 05:00:51 -0700 (PDT)
X-Received: by 2002:a17:902:9342:b0:2b0:a980:3687 with SMTP id d9443c01a7336-2b5f9eb06f8mr207924205ad.3.1776945650856;
        Thu, 23 Apr 2026 05:00:50 -0700 (PDT)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa4f092sm194790355ad.36.2026.04.23.05.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:00:50 -0700 (PDT)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 17:30:08 +0530
Subject: [PATCH v2 4/7] media: qcom: iris: Remove dead assignment in
 iris_hfi_gen2_set_tier()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-iris-code-improvement-v2-4-9e9cbf00f9c9@oss.qualcomm.com>
References: <20260423-iris-code-improvement-v2-0-9e9cbf00f9c9@oss.qualcomm.com>
In-Reply-To: <20260423-iris-code-improvement-v2-0-9e9cbf00f9c9@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776945627; l=1321;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=6erPIlXGx13GlJZwWabtQ127np/SDC9i/rMkHX7eIHM=;
 b=KvFXP2o4HqAnoKvG0uWQ3CIArqpVh9HUWwK6d7xBDzErjhMCHTveDAwooAfI2ZwweckiQapzj
 iEbGDGXZjBwBe360+Z2RA5nH8QSQNLzKusfPnLdbTqxO3X9E9XPEVgO
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDExOSBTYWx0ZWRfX5npOpIRsmVJD
 c6r4Fxypiya0usCKZ3avP2J3wC6BkSjWJMQTxbGlTTbShvUOU2OncpQpbteBmWyx/fHixRIFwWR
 3ccAiy2eMLmoNagI9xYr4groncPoAWn9RmkXNla377A28pR0q4vmyMynKXAdoVQbAevH4e7Acbh
 O9qAlmLb03l4mp5gE61thZHdn34qGxX3MGdGcFfc91Eno833ou04rYVEumnd5vTD1eQ7+SqrlU+
 rP/tqYI8yyYBNv/Dwsgg0z8wduxNaGoj9SD2dyCNKrqWyN0NsYCdc7ZHjU8CRa/mSfdxPIiJ/A6
 lWrWKx054RPsU5rwl1JT+CnaLYElvlQXZ/wjczoeJshiUQZoyIYlIA2hBXOtbE5bJEyNTwRAXtb
 F/L1bt3foy4w/H6B6SkmmucNsNEbioWnlbwNwVoEoJR5xbfFPInFJeesJW8GvALKDBz8nQxIAMQ
 QiyobO4QppPAMNXdUgA==
X-Proofpoint-ORIG-GUID: C7rNkL-_0hyyCQT0Rllo8sWMupBPLxI-
X-Proofpoint-GUID: C7rNkL-_0hyyCQT0Rllo8sWMupBPLxI-
X-Authority-Analysis: v=2.4 cv=f5J4wuyM c=1 sm=1 tr=0 ts=69ea09f4 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=7A-KeLSbcoVXy4yL1OsA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230119
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59399-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MAILSPIKE_FAIL(0.00)[2600:3c15:e001:75::12fc:5321:query timed out];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 53E63451A76
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fold the ternary initialiser directly into the variable declaration,
removing the dead store that was immediately overwritten.

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 30bfd90d423ba024caf6ececc827f7102e8f3324..bbecee1cc2d02a8283b3465afa686319792d98c7 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -536,10 +536,9 @@ static int iris_hfi_gen2_set_tier(struct iris_inst *inst, u32 plane)
 {
 	u32 port = iris_hfi_gen2_get_port(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
 	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
-	u32 tier = inst->fw_caps[TIER].value;
+	u32 tier_cap = (inst->codec == V4L2_PIX_FMT_AV1) ? TIER_AV1 : TIER;
+	u32 tier = inst->fw_caps[tier_cap].value;
 
-	tier = (inst->codec == V4L2_PIX_FMT_AV1) ? inst->fw_caps[TIER_AV1].value :
-							inst->fw_caps[TIER].value;
 	inst_hfi_gen2->src_subcr_params.tier = tier;
 
 	return iris_hfi_gen2_session_set_property(inst,

-- 
2.34.1


