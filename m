Return-Path: <linux-media+bounces-51902-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +GpsCA0+fmk6WgIAu9opvQ
	(envelope-from <linux-media+bounces-51902-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 31 Jan 2026 18:38:21 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D33C3552
	for <lists+linux-media@lfdr.de>; Sat, 31 Jan 2026 18:38:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F31F6307470C
	for <lists+linux-media@lfdr.de>; Sat, 31 Jan 2026 17:34:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37B8E35B63E;
	Sat, 31 Jan 2026 17:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dqgzLnhO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VEfzt2Jv"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5893F361DB7
	for <linux-media@vger.kernel.org>; Sat, 31 Jan 2026 17:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769880847; cv=none; b=ejTkqtzGTwx0jo+w71QhuIJmg+7X/NjQx/zlZ/3OxR7yfOzQ5HsYwPNbg4+4sn7EPNBXJn2pl67gkM8JJc+VYS7ujQchiP4BWQIi5tACxLLj986HZCxrHTwUhAGaqdeRlGisbvgZBek9Xabu8PKs6z13OgUD0AMuoalwOK4p+8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769880847; c=relaxed/simple;
	bh=rOtATlSUdBEg1H0iWW1mR8swNg1N1WiPDt1QTwWw37Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Atab81DwNaOhPPugMrDCat3j18R4ppTFGxIu+UPvVto76jFj1Bm/GjMxLjCBz3tfFRBUzb+IUJ5j0S76pXkhOBE5U/e2bajJmLd6bNXpM9w5p+vwsHlO5Zh1OwBNElvsxAz5T12WX422b+gxjqt79CsMXr8fB5bsRPl42MsN0JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dqgzLnhO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VEfzt2Jv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60VAsD1u536315
	for <linux-media@vger.kernel.org>; Sat, 31 Jan 2026 17:34:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FAPtvj1aaT/4nS3PbQJ8vu2dWXMqUi3SGtAzQD4qK7c=; b=dqgzLnhOtDSbKs6A
	ldiFNFA+pqrgKaArFwhD2TgeolgjchihkbzpN75u835H9tx/gxDT0EdLxF20QGgE
	AlSHju9n7WNJ+zpMiFvhzvtQkOwJIiQJUjwzgtFptUNkW1Lf75Xx2FxzHF+VqS9G
	e1MAQCwtBNMS33w8hJJjIxgRM+0muhsd3GYB2xYlCr3Ej0bY7it8Repoii/i+u0i
	f6zlY8woYZ+ubjht3c9XeMBZn18kZYToS39v8/ph8kVT+9VfDzqu16NIoivWfZP2
	Mvsbs34yf7ujnK/DZTQhEPrUIoq7wFRN2wJ3xm7ll1r7iNrMdzzZwV6FoX6LWuy6
	XCV4Vw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1are9774-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 31 Jan 2026 17:34:03 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5ec87b2b4ddso2944711137.3
        for <linux-media@vger.kernel.org>; Sat, 31 Jan 2026 09:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769880843; x=1770485643; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FAPtvj1aaT/4nS3PbQJ8vu2dWXMqUi3SGtAzQD4qK7c=;
        b=VEfzt2JvbYm9/mjGaRNOWFT34pfLX7iQc/wlbmD+TR+hTl4ntWo9iilcT0v8eMMNZz
         3A/DbNd1RpGFJ5lHwrfaF1dl+jlm6HqB8JN/WC650QTYMhXP+FGROTuAdxd7G1u8zkpz
         SSJoo2WkPM6jzh4hIY2B4Yq1HIImm2S39Lg086u3JfUAv4IeESMsdseZh7rcC7DCB7HS
         8KD5BIHZg5F74VaUQK3mhFg0d/KDErr5niztt9RQgdJsyLXETGFpNb9KdGK4cck3GeC8
         F3a5RVUVvKSM5zSsyM02DYZWIV43OilMnvEkmXW6XySaj94HqailYTBzqXP05FuzzFso
         L/Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769880843; x=1770485643;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FAPtvj1aaT/4nS3PbQJ8vu2dWXMqUi3SGtAzQD4qK7c=;
        b=iI/eohaRLHNYK+kQQO3Kw7PpCRn0AWZCc4flyVGA3OoZLXmJ6EioNDDDY+VX4dzIUf
         pv6OpJRCHjB52EPs2J89+phntEwOrcGGh2ZeF/MvRm8eUluKAXOBMZ80gc8rtSMUC04/
         7dTczgrr1f5n4EvHCB65TwSoTPnAR+jvTgS+JBCpenGo1j1X1qhLz+77wGZn10DhRpbf
         D5gheeeDQ86TGC2pfjf31cG1iPZzpHESwKvwp9g4fhRXGfdfSpKrY8yAv/EBTEOFN+yz
         U2cjjr0OowoScu1B7gu/7r77p0Zj53xOVRPpBZeS2nAuYW0D9actXfsuyntdQw28UALz
         oaKw==
X-Forwarded-Encrypted: i=1; AJvYcCVtJDn54HIqFVxFf4Bc67H99jgcq8nHlrQ0J/LSixogCnYlz9ekHxYh/hIBR9OCr7p5JBTscEFsVcRTXA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwL8fLlmit9XLCcrRUGkeepndDCgQtvnOqm0SayEVgGIMoIAO2o
	2VNnGT+o0kZzx8zzsFAe7E6dNj181T0jUFs65yl9gK/R+8s1HD/8XKjlx93AV8Sv04j86L0R8wj
	p6jOZWSdPpqa/MjcaMDEZBTA/cAGRmTdsWuLOAEF3COX3jEfcORxWM63Q0EKTJyhdog==
X-Gm-Gg: AZuq6aLUfP+v107QR0Lp7kG5hNtNBkjgheEHjVXaar9+EEeFcnbosmgO6D7jANu5h4S
	+hqpMNCrL4qkshwawSyvxVw+ONNjqzuUIrULIR2uepcovAOLOAjolIwTuO4c91eMZdJt7cRMCLJ
	oq2QIdHBJW2NRKsW0UCgfKTH964lBMrP4qqm1Soj1iqqfirhKMu4VXYJejuwbQ2fzyJw8IE5WWq
	k8xp6fh4oddKSOVfWoiAvaRDBOGuRGvCPx0hedBeGYeHN8aMD4kUvlZpx9seHGGMrMNz1816cgL
	YYyBhp4TWOSkUKDX2PoPFznMMo03hNTr5TqEKa47BGa1Ht+NfRPFbKeZKspQKgeTEZINRI93POb
	xFKl/+DPHTsBPCAwTO5nX686IZpsnwt2RUG4uBAcug28ALs5L63RtcUG83z3Ii5UHyqywn2uAz8
	XmWWg2Jq9EEJ0X0X4KJ/48QyU=
X-Received: by 2002:a05:6102:6112:20b0:5f8:e3a5:40ac with SMTP id ada2fe7eead31-5f8e3a54830mr1242346137.17.1769880843072;
        Sat, 31 Jan 2026 09:34:03 -0800 (PST)
X-Received: by 2002:a05:6102:6112:20b0:5f8:e3a5:40ac with SMTP id ada2fe7eead31-5f8e3a54830mr1242331137.17.1769880842680;
        Sat, 31 Jan 2026 09:34:02 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074886f0sm2443236e87.24.2026.01.31.09.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 09:34:02 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 31 Jan 2026 19:33:50 +0200
Subject: [PATCH 8/8] arm64: dts: qcom: sm8250: correct frequencies in the
 Iris OPP table
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260131-iris-venus-fix-sm8250-v1-8-b635ee66284c@oss.qualcomm.com>
References: <20260131-iris-venus-fix-sm8250-v1-0-b635ee66284c@oss.qualcomm.com>
In-Reply-To: <20260131-iris-venus-fix-sm8250-v1-0-b635ee66284c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1819;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=rOtATlSUdBEg1H0iWW1mR8swNg1N1WiPDt1QTwWw37Y=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpfjz/pOjKg0Y6ylBWtl+rxPfBZQiUdYI2FzDZa
 PpVj/eR7n6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaX48/wAKCRCLPIo+Aiko
 1ZQmB/41FwhU1i3cnQtLfyRxR1Z7I99s+iXEpuOF3Ey7f5BfAbY3gvCyhQ673lqUg50M4Pb5IgZ
 M/HMSspV+CzAeBzhm7XZzmJKk2lQsi0jui78NC1E9u54sGmlm/iJ+t3FzftAr11huEBbCuJXOnq
 Hrm9YlaUgM5lHv4q8CBbTkmjilbJmz0qVk3rPky0qZubzPtgWK/yy/ZN3O7ACjEDcY8eZBtzNzX
 2p5i6MwzHOO7MK1cpsPr4+LWxZPcQqNMaXfIFINGSZm8Cp0IwkoXdrHYEMQGoQUC3ziigVNk283
 dE8I7JXfrTNKB0gDcf/79WG3OgFVI0uofDRehgGFRNnLT7cJ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=NNfYOk6g c=1 sm=1 tr=0 ts=697e3d0b cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=jxPhmlQz5o5YGUuCidoA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: faGR0iulwCzQQUZzPGqMKfWVPoFAKmfR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMxMDE0NyBTYWx0ZWRfX+NsiyeztFpgA
 Y2ClKRrLEQLNYZCFnV7KTzdKOT5P+oS0S1rbKytVHTvCO2d8jQeeVVrqVFr2avVCWxvPyR4U0ZN
 3mT85JZCzWvbFtqHwT3L+mSQV8HTX/Em0AItuGJr82DEoxoO++ksQurtm+yzUaJkpbmufGT+nHU
 80LBHqC286rrI8gYvQ7fApa4KYoD8KTnqZHBWYkfSa+w8neEdMWgeOSYX9Swa/5BRonRBh7iFuH
 OuQGZFwyYveA933tT3hkM3mfBVFBn/2hiCGTCa4iBDqm6MeXM49EOAJNY//1BLUEeiQAfUJL8lJ
 vzzVK4tGh1dZZeGLo0SCwce39NINjQ1ttZmhsg9LwE9/Rc5rCddEvHljzKd21Is4oO6rJ1SAJgy
 FqsQ5CE7PaSE+7kvLE+Luef9cDVvSClXFHDp5eycaERpVFmvxA/yGssFEJCH67tcuUzHHnwclmY
 s/At0eQ5F2Aku6anDvw==
X-Proofpoint-ORIG-GUID: faGR0iulwCzQQUZzPGqMKfWVPoFAKmfR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-31_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601310147
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
	TAGGED_FROM(0.00)[bounces-51902-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,aa00000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C5D33C3552
X-Rspamd-Action: no action

The OPP table for the Iris core is wrong, it copies the VDD table from
the downstream kernel, but that table is written for the
video_cc_mvs0_clk_src, while the upstream uses video_cc_mvs0_clk for OPP
rate setting (which is clk_src divided by 3). Specify correct
frequencies in the OPP table.

Fixes: fa245b3f06cd ("arm64: dts: qcom: sm8250: Add venus DT node")
Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 531470506809..21a186e199a5 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4350,26 +4350,26 @@ venus: video-codec@aa00000 {
 			venus_opp_table: opp-table {
 				compatible = "operating-points-v2";
 
-				opp-720000000 {
-					opp-hz = /bits/ 64 <720000000>;
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000>;
 					required-opps = <&rpmhpd_opp_low_svs>,
 							<&rpmhpd_opp_low_svs>;
 				};
 
-				opp-1014000000 {
-					opp-hz = /bits/ 64 <1014000000>;
+				opp-338000000 {
+					opp-hz = /bits/ 64 <338000000>;
 					required-opps = <&rpmhpd_opp_low_svs>,
 							<&rpmhpd_opp_svs>;
 				};
 
-				opp-1098000000 {
-					opp-hz = /bits/ 64 <1098000000>;
+				opp-366000000 {
+					opp-hz = /bits/ 64 <366000000>;
 					required-opps = <&rpmhpd_opp_svs>,
 							<&rpmhpd_opp_svs_l1>;
 				};
 
-				opp-1332000000 {
-					opp-hz = /bits/ 64 <1332000000>;
+				opp-444000000 {
+					opp-hz = /bits/ 64 <444000000>;
 					required-opps = <&rpmhpd_opp_svs>,
 							<&rpmhpd_opp_nom>;
 				};

-- 
2.47.3


