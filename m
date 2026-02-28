Return-Path: <linux-media+bounces-53841-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDocF4UJo2nY9AQAu9opvQ
	(envelope-from <linux-media+bounces-53841-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 16:28:05 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C557D1C3EB1
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 16:28:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D6B9F30CB030
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 15:26:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD3B247CC75;
	Sat, 28 Feb 2026 15:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JKkVT+9H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aPrTXM1/"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A7B47B413
	for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 15:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772292401; cv=none; b=TgHMMpuAh6j59XqkZfyNDqSJXVk6rnLCKsKApHQeZCdWOsbFgXZCx0WzEOrO7O00i2Xo1yFQ/L5gZZWvF/Je90B6f9HzeUm7wcilorf3SvJd3ohZDJif7L+7+j2Q8APyckKB+2Q+0YymU958HgMYzfOgf3pXbLf3IdxfpLBcbUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772292401; c=relaxed/simple;
	bh=6TsWtLYNg9p/vjDc7JhCuNKMNVpYI8ZUlJV+Pv7jEg0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YI5e0yaj97l59gjMdeRmYJPkJs/Er9QZjDV/BOiZMP6FDCCSXW3NMn/p+O18hhNehufRO4TY5YGEAhxsfLlumCm6N1ujqj6h5DDguSXpQ2Xa2/0VZYiPpxcp8y2RBh01KOb1BsO8RFPMfuyoxTEc8ESV6E8B1mtzaJvEL+xc5zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JKkVT+9H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aPrTXM1/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61SEPeW2593699
	for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 15:26:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WoP9BzumgBDLVCZMb/+BVP8Jay38f71Fg7L2oRhFNBQ=; b=JKkVT+9HBOVYvMbA
	Kb5rjYkcurwucK+vlWMHYFIkDCRymwjyQluerAukYmg9u2sSnt+07VgiTYL//5EV
	+mBReIRjSChteEsf+XVppxcg/NY2/QDJwDcKc3zi52FxvwjAzJJ1RcSCjxGAq3BC
	W3M9RXROXE2CguF66wIy/mRAS10ZXWqMIqjgNAel2GYoo2rpJZ/S4O05p2Se1waK
	mLa36VQmxVgLN+KKZPtavlpCk5T36mvjlL6dZ89Ae2Hnpo1J+7IJxsFLvU0+LM2K
	T1OLIzA4jUlO/c9Hf29Vb29JdjmOvfk0BgIU4hElMFQVSK3zHSXQ+ggHpMWX/CWB
	K+P2Kw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksf8h6ft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 15:26:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70ab7f67fso3741467685a.3
        for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 07:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772292397; x=1772897197; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WoP9BzumgBDLVCZMb/+BVP8Jay38f71Fg7L2oRhFNBQ=;
        b=aPrTXM1/bHtFG3ttfQHjB484DaoOJEUGg5zBzsSQ5MEu+rhaHvq8YMbt9PYMDttj8q
         1Sc06nIVGaLjbmgQmaFK35vP9sCI+wD/NAObQ+kd7SYGz8oBbw4PqR4wv0LXFzM1GuBp
         XC/lCul9mQjhObA1qt97UxPjX1F9bCplll/CKMbaRL9xMMOCbNI8eedj6aYaKuCToWYu
         56kAmRKRTSlFtvj/GtzKcdaf+RgZyQoU56udT8RtCjBEHjijjudWJCmn9vq+86pDWsXk
         dJR9KDb9PnPuU62JR9L7IVXOjHEGdTOCzRaK/WCOV+tSySSozqEb5VN67dfHfPNVDJm0
         VaNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772292397; x=1772897197;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WoP9BzumgBDLVCZMb/+BVP8Jay38f71Fg7L2oRhFNBQ=;
        b=JMnxmN8R32HfwG9Vp6A3hZ8uNlbbG3ahFcQASl+XPA2wyOMx6bN+HAZbuPLmzuqykh
         aKVqh0t3gfwaLapBe4nLzdXkNCVpvt/F6D28IgmUwe0R0qRYSq0hcReulP1174V80aY+
         Vg7Ov/eFnPr9YQCaqJdjI98RRM7Qe+waT9wKM2y6fYNLasptznl082HxmjCwRN6A1z34
         Ul+L9Axvg7lGAZCQWr6Of4enj8u4kXmBgz8rvtQVDI660Fk1MfRy9OIBbYJ3Xhcq/RgR
         s+UX+8jvR7N9wdk+JUDhZlitFrcfEsBbQEToLACdAPIOVDTPsetGUEXMViPPMDFyL9L6
         LqxQ==
X-Gm-Message-State: AOJu0YyLpKza/zqZcuvxBeY52MM6LdHtqUngUvi7EdF11jqxJj4Z9Ymw
	3LZPOKMm+3V+X0Igs8IBQox6BhZsqUMpceZfpV+7HIbzqKBLsOYoF57YxuQayPlAXWQal5kQ2zR
	MrN3yCHkLnqdS66g1cZLkQMTP3HphO61qYuLC4q5LfTwRXsuybjJeXiyM3nhu8iPZyw==
X-Gm-Gg: ATEYQzyjBd8mi/7X6Qx63B0V5LCA0v3cuDsQ1uUTGAroZs8I8OHLco1jukLVKCe16tm
	tki6PbTpNx0ztUymqGsevkxWMIOeq1hxZe5B6wkPRMxxZvd9VBM9Cui4bTF/e+UIk6XkXQJ65v/
	7npwJVC/8jhR1KBvmbt2zvlxXsWIUQOhKAN8KjlnP6JQQA9VWuVtLOiNOI9InkQ25CQGYZeuTWa
	onl+AuQDuwaBI1QgmOGAySK33iomoCKwP0+13ld0VchXVLdVqPfZ3RtX734Iho1ufOqkhc2K5OX
	dX1gC8zuh6tvoSOkZHtxHrmcj2fQrK5wC+tnFdODxWi3Yc01+Mwu5jCZk21jZTKo2kdDDgC7v+O
	MSzfg9whFAP08OjKV1Qc0yFliPsolIkEsYUPHYsq4XzPTMKdFjU6ChbxXZKoBw72UM39tXS7Es7
	WP6hzXisjqy2nUHf3WmAJMorSZoCCYeAAuO3k=
X-Received: by 2002:a05:620a:19a8:b0:8ca:3ed2:175c with SMTP id af79cd13be357-8cbc8e4fbfcmr923068785a.43.1772292396894;
        Sat, 28 Feb 2026 07:26:36 -0800 (PST)
X-Received: by 2002:a05:620a:19a8:b0:8ca:3ed2:175c with SMTP id af79cd13be357-8cbc8e4fbfcmr923065985a.43.1772292396300;
        Sat, 28 Feb 2026 07:26:36 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a115b57922sm625558e87.63.2026.02.28.07.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 07:26:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 28 Feb 2026 17:26:30 +0200
Subject: [PATCH v2 03/11] media: qcom: iris: handle HFI params directly
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260228-iris-platform-data-v2-3-acf036a3c84c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=21708;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=6TsWtLYNg9p/vjDc7JhCuNKMNVpYI8ZUlJV+Pv7jEg0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpowkm9P0QjmZbNe12+P0hyIpflIAlLSZxmvFGC
 8kzm4ds89GJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaaMJJgAKCRCLPIo+Aiko
 1VRhCACSl8QRqkFL1U+wpjFsaOgGPJMQ7DB7mwq44hcBjxy+5X6MoLXQ3sr1bqbY6oDOHc7RGv2
 zMbwXO3tT3Yt4tye/03CWMongpuDZ04SZSRhMwnijwtciwnar2dQoihpo95ciFUOYQxAA0E0uk5
 NnlGksudMYbODscJss0DW+J6b5DKWM+uIa46YAVPPFR07SefBUbqiJKWWiCZKuv50ozS97PYMJ1
 taQLWhktOb0ytOZ/1H3dYu9cOrDtstEtcDRxNH6gkhGArFP7+eoRcQ2CBOxWSvgLVhiJr49j6DE
 F2gHisJm11mjMI3ZAM74J14ZlY9AvltG5Fpq01SSSNA14qjx
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDE0MiBTYWx0ZWRfX31UCLQxSgK94
 R7HKyKmR8NluxXHvBQuBT/BbCHHAqMJcAgcoEKk8uEnfHIxfFw+mx+d6iOwzQNl84nEte/gKAZ5
 8Zp1Y4JlNa0PMNm30nW8lyWxOOdH7jXmobNnE4WjCujFzHoMDcZvaS2LIaX4Jd+Sz/jj1N3+/Ze
 q7ZEmP8HzGc1fBTJhgH8h8grzW4piLNjO7wJE6tgAt76voGqU62a/DKPEmvpJxCfqHEKFNHdbFp
 XwTlnnT1W2BBV/uTBHr2bfEKpaM05ZVdQ9ZBElGA+oyLisrwKjnkGzLsBJgjK8pRqCn+93bZRXf
 EvncEjQzANoif+qV4YTvSwnJvKvSZgwy7nfpxadkiTa2mYStK67RIczEMzq6zhN83fPQxc7uZiA
 lWAL/q3suVTl7K2rHECLsBHBmWLVMCW+9mSu0XrdyTPVq0JiwEFPlWA4oYd6Rm934OOkrPffnUw
 qN9XTht82Dd35CBxDNg==
X-Proofpoint-ORIG-GUID: CF4f5LPQDF1mo9nQdO66YQOwH0kiufxo
X-Proofpoint-GUID: CF4f5LPQDF1mo9nQdO66YQOwH0kiufxo
X-Authority-Analysis: v=2.4 cv=I5dohdgg c=1 sm=1 tr=0 ts=69a3092e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=0V4xn3LT2fnV2DziLREA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_05,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0 suspectscore=0
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,60fps:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53841-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: C557D1C3EB1
X-Rspamd-Action: no action

The HFI params are set per the HFI generation, they don't change between
different platforms with the same HFI interface. Instead of copy-pasting
the same params between platform data over and over again, move them to
the corresponding HFI generation source file and drop them from the HFI
platform data.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  28 +++-
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 118 +++++++++++---
 .../platform/qcom/iris/iris_platform_common.h      |  14 --
 .../media/platform/qcom/iris/iris_platform_gen1.c  |  33 ----
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 181 ---------------------
 5 files changed, 114 insertions(+), 260 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index e42d17653c2c..d5eaf8763f6d 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -978,11 +978,29 @@ static int iris_hfi_gen1_set_stride(struct iris_inst *inst, u32 plane)
 	return hfi_gen1_set_property(inst, ptype, &plane_actual_info, sizeof(plane_actual_info));
 }
 
+static const u32 iris_hfi_gen1_vdec_input_config_param[] = {
+	HFI_PROPERTY_CONFIG_VIDEOCORES_USAGE,
+	HFI_PROPERTY_PARAM_UNCOMPRESSED_FORMAT_SELECT,
+	HFI_PROPERTY_PARAM_UNCOMPRESSED_PLANE_ACTUAL_CONSTRAINTS_INFO,
+	HFI_PROPERTY_PARAM_BUFFER_COUNT_ACTUAL,
+	HFI_PROPERTY_PARAM_VDEC_MULTI_STREAM,
+	HFI_PROPERTY_PARAM_FRAME_SIZE,
+	HFI_PROPERTY_PARAM_BUFFER_SIZE_ACTUAL,
+	HFI_PROPERTY_PARAM_BUFFER_ALLOC_MODE,
+};
+
+static const u32 iris_hfi_gen1_venc_input_config_param[] = {
+	HFI_PROPERTY_CONFIG_FRAME_RATE,
+	HFI_PROPERTY_PARAM_UNCOMPRESSED_PLANE_ACTUAL_INFO,
+	HFI_PROPERTY_PARAM_FRAME_SIZE,
+	HFI_PROPERTY_PARAM_UNCOMPRESSED_FORMAT_SELECT,
+	HFI_PROPERTY_PARAM_BUFFER_COUNT_ACTUAL,
+};
+
 static int iris_hfi_gen1_session_set_config_params(struct iris_inst *inst, u32 plane)
 {
 	struct iris_hfi_prop_type_handle const *handler = NULL;
 	u32 handler_size = 0;
-	struct iris_core *core = inst->core;
 	u32 config_params_size, i, j;
 	const u32 *config_params;
 	int ret;
@@ -1033,8 +1051,8 @@ static int iris_hfi_gen1_session_set_config_params(struct iris_inst *inst, u32 p
 	};
 
 	if (inst->domain == DECODER) {
-		config_params = core->iris_platform_data->dec_input_config_params_default;
-		config_params_size = core->iris_platform_data->dec_input_config_params_default_size;
+		config_params = iris_hfi_gen1_vdec_input_config_param;
+		config_params_size = ARRAY_SIZE(iris_hfi_gen1_vdec_input_config_param);
 		if (V4L2_TYPE_IS_OUTPUT(plane)) {
 			handler = vdec_prop_type_handle_inp_arr;
 			handler_size = ARRAY_SIZE(vdec_prop_type_handle_inp_arr);
@@ -1043,8 +1061,8 @@ static int iris_hfi_gen1_session_set_config_params(struct iris_inst *inst, u32 p
 			handler_size = ARRAY_SIZE(vdec_prop_type_handle_out_arr);
 		}
 	} else {
-		config_params = core->iris_platform_data->enc_input_config_params;
-		config_params_size = core->iris_platform_data->enc_input_config_params_size;
+		config_params = iris_hfi_gen1_venc_input_config_param;
+		config_params_size = ARRAY_SIZE(iris_hfi_gen1_venc_input_config_param);
 		handler = venc_prop_type_handle_inp_arr;
 		handler_size = ARRAY_SIZE(venc_prop_type_handle_inp_arr);
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 30bfd90d423b..52fd1fd51946 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -599,9 +599,73 @@ static int iris_hfi_gen2_set_super_block(struct iris_inst *inst, u32 plane)
 						  sizeof(u32));
 }
 
+static const u32 iris_hfi_gen2_vdec_input_config_params_avc[] = {
+	HFI_PROP_BITSTREAM_RESOLUTION,
+	HFI_PROP_CROP_OFFSETS,
+	HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
+	HFI_PROP_CODED_FRAMES,
+	HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT,
+	HFI_PROP_PIC_ORDER_CNT_TYPE,
+	HFI_PROP_PROFILE,
+	HFI_PROP_LEVEL,
+	HFI_PROP_SIGNAL_COLOR_INFO,
+};
+
+static const u32 iris_hfi_gen2_vdec_input_config_params_hevc[] = {
+	HFI_PROP_BITSTREAM_RESOLUTION,
+	HFI_PROP_CROP_OFFSETS,
+	HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
+	HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT,
+	HFI_PROP_PROFILE,
+	HFI_PROP_LEVEL,
+	HFI_PROP_TIER,
+	HFI_PROP_SIGNAL_COLOR_INFO,
+};
+
+static const u32 iris_hfi_gen2_vdec_input_config_params_vp9[] = {
+	HFI_PROP_BITSTREAM_RESOLUTION,
+	HFI_PROP_CROP_OFFSETS,
+	HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
+	HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT,
+	HFI_PROP_PROFILE,
+	HFI_PROP_LEVEL,
+};
+
+static const u32 iris_hfi_gen2_vdec_input_config_params_av1[] = {
+	HFI_PROP_BITSTREAM_RESOLUTION,
+	HFI_PROP_CROP_OFFSETS,
+	HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
+	HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT,
+	HFI_PROP_PROFILE,
+	HFI_PROP_LEVEL,
+	HFI_PROP_TIER,
+	HFI_PROP_AV1_FILM_GRAIN_PRESENT,
+	HFI_PROP_AV1_SUPER_BLOCK_ENABLED,
+	HFI_PROP_SIGNAL_COLOR_INFO,
+};
+
+static const u32 iris_hfi_gen2_venc_input_config_params[] = {
+	HFI_PROP_COLOR_FORMAT,
+	HFI_PROP_RAW_RESOLUTION,
+	HFI_PROP_CROP_OFFSETS,
+	HFI_PROP_LINEAR_STRIDE_SCANLINE,
+	HFI_PROP_SIGNAL_COLOR_INFO,
+};
+
+static const u32 iris_hfi_gen2_vdec_output_config_params[] = {
+	HFI_PROP_OPB_ENABLE,
+	HFI_PROP_COLOR_FORMAT,
+	HFI_PROP_LINEAR_STRIDE_SCANLINE,
+};
+
+static const u32 iris_hfi_gen2_venc_output_config_params[] = {
+	HFI_PROP_BITSTREAM_RESOLUTION,
+	HFI_PROP_CROP_OFFSETS,
+	HFI_PROP_FRAME_RATE,
+};
+
 static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 plane)
 {
-	const struct iris_platform_data *pdata = inst->core->iris_platform_data;
 	u32 config_params_size = 0, i, j;
 	const u32 *config_params = NULL;
 	int ret;
@@ -630,31 +694,35 @@ static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 p
 	if (inst->domain == DECODER) {
 		if (V4L2_TYPE_IS_OUTPUT(plane)) {
 			if (inst->codec == V4L2_PIX_FMT_H264) {
-				config_params = pdata->dec_input_config_params_default;
-				config_params_size = pdata->dec_input_config_params_default_size;
+				config_params = iris_hfi_gen2_vdec_input_config_params_avc;
+				config_params_size =
+					ARRAY_SIZE(iris_hfi_gen2_vdec_input_config_params_avc);
 			} else if (inst->codec == V4L2_PIX_FMT_HEVC) {
-				config_params = pdata->dec_input_config_params_hevc;
-				config_params_size = pdata->dec_input_config_params_hevc_size;
+				config_params = iris_hfi_gen2_vdec_input_config_params_hevc;
+				config_params_size =
+					ARRAY_SIZE(iris_hfi_gen2_vdec_input_config_params_hevc);
 			} else if (inst->codec == V4L2_PIX_FMT_VP9) {
-				config_params = pdata->dec_input_config_params_vp9;
-				config_params_size = pdata->dec_input_config_params_vp9_size;
+				config_params = iris_hfi_gen2_vdec_input_config_params_vp9;
+				config_params_size =
+					ARRAY_SIZE(iris_hfi_gen2_vdec_input_config_params_vp9);
 			} else if (inst->codec == V4L2_PIX_FMT_AV1) {
-				config_params = pdata->dec_input_config_params_av1;
-				config_params_size = pdata->dec_input_config_params_av1_size;
+				config_params = iris_hfi_gen2_vdec_input_config_params_av1;
+				config_params_size =
+					ARRAY_SIZE(iris_hfi_gen2_vdec_input_config_params_av1);
 			} else {
 				return -EINVAL;
 			}
 		} else {
-			config_params = pdata->dec_output_config_params;
-			config_params_size = pdata->dec_output_config_params_size;
+			config_params = iris_hfi_gen2_vdec_output_config_params;
+			config_params_size = ARRAY_SIZE(iris_hfi_gen2_vdec_output_config_params);
 		}
 	} else {
 		if (V4L2_TYPE_IS_OUTPUT(plane)) {
-			config_params = pdata->enc_input_config_params;
-			config_params_size = pdata->enc_input_config_params_size;
+			config_params = iris_hfi_gen2_venc_input_config_params;
+			config_params_size = ARRAY_SIZE(iris_hfi_gen2_venc_input_config_params);
 		} else {
-			config_params = pdata->enc_output_config_params;
-			config_params_size = pdata->enc_output_config_params_size;
+			config_params = iris_hfi_gen2_venc_output_config_params;
+			config_params_size = ARRAY_SIZE(iris_hfi_gen2_venc_output_config_params);
 		}
 	}
 
@@ -849,24 +917,20 @@ static int iris_hfi_gen2_subscribe_change_param(struct iris_inst *inst, u32 plan
 
 	switch (inst->codec) {
 	case V4L2_PIX_FMT_H264:
-		change_param = core->iris_platform_data->dec_input_config_params_default;
-		change_param_size =
-			core->iris_platform_data->dec_input_config_params_default_size;
+		change_param = iris_hfi_gen2_vdec_input_config_params_avc;
+		change_param_size = ARRAY_SIZE(iris_hfi_gen2_vdec_input_config_params_avc);
 		break;
 	case V4L2_PIX_FMT_HEVC:
-		change_param = core->iris_platform_data->dec_input_config_params_hevc;
-		change_param_size =
-			core->iris_platform_data->dec_input_config_params_hevc_size;
+		change_param = iris_hfi_gen2_vdec_input_config_params_hevc;
+		change_param_size = ARRAY_SIZE(iris_hfi_gen2_vdec_input_config_params_hevc);
 		break;
 	case V4L2_PIX_FMT_VP9:
-		change_param = core->iris_platform_data->dec_input_config_params_vp9;
-		change_param_size =
-			core->iris_platform_data->dec_input_config_params_vp9_size;
+		change_param = iris_hfi_gen2_vdec_input_config_params_vp9;
+		change_param_size = ARRAY_SIZE(iris_hfi_gen2_vdec_input_config_params_vp9);
 		break;
 	case V4L2_PIX_FMT_AV1:
-		change_param = core->iris_platform_data->dec_input_config_params_av1;
-		change_param_size =
-			core->iris_platform_data->dec_input_config_params_av1_size;
+		change_param = iris_hfi_gen2_vdec_input_config_params_av1;
+		change_param_size = ARRAY_SIZE(iris_hfi_gen2_vdec_input_config_params_av1);
 		break;
 	}
 
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index e4eefc646c7f..00e40590d5ec 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -243,20 +243,6 @@ struct iris_platform_data {
 	u32 max_core_mbpf;
 	/* max number of macroblocks per second supported */
 	u32 max_core_mbps;
-	const u32 *dec_input_config_params_default;
-	unsigned int dec_input_config_params_default_size;
-	const u32 *dec_input_config_params_hevc;
-	unsigned int dec_input_config_params_hevc_size;
-	const u32 *dec_input_config_params_vp9;
-	unsigned int dec_input_config_params_vp9_size;
-	const u32 *dec_input_config_params_av1;
-	unsigned int dec_input_config_params_av1_size;
-	const u32 *dec_output_config_params;
-	unsigned int dec_output_config_params_size;
-	const u32 *enc_input_config_params;
-	unsigned int enc_input_config_params_size;
-	const u32 *enc_output_config_params;
-	unsigned int enc_output_config_params_size;
 	const u32 *dec_input_prop;
 	unsigned int dec_input_prop_size;
 	const u32 *dec_output_prop_avc;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
index a3eebcacba7b..392f9ed94ba8 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
@@ -298,25 +298,6 @@ static const struct tz_cp_config tz_cp_config_sm8250[] = {
 	},
 };
 
-static const u32 sm8250_vdec_input_config_param_default[] = {
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
-static const u32 sm8250_venc_input_config_param[] = {
-	HFI_PROPERTY_CONFIG_FRAME_RATE,
-	HFI_PROPERTY_PARAM_UNCOMPRESSED_PLANE_ACTUAL_INFO,
-	HFI_PROPERTY_PARAM_FRAME_SIZE,
-	HFI_PROPERTY_PARAM_UNCOMPRESSED_FORMAT_SELECT,
-	HFI_PROPERTY_PARAM_BUFFER_COUNT_ACTUAL,
-};
-
 static const u32 sm8250_dec_ip_int_buf_tbl[] = {
 	BUF_BIN,
 	BUF_SCRATCH_1,
@@ -369,13 +350,6 @@ const struct iris_platform_data sm8250_data = {
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
-	.dec_input_config_params_default =
-		sm8250_vdec_input_config_param_default,
-	.dec_input_config_params_default_size =
-		ARRAY_SIZE(sm8250_vdec_input_config_param_default),
-	.enc_input_config_params = sm8250_venc_input_config_param,
-	.enc_input_config_params_size =
-		ARRAY_SIZE(sm8250_venc_input_config_param),
 
 	.dec_ip_int_buf_tbl = sm8250_dec_ip_int_buf_tbl,
 	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_dec_ip_int_buf_tbl),
@@ -423,13 +397,6 @@ const struct iris_platform_data sc7280_data = {
 	.max_core_mbpf = 4096 * 2176 / 256 * 2 + 1920 * 1088 / 256,
 	/* max spec for SC7280 is 4096x2176@60fps */
 	.max_core_mbps = 4096 * 2176 / 256 * 60,
-	.dec_input_config_params_default =
-		sm8250_vdec_input_config_param_default,
-	.dec_input_config_params_default_size =
-		ARRAY_SIZE(sm8250_vdec_input_config_param_default),
-	.enc_input_config_params = sm8250_venc_input_config_param,
-	.enc_input_config_params_size =
-		ARRAY_SIZE(sm8250_venc_input_config_param),
 
 	.dec_ip_int_buf_tbl = sm8250_dec_ip_int_buf_tbl,
 	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_dec_ip_int_buf_tbl),
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index f8754451ac18..5b157697d478 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -794,71 +794,6 @@ static const struct tz_cp_config tz_cp_config_sm8550[] = {
 	},
 };
 
-static const u32 sm8550_vdec_input_config_params_default[] = {
-	HFI_PROP_BITSTREAM_RESOLUTION,
-	HFI_PROP_CROP_OFFSETS,
-	HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
-	HFI_PROP_CODED_FRAMES,
-	HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT,
-	HFI_PROP_PIC_ORDER_CNT_TYPE,
-	HFI_PROP_PROFILE,
-	HFI_PROP_LEVEL,
-	HFI_PROP_SIGNAL_COLOR_INFO,
-};
-
-static const u32 sm8550_vdec_input_config_param_hevc[] = {
-	HFI_PROP_BITSTREAM_RESOLUTION,
-	HFI_PROP_CROP_OFFSETS,
-	HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
-	HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT,
-	HFI_PROP_PROFILE,
-	HFI_PROP_LEVEL,
-	HFI_PROP_TIER,
-	HFI_PROP_SIGNAL_COLOR_INFO,
-};
-
-static const u32 sm8550_vdec_input_config_param_vp9[] = {
-	HFI_PROP_BITSTREAM_RESOLUTION,
-	HFI_PROP_CROP_OFFSETS,
-	HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
-	HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT,
-	HFI_PROP_PROFILE,
-	HFI_PROP_LEVEL,
-};
-
-static const u32 sm8550_vdec_input_config_param_av1[] = {
-	HFI_PROP_BITSTREAM_RESOLUTION,
-	HFI_PROP_CROP_OFFSETS,
-	HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
-	HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT,
-	HFI_PROP_PROFILE,
-	HFI_PROP_LEVEL,
-	HFI_PROP_TIER,
-	HFI_PROP_AV1_FILM_GRAIN_PRESENT,
-	HFI_PROP_AV1_SUPER_BLOCK_ENABLED,
-	HFI_PROP_SIGNAL_COLOR_INFO,
-};
-
-static const u32 sm8550_venc_input_config_params[] = {
-	HFI_PROP_COLOR_FORMAT,
-	HFI_PROP_RAW_RESOLUTION,
-	HFI_PROP_CROP_OFFSETS,
-	HFI_PROP_LINEAR_STRIDE_SCANLINE,
-	HFI_PROP_SIGNAL_COLOR_INFO,
-};
-
-static const u32 sm8550_vdec_output_config_params[] = {
-	HFI_PROP_OPB_ENABLE,
-	HFI_PROP_COLOR_FORMAT,
-	HFI_PROP_LINEAR_STRIDE_SCANLINE,
-};
-
-static const u32 sm8550_venc_output_config_params[] = {
-	HFI_PROP_BITSTREAM_RESOLUTION,
-	HFI_PROP_CROP_OFFSETS,
-	HFI_PROP_FRAME_RATE,
-};
-
 static const u32 sm8550_vdec_subscribe_input_properties[] = {
 	HFI_PROP_NO_OUTPUT,
 };
@@ -944,35 +879,6 @@ const struct iris_platform_data sm8550_data = {
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
-	.dec_input_config_params_default =
-		sm8550_vdec_input_config_params_default,
-	.dec_input_config_params_default_size =
-		ARRAY_SIZE(sm8550_vdec_input_config_params_default),
-	.dec_input_config_params_hevc =
-		sm8550_vdec_input_config_param_hevc,
-	.dec_input_config_params_hevc_size =
-		ARRAY_SIZE(sm8550_vdec_input_config_param_hevc),
-	.dec_input_config_params_vp9 =
-		sm8550_vdec_input_config_param_vp9,
-	.dec_input_config_params_vp9_size =
-		ARRAY_SIZE(sm8550_vdec_input_config_param_vp9),
-	.dec_input_config_params_av1 =
-		sm8550_vdec_input_config_param_av1,
-	.dec_input_config_params_av1_size =
-		ARRAY_SIZE(sm8550_vdec_input_config_param_av1),
-	.dec_output_config_params =
-		sm8550_vdec_output_config_params,
-	.dec_output_config_params_size =
-		ARRAY_SIZE(sm8550_vdec_output_config_params),
-
-	.enc_input_config_params =
-		sm8550_venc_input_config_params,
-	.enc_input_config_params_size =
-		ARRAY_SIZE(sm8550_venc_input_config_params),
-	.enc_output_config_params =
-		sm8550_venc_output_config_params,
-	.enc_output_config_params_size =
-		ARRAY_SIZE(sm8550_venc_output_config_params),
 
 	.dec_input_prop = sm8550_vdec_subscribe_input_properties,
 	.dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
@@ -1047,35 +953,6 @@ const struct iris_platform_data sm8650_data = {
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
-	.dec_input_config_params_default =
-		sm8550_vdec_input_config_params_default,
-	.dec_input_config_params_default_size =
-		ARRAY_SIZE(sm8550_vdec_input_config_params_default),
-	.dec_input_config_params_hevc =
-		sm8550_vdec_input_config_param_hevc,
-	.dec_input_config_params_hevc_size =
-		ARRAY_SIZE(sm8550_vdec_input_config_param_hevc),
-	.dec_input_config_params_vp9 =
-		sm8550_vdec_input_config_param_vp9,
-	.dec_input_config_params_vp9_size =
-		ARRAY_SIZE(sm8550_vdec_input_config_param_vp9),
-	.dec_input_config_params_av1 =
-		sm8550_vdec_input_config_param_av1,
-	.dec_input_config_params_av1_size =
-		ARRAY_SIZE(sm8550_vdec_input_config_param_av1),
-	.dec_output_config_params =
-		sm8550_vdec_output_config_params,
-	.dec_output_config_params_size =
-		ARRAY_SIZE(sm8550_vdec_output_config_params),
-
-	.enc_input_config_params =
-		sm8550_venc_input_config_params,
-	.enc_input_config_params_size =
-		ARRAY_SIZE(sm8550_venc_input_config_params),
-	.enc_output_config_params =
-		sm8550_venc_output_config_params,
-	.enc_output_config_params_size =
-		ARRAY_SIZE(sm8550_venc_output_config_params),
 
 	.dec_input_prop = sm8550_vdec_subscribe_input_properties,
 	.dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
@@ -1141,35 +1018,6 @@ const struct iris_platform_data sm8750_data = {
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
-	.dec_input_config_params_default =
-		sm8550_vdec_input_config_params_default,
-	.dec_input_config_params_default_size =
-		ARRAY_SIZE(sm8550_vdec_input_config_params_default),
-	.dec_input_config_params_hevc =
-		sm8550_vdec_input_config_param_hevc,
-	.dec_input_config_params_hevc_size =
-		ARRAY_SIZE(sm8550_vdec_input_config_param_hevc),
-	.dec_input_config_params_vp9 =
-		sm8550_vdec_input_config_param_vp9,
-	.dec_input_config_params_vp9_size =
-		ARRAY_SIZE(sm8550_vdec_input_config_param_vp9),
-	.dec_input_config_params_av1 =
-		sm8550_vdec_input_config_param_av1,
-	.dec_input_config_params_av1_size =
-		ARRAY_SIZE(sm8550_vdec_input_config_param_av1),
-	.dec_output_config_params =
-		sm8550_vdec_output_config_params,
-	.dec_output_config_params_size =
-		ARRAY_SIZE(sm8550_vdec_output_config_params),
-
-	.enc_input_config_params =
-		sm8550_venc_input_config_params,
-	.enc_input_config_params_size =
-		ARRAY_SIZE(sm8550_venc_input_config_params),
-	.enc_output_config_params =
-		sm8550_venc_output_config_params,
-	.enc_output_config_params_size =
-		ARRAY_SIZE(sm8550_venc_output_config_params),
 
 	.dec_input_prop = sm8550_vdec_subscribe_input_properties,
 	.dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
@@ -1239,35 +1087,6 @@ const struct iris_platform_data qcs8300_data = {
 	.max_session_count = 16,
 	.max_core_mbpf = ((4096 * 2176) / 256) * 4,
 	.max_core_mbps = (((3840 * 2176) / 256) * 120),
-	.dec_input_config_params_default =
-		sm8550_vdec_input_config_params_default,
-	.dec_input_config_params_default_size =
-		ARRAY_SIZE(sm8550_vdec_input_config_params_default),
-	.dec_input_config_params_hevc =
-		sm8550_vdec_input_config_param_hevc,
-	.dec_input_config_params_hevc_size =
-		ARRAY_SIZE(sm8550_vdec_input_config_param_hevc),
-	.dec_input_config_params_vp9 =
-		sm8550_vdec_input_config_param_vp9,
-	.dec_input_config_params_vp9_size =
-		ARRAY_SIZE(sm8550_vdec_input_config_param_vp9),
-	.dec_input_config_params_av1 =
-		sm8550_vdec_input_config_param_av1,
-	.dec_input_config_params_av1_size =
-		ARRAY_SIZE(sm8550_vdec_input_config_param_av1),
-	.dec_output_config_params =
-		sm8550_vdec_output_config_params,
-	.dec_output_config_params_size =
-		ARRAY_SIZE(sm8550_vdec_output_config_params),
-
-	.enc_input_config_params =
-		sm8550_venc_input_config_params,
-	.enc_input_config_params_size =
-		ARRAY_SIZE(sm8550_venc_input_config_params),
-	.enc_output_config_params =
-		sm8550_venc_output_config_params,
-	.enc_output_config_params_size =
-		ARRAY_SIZE(sm8550_venc_output_config_params),
 
 	.dec_input_prop = sm8550_vdec_subscribe_input_properties,
 	.dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),

-- 
2.47.3


