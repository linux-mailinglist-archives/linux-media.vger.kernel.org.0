Return-Path: <linux-media+bounces-67151-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RA+pA7eZT2rfkgIAu9opvQ
	(envelope-from <linux-media+bounces-67151-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 14:53:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A56A7313F8
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 14:53:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=IJ4Ox+TX;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=i+cxejsH;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67151-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67151-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B377F305211A
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 12:38:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 746604307BB;
	Thu,  9 Jul 2026 12:37:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92752426EDE
	for <linux-media@vger.kernel.org>; Thu,  9 Jul 2026 12:37:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783600634; cv=none; b=jG8piCVsdBHH97jRt/NmXLZQKgXLPNbuthSv7nVUaztsGwW1dBnhqyMUT/shosbg+1wNllaf6HC2vcfvYacUddXsWyg1sQrdphEewmBkPNspM2aiCrlXp49o4xB8HxAVPxjly2vzWA5N7FXBDg8X0xPKplJqHNN8ZcU6290jQx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783600634; c=relaxed/simple;
	bh=rhePzQT7hlcIh03rDOoCur4a5l6fqH231Apw1Cmf6GI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fHwmeKxiCPm8Ac5jbc33QOBQw3mVpqL4b2StP6lGG08RWgS+YQkG+kdI1o4LKvS55TktaGCE27uX0Cplkw0WoRGoLxcoPJ6q46sBFQq/wgggzg9M666uUmtQmeQQiCPEw9HAoS1liJs2uJxGeCeQONkHuYCmIMyq/ZEJGlXsF6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IJ4Ox+TX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i+cxejsH; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNEob1488714
	for <linux-media@vger.kernel.org>; Thu, 9 Jul 2026 12:37:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QeAWq6sdQzFZ2rcuIUpEUIcqFJLm6eUd8hNgdnx3uoY=; b=IJ4Ox+TXCYYlsylZ
	RYP7HG4J8n9p+FIPjYFpRR6Sjta/4UOZcH3ZOWXhgmxUGSKtRsKsxjXqc+d8WJD2
	BU/0Q1S2LqXurz1N+3TckhHSs217GI/2AoJX+V5wgpfKTJN4OuaYO1TNB7akZV2c
	hQv4jxqC+Er65SSH7mBhmxIDwCl9AZDpfPzAFN0LQWRe3uurNkiL8WVr5Pf2ihpx
	hT3GpQWpOtDxzI68JgT54tWUNrGf+ADsoEeP3po73og2hfzlEpYb//8CnzypRad8
	PY5Opgw1mixqhfo9PPANUokycqOF0j24RPpSWl1CFEHpHonuipCU3GTU77aSb0Ah
	HTZ1NA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9wwfu6eq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 12:37:12 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ccbb61893fso24462845ad.0
        for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 05:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783600631; x=1784205431; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QeAWq6sdQzFZ2rcuIUpEUIcqFJLm6eUd8hNgdnx3uoY=;
        b=i+cxejsHnASTvxY2sNMnvosES2uX5iYS5P45FCuQtVS2jhTlNrDmJ8Cu+BkuiEfCpt
         NecWVJ8ldLLum/YthiFKCLxiv0+8c+Az4WuGOSZYRmTOa8Ex05pcrUF00/nLc3SvGRMr
         XFPa9Fd5Zr1pWEsGWdIeQzMCHF3/ZNK6nKBr2a95GkuioQeHAI6lpbpfKrY1UNeXKX+d
         CaWE0drqA08wezJi0ZyEfx3RuxUe/XzbrXKhFydEsETu768Tw0/t7CkklN7/es2R0KMu
         BBzNJiKcIwSJViCs5OGkeGT/x1XnQmAmXVFq2FOaABxw3XccNC3poIGOEGiL3r9t7pQI
         aG2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783600631; x=1784205431;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QeAWq6sdQzFZ2rcuIUpEUIcqFJLm6eUd8hNgdnx3uoY=;
        b=nXu6Xe//9nWuihEZArWKeCHcSOihIywIsq0PGF6DqGtvBc/QnbCqUPS3Pl02tfIfyf
         aVvJsi8JVK3CR4k/g/Pxkr8nzSgyARQRISPA27R1jZqSqQpHkoDtbaWpZYn1Ig+/1QtD
         9j3Wy8GiXy0ulfl12KoyAlQACMw1EgC5A4HhdRV+63sarodXDCri4u+Rh6kQ34U1gj8v
         iMDz7cvszRgiBWuN+UitXtvssBL2a5O0fdsMKQTOhKND22+lLaYaRn6LsWiJtj7n/OEM
         T4Bk+4EFOLKdpHD9awA9RiKHxdoibbNsm7HEa7BYm1vDpPCsIIdCKSvxwGIFrp3msORu
         k2hw==
X-Gm-Message-State: AOJu0YzJJ/L9XEsimyuqpg6JoouV13ydeLWW4nE+CbVbjebpM4gzQklU
	BZuKlCxBLp5SYH8vRYtjpyEBiBBreTFW9oXp74YIgFNdU1QaXB89Xkthi1m73YSAAqgnxNzX/kO
	xr62hfnq7eKEbdJ7mmdV1d6UWEmRIO8NjKmu2dyfz6XrKE0F+3dfRZUWybICmdDp4mw==
X-Gm-Gg: AfdE7cl+CK/16AH/ZmHLztVYLFAbbtPctxbT7BrXCN+X7tAb1viPIoQGj3As08kfB0J
	QQdo8ZRxcT11Eu9f0tEAqaa79aCW/ZJ6+N3A+3o5I4E44chJGsQlDKFP4BDYGFbqRm6uNcRDZuK
	9C7SYeIKGZ3xJwfuihhisa+8rlrHL3lkxl4hspRl2euf7jqijv0a9n0V8aijvWFv/uk1hVK/mv8
	MrdFCnOWsE1+IIBF849J1Sn311snCHSul5eRl5lsEuSCKJX+mHG/3ApSre7envTp+GqOgderVFh
	aICT82+5LshF0YlTrNwErdUnfa/SbJ2lQ02nRHQIebLcvV2QMS6lOhxl7nqSVlfPB5GNBuVCEVn
	V2xxwx8hpUDjP82kzFa5bma0c7Seg9Qqmn9q6g5vrN3AHTQ==
X-Received: by 2002:a05:6a21:485:b0:3bf:aa1a:d2f4 with SMTP id adf61e73a8af0-3c0bd0fa17dmr8579102637.49.1783600631419;
        Thu, 09 Jul 2026 05:37:11 -0700 (PDT)
X-Received: by 2002:a05:6a21:485:b0:3bf:aa1a:d2f4 with SMTP id adf61e73a8af0-3c0bd0fa17dmr8579061637.49.1783600630967;
        Thu, 09 Jul 2026 05:37:10 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117483941csm31456029eec.7.2026.07.09.05.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 05:37:10 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 18:05:57 +0530
Subject: [RFC PATCH 11/11] arm64: dts: qcom: sm8650: Move Iris IOMMUs to
 child nodes
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-vpu_iommu_iova_handling-v1-11-72bb62cb2dfd@oss.qualcomm.com>
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
In-Reply-To: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783600568; l=2240;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=rhePzQT7hlcIh03rDOoCur4a5l6fqH231Apw1Cmf6GI=;
 b=PSofLlEVPZP0yPnLVxKIhOWiOv4MpHl/hM9jyNuxc3BfUMVEEFt1Bt7aDOAv3AK5okRAIHNAw
 GQMnR5AipOpDjLQZX+Nmpn96vezw46HRbG12+RzOnBkfo1Pys9jWEiH
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEyMiBTYWx0ZWRfXza/Onqk8qxl7
 t9FrZ1pa/2CwWgik+XkuSrjevv6k7oADSFYQel5KMy6XtHz8KDXtv7nejThZK3HytJg6efNb3N6
 lAyqT+LqU1FTQnMpqh8vBRuo4KPkWB1oRAib/7YPHCsOrVHOlfmNgjoqeWC/ohjcvVc1sOO3/N+
 JriQBe0G6pjQjfqvDh5XXyD5eqp3wdOeNJ857Gcbp6mmenXLjb/Dhg3qoH4X4TM49NhnSmzLYGE
 /C1hu7XLrMmMgsqWjzKMk8lZ7jix66TcBUTYoFs/GF4BxJkXWbWBHkmqBWuntRvsVVoB4OCoP6R
 aCqRDVmDDN/brolbW7jqIw/9vjBGQ5VT+Z9jyOSiTs/wHcxWwtlfLOLFg5oDdRSR24HwRLukqPS
 h2gGXs0FaSRiV8cfK9nuAu/pC/TOLe6Np3ogctlQPiAeuFCD/pn+4GtUbhbywF6ikN8KpMwXwx1
 gubTYND9FL2TqhC/gfg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEyMiBTYWx0ZWRfX0h1yzI/XOcZx
 azYvuTGymEH+JoYWhIVDGLYSc9Yb4o02kD+WN68PYVIsEp0Ule+baus4aqrGT10B+Didwl/Wedc
 gxEIsCQr2pkAbKebWMrpiyNTIviMSH0=
X-Proofpoint-ORIG-GUID: KmjB2VaPV8kdlAnOJGZEJ8TraG1sOrjz
X-Proofpoint-GUID: KmjB2VaPV8kdlAnOJGZEJ8TraG1sOrjz
X-Authority-Analysis: v=2.4 cv=Krh9H2WN c=1 sm=1 tr=0 ts=6a4f95f8 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=Q09pOjM2IGVQiUKsHggA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090122
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67151-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:vikash.garodia@oss.qualcomm.com,m:busanna.reddy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,gitlab.freedesktop.org:url,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0A56A7313F8

The Iris VPU has separate streams with different IOVA constraints. The
non-pixel stream must be limited to the 0-600 MB IOVA range, while the
pixel stream can use the full IOVA space.
Using a single set of IOMMU entries for the Iris node does not describe
these per-stream limits and can allow accesses outside the supported
range, which may lead to device crashes. One such issue was reported at:
https://gitlab.freedesktop.org/drm/msm/-/work_items/100

Add non-pixel and pixel child nodes, move each stream ID to its
corresponding child node, and add a reserved IOVA range for the
non-pixel stream.

Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 447b788fcbb96efc8b26a52a0606bc53dd29adfb..f9c03de1317f1c6a8e52bd897997ef7bd826926b 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -1849,6 +1849,10 @@ llcc_lpi_mem: llcc-lpi@ff800000 {
 			reg = <0 0xff800000 0 0x600000>;
 			no-map;
 		};
+
+		iris_resv: reservation-iris {
+			iommu-addresses = <&iris_non_pixel 0x0 0x0 0x0 0x25800000>;
+		};
 	};
 
 	smp2p-adsp {
@@ -5219,11 +5223,11 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 				      "xo",
 				      "core";
 
-			iommus = <&apps_smmu 0x1940 0>,
-				 <&apps_smmu 0x1947 0>;
-
 			dma-coherent;
 
+			#address-cells = <2>;
+			#size-cells = <2>;
+
 			/*
 			 * IRIS firmware is signed by vendors, only
 			 * enable on boards where the proper signed firmware
@@ -5231,6 +5235,15 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			 */
 			status = "disabled";
 
+			iris_non_pixel: non-pixel {
+				iommus = <&apps_smmu 0x1940 0x0>;
+				memory-region = <&iris_resv>;
+			};
+
+			iris_pixel: pixel {
+				iommus = <&apps_smmu 0x1947 0x0>;
+			};
+
 			iris_opp_table: opp-table {
 				compatible = "operating-points-v2";
 

-- 
2.34.1


