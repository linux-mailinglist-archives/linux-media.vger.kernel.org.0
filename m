Return-Path: <linux-media+bounces-59679-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SEFCIH5c72m3AgEAu9opvQ
	(envelope-from <linux-media+bounces-59679-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 14:54:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C956C472DDD
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 14:54:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 67A9A30F0FAC
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 12:48:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F48A3B9D98;
	Mon, 27 Apr 2026 12:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lFX8rnwF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S1Wi6fqm"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E355B3C3BED
	for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 12:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777294019; cv=none; b=GpyLJmLClwb6VE6pPgy6I5ePf+KwRbgMKWfC3CFM1ovywfJ6j2nrWjlT8Ouv/VBSKS7rK8ni4G/x8y9CUTnQYuRAabtBbRRemHvFwgZoYsM9wPFiNL/EyoywLPENs88W+qpMedjlvdG72R94hzWwBmAri8PCfjR3jCsFM1Pe6BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777294019; c=relaxed/simple;
	bh=t3oD0Wav7XG6nXX5m+LNYCFF8Do+gS8hdZjFgoDgo8Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b8y+puTuhRMpYHEC/tz66m2y/pvNYLR8DqK5jLxtF8fBJHCTF9tpYentDH3Isv5Irk3rjxOH3BP5LaLt6tvohICqNNvSkXIdL8l+xk5Li0qiKBdnjYE3GxPtKXvRNbZ+UC0i4sxQsyc1FPD3moA6w+aL1l3vBnk4s6YUs4XxHyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lFX8rnwF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S1Wi6fqm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8kT9D3962106
	for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 12:46:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LiDzM8ITkpj2w4YZF7EhsRvWIrQfPBSfCjKhrtsK9Ck=; b=lFX8rnwFiwmXWMMV
	uKZWpXFNFFpewz5mV4Blv5ebSfs0DLv/1Evh8VsiDfUtNGIQqCR09+Mn2KrVuyfj
	DHzwr1ZJ4uV8Fbnbz2MOo2nfsluC0WQ4hS+3/gAcIBqAtDcmX6cEU2JfDf2Y9tlJ
	t8fFMJC7z/bDl8Xw/q+D1y89VxTjtjhh+MuC4q+yp7dRP/FvQgmD8bn725XU3L9H
	wy8ASAHmObO8Um5OyCdIaiPHgDmckMhA672HEQlOuSNr5Z8aOoW9W0Z2H9CRZtd3
	NU3qwxGWzqBiwD99SX1vhpOrDjm11MVK9fd3hNFTLCpemNH+QtlYWwV1lDLVfbs4
	CK9oDw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt4k313q3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 12:46:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50fcdd579e1so76127181cf.1
        for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 05:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777294015; x=1777898815; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LiDzM8ITkpj2w4YZF7EhsRvWIrQfPBSfCjKhrtsK9Ck=;
        b=S1Wi6fqmYU7Y0sSWuPDqDBkwHXyUemTAAFAVl4VoXuDVHqBIv6q2PLWNsDNz8NaMpe
         3pPFF3Jzm8HbAHDa8/PdG9XlJXMzdDi7l1jLDSQyIuMWxCOoyd0iYLPeu26pJ0IeYrX8
         E8hDaqcIyXW0YrV8hul2rq7JjK5pfxaPlcT+QcCQjDD37+gClRSu1rbNRYtyEuNvm+pM
         IELOVuFL6IDG8DpNxcqXzBhWN15sH+3tLC9KmXXfHbby2DyDcW/GPwTfKjtVHTquykre
         a8O7wusZxVl5XcOokSH4mhQNHGKCcJrgYqNNdURYW5RFiktADFvp59fWkUdXRyNkCYYR
         QkKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777294015; x=1777898815;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LiDzM8ITkpj2w4YZF7EhsRvWIrQfPBSfCjKhrtsK9Ck=;
        b=aOM0ev/W4gyWmhhWAGR8PMUsfu19MsEPAWPjQtjpVyoczI+UzqEInDWWJ4WZF/zA3S
         k6Lpdn6mKCHor3QS67H3tCG3sajcYYdgfcoyyqP5hsK4hCPA8XiLyMgiaMBvJo7Cjb+d
         3HK9PrWrLd/Bjm5Hn/FopAAoGCWj4oT0Y8+81eYcSlnaHd9gkc78KVdiHXjirUtzdSbk
         CqgeS2Z3MSd5byq4yOjrqANOlzoTt3QiWJ9ZDFejEt2j23sOoFnihQsNki3LoH3JvP3B
         oyo/fe4PdDwMPvsXYJgD56QzpVJlnO6HXTIj3fVVC2ZSVaWv4w5IaAN/LwMLzwTnM8p+
         cvCg==
X-Gm-Message-State: AOJu0YxoaNe1CHsdtSFFojO4x/yu3Af3Tf9COe0d+msHG/mYLNcKk7YY
	sUolEP3bQLw40lj+eWz7ADkFaUvhDBTf7Al5F/DEFCXLsUCMPSTOqldObEwXU+arVffRjez+bQg
	ujvedZFJfZng+lQVhaIz9pTRQv3Dx7bhTHGsN9HfRrougxxg+OLvKagn0WEXvcpJMCg==
X-Gm-Gg: AeBDieunzoy0mKlSUejRamQfKHGA+g1+5mrkd/OqkTt9+0x8Rnr9dDWPo6xGBTgWSu1
	ApJP/uDdR89kE1WIYCSpFA+RjNJzGJnJDJ4dz07OoM0yysK13m59hODToeBBlfFIW1X+M/PKre+
	UDdMmhGRVjWs/0u1Pa77ui2O0/T1lcUsHQg2RhHOVkSO1gvNsqRY8zq2HCXqoFqYGyF1jUHbvz/
	S0kFDeKZt6SZ5dZcPpQJPlbyQPQDUH0nqRcHVfxyTqvcSD/EKxpOU3D8adLat05trmZ1h4X2K33
	N+geIpTrCm7uT2eTlxwctUbcAIg75QuaXKmueK5ToGuyk8FKHuU/P7PcTuqsrj84LVr1mFfj/R1
	9h6x/zR/WEP99FkvHRNEj3n0+tr8Ql9LxLqq8h66MrRgF+kOldd8aIzQ0P1q35UmibBFJE/KcJ5
	eA8TgA9s1W4VmF/oGz/SpohTG/vIg=
X-Received: by 2002:ac8:5d12:0:b0:50f:ba44:ce4e with SMTP id d75a77b69052e-50fba44d76fmr368833261cf.6.1777294015194;
        Mon, 27 Apr 2026 05:46:55 -0700 (PDT)
X-Received: by 2002:ac8:5d12:0:b0:50f:ba44:ce4e with SMTP id d75a77b69052e-50fba44d76fmr368832821cf.6.1777294014697;
        Mon, 27 Apr 2026 05:46:54 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:653f:4d28:6a78:a6ca])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba454d1bd19sm1091496866b.37.2026.04.27.05.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 05:46:53 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 14:43:38 +0200
Subject: [PATCH v2 11/14] dt-bindings: media: qcom,qcm2290-camss: Add OPE
 ISP subnode
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-camss-isp-ope-v2-11-f430e7485009@oss.qualcomm.com>
References: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
In-Reply-To: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEzNSBTYWx0ZWRfX7OpQF56U0Gf0
 Ab7XTATKuNyoBQXcZl3hLP9HY54bJBDi++67k5tpudk4nOEDuKydPNfd5Fq0BtadORWfv7KmIDT
 gC0nMqqGJgVB2O0dzE1XESryqeWjR6XthLEj5muRB3VOJaohpO0n93Kg9fZ6uQ2f493Oj4aMIO5
 s6bW83rI0cXg3mWhAYnku2GMvaDs9lsMT58NFPK8sdBprYV+M5472T2bBDJMbxnzKzcSCp800mg
 o4dlNFArkMGl/V/tTYl2k/o74os2KOZq1J8K3BaIfTtMOxSmEGv0iHWr4E6szGqrCgNauaCI36V
 peF/uvTIKAdQbOS1p0VLpHZpq20S3YL/BysmJeb76EvlqQTWKGtojC50fl1hidl5qLm3jyJCKjA
 JCz0/jDUdOJz/uz59NgrdvY4Pq/DvnRj0MzKxZpOqTNwh41NOusbOC83yvShX3ut38u9uEleEMU
 9/jZVE0k8mH0cLHZdIw==
X-Authority-Analysis: v=2.4 cv=a7QAM0SF c=1 sm=1 tr=0 ts=69ef5ac0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=M8sXMW5dAYDte-7YvdsA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: nLAlK0hVeeNKpJMFxBi-dCa_Irew6QWS
X-Proofpoint-ORIG-GUID: nLAlK0hVeeNKpJMFxBi-dCa_Irew6QWS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270135
X-Rspamd-Queue-Id: C956C472DDD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-59679-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Extend the qcm2290 CAMSS binding to describe CAMSS as a simple bus by
allowing child ISP nodes. Add the required address and size cells, as
well as ranges, and validate ISP subnodes against the existing
qcom,qcm2290-camss-ope schema.

On qcm2290 the OPE (Offline Processing Engine) is a memory-to-memory
ISP (Image Signal Processor).

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,qcm2290-camss.yaml       | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
index 391d0f6f67ef5fdfea31dd3683477561516b1556..d8b356028e24c3c5b2e9b7f20e220db7d491ad68 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
@@ -52,6 +52,14 @@ properties:
       - const: vfe1
       - const: vfe1_cphy_rx
 
+  '#address-cells':
+    const: 2
+
+  '#size-cells':
+    const: 2
+
+  ranges: true
+
   interrupts:
     maxItems: 8
 
@@ -117,6 +125,11 @@ properties:
             required:
               - data-lanes
 
+patternProperties:
+  "^isp@[0-9a-f]+$":
+    $ref: /schemas/media/qcom,qcm2290-camss.yaml
+    unevaluatedProperties: false
+
 required:
   - compatible
   - reg

-- 
2.34.1


