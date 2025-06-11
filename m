Return-Path: <linux-media+bounces-34491-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C12AD4A85
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 07:44:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C2B1017B248
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 05:44:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FCF2226D0E;
	Wed, 11 Jun 2025 05:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SXRSRZdE"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC76220F33
	for <linux-media@vger.kernel.org>; Wed, 11 Jun 2025 05:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749620663; cv=none; b=cy5v+kO32JQWX6xkVEX/b1AyWKGs4OLkVFSzmhlRTF0flK2mn5Yxh/I75olxz2lGfvwddEbAgk5wGUjX8dJkKKEyP69hf5qr9jZVBGF1NzSSaDiODvWpGt/hb1RhpJlpBofFMQFt1LY0DNduOjzZTwb6SfOAyv+zPEQ5tDhVb4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749620663; c=relaxed/simple;
	bh=4bPODOzNV1J1Wag20WqHQpC7iwILRqUaFidO5fo7Wj8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HXpcRD+LDZG+fHYKt1Auk+PsU6uOSnki8fvM/NUP4xaaTn8neEdpeQxfz300uv3f8u9qLRlxgdDJ54do8AbyK3HofPVO/hLMt433wmEpnVHc7qgEGFCGj+SN3ezWKmQVUtxvExreNxEiHHNLWPeixcnY8YAz8dIsxjTLVZwFkmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SXRSRZdE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AIPqci030875
	for <linux-media@vger.kernel.org>; Wed, 11 Jun 2025 05:44:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Z2paThcjo4kV5rlHhG4CJt
	0FpfCXVKHmPjNjUTqWvJw=; b=SXRSRZdEgdV0prrcKjzTTowChbnivKHrZeLDPb
	WL7MhNdZGWFmcDVzAA4ABDh/Va9NzJdysQn/Dm4TvUjFni2GWj7nsOh9iWxMKVGU
	o9NK3ZFP5knGhGE9DHyAR2W5QbGLZ8GyMBRoPzMcf6YEOpFLQawHrqrT+UsL4bR4
	/bKZA2ZYXjy3IhdbRLl7tbI17s/J26UCcV7soTCGIA06akVZayXyZzJhGSWxccsT
	AdAqQ+tIAdM29u/KlQvEgvrQWXXrrBfCEx4QRRROanC8TNBBnJFep6eeq3wny2UK
	IW08dnWVRIxkk1BwlhW2wML3k5FRSSK68ffmS3dHdR5Q680Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2teegw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 11 Jun 2025 05:44:19 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b115383fcecso3647652a12.1
        for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 22:44:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749620658; x=1750225458;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z2paThcjo4kV5rlHhG4CJt0FpfCXVKHmPjNjUTqWvJw=;
        b=fx+YMP+HDGpXMGOxPblMYGAtty0MAJ9YwJtfwksc7/SocqKWXt+FQSIwsCencxSJD2
         6n/gpzsC4VGFEJM7wmgEklWDIghunk7RJRkYyhUJlBGLJnpSZPHtwh1ZFjDeT20SQMKQ
         BWoOOLOiXlT1G/Xqy2NFDqiY1BAdW8Q2DJWfXQiE/OSr59jusC2Cr6S7okPRCzO6YrCN
         m8lIvPunf5ZZ2oucYwBgf0bZCtAxh5CU3wiZ4vlvaSKmiFomVJ/liKFQ36h0ynwGlCLA
         7uxzeDO2UptdR+0Alhrh3EjIHfuNpzuty4AY80B3v62hKWnSYlGCV3TO4L6BbASegYjJ
         aeXg==
X-Gm-Message-State: AOJu0Yz0BztQvyfNJ23qETqvgdRg1I2ul4W8sLRP2JZYuXjlMYAlOjCp
	e4LLFxTjIwus2MklxMjUNJUMSYkYVF/zCJ92nFzZsXGGmejO2brAap5ToAqyN1dj9/517jenN3+
	GV3B0OZaj583H0tah0rncH+Qhk8VHPIO3gMXrMXdaNccuySmf+adSPc2RAuPixoEpjdAqQNke0Q
	==
X-Gm-Gg: ASbGnct5SrGbTsXTrOwp29+n7/BPwHKnUnNkRQegoduBSuH4qkaizzqSY2rNXw5qnDd
	nXezafuMbrjNC4nhiuUfrejcuJXqaKj0Z1I1W+RyXWM6l2GjDBexDLR5lB1fusLdWc+rokgWI/m
	IaEcp1DYngWFGaXfMqZPTNdOL3xVgGMQvpbV2x2Yd2mw7XDNCcCKILduj+kwg5S5tiAs3GB3Lfl
	ZA29wOSXVkbD2LEZVVy/M/PCxzD5kYyYed9N9zukaBPP+CxPnSAlWafY0qNiSV3BinMoQwR0FpD
	XXqSMdlbzyM4gsvF8qrkw2JGsvl3p8pT
X-Received: by 2002:a05:6a20:2589:b0:21f:53a9:b72c with SMTP id adf61e73a8af0-21f86754dbemr3178019637.38.1749620658379;
        Tue, 10 Jun 2025 22:44:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5RTYJPaD19g1+QKXGXvxhjvcmz9N0P/Wo4pkBLGPiOVS4sBLpqjPb8UTr/LDjbvr/4AnFYw==
X-Received: by 2002:a05:6a20:2589:b0:21f:53a9:b72c with SMTP id adf61e73a8af0-21f86754dbemr3177998637.38.1749620657998;
        Tue, 10 Jun 2025 22:44:17 -0700 (PDT)
Received: from [10.213.111.143] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0eb0dasm8629697b3a.170.2025.06.10.22.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 22:44:17 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 11 Jun 2025 11:13:44 +0530
Subject: [PATCH] media: iris: Fix opp scaling of power domains
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-iris-opp-fix-v1-1-424caec41158@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAI8XSWgC/yWMQQ6CMBAAv9Ls2TVtSTHyFcOh1EX3AK27SEwIf
 6eR40wys4GSMCl0ZgOhlZXzXMFdDKR3nF+E/KwM3vpgg78hCyvmUnDkHzY0+nB3yTY+Qk2KUNX
 /3aM/WejzrdfllDBEJUx5mnjpzNpeXYuSHPT7fgAkGRzpiwAAAA==
X-Change-ID: 20250527-iris-opp-fix-3ef2591c032a
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749620655; l=1267;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=4bPODOzNV1J1Wag20WqHQpC7iwILRqUaFidO5fo7Wj8=;
 b=GW1VPWKI/sCUGw/lmdjcfb1/v1p4eeE2hxIHDUz6r0uc8ZG6Nh6B1h6ZjF1CXCVBjg7JskGvw
 jcYo3SVzHEYBjKshveIrasbrGRIJ9GRxGQPohIyCG7g/J+DEMY0SQcC
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: xfVFNxSKV1hz9DTR6RxZNcj5EvHrByNO
X-Authority-Analysis: v=2.4 cv=GoxC+l1C c=1 sm=1 tr=0 ts=684917b3 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=Bqk5Gw0CwUaqKlFR4NYA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: xfVFNxSKV1hz9DTR6RxZNcj5EvHrByNO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDA0OSBTYWx0ZWRfX8FgZCZ9yGiyn
 CLU/Zd4Um6nmxKpt+M4FbZiW/tJA8Dh8k2EOIDWzwXXQocF7u6KFI6wyR/KcOHSrRzRxzRO8aLQ
 rhfaRoBPwNEyx4Q1gD1NoV6WiwZMdBWR2nCy1oZLuZfQxyL6+XKvioVZtRGJVYDuWcnihkvl13X
 tpvVRlx3Af7HQrARdk05AlfDsaQyFkehM7hz3d1IFoo2hg7S1zdj0rX08NNduHXUnbwarlq6EoQ
 3DjF6adXcBJo6Vsr0PRNGYQdispVJDHFvsavW5xU4IQHEm9odDkQbQCO5kz9L9Vkn08Rn9QLUrZ
 4NevoiGkBR264vAiodoi7hkZuPEiL5yrLmySKG+taTowjU5MT0YvqgpqNuLyfOdehMh+6vj/mm2
 3naU8PhKFKiSmFAluGellksv5jFwkGAi/myKeLoYjOsUkliOi+Y5px07ajxHax3zE+HP4aVE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_02,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=983 adultscore=0 impostorscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506110049

Pass PD_FLAG_REQUIRED_OPP flag to allow opp framework to scale the rpmpd
power domains.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Found this issue while reviewing the Iris source and only compile tested.
---
 drivers/media/platform/qcom/iris/iris_probe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 9a7ce142f7007ffcda0bd422c1983f2374bb0d92..4e6e92357968d7419f114cc0ffa9b571bad19e46 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -53,7 +53,7 @@ static int iris_init_power_domains(struct iris_core *core)
 	struct dev_pm_domain_attach_data iris_opp_pd_data = {
 		.pd_names = core->iris_platform_data->opp_pd_tbl,
 		.num_pd_names = core->iris_platform_data->opp_pd_tbl_size,
-		.pd_flags = PD_FLAG_DEV_LINK_ON,
+		.pd_flags = PD_FLAG_DEV_LINK_ON | PD_FLAG_REQUIRED_OPP,
 	};
 
 	ret = devm_pm_domain_attach_list(core->dev, &iris_pd_data, &core->pmdomain_tbl);

---
base-commit: d9946fe286439c2aeaa7953b8c316efe5b83d515
change-id: 20250527-iris-opp-fix-3ef2591c032a

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>


