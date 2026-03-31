Return-Path: <linux-media+bounces-57704-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGxxFvtPy2khGAYAu9opvQ
	(envelope-from <linux-media+bounces-57704-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 06:39:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C17FC363E8D
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 06:39:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 36E213071A4B
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 04:37:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AC2F23643F;
	Tue, 31 Mar 2026 04:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zl7nRzsH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Oeedl7Fo"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933192D1F40
	for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 04:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774931865; cv=none; b=LdG+ZifYSighL5V4tSozgRGrxoe2Gsssf0TVUF2QsdocnL8nAaPXZdaeo176NJn9ZE8HgmIZrkm98haipdYFKH6McaNKFrso7S7NalOckcKqIDhSapVMqiy5V9r2znN8QRQDZSzse5XgBh9xIF+I/9COIk71qwm1UM1rReL6Q4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774931865; c=relaxed/simple;
	bh=xYsLcQTGNHUKd8VrMpxYEPuruDVyUmLfia/4sp32nkE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YgKZr2pUoBPseC6zYT7KmNk4ta0lab1WeWpdMYwEquiWSzgUCWBIjbxW2H3KQEuzW0wUo17RXD1XcCDvhbiizZjZeS+XdccGR1xlmRI1mzSZtdGbCnHGcse7s2Q4pMPCh4w2qTPsfsF3wXJiv4tl9olDT1o4DHssLSX5wAuZycA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zl7nRzsH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Oeedl7Fo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V1d8TW1402660
	for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 04:37:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jF85H2GHE+7UGzxJyreadfp1atVe8zeWAoztPT146mg=; b=Zl7nRzsHoxvl8bNQ
	PAeVRc3bRfL4uIp82aO1JJeBt+nGNn60SJ8KLV3NzGWydNeS8NDdnW/OvC4t5Awz
	VMD2FsdUNc3meiMwA05YNxPK2VXr0Pb79QmK4MZrNLPCivTmgf3xfxkukFdShEwP
	woB+Q+gQTPAagvm1e/DNFroWQXW8u53lyZQficjetY7657g3hu8zK6Yd5Kjq+674
	1Z2fpYRDe7pxPINhQ7xVadokNEk62vd9zzzuRsTmNln4FtmBEsPpiwmAKHaXVbrG
	CqYc/m19r7Eb4X06UR4tX8WYyCdCIT8UxaJinRc1a8R76rKHPjthnHPNQ1jjVZAh
	Tys+YA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7r4hbm5x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 04:37:43 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2bda35eab74so4077425eec.0
        for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 21:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774931862; x=1775536662; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jF85H2GHE+7UGzxJyreadfp1atVe8zeWAoztPT146mg=;
        b=Oeedl7ForCWN5LuUaxKt3ynZyP59XFc7h2+Nn4lhndaEeannqUGalCRnVbmUnjhGQY
         SRq8X6BhUJ6JYIfC0a08kGPbLEPAB7rsPlV/Ym+GYsmmSr1XtaBkzHCVNKGXr6kV9CN4
         kZSluECOsQAmY8Vvc2MsNqxMJwVNPxDEt37jBy88BRqLV2IJRIJQLak0TwuBDYr2iaNM
         guod/iX1MM5AEPFF96Gnr7aL1rydR84nsRXNZtByIlhh4wu2o7Ok56qkho3Ndie12o1x
         V9AGC/xLhgksZlO/exb2gbjIuKo+VLBGo1PdERlO5UpvN7fVbkTfTeTGmunNxAXOmjyD
         mP5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774931862; x=1775536662;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jF85H2GHE+7UGzxJyreadfp1atVe8zeWAoztPT146mg=;
        b=eO6llxL6OrH/ohBHVF98xrjFgE7UI46zjyBShptzf6cLIW441aLEFO3QTZ39o9qK2w
         Qimvo8Ay/Mb3HpflVWhzdpf2OfzItTNKr4LUKVvs9tbj56H4/6F1eI/wePn7I8b7lVUp
         qbaoPp3FPkr15KjZZwDk/FCCL7Z50cCnY4FZYIY40j8zPUq6N/iLxygfpye9a/AYxhXU
         T1zqnltvTUeOs/tVhxEpnlW8SJhmc1TMVkXTnB4UVX2lw6G9PLmO70TQCMZv+gy3TBnG
         gmCkdLZ++d6R3YzUK5lqeH8L1HurjochMIO0MoIeQ+vc7DusC9JSOwjgR9tCEoOGu1qt
         kVyw==
X-Forwarded-Encrypted: i=1; AJvYcCUB+51dCpNeUl/RZK6GwmFu3IdjcVDO5sed34tlOnVhJtiNzWh+U7BKHrz5o64TTHj3wT0BQ698i0mFdg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4H9MwxG1C01PaeUh0Rqbq52psnmLw0rl59vFeVrR96kYhk1vY
	khKE/uOckDY5ZC3HUWOsdUBnw0kyBIA7szICBFS7oWj/kEOSzVGacayXdo5mG9Z3ZUztJCs0QXE
	gIACOq+f92z0FhXDBb5JRxVSApTTXCvmuwKUVAKKtu9PxwrRRLvPI+CvZQaXmhfkPuA==
X-Gm-Gg: ATEYQzxG3FF24/ENJ0vXWyVsXPiAth2YYdyb9sAcDZvdYEkjeeD+9SP652V6A6q8WRc
	ECCIc97oLNIeQOXRXYBy+5PSnikCIPFyCKvw03HdU670zFFdmQPUOTr73oigRbRoQ12lAQIFPuf
	O2XIokzKc0+Ko76FHE5pWR6swXhRm+1rb/AQ6hcM4izotSccMfUD3DebOI6IEBNfpUgswOWBLn4
	7gjXf6DF5rQc4e8U3mMtU1XIZE+Zcx6FnV4gAZ+GxICKoPINvVGZuGwt+zEA7YXzDq2r1BE6RXE
	OlNayeSOFbaKpk/XXR+giCuI5ByvzSJ8hSDofT9EnbhOVX8nJn4t3EOs2kSyE6yZrAvGWGNULZf
	OanLuTqdzkVY7qBh9zch2SRGLeqC8UY4LSwmM8EEb34pg1RUXg+3f
X-Received: by 2002:a05:7300:80cb:b0:2c0:df3b:ec1e with SMTP id 5a478bee46e88-2c7bcb2e7bdmr1099411eec.11.1774931862310;
        Mon, 30 Mar 2026 21:37:42 -0700 (PDT)
X-Received: by 2002:a05:7300:80cb:b0:2c0:df3b:ec1e with SMTP id 5a478bee46e88-2c7bcb2e7bdmr1099399eec.11.1774931861762;
        Mon, 30 Mar 2026 21:37:41 -0700 (PDT)
Received: from hu-renjiang-sha.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c3bd9894sm9252248eec.4.2026.03.30.21.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 21:37:41 -0700 (PDT)
From: Renjiang Han <renjiang.han@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 10:07:08 +0530
Subject: [PATCH 2/3] media: qcom: venus: relax encoder frame/blur dimension
 steps on v4
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-fix_venus_bug_issue-v1-2-e4ae7a1d8db2@oss.qualcomm.com>
References: <20260331-fix_venus_bug_issue-v1-0-e4ae7a1d8db2@oss.qualcomm.com>
In-Reply-To: <20260331-fix_venus_bug_issue-v1-0-e4ae7a1d8db2@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Tomasz Figa <tfiga@chromium.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Renjiang Han <renjiang.han@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774931842; l=3961;
 i=renjiang.han@oss.qualcomm.com; s=20241001; h=from:subject:message-id;
 bh=xYsLcQTGNHUKd8VrMpxYEPuruDVyUmLfia/4sp32nkE=;
 b=XpAV2TFPUZEjQ7yJ9E3qyuZpcUlV93KnuIvIqnSoqkoa/ybPTQzZEqRZ62wk/oaEpUPOYIJSY
 e1a7fSUMM2vBLwfIJPXcxsp9gbXVx3sn7XjV8fEgS9ssG9/QsA1uK5K
X-Developer-Key: i=renjiang.han@oss.qualcomm.com; a=ed25519;
 pk=8N59kMJUiVH++5QxJzTyHB/wh/kG5LxQ44j9zhUvZmw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA0MSBTYWx0ZWRfX+Ga43KAeVJM9
 Ie8TL7ybwvjPyFXy5Aqu/ARhczs4Nz+QeiT3Vt8j5ZoDqP1H0CMN7fytOhnX0Uc5HK88sPoTVQF
 yPY8Nd3rdesOnN03yTJDdzRncq8wh7l/3pKsDVaD04GPC5ei8NPgezfVORR8p4c6AIk4gfYXbwA
 aomJjIG4pmbuu+VXP5fD4ek2etv7Yd/lwmS5A1uhJlo8pSaTyfIaT21Q2Ol3+0DASzs75kgTJ+h
 SYERsYT4+THNai8muSxOndS8p6X1a60GXJEU3mfgTd19OtAeeCadtYOK3Gb9krXEt7Ytb2XXTRl
 oGN9FTrYWLFTRqlMIOiU6A/7iCC9xZsJvvrPy4dXuPVww5b7ecHRX/aDDFLhs165fMADl5GUe/p
 jmqYryNYxOijOOzcNuQgH2ye1wSW0vEM6HP7AZVG1xwd7N5uz4HFBjASfLlPdEgfuTWreIVW/bB
 smAg3m2lTr6vh94ThzA==
X-Proofpoint-ORIG-GUID: bNyeJgDLvJ8Ek9lFZyvR5Yrq9maNNxFp
X-Authority-Analysis: v=2.4 cv=PI0COPqC c=1 sm=1 tr=0 ts=69cb4f97 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=0MT3MKzd5yeUH7whqLMA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: bNyeJgDLvJ8Ek9lFZyvR5Yrq9maNNxFp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1011 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310041
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57704-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[renjiang.han@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,samsung,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C17FC363E8D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Encoder HFI capabilities on v4 advertise a 16-pixel step for frame and
blur dimensions. This is overly restrictive and can cause userspace caps
negotiation to fail even for valid resolutions.

Relax the advertised step size to 1 and keep alignment enforcement in
buffer layout and size calculations.

Fixes: 8b88cabef404e ("media: venus: hfi_plat_v4: Populate codecs and capabilities for v4")
Signed-off-by: Renjiang Han <renjiang.han@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/hfi_platform_v4.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_platform_v4.c b/drivers/media/platform/qcom/venus/hfi_platform_v4.c
index cda888b56b5d4806f10d062371b9a4969e27d9b4..e0b3652bb44093111ce610fb09366c38db516966 100644
--- a/drivers/media/platform/qcom/venus/hfi_platform_v4.c
+++ b/drivers/media/platform/qcom/venus/hfi_platform_v4.c
@@ -136,8 +136,8 @@ static const struct hfi_plat_caps caps[] = {
 	.codec = HFI_VIDEO_CODEC_H264,
 	.domain = VIDC_SESSION_TYPE_ENC,
 	.cap_bufs_mode_dynamic = true,
-	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 96, 4096, 16},
-	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 96, 4096, 16},
+	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 96, 4096, 1},
+	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 96, 4096, 1},
 	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 1, 36864, 1},
 	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 120000000, 1},
 	.caps[4] = {HFI_CAPABILITY_SCALE_X, 8192, 65536, 1},
@@ -173,8 +173,8 @@ static const struct hfi_plat_caps caps[] = {
 	.codec = HFI_VIDEO_CODEC_HEVC,
 	.domain = VIDC_SESSION_TYPE_ENC,
 	.cap_bufs_mode_dynamic = true,
-	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 96, 4096, 16},
-	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 96, 4096, 16},
+	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 96, 4096, 1},
+	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 96, 4096, 1},
 	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 1, 36864, 1},
 	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 120000000, 1},
 	.caps[4] = {HFI_CAPABILITY_SCALE_X, 8192, 65536, 1},
@@ -195,8 +195,8 @@ static const struct hfi_plat_caps caps[] = {
 	.caps[19] = {HFI_CAPABILITY_RATE_CONTROL_MODES, 0x1000001, 0x1000005, 1},
 	.caps[20] = {HFI_CAPABILITY_COLOR_SPACE_CONVERSION, 0, 2, 1},
 	.caps[21] = {HFI_CAPABILITY_ROTATION, 1, 4, 90},
-	.caps[22] = {HFI_CAPABILITY_BLUR_WIDTH, 96, 4096, 16},
-	.caps[23] = {HFI_CAPABILITY_BLUR_HEIGHT, 96, 4096, 16},
+	.caps[22] = {HFI_CAPABILITY_BLUR_WIDTH, 96, 4096, 1},
+	.caps[23] = {HFI_CAPABILITY_BLUR_HEIGHT, 96, 4096, 1},
 	.num_caps = 24,
 	.pl[0] = {HFI_HEVC_PROFILE_MAIN, HFI_HEVC_LEVEL_6 | HFI_HEVC_TIER_HIGH0},
 	.pl[1] = {HFI_HEVC_PROFILE_MAIN10, HFI_HEVC_LEVEL_6 | HFI_HEVC_TIER_HIGH0},
@@ -210,8 +210,8 @@ static const struct hfi_plat_caps caps[] = {
 	.codec = HFI_VIDEO_CODEC_VP8,
 	.domain = VIDC_SESSION_TYPE_ENC,
 	.cap_bufs_mode_dynamic = true,
-	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 96, 4096, 16},
-	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 96, 4096, 16},
+	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 96, 4096, 1},
+	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 96, 4096, 1},
 	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 1, 36864, 1},
 	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 120000000, 1},
 	.caps[4] = {HFI_CAPABILITY_SCALE_X, 8192, 65536, 1},
@@ -229,8 +229,8 @@ static const struct hfi_plat_caps caps[] = {
 	.caps[16] = {HFI_CAPABILITY_P_FRAME_QP, 0, 127, 1},
 	.caps[17] = {HFI_CAPABILITY_MAX_WORKMODES, 1, 2, 1},
 	.caps[18] = {HFI_CAPABILITY_RATE_CONTROL_MODES, 0x1000001, 0x1000005, 1},
-	.caps[19] = {HFI_CAPABILITY_BLUR_WIDTH, 96, 4096, 16},
-	.caps[20] = {HFI_CAPABILITY_BLUR_HEIGHT, 96, 4096, 16},
+	.caps[19] = {HFI_CAPABILITY_BLUR_WIDTH, 96, 4096, 1},
+	.caps[20] = {HFI_CAPABILITY_BLUR_HEIGHT, 96, 4096, 1},
 	.caps[21] = {HFI_CAPABILITY_COLOR_SPACE_CONVERSION, 0, 2, 1},
 	.caps[22] = {HFI_CAPABILITY_ROTATION, 1, 4, 90},
 	.num_caps = 23,

-- 
2.34.1


