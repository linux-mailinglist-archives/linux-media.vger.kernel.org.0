Return-Path: <linux-media+bounces-51505-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJZ+JSM4dmmTNgEAu9opvQ
	(envelope-from <linux-media+bounces-51505-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 16:34:59 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 400B78140F
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 16:34:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E353303011D
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 15:33:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE1FC32573C;
	Sun, 25 Jan 2026 15:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ovh9zf6w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QAGTizYJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737723246FF
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 15:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769355192; cv=none; b=Q5rNp28jKyKxBRU6T7VDOnHEsd7FseJZAOQYVMLdg30sC44GopLzzvwyg61HmcNguCn9Kw/jcDDdoTpZxgn6q3niU9MOuIPyszG2m0eETOAKzZ2QVIJmFyB7IGT5aZXnPj6Qs9nY+UCmtjLH8FK4ju8/7ne1NRC6+lhkYwKAF1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769355192; c=relaxed/simple;
	bh=PJiHYLnSEuffYvSKM8ePxKvMNbsPyKyLyejgTYc0tWs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gp3RydTNTj7iVocfylrMODfZsZQvzoLU8LY6kfRxfyPYGEOCbEHdbbKAJGnFfcMWF1iiDHel4y+GfZ8CATwOHhjjDwga8C7UndRues5sKgnmgC7orXcyQ4df7lejKz41WLiEOhuZ2DvLLr+IKD+RYyy83UPTU9YbX1w8jxArh4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ovh9zf6w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QAGTizYJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60PEQtLA3184702
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 15:33:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nMnZgFstSfhXFxxtUsEMfbmsL8APUsp+8DEipnzhrtQ=; b=ovh9zf6wlMl+Q7vZ
	Xwv4t4ADzIfcX2DYHPsVtiKnrTa8dm1R9tC4N+pymdki76GWYt6QA6PCLVa2Ggiy
	q0xm0ampT2p5BIgC7PhQFD4RusYg0MWD0u4ZAm2Zwv6KEhDgnYiFH9plMDKTa3ed
	a/tpswVv1xyCgvu53JHtbxpWUxdqjz1DAD3QtHA4ySbs6Gep6cVRS7nsV0eHkymB
	iQCggtWRbR2xkTI9HR4CVrgQ2KiD4tr1nGrpCURXxAP3Uxq/krPaTCfxsM0y9n09
	UfUaZh4XyfcUYEGXfkAqZtWfHaqKg7AS07bWjbk2DmKagRkI5kNqrqJ4s8sx/lA3
	1Bq1SQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq24jagn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 15:33:09 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c5296c7e57so38554585a.1
        for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 07:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769355189; x=1769959989; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nMnZgFstSfhXFxxtUsEMfbmsL8APUsp+8DEipnzhrtQ=;
        b=QAGTizYJgrtmnNpjH49irnsl++qcjndjRO6HOVQ6/6ItnFVvrkwQG+XePOw6q+vsF4
         NwUoNEPRBospqxHYtoTzZLx2uOyIsECEP7IFRONlJJRYnUnYc6rdS1EVBWRKqNTLL5k4
         QLTlLXsXUIxuONXT2etBs1XvNxocohqreOoaeMBDKiGAG/4Ka+qEmwGT3bNGbg+MGjgk
         blyLmWTNnZNua3XMqpKRZ5k0A5A36okAXD3mFq06JSFIHEdiJvdZ5QTlVRusVfxj3wT4
         WI2U7mEDN958fSkYrQiV7zsyF1V22TxgPYr54Pv5dRmJBvhoD7D9zDbq++jNy9sUZnN5
         NlwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769355189; x=1769959989;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nMnZgFstSfhXFxxtUsEMfbmsL8APUsp+8DEipnzhrtQ=;
        b=eyHCULnLwFy/qb99xnHpG9QzjkR/U3rUk01TYfjEuMQ+RCU1mw7pyEX7DLzHkLYTA4
         Nvhbdn0IFvXixez+VKpzk0GrazuK6UljUnrZ1f5kQAyg91Vdne1I9eWSQ5kEG8k+Hv/d
         LaADuybi0TGgcLnpDLlO5FHFcQvGf/1HymZf3OtQJDBaucjPqQT6ntAOfWspN1KHXr6l
         JTmDbTey4zAe1US+WRPsxF0EZfCalDs1m/IE9k7BG0tdvNQ7dWXmu/YPr64u3pMlqzOf
         iYn6IwkYKtUYOSZWfCjorETea6N9i8udokNCDpJ4KzP2uQmUGPYButeuxoStHFTvlaKf
         3JQg==
X-Gm-Message-State: AOJu0Yz2bNlaRwdDWvYi+wPPS538LeeA2DOYuiBpyEg9NabJSjT4T0Wk
	PqU8rJxXNRdHj+NFTA48fWpVBx4V7PZJmj4UyYYLEso1w66i/K5yWLYYGG/8dXUK9Cr9kt6ip5y
	mri6fxWAc6TfzrzRp6xALa7goxPifKjbIisuqIjh/87BBxqT//tPtgRsL0D/4Vne6NA==
X-Gm-Gg: AZuq6aLEdbM7N+gm/Xv0QPlCi3+1aRT8jpUew/Ggh40kPDWOOeGwsi5tyo3hrXoGwPJ
	lyWvISBWV64j7DJIfh0LH26EYBxgQh9OWKc1xEuT8rLvf2S81rW7kydf3i/gAbUxyXhYA+Kpl2i
	6Eesz2ln445p/DIXXOZtpL5K5yQeQwhsKNsuVlSMirK1eoc/dgie5Kb1BCAl8Y8Wy/LLF/+xbtR
	WtE4R+gRsC0VgnQD9UrITuLOZLcHEiwAdecvrgRufw+NKlRIfD+RDYbfeQUcWX+OW8uUfmgIn4L
	MWcTfcyNmMUr6whV7Rrw5lkWOpPOST3iGDecHJS/0R0SMELv/7Ii2/EU5hcY3b+YJdViApRLcbJ
	Ke7Pnonlc0ypxxuuQLmTU3MoDyaZ9XBceGfF0uA4ek1OGaTe1LO8LfqLs5cJnWXA/SNh8zoK8b/
	hCgFqvP4eqqzRh6QlA1oY7HvY=
X-Received: by 2002:a05:620a:8b17:b0:8c6:b14b:8a6c with SMTP id af79cd13be357-8c6f9572a75mr157736185a.6.1769355188989;
        Sun, 25 Jan 2026 07:33:08 -0800 (PST)
X-Received: by 2002:a05:620a:8b17:b0:8c6:b14b:8a6c with SMTP id af79cd13be357-8c6f9572a75mr157733385a.6.1769355188532;
        Sun, 25 Jan 2026 07:33:08 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385da1a0a45sm19154661fa.34.2026.01.25.07.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 07:33:07 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 25 Jan 2026 17:33:00 +0200
Subject: [PATCH v3 3/7] arm64: dts: qcom: sc8280xp: sort reserved memory
 regions
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260125-iris-sc8280xp-v3-3-d21861a9ea33@oss.qualcomm.com>
References: <20260125-iris-sc8280xp-v3-0-d21861a9ea33@oss.qualcomm.com>
In-Reply-To: <20260125-iris-sc8280xp-v3-0-d21861a9ea33@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpdjesD1a4RxxNBNxxxD9jFoq3Kt0SH2L09if81
 T5Ari+O3V+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXY3rAAKCRCLPIo+Aiko
 1e7FB/9ks/6z7PTg3zg8PbMYeD1FIq1Bm/HvznkTUZtHSpfxHNn2bOKEv38fCxu6fy9ea2vohDY
 Z4BGT6oYjrdKomjyq1zUvywEngHeQNbmy1uD/9zsoq2F/RmzPNL9Hap0jDPZggdpZviulm1au/l
 vELPfGUA+AwcD6mWWakuHrMCs8EUYPclQkaBnyVYhgR4h5lmrOYJe7T96oMMxisOORVz/vUolu1
 3XQCJp2g1bqK271jbWQyYMK+CzwGhsHtU0ZZHwgs20kK/7Nw778Q6Y0tEXnPaF0WpUIs8zrQEyA
 ZoMYu/FF9OlDIwEzX/LqPkSz1sDmNr7qVnjhca12yGlmhYi0
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI1MDEzMCBTYWx0ZWRfXzcpl6VEIPEKu
 8+IsA9TgYiFeExIxARD+fpPVDmcsWQxgm9ymBERaqmxxI6o5QVfyUno8aR87Jh33BUkPyILQCQq
 jyG/ZXHu/Sj6jbCUZn6pPJtcKBYj11/Ho3yDsQSyvdWAbTiyKR9wxdj1aCXD/JsyDkL2Gq8enJR
 T3FOW1jmKZ4Mu5a7WLvco8oOmIhRZ9OIJ7oeKik6K4F9RXSHuJ1UlSfUtKfYwnH1pHOPC0g0pQ8
 nyyhj6jt8e2TAh+s5Ec6YYM/zoMabAIsT/F1bUoYaKRbdxQYIvpEGUAtVLApA/QUqXTqdqIJCEB
 I/0Jh9t50zznYL15ZcioZm251L4zFa0bf5/+MWwDaYDrfusYljL9LnSjiIRZ4l6oeX97jMYSIh9
 WytHHMohhEyO8HMUn7hornfjUd8VRa4yiLgojUn8Eale3AzWQafqeKnY8/ywyG7tvlaHXX49jhj
 XkbdGzNSqK8PcpP6DUw==
X-Authority-Analysis: v=2.4 cv=EsXfbCcA c=1 sm=1 tr=0 ts=697637b5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=dWPP9-k4-ZVWm8qm6WgA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 3gOzz2u6GIVeFkPJ5DXoQqMQ35WpY4sG
X-Proofpoint-ORIG-GUID: 3gOzz2u6GIVeFkPJ5DXoQqMQ35WpY4sG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-25_03,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601250130
X-Rspamd-Server: lfdr
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
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51505-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[8bf00000:email,qualcomm.com:email,qualcomm.com:dkim,85b00000:email,8a100000:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 400B78140F
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


