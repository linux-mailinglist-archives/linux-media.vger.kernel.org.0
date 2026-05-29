Return-Path: <linux-media+bounces-63036-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0G1UBLClGWptyAgAu9opvQ
	(envelope-from <linux-media+bounces-63036-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 16:41:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2D8603C75
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 16:41:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 17107303EB4F
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 14:37:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EC763EB813;
	Fri, 29 May 2026 14:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LN09egoA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aqi0niZE"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C4F3EAC84
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 14:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780065423; cv=none; b=G9rD1Bm3QhNKy1eHtl8vzJN8rSzJqmaml15o8dHXLF50XX1U7bo9tjGEHXFuamDvaCrOoUH5nv0PoXdk4smmVYAcCxP44qvH+6nPT/CG4za/gHOEavsVDPOmNbT5fKWhANe9FL94fHhiERN9FBDr6KtOye+ocRjJBtxmIlIDTcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780065423; c=relaxed/simple;
	bh=6RCyxrVBbRG7OPcYGe9spivdetZLooQia+lCLwJSkCI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YmcCkO5B79k1cWve8uPpag34PKAEn2rKJnxe7oxeu2xeh2oxI/l4V7n989eJbBek2FkcN+LfwJ33O0RzCJ4YJBbdjS9eyGowOtHWLVjLOGEbT7uTm+s9c/rZGXcYa7v80GRh+Z/jay3X33m5TvK+6h096kKsJaAYJ9z/7kPJQYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LN09egoA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aqi0niZE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TDKriD3845257
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 14:36:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bAUdnuwvW0KjZ3Bgozg0YT
	fDv65guCcfIf201Z9oZ/c=; b=LN09egoAz/5Mv9Dqp2M5M5ZhndnnkS191050z3
	1uc2scC/9ywU0bkbk/XivLWHvL0AwW9A586b7a0exzGIpBtzqqMS1IrbhZ3rG7cX
	kvIG/Ph8723jvV8H3RexzB7TrrKmp4yKoforgXr5faU41Vysn+AOlLOfUaPlYMl5
	M0v2feZ8c6fKjW4hauv8cYEYZpFDrRBDxdSNFXCn6FK0mUlPmvp0QYCIyT/aP2lm
	fJURIpsjkolJd9RXmx1Yc5W24TFfDDKP4Ql7TJDpc4K1xR8L7sUdMl3/VhDUtVsK
	GclggCgg3NVpogHyCD97bU0Fd3gMEGhb+t3luNasoOMSG6pQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eex6m3r56-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 14:36:57 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6751db2792dso3122274137.3
        for <linux-media@vger.kernel.org>; Fri, 29 May 2026 07:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780065417; x=1780670217; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bAUdnuwvW0KjZ3Bgozg0YTfDv65guCcfIf201Z9oZ/c=;
        b=aqi0niZEJbGRPOnTZkUcsKxmtD6TMw6yGybKnE8HYelQ+vCso0H4McJQdP9e6UF71y
         V7l/deEaOe5Xf4LGnpDRcdVUqG/IAzfjKH2Pu3/KO5zcble94tdOShaLnZZTSLTKgGdv
         bWbN+prSq3419rMnL7cqssBdbjYJfJ1POmPc7MoZCXCwDAoH3kXaQ8ZnJqmS2Uli+QcP
         SNgbBNqpJv5CPi20YDva3249PR1y82P2lKTXJCI5jFGSjyLKpjo/dbuSV4z6ELHexu5a
         Ac5qw2ObhWrr6GOh6379JiVTzIW30Lv71SRMENmswcnOElmDIJBcnF6hHNhOcwrnWBjG
         e1HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780065417; x=1780670217;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bAUdnuwvW0KjZ3Bgozg0YTfDv65guCcfIf201Z9oZ/c=;
        b=iHTC7NceKJPihu19VNCn4/cg9NTVSKKcxdaLTsIz+5dwTrATJ5J1p0bp22r/YAIIud
         SQ8bER2qLF0ab7CP/d/+UcMjVfKjOipdYXPejsrqW4M5NbUI1jY+rQOQCOLoy2ty5TAE
         QQJwNvR09xdKNSc3bqLahFR5ciOp333ReYjApAF/mlJiXGgQP0jnDSJLX32onfz74ys8
         QigWFyXT6dmC+gy4ZOEedoStTk9mhpOapiVA9/dKFRN8wMcY35st24Bxiwscd6zO1nPc
         QasWyp/0Sr/4VwmDgoslxMAzrXZxICoqkj83bt2tTmXPBGTQyfvlQXWeAydutGLazdyY
         2kpg==
X-Gm-Message-State: AOJu0YztpRGc+4wGPsAq3zeb5jbpMsVcHuibUUCXkwFUToQd31ZmUDyC
	ca/ZrcJcY4V354lTjmEzkgIsCc9E1oWvEhmfDCPsp+ktnm8Q756p62LFVKVHekJjMe4OiOWuB00
	YSYIiCV99FKTM+Ix5eQehWuCywCyWQBNBUNw+gKVUfefjRT+QBsQ+5FQb7ir5rrlZaA==
X-Gm-Gg: Acq92OGtBjrDNvcRRhj6dMftEz9VarXr2YP2Nc9IkY27BWn2tENyBAFJ7FEBu1KWPHv
	WYI3pWW4z7ai0W9Wiz7EyM1kw3DnTDQL5xQlz9Zb3Off5zvCwZTqR+e22B+A4FpBEM/b8JIeOEx
	u+U7H2jWEL8NMqMVxpMikaE9LuzWcRUBqvDkQZt8I9BLHjyeTjAeyu1k+NDivP64b4FfkKCapko
	w5AvwsYyogBEEOQyMzqdRUcDjvUfaM/1SA7FEHii3nUKTfKUgE7mxjOPqRWXZGi2m5VLl/2oS6f
	aErBc0SSQOpCGus4P9sgKQid7wA68Xl0vI9nB7iA1qCFPkBs26pz+Q/4ykx0uxQqMXQKPri/D2+
	qW4GyZZsa1A54Omp45CnLNY6mp0EOtTDvxB1OiBp1xFT9HwTjiZBztzt+4J6h4zmNoeNsVRukgP
	huf1X47g4vR5VSlEguhbW8d5cB9qEcgDg/FLCpZLZKBUu9bA==
X-Received: by 2002:a05:6102:860a:10b0:6c3:1bcd:31dd with SMTP id ada2fe7eead31-6c31bcd4cdamr601534137.6.1780065416934;
        Fri, 29 May 2026 07:36:56 -0700 (PDT)
X-Received: by 2002:a05:6102:860a:10b0:6c3:1bcd:31dd with SMTP id ada2fe7eead31-6c31bcd4cdamr601519137.6.1780065416308;
        Fri, 29 May 2026 07:36:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5b068a9dsm316317e87.11.2026.05.29.07.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:36:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v6 0/2] media: qcom: iris: Add generic Gen2 firmware
 detection and loading
Date: Fri, 29 May 2026 17:36:53 +0300
Message-Id: <20260529-kodiak-gen2-support-v4-v6-0-9a81bfa797d9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAIWkGWoC/4WP3W6DMAyFXwXleu7yQyhwtfeYdhHAaaMOQuMQd
 ap496UgbbvYNMmydCz7O8d3RhgcEmuLOwuYHDk/ZVE9Faw/m+mE4IasmeSy4qVs4OIHZy5wwkk
 CLfPsQ4RUgjlarrUV2tiO5eM5oHW3Dfz6tuuA1yXz4z5knSGE3o+ji23hgiOY8BafE04LwZdmP
 4O0xRZDCbEvBBx9RLBjJNBKqaqXXd0Y3qYje5ieHUUfPrbnUrm5/vdHLg6iq/hxEMo2Xf3iiQ7
 Xxbw/oh5y28hJf9O0kH/SdKaZpm6qupRqkOUvtHVdPwHP2uROhgEAAA==
X-Change-ID: 20260429-kodiak-gen2-support-v4-a7f055f15afb
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=16511;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=6RCyxrVBbRG7OPcYGe9spivdetZLooQia+lCLwJSkCI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqGaSGpEhr2/pctQaX5mPaOiXgoOAZNJMrR0tGv
 fF791OfKIuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCahmkhgAKCRCLPIo+Aiko
 1dJnCACEEw+6CSnT8/xKZdRHMxWF11NJmHY9C6jchRqd3532bmmwDrCzBO63gYtu2XyvTmXLImd
 24lWVGWvumJ+wtmETC3Z6NgJYvAu8ymBJKvcypG06/sDDzz3Dce6rOnAQku7TVaJj6gxbyJV3l0
 sIDN0MArSjpxeLiwl3P9w1P6UjCQMqYpDG1FXJ7RnLtR6SEq0dxEcNCWCiKRcBDoRca6ggODBgt
 vxbLq7TSAccGAxHLjZLPPxdsjiGoK9xKFKetlC93qFPScd+qwK+j5jvVxgyw5p4/49Xf1YuZIqm
 vY5LwZjT167Q74C9XscwKltYur5cA86ahdDQ99pxxNlg8qQi
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE0NCBTYWx0ZWRfX4GQm2W2bExHk
 jZO7SvSpECXwQFmCokl5DYUH6bHO2Tx26MsT82SJ/LLGLyIbgUB9gALeAPLJfAVN9Z1jEf7jEXd
 E5zMIMF4RCbJmvIBygWdo1StvAgbZbGIywhqGFgO9nSIo4jTh21lGCgdZi/d/Ckqc0DESG7Iv0S
 CHKgV9kfb6cyb5DNCEXvUoP9sjqC6O4LaQbvmwrME4JXdaLPjXwdNQTB3dfiuC5DKq3LG/5b7P2
 h9bU5pF1rv70Ro3Us2tQ4YBdy/BZ4D/XfbVVRx4VvWOKEEO//z5zRV5EmG5WZRez7tIPSogRfp3
 85y54oVUL1a6YJ+WrC+4wpgHfNosy0Nncp2IC+vXCRFOq7wPoJJLPTL2fmrqqtOiP6ne1WRN0XN
 oh9zMXbAYJIaJBRVWMfjnSyLXsGNvYeVWrDd/nN86fWc4Ws7Ssu/Tlvy3+ndhSzhzGlAsU0e/PD
 dk/LYAzUMQipY0rn/Bg==
X-Authority-Analysis: v=2.4 cv=frnsol4f c=1 sm=1 tr=0 ts=6a19a489 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=g1SGuxIiLV_eyP-kmAQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: 5nGs4_Fg6_DyQdaaT5DpTuOd4dtSyT2L
X-Proofpoint-ORIG-GUID: 5nGs4_Fg6_DyQdaaT5DpTuOd4dtSyT2L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290144
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,msgid.link:url,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63036-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0D2D8603C75
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series enhances the Iris driver to support platforms that provide both
Gen1 and Gen2 HFI firmware by adding generic runtime firmware generation
detection and selection logic.

Some Iris platforms are capable of running either Gen1 or Gen2 HFI‑based
firmware, but the driver has historically assumed a single firmware
generation selected at build or platform‑definition time. This series
updates the firmware loading mechanism to dynamically determine the
firmware generation at runtime and select the appropriate HFI
implementation accordingly.

When no Device Tree firmware override is present, the driver now prefers
Gen2 firmware when available and falls back to Gen1 if loading Gen2
fails. When a firmware name is explicitly provided via Device Tree and
both Gen1 and Gen2 descriptors are available, the loaded firmware image
is inspected prior to authentication to determine its generation. Based
on this detection, the driver updates its firmware descriptor and
platform data so that the correct HFI implementation is used.

v4l2-compliance results on SC7280 with Gen2 firmware:

$ v4l2-compliance -d /dev/video1 -s
v4l2-compliance 1.28.1-5233, 64 bits, 64-bit time_t
v4l2-compliance SHA: fc15e229d9d3 2024-07-23 19:22:15

compliance test for iris_driver device /dev/video1:
Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Encoder
        Bus info         : platform:aa00000.video-codec
        Driver version   : 6.19.0
        Capabilities     : 0x84204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
        Detected Stateful Encoder

Required ioctls:
        test VIDIOC_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/video1 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 38 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)

Test input 0:
Streaming ioctls:
        test read/write: OK (Not Supported)
        test blocking wait: OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (select): OK
        Video Capture Multiplanar: Captured 61 buffers
        test MMAP (epoll): OK
        test USERPTR (select): OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Total for iris_driver device /dev/video1: 52, Succeeded: 52, Failed: 0, Warnings: 0

$ v4l2-compliance -d /dev/video0 -s5 --stream-from=/media/FVDO_Freeway_720p.264
v4l2-compliance 1.28.1-5233, 64 bits, 64-bit time_t
v4l2-compliance SHA: fc15e229d9d3 2024-07-23 19:22:15

Compliance test for iris_driver device /dev/video0:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Decoder
        Bus info         : platform:aa00000.video-codec
        Driver version   : 6.19.0
        Capabilities     : 0x84204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
        Detected Stateful Decoder

Required ioctls:
        test VIDIOC_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/video0 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 12 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK
        test Composing: OK
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)

Test input 0:

Streaming ioctls:
        test read/write: OK (Not Supported)
        test blocking wait: OK
        Video Capture Multiplanar: Captured 65 buffers
        test MMAP (select): OK
        Video Capture Multiplanar: Captured 65 buffers
        test MMAP (epoll): OK
        test USERPTR (select): OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Total for iris_driver device /dev/video0: 52, Succeeded: 52, Failed: 0, Warnings: 0

Fluster results on SC7280 with Gen2 Firmware:

./fluster.py run -ts JVT-AVC_V1 -d GStreamer-H.264-V4L2-Gst1.0 - 77/135
The failing test case:
- Unsupported profile: H.264 Extended profile is deprecated.
	- BA3_SVA_C
- Interlaced content is not supported yet.
	- CABREF3_Sand_D
	- CAFI1_SVA_C
	- CAMA1_Sony_C
	- CAMA1_TOSHIBA_B
	- CAMA3_Sand_E
	- CAMACI3_Sony_C
	- CAMANL1_TOSHIBA_B
	- CAMANL2_TOSHIBA_B
	- CAMANL3_Sand_E
	- CAMASL3_Sony_B
	- CAMP_MOT_MBAFF_L30
	- CAMP_MOT_MBAFF_L31
	- CANLMA2_Sony_C
	- CANLMA3_Sony_C
	- CAPA1_TOSHIBA_B
	- CAPAMA3_Sand_F
	- CVCANLMA2_Sony_C
	- CVFI1_SVA_C
	- CVFI1_Sony_D
	- CVFI2_SVA_C
	- CVFI2_Sony_H
	- CVMA1_Sony_D
	- CVMA1_TOSHIBA_B
	- CVMANL1_TOSHIBA_B
	- CVMANL2_TOSHIBA_B
	- CVMAPAQP3_Sony_E
	- CVMAQP2_Sony_G
	- CVMAQP3_Sony_D
	- CVMP_MOT_FLD_L30_B
	- CVMP_MOT_FRM_L31
	- CVNLFI1_Sony_C
	- CVNLFI2_Sony_H
	- CVPA1_TOSHIBA_B
	- FI1_Sony_E
	- MR6_BT_B
	- MR7_BT_B
	- MR8_BT_B
	- MR9_BT_B
	- Sharp_MP_Field_1_B
	- Sharp_MP_Field_2_B
	- Sharp_MP_Field_3_B
	- Sharp_MP_PAFF_1r2
	- Sharp_MP_PAFF_2r
	- cabac_mot_fld0_full
	- cabac_mot_mbaff0_full
	- cabac_mot_picaff0_full
	- cama1_vtc_c
	- cama2_vtc_b
	- cama3_vtc_b
	- cavlc_mot_fld0_full_B
	- cavlc_mot_mbaff0_full_B
	- cavlc_mot_picaff0_full_B
- Unsupported bitstream: num_slice_group_minus1 > 0 (slice groups not supported by hardware).
	- FM1_BT_B
	- FM1_FT_E
	- FM2_SVA_C
- Unsupported bitstream: SP slice type is not supported by hardware.
	- SP1_BT_A
	- sp2_bt_b

./fluster.py run -ts JCT-VC-HEVC_V1 -d GStreamer-H.265-V4L2-Gst1.0 - 131/147
The failing test case:
- 10bit content not supported yet
	- DBLK_A_MAIN10_VIXS_4
	- INITQP_B_Main10_Sony_1
	- TSUNEQBD_A_MAIN10_Technicolor_2
	-  WPP_A_ericsson_MAIN10_2
	-  WPP_B_ericsson_MAIN10_2
	- WPP_C_ericsson_MAIN10_2
	- WPP_D_ericsson_MAIN10_2
	- WPP_E_ericsson_MAIN10_2
	- WPP_F_ericsson_MAIN10_2
	- WP_A_MAIN10_Toshiba_3
	- WP_MAIN10_B_Toshiba_3
- Unsupported resolution
	- PICSIZE_A_Bossen_1 - resolution is higher than max supported
	- PICSIZE_B_Bossen_1 - resolution is higher than max supported
	- WPP_D_ericsson_MAIN_2 - resolution is lower than min supported
- CRC mismatch
	- RAP_A_docomo_6
- CRC mismatch - bitstream issue - fails with ffmpeg sw decoder as well
	- VPSSPSPPS_A_MainConcept_1

./fluster.py run -ts VP9-TEST-VECTORS -d GStreamer-VP9-V4L2-Gst1.0 -j1 - 235/305
The failing test case:
- Unsupported resolution
	- vp90-2-02-size-08x08.webm
	- vp90-2-02-size-08x10.webm
	- vp90-2-02-size-08x16.webm
	- vp90-2-02-size-08x18.webm
	- vp90-2-02-size-08x32.webm
	- vp90-2-02-size-08x34.webm
	- vp90-2-02-size-08x64.webm
	- vp90-2-02-size-08x66.webm
	- vp90-2-02-size-10x08.webm
	- vp90-2-02-size-10x10.webm
	- vp90-2-02-size-10x16.webm
	- vp90-2-02-size-10x18.webm
	- vp90-2-02-size-10x32.webm
	- vp90-2-02-size-10x34.webm
	- vp90-2-02-size-10x64.webm
	- vp90-2-02-size-10x66.webm
	- vp90-2-02-size-16x08.webm
	- vp90-2-02-size-16x10.webm
	- vp90-2-02-size-16x16.webm
	- vp90-2-02-size-16x18.webm
	- vp90-2-02-size-16x32.webm
	- vp90-2-02-size-16x34.webm
	- vp90-2-02-size-16x64.webm
	- vp90-2-02-size-16x66.webm
	- vp90-2-02-size-18x08.webm
	- vp90-2-02-size-18x10.webm
	- vp90-2-02-size-18x16.webm
	- vp90-2-02-size-18x18.webm
	- vp90-2-02-size-18x32.webm
	- vp90-2-02-size-18x34.webm
	- vp90-2-02-size-18x64.webm
	- vp90-2-02-size-18x66.webm
	- vp90-2-02-size-32x08.webm
	- vp90-2-02-size-32x10.webm
	- vp90-2-02-size-32x16.webm
	- vp90-2-02-size-32x18.webm
	- vp90-2-02-size-32x32.webm
	- vp90-2-02-size-32x34.webm
	- vp90-2-02-size-32x64.webm
	- vp90-2-02-size-32x66.webm
	- vp90-2-02-size-34x08.webm
	- vp90-2-02-size-34x10.webm
	- vp90-2-02-size-34x16.webm
	- vp90-2-02-size-34x18.webm
	- vp90-2-02-size-34x32.webm
	- vp90-2-02-size-34x34.webm
	- vp90-2-02-size-34x64.webm
	- vp90-2-02-size-34x66.webm
	- vp90-2-02-size-64x08.webm
	- vp90-2-02-size-64x10.webm
	- vp90-2-02-size-64x16.webm
	- vp90-2-02-size-64x18.webm
	- vp90-2-02-size-64x32.webm
	- vp90-2-02-size-64x34.webm
	- vp90-2-02-size-64x64.webm
	- vp90-2-02-size-64x66.webm
	- vp90-2-02-size-66x08.webm
	- vp90-2-02-size-66x10.webm
	- vp90-2-02-size-66x16.webm
	- vp90-2-02-size-66x18.webm
	- vp90-2-02-size-66x32.webm
	- vp90-2-02-size-66x34.webm
	- vp90-2-02-size-66x64.webm
	- vp90-2-02-size-66x66.webm
- Unsupported format
	- vp91-2-04-yuv422.webm
	- vp91-2-04-yuv444.webm
- CRC mismatch
	- vp90-2-22-svc_1280x720_3.ivf
- Unsupported resolution after sequence change
	- vp90-2-21-resize_inter_320x180_5_1-2.webm
	- vp90-2-21-resize_inter_320x180_7_1-2.webm
- Unsupported stream
	- vp90-2-16-intra-only.webm

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v6:
- Rebased on Bryan's tree, fixing dependencies
- Fixed a conflict in Hamoa support
- Link to v5: https://patch.msgid.link/20260512-kodiak-gen2-support-v4-v5-0-a98968423d24@oss.qualcomm.com

Changes in v5:
- Inherited the series from Dikshita per her content
- Rebased on media tree, solving the conflict
- Made iris_vpu20_p1_gen2_s6_desc static, following the rest of data
- Dropped the patch "media: iris: Switch to hardware mode after firmware
  boot", it is a dependency of the series, but it is applied to the
  fixes branch.
- Link to v4: https://patch.msgid.link/20260429-kodiak-gen2-support-v4-v4-0-1b607d13f9b8@oss.qualcomm.com

Changes in v4:
- Simplified the code handling selection between Gen2 / Gen1 and fallback (updated by Dmitry)
- Link to v3: https://lore.kernel.org/linux-media/20260331-kodiak-gen2-support-v3-0-958296fab838@oss.qualcomm.com/

Changes in v3:
- Rebased on platform rework series by Dmitry.
- Moved version detection logic inside iris_load_fw_to_memory (Dmitry).
- Make Gen2 as deafult for SC7280 and falls back to the Gen1 name only
  when the Gen2 image is missing (Dmitry).
- Link to v2: https://lore.kernel.org/r/20260227-iris_sc7280_gen2_support-v2-0-7e5b13d26542@oss.qualcomm.com

Changes in v2:
- Improved the logic to detect if firmware loaded is Gen1 or Gen2 (Dmitry/Konrad)
- Added a patch to switch hardware mode after firmware boot
- Link to v1: https://lore.kernel.org/r/20260209-iris_sc7280_gen2_support-v1-0-390000a4fa39@oss.qualcomm.com

To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
To: Abhinav Kumar <abhinav.kumar@linux.dev>
To: Bryan O'Donoghue <bod@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Dikshita Agarwal (2):
      media: iris: Initialize HFI ops after firmware load in core init
      media: iris: Add Gen2 firmware autodetect and fallback

 drivers/media/platform/qcom/iris/iris_core.c       |   2 +
 drivers/media/platform/qcom/iris/iris_firmware.c   | 105 +++++++++++++++++----
 .../platform/qcom/iris/iris_platform_common.h      |   6 +-
 .../media/platform/qcom/iris/iris_platform_vpu2.c  |  11 ++-
 .../media/platform/qcom/iris/iris_platform_vpu3x.c |  10 +-
 drivers/media/platform/qcom/iris/iris_probe.c      |   5 -
 drivers/media/platform/qcom/iris/iris_vidc.c       |   3 +
 7 files changed, 108 insertions(+), 34 deletions(-)
---
base-commit: c92057a181e8df8fd47426bb904c3253693cfced
change-id: 20260429-kodiak-gen2-support-v4-a7f055f15afb
prerequisite-change-id: 20260311-iris-remote-fmts-53336c2b89a0:v7
prerequisite-patch-id: aab511a6975936fb0198697fca7b61cc2277e1b4

Best regards,
--  
With best wishes
Dmitry


