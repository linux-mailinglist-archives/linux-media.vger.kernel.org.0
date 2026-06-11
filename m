Return-Path: <linux-media+bounces-64613-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QfyWApARK2p62AMAu9opvQ
	(envelope-from <linux-media+bounces-64613-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 21:50:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C72F674DC9
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 21:50:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=M85GK+6K;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QpleIJ92;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64613-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64613-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 928F0300FCBF
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 19:50:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A96D1360EF6;
	Thu, 11 Jun 2026 19:50:19 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0847F36214C
	for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 19:50:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781207419; cv=none; b=femMyRxiNpH5l2Ks5jItNwrehE4GcYq01mAmXMDdlL+DNWQvUMKie9F19o3Ue9/2DqTL5LEqZU5J3/7LvUewmE5mnyrjhkWacUrKOe8bKmzkhpbBOuXhoHcwRjk0c1Cdhcnjm2HEcewcc4NJjxhpxUSZtSc3OxzWz4ibs5sSUnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781207419; c=relaxed/simple;
	bh=AVhnklETdUkp5mvKfLSwdbQnYbvNLPhgr6Rf58zew30=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nQ1pPIcfbIVxgCPK1P1EHLp0r74S8CAVgJrSujBwU3Gg3tA5muH81xN6Ve1lf6yG7kqo7RWqpMbwy/leWNv3IpM5kNBmRFjO1B9AQmPSXkjl0ofoTaMlGOr3YLEyiRkuVxhOZp8YLklDZ6L8h/1vQyfVRLmQr8qg11PvhspFTJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M85GK+6K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QpleIJ92; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BJ3bO21480022
	for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 19:50:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h+eEO9S0oz313LDlcQk/FLdgkvriU/fqVRACKNw9VMQ=; b=M85GK+6KreNNV8rt
	Ba71Xax3euyM/tHgXUKoNKmzEbufnH6y2iloBrItN46DBGU1dFAAIbcynA0kL4b7
	JxbcDProeA2cONm6xXRw+2aqV+YQEBIUiYEVXU7EuCrNVdBPN20xrhn8Fw4tWZ7o
	jWIdijgwCqBpiGbQkRaS/Gv5NoLXk+rtiqXNLM9zmbVwnVSa9IIRGoIzkL7szGHR
	7dN0alRxVd+VYLNh1Mqyd8tDV7QbdUkz6CS7KlmvCLrHCNMgHwqoV6ZsixhE6K9Y
	ycjw+cg5+CeZeZQ15w9C4Jjc8Lq9vXdjoHMJnX9kf+gaNMaV1sWtHXxlR8JzFLSP
	Y2szBw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er0x7gs5s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 19:50:16 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8426ed9f24dso836661b3a.1
        for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 12:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781207416; x=1781812216; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h+eEO9S0oz313LDlcQk/FLdgkvriU/fqVRACKNw9VMQ=;
        b=QpleIJ92bd3MCy71ama8yV4nfyDeGnjAsYxbDFEXM/9y+22bp/mf7TszjxAgeB+CKF
         dBWBkgL174eAT6xQtb9hSOLPXttAW8K0BlFZ8yLACEI1WiSPpk/9frr3c3op0FHjh8ML
         Em+bXulHOVLFztYkC8aIkw06u4ATlF4Ak3V9v7Ad32wnlLCElka2+3YGuM53ve1TQsQD
         ku5zyKg0obC9BQxU6+V8qNMs04czxWVzf85ceiWQ1KsH2QOOhrbeu/l1dkrziYSgtkAo
         YoLaACvv/zIekIhlgfckh7d4y5aUiHd4/bnpeD9zCkFIWCEJZN8HcFlhU85NGtNcN7xb
         dLKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781207416; x=1781812216;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h+eEO9S0oz313LDlcQk/FLdgkvriU/fqVRACKNw9VMQ=;
        b=kY27yHqO+OE3bGnOUEZFHNRKHxI4BClakhlb4S35Ik5hkpSQ2/5y8BLSEQVgSs1dB6
         jw15fgs7EWmVBd9uhFPppElNQDLn+y4yd9GV5B9VHm35UGBh04Hm0t+CP8eWilSKHhgr
         tNy9/DZQN4oG/W1G07QmEu/APZ9szOs4sbhh097FUbJl9CRiuYW46so5HEi0qhbPrHDf
         8ZEzHlkAg5uVelGf5jrY+IUGF5br9sF/Yn/a+WIXBycukUKSN5+etrInmIHtTpkjM1Wq
         nLlM/Ay/q9rwzWejE74DzA6UQozJEqKQj10XCgsdcDn/8ZKt/P2C85PbwbQxTAQchSHR
         pPRw==
X-Forwarded-Encrypted: i=1; AFNElJ8g3InqdzRierTvf3TRKxENVewCE+sbHcyocCK9gdOCszriGeZUgfTmsCR9hASoYMGX7vMYY7gISxv1EA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGlPWYT9+quqUMPiYsmcAq8C7L3nzOezoHzdtBdq4TJ4HMZ8VU
	fsWmDKbk+z3FgpvaQ9i5e7ZzY8/n4jqSUilvgP1mJBBH6NLgeoJG1qUnyE7+8NInW21PK0W1bS6
	lcCOLnVxSjfdlG539zTQVgdSuvbiRqOoT3DhtoWra5eo6vEpIzTw05if2WdP0MP2w9aLRV4o2cg
	==
X-Gm-Gg: Acq92OGF7krXyfccg5+GHCWt8lvdwqXoYNNxpufwzob2DFD1InOLlGSByj1I1EgnWNS
	dLd98aEAKmrV/ZRBMLoVdC3MdyScySyMf1dpwTHZiuoOdAEAP1HpBzAovIkRvsYy4NAV6P99lOR
	oeSePwTJZZB2nXlE1XXie0zkfHI3tA+TIFabe5iL9sYRj4x7qzfGhIkMjSB4IXrI5NHPVQGEe0o
	n+d/LNaeTo4XAYLM4NklZD+vLRw4/p0XI8Dz79oEGE36suhMtgh8q/O8AkhXtqvSbwOIprz+CDG
	9ZNC+moy5dKO8HT93ju7NqAwYhsDeGa8Z9/3AZIFQt/se4yrnbRVF2Ez8ymoSD3a40CCl/zUBek
	xQzwMwVRT1be2xEf3bFT3ThhnD0b1POfSg5PedkXyA1dL3Xp/9Svad0DO
X-Received: by 2002:a05:6a00:c88:b0:836:6f2e:bb6d with SMTP id d2e1a72fcca58-843495a4f68mr144243b3a.14.1781207415611;
        Thu, 11 Jun 2026 12:50:15 -0700 (PDT)
X-Received: by 2002:a05:6a00:c88:b0:836:6f2e:bb6d with SMTP id d2e1a72fcca58-843495a4f68mr144211b3a.14.1781207415130;
        Thu, 11 Jun 2026 12:50:15 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-843380c93d1sm2711872b3a.36.2026.06.11.12.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 12:50:14 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 01:19:40 +0530
Subject: [PATCH v2 1/3] dt-bindings: media: qcom,qcm2290-venus: document
 shikra Iris compatible
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260612-shikra_vpu-v2-1-bf8727370a1e@oss.qualcomm.com>
References: <20260612-shikra_vpu-v2-0-bf8727370a1e@oss.qualcomm.com>
In-Reply-To: <20260612-shikra_vpu-v2-0-bf8727370a1e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781207404; l=2453;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=AVhnklETdUkp5mvKfLSwdbQnYbvNLPhgr6Rf58zew30=;
 b=xvHzaET2RfPfSYysTDbeaqWlhg9S4KsIw/sHRKVu9Rh/LH5C2RPvzj90btuq7UwUZ0FYZvFXT
 egsJIUcFrgZB/b7he06r2YKNzds5iFWi7PWgxNrWXZ7MXzjdJA6glai
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-GUID: p1aYaqjVdIecySwxJuMAhAqtmTzY0Hhb
X-Authority-Analysis: v=2.4 cv=c4abhx9l c=1 sm=1 tr=0 ts=6a2b1178 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=vu35gHCjgte05Dde9DgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE5OSBTYWx0ZWRfX1+Gcb7EOrb7T
 2OKsJyXIiPKiBv37zKlf9Ht7a7weG5gD6oOJWIkFeWnpAMB7j/mObWswOHjZSwBjKAO31pkoos/
 sKMygAeHRljFkwjiqzyDUxkmYa8o9P/6bczz3ZYcObXh/2kdqz/AfrvjSrz1PvoMdIF47aH1CTz
 5L3W3aASXTbuBhbbSi3h/xNR6YRmDViM/0nm6CQ+Er4k9uZ6YNmxXLxO9T4N7W6M1VE6hEetSDz
 OeXZONNcVRhkjVxGWl4OIRdADRqtM03+OoObRffzD3Z1r3P7P0oxyN5I+mJozgprJuX47QQL6w9
 ZD+80Z6vsKPVF5a+fEsK8fm2eW0U2bgzbamODduTtGvoOpZK0TKjw5T8yTVwJ6pMLEJ0yZJg98r
 pY76XvZQXzvK6GhD8r4obc6NNw7M45XfuW23/AsX0DbaePVO0/NY9kjjooQrNZ1BGi+skjALB7y
 +CvErV/eJSCd3L8/T6Q==
X-Proofpoint-ORIG-GUID: p1aYaqjVdIecySwxJuMAhAqtmTzY0Hhb
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE5OSBTYWx0ZWRfX2ddBT5p8n/Py
 j+pH4BmDVkDeso3bEkyMT7fybxb2z8aIT+3Z7gD80CKfbTrhwlHg0jbu5qq1YnGEQ8YwJNXUYAT
 5wqUBGutjoQGaH/sRJdU7n86M3+lTfY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110199
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64613-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jorge.ramirez@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:vikash.garodia@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
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
X-Rspamd-Queue-Id: 0C72F674DC9

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
index 5977e7d0a71b4fb5681f1c2094439c251366f01f..dec7051224d1610b8b3dcb1750152eeda95d3703 100644
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
+              - qcom,shikra-iris
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
+            const: qcom,shikra-iris
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


