Return-Path: <linux-media+bounces-50832-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A94D2D2FE
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 08:28:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D8980305A8C7
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 07:28:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9A9234FF7A;
	Fri, 16 Jan 2026 07:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EuPrK0fT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VIZsq2b5"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E427634E764
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 07:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768548466; cv=none; b=bB4p+iBB7KaQ9d0ti+IUZGT1UKflMpI4AHHto3HUc+pVvtu3dFWOCirJLdnm80Ov8nNF2Edzpg6mbBfZ/yIJjXGumR04NrSquSWHrMbcVLdzYYAdXapLewIVj8tn0wke+uEwY2FRZ79ZJHtaMHf7kJhptj5KHL1QU4JuZ5YkheM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768548466; c=relaxed/simple;
	bh=f6HtLiKKb/4Affz7e1VJ8PeslNVW6kXZOqanD2Gu5FE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XaReG671yVvgQB5tQJv7Att7zXvVWbOYDBeWvhPCI8SMmM8vOr267Flwg5yumze5ZXZ2ptYO+IBsZJbve2iVbpsPUq/w7tdQmTPC981Hq+qyJXWOz1YhJzvFs/XuqrmVV1oJBGmGevSLDV1YNoY3dmGrRl2BJbJco9jnU9E/eR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EuPrK0fT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VIZsq2b5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FMboLD3597147
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 07:27:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YrXH4igIIlXWUhPhZRbTg6nwFhrMEZhR8CFgP8J7Ma8=; b=EuPrK0fT/9XHNzF+
	ZB8VSizQXr5hyryxGJO8uyWVCTZoKvP7tlY7cP8lplXOAqmOl4dpWVI5SzMz7MSx
	Bd3bYrnp/ezRalPooys/OHD1bH5VxZBTJbzGP6V1kvIDh2WWO8y3ogjAARIu4ECg
	owGi41e1wcWW3SoK17Ngn06+G9mTqgQOIS7+/qlzti9QxAdYhN+MDMbxf94tGeqi
	fd3OsxNi3ZLX9GbipC3sBRPssG/sutsg3f2LMuS7C/zqrVL5renb48JL4JR3g5bv
	KVLUaKZiCJor8NDuS8BrX3pAjaX7wViBtw3MxmKPypTCbCWt0j0fY5690VbDc4xp
	0FTe1Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq96rs79c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 07:27:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b22ab98226so798096085a.2
        for <linux-media@vger.kernel.org>; Thu, 15 Jan 2026 23:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768548462; x=1769153262; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YrXH4igIIlXWUhPhZRbTg6nwFhrMEZhR8CFgP8J7Ma8=;
        b=VIZsq2b58+AJXFWxocUQpj89aOxc1lPyw+CGPTkGtIXLQI9Wo4hTAhvQrLZQ+iN01U
         pGqk7ZiX5dGk9CP3tne1WqXzTQ5kFd8U8RY+30zYZkTsOvp0QqVZcxgowYZukO9qvlSW
         ZZ/vi4yAFxbJxrM3J1YvLO8aMu/ZOCjHVC5K5v3mXapGzy2tvLKQOkfIf5rcShu/mjeI
         xCA6ix2X0rY2d1oFS7giU7E6fnkYRC+gKnGctvyLIa5qAW5x7kIiOFYKmlonswgFLNj7
         FOwAeYuoLrlSGbqsoPZQXCMQgQe8lXcrnyRSaspZhbfzXcecGOo4LEjuXZxGv/ql6Wc0
         LzHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768548462; x=1769153262;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YrXH4igIIlXWUhPhZRbTg6nwFhrMEZhR8CFgP8J7Ma8=;
        b=RTKUGThwYFuGp2VYvF8MAr/wBZi52rEhWiGSnaHC6pRYDsu1xasqxkoQ5SIlVLQxDa
         z9u9b2ZcnCrLjzvidVjMeNrMXpoSzNpulgDpTWwOgT/GZINe7jBQOqVvz0M4Rl2yxucp
         FT5SSk1euFLwEE5ePyE4Hq5vHe/buXRNpRF3WCiFA8/uQdvgMRBz3i0oaJ8p3/Y1xJHP
         nikhpvMdErXIQlSB6O3GsjhP6sVYFDr6GUdnSvuVARhMaD7UqhVxQ2WQuEtYO/o7JD1C
         lku2AivWQQ10FnrktSimVfHJ/abXnbmFGFhY+K0TJdZmMfphOakq7xbVSRUSvZrJITUp
         JG8w==
X-Forwarded-Encrypted: i=1; AJvYcCUnQfNh6J0mciVuQ+d0+0VNqs8Qs8nmhZSyDtXWcmlQB8pXb2PRSkvhMB3xLW0nY8xUoaik/zoxSFsRXg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyste/S030zG1Hwl6y+XpyFtJkDWyZCNa3TkFyCw8fw+TDh8NKZ
	+8HaKp5iFPd1mc7jQosy1MufZXGBqNf8fb3a2yGnTKNODe3+GYkxDjclA7tRSw21qYmvF0Kgmcb
	IUhNLpfkdbJaYZvuoE1DUN2Nh/Y06ADmNV2PV8D5wrnLp6AnQj+NfkEPGCzYaNzYRvHeWKpXl/A
	==
X-Gm-Gg: AY/fxX7UBJVIBPoV2tHZo0rPNrPgSruor7pMIt8EkUFPXyNJFqpOSFG6ob1bj1bDaEN
	/3SrQxTEe5Q1Nxtmq8UYJYqYMfDJ6/JFA9qZvzAFpD4FM8/5iGVAh56ve8PFlwt/koB1eA8JyA6
	WgK7dgrMl2Q3gRw7PPfkfdCRhz95HgLArpEFAECFSdWcNYNAqZRHSruk8mUaPJtcWHHWeEkBlNr
	m5zjp2EqZVOFIKhWXCBH3kvW1Yfaf3Kx7HaBBPxIagREapophqHul1K46N2HDu6KWZ04WpUs+oK
	oo2xMKzsfgmd3YRE1gw3X0ogBKfqO/jEV9RFcHXLgCccsBr3QbhjtH5EAxnvKaabyhgcTY+mWEL
	aJgiiJMmG6Too+oxa9xVatbIs2OsTd6OQlItQWMRS8R3nmbLwYVfbXkUz9GRf7GAitzwHPT4H3s
	OwjaSIc26qXEFJ5dIeQIm6AU8=
X-Received: by 2002:a05:620a:1987:b0:8c5:2e15:ee7e with SMTP id af79cd13be357-8c6a68edf15mr273147685a.1.1768548462256;
        Thu, 15 Jan 2026 23:27:42 -0800 (PST)
X-Received: by 2002:a05:620a:1987:b0:8c5:2e15:ee7e with SMTP id af79cd13be357-8c6a68edf15mr273145485a.1.1768548461871;
        Thu, 15 Jan 2026 23:27:41 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf3976dbsm516941e87.66.2026.01.15.23.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 23:27:41 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 09:27:36 +0200
Subject: [PATCH v3 2/9] soc: qcom: ubwc: add helpers to get programmable
 values
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-iris-ubwc-v3-2-662ac0e0761f@oss.qualcomm.com>
References: <20260116-iris-ubwc-v3-0-662ac0e0761f@oss.qualcomm.com>
In-Reply-To: <20260116-iris-ubwc-v3-0-662ac0e0761f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1726;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=f6HtLiKKb/4Affz7e1VJ8PeslNVW6kXZOqanD2Gu5FE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpaehpqr0DI/T4fzPhXcMLUQDO1d03tFKGRdCkS
 CTh5W4hgYGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWnoaQAKCRCLPIo+Aiko
 1SIbCACz74dN96rhxETe3r7bYueM72qOgA2EXJfBPvIDyxk9w/kz7CFKGKgzJiMHrNNJ5j2bsgT
 O8AHYHbc7KH/5PKFNCRmoX+E3CkiQJKta1DRQNJEfrD3FI4ESwJZwSXSR6qsvcbgNmB0ytyfMVW
 cThizBKwzZPMiOgNlX+l4y9uUD6yPGVFm2RsGY7GE0ArYDEfx+RiiLeE0U0zjWllSNB5vPhjFS1
 ItIszToX5EZvXjn1TEOAiehcNiSOH042HlYLowcJwoeZM3CrN1BKOy1Jh6qh9YEBWMjYO1xh+2f
 GGj3pOXAceV2/nrJHHnCnmI+NmLhM0u5f+ET67YQFmaFT6Tu
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA1NyBTYWx0ZWRfX2LvZWQ6ClIeB
 tJsYrCjDJ9NXiH46a7rXTJ3KMZJjqYgpVZywFvRv3DlSiKEPxp91XEFbunFIFIzq/yJB3wht1QX
 eZYDCCyIdm2Nh5M4fBQcU/6R+OF854Mmf5x9Q96MXesUDjyVZgyfAlseioZVl1MXcF5zgtcaZcS
 1uRCqSs4P7mNwJGiuRS98O2yTS/JMlmJp3CF38lVDpMWc9m/PMpKtPgGQHQ9rQOYxIpcr12l8V/
 scBTDRZalaX6Xttbj2HVLjMciwMzGm5tIaanEPaSni0hLRe7fmWB/7LtkGX38KIQdGe2qWnghc6
 XGHMap1uJS2/3Y4uTmj3gE22sZTuOsmqABJtI0Lg6h/ypH7KkX+TLY1H/rDvqKRy1vKMTY9bkvb
 +QcXX2SodnNqnPEXw7fkkh+vFQro12/inZ68VfW4hpoh/mCSceUV/rxLIYzGyLt90KSOdk+3Lwn
 QlZN6kKp51dyBz0qlow==
X-Proofpoint-ORIG-GUID: _Ru01yz0g69hVc_cjxZ6MdF9OZoYjl83
X-Proofpoint-GUID: _Ru01yz0g69hVc_cjxZ6MdF9OZoYjl83
X-Authority-Analysis: v=2.4 cv=TsTrRTXh c=1 sm=1 tr=0 ts=6969e870 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=0nnIczzv09DC-zKiMkwA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_02,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601160057

Currently the database stores macrotile_mode in the data. However it
can be derived from the rest of the data: it should be used for UBWC
encoding >= 3.0 except for several corner cases (SM8150 and SC8180X).

The ubwc_bank_spread field seems to be based on the impreside data we
had for the MDSS and DPU programming. In some cases UBWC engine inside
the display controller doesn't need to program it, although bank spread
is to be enabled.

Bank swizzle is also currently stored as is, but it is almost standard
(banks 1-3 for UBWC 1.0 and 2-3 for other versions), the only exception
being Lemans (it uses only bank 3).

Add helpers returning values from the config for now. They will be
rewritten later, in a separate series, but having the helper now
simplifies refacroring the code later.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 include/linux/soc/qcom/ubwc.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index 719b31c8fb3c..4801f288af81 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -83,4 +83,19 @@ static inline bool qcom_ubwc_min_acc_length_64b(const struct qcom_ubwc_cfg_data
 		 cfg->ubwc_dec_version == UBWC_3_0);
 }
 
+static inline bool qcom_ubwc_macrotile_mode(const struct qcom_ubwc_cfg_data *cfg)
+{
+	return cfg->macrotile_mode;
+}
+
+static inline bool qcom_ubwc_bank_spread(const struct qcom_ubwc_cfg_data *cfg)
+{
+	return cfg->ubwc_bank_spread;
+}
+
+static inline u32 qcom_ubwc_swizzle(const struct qcom_ubwc_cfg_data *cfg)
+{
+	return cfg->ubwc_swizzle;
+}
+
 #endif /* __QCOM_UBWC_H__ */

-- 
2.47.3


