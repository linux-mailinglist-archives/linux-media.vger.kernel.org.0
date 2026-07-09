Return-Path: <linux-media+bounces-67150-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 13nOIhmXT2p7kQIAu9opvQ
	(envelope-from <linux-media+bounces-67150-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 14:42:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B9B7311C6
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 14:42:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=mcxSinwf;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JAppQNCw;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67150-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67150-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1DB283032B4F
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 12:38:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E2774307B1;
	Thu,  9 Jul 2026 12:37:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC1B430787
	for <linux-media@vger.kernel.org>; Thu,  9 Jul 2026 12:37:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783600631; cv=none; b=QAdwR4kkEHDmQFFK11M6c2Rui5lnQKvNLmhgvCOizW6/ZTSpfyIeYr1XQmvWR5/Qdhwh+PTfNoSw3PWjPXdK8CHJoSKa4PVP0jmXD2vxiuXDV8jE4vUQrhzvhRGAdKqFnPIuRf1xu5DnbDKFF8/Ta3HvRpCm3Nt7hI4tCTEswdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783600631; c=relaxed/simple;
	bh=fWkAbSCFblue3Z2AwijKMhW2CrasBLX9+Ror5e3etEk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I2oJwoUe+Kvz1Ytw2ltMl3qAv+VA/g7iPTBiCybJ9zZFj87CsqgkQsyVL467bEdNOjx9pbJkcQm+kgUjLpNpCKr4bxLHigWB1oaXilwY+R5i63CluuZdr4F3nyXtm3m7XZeGETAKqmJeGBL+3GwQSNrppg6oMY6YZd/+D1ETpPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mcxSinwf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JAppQNCw; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNNCx1575673
	for <linux-media@vger.kernel.org>; Thu, 9 Jul 2026 12:37:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M0uWu4lVVItdOG/gQO6m1iFTqiiPl59WTuu7fGl+srQ=; b=mcxSinwfYlgk2Hm5
	6SMmZJI8+8G0YgkdIsU/V8mRcyl+B1GJXmIjj/OMUgk9kahd6IyUcrm3gGGkdzW6
	Iqt8IDeRwwXQAw1X7FYRV2F2B7/WSVUsrFEQA7aNl6be5RWzELMa38S2B21DEp2/
	Yi2u7v9oI8/o2yewuHwa1alickOZospSgY9UL5AYBsRVIX/4bNR6h4b7qtPVAul3
	JQooJrrcabKg29CB7J97PLRzbrdlhRNe06W/7O/Y3aRnLa5wFWqQ20aETiYtn6z6
	SpU2FjT7X81vriB+aMKmsjWO1TYs5Bfos7rp5wUdr/3+9SFUCtdT6HKbVuq2Beol
	yyCXyA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqwc73s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 12:37:07 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c860544c077so3815795a12.3
        for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 05:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783600627; x=1784205427; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M0uWu4lVVItdOG/gQO6m1iFTqiiPl59WTuu7fGl+srQ=;
        b=JAppQNCwQWMn1e6Zw29wZVjH1e7WUoEJ6vOEqwCXbZNEkYVZliD3M8/g5fE/+OwwM8
         E1fngvhfFyQOPTNEVo3wBFWnKKjMQKJHtA6AS/J6P1a/yPj8wsllcQ5rSN4DGvc77PYY
         r9O2/Opz2CEwcEoM2Jxd0P0unStAYncILRBo0pkOKCrxYgAEwOK8JaKTO49deSo19qjt
         wGs5mCRwh6dZaX6d9FS50r94TxRMkAIkHwW0EaAS4xvKBlfic/Xk6EDWoaj6MxI3CM31
         fwQ52TZ3XSmqZU7y8qS8W2lST2Jmc2iQmILglBrJa0C0ZC7yQ7/j/f5iyJ3QjpG6ryVh
         ycbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783600627; x=1784205427;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M0uWu4lVVItdOG/gQO6m1iFTqiiPl59WTuu7fGl+srQ=;
        b=do49MDSVAztDcbQU44OviYzGbe8iHHVmO8HE47NzgK0LMOh9rAF9PWlMXZ23PM3pcn
         tHfohotwRm2JscXph3f5CIzlupt9233JwacdrpSkGl8EcA/PMEtvyWQQAfctFDQVxgZ9
         vN6hR+81w9jj/qSx2k7LuLOf/meVRBa1vjTSiWJHpy/BfgOKfklxAL0n29YtumzeY00y
         DFQWvVLKtakOjiyUEjvb8XsiW1fhTvXyQO4ibQ9OOg+5W7uaBis8ksk+hQflffjTVW9D
         LpV4jiEANWY5xa39KfSPtOJqXEKyqfwsp3xt3MCdPBBB+8rWkHCdY7Jgu2PXcyL4FuuM
         T39w==
X-Gm-Message-State: AOJu0Yww3NzCFqFKakVNhI4YzvG0e+AHdQ5OseV5D5mjtszxN9NdEUjF
	yrVMp2SixVaP78n+Evej5d495z3XfqT0GTxj5bYMAbHZo6YBqZ7Nzl/ivKZjJvBhDqxyNlDe3WB
	lUyOkGuMyNETI6SJsV6jaEhOOXltIWh2v/SBvSJi1HCfxDMQ+Ci0jdEgPDIUE9L4Rcw==
X-Gm-Gg: AfdE7clB/WJeROGxAU2BDc/tyfUlZMMeyJQ+fCVAI4eb1kif8vyi7nSGYn7/My5REV7
	FZ/XfAN5giFZL5cErgZCpLSTHu61Qf4tkKnLU2Qv1jGhrQaWSqX76dpIQ2iK6YKpDZGFtqi60yw
	0BiAxw7TLpLT/JWWQOs0wy+8MVdaX38jtl6xM6SLdSWBiyvXM2wYcyxPZkQBEvSrOEvx/0OHNjJ
	fRyClbXCC+iglmb4vEm9wqTEdkZAEp+Q+slCmUWITeKf7oQVidoKENJKoFaL+CV/76vbIwkvuUG
	n7A8VMhn3Aa4kpSLBFyneCEoKLImSLbQxA45aarlpFkbkXyi5FtaH2XOsqSHSBZwatg/PSofqtn
	SBuVn1yAnUuCAUw0NkLsgkiyQKJzfm+0t0mxoqudNTsG0/Q==
X-Received: by 2002:a17:90b:2f0b:b0:36b:a4c6:da96 with SMTP id 98e67ed59e1d1-38941cc52a5mr7041362a91.25.1783600626342;
        Thu, 09 Jul 2026 05:37:06 -0700 (PDT)
X-Received: by 2002:a17:90b:2f0b:b0:36b:a4c6:da96 with SMTP id 98e67ed59e1d1-38941cc52a5mr7041337a91.25.1783600625893;
        Thu, 09 Jul 2026 05:37:05 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117483941csm31456029eec.7.2026.07.09.05.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 05:37:05 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 18:05:56 +0530
Subject: [RFC PATCH 10/11] arm64: dts: qcom: monaco: Move Iris IOMMUs to
 child nodes
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-vpu_iommu_iova_handling-v1-10-72bb62cb2dfd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783600568; l=2086;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=fWkAbSCFblue3Z2AwijKMhW2CrasBLX9+Ror5e3etEk=;
 b=NBCO/pvurO3z2mTiBIbwwBIhoDTvIZr66UUgPwXu1X7YUVxIpq03suFlrhJvlbi5AfKtvt7Q5
 b0Q8GffIbCDD8U8KM9jgzMzCqo9i41ToLBHrYLdd3MP8VOWf4T+Un8d
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEyMiBTYWx0ZWRfX4Vinb2U/XbpX
 mBMZbYZpNlpB4D13bSG0NXBD/hVrwvyiRhScSQmGrMY4lD/6ge2mdq10e8wtlQUr2Ln58ATGORZ
 4bCtoNlh1/sIYOVgVDyF1YAHdFLaf6RY+xkewZTAQp/kciQEW4v0eOIH406PEI+C4YnhgO+07ox
 i23g1JZ50w3JZWin8H8pVi7VhJbVbLUvhtAZy8QQrbD+peI3++yTo1Jj2Iqo75qS8/p7j2lWuwl
 5/zY9eoGzkVOq93Cy+voWnKzZzscqmsDNOTnhdWmYKXsPqNjDww9G8G0ZyAgQkZkjvfWn6kDSlN
 5RgxJFKFt44paWzz3lOJAVRF7QpmIvGP/0mhC3xHN2vUDvlwdUcj9KGt8LkyHoGy7U+U8yzCyC4
 VjSDNC+iJMo9YMUnLbUdTcM2gxhthH9l70NdvqJcJk8tosoHWIsVBTb/8Y9wzuYYGkkt6BrrnDf
 xJuIx50AcBoJ740rgLg==
X-Proofpoint-GUID: j7O4ZZL949vwsNBaAjbH9gug4xWG7LnA
X-Authority-Analysis: v=2.4 cv=fMIJG5ae c=1 sm=1 tr=0 ts=6a4f95f3 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=SdC2vBNBQt3qShdCGKMA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: j7O4ZZL949vwsNBaAjbH9gug4xWG7LnA
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEyMiBTYWx0ZWRfX2/QohNm+SNDd
 DBOQYzZohUhx8Np3wldAAhi6FLaLJwRKztcdqJ4HQypM08WCE6GuFczp3IptABFFkCIKezehCp2
 5DtXch+cjEs8+OY4eZi9CC0J0/x2ZYE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090122
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67150-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:vikash.garodia@oss.qualcomm.com,m:busanna.reddy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,gitlab.freedesktop.org:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 26B9B7311C6

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
 arch/arm64/boot/dts/qcom/monaco.dtsi | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index e0243901abe9c5748fcd3c448a0203374fb96c3e..d3c464571d5eee18fccb0e6b522ff0400e664cc4 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -831,6 +831,10 @@ video_mem: video-region@9be82000 {
 			reg = <0x0 0x9be82000 0x0 0x700000>;
 			no-map;
 		};
+
+		iris_resv: reservation-iris {
+			iommu-addresses = <&iris_non_pixel 0x0 0x0 0x0 0x25800000>;
+		};
 	};
 
 	smp2p-adsp {
@@ -5423,12 +5427,22 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
 			reset-names = "bus";
 
-			iommus = <&apps_smmu 0x0880 0x0400>,
-				 <&apps_smmu 0x0887 0x0400>;
 			dma-coherent;
 
+			#address-cells = <2>;
+			#size-cells = <2>;
+
 			status = "disabled";
 
+			iris_non_pixel: non-pixel {
+				iommus = <&apps_smmu 0x0880 0x0400>;
+				memory-region = <&iris_resv>;
+			};
+
+			iris_pixel: pixel {
+				iommus = <&apps_smmu 0x0887 0x0400>;
+			};
+
 			iris_opp_table: opp-table {
 				compatible = "operating-points-v2";
 

-- 
2.34.1


