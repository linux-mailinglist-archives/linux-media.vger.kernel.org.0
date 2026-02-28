Return-Path: <linux-media+bounces-53818-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0E7xA+anomkK4wQAu9opvQ
	(envelope-from <linux-media+bounces-53818-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 09:31:34 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7888D1C166A
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 09:31:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B56C03079084
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 08:29:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F02B3D9051;
	Sat, 28 Feb 2026 08:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aerP9j01";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EkBCajz4"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39733E8C65
	for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 08:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772267347; cv=none; b=SNzw/gIFh5c36CuasujaGIAwr+qsvAyDMa1VehSjAJGhbQZoq9Vg7u2l6NdGr+PQAfUlOqjG79e9+2tX1J1WOWYUgrf/8jjb56cMQ/QwBdaIz7WYPQWIZzB1emQIz41+yIHfXVU/palDdsOqnw22sPM8MVQkJZDEuPqKHSYwSV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772267347; c=relaxed/simple;
	bh=+ySIBX4LSmJwOCTjpMuPd68caYQXqYzF98IRNCzeQjQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WgXrcXamu+/dIhbvslR5EAbul2EGvSZYn3MZ3jFrpKNdtUwe0ca0u7o3lpBuFNi/5UQVUbuZRBJnJEqH6ARgSW17o5Mz2mEMcuop96r+WgVQkp38Fiu3JfTnQtcaI3juXMrylDTX7mfcNIyEYZzlLpjSJohd8ZE/XXEzzBLXSWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aerP9j01; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EkBCajz4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61S6Ni5q1782459
	for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 08:29:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NEyQLQByyxy9urnjJvJEI9YkeBQSmU6Zo1jDjLygxGY=; b=aerP9j01zRHMHM4F
	ow4TxzTdJRPWo2rWLLqYwO403KOTeHv85LyVRpBaX7PEAuTH6TqkV8a4u9u4Fx71
	zwzEcKM8v5VP8HexjwJZl9UjFVR5AjJigEVtF16HZNmTCWD6RvejRE6/DLynj8BW
	j7MNbJyIhxB5w0AczAz3Fdgu0kXpp88e+BLzflSj8RzOMzWiUQrxG4JKLyvki1p6
	gqWoRZTQWYNTXye4KiMHIXIqwwmyYQ+xefmhBZthUErWiiEoAYCm/JTgS9BkLA9F
	Ytoa+LO0FYeW3LNqwsLSRQBFDN7lxI37WRZ5ArE0prXrKcQ3UxDmaxzoN4gHzjqx
	rlzDVg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksgrrj1n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 08:29:03 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50333a8184aso380448021cf.1
        for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 00:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772267342; x=1772872142; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NEyQLQByyxy9urnjJvJEI9YkeBQSmU6Zo1jDjLygxGY=;
        b=EkBCajz4dO7b+RC9sa2BWgTCM7fkP4MMLG2o0i7TYfAF38tgTV9hIYPtwtY89Dy9d4
         b5UtT1HaFevEBdfHKFnuU+b7gsd7aD5nEl6On0xa06b7L5XF1XqCQ/XbaI23PaRe7bkf
         1mXjn6uB9QGh2M6GjGCG4GAzUaQ3Ay/Atp1fVmIMsDqOldQC57Fusb9rxxit4N72zxuD
         4VJ8GY5vNVooqlYGbUftQlq3IVqHGttlyj6MaQcJ3HcBMyiDADD8JUqNe86jzokIgqpa
         Bq+/co7CHyWfGpC6+o3sKJD7W3yPUCHgxp8CM/blbGAb0wOGn+a/bhjzOw8YREjsZej3
         Qcpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772267342; x=1772872142;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NEyQLQByyxy9urnjJvJEI9YkeBQSmU6Zo1jDjLygxGY=;
        b=gWXLwovkdIOsM/upwD9Z2kBO+zuny+UmzguVtMufPQzTNDZHIYKiDjw9tSGAF2KtqT
         xaN4OE1qwQXxX86WZteBf5Iq/V8EJy4W4xhnDTSPA6lucIs/Vhd43hr2pSCffyBTuxV5
         I5TWcj9dlmrd0SQikO3rbdksa8IZz3EXZulFkzhWgokCJVVYzLVi4WvnYNmjAe65HgEe
         3uGQpBMVrajXYsko3l54GpBSUPaocjicl5M9BnWNuOzyep25kIngN70RMG5hYV+8cNKf
         QsqSPys0T8WjEjZJSDDjMGJhk7U631tDoeuPqPMBr3c9umCCkuyDzT2zSvrGVmwEtUOz
         aFxQ==
X-Gm-Message-State: AOJu0YwGmBIEG73VwILdsNZg/bW+vvI0VIiu9MlQNmqVT8EJJDvu61DI
	tPdQMo2Lrh/lTCzKElqXxnns4Gz7piH9rT3yBDz0yA1bsY7FQQmppvrLriKM6OTQW5g+iSIjvkq
	YHcsLQR2ReywdWF0dUfyroyfPTaJxWFoBcZ65zoHVJBM65LCH2+08ueVq+117ueZS1w==
X-Gm-Gg: ATEYQzwXC+aUrBABTO+c97UsEEvqYZ9KmKEloNYdGdWlmqWb9RK3Ivf/ANfjw0MLjqT
	PbzY337vAb7heOHkT+Fm49EICaE0kdBj8xBLNC+FTrU+LVRA8fw/jTeMJGyt+v3Lu4f31wifxR4
	r9XcJc/VwEb9dftGgTcFm6GJhgllYPhzGsDvYMPq44NcvoTQns4ZflAJfrkiqgWVgFbrOkSCoZc
	BFNgqiHv7p0Zc7HrKFu50kCCzh8V37UhaQee9CO9XEAaGZO1EwsIuudvWiY4ZAyQkbnQEvPuM0P
	CNegeHra/5gaM9srGU/20O26hDLptWGOS4YyMOt/F8VybHvieEi679oyEkGsSHNTnQr4mUzOytX
	oprLZBSmHk4WEPRHmkz0BOkxHtpKG9oPrFbA5ifrIjjf3IYiPC1CEKZVZt8JXai6YCIT78Baxsw
	WQDO1KmoP/3NDEfXui9yZZD/wZXLfCjtLu3Mg=
X-Received: by 2002:a05:620a:4509:b0:8c5:338b:bfa0 with SMTP id af79cd13be357-8cbc8e7dc6dmr729778385a.20.1772267342000;
        Sat, 28 Feb 2026 00:29:02 -0800 (PST)
X-Received: by 2002:a05:620a:4509:b0:8c5:338b:bfa0 with SMTP id af79cd13be357-8cbc8e7dc6dmr729776485a.20.1772267341428;
        Sat, 28 Feb 2026 00:29:01 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f2f4b158sm17970711fa.6.2026.02.28.00.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 00:29:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 28 Feb 2026 10:28:49 +0200
Subject: [PATCH 04/11] media: qcom: iris: simplify HFI params handling
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260228-iris-platform-data-v1-4-c2c53539f948@oss.qualcomm.com>
References: <20260228-iris-platform-data-v1-0-c2c53539f948@oss.qualcomm.com>
In-Reply-To: <20260228-iris-platform-data-v1-0-c2c53539f948@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=13960;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=+ySIBX4LSmJwOCTjpMuPd68caYQXqYzF98IRNCzeQjQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpoqdA4afJEIUr6oOZ+xRFQwyX7C1+0/5P6mHiB
 S+6aFIDwkqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaaKnQAAKCRCLPIo+Aiko
 1ShjB/wJmtXKZEqdpsm0LDUTa6cqc6wjlVvGk16ge1/FA7zaN1wz95vlytmTDYDKTpzQwZO00O2
 EyWsU9OMqGygQrpgMkMRIAG4YfJEbk3FpeMQcmvQpeUkpUcPuDL5yOyeOz8zG9/Lj3QX1xgraEJ
 mI9tLflULITETf0TXPrHWyPNOW9QcwzpfxesZmTwKwAqOY+IMi99uJUqb/AVuuCl5YqkSwYz8eg
 koB6z7f6QlRBuve8ktZiukKbMWSotlGA14gCHa+PcDNxTcjx5kJwaDOBUCmEUgiz1HAwMdSoB1S
 niisCO8teos89+6biwl4k/6Ywgyfy/mxVNR+9Jgj9GpshJo1
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDA3NyBTYWx0ZWRfX+U7bktaR4Umw
 Ru9xfT/adZXjJp0e3IWB/mnCV4N40KIXwOO9wz8AcJ4YY73lgmwsKUG62fMQmNNptxDiVsg/jcO
 XgALbLJT5QxflBxOHNaERXkukedM0K5N7DT0osI6i0i4s/vt2qxKs+19qKGygW4myvsN3FvpNGY
 pRgbKfJtwonZW2QT6UigzyFYsTRMBwjRnrpPWy8s42Y4hZeTZU3YVuGag2zKt0g8o7hPnDT6MGp
 5TM37rXgUhW5vvM+qnpfAzguegJ10eZUHbxj9khiAb+HmkYerNy0q0iMZiZUresGU8RS2yyBThg
 fFb4vYzz1SCUbLyhoBONPRyGO5hg7dvbxj60y8f4x2S+s0xAr9fwVk+j4ekYjdZbxlr6TdPdUqd
 yayU+/JCtYvwhcXD7oQ9OI3w2HRpYDHKeWn+EE8GBZU/UwAiWd7RULC5mtg1b4l5oNo10UXQAgJ
 FLLGkX4DWRvpqo3U09A==
X-Proofpoint-GUID: pv6YIXxhrxSwzFaEN4IA6ZMCz2374ZaK
X-Proofpoint-ORIG-GUID: pv6YIXxhrxSwzFaEN4IA6ZMCz2374ZaK
X-Authority-Analysis: v=2.4 cv=Zqzg6t7G c=1 sm=1 tr=0 ts=69a2a74f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=vZ3IETys5ARFP0fKc9YA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602280077
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53818-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 7888D1C166A
X-Rspamd-Action: no action

Instead of looping over two tables to select the static order of
functions, call necessary functsions directly in the correct order.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../platform/qcom/iris/iris_hfi_gen1_command.c     | 116 ++++-----------
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 164 +++++++++++----------
 2 files changed, 110 insertions(+), 170 deletions(-)

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
index de43d90b5a2d..28f352d99bf0 100644
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
@@ -917,8 +923,8 @@ static int iris_hfi_gen2_subscribe_change_param(struct iris_inst *inst, u32 plan
 
 	switch (inst->codec) {
 	case V4L2_PIX_FMT_H264:
-		change_param = iris_hfi_gen2_vdec_input_config_params_h264;
-		change_param_size = ARRAY_SIZE(iris_hfi_gen2_vdec_input_config_params_h264);
+		change_param = iris_hfi_gen2_vdec_input_config_params_avc;
+		change_param_size = ARRAY_SIZE(iris_hfi_gen2_vdec_input_config_params_avc);
 		break;
 	case V4L2_PIX_FMT_HEVC:
 		change_param = iris_hfi_gen2_vdec_input_config_params_hevc;

-- 
2.47.3


