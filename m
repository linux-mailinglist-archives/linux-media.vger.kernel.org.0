Return-Path: <linux-media+bounces-50831-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D2731D2D2EB
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 08:28:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2D840303DA80
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 07:27:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7C2A34E744;
	Fri, 16 Jan 2026 07:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mfJSSDoD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JCYlmoL9"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23400341079
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 07:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768548464; cv=none; b=RP4PS0LER5SwL5RzhoXHsw5+XkpyjbgOIRs18bCCJU8ErKDB+F/Ac5QIP22hPvQ2HE85ItymP5LFRHJdb3QCpPljL2dDdZcLv4c0h14IZWUvAGjaDKvWXR2j1v1NcCivSrs3oeOZE/De/3Ka6gYFcDRcXCgLTjzeRUTtAEMptMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768548464; c=relaxed/simple;
	bh=/pPr+dRIKfLnp8Q3woKxExVLtAqBn6gFla+MK36Boq4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iCw/L1rCjlmncMRDVoJBovdNtW7BABRm/QLpjpwffiRZj6p8y7/KGcZttTmZH05z7qjUC5HZaEIk52YdwBUkku8F3PjJHXgT7TybaIF09sx3S4Hh4DV1vVy6cISWY/smUBkYd4cjpk6jpawAvYbnG2V04h+wWcwts1efYfWtb3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mfJSSDoD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JCYlmoL9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FMbbUf3596353
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 07:27:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wgF62A0Vusbbe68co/vJ8MiSnUGF6/3kIJAgIkf9pl4=; b=mfJSSDoDKd+l0yyp
	nPbIotzAReyT4WSca4wXc2GjvafC4liDhf+VlJGNE1ZvWHiSH+oXxLPVNyYkVRix
	5T6/UZdyBbesDwEVfCanCcpXR3S3/zjlMreLMd4JVrSDo1Lxq9h4RzD5BSrhF64C
	16gNioOhE5B9G8+Slu1JidtG7zzhFttMbLihz4BKALZzSMbzL4l8Z4W4tpCcN/Cj
	YRGnaTdv6ODjgkKqteavI5z7qMjZB9T5U8HKlZlzIXExlsw90tJX3XJ6IDcaje6P
	tXKmgqQVvuZUA0IaZ8pd9w4DSq618aEQNbzZRjT9LA/qgovz4X4BFda+dfnKimCb
	mEs1Sw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq96rs795-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 07:27:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6a4c50fe5so379716285a.3
        for <linux-media@vger.kernel.org>; Thu, 15 Jan 2026 23:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768548461; x=1769153261; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wgF62A0Vusbbe68co/vJ8MiSnUGF6/3kIJAgIkf9pl4=;
        b=JCYlmoL9j+KHLQgO9+CxtLDYoNSS/ABJ49yE4ZHGpEQw2O5yK3LF76LPBnlea4fNvX
         kEBkq+F1Cap+RKsAOV1k/+uF8tCenRJhR2HvCLyt6Qdtn5vPVHwV+Xugb1HCZre83BoY
         BzFXzHXfO2M7R2aWxfW6zlKku8O3Mrc5uNJcUG7Lplvd3wUcnbMSuYgnkVdH/zeZ6B9N
         1TjnB7q1Mg2NSUJ1Eg4P8ChrLqdOyVzr8LtyFp5JzaMn618kwkbn6ZtpbducFVddikxL
         CRc1ZBHQhhPo2ipeYTu6kYHGAIgT/ARILKUBeMSF08Fv9/7NjzbP59mFl63SFIrYEHJD
         OXWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768548461; x=1769153261;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wgF62A0Vusbbe68co/vJ8MiSnUGF6/3kIJAgIkf9pl4=;
        b=GGsfcwzBbuiVgMBb7AZWFJgYidQAS2Ity1+jytFFwfZN+GGbF48FimIDJEisdDuytp
         R3A9ltSHkDok2YPRLXH53KR6VmigYu9Jo4d1mdyHIYIaMOAzNJXd6tVKyMGiCmAxYNLh
         GwZhfmxI0aPSa1zPaf0pc3hcNFGWSOe6dPKYe3IrvU7Vgow8WoleS6VnPSqJH/xYvnxJ
         XwwFTfzi6mc/K/OCEESnhYi1hDvBkn0/My9IEffK5U1XaP3y1omecn8aycgFoPFRKD8j
         WMdSU6uae/LUosQajdJQRLA0mklFfUT0QOM/tQPeYJ+2YXMYZlFQNfAI65uY/7X+IhT0
         enDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmBDfNuJjyvCQYnuco2fGIL4nE69uJ4oX9cImLJ9DpXr1oEnfpTHuz9Wxh6/uJ42XAPeBlsHSc2SFm4A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5BlB9fc05kZ6J1tubGd1fbrB3qCr3aXQLqbIY/fmo0e8D5w/L
	bgF2XzwANdCHSZmQyntNQEj0C1KeYiM/KtyXmtQF2pYTvYtDZYKsWPGQvOyjZ+iz9BhH46zYeLC
	Bxz2tw5qywkrwcIuA0uBnVaVJsVV/X/l/f2ZZ0g5URWJP6l+74YExcTAceSR/laNmGw==
X-Gm-Gg: AY/fxX6LjqwmI0PoNjI5Rp9UI571M1bfS1xgEPVgLRYy9fT2GRRHg82BdxC/v6scSIP
	AV0sxJBZB+SUxB0w7na6nRgLoFqAExbTkgKvCaBLyqlZ0RuO2I/fLn22lCYKYxsYh+MFMyU6tsg
	bfFdfJS7RTeYuCX4HP2fkmLO9I0KsgIAyrQ6BHQQs6TrH1b3y9fUMsJFtEa+nTW4SFlP+hH8cLw
	mLk0g9iBttUAEQ5YshMY2/mKlutdyRw/BD9wq+lLnOB0Vl6+VkLCduTtGWaOStNjGALt7AC69N9
	YRc46XDcxMLqnd7m8UUeBQuOjsAiaQUEUIcJZ9uevezHZIkkx+x9nDobsyk95hGNJjtdQpBo8Cn
	eaUJC9qdbyLrL///OhpqYZYMVCfwoVHZ7AXAVcLX+IEybjkC1hQj9jwWrzE3E1w3L5Tvmnfchuy
	/WPmg/29xFzi8Teo+ikhHv8Zs=
X-Received: by 2002:a05:620a:199e:b0:8b2:730f:134b with SMTP id af79cd13be357-8c6a6944de0mr277056885a.50.1768548461212;
        Thu, 15 Jan 2026 23:27:41 -0800 (PST)
X-Received: by 2002:a05:620a:199e:b0:8b2:730f:134b with SMTP id af79cd13be357-8c6a6944de0mr277054785a.50.1768548460795;
        Thu, 15 Jan 2026 23:27:40 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf3976dbsm516941e87.66.2026.01.15.23.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 23:27:40 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 09:27:35 +0200
Subject: [PATCH v3 1/9] soc: qcom: ubwc: add helper to get min_acc length
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-iris-ubwc-v3-1-662ac0e0761f@oss.qualcomm.com>
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
        linux-media@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1369;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/pPr+dRIKfLnp8Q3woKxExVLtAqBn6gFla+MK36Boq4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpaehpR1T3VBTIQkkyCWtBdhXU5YpA+KxUORAvI
 bellaztkwCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWnoaQAKCRCLPIo+Aiko
 1UwDCACat6lqDOs4O4mFhWUV0YM5NoK2p4O7go9R7f0ZP2lW1boDmpYL47eINtt7v81/t8RFexC
 4JyVdynfkAM43wuBa6wCrWHDm04nxJLr/RX92tSdynVM15uH4aghcMVvVPG4ZLY2labtWx/9Tvi
 om95wvBAbbvZf3vkD/+b6xrtcbefxRkV6qZBd0zUZpBMWwDSshmEfknkyOgxp5WMpAB6VF7muQo
 8LYHaCxcO/ME5Lr+6cQWMQjRHtmP6u9+tD4LYYm8hhN192xaRuwwzh/YZpUaDlXUQkWN+aWiHpB
 S49ef/WFOg5lgsl8P5TSbpTq3Ad4uehuOholTmwFweY7gMfF
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA1NyBTYWx0ZWRfXxvWhlkLswmO3
 zh+JZDHCepoE1kmBES7DK/w2ldZs9JCEjmXRK3MoBRWJBg3DvIB6wXCJxDXG1wxizF0Z40YmZLA
 sLMG2zrmrJ9F+HJGZRPbR3Wcfg9F5gedvLdFukAB1yRr4ffDDvke+VxhmHalVK1kFcDMh68Z4rp
 YhG9OakgfC3lwXdijZSgCHTPOvFhgkXZ4gCdn7BU/j9Q8d74ANSCwzTeKxJdTQZUGjz9ztS5euw
 iUy/pTZ1LteTxvkKImnpJkflYB/Rj/98qZfjaOulw/v4FgBLNqjjCpCrdIFP492C9vPXcTfqqOG
 2BH5yd5NomewwwnkkvHlEkRzpXCWJETJeeM3f/sDzQ9Xn1aC2E7etAEE4JWiGfd1j/nosUem2M5
 gYmitAcYUhqRNpbwzDUT6yXNkP1kI30wj1dAGK1aac8bgkhJTyQTauxITiPTV6DQDj5mMaIaQfG
 wR/+gdhpPlPTZML7ZyQ==
X-Proofpoint-ORIG-GUID: kTijTz9QOuxQsyAII0ifUuZTNTekM4F1
X-Proofpoint-GUID: kTijTz9QOuxQsyAII0ifUuZTNTekM4F1
X-Authority-Analysis: v=2.4 cv=TsTrRTXh c=1 sm=1 tr=0 ts=6969e86e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ZnE8w8QzOYjIZ_Lrp0IA:9
 a=4tUkUnfIpJ8A:10 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_02,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601160057

MDSS and GPU drivers use different approaches to get min_acc length.
Add helper function that can be used by all the drivers.

The helper reflects our current best guess, it blindly copies the
approach adopted by the MDSS drivers and it matches current values
selected by the GPU driver.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 include/linux/soc/qcom/ubwc.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index 0a4edfe3d96d..719b31c8fb3c 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -73,4 +73,14 @@ static inline bool qcom_ubwc_get_ubwc_mode(const struct qcom_ubwc_cfg_data *cfg)
 	return ret;
 }
 
+/*
+ * This is the best guess, based on the MDSS driver, which worked so far.
+ */
+static inline bool qcom_ubwc_min_acc_length_64b(const struct qcom_ubwc_cfg_data *cfg)
+{
+	return cfg->ubwc_enc_version == UBWC_1_0 &&
+		(cfg->ubwc_dec_version == UBWC_2_0 ||
+		 cfg->ubwc_dec_version == UBWC_3_0);
+}
+
 #endif /* __QCOM_UBWC_H__ */

-- 
2.47.3


