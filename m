Return-Path: <linux-media+bounces-63160-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFfLKd3NG2prGQkAu9opvQ
	(envelope-from <linux-media+bounces-63160-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 07:57:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBAA6149F6
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 07:57:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE2833054F77
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 05:55:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C55883264F6;
	Sun, 31 May 2026 05:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z9335Ei2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g492gi1u"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081383093C6
	for <linux-media@vger.kernel.org>; Sun, 31 May 2026 05:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780206944; cv=none; b=YUHE6SWVKd7Zpf/9IBoa52C/dMucfkZrX5LpW6soHQ7VWu9+ettqHNr6KIpJENLzCWBv+ZL+8aA/+I3G8U2IY/skACxsgiVajd4bjpw4LAoc78dUjas+jv3y/Xxg0krYKXW8sj1fQA3SFraephXpjyxzZtToF/0OYJvSvBFKHII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780206944; c=relaxed/simple;
	bh=XrExrogGyNY8zefzhUS+pWbzmqCVYgThgf2zASOamL8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MJNVY1xrvNNfgzZbqTpI1vxvs2r5SgzVwkRBI5VSM35w9hTu4PGYVuW4+zQeEN1jmp37Rmpa80RX+vuyZSDb2SdSBO9luIhfxzmOcyRiM43E5KJnlbOnH2gImPk9+WdjF6nbskPQIHN61PeT8/gpeuDblfMmAW4/N4KaVHUII94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z9335Ei2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g492gi1u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64V2CGnt695932
	for <linux-media@vger.kernel.org>; Sun, 31 May 2026 05:55:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EdKAn8ifT4fLcJXnkTbDem6y66hxcJsOU6t0kTzLNac=; b=Z9335Ei2cE9IT7R9
	B0ZWeVG8LC/oACCwxbnVG8y/sXZ/gVBXtRY6uGKvKytbQnQ5ug3C0P7cFndGKcqP
	qRvGEPAfKqfqn0B0oVEmDmHuPM4tGbr/MPNvHJXZZecJpPUIloTPqpbDna7860fS
	UUDRIb1Grt0YbJkM+oP+RpCOmm1JOEqHJKwnancsZvNe2UzAVPJhm969c3QGMdAO
	Hi7xlQke/qodnS9rjpNcWWR853coBFEd648QDvz02tjQrZ/Q23hGSHhvBZJ5Ybaf
	1InvIpFl5hZZ75pPUafHo1gE6kmsFwxwBA/siv7lz3if7lF3D5i4fgb6K9h1wuO8
	59GTeA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efr98asm7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 31 May 2026 05:55:42 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bf32fb7cb2so10635645ad.2
        for <linux-media@vger.kernel.org>; Sat, 30 May 2026 22:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780206941; x=1780811741; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EdKAn8ifT4fLcJXnkTbDem6y66hxcJsOU6t0kTzLNac=;
        b=g492gi1udpsyo/idnz5wAVzOUBoJkr9yrDpdzufOjg2OUHG4cWjse7wQe+DSBnPqQm
         P5kb6UbArLyuqQFaJykC6iKOh7O05wt86vXj0eY5snuj3FYOeGkFLyxQzsVEt7bVM0Bc
         iEAAHUtI4c2ME4ESCydXAmWpHx5/xwyZehpti23ZZp9FhJAwywnBYnYtFgZJcjwz8TwZ
         lpVh/uZqSV2Du04PDATrJ/u7gGXK8X1LbzggVAm8GTFNe9HV45qC6FQL8vS1V4qvOXFe
         owln1XxLh6XmrpPC/I8vvO1S6ZCuevvVqR5VG7oYUiOHQ1igODYRc9qL1wzlW+x2wdpW
         YqOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780206941; x=1780811741;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EdKAn8ifT4fLcJXnkTbDem6y66hxcJsOU6t0kTzLNac=;
        b=JzKgIVtg0EexeDhFawzwXkNqkcdH1sn4oYHTihJkVTgLoXimZTA2awa5tujamcKSpn
         hTymbGpjgs1gEmo4tjtG5YTxe1NoceKOJJsPoaxigjGD479hVOYJP8hczo7w1Gp82a/Z
         Pj88uc1xIcRSfwRs0mDp6KstxAIOoutxOdYp/nDDRIEylxjduL1B9FHYiEnWUpAcn3op
         W78VYDxC0dkkdYoCX9H8F2DjtOakIUZr7hs+Q6oJujQFPHBwgFdKvIOj0kTr0LCseY4w
         H3kNbGAYikWA66cTHg80MRo/DVq6tE+4ulqj1g0q6hB2yZP1R+mhtqO0IeapR5arGnqH
         sb5w==
X-Gm-Message-State: AOJu0Yw0v30azDfvMzMPrkkEYEJAvFXSfvxOtQO3umon2lZKlnoAFLZx
	wZpuvCXoW9OVXLGHzB+L2UjFbLo1IaYHLum7XnOOJxk/oQOulBNBXuOwK1/zrDVAfr8CFXoOpY2
	OIPm7hC8Yx779HKsnqZ6gPQ+cWWzydgiao3/CW28N+oqgYkZMwcRczIxHhamTp9aNFw==
X-Gm-Gg: Acq92OFJcRxOJm+FiIdmr3/eWc1OT0rXXcO+qDUQCa/2KEh0TySmSWmyr/omVOAh6XC
	EC+B0MvEEj5Tw5wIeT5qDHLrb5V7Whoh4IFWaeYeG3MpkABwCMgdtt6/+kxMMm58Ld1Agx+1wJN
	ZV1aaOaNst0GXvcweYVqdYnB9/0K9jFpjRdxsnhwf3fD+eJHOmMF+baZOPGZu7dBbJoZPYqdq5j
	7RRsLnAj3HKQ7PS9kdYgihBdCaMfZ5j01mDYaj6xfy4dTbyMxcaN2LpqjXJtgkFG90JHo3LrM2W
	pTEBzuHgJSTPaGSfOtqmMCollzGE1Htx1Wm8sVIMtS5ZhKZANBUiByppxR25udgQfLSMtTKgFtm
	gOxsBgkEt1Jo3x4TOtN+Dpe4IhItqHVWngKApdKQnsQsr6nfTNEnVYi8frFa3EVss5w==
X-Received: by 2002:a17:902:e887:b0:2c0:a746:7aff with SMTP id d9443c01a7336-2c0a7467f47mr54864255ad.24.1780206941175;
        Sat, 30 May 2026 22:55:41 -0700 (PDT)
X-Received: by 2002:a17:902:e887:b0:2c0:a746:7aff with SMTP id d9443c01a7336-2c0a7467f47mr54864035ad.24.1780206940705;
        Sat, 30 May 2026 22:55:40 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e702fsm67124375ad.4.2026.05.30.22.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 22:55:40 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sun, 31 May 2026 11:20:37 +0530
Subject: [PATCH v3 3/7] media: qcom: iris: Fix bitmask test in
 iris_allow_cmd()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260531-iris-code-improvement-v3-3-4c699c3dd719@oss.qualcomm.com>
References: <20260531-iris-code-improvement-v3-0-4c699c3dd719@oss.qualcomm.com>
In-Reply-To: <20260531-iris-code-improvement-v3-0-4c699c3dd719@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
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
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780206921; l=1251;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=iUPNcmr9LcDxjiMweUrnUvGUJcwSJce63MellJNuucw=;
 b=ezIbKToaQmXP9xrtCwyXd3cvyElME/u6McvNG0gJrzRBMRPzxp9VgdhzZ1lVOin6PB/Y4Q1uf
 KI5UOD0wO2NDhzuNfub60AKW9lZcLUwelb8Wff/DO4ktese6hNlqfQw
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=BaDoFLt2 c=1 sm=1 tr=0 ts=6a1bcd5e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=qiYeaxkneK40FgSAABkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 7NrukBW-W6Uj5_W-_9wZz680L-uyveiD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMxMDA2MiBTYWx0ZWRfXzpZ3ok6e2U+Z
 HiU430cynkRLX+8mdpErPOd02zAEOSYq0AzjLbRcRVMxjODQg/7F1ej/HlhxFCaQ38VcTJAyg0F
 kL1VX5Bds8/LuesCEomnhFxqQBYUxwzQFy7uHdW4DcVQdx3PriHFeqjvH16v67k5Lki1xmkZoLQ
 7gUKPOvaEF0TmfqQBmCld5mJZlN5wisvFc8R6oNyC2wa0Bji4gfFvDJWDkKDHhsy1mhCkScv1dM
 9r0yegGNSprDaS8eI7vxWfhnf32ovqxcCPdxES8pz2VI6/U6bZkJst14PMPpHP7XPJ75kDgKDoc
 Fjll42B8CNk7XoBF5rcVWuaxVN8U6PtDRJradGK41bCF6ZPbuOXWaDVHBwLqqz4Alu+Wb966ORl
 1uu0XLY8wzt6GA7f1kOXVRLppYtpNMExMtiuopQc3s0bhHq11Oh7ouAHZ1sbcujRbZK13Eqb/K4
 VBuXvTnxy80NFR0WN9w==
X-Proofpoint-ORIG-GUID: 7NrukBW-W6Uj5_W-_9wZz680L-uyveiD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-31_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605310062
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63160-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0FBAA6149F6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

iris_allow_cmd() incorrectly checks a sub‑state flag using a logical
equality comparison. Since sub_state is a bitmask, this allows STOP to
pass when IRIS_INST_SUB_DRAIN is set alongside other bits, violating the
intended drain semantics. Fix this by using a proper bitmask test.

Fixes: d09100763bed ("media: iris: add support for drain sequence")
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_state.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_state.c b/drivers/media/platform/qcom/iris/iris_state.c
index e991f34916ec..5552725c614e 100644
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


