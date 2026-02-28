Return-Path: <linux-media+bounces-53833-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPq3Mle6omnv5AQAu9opvQ
	(envelope-from <linux-media+bounces-53833-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 10:50:15 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 453C51C1D16
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 10:50:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F25CF3041791
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 09:50:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 590F140FDB7;
	Sat, 28 Feb 2026 09:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bF5hHyuN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="STDs1DrJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2876F355F54
	for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 09:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772272197; cv=none; b=F6qpUV1cEe4zR2qlI8nECKsE+qNQE6JMj4V5ylU2Mjzy+ZTOc+HvjIx0ZTyeQqvTjC6G4jTEeyYPh8L98mvvwcg5Y6Gn2EBuEvA8Aj0WuM3GQ33Fly0/5nYZDwP+oS/6YlKOfGUOe10gF63W+k9YHaNw17rSn2ePV2/clE5CtfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772272197; c=relaxed/simple;
	bh=59o113IRp7T+/aHGWWfZMJf4LNlY4k+iIPM3ZO07ad8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=kqv8rQj+GGkpJth1fUVu5xVctGpWfFmQYjsMGc+FT8dGsENok+0N0F1lVTXl0LtzMw1c2TWavoxpE3n2k1aL3BnM1e6vnlmyzvCLhwst0Q4SZAHVFX8NLsCDLtE0mgI0IkIwB7gBo3x5R074DzbkaNgboNh6hunLPWz8c699C08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bF5hHyuN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=STDs1DrJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61S907Xw1684879
	for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 09:49:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=StoD4H4S87GO1jzJ7w8HMW
	WAAln9eUNupmiDKmuGuq8=; b=bF5hHyuNwbcH08I4DBcS1UaKxUUCDUuyUGNcHT
	Qc+rdJUuPZk3AybhQG4vg4+HG/3NtBSfXvTva8WMyRTTJNhqrjXKe/iVuEMP7ppr
	OzxORw57f80mb+okEriwk4vs/K8pm6yMdEyRK8Y0uM2bZjp9a1K3yO0d7/SKuIny
	CqJL1kw+J0EIzFY9B4NtcluQf8uHBaGMKNn7c8wXiHoPP/yOUYIuyMn3v47dYQHf
	SWvv9R5Fg/TzRZKI7cUbAAzTVarAANKTTkuCD22vDAXzx2oKd7vEGSPDofwy9dyL
	uIiHl3daQDDkWCaVKa5FPTVUQ8jjPle6GpXag/ryXB32auBQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ckshkrk10-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 09:49:55 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-899e89bf366so24924906d6.0
        for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 01:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772272194; x=1772876994; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=StoD4H4S87GO1jzJ7w8HMWWAAln9eUNupmiDKmuGuq8=;
        b=STDs1DrJFGhU8EWYpVAlJcRcpWP5qvdolpKTJukMDUdFajQgDjuDl/FC6t3Bz7cqK2
         f5LFu1Xh50zUxmqm71KWDofz1PvNT6+SrEAbT3M4hcUG0/EI5l0hb7CoBLMUyvM3rRAj
         1jvFi+77UtqCpxNt6oRmdVpka+ZJAVHli8zlo5Ifcm9e+iFqxoK9OLxugT8Q6ymCgs3P
         T2ssfkNCPPbzsnAZiybQuU5oQ4Cgd5SZkKd7SiMdsKhtqCIVgx1JGUJzFpjB8Sxdn/aY
         2nzEMyOjx+ovYyc7ZraCRAcXNiU5AzqEzyRoW4lnI+1+J78vIGjjro8x5/P39s+AOR3b
         8MQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772272194; x=1772876994;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=StoD4H4S87GO1jzJ7w8HMWWAAln9eUNupmiDKmuGuq8=;
        b=Ose+6cugfLRPWYHRu0gNoQSs9dp5UauG7YZ4DsjRhXKMuHxCi6ombgmxBPgDAOLBTA
         jcmL89Q44Hj7RRkN6kCZiF+hiK0dbXd6XvDUdgMNk+JLlQh+4xfPx67/Iira1IctrBD3
         HS75UayPYnP8c1e2Gkwh9QJUD+shLh2dwU3o6gczbhj9ugJXOb+v8TlStq5xePOaYxbn
         Ijrxbne92DmK84m/52mkEH3sRjpE0YzxEIERuOXmAmp+yA3D9/+Fci5POC5RMwyumV6b
         TQB8LxB6iWBi7TgpZ0kHj3ptr3K7wUFSxBa0Axb14YheqEMToDzxuonU6N9oyv01gqqT
         yxMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfze9qjQbQ+lylumjR2Q1H7DT9tOivXd6KTsRXNssXGWn1JJa3qasxtAe+b9d9RSXUn5tC1BscPExiqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbKjbIRrlsuCggX+vqSDs+5E7gW/M0q6fNdpbxcjfIxy3OaCdG
	M849vPR2m6cM/yYVeoZkR3qTB/Kh73Nbhe9K0uAeVFjgNeVkZUU6dDMa3DBhbks7julViJZwdlG
	ALiNArh9OSLY1AOTvzhhB5qBWt4a7PpTs4eCt5He52inuz0LHQa949pE7KTX4XmKoYw==
X-Gm-Gg: ATEYQzw4hTyWkXzFjze36QpE80dPfUWcQpE3LUTtnaxN7bnn/Qc5M+LoPM0U5P1e1eI
	UQScuYkERU+F6J0edphTFxvEND/ecTYkLZgUZIJtRsy3tVx7Y81748/zfye7kxLphYd+zUXNnp+
	nT6Xpemf/Z5F0oojsxVADHm6EKlFl7fUaElyXC41u9VRQZjBv5CDiTmk06DMoYIVpuHiwbUgazX
	5ZcK8dlzXa9LZ3ONdZxSSSkZLaGYhFoHANuwMLHAsaWTwGxRx+40QrxKLCw85RAqjagDpRyO/oj
	U2eMegsULvkl2u2GnLfP1gRu1qipkyrfjSzTBngvjs3xZos63Axjapxk1QWCIP/DkCUCE6RASiv
	Ghr8ZtPTOuZXJuaArU2CAtOrw+cwd1VgFPJTqRBjODqo75bq/SsB9/ts0OAKBlvCrQ3et3y+c92
	t91XMSGoSt+aL0JWDHuyo3SOzWUaoVE0JXl/E=
X-Received: by 2002:a05:620a:198f:b0:8cb:5233:8f8a with SMTP id af79cd13be357-8cbc8d83930mr674635785a.11.1772272194315;
        Sat, 28 Feb 2026 01:49:54 -0800 (PST)
X-Received: by 2002:a05:620a:198f:b0:8cb:5233:8f8a with SMTP id af79cd13be357-8cbc8d83930mr674633985a.11.1772272193818;
        Sat, 28 Feb 2026 01:49:53 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a119293172sm26801e87.92.2026.02.28.01.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 01:49:53 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 28 Feb 2026 11:49:52 +0200
Subject: [PATCH] media: venus: allow interlaced video streams
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260228-venus-mpeg2-v1-1-c13aa7cb6e93@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAD+6omkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDIyML3bLUvNJi3dyC1HQjXRNL0zRLQwvzRMPUZCWgjoKi1LTMCrBp0bG
 1tQD5mW2UXQAAAA==
X-Change-ID: 20260228-venus-mpeg2-495f9187a1ec
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1654;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=59o113IRp7T+/aHGWWfZMJf4LNlY4k+iIPM3ZO07ad8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBporpArdzKo4XQpGCc7NhBpz6+0bhmp6vGylsee
 JqTgI8hsE6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaaK6QAAKCRCLPIo+Aiko
 1bEACACOdQBhGBgA4tlckrobz/Jb6q+GF5vLeUykFIJhwmbhwdN8b8Z7J9eCrRmfE5o7HtJbPGJ
 6poegE41HugbFvvy8jHR6OIv+DxE8bSh6m2McJdCFA74T/z9yYSDbkq5rAUOGDnVbB38cQEtwUO
 xJ5X+5ubUxgMefW0b95LdvkV8fLALeWsbQP7Fb6ZchTxI2fSJ1k8mZKX02J+yLZ6Cu/aNKdS6K6
 BPXCkPGctzcnWWjQ49EPcVLFajPgzhVS6Sj41Y/+X3uczxcYYKTE04hjhtenO605+M4kriezu3H
 Ak3yQ/slfK8xrDVtrLqOTE4qyKIJNMMWxHzKDSScYOIbUHiX
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDA5MCBTYWx0ZWRfX2JX16CDmkgk0
 Di+Rg70uJPRMJzcZM0au1eCTKUnL36iBSK3hiYLAZIP+QpP1pWKqzggk0iTwL4hWwo9v/o6+3JI
 x8/q1jswK/ipSgy3DS2nqa3vLmgaYsmkEBql27K5U/l12BLbs5U36K1+e7T0sSdRMVLdU1/ChPC
 m4+YeNw47WxCWvsAvIiHE/NVLC8eGZaXTK31wEyxF4dYHAj1VPRi1WLIkpywdqJVnTJtYGxA6Z2
 CtKUxicDUZrfaS+DK0UT86QBDW0Tje1K1x87lPw+Xm7/145rEG5Gy4iqCWHIDzBLzgeOLR/Uj6B
 ygG8rET78UBZBVkBB2cZoDN8wHIeCxggjsF8bC2pUNHKL/ztXghvy4+5dvYGWCEO7da/Y1q2NUZ
 t0deqpCrjQFhqE6hRlxOaU3FHEAhIZQ/b2Xr1whco/AuG9wJR3Q1jF8zYk0zwaYD2AAX6tzyiRn
 gdkIOXaXCTtALF0CJJg==
X-Proofpoint-ORIG-GUID: Zxh4vS-7wByezBCqVb8w-G7TT5JCpEkq
X-Authority-Analysis: v=2.4 cv=EvbfbCcA c=1 sm=1 tr=0 ts=69a2ba43 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=mix0NA6vuO6kksnNH3gA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: Zxh4vS-7wByezBCqVb8w-G7TT5JCpEkq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602280090
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53833-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,samsung];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 453C51C1D16
X-Rspamd-Action: no action

Venus driver errors out on the interlaced streams with the 'field isn't
supported' error message, which e.g. prevents decoding of the MPEG2
video streams. Don't error out if the buffer is set to contain
interlaced data.

Tested with the fluster enabled to handle MPEG2 through Gstreamer:

./fluster.py r -d GStreamer-MPEG2_VIDEO-V4L2-Gst1.0 -s -so venus-mpeg2.md -j 1

GLOBAL SUMMARY
|TOTALS|GStreamer-MPEG2_VIDEO-V4L2-Gst1.0|
|-|-|
|TOTAL|30/52|
|TOTAL TIME|75.526s|
|-|-|
|Profile|GStreamer-MPEG2_VIDEO-V4L2-Gst1.0|
|MAIN|26/32|
|PROFILE_4_2_2|0/9|
|SIMPLE|4/11|
|-|-|

Fixes: 059790467bf4 ("media: venus: helpers: handle correctly vbuf field")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/helpers.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index 747c388fe25f..71e79093a4c7 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -1466,11 +1466,6 @@ int venus_helper_vb2_buf_prepare(struct vb2_buffer *vb)
 	if (V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type)) {
 		if (vbuf->field == V4L2_FIELD_ANY)
 			vbuf->field = V4L2_FIELD_NONE;
-		if (vbuf->field != V4L2_FIELD_NONE) {
-			dev_err(inst->core->dev, "%s field isn't supported\n",
-				__func__);
-			return -EINVAL;
-		}
 	}
 
 	if (vb->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE &&

---
base-commit: 779cae956c8316aebc1946ef86ca001f99658270
change-id: 20260228-venus-mpeg2-495f9187a1ec

Best regards,
-- 
With best wishes
Dmitry


