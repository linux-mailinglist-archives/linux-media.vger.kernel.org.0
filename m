Return-Path: <linux-media+bounces-67148-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id l82gDuaWT2phkQIAu9opvQ
	(envelope-from <linux-media+bounces-67148-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 14:41:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A1F73119B
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 14:41:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YFfLM3Bs;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=SrBpxbln;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67148-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67148-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7B1DB300788E
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 12:38:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ACCF426D37;
	Thu,  9 Jul 2026 12:36:59 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7220F423A83
	for <linux-media@vger.kernel.org>; Thu,  9 Jul 2026 12:36:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783600618; cv=none; b=uTjP2s89u6MuOZ8P9X4r/PWlLjuc2SvPxw4PAg2qdie2H8MKpFH2Ch76RV8VcrBWBr0+HmL07Mpy51KjfEqNu2cTEw4yteE4PKdMpjKjsNSnM1vLvMenXFmXaky5qkSVMW9nlQ0MMrmvN5uYE958PyxeLoQCiwPVM+rWkbhL72g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783600618; c=relaxed/simple;
	bh=QaHAkZJ8tmnxH7GZ/3qSGhcx2jd/aFQMRWFp8BcP4Ug=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R/bv3OEAPlHgS4YRUpu2PtL60Pk0rLl5DEJaBOsZmN+T51vwYu0eIIPCdYIKWeAdLkHwdr8T93awnaBYtYh4zS8nZjYPCt4ZaPKarCM1vOh5UBcRt6Fe9EgECFhSewgzrsl+KlF7lqe/24pUEIjO/C7Z91zrxjhL/2kPjGtCz10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YFfLM3Bs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SrBpxbln; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BN4HY1450391
	for <linux-media@vger.kernel.org>; Thu, 9 Jul 2026 12:36:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JCWUdWHuFH5VAb9tntnMCJph6EXPxhoAx3Hh+A/qThE=; b=YFfLM3BsBUoDocDn
	cGGwP3Rzeb9wPuPalewcG4Z6R8KLeoiYoSFmS8HD6APCEiQ5J7spDz7d5O+TEiIU
	aq5xFyAiIHpkEMsGTrW7hYHjxnkTmXhlL72pP6G0mFrhVTJw/LUHaZuAqFl15JHA
	3AoMPmJbz4qVKpF+TmnPkTv7wXKJZbCrQZ3LhJIxQ1GQSQjcp+3ft1bosue4z9JM
	c/pQg7CBBdw57gPxM8R8H8Hf/h8JW6D3m7EWZi7Twx0iPat8i5nvqWL2XrJrWhaV
	vgwesKWIN6LYfvHKcJr+Fz1Rap2x4nI2mmSBdhuDYvyF2q2loOHVIAAHg4smlN1r
	vwkQ7Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa55vhxfq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 12:36:56 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37fca5f21b1so759288a91.0
        for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 05:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783600616; x=1784205416; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JCWUdWHuFH5VAb9tntnMCJph6EXPxhoAx3Hh+A/qThE=;
        b=SrBpxbln319lyaLLuEC/4ZYU2e13weIa077AkWys8TmQU68R+PrROnWGl7XhN1yML9
         KQ0RUOXqPwcTfDDW4/gSH4QQY822J1ZS3N5AzfNVYMlf28cLCCdrqLVOEnDvzWaZWanv
         w5tRjU8LcGHIDlu51R+FxzEuNE7juH5vEqQXzTQMF0o+OwO0kRWmHxo5W0wbR0y6YmsC
         W7D7/i5RjZb3jqfaCRKODk8G1UKIRSftNkPXvNWSmMWoFXq1hfdsISmnYAiux477asqI
         +D6yu/yX1ijoTP0SK075ZBKWoc/8Lp987lydG2fUAyQSbsHaPklVpmaXeSFCoKS5HXk5
         XLaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783600616; x=1784205416;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JCWUdWHuFH5VAb9tntnMCJph6EXPxhoAx3Hh+A/qThE=;
        b=lN0SylJPP9mwaJLXtpaAp05bkw0rBEtL+WssLlLy+rZFhoIg+/Rhx2p8GOEDXwBHyr
         ESnZUDDgik7pcxw/0qnLvAlKdWlLRjLOiIYPnRdPUrv35wsqmSb6vTKw1UVHAkYf9/lL
         ekSIdfdyTRtdBJlWjNrGlBX6yubAOy5tobJHD8y8ZyW17R/PNLwYWFSjaMa+l1dwxl8q
         WASzSRqyvixmv843WdBR8Z3eKHAHefbpjT4o0tp19YQXalsh8Vu4F/O+mCmYFPO/7aMg
         x4A7fKQMoQdg6sF1qiFQ1g+oWGwgElELPnQqQpoLCduZU0LRTrvMUNsYv5jikMmoZhuL
         YBeA==
X-Gm-Message-State: AOJu0YxsxT1N4a5TmnNUGQ8jwiIIaAqZj6GOJO9Eun8CzDvGp6gU/FXl
	PsoQPaeeXWiQpnDyUhvP/NxxvK93+WL2upYgl+xSe75ztSoMgSsSnKfl/kMTSLYP+PulA1L8FcP
	n1Letdw3k8/LF8ALwVN0UFjsJRtKViZ+rvPmKvZ6Vwd9nGt6p2Tz5PXdUpMdSW5/LaA==
X-Gm-Gg: AfdE7clIf73CeWbJn091+Po4rfktxhPS06+HvHOz/KOWRcTqhfehtaQJuosgab5AI0p
	xhhYeWWJ1UWaOxe24iyvqAIpNfl4eC2atlRe2nIohf3bBKxB/xA31PAHhY/fNxO2JIH6pNaUTjK
	Na3iHgvwKfhMMCKe657ADNNvIvqtIS0zKZ4g+B8y4TEkfIinWA5luEIixaIW+pbTT9ua8fnJ7G/
	UTLHuAOw5Jg0Caf9d27k2fqztfSma1I2ivPB69BBKwd3qdZwiRcm4MJqsH0m5jW5QL3Qj8Zagbl
	pjoDbijIRqPDWZhe4bCFJE8O2/5mWGzShgaBWz48K3TzYJF37YtI7691uX16CJI9frpY3NncoEV
	xt4xyI0/4xKMLBWn3+bnkDdLr04DHZ2QY0lU/2YFc2AH4Ag==
X-Received: by 2002:a17:90b:264c:b0:380:9052:f4b9 with SMTP id 98e67ed59e1d1-38b74e2cf78mr2864044a91.11.1783600616048;
        Thu, 09 Jul 2026 05:36:56 -0700 (PDT)
X-Received: by 2002:a17:90b:264c:b0:380:9052:f4b9 with SMTP id 98e67ed59e1d1-38b74e2cf78mr2864011a91.11.1783600615598;
        Thu, 09 Jul 2026 05:36:55 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117483941csm31456029eec.7.2026.07.09.05.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 05:36:55 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 18:05:54 +0530
Subject: [RFC PATCH 08/11] arm64: dts: qcom: sm8550: Move Iris IOMMUs to
 child nodes
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-vpu_iommu_iova_handling-v1-8-72bb62cb2dfd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783600568; l=2869;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=QaHAkZJ8tmnxH7GZ/3qSGhcx2jd/aFQMRWFp8BcP4Ug=;
 b=6H863EOyVbzxQd65/8KO8vnuy9kPCf0Q3yl3q6BWV6RaKEHlafNOPjaSsC2DAn9/7+DDqdHzq
 uoYsS9yuwPHCytXpuhCDeAKNx6JiGBEq2CBnG0Z5OW18tXK2Cds48cX
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEyMiBTYWx0ZWRfX6q6bbOMCyNtL
 gEPh+HiV2v00HYYwhbkWKTSDRx2NvjNxLgqie82IbavhqvuzSXftKRKYhk83IKxYOnBhREwKJ2F
 KIM/TjLYeaR5WPeZmp2oHtlTRjhiLH6jfNSc4TSX8f586MmSa07hbLrTjoD9eAagfc4pISNzCbL
 Pe8QBboDxVjs815LmPRkL2z3aPJ+zQujOkGi8lR5FJplLQXrCi8dITCcX2gm3VqcFVV116cSgMP
 dZ8IwTB9vayq9g27yp8uF84QkqKvLgnzi9Zf4fdd6dOpU7wxCm17c9DA9tn4srsa/8iXlCgBt4x
 cdAnk14IVqSGNbj9pzUeFyLGeh0cAJALyXYzX919t3scydnKnFz1KpjnJ16Eyai8q01Lc4e5htr
 CErVvdZI3eo1wPIr8sYyO06I3IBvKrYPKC86qA1fOYNQUVP9dn7J7LNakDqSX+4FHS2WwOJcyQV
 FgcPliz2zBpD/wwZtjw==
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a4f95e8 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=GcgE0A2xIZuYiG_mR3gA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEyMiBTYWx0ZWRfX8ezcg38R9Dbr
 e3B7GaTf/mf+eUy4gfVb0E36T/LFa6yr6ph0FBSYrN+ljZC7hptdlgwF1AIDeDmxoaCgqZLl8C5
 xJP+1r28ymYTz0EJbEhtLQ2FWMjvBrU=
X-Proofpoint-ORIG-GUID: LyF_fnOaQFS9RXQmHl1a5eCikY0X5aso
X-Proofpoint-GUID: LyF_fnOaQFS9RXQmHl1a5eCikY0X5aso
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090122
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67148-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 17A1F73119B

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
 arch/arm64/boot/dts/qcom/qcs8550.dtsi |  4 ++++
 arch/arm64/boot/dts/qcom/sm8550.dtsi  | 18 ++++++++++++++++--
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs8550.dtsi b/arch/arm64/boot/dts/qcom/qcs8550.dtsi
index f0acdd0b1e9384e684a90f7f49cf63633cd70d53..db0f539bc3d0a2e83b58b3929a05f0e44d9d513f 100644
--- a/arch/arm64/boot/dts/qcom/qcs8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8550.dtsi
@@ -158,5 +158,9 @@ mpss_dsm_mem: mpss-dsm-region@d4d00000 {
 			reg = <0x0 0xd4d00000 0x0 0x3300000>;
 			no-map;
 		};
+
+		iris_resv: reservation-iris {
+			iommu-addresses = <&iris_non_pixel 0x0 0x0 0x0 0x25800000>;
+		};
 	};
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 83136efb7724c3d74f9f377b1c8291d7378ac4a8..347d4a03b1ba419a2856a7c8ae98d6b26e90ad6b 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -1087,6 +1087,10 @@ hyp_ext_reserved_mem: hyp-ext-reserved-region@ff700000 {
 			reg = <0 0xff700000 0 0x100000>;
 			no-map;
 		};
+
+		iris_resv: reservation-iris {
+			iommu-addresses = <&iris_non_pixel 0x0 0x0 0x0 0x25800000>;
+		};
 	};
 
 	smp2p-adsp {
@@ -3690,10 +3694,11 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
 			reset-names = "bus";
 
-			iommus = <&apps_smmu 0x1940 0>,
-				 <&apps_smmu 0x1947 0>;
 			dma-coherent;
 
+			#address-cells = <2>;
+			#size-cells = <2>;
+
 			/*
 			 * IRIS firmware is signed by vendors, only
 			 * enable on boards where the proper signed firmware
@@ -3701,6 +3706,15 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
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


