Return-Path: <linux-media+bounces-65171-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VYV5G0fLM2qYGQYAu9opvQ
	(envelope-from <linux-media+bounces-65171-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 12:41:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDE669F6F4
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 12:41:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=HJ+4DRF7;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CfWh+ODv;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65171-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65171-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B25E305115D
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 10:40:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96B203EAC7C;
	Thu, 18 Jun 2026 10:40:26 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6BC938AC83
	for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 10:40:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781779226; cv=none; b=Bpt4onbDxfUUeFakczE8hhJIbuOA0v/HXFp2+rLlzEHAWpomgwUF+eu+3uwK8AGdPrT9NiaziH35eyy4TylkgaFHhYHFtw55zEBo/L8/tX7o+xdU1kb4NAU87EdtCNvn5J42Zw5Q2x6Ib7XULX/24KxMBtK79um55Z7WFuyPuRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781779226; c=relaxed/simple;
	bh=bUy2LNyPtggJTXgZrJZnbOEw5uKNlX/uSieHncJQdUo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RU91kPxPAXypJqvTRvxTwM1SjbKZe4SQs5L3fwG2GJSweQRPRy7MPNcypD01CbwulTRWflGU3V5nOA+mij2iJHGf9namiBd5isBlD4dHbdGoQ2KUVnJO0vIfRjZaRgxNI6NIX1oxzimW0vxWD+AocItI4Lu2zYL0Qzg6F4kUP7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HJ+4DRF7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CfWh+ODv; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I8DgP5692872
	for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 10:40:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LL7/RE8BcwI2YCaaaVC/4OfAM80lY2hhDzxeps7xZ/E=; b=HJ+4DRF7091BVOy8
	iFNicLNQGvhI5d0d+lUyPnPE690o3NV0f10k63z7xtWYMmInnVKnNoBNxs8fXMVN
	7PsyO/ONSRXbF8TMYQdLmhkjeH+OXUzXfWGL2h38nbOudWGIIUScW84Sk07Xc27Q
	j1sRMMbXcmzl6StTd+vPEl2jwCgSw2gmdv8pUwv91MwXdZt/7Xt0HOohQwaLsDOz
	cWxDKs+TSv3sBNQGwZPXJOoHD3kHxBrFPlVex7RkpkjJEm2HLvdoMfOHGq8OU6bp
	uTbaMLJqNwOWlC9wPswIGSsfsNeKeDgzLNZgOfGREv/MKxKcJcQgEdqd+b0/gORP
	EAJTmg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eux2cc4wx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 10:40:24 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84245e2bb00so777258b3a.1
        for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 03:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781779223; x=1782384023; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LL7/RE8BcwI2YCaaaVC/4OfAM80lY2hhDzxeps7xZ/E=;
        b=CfWh+ODvRImfiTDkkXl52IujBww2t9qkX24kzyes7xIBdsnYyCb4b7TCEqxu04dQJB
         bHomdJxKvCxNW6M/Ai6nkQpGMperL3QBYUUPv786uRElUDcgzK9nLKeGQNgi+T0Dck+U
         T+4LMvLBY6CtsYfBbNfAaoq2o+zTlHQH1H8RWmpE8Dqq9p/h0q57Viayod67C7mIdQos
         nWySaCmkQNYjwc8zVhW55GUwsxY+2UkYrRO2vZxnWy9L3SVAEArTpOYj0cP0Qoo3x3m6
         2odfmbXGfdltnS0OIivDJi/GUjrYKe/W6gfmii7HKKJQnxPHXlOMl2BrVyFrMwOpF3Hz
         33hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781779223; x=1782384023;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LL7/RE8BcwI2YCaaaVC/4OfAM80lY2hhDzxeps7xZ/E=;
        b=f3UPil0x6Z6M/R0/+YrnZtYBTJbp12ou1y5Esl7K7VigI6gSVN4X+Ij89k0WEjIvne
         rJ2wpaYXxq1YNRan0XXil++omwydW9Ccp/eG2Y+M5IM/dC9AHSv6ZBi7afay/1b6DcRS
         9ADns4zI3QNHYd7o8CPP4l3JbSYd6apprWRWZyKw5bylMYOnWVPXPX/bR7a05bRfHkr5
         qSqpalAWD8EEYA8MXkw84cODxCBX4cWU+r48tj2zdyskYmxEyJQOL8QJbMfw6aBIUs2s
         UJuVHsUDpxbP7urTXQ6aJM8DN2ItCPnmWY3QqCv5FQjVxiDOaDwyFsYAxC44slPe55IX
         820g==
X-Forwarded-Encrypted: i=1; AFNElJ9Ny9JdNjq15DjEFYHF+ZONRQZQc2CRBd1/gTZMTnvOHQOOmGgppdX2eDZn1v6T+/nmP6MQg5A2MLPD9A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ6cVbsQ4o82dmFxg/tgw1AQYVJU7knzbvbLvPuPx6Fi1owYgK
	5dyXxpTgOuQcQavKJlvQPI8jQ4Lo6tt77EbIsT0GNxtsnwUXFlwuvhmhLSEzrN2iIU1VDsKU4aO
	FuFtsBXzPehJGuCP20co0FWktF2w9+jtd9aCXIKM9NQR5hueaGZxmcypHHQ+wRE8fwA==
X-Gm-Gg: AfdE7cnNVgmkjMhu9SBLzC/T3h73UV76RnuiwJ7NaYs0EfMKkupu6ONPOiXZNRQ3OUA
	X12BLNUGUOJv+onscCDMR865qeU9kQ3WLWKBAyKIQ3+QHpKYAfemNK/B1hNpavL1jh/kO1RUxix
	CdAwjwBMS7tFrmMY5MID6i1LPUG2EGCPqpnXHu1EHweO7SCtc6DZywjQGT2o3tw/YBDNPx0c66k
	es7T3DWBb/xdS6C4uD8he3m70EmCXrGDIgsk280R/uTu1s5YTlje9Jxeo5tI2gFB4kTHe7aMAW1
	FQh61WifPufFh52zp+9/7NfJk2f1je3bRCtW1zJZnZykPLHXpFw5uU6SAVJ88rpAW2tRwcbjR6l
	0sAbLlT2HYbq9Sz2/KO4t7JUTxAbmlrIX3SwNExGOh2EDrQ==
X-Received: by 2002:a05:6a00:2d2a:b0:842:4bb9:5fe8 with SMTP id d2e1a72fcca58-84524446057mr8571636b3a.3.1781779223536;
        Thu, 18 Jun 2026 03:40:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d2a:b0:842:4bb9:5fe8 with SMTP id d2e1a72fcca58-84524446057mr8571591b3a.3.1781779223049;
        Thu, 18 Jun 2026 03:40:23 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b0112edsm17254731b3a.45.2026.06.18.03.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 03:40:22 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 16:09:54 +0530
Subject: [PATCH v3 1/3] dt-bindings: media: qcom,qcm2290-venus: document
 shikra Iris compatible
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260618-shikra_vpu-v3-1-1a32e26a35a1@oss.qualcomm.com>
References: <20260618-shikra_vpu-v3-0-1a32e26a35a1@oss.qualcomm.com>
In-Reply-To: <20260618-shikra_vpu-v3-0-1a32e26a35a1@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781779212; l=2455;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=bUy2LNyPtggJTXgZrJZnbOEw5uKNlX/uSieHncJQdUo=;
 b=sv6Ieb0XJWOnYjVnw4sWdEXQ9lBfXwufQpPcGGqHphiE9eRQfz2p8FHcUwCWaMOHM447JzkxH
 +JXJJVlYNE3AdHbBl+oglwugDOyXqx0Y0JWvz/wOZtNZESi+G0QnTW8
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA5OSBTYWx0ZWRfX6rgkKO9jvf6f
 R3Adv8RLD7/UQg71CTZV+frLHmuWSBivGCog5Fq0CBj6/H6f5zCZ622+l5+ustudPx8XtvpJO5Q
 RVCwKqcu1aoBBD1tmBGbYwdo9fmdGOkYCG1al0HojV3Xi4AGR78W4Wk1OuTGbtR2bNH9OlPql58
 S5R7S18nnXDpkc73unygpzbvrgO4wkvc7UyHDfIO8/Mcnx7Lyf90wpJXS6vQ/yg9WACPybKGUxY
 XGZPyDxeT6DY4uuh7ZhM4vYhVqcSYmELdB2WCpl7GLpspcWSvXWBzgZ1ydhBpTcnWRnROmY2Tow
 zz3H/s2Fld3/sQB7mLMXG7n/tPgyeirbhsHUfkGO73WyVwI6HprejMSW0+Qk7RHIMZQX8J7apiP
 EKp7XQzRiSoBjyQfPYwtB77Cvwge2hqW+tHBn+413X2x93G7VNu7ZRLP4dqnTR2iPmPo9APhVnI
 Elko2Lt/+AiBFaqt7eg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA5OSBTYWx0ZWRfX/eM88FxnuYhK
 DTkTjbvXIu64Aowx5QnSBN/vATCaTgX3zRVxEIVaEmpo8fD0veWNeOSsJVhp/6tg7K6+qnNaauv
 RANOxo6xvE+QuMSVCGHZO603VNnXOhk=
X-Proofpoint-GUID: 6x2optDqql1qCvBkclfxZhj0uH8jOXyi
X-Proofpoint-ORIG-GUID: 6x2optDqql1qCvBkclfxZhj0uH8jOXyi
X-Authority-Analysis: v=2.4 cv=WN1PmHsR c=1 sm=1 tr=0 ts=6a33cb18 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=vu35gHCjgte05Dde9DgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180099
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65171-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jorge.ramirez@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:vikash.garodia@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ACDE669F6F4

Document the iris video accelerator used on shikra platforms by adding
the qcom,shikra-iris compatible.

Although QCM2290 and shikra share the same video hardware and overall
integration, their SMMU programming differs. QCM2290 exposes separate
stream IDs for the video hardware and the Xtensa path, requiring two
explicit IOMMU entries, whereas shikra uses a masked SMR to collapse
equivalent stream IDs into a single mapping. Due to QCM2290’s SID layout
and Xtensa isolation requirements, such SMR masking is not applicable on
QCM2290 platforms.
Since shikra uses the same video hardware as QCM2290 and shares the same
programming model and capabilities, it is added as a fallback compatible
to qcom,qcm2290-venus, with conditional handling to allow either one or
two IOMMU entries.

Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 .../bindings/media/qcom,qcm2290-venus.yaml         | 26 ++++++++++++++++------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
index 5977e7d0a71b4fb5681f1c2094439c251366f01f..b27899ebf164229ceff1ca5cda50ee30d875e953 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
@@ -13,14 +13,13 @@ description:
   The Venus AR50_LITE IP is a video encode and decode accelerator present
   on Qualcomm platforms.
 
-allOf:
-  - $ref: qcom,venus-common.yaml#
-
 properties:
   compatible:
     oneOf:
       - items:
-          - const: qcom,sm6115-venus
+          - enum:
+              - qcom,shikra-venus
+              - qcom,sm6115-venus
           - const: qcom,qcm2290-venus
       - const: qcom,qcm2290-venus
 
@@ -45,9 +44,6 @@ properties:
       - const: vcodec0_core
       - const: vcodec0_bus
 
-  iommus:
-    maxItems: 2
-
   interconnects:
     maxItems: 2
 
@@ -65,6 +61,22 @@ required:
   - power-domain-names
   - iommus
 
+allOf:
+  - $ref: qcom,venus-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,shikra-venus
+    then:
+      properties:
+        iommus:
+          maxItems: 1
+    else:
+      properties:
+        iommus:
+          maxItems: 2
+
 unevaluatedProperties: false
 
 examples:

-- 
2.34.1


