Return-Path: <linux-media+bounces-59398-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBePIl4K6mkzsgIAu9opvQ
	(envelope-from <linux-media+bounces-59398-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 14:02:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E379451AA2
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 14:02:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0056B302403C
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 12:01:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC21E3ECBC3;
	Thu, 23 Apr 2026 12:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UDMbyINx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JTnS2v8p"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7963EC2EC
	for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 12:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776945652; cv=none; b=ZRUvnH3jL/6nvZkIOcgmk77nIZQjX9RpiGpNv/rS+F/ZxmMj2c3yEj/MzKP/x21EJtYZyttFajU3SlJG20BtieSKyIDPoMci7fXB4DFQ8zyFpyZ6LaM0+/DSPxHp4vYGTHomxb6+Evp3+CIiiXE6cN5jdK36rwTeg5cU1Ztbto4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776945652; c=relaxed/simple;
	bh=YmQXvtkYvIze5TqdErB6gc5at7BcNjGJMakZ7uOJLvU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cooV2yHNUwq7W+34jikZQg6/DGkMCvkWFsTFA3fyrP6aSljVvseam4qSne30F6NDDNBnbpbYdwApHN7NKOQ2wUbEqlE5fS04bb0075rMtCiOaUKiY1Buzxk91yDewH2FcO231SBi7iwKMM7dlmC/4htD2MTEZRqe7QBDsJ8QxlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UDMbyINx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JTnS2v8p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8u5lv3769126
	for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 12:00:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R8N1jbkdytVOL6T6kzcN2pMzXZVTuqMNODxZcTrhm10=; b=UDMbyINxPeKxhxPJ
	8zWcK6eiU9XewZV4cKRGdj5Y2heZwa9MLKo8tx7pPXJjKi7vVRPdNQYNDvOVE4as
	fWnij5yUeW4XMv/u/Buiw4cNI55dWYUiN2wr9Qya4agR1QkmY4NnnNpnMBJ3DWft
	D5QEz6LV+74dRcSFu7giAOWXWE8qx4L98FIzMYmFr+Rtwj4jesJblMF52Zf3IiXx
	i0uB63dunLAFzjU5F3xjBCkx21Tp4teEUqLL6ELzhqpYWWIZyYrbFqgJvFvdkb8Z
	WFmMpdQ4y0/7LQrty9TO0YKM5DTbS89o8Mik0OPklC8AfGksx4qz2sjxZMK1AZMf
	WDK/hA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1hq3rgb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 12:00:48 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b4654f9bb6so69230625ad.2
        for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 05:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776945647; x=1777550447; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R8N1jbkdytVOL6T6kzcN2pMzXZVTuqMNODxZcTrhm10=;
        b=JTnS2v8pWLI9OUdSmM2ECqOA5Vt5bL9+q3JApodDs7/8LJyXkHNo7Z5YZ1Zy9lgzp6
         vyypNf8BjaDViYpMl4zntvhhO2Y26pDjxfm8xEykGXG8QuLTv3TA7sNgKkRU18H5QSQs
         yI5q0tANqRggiQuko+ywF9v9qBfzYlyYBuhwH49J7oiT7KBhffCkJ/5KexX1rGYS2l09
         LWUp3iZ+zsIyqSjFF41RIFwjBHgVMXSicFqLt1yUrHWiv+sz4mF1QXrwUGuIZZ88qocl
         sdt4g8YGc0sM9j+yoSiBs2BMlGGreWvSnNbHlJppUS9LWhmaITYL1Haa3WNm9rl1XqW9
         yKGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776945647; x=1777550447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R8N1jbkdytVOL6T6kzcN2pMzXZVTuqMNODxZcTrhm10=;
        b=qXtyoF3DizjKHYb7SmYMNn88BcBfbcOPWscVcxcAQ2wCmxGYlRb///eoAweDofhYsv
         Qh+8bjsPE67iyFfLJ2D8qgIpj80pLO96v41ja6wOFV1dLNYzy9cI7fJcSz+8pHF1F5lJ
         /vc50EiB6W87qc79R5EA9s3RyBgBRaDGmuF2zhChvApkc+ukmNE7s21OrWUdXUAIFjsH
         +sv+FrfPKjqKxNTa1Z4yOTX76tfuMu8CHDddN6XS3isMavZ/RmAcHr0bMSztnhiXiyjC
         kvietLIkDSa7Cl6I1iOiXbcSTHsZIkL6dAk7n7UFVbPZxdveqNe7Mg+TsYeJxpO3nqBw
         DKVA==
X-Gm-Message-State: AOJu0YxxaNtcaU2HAlxhExcarLmGZB+n/AybK+DCc9g2YY8ZULTCUWan
	+jnof1YiCVNVx4xRcJe9Wf4pLO7Q2azJHn3prFzgsGcpg7gza1WwdB6+XABaNFhEOHJ+Qrsz8sf
	WUpcjtRQbfjnMV8YNGYTiek7Blf5ZUux8ND0fqh36bkdZ0+lFdROI3eygczRGmKidJw==
X-Gm-Gg: AeBDieulURi1TVKYH6I9tgyn44jqQur7+VdgK5k9XdgRVZJfMahwh8gxZb/licQ3juT
	WJovgQcWwhl69ttUB8lbXXT6ZEE0pwmX1+3pCF0Y0AIrE5Djt+jZWkYJpEEPxfCHHJ9ZHMUedM+
	cG4Q84uzPWeirtp73uw9HzmWWlXBoCLh8rGcG35/pQ0/LNjRuFhUsEfKewKHoolooGIV6pVL0pQ
	Gcc7TwrZJAIuT5EFAmnLr9v7Roe/lJNPVAu4413k3cvRu74KuepfIUwAgcg6A5EAAtJOXRiPvSP
	mwAG0m5R3r/5/2OpFwmBTvdybtnGmG4ppJKP1s+TS1fp2E1Af0MBuGKNxX2wb27yerLJSKgTVPJ
	jCCKmHyG+5C5R16Bd0Vg/hE8YI5aiAfxspzvdUL4/dmIHvzop+ol86QmLAJ417yAiBHc/Gw==
X-Received: by 2002:a17:903:b8f:b0:2b2:5857:583e with SMTP id d9443c01a7336-2b5f9fc0641mr279156815ad.31.1776945647187;
        Thu, 23 Apr 2026 05:00:47 -0700 (PDT)
X-Received: by 2002:a17:903:b8f:b0:2b2:5857:583e with SMTP id d9443c01a7336-2b5f9fc0641mr279156065ad.31.1776945646343;
        Thu, 23 Apr 2026 05:00:46 -0700 (PDT)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa4f092sm194790355ad.36.2026.04.23.05.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:00:45 -0700 (PDT)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 17:30:07 +0530
Subject: [PATCH v2 3/7] media: qcom: iris: Fix bitmask test in
 iris_allow_cmd()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260423-iris-code-improvement-v2-3-9e9cbf00f9c9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776945627; l=1245;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=YmQXvtkYvIze5TqdErB6gc5at7BcNjGJMakZ7uOJLvU=;
 b=CicWEKM32YbJeZj+8rDmclj4jgAMm2g2Xo00NlYwdv1tBeeNIwPsJ3PubdoF/sp2WdCF/ufXi
 jwKsVsGl7vmDJ2kHFB58jS90/aSacL9BuxKJ7RuYxx2jMDGvSAYPwTB
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDExOSBTYWx0ZWRfXyMSx0l98uQMl
 XI0aOtLCfqvutmWIfhieYNKhDFCyX9DK1VIFzrnah25HHKRhnVCQhJ5lrN5mYCZkTYm4TbLLsUf
 etiHF5rgp+SYKKb3hsbADuifhxzlB7EsrYb3VytXrHsDAEJpNBklQHIkP3TOF6iBmyhDLsV5fYE
 JFFvkwLUzGjDuz4M1HXzlv+UfKRnzliKyliiNC99V1mhujwIV/xkWqCxw3YsyAQAOuMBoEnf1B6
 kELUhDmik/PPY2HdIrUZ7HmjNHbzk95XkCI4JzSFzhOQ8WKoIiWqdZxSzTbAPpo3kR1FS4IBeo8
 2JsNkNuW3nFHUOgJEvya5x5ql5PQLuQPCLJ0KpEt3UR2TVTFxFpHmMXULXch13vX0f0y4FA+ZY+
 ZlrFJVkrbeTPUmobpWq2D5FcEbh4WQpPhjy6diuWF1O2G22tcMh5KSIiZm7bOGxxUmuNzRmW9km
 uwb1noAU8/eAP3ElrAA==
X-Proofpoint-ORIG-GUID: HS4LsCp35Ajr0TIhvRlXV5G87poeARVm
X-Proofpoint-GUID: HS4LsCp35Ajr0TIhvRlXV5G87poeARVm
X-Authority-Analysis: v=2.4 cv=TJt1jVla c=1 sm=1 tr=0 ts=69ea09f0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=cLE5npzMka_F6uTWaO8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230119
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59398-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MAILSPIKE_FAIL(0.00)[172.232.135.74:server fail];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0E379451AA2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

iris_allow_cmd() incorrectly checks a sub‑state flag using a logical
equality comparison. Since sub_state is a bitmask, this allows STOP to
pass when IRIS_INST_SUB_DRAIN is set alongside other bits, violating the
intended drain semantics. Fix this by using a proper bitmask test.

Fixes: d09100763bed ("media: iris: add support for drain sequence")
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_state.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_state.c b/drivers/media/platform/qcom/iris/iris_state.c
index e991f34916ec6e74f3d2cf98bd61b8b1e12a3ca8..5552725c614ea2e336e254898270302fafa646c3 100644
--- a/drivers/media/platform/qcom/iris/iris_state.c
+++ b/drivers/media/platform/qcom/iris/iris_state.c
@@ -269,7 +269,7 @@ bool iris_allow_cmd(struct iris_inst *inst, u32 cmd)
 				return true;
 	} else if (cmd == V4L2_DEC_CMD_STOP || cmd == V4L2_ENC_CMD_STOP) {
 		if (vb2_is_streaming(src_q))
-			if (inst->sub_state != IRIS_INST_SUB_DRAIN)
+			if (!(inst->sub_state & IRIS_INST_SUB_DRAIN))
 				return true;
 	}
 

-- 
2.34.1


