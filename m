Return-Path: <linux-media+bounces-53842-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iAlIF40Jo2nY9AQAu9opvQ
	(envelope-from <linux-media+bounces-53842-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 16:28:13 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1010B1C3EB8
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 16:28:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1A17830CFDA5
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 15:27:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D32E47CC87;
	Sat, 28 Feb 2026 15:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HIucIMYh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gaBawpGr"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2CC47AF70
	for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 15:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772292401; cv=none; b=j7SqMu2pLpF/ZDcZlQfnUJ2TI5Aq/t2OQ3OS0dx7nYf5IKd3FW/5NbVLx0t017A4C+Ut1zMx0UG7lU7cammR0nbYQEHauINgJfxspM08Wf2CzM3uBGj9GU5dmQENK7VnY6CCPePfJKRAP08nZi8E6TJeKXG4oqyOpilu3CNbc7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772292401; c=relaxed/simple;
	bh=nUSa520FLKqjEX950txivtgMTRsmndZ/Adu76XEOkRc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qqjo2ybZ1C/WIxNUiotWrmioGH9IMO6DW753FU9Zak2w2LnZWXWQM+bOPL3tDynyVZ0w8E7GK8TQLt8IGgA7l+E+OfHiNjTadzbY2L0lTLAmQhMvHyE9BbecKkYMC1kOnyMcrn6OZt58yNIlkQF6IuO8Dl2i7ryMTm4Mmd8GSzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HIucIMYh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gaBawpGr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61SEPQF61896750
	for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 15:26:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	avNSzgeO+24+c0meZaN0I+ujV4RCxkpDE+1NQpcaAkg=; b=HIucIMYhsFYUezuc
	x2Ztq5nbcDLbvEQncHrKTIGLJTDvOzlksoeTdLddwnOOhC/B9LURYmgvZ7DnxYOV
	xPP0KMNPGgNeZzJSPREuz4xxFtccZ/7CuQ7DFJCIInWnSX1H+w8FtzLYVyb1Ok0t
	Hj5p3JSJ4V62w25dT5xwSvnMYHg4K74tPhYqLCvfm+vvRgWsrB0CckRqS7VNgBlR
	mIhzeUxds3NtW+bPY+panTxoqNp6LYDOn+XT4gLooZyuXz6OB+4rPqYegTrdUbD0
	5YAdLzHzzgB6ZWGHGDUyhVzlnlzamcDlzs3xar126XP/ffrLIWzYe/cgPrU6wBBe
	ly/3qw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksn4158d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 15:26:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8ca3ef536ddso3092315085a.0
        for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 07:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772292398; x=1772897198; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=avNSzgeO+24+c0meZaN0I+ujV4RCxkpDE+1NQpcaAkg=;
        b=gaBawpGrQ8PQaGFESrulz3HtolfGpAi74Qtla9/Y2RLq3iycar+sDdPtnBXid9SAtk
         SPc9KElO9M0f4mSc7KqvVHtxE1TOe9ngZYZp2WX1RM/XRjaS2V3WJAUhm6Rkx80JttG1
         UshR9FO4juOggtIpdIHih7njyRcySl6FS3S5PLwqzO2vKLVHTltlf3ptnCAZ2o7yadgZ
         tkQ+CCf5uUqxIokGvbaI7IG4THtpvV8EdlZP3NwM9TScThTPeg9gjpxY0Gt9BW4gSxyc
         i4uRI3BlSCPakJnbS/NAvu3/qIBUEzy1wjpiPGnqh5O8apd+ALuFILmaYJDCpsyBUQ1C
         +kyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772292398; x=1772897198;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=avNSzgeO+24+c0meZaN0I+ujV4RCxkpDE+1NQpcaAkg=;
        b=vFrZIv2z7GV7sftV5LRhu7PKShEqCHRQEj4xFV7yP79Z4wbyD8v8nTSDQMEhq78yXe
         NzUsN5AGzbTE+72W4zJqp7XS0Q2O7lxew2cTb+7voUr8CjHILVkD72P1hdYPyZ2FL21k
         Cvm/NXsoQLZPZf+YkrMehTEvsVe0M+rLBFUcIwI7wuoRlde33SY3DL/LP5MmE938rrOH
         QXjPAoL7pV3MxiNkaKH//mQwzZOUv+770xBZF3OVJXfYyVwcVmdsERoVutv9YdPtD1Ta
         Xkpx3ymjOc1uevtmcw/RlmqwWDS2ghX6ggaNDScfYGzZ8kYJy4H23f+32Cvo8ppv9Irc
         /mkQ==
X-Gm-Message-State: AOJu0Yx5RWHdnAtXvArs52Bj4/NtNQ79S8mamlJNBbIxkZBJHEvMWlvF
	s0U2k71N7km0R7iADxNkb7S/hxDLtr8acteBNG3FP2ZhS05bsBpA6Ob/C/pVO8zF0QwflWsrmc3
	oBLZ+RXPOiZF8F5bkrnn4vmN2jZyGYcSHumj9Sd6JnGQ5o+KcgyZfgtrb7f5+Ik+5LQ==
X-Gm-Gg: ATEYQzxFs1NPIeuqBjy8cJ1+cwkDQtVl1nhpGliEqmzJCAo9k/IjTRo/fTUQOncBP/W
	felCo88/57IcwrKDQ9NahhexJ/1xhW4MwWbf4kama8VDgL7geVUAoBAHNkomxhBBd4ZuE3RadEk
	1P1UCSvFYeoPP/VswaQzfAR8Mx2WssVgjbECeOPiWHva9+xsFkIOPkcdhqatQCz6S3aRJjCdt36
	bqyD6DauWUQMqnX0vG1NEWchASVWxf5tjwO0FO74SPsXE+T08WKnV5JSHZwDJ9dbk2XSkCxC8Lr
	f8HfNuBd9/ukKwJHz+qAY5wDJLd+tavUfyUtjKzzyTcXcCPBSHrfJEat7pppuUnNdowfp+VX9oW
	0hu3U/8q+86dddStOtQOLo1OgrZVy0EEwERbsDNkUIz8NYDHolWzCfDFXmOAdVuvdCPvjEuVcF+
	nT8Ilvqm6RFfUWLB1hqvtVfGJcK3or4a1sW8Y=
X-Received: by 2002:a05:620a:28c3:b0:8ca:305b:748e with SMTP id af79cd13be357-8cbc8e1d7a1mr877885085a.57.1772292398039;
        Sat, 28 Feb 2026 07:26:38 -0800 (PST)
X-Received: by 2002:a05:620a:28c3:b0:8ca:305b:748e with SMTP id af79cd13be357-8cbc8e1d7a1mr877880885a.57.1772292397473;
        Sat, 28 Feb 2026 07:26:37 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a115b57922sm625558e87.63.2026.02.28.07.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 07:26:36 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 28 Feb 2026 17:26:31 +0200
Subject: [PATCH v2 04/11] media: qcom: iris: simplify HFI params handling
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260228-iris-platform-data-v2-4-acf036a3c84c@oss.qualcomm.com>
References: <20260228-iris-platform-data-v2-0-acf036a3c84c@oss.qualcomm.com>
In-Reply-To: <20260228-iris-platform-data-v2-0-acf036a3c84c@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=13412;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=nUSa520FLKqjEX950txivtgMTRsmndZ/Adu76XEOkRc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpowkmWPzUAIzZaOKjb4RERqOA7q7zuS7QbQ8xj
 KjTKuGP8GaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaaMJJgAKCRCLPIo+Aiko
 1fTDB/9hj4z70Xtx0qQ38HDijDws2yRgN2YtT1X7BrRUCXJFr7CvqPd/486bibTH0iOwNNxP7rn
 xp5D4fJjZPQGczcSx25VvCYqo6wdoQjIVBnsLuymwdvsXpIkOhptqZhrryZIVu43U+k4obkdk7/
 4ZT1SuYdoGu0iImclsGdyDN6DgU1K9oRUvqrtYp87PueQPu+xicTOUtxB2wEKVm00s6kTgv7Kr3
 irA9AczCPQQTMcRWSizzbkAVfbvmDX6hY9kp6Lz9ecS+66tScqTUN6K1vPBry0/GBL0FSnylBFS
 Z5ls90n85eeuasBGV0o0tmEOtNvewEd4w4eao2Vag+2aDm8/
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Tq3rRTXh c=1 sm=1 tr=0 ts=69a3092f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=vZ3IETys5ARFP0fKc9YA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: tYALO_CIgTBcTnZDadEsyPSvZ6OW07k6
X-Proofpoint-GUID: tYALO_CIgTBcTnZDadEsyPSvZ6OW07k6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDE0MiBTYWx0ZWRfX5IQU3FE2IiK5
 2W2JzTq+UizqkWG69Tk8zn7iRO+SfrwXWw2oECy2QcJM++AuQHjUmTpWUR72++UMmHUCtC/pBHz
 khj2dvr9L0Dbbv72J7ZY+takAjYdgvLGK5R9kokRYPD4ZLbUuYyRFdviZie9XzFabSHq6/YXqaV
 Ee8PzSviW9XBIGFTPtxMw/v16mVq0bjnbjtOddeM2f743ataP3jyGoTrdgCBZUf/aO4LEstOe9n
 hb6X4AnChKfm1Jsl+X4yTFFCXP+loFDkfI9XhLaF8ibr0XEhC+EEviOPoAuM74veTx6pMPUF52X
 kbO5//+JRNTEeZxUxqk45SPCedhkb3vqK32qt3pp0JP9hs8l3sn5vEgEqY4n1a+rNmiqAdIfkap
 tRLcPGLRrqzDjZy0t8KP6DAlHvGDc05roM/Y+S5zR77TMzNfzjJrgihc90zh6XQu9O5l3m1UEqT
 dEjE1VhhnqsHtB/zSkw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_05,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602280142
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53842-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1010B1C3EB8
X-Rspamd-Action: no action

Instead of looping over two tables to select the static order of
functions, call necessary functsions directly in the correct order.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../platform/qcom/iris/iris_hfi_gen1_command.c     | 116 ++++-----------
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 160 +++++++++++----------
 2 files changed, 108 insertions(+), 168 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index d5eaf8763f6d..b7aafda1d99e 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -978,107 +978,41 @@ static int iris_hfi_gen1_set_stride(struct iris_inst *inst, u32 plane)
 	return hfi_gen1_set_property(inst, ptype, &plane_actual_info, sizeof(plane_actual_info));
 }
 
-static const u32 iris_hfi_gen1_vdec_input_config_param[] = {
-	HFI_PROPERTY_CONFIG_VIDEOCORES_USAGE,
-	HFI_PROPERTY_PARAM_UNCOMPRESSED_FORMAT_SELECT,
-	HFI_PROPERTY_PARAM_UNCOMPRESSED_PLANE_ACTUAL_CONSTRAINTS_INFO,
-	HFI_PROPERTY_PARAM_BUFFER_COUNT_ACTUAL,
-	HFI_PROPERTY_PARAM_VDEC_MULTI_STREAM,
-	HFI_PROPERTY_PARAM_FRAME_SIZE,
-	HFI_PROPERTY_PARAM_BUFFER_SIZE_ACTUAL,
-	HFI_PROPERTY_PARAM_BUFFER_ALLOC_MODE,
-};
-
-static const u32 iris_hfi_gen1_venc_input_config_param[] = {
-	HFI_PROPERTY_CONFIG_FRAME_RATE,
-	HFI_PROPERTY_PARAM_UNCOMPRESSED_PLANE_ACTUAL_INFO,
-	HFI_PROPERTY_PARAM_FRAME_SIZE,
-	HFI_PROPERTY_PARAM_UNCOMPRESSED_FORMAT_SELECT,
-	HFI_PROPERTY_PARAM_BUFFER_COUNT_ACTUAL,
-};
-
 static int iris_hfi_gen1_session_set_config_params(struct iris_inst *inst, u32 plane)
 {
-	struct iris_hfi_prop_type_handle const *handler = NULL;
-	u32 handler_size = 0;
-	u32 config_params_size, i, j;
-	const u32 *config_params;
 	int ret;
 
-	static const struct iris_hfi_prop_type_handle vdec_prop_type_handle_inp_arr[] = {
-		{HFI_PROPERTY_PARAM_FRAME_SIZE,
-			iris_hfi_gen1_set_resolution},
-		{HFI_PROPERTY_CONFIG_VIDEOCORES_USAGE,
-			iris_hfi_gen1_decide_core},
-		{HFI_PROPERTY_PARAM_UNCOMPRESSED_FORMAT_SELECT,
-			iris_hfi_gen1_set_raw_format},
-		{HFI_PROPERTY_PARAM_UNCOMPRESSED_PLANE_ACTUAL_CONSTRAINTS_INFO,
-			iris_hfi_gen1_set_format_constraints},
-		{HFI_PROPERTY_PARAM_BUFFER_COUNT_ACTUAL,
-			iris_hfi_gen1_set_num_bufs},
-		{HFI_PROPERTY_PARAM_VDEC_MULTI_STREAM,
-			iris_hfi_gen1_set_multistream},
-		{HFI_PROPERTY_PARAM_BUFFER_SIZE_ACTUAL,
-			iris_hfi_gen1_set_bufsize},
-	};
-
-	static const struct iris_hfi_prop_type_handle vdec_prop_type_handle_out_arr[] = {
-		{HFI_PROPERTY_PARAM_FRAME_SIZE,
-			iris_hfi_gen1_set_resolution},
-		{HFI_PROPERTY_PARAM_UNCOMPRESSED_FORMAT_SELECT,
-			iris_hfi_gen1_set_raw_format},
-		{HFI_PROPERTY_PARAM_UNCOMPRESSED_PLANE_ACTUAL_CONSTRAINTS_INFO,
-			iris_hfi_gen1_set_format_constraints},
-		{HFI_PROPERTY_PARAM_BUFFER_COUNT_ACTUAL,
-			iris_hfi_gen1_set_num_bufs},
-		{HFI_PROPERTY_PARAM_VDEC_MULTI_STREAM,
-			iris_hfi_gen1_set_multistream},
-		{HFI_PROPERTY_PARAM_BUFFER_SIZE_ACTUAL,
-			iris_hfi_gen1_set_bufsize},
-	};
-
-	static const struct iris_hfi_prop_type_handle venc_prop_type_handle_inp_arr[] = {
-		{HFI_PROPERTY_CONFIG_FRAME_RATE,
-			iris_hfi_gen1_set_frame_rate},
-		{HFI_PROPERTY_PARAM_UNCOMPRESSED_PLANE_ACTUAL_INFO,
-			iris_hfi_gen1_set_stride},
-		{HFI_PROPERTY_PARAM_FRAME_SIZE,
-			iris_hfi_gen1_set_resolution},
-		{HFI_PROPERTY_PARAM_UNCOMPRESSED_FORMAT_SELECT,
-			iris_hfi_gen1_set_raw_format},
-		{HFI_PROPERTY_PARAM_BUFFER_COUNT_ACTUAL,
-			iris_hfi_gen1_set_num_bufs},
-	};
-
 	if (inst->domain == DECODER) {
-		config_params = iris_hfi_gen1_vdec_input_config_param;
-		config_params_size = ARRAY_SIZE(iris_hfi_gen1_vdec_input_config_param);
 		if (V4L2_TYPE_IS_OUTPUT(plane)) {
-			handler = vdec_prop_type_handle_inp_arr;
-			handler_size = ARRAY_SIZE(vdec_prop_type_handle_inp_arr);
-		} else if (V4L2_TYPE_IS_CAPTURE(plane)) {
-			handler = vdec_prop_type_handle_out_arr;
-			handler_size = ARRAY_SIZE(vdec_prop_type_handle_out_arr);
+			ret = iris_hfi_gen1_decide_core(inst, plane);
+			if (ret)
+				return ret;
 		}
-	} else {
-		config_params = iris_hfi_gen1_venc_input_config_param;
-		config_params_size = ARRAY_SIZE(iris_hfi_gen1_venc_input_config_param);
-		handler = venc_prop_type_handle_inp_arr;
-		handler_size = ARRAY_SIZE(venc_prop_type_handle_inp_arr);
-	}
 
-	for (i = 0; i < config_params_size; i++) {
-		for (j = 0; j < handler_size; j++) {
-			if (handler[j].type == config_params[i]) {
-				ret = handler[j].handle(inst, plane);
-				if (ret)
-					return ret;
-				break;
-			}
-		}
+		ret = iris_hfi_gen1_set_raw_format(inst, plane);
+		if (!ret)
+			ret = iris_hfi_gen1_set_format_constraints(inst, plane);
+		if (!ret)
+			ret = iris_hfi_gen1_set_num_bufs(inst, plane);
+		if (!ret)
+			ret = iris_hfi_gen1_set_multistream(inst, plane);
+		if (!ret)
+			ret = iris_hfi_gen1_set_resolution(inst, plane);
+		if (!ret)
+			ret = iris_hfi_gen1_set_bufsize(inst, plane);
+	} else {
+		ret = iris_hfi_gen1_set_frame_rate(inst, plane);
+		if (!ret)
+			ret = iris_hfi_gen1_set_stride(inst, plane);
+		if (!ret)
+			ret = iris_hfi_gen1_set_resolution(inst, plane);
+		if (!ret)
+			ret = iris_hfi_gen1_set_raw_format(inst, plane);
+		if (!ret)
+			ret = iris_hfi_gen1_set_num_bufs(inst, plane);
 	}
 
-	return 0;
+	return ret;
 }
 
 static const struct iris_hfi_command_ops iris_hfi_gen1_command_ops = {
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 52fd1fd51946..28f352d99bf0 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -644,103 +644,109 @@ static const u32 iris_hfi_gen2_vdec_input_config_params_av1[] = {
 	HFI_PROP_SIGNAL_COLOR_INFO,
 };
 
-static const u32 iris_hfi_gen2_venc_input_config_params[] = {
-	HFI_PROP_COLOR_FORMAT,
-	HFI_PROP_RAW_RESOLUTION,
-	HFI_PROP_CROP_OFFSETS,
-	HFI_PROP_LINEAR_STRIDE_SCANLINE,
-	HFI_PROP_SIGNAL_COLOR_INFO,
-};
-
-static const u32 iris_hfi_gen2_vdec_output_config_params[] = {
-	HFI_PROP_OPB_ENABLE,
-	HFI_PROP_COLOR_FORMAT,
-	HFI_PROP_LINEAR_STRIDE_SCANLINE,
-};
-
-static const u32 iris_hfi_gen2_venc_output_config_params[] = {
-	HFI_PROP_BITSTREAM_RESOLUTION,
-	HFI_PROP_CROP_OFFSETS,
-	HFI_PROP_FRAME_RATE,
-};
-
 static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 plane)
 {
-	u32 config_params_size = 0, i, j;
-	const u32 *config_params = NULL;
 	int ret;
 
-	static const struct iris_hfi_prop_type_handle prop_type_handle_arr[] = {
-		{HFI_PROP_RAW_RESOLUTION,             iris_hfi_gen2_set_raw_resolution         },
-		{HFI_PROP_BITSTREAM_RESOLUTION,       iris_hfi_gen2_set_bitstream_resolution   },
-		{HFI_PROP_CROP_OFFSETS,               iris_hfi_gen2_set_crop_offsets           },
-		{HFI_PROP_CODED_FRAMES,               iris_hfi_gen2_set_coded_frames           },
-		{HFI_PROP_LUMA_CHROMA_BIT_DEPTH,      iris_hfi_gen2_set_bit_depth              },
-		{HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT, iris_hfi_gen2_set_min_output_count       },
-		{HFI_PROP_PIC_ORDER_CNT_TYPE,         iris_hfi_gen2_set_picture_order_count    },
-		{HFI_PROP_SIGNAL_COLOR_INFO,          iris_hfi_gen2_set_colorspace             },
-		{HFI_PROP_PROFILE,                    iris_hfi_gen2_set_profile                },
-		{HFI_PROP_LEVEL,                      iris_hfi_gen2_set_level                  },
-		{HFI_PROP_OPB_ENABLE,                 iris_hfi_gen2_set_opb_enable             },
-		{HFI_PROP_COLOR_FORMAT,               iris_hfi_gen2_set_colorformat            },
-		{HFI_PROP_LINEAR_STRIDE_SCANLINE,     iris_hfi_gen2_set_linear_stride_scanline },
-		{HFI_PROP_TIER,                       iris_hfi_gen2_set_tier                   },
-		{HFI_PROP_FRAME_RATE,                 iris_hfi_gen2_set_frame_rate             },
-		{HFI_PROP_AV1_FILM_GRAIN_PRESENT,     iris_hfi_gen2_set_film_grain             },
-		{HFI_PROP_AV1_SUPER_BLOCK_ENABLED,    iris_hfi_gen2_set_super_block            },
-		{HFI_PROP_OPB_ENABLE,                 iris_hfi_gen2_set_opb_enable             },
-	};
-
 	if (inst->domain == DECODER) {
 		if (V4L2_TYPE_IS_OUTPUT(plane)) {
 			if (inst->codec == V4L2_PIX_FMT_H264) {
-				config_params = iris_hfi_gen2_vdec_input_config_params_avc;
-				config_params_size =
-					ARRAY_SIZE(iris_hfi_gen2_vdec_input_config_params_avc);
+				ret = iris_hfi_gen2_set_bitstream_resolution(inst, plane);
+				if (!ret)
+					ret = iris_hfi_gen2_set_crop_offsets(inst, plane);
+				if (!ret)
+					ret = iris_hfi_gen2_set_bit_depth(inst, plane);
+				if (!ret)
+					ret = iris_hfi_gen2_set_coded_frames(inst, plane);
+				if (!ret)
+					ret = iris_hfi_gen2_set_min_output_count(inst, plane);
+				if (!ret)
+					ret = iris_hfi_gen2_set_picture_order_count(inst, plane);
+				if (!ret)
+					ret = iris_hfi_gen2_set_profile(inst, plane);
+				if (!ret)
+					ret = iris_hfi_gen2_set_level(inst, plane);
+				if (!ret)
+					ret = iris_hfi_gen2_set_colorspace(inst, plane);
 			} else if (inst->codec == V4L2_PIX_FMT_HEVC) {
-				config_params = iris_hfi_gen2_vdec_input_config_params_hevc;
-				config_params_size =
-					ARRAY_SIZE(iris_hfi_gen2_vdec_input_config_params_hevc);
+				ret = iris_hfi_gen2_set_bitstream_resolution(inst, plane);
+				if (!ret)
+					ret = iris_hfi_gen2_set_crop_offsets(inst, plane);
+				if (!ret)
+					ret = iris_hfi_gen2_set_bit_depth(inst, plane);
+				if (!ret)
+					ret = iris_hfi_gen2_set_min_output_count(inst, plane);
+				if (!ret)
+					ret = iris_hfi_gen2_set_profile(inst, plane);
+				if (!ret)
+					ret = iris_hfi_gen2_set_level(inst, plane);
+				if (!ret)
+					ret = iris_hfi_gen2_set_tier(inst, plane);
+				if (!ret)
+					ret = iris_hfi_gen2_set_colorspace(inst, plane);
 			} else if (inst->codec == V4L2_PIX_FMT_VP9) {
-				config_params = iris_hfi_gen2_vdec_input_config_params_vp9;
-				config_params_size =
-					ARRAY_SIZE(iris_hfi_gen2_vdec_input_config_params_vp9);
+				ret = iris_hfi_gen2_set_bitstream_resolution(inst, plane);
+				if (!ret)
+					ret = iris_hfi_gen2_set_crop_offsets(inst, plane);
+				if (!ret)
+					ret = iris_hfi_gen2_set_bit_depth(inst, plane);
+				if (!ret)
+					ret = iris_hfi_gen2_set_min_output_count(inst, plane);
+				if (!ret)
+					ret = iris_hfi_gen2_set_profile(inst, plane);
+				if (!ret)
+					ret = iris_hfi_gen2_set_level(inst, plane);
 			} else if (inst->codec == V4L2_PIX_FMT_AV1) {
-				config_params = iris_hfi_gen2_vdec_input_config_params_av1;
-				config_params_size =
-					ARRAY_SIZE(iris_hfi_gen2_vdec_input_config_params_av1);
+				ret = iris_hfi_gen2_set_bitstream_resolution(inst, plane);
+				if (!ret)
+					ret = iris_hfi_gen2_set_crop_offsets(inst, plane);
+				if (!ret)
+					ret = iris_hfi_gen2_set_bit_depth(inst, plane);
+				if (!ret)
+					ret = iris_hfi_gen2_set_min_output_count(inst, plane);
+				if (!ret)
+					ret = iris_hfi_gen2_set_profile(inst, plane);
+				if (!ret)
+					ret = iris_hfi_gen2_set_level(inst, plane);
+				if (!ret)
+					ret = iris_hfi_gen2_set_tier(inst, plane);
+				if (!ret)
+					ret = iris_hfi_gen2_set_film_grain(inst, plane);
+				if (!ret)
+					ret = iris_hfi_gen2_set_super_block(inst, plane);
+				if (!ret)
+					ret = iris_hfi_gen2_set_colorspace(inst, plane);
 			} else {
-				return -EINVAL;
+				ret = -EINVAL;
 			}
 		} else {
-			config_params = iris_hfi_gen2_vdec_output_config_params;
-			config_params_size = ARRAY_SIZE(iris_hfi_gen2_vdec_output_config_params);
+			ret = iris_hfi_gen2_set_opb_enable(inst, plane);
+			if (!ret)
+				ret = iris_hfi_gen2_set_colorformat(inst, plane);
+			if (!ret)
+				ret = iris_hfi_gen2_set_linear_stride_scanline(inst, plane);
 		}
 	} else {
 		if (V4L2_TYPE_IS_OUTPUT(plane)) {
-			config_params = iris_hfi_gen2_venc_input_config_params;
-			config_params_size = ARRAY_SIZE(iris_hfi_gen2_venc_input_config_params);
+			ret = iris_hfi_gen2_set_colorformat(inst, plane);
+			if (!ret)
+				ret = iris_hfi_gen2_set_raw_resolution(inst, plane);
+			if (!ret)
+				ret = iris_hfi_gen2_set_crop_offsets(inst, plane);
+			if (!ret)
+				ret = iris_hfi_gen2_set_linear_stride_scanline(inst, plane);
+			if (!ret)
+				ret = iris_hfi_gen2_set_colorspace(inst, plane);
 		} else {
-			config_params = iris_hfi_gen2_venc_output_config_params;
-			config_params_size = ARRAY_SIZE(iris_hfi_gen2_venc_output_config_params);
+			ret = iris_hfi_gen2_set_bitstream_resolution(inst, plane);
+			if (!ret)
+				ret = iris_hfi_gen2_set_crop_offsets(inst, plane);
+			if (!ret)
+				ret = iris_hfi_gen2_set_frame_rate(inst, plane);
 		}
 	}
 
-	if (!config_params || !config_params_size)
-		return -EINVAL;
-
-	for (i = 0; i < config_params_size; i++) {
-		for (j = 0; j < ARRAY_SIZE(prop_type_handle_arr); j++) {
-			if (prop_type_handle_arr[j].type == config_params[i]) {
-				ret = prop_type_handle_arr[j].handle(inst, plane);
-				if (ret)
-					return ret;
-				break;
-			}
-		}
-	}
-
-	return 0;
+	return ret;
 }
 
 static int iris_hfi_gen2_session_set_codec(struct iris_inst *inst)

-- 
2.47.3


