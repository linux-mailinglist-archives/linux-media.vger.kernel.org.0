Return-Path: <linux-media+bounces-51494-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kIAgLqshdmndMAEAu9opvQ
	(envelope-from <linux-media+bounces-51494-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 14:59:07 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1754A80E2E
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 14:59:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F180301D07F
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 13:57:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00EBB31ED7C;
	Sun, 25 Jan 2026 13:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LOHcw6mD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iHhBqcwx"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8706322A3E
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 13:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769349460; cv=none; b=t/t3CmaQ5P6f5P0AAbo/XqROOVTknSmZdB7HRNzbNiXX0v4knfwet1c67j6lKAHf/fUZavjE3wosD7C1PJg9zeeoqwAfUOAgup07NeA4cJXqsHfPxpCv+tRuGRQLhP5e52xrn2AgDrTgpu/DZp7GJ6WyJ3rLfOWm4khn8+YQkFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769349460; c=relaxed/simple;
	bh=PJiHYLnSEuffYvSKM8ePxKvMNbsPyKyLyejgTYc0tWs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s5NTN3+ETgqVDk6NaBlSgjk8KdJhDQhLOlk0kQ5V/LC84pYb0WCesiSuV74hqI9beQGxwSmApZoK73ggDbasmX8mRjD8sZK2SaErILucXbqhtexGpPrFmQN4TQ5JSHnqeLZNK+J/wVP5q4tTC9xCnQkv4Sz4rDiKJzstCYfQ19w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LOHcw6mD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iHhBqcwx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60P606rc2775188
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 13:57:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nMnZgFstSfhXFxxtUsEMfbmsL8APUsp+8DEipnzhrtQ=; b=LOHcw6mDOXCzJjac
	GuOVrVGB8niATKCfK4D8oKqM73woOJBTNj4ky5Ii9BmYcpXj+w1R+erUjMRhRNox
	RKV2dnbqC69rcvtMKcj1EKOMJ2U08c5mcGvIM/vjr6XfkmM3mFQ3dHJ0UQfLkT2B
	oHxDo/eQnayAKeu6aDaox4lPiUYx0q7Z92x3fl9g5bxgMzoxebX+ZYSMcMe57led
	8HlQZmxwo1IfH+SJq0+6B/MidirFDUmeMHT1JCi5XBaRYXEXbVh7rI3HmoUaQnX9
	gg0U2fDxVKUC0WH7uPWlKALwd73EiQxdeHkPjHEJj+46gHlQkvrMBm70kHVfrv8w
	gMQqwQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq9tt60k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 13:57:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c5296c7e57so19112285a.1
        for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 05:57:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769349457; x=1769954257; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nMnZgFstSfhXFxxtUsEMfbmsL8APUsp+8DEipnzhrtQ=;
        b=iHhBqcwxOFu8wguFG4uWtEWIChXK6Ij1UeIs0G1238VeXcppNiIkdLszlMF0ijXaQu
         boBGs+FKDkJ79bHuJUbJDH2Ua0ZhwG8YEVJ1+/evJLC+7Tft4W1VjVz6hDxmo3fV+GXM
         L9Jux0JKQu/jR/gqTsw8TTojGOm7QYmRUAeRkZVozUNLB4flZMF4dBabccUKNrAa2Z0n
         5Ws0M11TzHDXUYOlNQhOFUi+tYy0kc7ikD4c8MQcC9Q9Wrd+7m1ihghf7LhA6wKOy/+h
         vnctzfRdGtn76CQBVQFg6WbVSzzCb9l6zLsfZnyRGgj+MQi5i0OaK7U2zKxwfl3kzHUw
         tB0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769349457; x=1769954257;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nMnZgFstSfhXFxxtUsEMfbmsL8APUsp+8DEipnzhrtQ=;
        b=cZU+p1rIj88qRnDE22BkGkOHAGZXWXItLV38Ab3LOUmZe+tNfRMreDSTfOy/NjFyBf
         ATXc5hnDjV+t3r/fi890/78B5gGfYiFt4br2Vpmvt/mTPkurjE7SZ3FlMjgnS6Vv7Nzf
         D1+KRkBU9p5s8mRp0pVx0j8VRlQracVsJXOtHJvxsvvJZy2hPf20Gz+OnLjCq6fMPi48
         jmuKx0J3t+s6My26Z6bDcMer4nYLD3R5655rNUuZmzOL22SN6Sm/Ygb6BbtGZ5z4wWP8
         zd7ttn5SK1Bud41+nwg2OXJ/zgBfEjXwN0wUn/n6+SyPxH5f+4BurTkFv1YxWZ804N3k
         wVbw==
X-Gm-Message-State: AOJu0YwcOMMTFYknZIOj5Jl3x6XLNmmTDdqewSJRY+WH7lcSaAxMO0/P
	SQjpXMBEM3k7c1jIgEZhFgsOFFUQDQ2tWfdzT/XP/WmRD8u1rAxUkzCnlBg7IG4nXJHowC9kDC1
	4mmrveYInR+pavhd6sRTdMzxfGoga4Cm7DDi67JPnmS28h/9EiwmyIZvBlRLDiWxVVQ==
X-Gm-Gg: AZuq6aKMqmLlZ8SS4QW13BzNt0mG+SYsb5Y45WZBJ4pU3iAm5WvX9tk7lTOMwlNpB5v
	jK0PsQganQ1/F5HmWPOvB1aVVfsnNwSqsXPEED+WU1iI1dV2H0XQpvOM1pHZwfx0Z94y+I/ASS1
	Bx2IZ3DwRGeUR8HJD2NH52b2XSMdSrfMgm88R9fU6zjE7oLDg7J1GOkS7QZXAuRtF9hCQ5m4ZZ2
	IW2m98vwnUPMcYnM0AqhX4wcuQ8fJlrMYmfhjTwCZ0p8A9dQ4Av0Sh3cInoMM2QDLG7iSYYIHZT
	Op6DvaRIWke994LZnF4OBywtNj8A1NkaTSvKGAaGmwUWKTA0MWCYVpGmyvyKcqDsSbcM2WjGf99
	qDxJ01G+m7RgP/lJvjhAbz7CZtVsustsrSCKIt4azz1gxIIWNxZcOjusHP2KnqVyG+byYnTXpLP
	LtfqyQ1f99hA5+MM5VgumBZBE=
X-Received: by 2002:a05:620a:3186:b0:8b2:f1f3:901e with SMTP id af79cd13be357-8c6f96491cbmr168448785a.65.1769349457422;
        Sun, 25 Jan 2026 05:57:37 -0800 (PST)
X-Received: by 2002:a05:620a:3186:b0:8b2:f1f3:901e with SMTP id af79cd13be357-8c6f96491cbmr168446785a.65.1769349457033;
        Sun, 25 Jan 2026 05:57:37 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59de4918a3asm2033621e87.52.2026.01.25.05.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 05:57:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 25 Jan 2026 15:57:26 +0200
Subject: [PATCH v2 3/7] arm64: dts: qcom: sc8280xp: sort reserved memory
 regions
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260125-iris-sc8280xp-v2-3-552cdc3ea691@oss.qualcomm.com>
References: <20260125-iris-sc8280xp-v2-0-552cdc3ea691@oss.qualcomm.com>
In-Reply-To: <20260125-iris-sc8280xp-v2-0-552cdc3ea691@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1110;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=PJiHYLnSEuffYvSKM8ePxKvMNbsPyKyLyejgTYc0tWs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpdiFGaLW99muzxJywHSRU4QL0CInh0ijm6/1tS
 VXMxqQcZC6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXYhRgAKCRCLPIo+Aiko
 1QA8CACXF0air13II1RjZNCuq+JSreRpmF0u6az5u/M+Axz5640leSRd7gq7DcPgfqg2SqqyCwj
 SYZX2CJDe3m0XxqN/ZpmGi19MJAed3gMlzhx+ipGN8SmEyktO98E++kfNm6zgzydT8SqGT37yx4
 jdwfrG9wWR35yjioJu9r58vOOi0bJtu7kjmh4ilIQj+vv3OHN5nxrdILnBXKZT+ftZHrtos+cb9
 eip+d1kZNJnC7YITqMSA3MT3+XyksoArIYQbkyBdOuf/Y/PqZEmuQgTz2ERr2qsph2ypbvkmhB0
 jnkKzHDpmfhlGdGM/tBsbiR+OAmsSTQrA4Du2Nokc7eo2m4H
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI1MDExNyBTYWx0ZWRfX15NolezLFQ/m
 bimAlB3iw9Cb0WJ0M9rjQG265kT5a1L2qSQH6XjBwJBOuz5hYa7+H54fLoOKsXdTGCl6CgYIlBQ
 U89FakM0sj/jVoE7D3q6cdiNZP3XwHMasXh7Ww4C1fF72qrO/8m+FSkKG9HcV2HTZQdYny/k9H6
 8fAoif1Bq12gfTObGqDYFnaMy+gnfbprjsaY8f6rtxhDY+DVl+EYhh+Ez6vsDj8wKLwjzBIdITl
 Hz1PFXLKnHZbGGejNC9hgup3aICeiNlTXPdbTxQyeor7Ht3hs04IzvhhHZZISwHvfIsptyP9Usd
 a7X9HXdICyKx+IYlZZH3llYwu41iM9WPuq8cQrDd138NyhaFNmmCAdPNBgDdSVVHKzDdhz29DnP
 MDE/ho3SXKwlyiKJcD64gaNi8jbFOdSs/OLE3MnXkkVB1TCmJp28m4cTmlN+cZWtFq4FYrXwoRD
 ZkINIEmRRHvVOIJ9jPw==
X-Authority-Analysis: v=2.4 cv=QN5lhwLL c=1 sm=1 tr=0 ts=69762151 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=dWPP9-k4-ZVWm8qm6WgA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: TnBAPpFBRBThCAA1-1JfioM7lv5W5WAh
X-Proofpoint-ORIG-GUID: TnBAPpFBRBThCAA1-1JfioM7lv5W5WAh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-25_03,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601250117
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-51494-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,86c00000:email,85b00000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,8a100000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1754A80E2E
X-Rspamd-Action: no action

Move memory region reserved for the GPU to its proper place in DT.

Fixes: 6e9612ced0c9 ("arm64: dts: qcom: sc8280xp: create common zap-shader node")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 706eb1309d3f..41c57e7dc433 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -691,11 +691,6 @@ reserved-region@85b00000 {
 			no-map;
 		};
 
-		pil_gpu_mem: gpu-mem@8bf00000 {
-			reg = <0 0x8bf00000 0 0x2000>;
-			no-map;
-		};
-
 		pil_adsp_mem: adsp-region@86c00000 {
 			reg = <0 0x86c00000 0 0x2000000>;
 			no-map;
@@ -711,6 +706,11 @@ pil_nsp0_mem: cdsp0-region@8a100000 {
 			no-map;
 		};
 
+		pil_gpu_mem: gpu-mem@8bf00000 {
+			reg = <0 0x8bf00000 0 0x2000>;
+			no-map;
+		};
+
 		pil_nsp1_mem: cdsp1-region@8c600000 {
 			reg = <0 0x8c600000 0 0x1e00000>;
 			no-map;

-- 
2.47.3


