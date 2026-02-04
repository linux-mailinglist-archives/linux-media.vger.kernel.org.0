Return-Path: <linux-media+bounces-52157-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wObCCQibgmkzWwMAu9opvQ
	(envelope-from <linux-media+bounces-52157-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 02:04:08 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DFFE03F8
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 02:04:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DED6B31440EC
	for <lists+linux-media@lfdr.de>; Wed,  4 Feb 2026 01:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BD6227B34D;
	Wed,  4 Feb 2026 01:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="enkmmN9y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BOGEHVOH"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB39277CA5
	for <linux-media@vger.kernel.org>; Wed,  4 Feb 2026 01:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770166812; cv=none; b=S2I4R1hKa2cM8yFpvD1w1cqHoL5jq2qoITBvTeH/xARc95RZ8PWDn17MBft524/Wygmqcct0qP7pSbCox2SvKKobmn4FPN8LtvsBhtCTQeNV5qix5T3YR/T8R8GIrTV+ckLWtAaKA+s1XrFGv7vJxNRjlnW+ndnF+pjDF6MMuUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770166812; c=relaxed/simple;
	bh=8EnJ0bNvZO1OIHx736H60u2YBV791x2faUG9T+o3uLI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sLzoK6cwP4q73bSPWRrA7r2pe2DCfkD+ITcP1l3Y8pk2NBsFh7z0IXg9KMPXiAw26hbd3CdeBndu0V10y9KjjPqUUMnkEiILWB0v/KDA51o/XzRU3/4VRjAKAL9dpWTnAn5tc0lTP7klF5xUX7ntS8BeH+CmQmY8miHHFJBAZ5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=enkmmN9y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BOGEHVOH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613Im57J2055225
	for <linux-media@vger.kernel.org>; Wed, 4 Feb 2026 01:00:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tG//vnsGJ9u3ZjenYg9OjE6HUkUp7WbTGJkGw8lCw8U=; b=enkmmN9yzMVBKQcJ
	mLMVFnuw0/K+TnmzCeTFKIGHLT1YYes3sUna3qhzcFQuNGEOLLfYpPb0IzFxQVtu
	vOJCjy4JcH30HPhTGiD9nbXAQ64W66m3Hek2keNxuFmHlW0qh/XZV49qy3iri90M
	7OMh0fK1nIm4yIz6h7t8sNOtrigz05R6VL0ek9nHThPsfKIsum6IYjaTs9ZOzxtS
	oTiJznu1eiVpC46YkmDUBQEpLRXNwR2VqjQS+smUWZGFyQpKcNe2/yfElL6GNGHw
	y+4hzes1u6ln5gb28HFe1BWFrm0Ajoy1LA+Sdj1BaSCqkpk6nKNEkOmg9hTurIRW
	aWCsTw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3exkat18-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 04 Feb 2026 01:00:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8bb9f029f31so1993761885a.2
        for <linux-media@vger.kernel.org>; Tue, 03 Feb 2026 17:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770166810; x=1770771610; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tG//vnsGJ9u3ZjenYg9OjE6HUkUp7WbTGJkGw8lCw8U=;
        b=BOGEHVOHJSvd72caaY0FCpHnoOfpd8VxqndqqrJIW5HgKg61eE1pVvq3IDRu1QCmG8
         fC51ef3+KVyKOoeGKmt8IwYzFRU9sTSKCtFg1lp7vVdMCbzBuNTul1WlK75KUlJoMrdf
         hLsnoq8fnf2BNIJYWpKVQJM06txpkphuchs/ROCiJ+xFYuQF3A1nJPYryV56eOCV5HD2
         yCi1x7F9MZn1xGs6dGAGbCpZtG1yg5MkejqqISSgbxrZFbmCERqbrMhkWEQMdOP/LD3j
         1Tdi5Vaji4uxvWAHSkBpf+dYEMtjhCbNdfw6uofSwldJaKoKVoOnEHXZTalbJd5G558V
         AJyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770166810; x=1770771610;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tG//vnsGJ9u3ZjenYg9OjE6HUkUp7WbTGJkGw8lCw8U=;
        b=Zo5xt5xNc4GB0WTAHpUwPxrOmTqKMkkxgBLQvLWaIw9/QVOcDqlG5OUKhdwRWAD1z1
         T8QCGLOb6UUtUST75k4qKVNocGJqKvOX0c5ShTE+Q3nvgvOJhdFWAJeCRTYdPTVhqbER
         l2dHozYAJDa5iqFXWREIDs2Hq+bqvLZkCMr9Lk6eUQMIjCdxdINBVo7Lm1suxbYhNHbl
         hjOJaXmf8ZksgzarEjw7arw1Tj+xqh23lmU8br2fPZFQPdh1+IFbdYcS1BNgV08WIQn+
         8rRgrQ1ymFj81LyC0XVYFPuogt24cGebEoH5jKNXvey/lEzzUyQRXwKn9zgYj/e0UNJ/
         vapw==
X-Forwarded-Encrypted: i=1; AJvYcCVgEzQnlZPpyDfhkLSWOxPbtynx3mtagqFXxcAMLyzH4+T5KQqnUWKkJ/ECuK+cNoBM0F8BCCambUigyQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHVrsOZd8rHIZZYbSBkF5ToRN8oLG8oaIYPSgIbOt54aiHwDqP
	Onpw47njaoeS+VM4CB+6llDogmgKL3+iyjPPizcFZZcJEkpAtT3C3nh5Bj+qjP6OCFkMEBME1Qs
	HqgSth8hzRbzRF0qvbjl+mXf21tqMBnPBaQqrfF9SUJBf6Ucoa5jmdqfkmvSA49on/w==
X-Gm-Gg: AZuq6aJl9FhZ0NX7btEKwY5bvdnyUJDn3hliyPWj7DRYXx8tQmvJjonQEG+5aDANFmG
	QdPhtBkHHvUCUeJ9QrTJ4Pd5HpOKOlax0Kg4M/jCD/2uPY9HU5cNZT55bpT4fjdYySWcVtreRgz
	BjDqCcbx//B/VmfXu05G3npN55gtXNoZMfJfKS37HKxGYjDXrPBnuxpy7B5cFf67fMc2Qv7Vc19
	1aP+1Xwy0Myvbe3alNaM8RrovFNfLdXtPiGx9WBIgI/GYBghUErFXVLah32Pgfv/0ykwmJvNVUE
	fd5GDlBb3ugQ+7t6lUiueGUBWyGue8YHvgxXhAUxXpahook+c9S2fWAvcn6CfrRmBCfddZNrtd6
	OCqtiFTjuc8nfS5s/YOHA00M9Eu7uzzUhg9IzJlpVQT7RHGnqqG01HvX3zwPxJXp6g9iD3mzqQa
	2pfaJ2lsBSHzOfuNoB5HZDDvY=
X-Received: by 2002:a05:620a:410e:b0:85c:bb2:ad8c with SMTP id af79cd13be357-8ca2f9fdc94mr179573185a.74.1770166809616;
        Tue, 03 Feb 2026 17:00:09 -0800 (PST)
X-Received: by 2002:a05:620a:410e:b0:85c:bb2:ad8c with SMTP id af79cd13be357-8ca2f9fdc94mr179567785a.74.1770166809158;
        Tue, 03 Feb 2026 17:00:09 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e386ff563sm253405e87.1.2026.02.03.17.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 17:00:07 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 04 Feb 2026 02:59:55 +0200
Subject: [PATCH v3 7/7] arm64: dts: qcom: sm8250: correct frequencies in
 the Iris OPP table
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260204-iris-venus-fix-sm8250-v3-7-70fa68e57f96@oss.qualcomm.com>
References: <20260204-iris-venus-fix-sm8250-v3-0-70fa68e57f96@oss.qualcomm.com>
In-Reply-To: <20260204-iris-venus-fix-sm8250-v3-0-70fa68e57f96@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1877;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=8EnJ0bNvZO1OIHx736H60u2YBV791x2faUG9T+o3uLI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpgpoId6bfGK1Psp59FHAP6PnmwWqSLQ5SEt2yW
 htFcc2Tq3qJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaYKaCAAKCRCLPIo+Aiko
 1UiFB/oDaRdvUDPZg7ko9e7OmOCi9UUKpwmTqmzOHuDa9KsWA9FLEAG2i+LEcWcScskUQK/s+EP
 uXAIir63bGwy12lDiOKzmR+0pjnHYpgskeQJE9hYETEdL3fRrw6D0ro+6+xbb186qN6vgGBmG+0
 YirYOery37T1PxL9WRFQZji3HWdqRd6vnm5t/j8i1ZF0BihhB1+dMIc32KStJJqil/XRU0qiY+z
 im1cYmuqsNE1D7lbvij11sVYjOlq6Ck+de2nDLU9RxQaoQUJfBizsCwYDpgJs8b1t1/pM0UpiP/
 uewEL+rxzzlI2GvwDXqX3fS2HfErPehku3QINcEqRIMN2AAW
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDAwNCBTYWx0ZWRfX3YzH8T9WVC1v
 jLSnxeUH7biM8iDpJTVDSmFMcvGj6J0V0MP/5jGwoGnvHP3YnhPMDxJkEQjIEMofIfTkIkyVmqc
 7DecrW9e4GZx+NfL6vqiOcDQ3x7ERKsaJielGq9PJHisCCNKkV+rnwWtlsCpIsTtesT89gXlSHP
 O5l/qNtVA5u2o/f/KGAnN9mqWOdeb6sAQs8GWl1yeRFaqmzfbZu3hp9yRA8jsUV2KvGM8Dzvp9u
 t+gmn3WpVXcazmtjLhWKo4lkfdEMfr90eCrfaS3FmTk255YZrHftnqLGq0+ZDY455t2MlAW7S3L
 /Kv1psRK9dFmTtD1cBd/6t1h0gyL0EHdVZ85yJ+Rb1gUTxOm6YKjwpHK+goOXfG6fuL2G+buHCh
 VnBESw0UsAP8S1pUbNHiS6A/YsxvOIe82NpsleoiMPXLUBOSKAW4zRyYYlyQTwBGiDa7v7mGBzl
 TjbVO+RdZva+QN/hvGw==
X-Authority-Analysis: v=2.4 cv=XfOEDY55 c=1 sm=1 tr=0 ts=69829a1a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=EQKuo8RqpatckOKiKW0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: oG820FspxaDp988cwWLY7uuVxdzifTWX
X-Proofpoint-GUID: oG820FspxaDp988cwWLY7uuVxdzifTWX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_07,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602040004
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52157-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,aa00000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,dt,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D9DFFE03F8
X-Rspamd-Action: no action

The OPP table for the Iris core is wrong, it copies the VDD table from
the downstream kernel, but that table is written for the
video_cc_mvs0_clk_src, while the upstream uses video_cc_mvs0_clk for OPP
rate setting (which is clk_src divided by 3). Specify correct
frequencies in the OPP table.

Fixes: fa245b3f06cd ("arm64: dts: qcom: sm8250: Add venus DT node")
Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index d8be5c1add1b..7d11f1a28546 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4350,26 +4350,26 @@ venus: video-codec@aa00000 {
 			venus_opp_table: opp-table {
 				compatible = "operating-points-v2";
 
-				opp-720000000 {
-					opp-hz = /bits/ 64 <720000000>;
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000>;
 					required-opps = <&rpmhpd_opp_svs>,
 							<&rpmhpd_opp_low_svs>;
 				};
 
-				opp-1014000000 {
-					opp-hz = /bits/ 64 <1014000000>;
+				opp-338000000 {
+					opp-hz = /bits/ 64 <338000000>;
 					required-opps = <&rpmhpd_opp_svs>,
 							<&rpmhpd_opp_svs>;
 				};
 
-				opp-1098000000 {
-					opp-hz = /bits/ 64 <1098000000>;
+				opp-366000000 {
+					opp-hz = /bits/ 64 <366000000>;
 					required-opps = <&rpmhpd_opp_svs_l1>,
 							<&rpmhpd_opp_svs_l1>;
 				};
 
-				opp-1332000000 {
-					opp-hz = /bits/ 64 <1332000000>;
+				opp-444000000 {
+					opp-hz = /bits/ 64 <444000000>;
 					required-opps = <&rpmhpd_opp_svs_l1>,
 							<&rpmhpd_opp_nom>;
 				};

-- 
2.47.3


