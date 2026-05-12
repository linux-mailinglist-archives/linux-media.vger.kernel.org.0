Return-Path: <linux-media+bounces-61263-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCO3KWMsA2oR1QEAu9opvQ
	(envelope-from <linux-media+bounces-61263-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 15:34:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 34637521485
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 15:34:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4E42F34CB51B
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 13:18:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EAB03AA9C6;
	Tue, 12 May 2026 13:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pxuarqHa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bbYm7Pns"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D05D3A985C
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 13:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778591702; cv=none; b=SAhofS4ru8QSjXkk1NuJP12j3qA6mVNwnwM0l3Kh+u+0wUsOBhzjKULwTzw4ifihmAw+DS01zGn26gTjGWWQct1RozF35RElRU3xcvXTfzLcw4C08RB4jUdqP+F9lmF+QCHdY+o9MJhY/Y965wBNWbf+2kW7W0wtJ9sXLFD2nYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778591702; c=relaxed/simple;
	bh=wXEQdSaGgvvhyTZjCrPo1di1ubN2oQfPidI6Nv5ympY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PA3F+ou8LITwgzynzCvSKnZBgqsbAD4lyNp999I4aaMIT2J9zlwX7ZV4GTRlp8vE3xPKmd2VysRKsvIzXBEqujFFmH+R/xYOHHldSHoLoXAoZ7KcGAyA6VpDxaaH84joDBnM4WkCHs+xdaU6y6pow8mllFHYjAnLnTl05pVgXNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pxuarqHa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bbYm7Pns; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CBxIws128807
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 13:15:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kDUShvlFUbelpVH62uTctBCJSsxe3CkA10mFD4Q5XSE=; b=pxuarqHaLncNCyB8
	csJZQJr10cTRRjezO6EfKVdqXv1TvwnJ1M6o7CJd2jF4+5Que3FusbIkwkA+oZ7i
	M1p1Q/1pgAMH/vVaqVwEa/3EouDwR8uwfrvcpSP32Cudz9akVa1SADbdyXfWY30B
	fp5/7xKGVQPz6+yx7gf87QPEnz6WPqqA21mgmxU+2y/uFek6H1G7Veawc0klE3ie
	/CIFU2DAvhgERYqlLJ93bhxAK7JErNWbM9kzv+aHUv5f6EwiI8Ed9JsV/DMqlSzE
	rXmcLkxItmNmMK8EYWRWReSiOQEkyaREK4mLiZvp6hz7p38o2K5wC0ZNWrh9roud
	FZZQmQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e43tn07jh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 12 May 2026 13:15:01 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6343b1bcbe8so1321455137.3
        for <linux-media@vger.kernel.org>; Tue, 12 May 2026 06:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778591697; x=1779196497; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kDUShvlFUbelpVH62uTctBCJSsxe3CkA10mFD4Q5XSE=;
        b=bbYm7PnszEPrUvba+UHjzg5B9mUXPT1S3zMeeeU7PA1/7I6cIN22c/8kTjZu7+zqD/
         yO3m1hBZoQA/9hTQETT/rYMkxp7gRv4UDZzwVWrMxlhM2fPcqqwIJ6NwBVkmkKHTzpWV
         gG5gYCtqLkJ/iFxceKZNtK6mHSnAP7S99743fWnpOdUqXgZJKGr6Obj2Sv7M/OTqLe04
         bweE2WhZNe7KICaacy/3WfTinUdIwQX3zSUtveUkO++yIcTjc+D2IfoqZgbqmv9WnOYf
         uQ7gd609un1DzVFQWY71P+QLkqGgM7UYCjF/m4FwzXQ2/jEB/lGLzc0e2K0A3SDHJJpG
         +Utw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778591697; x=1779196497;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kDUShvlFUbelpVH62uTctBCJSsxe3CkA10mFD4Q5XSE=;
        b=VuZTuLARUS1IGzLO8SMpuRkUUJ5OqPAD8FJf5zS/8FyB0/uSKoOGa51FeaUV7zSquJ
         jacrD8XHKmQ6wLLu0mrQSHYu/96MTGsQZyOWmXzToaqCRMjwPMWYhIyjAa/Rl3OLxExb
         sPZhVa94D7Ev3cYPxpiTeedZdNs1hZiY4xQV1lhQb2lYuRRwLFmhQQp+/1pl3pvi0u8v
         GlM6D6pVVGb7MV8HMb6f7e0XRm6BgSYV2wcVhLqpWxRYweVvQJs9ExZqKRF/5Bh2/jAr
         1TLVJLyd4chQWGj6qO34qmTD8tuCZLf+3goeFWXhqEFzLhO+tAPbGTomDcyD9f9PWWYz
         eaaA==
X-Forwarded-Encrypted: i=1; AFNElJ8hEAGg7VRRVvccHFzRPcZv16YAs2OuYFOYGHqZryzBOcbSeQ96bn3FgNtL9oKJ7Owqy6fGmvPpIjPTNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfiwSHdWrdKp7+O7WWR+/iEqY8eUM8CqC06/DYOtQx9A11ye8p
	/2SbOudsgEdf5LQFj+xmrUBN2XTxjYu+Anj6kb/33o1bTYisoumehdo5ZkZ/00rueKcgvhpkLwg
	wf14Y4vhlmARzg+MYeb8iztqkQWlo6tNjystfO0TKxDVhaND3Cl37ITE1wvfndWUJOw==
X-Gm-Gg: Acq92OGRjaIw1W+XBFuLx5SDnY8GaTlp94H57wWb9HtkN+QkjtBZDDPWo1qR7cqncW0
	mUC+yV+wRPz88qI4Ze6wt5v7YM4trgYJ0P+DeeO9hH+kclgJHLxI7qybS3lwD1/buQB+hCx+J+f
	m6D7qPiRpt18o9SiutZxvePv6bQ1H16U0wemDnYOPfiBFVBlfK3Gkflxfc+qPthcM2ui+KrAgdo
	Lw3gTx3I/f7z38OMKPaI2EvKlKG+0P7Y5LJo7hbS5EOwCWwjjSbgCPPfBUb9gxFP1Dff1hcpgGV
	uVkNEOV8GMDLLla2wpDmA4Vrpg5KO2a0cHOqWDqhrEaXxpAJQPiwE/qCEGCM3L4I5gaeQTQmquN
	JgbvQPCUpnt19/j9U77sBPcl6O/FTWAhsE4B00A/IumF/AjRxUYJCsSSbmbShZp18qfeeCnLsHm
	0689V7E4D3AKSePn0rwj2FOcvKt3qGvJfZulw=
X-Received: by 2002:a05:6102:2ad1:b0:631:487a:238f with SMTP id ada2fe7eead31-63613ca7c06mr1105050137.4.1778591696570;
        Tue, 12 May 2026 06:14:56 -0700 (PDT)
X-Received: by 2002:a05:6102:2ad1:b0:631:487a:238f with SMTP id ada2fe7eead31-63613ca7c06mr1104996137.4.1778591696092;
        Tue, 12 May 2026 06:14:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f395d5sm35163281fa.10.2026.05.12.06.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 06:14:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 12 May 2026 16:14:50 +0300
Subject: [PATCH v6 1/2] arm64: dts: qcom: sm8250: sort out Iris power
 domains
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-iris-venus-fix-sm8250-v6-1-51856dbef83c@oss.qualcomm.com>
References: <20260512-iris-venus-fix-sm8250-v6-0-51856dbef83c@oss.qualcomm.com>
In-Reply-To: <20260512-iris-venus-fix-sm8250-v6-0-51856dbef83c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
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
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2181;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=wXEQdSaGgvvhyTZjCrPo1di1ubN2oQfPidI6Nv5ympY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqAyfM06MHkt0moDhI5mKTZW7jOm76u1NtvyfO5
 84Rk9+KImCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagMnzAAKCRCLPIo+Aiko
 1YAsCACDBh7fPyk71x4p9J3O7KsF5Ma/aNnd8AazJcSXJuqQ2wrw+jfoBVedICMuvvHdqO/Alb7
 YGZmgsEwA2h8UNCsjEruM/GXZCv+mDwHSs5ceaRdMTaaKYrIi8qNj0pq+VIXTiExhpzc3NI++7y
 M8pqCaeue/6PVtwq689utB9Q/pI+68nACq1KKhZXm+sWtZbuZ//FrhAcgPybUzmk0zZ1rhxQF5X
 n/0dUz/WvOJZ0T23YTlnUcRGcLqnphKo/AvhnM7d/9COjTR+xUsfWvsL5DluNtVv8rjOrc93/9Y
 HX3cyLuTBVzqgpDbAOqNhM9s2i55fIFr6Rls5AahdkgXOO9I
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: yLv2mrmnannpvz9lFrOlj0xMMHimOLnI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEzNiBTYWx0ZWRfX9ArXcbSzlKym
 /Fbk9pBnqnA8b+FyhtcUXR3OykX4MKaegUNNmeCu3SliBE06ynSbY/nop9b3BQa3oqJfMJoBJSX
 r3Q491nV9baSDfCg4NLn5pquUJ5QNuzdk5459z5LRbWhlZUYEXyRwMorUUJtWv+cRdrtAi08H9d
 m55CsL4wFub8fIK5aQNATqO+/p9QFDIujJI5syhZ8B/KLdEV7e4TwH9lbkQbXZop3pGQMzQfM+C
 nqYU/RIt/vPceg8NDkcbcEVl+oHerQ8GHKAnl7cSDghUXavb19vqYwbRUDYAnDqkq2Z9vZkaLeZ
 SCUuLimCW+xt8QRcVKctYQLFgYHGZ/XCNSX2WgPI5Gmj6xXJ3fDt9gKCZKA5Fp/f5W47eboAmqr
 tXjTGgh6NlRwg/zKYylLZLqk3vnWKmsk+U52hsjcMwIPCt5kWOhHhd1z4NgYW9pA85Yexp6Bcwd
 JWZ75m3O4YwnYCRkg3Q==
X-Proofpoint-GUID: yLv2mrmnannpvz9lFrOlj0xMMHimOLnI
X-Authority-Analysis: v=2.4 cv=Ebn4hvmC c=1 sm=1 tr=0 ts=6a0327d5 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=rGr7YpdD5vYbGY1z0rMA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120136
X-Rspamd-Queue-Id: 34637521485
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61263-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,aa00000:email,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On SM8250 Iris core requires two power rails to function, MX (for PLLs)
and MMCX (for everything else). The commit fa245b3f06cd ("arm64: dts:
qcom: sm8250: Add venus DT node") added only MX power rail, but omitted
MMCX voltage levels.

Add MMCX domain to the Iris device node.

Fixes: fa245b3f06cd ("arm64: dts: qcom: sm8250: Add venus DT node")
Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 7076720413ab..1fcbd400a3be 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4326,8 +4326,12 @@ venus: video-codec@aa00000 {
 			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
 			power-domains = <&videocc MVS0C_GDSC>,
 					<&videocc MVS0_GDSC>,
-					<&rpmhpd RPMHPD_MX>;
-			power-domain-names = "venus", "vcodec0", "mx";
+					<&rpmhpd RPMHPD_MX>,
+					<&rpmhpd RPMHPD_MMCX>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mx",
+					     "mmcx";
 			operating-points-v2 = <&venus_opp_table>;
 
 			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
@@ -4353,22 +4357,26 @@ venus_opp_table: opp-table {
 
 				opp-720000000 {
 					opp-hz = /bits/ 64 <720000000>;
-					required-opps = <&rpmhpd_opp_low_svs>;
+					required-opps = <&rpmhpd_opp_low_svs>,
+							<&rpmhpd_opp_low_svs>;
 				};
 
 				opp-1014000000 {
 					opp-hz = /bits/ 64 <1014000000>;
-					required-opps = <&rpmhpd_opp_svs>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_svs>;
 				};
 
 				opp-1098000000 {
 					opp-hz = /bits/ 64 <1098000000>;
-					required-opps = <&rpmhpd_opp_svs_l1>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs_l1>;
 				};
 
 				opp-1332000000 {
 					opp-hz = /bits/ 64 <1332000000>;
-					required-opps = <&rpmhpd_opp_nom>;
+					required-opps = <&rpmhpd_opp_nom>,
+							<&rpmhpd_opp_nom>;
 				};
 			};
 		};

-- 
2.47.3


