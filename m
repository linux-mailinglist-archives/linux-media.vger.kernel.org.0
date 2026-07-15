Return-Path: <linux-media+bounces-67695-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vfGMEQ6WV2oPXgAAu9opvQ
	(envelope-from <linux-media+bounces-67695-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 16:15:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CFF75F3EC
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 16:15:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YJppYkM3;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ckDUc9nq;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67695-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67695-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9D16C3075755
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 14:12:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A64F37F8C2;
	Wed, 15 Jul 2026 14:11:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9352037CD2C
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 14:11:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784124663; cv=none; b=JI9iD1GaOFc0EI9iBdEX0igA+WtqLs6YSWxmm0kEf7mYgHbhs1J4wB9iPUBYvAGjGa/jzyjYGplUBSbIemqk6ycxZQ6ufuVCuEjd0QG5OuYCboEFE74P4SAzUAGLUo/1xRRVfrvBxF3ycdy5PER1vPZkCLpcKnWxTMUCH5VQmek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784124663; c=relaxed/simple;
	bh=7242Y0iw4NSOYIhVK1zpZvQSQU4cWJ9dObzrJoH9mdM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u4dCStwiirmno/BqEO8w2dcgRnl4ttLDR/Vmy8hXChCMl8hkPkC6OaDLIPYUCQQp5gXkE80tC1CgnCfriMo8bzS5RJmXpbub4tzY21yWITdPc/P2WuF2R4ZlmYvQGd0U25cqv2STstueS1GhwqU4epo1znsd3R0ruqCqsOrxj6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YJppYkM3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ckDUc9nq; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FE3Yda4097330
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 14:11:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DmrbTTohhGCukdUlYLk+eYL+AStMAIy/qbQaNaI5pWk=; b=YJppYkM3okcKjDUS
	HTKTsyClf2CDRd1Ocr4wsYzsn8gd3gW6tfmyhkZd7Nv/ngofXpDglrakKb+aTcI4
	aDKuZBkrGXMFvL0Tr9GONoKkJN6U5aa767oSn40G0pVGgMOj1onJ2Ue9+EYnoVmG
	Xk2Lb2U5XpzD7vKOF/Mgwjk+LKSLx0p6OsA0oMI0iYLeeGA9PSgZuLbVFGs6vgb4
	VPpXkAqJEBh/EQFaWMMcoQN0SNbQ64Wver/0t25k7SsveFXhbyy8TXy5evmChBFf
	HuezTNy8INMPRZIS2ucfxvIvaMw34vvb26pZCcOxSuY/NNhl18l3ZsNCmDr5NvYY
	bxsP9A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe8558ygx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 14:10:59 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cceabd70f5so50718025ad.1
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 07:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784124659; x=1784729459; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DmrbTTohhGCukdUlYLk+eYL+AStMAIy/qbQaNaI5pWk=;
        b=ckDUc9nqyEZFjh/KrMfE8rTC3g4/raLJ6F+DA9IOfze8y8Pf51XX1hyaTPFi5Ezr8D
         qDYThaKeWmycUpFQIyNH8PbInebrS28tj6Ag38+7arR/RcjWGVLeM6ke1MhYd/v5P6rO
         EvrOsOCdRpswGEO9C6qspKpJhazB5Hs4QXaahkfK7H+d23axfLTVqW4Ny3NdOv9j6wtm
         MfDS3sZmTgFtO9vvKNVbIGFM2npy8zIIRx6TDO+R8a+cj53jka6EU23RFnqwGrxlEkju
         AIktpfLxDQwlQs38jFm5jp8Owt3cBghDhT5bX+nfl1axZQ46GD8kUTAzHdzARu78/zw2
         NyJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784124659; x=1784729459;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DmrbTTohhGCukdUlYLk+eYL+AStMAIy/qbQaNaI5pWk=;
        b=T3B8QxdtlnnZCIY/6YYsJ5y2fZbTogQ6S4C0IV7UQbBZOPlapy0OluqpsEnZpDQU3Q
         VQh2lKaPDcxmU44aWdFqNzB31b49/kf2pnxivjdIDoElopIWFlZqyWYOjnoDhroCVwB2
         ZkG0PlLxvlqvJxyI7FCDeLwTF+N2cinzDeeZw/GkLOTRwhAPCvFlTPAe9p7zqANhvleW
         wG3iWJQGiz7W9IAYRXF0OZIMI4eCKj0kpGNnan3yRsgyPE86sKHszeoOMvscJ+dlv6fE
         9IiZ1XrLe/OCMNMpR2Z5dCrlbd2KsXdFlC0FCaWCpEnUxTWJo+45XemOPUTeIuH0f9Ha
         1jdw==
X-Forwarded-Encrypted: i=1; AHgh+RoUPvzH0FurL2BW9QwH52NjX838hO1OhzfNHRkBvJk6oJHJeXs+gc2UQDLe9D7F9hbEhGiVFNyDr+tU0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhhUjddddQfxZ1UwH1+/LnUotpv+t2hgW8MpOob7OqOH7Thkt6
	MOlMLJ0PL01N/M/uSxjCAqxMVMwCAAXHQwrsw4U7nOQebKtqP08yVjwYc/gxbtVKMWV7LbjbMgm
	jolTTo/xwKX3MtpXqNHqLrd+E58vlsYqohWoNeXpsBdBwc6ErQhF+Rbw7RjninIBbKRaCBb8bkQ
	==
X-Gm-Gg: AfdE7cmhldbyh1e42dSTIc/OUFrcDbQlF1m9aZPhkDPZy3n6+5Kz42BcTwBqaSlOGJX
	FcR4w6tI7+bSLYUb/j8WUaWEfaepJNZc/i5jFvQlK05grUeNtsvZmiSPfNuv2tCGZlncfU+U+8d
	hi3iBT8eWLQsQtltsvGnZoJ39wifZGgSQppPbUvBap+c921kOFQWHYQosMkM+zpk2NNgBvTZz5a
	9oS4d8awEcqmvYDaYqYDdTH4nkbKvinhN0Ih6iSTz0I1w65C1UlaetXOx/UYMmbpcOMgNHLu2TL
	kX9Zr3ya2qddoW3O659syTFtgXdj/lQQdGoLKYZk7mCQDm9wDwhIs0ReLxJbayHP8aQUK8NHYOA
	AisQWF/Pu7gp5juKgh7eDExy7ny8vG9lHNUD1jmVwYyAG
X-Received: by 2002:a17:902:ef0a:b0:2ca:9ab:e725 with SMTP id d9443c01a7336-2ce9e59d62cmr183257195ad.1.1784124658181;
        Wed, 15 Jul 2026 07:10:58 -0700 (PDT)
X-Received: by 2002:a17:902:ef0a:b0:2ca:9ab:e725 with SMTP id d9443c01a7336-2ce9e59d62cmr183256675ad.1.1784124657410;
        Wed, 15 Jul 2026 07:10:57 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf1070b68dsm2913215ad.79.2026.07.15.07.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 07:10:57 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 19:40:01 +0530
Subject: [PATCH v9 07/14] media: iris: Replace enum-indexed clock and power
 domain tables with per-block structures
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-glymur-v9-7-8cf2cbe12a07@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784124602; l=43859;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=7242Y0iw4NSOYIhVK1zpZvQSQU4cWJ9dObzrJoH9mdM=;
 b=9edwqcZCBZ7R2CAW2oSkVZTP1WloqYrusLMMQd3pgQGAg5EBW/Oy8PQFbqLrYRcWGHlc9O8uJ
 gs3nGiBe8yWAqnyv3zCSGn/nVKLgVFYdCyzt0yaV4S7M4ir0W33UChI
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: FGX7nR2r1ysUOVQxFkqde_VyosXUFv6Z
X-Authority-Analysis: v=2.4 cv=KOlqylFo c=1 sm=1 tr=0 ts=6a5794f3 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=oG6sQh-P3z_XRahHWLcA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDE0MSBTYWx0ZWRfX5/82TO6/l0CR
 Yc7R1Wmd1g8P7qbF5fqAHIUlmlPWDvo5mR7wwWZQWHkPSulnhvWhQ4WCiQeIbwU4OKo0gBQDCJ+
 1awBywcsfGJpey6We6M0wAL9jsZ5R+7jtQsRVr1NUYXLQ3Wt3GJNC+AUcHPlgRT040Zi0Bwvt0S
 2IrxytLMl/5Ds/MSdKFWQU3EGt5yhNq0bqKry4tMGZVdfW70R/kk6IlQS4saUnhTJl3YRfkDpqk
 T5zu+7fjpfAuWrvCnDQ05AGuVBdH0RMVq0bX8ep8FzoEKgb9qAn2tq00CC2Z4CCD8FI4ENOwlgJ
 wNS9JwlSS31foSNs3Bux3v1eEjdT9CI6GKPIowGcRMsKOTM6nUy5Kw/4syEBr/bFg7kSl0XEw6x
 RwvSeYmsGpwfR8oZW+dg0UWe65AxMPnWVrlnKYb/LxUArELbofJZyZAvh/ynFQCuJuS23CLCuAM
 UEMbNB+GseefYiyea+w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDE0MSBTYWx0ZWRfXxo5P7agwL9bi
 FomEPwfW68IGeXbHQfLAUkXg3p+BihEGSIQ6fcAAKwq2lrBRl0DM5lZiyVv0qnx/jTjjbDsvfcd
 L32Si78LN209xpX00lUS73ltB2q8CpU=
X-Proofpoint-ORIG-GUID: FGX7nR2r1ysUOVQxFkqde_VyosXUFv6Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150141
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67695-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:mchehab@kernel.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:stanimir.k.varbanov@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:stanimirkvarbanov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
X-Rspamd-Queue-Id: D8CFF75F3EC
X-Rspamd-Action: no action

As new platforms are added, the platform_clk_type and
platform_pm_domain_type enums keep growing. Every new clock or
power domain requires a new enum entry, and every enable/disable
path has to loop through the clock table to find the right clock
by enum value, adding overhead and boilerplate on each path.
The enum index space is also shared across all hardware blocks.
On the Glymur platform, the VPP0 index for VPU4x and the VCODEC1
index clash, making it error-prone to extend support without
breaking existing platforms.
Replace the flat tables and enum-based lookups with
iris_power_domain, which bundles a power domain device and its
associated clocks together per hardware block. Platform data
describes each block via iris_power_domain_data, and the enable
and disable helpers operate directly on an iris_power_domain
instance, removing the need for any index lookup at runtime.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.h       |  23 +++-
 .../platform/qcom/iris/iris_platform_common.h      |  41 ++----
 .../platform/qcom/iris/iris_platform_sc7280.h      |  28 ++++-
 .../platform/qcom/iris/iris_platform_sm8250.h      |  26 +++-
 .../platform/qcom/iris/iris_platform_sm8550.h      |  26 +++-
 .../platform/qcom/iris/iris_platform_sm8750.h      |  29 +++--
 .../media/platform/qcom/iris/iris_platform_vpu2.c  |  14 +--
 .../media/platform/qcom/iris/iris_platform_vpu3x.c |  32 ++---
 .../platform/qcom/iris/iris_platform_x1p42100.h    |  27 +++-
 drivers/media/platform/qcom/iris/iris_probe.c      | 134 ++++++++++++++++++--
 drivers/media/platform/qcom/iris/iris_resources.c  |  82 +++++-------
 drivers/media/platform/qcom/iris/iris_resources.h  |   8 +-
 drivers/media/platform/qcom/iris/iris_vpu3x.c      |  37 +-----
 drivers/media/platform/qcom/iris/iris_vpu4x.c      | 137 +++------------------
 drivers/media/platform/qcom/iris/iris_vpu_common.c |  98 ++-------------
 15 files changed, 341 insertions(+), 401 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index 5ed2ec0b97ec..f528f53f20fc 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -16,6 +16,13 @@
 #include "iris_resources.h"
 #include "iris_state.h"
 
+struct iris_power_domain {
+	struct device		**dev;
+	unsigned int		pd_cnt;
+	struct clk_bulk_data	*clocks;
+	unsigned int		clk_cnt;
+};
+
 struct icc_info {
 	const char		*name;
 	u32			bw_min_kbps;
@@ -51,10 +58,12 @@ struct qcom_ubwc_cfg_data;
  * @iris_vb2_ops: iris vb2 ops
  * @icc_tbl: table of iris interconnects
  * @icc_count: count of iris interconnects
- * @pmdomain_tbl: table of iris power domains
+ * @ctrl: power domain and clocks for the controller
+ * @vcodec: power domain and clocks for the vcodec
+ * @vcodec_vpp0: power domain and clocks for the vcodec VPP0
+ * @vcodec_vpp1: power domain and clocks for the vcodec VPP1
+ * @apv: power domain and clocks for the APV hardware block
  * @opp_pmdomain_tbl: table of opp power domains
- * @clock_tbl: table of iris clocks
- * @clk_count: count of iris clocks
  * @resets: table of iris reset clocks
  * @controller_resets: table of controller reset clocks
  * @iris_platform_data: a structure for platform data
@@ -100,10 +109,12 @@ struct iris_core {
 	const struct vb2_ops			*iris_vb2_ops;
 	struct icc_bulk_data			*icc_tbl;
 	u32					icc_count;
-	struct dev_pm_domain_list		*pmdomain_tbl;
+	struct iris_power_domain		*ctrl;
+	struct iris_power_domain		*vcodec;
+	struct iris_power_domain		*vcodec_vpp0;
+	struct iris_power_domain		*vcodec_vpp1;
+	struct iris_power_domain		*apv;
 	struct dev_pm_domain_list		*opp_pmdomain_tbl;
-	struct clk_bulk_data			*clock_tbl;
-	u32					clk_count;
 	struct reset_control_bulk_data		*resets;
 	struct reset_control_bulk_data		*controller_resets;
 	const struct iris_platform_data		*iris_platform_data;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index c9256f2323dc..99f59b64f853 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -61,26 +61,6 @@ extern const struct iris_platform_data sm8650_data;
 extern const struct iris_platform_data sm8750_data;
 extern const struct iris_platform_data x1p42100_data;
 
-enum platform_clk_type {
-	IRIS_AXI_CLK, /* AXI0 in case of platforms with multiple AXI clocks */
-	IRIS_CTRL_CLK,
-	IRIS_AHB_CLK,
-	IRIS_HW_CLK,
-	IRIS_HW_AHB_CLK,
-	IRIS_AXI1_CLK,
-	IRIS_CTRL_FREERUN_CLK,
-	IRIS_HW_FREERUN_CLK,
-	IRIS_BSE_HW_CLK,
-	IRIS_VPP0_HW_CLK,
-	IRIS_VPP1_HW_CLK,
-	IRIS_APV_HW_CLK,
-};
-
-struct platform_clk_data {
-	enum platform_clk_type clk_type;
-	const char *clk_name;
-};
-
 struct tz_cp_config {
 	u32 cp_start;
 	u32 cp_size;
@@ -228,12 +208,11 @@ struct icc_vote_data {
 	u32 fps;
 };
 
-enum platform_pm_domain_type {
-	IRIS_CTRL_POWER_DOMAIN,
-	IRIS_HW_POWER_DOMAIN,
-	IRIS_VPP0_HW_POWER_DOMAIN,
-	IRIS_VPP1_HW_POWER_DOMAIN,
-	IRIS_APV_HW_POWER_DOMAIN,
+struct iris_power_domain_data {
+	const char * const *pd_names;
+	unsigned int pd_cnt;
+	const char * const *clk_names;
+	unsigned int clk_cnt;
 };
 
 struct iris_firmware_data {
@@ -300,13 +279,14 @@ struct iris_platform_data {
 	unsigned int icc_tbl_size;
 	const struct bw_info *bw_tbl_dec;
 	unsigned int bw_tbl_dec_size;
-	const char * const *pmdomain_tbl;
-	unsigned int pmdomain_tbl_size;
+	const struct iris_power_domain_data *ctrl_data;
+	const struct iris_power_domain_data *vcodec_data;
+	const struct iris_power_domain_data *vcodec_vpp0_data;
+	const struct iris_power_domain_data *vcodec_vpp1_data;
+	const struct iris_power_domain_data *apv_data;
 	const char * const *opp_pd_tbl;
 	unsigned int opp_pd_tbl_size;
-	const struct platform_clk_data *clk_tbl;
 	const char * const *opp_clk_tbl;
-	unsigned int clk_tbl_size;
 	const char * const *clk_rst_tbl;
 	unsigned int clk_rst_tbl_size;
 	const char * const *controller_rst_tbl;
@@ -320,6 +300,7 @@ struct iris_platform_data {
 	u32 num_vpp_pipe;
 	bool no_aon;
 	u32 max_session_count;
+	u32 num_cores;
 	/* max number of macroblocks per frame supported */
 	u32 max_core_mbpf;
 	/* max number of macroblocks per second supported */
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sc7280.h b/drivers/media/platform/qcom/iris/iris_platform_sc7280.h
index 0ec8f334df67..f19547a8a51d 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sc7280.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_sc7280.h
@@ -15,12 +15,28 @@ static const struct bw_info sc7280_bw_table_dec[] = {
 
 static const char * const sc7280_opp_pd_table[] = { "cx" };
 
-static const struct platform_clk_data sc7280_clk_table[] = {
-	{IRIS_CTRL_CLK,    "core"         },
-	{IRIS_AXI_CLK,     "iface"        },
-	{IRIS_AHB_CLK,     "bus"          },
-	{IRIS_HW_CLK,      "vcodec_core"  },
-	{IRIS_HW_AHB_CLK,  "vcodec_bus"   },
+static const struct iris_power_domain_data sc7280_ctrl_data = {
+	.pd_names = (const char *[]) {
+		"venus",
+	},
+	.pd_cnt = 1,
+	.clk_names = (const char *[]) {
+		"iface", "core", "bus",
+	},
+	.clk_cnt = 3,
+};
+
+static const struct iris_power_domain_data sc7280_vcodec_data[] = {
+	{
+		.pd_names = (const char *[]) {
+			"vcodec0",
+		},
+		.pd_cnt = 1,
+		.clk_names = (const char *[]) {
+			"vcodec_core", "vcodec_bus",
+		},
+		.clk_cnt = 2,
+	},
 };
 
 static const char * const sc7280_opp_clk_table[] = {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.h b/drivers/media/platform/qcom/iris/iris_platform_sm8250.h
index 50306043eb8e..7674cf9a330f 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.h
@@ -15,10 +15,28 @@ static const struct bw_info sm8250_bw_table_dec[] = {
 
 static const char * const sm8250_opp_pd_table[] = { "mx", "mmcx" };
 
-static const struct platform_clk_data sm8250_clk_table[] = {
-	{IRIS_AXI_CLK,  "iface"        },
-	{IRIS_CTRL_CLK, "core"         },
-	{IRIS_HW_CLK,   "vcodec0_core" },
+static const struct iris_power_domain_data sm8250_ctrl_data = {
+	.pd_names = (const char *[]) {
+		"venus",
+	},
+	.pd_cnt = 1,
+	.clk_names = (const char *[]) {
+		"iface", "core",
+	},
+	.clk_cnt = 2,
+};
+
+static const struct iris_power_domain_data sm8250_vcodec_data[] = {
+	{
+		.pd_names = (const char *[]) {
+			"vcodec0",
+		},
+		.pd_cnt = 1,
+		.clk_names = (const char *[]) {
+			"vcodec0_core",
+		},
+		.clk_cnt = 1,
+	},
 };
 
 static const char * const sm8250_opp_clk_table[] = {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.h b/drivers/media/platform/qcom/iris/iris_platform_sm8550.h
index 3c9dae995bb2..71de71a75e95 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8550.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.h
@@ -8,10 +8,28 @@
 
 static const char * const sm8550_clk_reset_table[] = { "bus" };
 
-static const struct platform_clk_data sm8550_clk_table[] = {
-	{IRIS_AXI_CLK,  "iface"        },
-	{IRIS_CTRL_CLK, "core"         },
-	{IRIS_HW_CLK,   "vcodec0_core" },
+static const struct iris_power_domain_data sm8550_ctrl_data = {
+	.pd_names = (const char *[]) {
+		"venus",
+	},
+	.pd_cnt = 1,
+	.clk_names = (const char *[]) {
+		"iface", "core",
+	},
+	.clk_cnt = 2,
+};
+
+static const struct iris_power_domain_data sm8550_vcodec_data[] = {
+	{
+		.pd_names = (const char *[]) {
+			"vcodec0",
+		},
+		.pd_cnt = 1,
+		.clk_names = (const char *[]) {
+			"vcodec0_core",
+		},
+		.clk_cnt = 1,
+	},
 };
 
 static struct platform_inst_caps platform_inst_cap_sm8550 = {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8750.h b/drivers/media/platform/qcom/iris/iris_platform_sm8750.h
index 719056656a5b..45ab78781f4a 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8750.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8750.h
@@ -10,13 +10,28 @@ static const char * const sm8750_clk_reset_table[] = {
 	"bus0", "bus1", "core", "vcodec0_core"
 };
 
-static const struct platform_clk_data sm8750_clk_table[] = {
-	{IRIS_AXI_CLK,		"iface"			},
-	{IRIS_CTRL_CLK,		"core"			},
-	{IRIS_HW_CLK,		"vcodec0_core"		},
-	{IRIS_AXI1_CLK,		"iface1"		},
-	{IRIS_CTRL_FREERUN_CLK,	"core_freerun"		},
-	{IRIS_HW_FREERUN_CLK,	"vcodec0_core_freerun"	},
+static const struct iris_power_domain_data sm8750_ctrl_data = {
+	.pd_names = (const char *[]) {
+		"venus",
+	},
+	.pd_cnt = 1,
+	.clk_names = (const char *[]) {
+		"iface1", "core_freerun", "core",
+	},
+	.clk_cnt = 3,
+};
+
+static const struct iris_power_domain_data sm8750_vcodec_data[] = {
+	{
+		.pd_names = (const char *[]) {
+			"vcodec0",
+		},
+		.pd_cnt = 1,
+		.clk_names = (const char *[]) {
+			"iface", "vcodec0_core_freerun", "vcodec0_core",
+		},
+		.clk_cnt = 3,
+	},
 };
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
index 6e06a32822bb..c381a40da9ba 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
@@ -53,8 +53,6 @@ static const struct icc_info iris_icc_info_vpu2[] = {
 
 static const char * const iris_clk_reset_table_vpu2[] = { "bus", "core" };
 
-static const char * const iris_pmdomain_table_vpu2[] = { "venus", "vcodec0" };
-
 static const struct tz_cp_config tz_cp_config_vpu2[] = {
 	{
 		.cp_start = 0,
@@ -71,12 +69,10 @@ const struct iris_platform_data sc7280_data = {
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu2),
 	.bw_tbl_dec = sc7280_bw_table_dec,
 	.bw_tbl_dec_size = ARRAY_SIZE(sc7280_bw_table_dec),
-	.pmdomain_tbl = iris_pmdomain_table_vpu2,
-	.pmdomain_tbl_size = ARRAY_SIZE(iris_pmdomain_table_vpu2),
+	.ctrl_data = &sc7280_ctrl_data,
+	.vcodec_data = sc7280_vcodec_data,
 	.opp_pd_tbl = sc7280_opp_pd_table,
 	.opp_pd_tbl_size = ARRAY_SIZE(sc7280_opp_pd_table),
-	.clk_tbl = sc7280_clk_table,
-	.clk_tbl_size = ARRAY_SIZE(sc7280_clk_table),
 	.opp_clk_tbl = sc7280_opp_clk_table,
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
@@ -102,12 +98,10 @@ const struct iris_platform_data sm8250_data = {
 	.clk_rst_tbl_size = ARRAY_SIZE(iris_clk_reset_table_vpu2),
 	.bw_tbl_dec = sm8250_bw_table_dec,
 	.bw_tbl_dec_size = ARRAY_SIZE(sm8250_bw_table_dec),
-	.pmdomain_tbl = iris_pmdomain_table_vpu2,
-	.pmdomain_tbl_size = ARRAY_SIZE(iris_pmdomain_table_vpu2),
+	.ctrl_data = &sm8250_ctrl_data,
+	.vcodec_data = sm8250_vcodec_data,
 	.opp_pd_tbl = sm8250_opp_pd_table,
 	.opp_pd_tbl_size = ARRAY_SIZE(sm8250_opp_pd_table),
-	.clk_tbl = sm8250_clk_table,
-	.clk_tbl_size = ARRAY_SIZE(sm8250_clk_table),
 	.opp_clk_tbl = sm8250_opp_clk_table,
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
index 2c63adbc5579..72dd23dbe02a 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -67,8 +67,6 @@ static const struct bw_info iris_bw_table_dec_vpu3x[] = {
 	{ ((1920 * 1080) / 256) * 30,  294000 },
 };
 
-static const char * const iris_pmdomain_table_vpu3x[] = { "venus", "vcodec0" };
-
 static const char * const iris_opp_pd_table_vpu3x[] = { "mxc", "mmcx" };
 
 static const char * const iris_opp_clk_table_vpu3x[] = {
@@ -98,12 +96,10 @@ const struct iris_platform_data qcs8300_data = {
 	.clk_rst_tbl_size = ARRAY_SIZE(sm8550_clk_reset_table),
 	.bw_tbl_dec = iris_bw_table_dec_vpu3x,
 	.bw_tbl_dec_size = ARRAY_SIZE(iris_bw_table_dec_vpu3x),
-	.pmdomain_tbl = iris_pmdomain_table_vpu3x,
-	.pmdomain_tbl_size = ARRAY_SIZE(iris_pmdomain_table_vpu3x),
+	.ctrl_data = &sm8550_ctrl_data,
+	.vcodec_data = sm8550_vcodec_data,
 	.opp_pd_tbl = iris_opp_pd_table_vpu3x,
 	.opp_pd_tbl_size = ARRAY_SIZE(iris_opp_pd_table_vpu3x),
-	.clk_tbl = sm8550_clk_table,
-	.clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
 	.opp_clk_tbl = iris_opp_clk_table_vpu3x,
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
@@ -127,12 +123,10 @@ const struct iris_platform_data sm8550_data = {
 	.clk_rst_tbl_size = ARRAY_SIZE(sm8550_clk_reset_table),
 	.bw_tbl_dec = iris_bw_table_dec_vpu3x,
 	.bw_tbl_dec_size = ARRAY_SIZE(iris_bw_table_dec_vpu3x),
-	.pmdomain_tbl = iris_pmdomain_table_vpu3x,
-	.pmdomain_tbl_size = ARRAY_SIZE(iris_pmdomain_table_vpu3x),
+	.ctrl_data = &sm8550_ctrl_data,
+	.vcodec_data = sm8550_vcodec_data,
 	.opp_pd_tbl = iris_opp_pd_table_vpu3x,
 	.opp_pd_tbl_size = ARRAY_SIZE(iris_opp_pd_table_vpu3x),
-	.clk_tbl = sm8550_clk_table,
-	.clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
 	.opp_clk_tbl = iris_opp_clk_table_vpu3x,
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
@@ -164,12 +158,10 @@ const struct iris_platform_data sm8650_data = {
 	.controller_rst_tbl_size = ARRAY_SIZE(sm8650_controller_reset_table),
 	.bw_tbl_dec = iris_bw_table_dec_vpu3x,
 	.bw_tbl_dec_size = ARRAY_SIZE(iris_bw_table_dec_vpu3x),
-	.pmdomain_tbl = iris_pmdomain_table_vpu3x,
-	.pmdomain_tbl_size = ARRAY_SIZE(iris_pmdomain_table_vpu3x),
+	.ctrl_data = &sm8550_ctrl_data,
+	.vcodec_data = sm8550_vcodec_data,
 	.opp_pd_tbl = iris_opp_pd_table_vpu3x,
 	.opp_pd_tbl_size = ARRAY_SIZE(iris_opp_pd_table_vpu3x),
-	.clk_tbl = sm8550_clk_table,
-	.clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
 	.opp_clk_tbl = iris_opp_clk_table_vpu3x,
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
@@ -193,12 +185,10 @@ const struct iris_platform_data sm8750_data = {
 	.clk_rst_tbl_size = ARRAY_SIZE(sm8750_clk_reset_table),
 	.bw_tbl_dec = iris_bw_table_dec_vpu3x,
 	.bw_tbl_dec_size = ARRAY_SIZE(iris_bw_table_dec_vpu3x),
-	.pmdomain_tbl = iris_pmdomain_table_vpu3x,
-	.pmdomain_tbl_size = ARRAY_SIZE(iris_pmdomain_table_vpu3x),
+	.ctrl_data = &sm8750_ctrl_data,
+	.vcodec_data = sm8750_vcodec_data,
 	.opp_pd_tbl = iris_opp_pd_table_vpu3x,
 	.opp_pd_tbl_size = ARRAY_SIZE(iris_opp_pd_table_vpu3x),
-	.clk_tbl = sm8750_clk_table,
-	.clk_tbl_size = ARRAY_SIZE(sm8750_clk_table),
 	.opp_clk_tbl = iris_opp_clk_table_vpu3x,
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
@@ -228,12 +218,10 @@ const struct iris_platform_data x1p42100_data = {
 	.clk_rst_tbl_size = ARRAY_SIZE(sm8550_clk_reset_table),
 	.bw_tbl_dec = iris_bw_table_dec_vpu3x,
 	.bw_tbl_dec_size = ARRAY_SIZE(iris_bw_table_dec_vpu3x),
-	.pmdomain_tbl = iris_pmdomain_table_vpu3x,
-	.pmdomain_tbl_size = ARRAY_SIZE(iris_pmdomain_table_vpu3x),
+	.ctrl_data = &x1p42100_ctrl_data,
+	.vcodec_data = x1p42100_vcodec_data,
 	.opp_pd_tbl = iris_opp_pd_table_vpu3x,
 	.opp_pd_tbl_size = ARRAY_SIZE(iris_opp_pd_table_vpu3x),
-	.clk_tbl = x1p42100_clk_table,
-	.clk_tbl_size = ARRAY_SIZE(x1p42100_clk_table),
 	.opp_clk_tbl = x1p42100_opp_clk_table,
 	/* Upper bound of DMA address range */
 	.dma_mask = 0xe0000000 - 1,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_x1p42100.h b/drivers/media/platform/qcom/iris/iris_platform_x1p42100.h
index d89acfbc1233..3444c1c3012b 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_x1p42100.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_x1p42100.h
@@ -6,11 +6,28 @@
 #ifndef __IRIS_PLATFORM_X1P42100_H__
 #define __IRIS_PLATFORM_X1P42100_H__
 
-static const struct platform_clk_data x1p42100_clk_table[] = {
-	{IRIS_AXI_CLK,		"iface"			},
-	{IRIS_CTRL_CLK,		"core"			},
-	{IRIS_HW_CLK,		"vcodec0_core"		},
-	{IRIS_BSE_HW_CLK,	"vcodec0_bse"		},
+static const struct iris_power_domain_data x1p42100_ctrl_data = {
+	.pd_names = (const char *[]) {
+		"venus",
+	},
+	.pd_cnt = 1,
+	.clk_names = (const char *[]) {
+		"iface", "core",
+	},
+	.clk_cnt = 2,
+};
+
+static const struct iris_power_domain_data x1p42100_vcodec_data[] = {
+	{
+		.pd_names = (const char *[]) {
+			"vcodec0",
+		},
+		.pd_cnt = 1,
+		.clk_names = (const char *[]) {
+			"vcodec0_core", "vcodec0_bse",
+		},
+		.clk_cnt = 2,
+	},
 };
 
 static const char *const x1p42100_opp_clk_table[] = {
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index c40c4ec44e83..9e96fa218dea 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -40,15 +40,42 @@ static int iris_init_icc(struct iris_core *core)
 	return devm_of_icc_bulk_get(core->dev, core->icc_count, core->icc_tbl);
 }
 
-static int iris_init_power_domains(struct iris_core *core)
+static int iris_init_power_domains_per_block(struct iris_core *core,
+					     struct iris_power_domain *pd,
+					     const struct iris_power_domain_data *pd_data)
 {
-	int ret;
+	struct dev_pm_domain_attach_data iris_pd_data = {};
+	struct dev_pm_domain_list *pmdomain_tbl;
+	int ret, i;
 
-	struct dev_pm_domain_attach_data iris_pd_data = {
-		.pd_names = core->iris_platform_data->pmdomain_tbl,
-		.num_pd_names = core->iris_platform_data->pmdomain_tbl_size,
-		.pd_flags = PD_FLAG_NO_DEV_LINK,
-	};
+	if (!pd_data->pd_cnt)
+		return -EINVAL;
+
+	iris_pd_data.pd_names = pd_data->pd_names;
+	iris_pd_data.num_pd_names = pd_data->pd_cnt;
+	iris_pd_data.pd_flags = PD_FLAG_NO_DEV_LINK;
+
+	ret = devm_pm_domain_attach_list(core->dev, &iris_pd_data, &pmdomain_tbl);
+	if (ret < 0)
+		return ret;
+
+	pd->pd_cnt = ret;
+
+	pd->dev = devm_kzalloc(core->dev, pd->pd_cnt * sizeof(*pd->dev), GFP_KERNEL);
+	if (!pd->dev)
+		return -ENOMEM;
+
+	for (i = 0; i < pd->pd_cnt; i++)
+		pd->dev[i] = pmdomain_tbl->pd_devs[i];
+
+	return 0;
+}
+
+static int iris_init_power_domains(struct iris_core *core)
+{
+	const struct iris_platform_data *plat = core->iris_platform_data;
+	unsigned int num_cores = max(plat->num_cores, 1);
+	int i, ret;
 
 	struct dev_pm_domain_attach_data iris_opp_pd_data = {
 		.pd_names = core->iris_platform_data->opp_pd_tbl,
@@ -61,10 +88,57 @@ static int iris_init_power_domains(struct iris_core *core)
 		.config_clks = dev_pm_opp_config_clks_simple,
 	};
 
-	ret = devm_pm_domain_attach_list(core->dev, &iris_pd_data, &core->pmdomain_tbl);
-	if (ret < 0)
+	core->ctrl = devm_kzalloc(core->dev, sizeof(*core->ctrl), GFP_KERNEL);
+	if (!core->ctrl)
+		return -ENOMEM;
+
+	ret = iris_init_power_domains_per_block(core, core->ctrl, plat->ctrl_data);
+	if (ret)
 		return ret;
 
+	core->vcodec = devm_kzalloc(core->dev, num_cores * sizeof(*core->vcodec), GFP_KERNEL);
+	if (!core->vcodec)
+		return -ENOMEM;
+
+	for (i = 0; i < num_cores; i++) {
+		ret = iris_init_power_domains_per_block(core, &core->vcodec[i],
+							&plat->vcodec_data[i]);
+		if (ret)
+			return ret;
+	}
+
+	if (plat->vcodec_vpp0_data) {
+		core->vcodec_vpp0 = devm_kzalloc(core->dev, sizeof(*core->vcodec_vpp0), GFP_KERNEL);
+		if (!core->vcodec_vpp0)
+			return -ENOMEM;
+
+		ret = iris_init_power_domains_per_block(core, core->vcodec_vpp0,
+							plat->vcodec_vpp0_data);
+		if (ret)
+			return ret;
+	}
+
+	if (plat->vcodec_vpp1_data) {
+		core->vcodec_vpp1 = devm_kzalloc(core->dev, sizeof(*core->vcodec_vpp1), GFP_KERNEL);
+		if (!core->vcodec_vpp1)
+			return -ENOMEM;
+
+		ret = iris_init_power_domains_per_block(core, core->vcodec_vpp1,
+							plat->vcodec_vpp1_data);
+		if (ret)
+			return ret;
+	}
+
+	if (plat->apv_data) {
+		core->apv = devm_kzalloc(core->dev, sizeof(*core->apv), GFP_KERNEL);
+		if (!core->apv)
+			return -ENOMEM;
+
+		ret = iris_init_power_domains_per_block(core, core->apv, plat->apv_data);
+		if (ret)
+			return ret;
+	}
+
 	ret =  devm_pm_domain_attach_list(core->dev, &iris_opp_pd_data, &core->opp_pmdomain_tbl);
 	/* backwards compatibility for incomplete ABI SM8250 */
 	if (ret == -ENODEV &&
@@ -83,17 +157,51 @@ static int iris_init_power_domains(struct iris_core *core)
 	return devm_pm_opp_of_add_table(core->dev);
 }
 
+static int iris_init_clocks_per_block(struct iris_core *core, struct iris_power_domain *pd,
+				      const struct iris_power_domain_data *pd_data)
+{
+	unsigned int i;
+
+	if (!pd_data)
+		return 0;
+
+	pd->clk_cnt = pd_data->clk_cnt;
+	pd->clocks = devm_kcalloc(core->dev, pd->clk_cnt, sizeof(*pd->clocks), GFP_KERNEL);
+	if (!pd->clocks)
+		return -ENOMEM;
+
+	for (i = 0; i < pd->clk_cnt; i++)
+		pd->clocks[i].id = pd_data->clk_names[i];
+
+	return devm_clk_bulk_get(core->dev, pd->clk_cnt, pd->clocks);
+}
+
 static int iris_init_clocks(struct iris_core *core)
 {
+	const struct iris_platform_data *plat = core->iris_platform_data;
+	unsigned int num_cores = max(plat->num_cores, 1);
+	unsigned int i;
 	int ret;
 
-	ret = devm_clk_bulk_get_all(core->dev, &core->clock_tbl);
-	if (ret < 0)
+	ret = iris_init_clocks_per_block(core, core->ctrl, plat->ctrl_data);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < num_cores; i++) {
+		ret = iris_init_clocks_per_block(core, &core->vcodec[i], &plat->vcodec_data[i]);
+		if (ret)
+			return ret;
+	}
+
+	ret = iris_init_clocks_per_block(core, core->vcodec_vpp0, plat->vcodec_vpp0_data);
+	if (ret)
 		return ret;
 
-	core->clk_count = ret;
+	ret = iris_init_clocks_per_block(core, core->vcodec_vpp1, plat->vcodec_vpp1_data);
+	if (ret)
+		return ret;
 
-	return 0;
+	return iris_init_clocks_per_block(core, core->apv, plat->apv_data);
 }
 
 static int iris_init_reset_table(struct iris_core *core,
diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
index 309a593d755b..fd4dd0269223 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.c
+++ b/drivers/media/platform/qcom/iris/iris_resources.c
@@ -10,7 +10,6 @@
 #include <linux/pm_domain.h>
 #include <linux/pm_opp.h>
 #include <linux/pm_runtime.h>
-#include <linux/reset.h>
 
 #include "iris_core.h"
 #include "iris_instance.h"
@@ -72,76 +71,63 @@ int iris_opp_set_rate(struct device *dev, unsigned long freq)
 	return dev_pm_opp_set_opp(dev, opp);
 }
 
-int iris_enable_power_domains(struct iris_core *core, struct device *pd_dev)
+int iris_enable_power_domain_and_clocks(struct iris_core *core, struct iris_power_domain *pd)
 {
-	int ret;
+	int ret, i;
 
 	ret = iris_opp_set_rate(core->dev, ULONG_MAX);
 	if (ret)
 		return ret;
 
-	ret = pm_runtime_get_sync(pd_dev);
-	if (ret < 0)
-		return ret;
-
-	return ret;
-}
-
-int iris_disable_power_domains(struct iris_core *core, struct device *pd_dev)
-{
-	int ret;
+	for (i = 0; i < pd->pd_cnt; i++) {
+		ret = pm_runtime_resume_and_get(pd->dev[i]);
+		if (ret < 0)
+			goto error;
+	}
 
-	ret = iris_opp_set_rate(core->dev, 0);
+	ret = clk_bulk_prepare_enable(pd->clk_cnt, pd->clocks);
 	if (ret)
-		return ret;
-
-	pm_runtime_put_sync(pd_dev);
+		goto error;
 
 	return 0;
-}
 
-static struct clk *iris_get_clk_by_type(struct iris_core *core, enum platform_clk_type clk_type)
-{
-	const struct platform_clk_data *clk_tbl;
-	u32 clk_cnt, i, j;
-
-	clk_tbl = core->iris_platform_data->clk_tbl;
-	clk_cnt = core->iris_platform_data->clk_tbl_size;
-
-	for (i = 0; i < clk_cnt; i++) {
-		if (clk_tbl[i].clk_type == clk_type) {
-			for (j = 0; core->clock_tbl && j < core->clk_count; j++) {
-				if (!strcmp(core->clock_tbl[j].id, clk_tbl[i].clk_name))
-					return core->clock_tbl[j].clk;
-			}
-		}
-	}
+error:
+	iris_opp_set_rate(core->dev, 0);
 
-	return NULL;
+	while (--i >= 0)
+		pm_runtime_put_sync(pd->dev[i]);
+
+	return ret;
 }
 
-int iris_prepare_enable_clock(struct iris_core *core, enum platform_clk_type clk_type)
+void iris_disable_power_domain_and_clocks(struct iris_core *core, struct iris_power_domain *pd)
 {
-	struct clk *clock;
+	int i;
 
-	clock = iris_get_clk_by_type(core, clk_type);
-	if (!clock)
-		return -ENOENT;
+	clk_bulk_disable_unprepare(pd->clk_cnt, pd->clocks);
+	iris_opp_set_rate(core->dev, 0);
 
-	return clk_prepare_enable(clock);
+	for (i = 0; i < pd->pd_cnt; i++)
+		pm_runtime_put_sync(pd->dev[i]);
 }
 
-int iris_disable_unprepare_clock(struct iris_core *core, enum platform_clk_type clk_type)
+int iris_genpd_set_hwmode(struct iris_power_domain *pd, bool mode)
 {
-	struct clk *clock;
+	int i, ret;
 
-	clock = iris_get_clk_by_type(core, clk_type);
-	if (!clock)
-		return -EINVAL;
-
-	clk_disable_unprepare(clock);
+	for (i = 0; i < pd->pd_cnt; i++) {
+		ret = dev_pm_genpd_set_hwmode(pd->dev[i], mode);
+		if (ret)
+			goto error;
+	}
 
 	return 0;
+
+error:
+	while (--i >= 0)
+		dev_pm_genpd_set_hwmode(pd->dev[i], !mode);
+
+	return ret;
 }
 
 struct device *iris_create_cb_dev(struct iris_core *core, const char *name)
diff --git a/drivers/media/platform/qcom/iris/iris_resources.h b/drivers/media/platform/qcom/iris/iris_resources.h
index 2eef0676a146..36efa89f5d10 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.h
+++ b/drivers/media/platform/qcom/iris/iris_resources.h
@@ -7,15 +7,15 @@
 #define __IRIS_RESOURCES_H__
 
 struct iris_core;
+struct iris_power_domain;
 
 int iris_opp_set_rate(struct device *dev, unsigned long freq);
-int iris_enable_power_domains(struct iris_core *core, struct device *pd_dev);
-int iris_disable_power_domains(struct iris_core *core, struct device *pd_dev);
 int iris_unset_icc_bw(struct iris_core *core);
 int iris_set_icc_bw(struct iris_core *core, unsigned long icc_bw);
-int iris_disable_unprepare_clock(struct iris_core *core, enum platform_clk_type clk_type);
-int iris_prepare_enable_clock(struct iris_core *core, enum platform_clk_type clk_type);
 struct device *iris_create_cb_dev(struct iris_core *core, const char *name);
 struct device *iris_get_cb_dev(struct iris_inst *inst, enum iris_buffer_type buffer_type);
+int iris_enable_power_domain_and_clocks(struct iris_core *core, struct iris_power_domain *pd);
+void iris_disable_power_domain_and_clocks(struct iris_core *core, struct iris_power_domain *pd);
+int iris_genpd_set_hwmode(struct iris_power_domain *pd, bool mode);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index 3dad47be78b5..7cda94601555 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -205,53 +205,20 @@ static int iris_vpu33_power_off_controller(struct iris_core *core)
 	val &= ~NOC_HALT;
 	writel(val, core->reg_base + AON_WRAPPER_MVP_NOC_CORE_CLK_CONTROL);
 
-	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
-
 disable_power:
-	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
-	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
+	iris_disable_power_domain_and_clocks(core, core->ctrl);
 
 	return 0;
 }
 
 static int iris_vpu35_power_on_hw(struct iris_core *core)
 {
-	int ret;
-
-	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
-	if (ret)
-		return ret;
-
-	ret = iris_prepare_enable_clock(core, IRIS_AXI_CLK);
-	if (ret)
-		goto err_disable_power;
-
-	ret = iris_prepare_enable_clock(core, IRIS_HW_FREERUN_CLK);
-	if (ret)
-		goto err_disable_axi_clk;
-
-	ret = iris_prepare_enable_clock(core, IRIS_HW_CLK);
-	if (ret)
-		goto err_disable_hw_free_clk;
-
-	return 0;
-
-err_disable_hw_free_clk:
-	iris_disable_unprepare_clock(core, IRIS_HW_FREERUN_CLK);
-err_disable_axi_clk:
-	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
-err_disable_power:
-	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
-
-	return ret;
+	return iris_enable_power_domain_and_clocks(core, core->vcodec);
 }
 
 static void iris_vpu35_power_off_hw(struct iris_core *core)
 {
 	iris_vpu33_power_off_hardware(core);
-
-	iris_disable_unprepare_clock(core, IRIS_HW_FREERUN_CLK);
-	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
 }
 
 const struct vpu_ops iris_vpu3_ops = {
diff --git a/drivers/media/platform/qcom/iris/iris_vpu4x.c b/drivers/media/platform/qcom/iris/iris_vpu4x.c
index 02e100a4045f..caee9e4351db 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu4x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu4x.c
@@ -27,27 +27,24 @@ static int iris_vpu4x_genpd_set_hwmode(struct iris_core *core, bool hw_mode, u32
 {
 	int ret;
 
-	ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], hw_mode);
+	ret = iris_genpd_set_hwmode(core->vcodec, hw_mode);
 	if (ret)
 		return ret;
 
 	if (!(efuse_value & DISABLE_VIDEO_VPP0_BIT)) {
-		ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs
-					      [IRIS_VPP0_HW_POWER_DOMAIN], hw_mode);
+		ret = iris_genpd_set_hwmode(core->vcodec_vpp0, hw_mode);
 		if (ret)
 			goto restore_hw_domain_mode;
 	}
 
 	if (!(efuse_value & DISABLE_VIDEO_VPP1_BIT)) {
-		ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs
-					      [IRIS_VPP1_HW_POWER_DOMAIN], hw_mode);
+		ret = iris_genpd_set_hwmode(core->vcodec_vpp1, hw_mode);
 		if (ret)
 			goto restore_vpp0_domain_mode;
 	}
 
 	if (!(efuse_value & DISABLE_VIDEO_APV_BIT)) {
-		ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs
-					      [IRIS_APV_HW_POWER_DOMAIN], hw_mode);
+		ret = iris_genpd_set_hwmode(core->apv, hw_mode);
 		if (ret)
 			goto restore_vpp1_domain_mode;
 	}
@@ -56,37 +53,19 @@ static int iris_vpu4x_genpd_set_hwmode(struct iris_core *core, bool hw_mode, u32
 
 restore_vpp1_domain_mode:
 	if (!(efuse_value & DISABLE_VIDEO_VPP1_BIT))
-		dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_VPP1_HW_POWER_DOMAIN],
-					!hw_mode);
+		iris_genpd_set_hwmode(core->vcodec_vpp1, !hw_mode);
 restore_vpp0_domain_mode:
 	if (!(efuse_value & DISABLE_VIDEO_VPP0_BIT))
-		dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_VPP0_HW_POWER_DOMAIN],
-					!hw_mode);
+		iris_genpd_set_hwmode(core->vcodec_vpp0, !hw_mode);
 restore_hw_domain_mode:
-	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], !hw_mode);
+	iris_genpd_set_hwmode(core->vcodec, !hw_mode);
 
 	return ret;
 }
 
 static int iris_vpu4x_power_on_apv(struct iris_core *core)
 {
-	int ret;
-
-	ret = iris_enable_power_domains(core,
-					core->pmdomain_tbl->pd_devs[IRIS_APV_HW_POWER_DOMAIN]);
-	if (ret)
-		return ret;
-
-	ret = iris_prepare_enable_clock(core, IRIS_APV_HW_CLK);
-	if (ret)
-		goto disable_apv_hw_power_domain;
-
-	return 0;
-
-disable_apv_hw_power_domain:
-	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_APV_HW_POWER_DOMAIN]);
-
-	return ret;
+	return iris_enable_power_domain_and_clocks(core, core->apv);
 }
 
 static void iris_vpu4x_power_off_apv(struct iris_core *core)
@@ -138,8 +117,7 @@ static void iris_vpu4x_power_off_apv(struct iris_core *core)
 	writel(0x0, core->reg_base + CPU_CS_APV_BRIDGE_SYNC_RESET);
 
 disable_clocks_and_power:
-	iris_disable_unprepare_clock(core, IRIS_APV_HW_CLK);
-	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_APV_HW_POWER_DOMAIN]);
+	iris_disable_power_domain_and_clocks(core, core->apv);
 }
 
 static void iris_vpu4x_ahb_sync_reset_apv(struct iris_core *core)
@@ -158,116 +136,43 @@ static void iris_vpu4x_ahb_sync_reset_hardware(struct iris_core *core)
 	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
 }
 
-static int iris_vpu4x_enable_hardware_clocks(struct iris_core *core, u32 efuse_value)
-{
-	int ret;
-
-	ret = iris_prepare_enable_clock(core, IRIS_AXI_CLK);
-	if (ret)
-		return ret;
-
-	ret = iris_prepare_enable_clock(core, IRIS_HW_FREERUN_CLK);
-	if (ret)
-		goto disable_axi_clock;
-
-	ret = iris_prepare_enable_clock(core, IRIS_HW_CLK);
-	if (ret)
-		goto disable_hw_free_run_clock;
-
-	ret = iris_prepare_enable_clock(core, IRIS_BSE_HW_CLK);
-	if (ret)
-		goto disable_hw_clock;
-
-	if (!(efuse_value & DISABLE_VIDEO_VPP0_BIT)) {
-		ret = iris_prepare_enable_clock(core, IRIS_VPP0_HW_CLK);
-		if (ret)
-			goto disable_bse_hw_clock;
-	}
-
-	if (!(efuse_value & DISABLE_VIDEO_VPP1_BIT)) {
-		ret = iris_prepare_enable_clock(core, IRIS_VPP1_HW_CLK);
-		if (ret)
-			goto disable_vpp0_hw_clock;
-	}
-
-	return 0;
-
-disable_vpp0_hw_clock:
-	if (!(efuse_value & DISABLE_VIDEO_VPP0_BIT))
-		iris_disable_unprepare_clock(core, IRIS_VPP0_HW_CLK);
-disable_bse_hw_clock:
-	iris_disable_unprepare_clock(core, IRIS_BSE_HW_CLK);
-disable_hw_clock:
-	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
-disable_hw_free_run_clock:
-	iris_disable_unprepare_clock(core, IRIS_HW_FREERUN_CLK);
-disable_axi_clock:
-	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
-
-	return ret;
-}
-
-static void iris_vpu4x_disable_hardware_clocks(struct iris_core *core, u32 efuse_value)
-{
-	if (!(efuse_value & DISABLE_VIDEO_VPP1_BIT))
-		iris_disable_unprepare_clock(core, IRIS_VPP1_HW_CLK);
-
-	if (!(efuse_value & DISABLE_VIDEO_VPP0_BIT))
-		iris_disable_unprepare_clock(core, IRIS_VPP0_HW_CLK);
-
-	iris_disable_unprepare_clock(core, IRIS_BSE_HW_CLK);
-	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
-	iris_disable_unprepare_clock(core, IRIS_HW_FREERUN_CLK);
-	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
-}
-
 static int iris_vpu4x_power_on_hardware(struct iris_core *core)
 {
 	u32 efuse_value = readl(core->reg_base + WRAPPER_EFUSE_MONITOR);
 	int ret;
 
-	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+	ret = iris_enable_power_domain_and_clocks(core, core->vcodec);
 	if (ret)
 		return ret;
 
 	if (!(efuse_value & DISABLE_VIDEO_VPP0_BIT)) {
-		ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs
-						[IRIS_VPP0_HW_POWER_DOMAIN]);
+		ret = iris_enable_power_domain_and_clocks(core, core->vcodec_vpp0);
 		if (ret)
 			goto disable_hw_power_domain;
 	}
 
 	if (!(efuse_value & DISABLE_VIDEO_VPP1_BIT)) {
-		ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs
-						[IRIS_VPP1_HW_POWER_DOMAIN]);
+		ret = iris_enable_power_domain_and_clocks(core, core->vcodec_vpp1);
 		if (ret)
 			goto disable_vpp0_power_domain;
 	}
 
-	ret = iris_vpu4x_enable_hardware_clocks(core, efuse_value);
-	if (ret)
-		goto disable_vpp1_power_domain;
-
 	if (!(efuse_value & DISABLE_VIDEO_APV_BIT)) {
 		ret = iris_vpu4x_power_on_apv(core);
 		if (ret)
-			goto disable_hw_clocks;
+			goto disable_vpp1_power_domain;
 	}
 
 	return 0;
 
-disable_hw_clocks:
-	iris_vpu4x_disable_hardware_clocks(core, efuse_value);
 disable_vpp1_power_domain:
 	if (!(efuse_value & DISABLE_VIDEO_VPP1_BIT))
-		iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs
-						[IRIS_VPP1_HW_POWER_DOMAIN]);
+		iris_disable_power_domain_and_clocks(core, core->vcodec_vpp1);
 disable_vpp0_power_domain:
 	if (!(efuse_value & DISABLE_VIDEO_VPP0_BIT))
-		iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs
-						[IRIS_VPP0_HW_POWER_DOMAIN]);
+		iris_disable_power_domain_and_clocks(core, core->vcodec_vpp0);
 disable_hw_power_domain:
-	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+	iris_disable_power_domain_and_clocks(core, core->vcodec);
 
 	return ret;
 }
@@ -335,17 +240,13 @@ static void iris_vpu4x_power_off_hardware(struct iris_core *core)
 	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
 
 disable_clocks_and_power:
-	iris_vpu4x_disable_hardware_clocks(core, efuse_value);
-
 	if (!(efuse_value & DISABLE_VIDEO_VPP1_BIT))
-		iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs
-					   [IRIS_VPP1_HW_POWER_DOMAIN]);
+		iris_disable_power_domain_and_clocks(core, core->vcodec_vpp1);
 
 	if (!(efuse_value & DISABLE_VIDEO_VPP0_BIT))
-		iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs
-					   [IRIS_VPP0_HW_POWER_DOMAIN]);
+		iris_disable_power_domain_and_clocks(core, core->vcodec_vpp0);
 
-	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+	iris_disable_power_domain_and_clocks(core, core->vcodec);
 }
 
 static int iris_vpu4x_set_hwmode(struct iris_core *core)
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index ab41da1f47c8..e690c566c875 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -212,21 +212,15 @@ int iris_vpu_power_off_controller(struct iris_core *core)
 	writel(0x0, core->reg_base + WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG);
 
 disable_power:
-	iris_disable_unprepare_clock(core, IRIS_AHB_CLK);
-	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
-	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
-	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+	iris_disable_power_domain_and_clocks(core, core->ctrl);
 
 	return 0;
 }
 
 void iris_vpu_power_off_hw(struct iris_core *core)
 {
-	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], false);
-	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
-	iris_disable_unprepare_clock(core, IRIS_BSE_HW_CLK);
-	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
-	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
+	iris_genpd_set_hwmode(core->vcodec, false);
+	iris_disable_power_domain_and_clocks(core, core->vcodec);
 }
 
 void iris_vpu_power_off(struct iris_core *core)
@@ -245,7 +239,7 @@ int iris_vpu_power_on_controller(struct iris_core *core)
 	u32 rst_tbl_size = core->iris_platform_data->clk_rst_tbl_size;
 	int ret;
 
-	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+	ret = iris_enable_power_domain_and_clocks(core, core->ctrl);
 	if (ret)
 		return ret;
 
@@ -253,65 +247,22 @@ int iris_vpu_power_on_controller(struct iris_core *core)
 	if (ret)
 		goto err_disable_power;
 
-	ret = iris_prepare_enable_clock(core, IRIS_AXI_CLK);
-	if (ret)
-		goto err_disable_power;
-
-	ret = iris_prepare_enable_clock(core, IRIS_CTRL_CLK);
-	if (ret)
-		goto err_disable_axi_clock;
-
-	ret = iris_prepare_enable_clock(core, IRIS_AHB_CLK);
-	if (ret && ret != -ENOENT)
-		goto err_disable_ctrl_clock;
-
 	return 0;
 
-err_disable_ctrl_clock:
-	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
-err_disable_axi_clock:
-	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
 err_disable_power:
-	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+	iris_disable_power_domain_and_clocks(core, core->ctrl);
 
 	return ret;
 }
 
 int iris_vpu_power_on_hw(struct iris_core *core)
 {
-	int ret;
-
-	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
-	if (ret)
-		return ret;
-
-	ret = iris_prepare_enable_clock(core, IRIS_HW_CLK);
-	if (ret)
-		goto err_disable_power;
-
-	ret = iris_prepare_enable_clock(core, IRIS_HW_AHB_CLK);
-	if (ret && ret != -ENOENT)
-		goto err_disable_hw_clock;
-
-	ret = iris_prepare_enable_clock(core, IRIS_BSE_HW_CLK);
-	if (ret && ret != -ENOENT)
-		goto err_disable_hw_ahb_clock;
-
-	return 0;
-
-err_disable_hw_ahb_clock:
-	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
-err_disable_hw_clock:
-	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
-err_disable_power:
-	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
-
-	return ret;
+	return iris_enable_power_domain_and_clocks(core, core->vcodec);
 }
 
 int iris_vpu_set_hwmode(struct iris_core *core)
 {
-	return dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], true);
+	return iris_genpd_set_hwmode(core->vcodec, true);
 }
 
 int iris_vpu_switch_to_hwmode(struct iris_core *core)
@@ -372,11 +323,7 @@ int iris_vpu35_vpu4x_power_off_controller(struct iris_core *core)
 			   val, val == 0, 200, 2000);
 
 disable_power:
-	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
-	iris_disable_unprepare_clock(core, IRIS_CTRL_FREERUN_CLK);
-	iris_disable_unprepare_clock(core, IRIS_AXI1_CLK);
-
-	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+	iris_disable_power_domain_and_clocks(core, core->ctrl);
 
 	reset_control_bulk_reset(clk_rst_tbl_size, core->resets);
 
@@ -385,34 +332,7 @@ int iris_vpu35_vpu4x_power_off_controller(struct iris_core *core)
 
 int iris_vpu35_vpu4x_power_on_controller(struct iris_core *core)
 {
-	int ret;
-
-	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
-	if (ret)
-		return ret;
-
-	ret = iris_prepare_enable_clock(core, IRIS_AXI1_CLK);
-	if (ret)
-		goto err_disable_power;
-
-	ret = iris_prepare_enable_clock(core, IRIS_CTRL_FREERUN_CLK);
-	if (ret)
-		goto err_disable_axi1_clk;
-
-	ret = iris_prepare_enable_clock(core, IRIS_CTRL_CLK);
-	if (ret)
-		goto err_disable_ctrl_free_clk;
-
-	return 0;
-
-err_disable_ctrl_free_clk:
-	iris_disable_unprepare_clock(core, IRIS_CTRL_FREERUN_CLK);
-err_disable_axi1_clk:
-	iris_disable_unprepare_clock(core, IRIS_AXI1_CLK);
-err_disable_power:
-	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
-
-	return ret;
+	return iris_enable_power_domain_and_clocks(core, core->ctrl);
 }
 
 void iris_vpu35_vpu4x_program_bootup_registers(struct iris_core *core)

-- 
2.34.1


