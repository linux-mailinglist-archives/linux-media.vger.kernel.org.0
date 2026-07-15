Return-Path: <linux-media+bounces-67701-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NrHiFnyYV2qoXgAAu9opvQ
	(envelope-from <linux-media+bounces-67701-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 16:26:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C2175F5A1
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 16:26:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=lqlTzEc8;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=KBSERJR4;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67701-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67701-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E05DF32E4792
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 14:14:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 701454611C7;
	Wed, 15 Jul 2026 14:11:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF2B4611CF
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 14:11:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784124700; cv=none; b=c6a6b1jmN5+nPvXOGCOUYI+qY1sWM4P9fncXJTMeQEWqSRaY5goqncPuZRoiBEI92A/jJ6iODLNfBDd0krOz4AIlDRlNZs3qMEdF8zvA6aVAs/T3W1gntmc8DwdrZcfMZhoBOzv3iQGkHcrJOB7EcCZUvZAybcfVfjhK21w6j24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784124700; c=relaxed/simple;
	bh=ThEpJZbAgvG9pFpNsommlTVzoWTwpScz9NRkCoa7E7A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MSBxBroR3LT/e88n3bLDC0ZutRVy9CORElD8m546rkdCR4Zj3OXiksGSXXtxH6/NKJ7Z+kJPVYaE0EZvvFsGYp8yH+04FZwVPAaal8rRAQC+cEb3s5stWGKXjArBCRpXposNnpcsiUoU/1rPh9HYiYQe9OhAUMayomRnJ2UKLaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lqlTzEc8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KBSERJR4; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FE3Zw83775692
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 14:11:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vvV4pvswORAcEQzKnup026bCMWgfqp/zeG31LYavPqE=; b=lqlTzEc8uu+6lhsR
	p0PT64rERBqTMNOoaJ29a6OamYGcs15P0W1NSl5jmBE+oHGAuy8whoMotkIcVCLc
	sSLOiGyW7XYvwbNFsQ3G/Sf79WQivb4xRCMEdVHKzVdBfIRJDiRxX2m4LMBPXptr
	cYDuSJj8QUQ7N69uGtcVMQ+PjjdmFqg51rjRsf3CiE5X3mWY02BxVbsPtMf1Ce1/
	hkOXNPCtxk8eOPhqDbG6ChlI+02IUqWdO0ytswLBGtEFWYIkPOw0F3bD/ZLTFH0T
	8tGN8QEdcfwEm+N7ucXDUu5sOq/wAogG2UTBylrv8Zd2d+gYlByf4I4Ohbq0aaB6
	NB0bxA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe7ka948w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 14:11:38 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cceabd70f5so50740545ad.1
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 07:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784124698; x=1784729498; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vvV4pvswORAcEQzKnup026bCMWgfqp/zeG31LYavPqE=;
        b=KBSERJR4EibAhG5nqLAnNzfc8GZ/luHnRWfrz7dZH++ftYHBw2FU08Epx2jOT9ENa4
         Cpw3R7CBrgI9u5P1Lc5S8tFEn9gbK9vVfYLGG9Y/9fNTkVCdfmO9v+L7RZ9aNBi67Fy8
         nyM20QHGuxcknKmpp7slied6ET+SYFz11Q3lZhWaJwpaD4T0Kt3Jcjje47tVfa4AuMIk
         u5D74Z4DkZqWjWx1YzChJzwYTjvU6dHBPCX/AxG0eHGMOzzI0ENF/hWk6daAZzMxRd47
         Schef8Qd91F8nfXLFcP6BFWSsYb6yq/XA3DQhZ4DQpbNymm9le+123HKbh/X0d8MCrAP
         n/wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784124698; x=1784729498;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vvV4pvswORAcEQzKnup026bCMWgfqp/zeG31LYavPqE=;
        b=CmUxRZ7UyjK4X8zqmLvdXqw/ZQEMUSUoWfADLX1OQ6e3YP/yA8j03JrysvKsrUYxw5
         8r/B9w70TBfZQ3VoYwdLOOFC8Bw1Ip90ZnLjA//zawzXVeL7zuzDpE+S2xNKJzwiEOsq
         pqrWpPSwQsECmHvZx1MeB1mdRhbrSxq+KgrBaL4fO4sQJHIM41nCZ1dBMU3QJ5QJRsLt
         jr8oEyBT5fydOX+dYxnVJncsaCC+Fu6uu/X+RfC2L7+SD1eMJe+9s11xsJuuppzZbHGt
         OJ2yAKBwVTdBwblUGidBtIMOpVbbUxFqkz7w4vBUWItBDS5e2KAejAnTCAqSb2RZLmOw
         awEA==
X-Forwarded-Encrypted: i=1; AHgh+RoQFWan5UkeyQQTgNmEBMh46SpwK+yZnLTvrpDbCjfRABZB9d9BkLdFVGDmtGZH2LCyt1tWDHfGdJxkGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUnrwUdMOFXd2feY8VU62XmjCGlT6mQDwhHGofEt9yuNDWjReo
	kBJWD7OH8kadEQ5sy3ubEE55o5bWlCGk0t7QG7XEJHH9kdRzR4Mfjd9CNfRHx08voJeW4iju/2+
	mswOEiEtyBiIXGJBKz8XsqqOIiVmtQC6ZFxN7wa0QroaU/ZKMs4UGQF0WOLCg0mGTpA==
X-Gm-Gg: AfdE7cmx8eiOwGKsRYLBIHKLQ1uCPoh3N15V1Iht4Fk6CtS+0PmA+GM42e5MHhVOawE
	6oPuXqFhkq349WsWS2nlEztRuftQ8Y+YtT+NOA90YZdhZIRAund+fR7fZRA8v7l7CtmhtdRM/e3
	SgL2vmBBsMicg30Yx7lp/AyuPEwW6wvPl6Yy276lDlXmzggn/zU1yRs5YCRziq5BQ1Mzs3akAuT
	KgzT6/9uNWt465dO/24NyXC4xFA5q33vylDzryU0sJhD9wWrmwqAUjcI+kYCMF7PRIZCWxtSaSS
	q2ya2SS7ZLarumehr4YvWLknq6JZVFGFnDtDIfWTz0uTdPICsvlSTOpxEU4cBsP6PhXn+4t+/it
	p+uyncnzimzYFDVTkHGuFEY3Xd9EA1AkR9wF/rgzG7/ZO
X-Received: by 2002:a17:903:2347:b0:2c9:e961:d256 with SMTP id d9443c01a7336-2ce9ec0f113mr171957775ad.27.1784124697716;
        Wed, 15 Jul 2026 07:11:37 -0700 (PDT)
X-Received: by 2002:a17:903:2347:b0:2c9:e961:d256 with SMTP id d9443c01a7336-2ce9ec0f113mr171957285ad.27.1784124697088;
        Wed, 15 Jul 2026 07:11:37 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf1070b68dsm2913215ad.79.2026.07.15.07.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 07:11:36 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 19:40:07 +0530
Subject: [PATCH v9 13/14] arm64: dts: qcom: glymur: Add iris video node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-glymur-v9-13-8cf2cbe12a07@oss.qualcomm.com>
References: <20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com>
In-Reply-To: <20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784124602; l=4709;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=ThEpJZbAgvG9pFpNsommlTVzoWTwpScz9NRkCoa7E7A=;
 b=9ujYTpL9Bpg/XiFkL/oBYJbhhOvFR9zlKPdFHI1S6pIGQONr89kga4PtLHFj0EE4yrzDsfSGf
 vZClSs2ZlvwB4pDrCWWJ2drTRWol8wh8HdgdZllJG6oDbuMKh9gvFac
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=TMF1jVla c=1 sm=1 tr=0 ts=6a57951a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=6gKgyGQvtKUNEtbwe4YA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: TtQdY0XsCBjwsQy_7DHyG9Hw69TVIB1L
X-Proofpoint-ORIG-GUID: TtQdY0XsCBjwsQy_7DHyG9Hw69TVIB1L
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDE0MSBTYWx0ZWRfXxTSM7xn02mNG
 B2KHI1tP0AEPEP+US6NAV4MBEVvDz9l5HPqvnrB//lfIwSNu2i+CuhrssKv1fFFyWm9gKk+//uj
 OwhDtoOHMEjMnj4eBxOyd+ZLzAzFlLg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDE0MSBTYWx0ZWRfX5yyko66XGnao
 errKWeX1yaet0oxq4DmruyHnk8ftnAWMELvQIM/OAN+uLdC+MG23FFcoGgAC2d+3GYGeJFuuvhY
 T2xs9/pWsASB3klA/yu1K4spzlgqFSdo0SiF2fP/eaaIkmRxlrQk7q8asV9X3Xjhbe/ilkVRQt6
 ZtSIBOuJy7RJplyYNjcLJJ/rwM56tk2wcY7aIUcKD8+gIgtte9/4/VvxF0XvUo2Tb7ZFrtr/EVN
 VSslAOzQ/wbH7LC1xnSGvvMcgg90gC+rdWF4XlrzI8GbCuifpF2woq+MJ1M72TeuEFv3gtp1C/s
 RkooRTfny4NC+EY2nDfclBbGZqVsypevwwR/8HUBO4O0+80Z/FuiNaLbe/qxfAV3UF+GZRof5/F
 UDNK8KzWcCVcDuwXL7d20Xu5Kbt2mQn1FuPy6H3+rK/j7B2rGHRkXt0R84VnIJoZ/IoHood4Slv
 VjRsLpef1wrQe9dNKBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150141
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67701-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:mchehab@kernel.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:stanimir.k.varbanov@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:stanimirkvarbanov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B1C2175F5A1
X-Rspamd-Action: no action

Add iris video codec to glymur SoC, which comes with significantly
different powering up sequence than previous platforms, thus different
clocks and resets.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 128 +++++++++++++++++++++++++++++++++++
 1 file changed, 128 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 55d91c696a3a..0c09e700f6b5 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -695,6 +695,10 @@ adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
 			alignment = <0x0 0x400000>;
 			size = <0x0 0x800000>;
 		};
+
+		iris_resv: reservation-iris {
+			iommu-addresses = <&iris_non_pixel 0x0 0x0 0x0 0x25800000>;
+		};
 	};
 
 	smp2p-adsp {
@@ -5321,6 +5325,130 @@ mdss_dp3_out: endpoint {
 			};
 		};
 
+		iris: video-codec@aa00000 {
+			compatible = "qcom,glymur-iris";
+			reg = <0x0 0x0aa00000 0x0 0xf0000>;
+
+			clocks = <&gcc GCC_VIDEO_AXI0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0_CLK>,
+				 <&gcc GCC_VIDEO_AXI0_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK>,
+				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK>,
+				 <&gcc GCC_VIDEO_AXI1_CLK>,
+				 <&videocc VIDEO_CC_MVS1_CLK>,
+				 <&videocc VIDEO_CC_MVS1_FREERUN_CLK>;
+			clock-names = "core_iface",
+				      "core",
+				      "vcodec0_core",
+				      "vcodec0_iface",
+				      "core_freerun",
+				      "vcodec0_core_freerun",
+				      "vcodec1_iface",
+				      "vcodec1_core",
+				      "vcodec1_core_freerun";
+
+			dma-coherent;
+
+			interconnects = <&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_VIDEO QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "cpu-cfg",
+					     "video-mem";
+
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+			memory-region = <&video_mem>;
+
+			operating-points-v2 = <&iris_opp_table>;
+
+			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
+					<&videocc VIDEO_CC_MVS0_GDSC>,
+					<&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_MMCX>,
+					<&videocc VIDEO_CC_MVS1_GDSC>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mxc",
+					     "mmcx",
+					     "vcodec1";
+
+			resets = <&gcc GCC_VIDEO_AXI0C_CLK_ARES>,
+				 <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK_ARES>,
+				 <&gcc GCC_VIDEO_AXI1_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS1_FREERUN_CLK_ARES>;
+			reset-names = "core_bus",
+				      "vcodec0_bus",
+				      "core",
+				      "vcodec0_core",
+				      "vcodec1_bus",
+				      "vcodec1_core";
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+
+			/*
+			 * IRIS firmware is signed by vendors, only
+			 * enable on boards where the proper signed firmware
+			 * is available.
+			 */
+			status = "disabled";
+
+			iris_non_pixel: non-pixel {
+				iommus = <&apps_smmu 0x1940 0x0>,
+					 <&apps_smmu 0x1944 0x0>,
+					 <&apps_smmu 0x19e0 0x0>;
+				memory-region = <&iris_resv>;
+			};
+
+			pixel {
+				iommus = <&apps_smmu 0x1943 0x0>;
+			};
+
+			iris_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000 240000000 360000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_low_svs>;
+				};
+
+				opp-338000000 {
+					opp-hz = /bits/ 64 <338000000 338000000 507000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_svs>;
+				};
+
+				opp-366000000 {
+					opp-hz = /bits/ 64 <366000000 366000000 549000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-444000000 {
+					opp-hz = /bits/ 64 <444000000 444000000 666000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_nom>;
+				};
+
+				opp-533333334 {
+					opp-hz = /bits/ 64 <533333334 533333334 800000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_turbo>;
+				};
+
+				opp-655000000 {
+					opp-hz = /bits/ 64 <655000000 655000000 982000000>;
+					required-opps = <&rpmhpd_opp_nom>,
+							<&rpmhpd_opp_turbo_l1>;
+				};
+			};
+		};
+
 		videocc: clock-controller@aaf0000 {
 			compatible = "qcom,glymur-videocc";
 			reg = <0x0 0x0aaf0000 0x0 0x10000>;

-- 
2.34.1


