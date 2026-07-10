Return-Path: <linux-media+bounces-67254-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6L4aDX22UGp13wIAu9opvQ
	(envelope-from <linux-media+bounces-67254-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 11:08:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD59738D71
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 11:08:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=mwSt09Iz;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HAym3anZ;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67254-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-67254-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 761653059A60
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 09:05:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42F263E3DBB;
	Fri, 10 Jul 2026 09:05:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C983DB31A
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 09:05:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783674305; cv=none; b=UNE22QPTBPCZQt3hEGU3UfiO6s3GdGLdSCyzbJp2yBnAyxUp/GfZQ6mlIKG6mXXLcU5S9jDNI/sH6Igrkw/QTJSy8jnFVRzqlbJvoQkShKLQ9d/9vh8PKELNcYNONBTVukJAeYj4xZ2QQ8FQEw7emP8Qzer46aT+krotDeLaTSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783674305; c=relaxed/simple;
	bh=LkFnGFAWssGPIbolVdpYF874p9uyyDT0NSK2OsrJn1E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dIDhNjSbT0Yoq5R3kp7zu0hHMy508RpJP3rDhJVM9BLJdeDw8FPS5tKHHENKeNVsrb5ozrgba5DoWh2a2sfJynYNUU4XYesl5HsBlJ8wvq+aMdtwYb1k0LzkcsfklIJsw6rQK3aVOOLXWS+6thguilLm5tAme7Aatk7CHB8iPUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mwSt09Iz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HAym3anZ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A7dsIr188298
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 09:05:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kJoazphX4WE+SBI8eVQ4A5Wnlq+yoJNtNK+pdddGKWQ=; b=mwSt09IzPnNNl5TW
	WhAA/t5I8Bq7dJsk83S6TeAHUlzRb4hg72tsGMPvuhfvByTdPQAaMkAqpLfPqduZ
	VlG3P4PDwj9oKIZUBSbekhOo7Uk+Zoi7Cj4l3mbg78n0P2XF/u2foj6+bwGBczMK
	3jsyrxjiN1Xoo0Azyt3C8upGzOtJvpInXAstG4FkGMzXb8qm1ylLVPDLEALPH5A4
	4ZSngC1VzHNmIi/+zKkqhcyDuEQDSdJWnCkJT/JYzFpvmmzD/LvU/3uEdqNhgCO7
	FjN9+UU0OYW0CR0SvR/ts30sx+Hw/uKffYlSvbKZ3dw59rTdugmdtZx07u1J/Q1D
	FMrgpg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faeesup7b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 09:05:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1852a86fso7489011cf.0
        for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 02:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783674301; x=1784279101; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kJoazphX4WE+SBI8eVQ4A5Wnlq+yoJNtNK+pdddGKWQ=;
        b=HAym3anZIzCt/7LCqz0juTlrafRarEow98naC2vrtJFHg7c9PJcsGZeX0uKyaNrUy1
         ZFwDGGdh3Pk3P2bjEk0k2ztCkfT+w9HeaMOR0KS/aCV/hrq++X9Z6qrgLnA2njmG85yb
         8IsRaFa0EBBPyJLGbrLNce8hMZ3FD2tJDlP50hrCHFaUuBoTCjIPkCWxzYC9GQ7hjW+R
         tDM8lb6BFyHwEL1kJBG7tH5NmaE8gYPsCy/tlCoUJzwye8sFAPtb4J9KYMPLDzrcnumb
         8b7FJgEBOBLy+w6DU5N9e/Cnhi0o1sBgcWzUohYVJSPRq6xrCxHnygMQyHOfReq5yoVR
         rA5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783674301; x=1784279101;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kJoazphX4WE+SBI8eVQ4A5Wnlq+yoJNtNK+pdddGKWQ=;
        b=hqf9wP3LJduaE0ZXONIOicsO/nHVWiuvZuiu9dLx8RnZTF0BGgHLzh8xUNbweGi8J7
         jxcnunxEiAHpyffxYl2SVWUceSOBgTWxTrh65/ngxGqdMsbVR7LOhw3t8SfQw0Q0lr4i
         0/URSw4+Ez8HmfLs2e2xRyOELd4pszMfHYT5mvodmkVoX/arbc1DP27V/ncIGfAXOpor
         pWF77MCL1vKIGBXxy+IODldto75VX2ui4jPyrx1td13pc5nXZjuecyfNCrsOOo4S0Lrh
         yshDbYGKufUznl19UqXc+3p19dZQDZ6/EFiR3VyrAaH0wTEob3+clT8YFNCiPS9AD3y3
         LXxA==
X-Forwarded-Encrypted: i=1; AHgh+Rq/oGhxDCMO/YKWbL2Dg2uSHNxwWN8m/phAzZW7ofEpKkyJrVOwVNDOWjylIQ4wLUNVk7Y9J6ra37PMMw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6BNHMRiItgGq0u36ACoJRodbbUXihXxfTTBrR2SKyvQzBMYWE
	VgPJML70ihCE16poQH6f+MeAMGqjI1B9OZYhpZhqMMmDR6M1bQXLLWhpLoxPgwJoc3yoev79BYm
	JSDKcZyeOo2TSxXPsX49rpA/blqgtb166v1adXrbIczqQS+FLn6HdNv1Gc4l7rJxiPA==
X-Gm-Gg: AfdE7ckZcuqZm2GCWMhJEj9MrFvLQyJ+jdA3fsr889XXN8u9t+pezckEMVIJUhon2Yo
	FH6jkSIWBAygI2CnqOp9eRjO3HckC5H4LPsM+2qunEzyIRbnMRMHYsiQ9gaD4LJcvRyiBfFNa36
	3fXsKWNWFXeJETMsW9IJhmkqq/vHCDLXJgO6X2Y4dEEnfbN6XxM+iF37IQViIhisXKmPlOL7AAu
	2ONT9bjkJDMNH1bSOloyJjhWVjk7R5XFYIFB+Qa7ok/EiZmwD6+sQJlggGnUcI6q0xxhA6ul4py
	XpZMIcF25264YowOatlWcGhy8F2cCRsC+VpwvRfq+AgwaEyOpAsCOMi7rJFKsf1NqzKAXxgpfIg
	Y2li7W9kpibErjUK2dOdwQbVV7HdhdJz3htXBSy2CenAfBEGGyjCnkDhd6hYV08jxUUMcrURsmd
	QDYiY2lyyv2Jws7AWbklDFy1ZKuTOwdkvRqEIeu9rw9r1RSpvNDMxj4OoGX+7R9w==
X-Received: by 2002:ac8:5f12:0:b0:51c:83ee:e429 with SMTP id d75a77b69052e-51c8b422c6fmr109839621cf.78.1783674301393;
        Fri, 10 Jul 2026 02:05:01 -0700 (PDT)
X-Received: by 2002:ac8:5f12:0:b0:51c:83ee:e429 with SMTP id d75a77b69052e-51c8b422c6fmr109839171cf.78.1783674300888;
        Fri, 10 Jul 2026 02:05:00 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([82.64.236.198])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15dfda815dsm259932266b.36.2026.07.10.02.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 02:05:00 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 11:04:50 +0200
Subject: [PATCH v4 4/7] dt-bindings: media: qcom: Add CAMSS Offline
 Processing Engine (OPE)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-camss-isp-ope-v4-4-51207a0319d8@oss.qualcomm.com>
References: <20260710-camss-isp-ope-v4-0-51207a0319d8@oss.qualcomm.com>
In-Reply-To: <20260710-camss-isp-ope-v4-0-51207a0319d8@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: K0bEEUvJCS1y2QpAYf7kBSSjpx3a55_n
X-Authority-Analysis: v=2.4 cv=bbpbluPB c=1 sm=1 tr=0 ts=6a50b5be cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=l64rWm3OqFMOLA4dSg0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA4OCBTYWx0ZWRfX8ugLr0zIT6PG
 NgmXLoi5yXgUbo4M1Y3jDh/fPpLFYZzVL5tQmmfmCdwsd+H3e57NkCVe3pJ7fjK01RoWsZqHo9H
 yKIfSdHzWJPsvvq4zximGIzPb/RAwLM=
X-Proofpoint-ORIG-GUID: K0bEEUvJCS1y2QpAYf7kBSSjpx3a55_n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA4OCBTYWx0ZWRfX+e+hWuH8q9lx
 HgEt+Y52cgB6tBZRjJ63u6UbjoD+DDSmKKT5iukYxqj0NtDnQ1tVis9uCwqydCEOIhz5CeSyzhS
 F3xeA4JTCxAr0iv/sTHfFSs5vKjsX0xgHYjYp32vdCV60LsJvQ2OJZp2WJ/IjILjlhdtluCNmUi
 ACEXNv75l6doWRt5ouXDUJGzzjWCvEs9Y7dX3KvXUWbLHJeYDs/jttmGv1krJ+AzhqPcAADRqQK
 IjJhefulzaYnBX+D9Usf8JwwFNfk5ChAvOSrle3M2NR8SVgwjTWhWCnbVWeoNry7dA8WzpzQ+I/
 hgkuwLK9KRcLoXLuv1uHPHZI+y2bQCmQ4C4D+1RjXysfQ5s8MLSHK2jIoEzZEmbxho/my6gwNaz
 oQBJlaCHQxED+7elohu1YvV8Agr53YnR5dV7FNQcC11sRAxyVQP/5zlTsJwdUMKpsiuvQgBan/G
 Pt/tp6wkizCQ48ugcdg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100088
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67254-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,devicetree.org:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AFD59738D71

Add Devicetree binding documentation for the Qualcomm Camera Subsystem
Offline Processing Engine (OPE) found on platforms such as Agatti.
The OPE is a memory-to-memory image processing block which operates
on frames read from and written back to system memory.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../bindings/media/qcom,qcm2290-camss-ope.yaml     | 147 +++++++++++++++++++++
 1 file changed, 147 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..58bf79ca447f7173933f6c5641add1f8035abc4a
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
@@ -0,0 +1,147 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,qcm2290-camss-ope.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Camera Subsystem Offline Processing Engine
+
+maintainers:
+  - Loic Poulain <loic.poulain@oss.qualcomm.com>
+
+description:
+  The Qualcomm Camera Subsystem (CAMSS) Offline Processing Engine (OPE)
+  is a memory-to-memory image processing block. It supports a range of
+  pixel-processing operations such as scaling, cropping, gain adjustments,
+  white-balancing, and various format conversions. The OPE does not
+  interface directly with image sensors, instead, it processes frames
+  sourced from and written back to system memory.
+
+properties:
+  compatible:
+    const: qcom,qcm2290-camss-ope
+
+  reg:
+    maxItems: 5
+
+  reg-names:
+    items:
+      - const: top
+      - const: qos
+      - const: pipeline
+      - const: bus_read
+      - const: bus_write
+
+  clocks:
+    maxItems: 5
+
+  clock-names:
+    items:
+      - const: axi
+      - const: core
+      - const: iface
+      - const: nrt
+      - const: top
+
+  interrupts:
+    maxItems: 1
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: config
+      - const: data
+
+  iommus:
+    items:
+      - description: OPE read (fetch engine) port.
+      - description: OPE write (write engine) port.
+
+  operating-points-v2: true
+
+  opp-table:
+    type: object
+
+  power-domains:
+    items:
+      - description: GDSC CAMSS Block, Global Distributed Switch Controller.
+      - description: CX power domain.
+
+  power-domain-names:
+    items:
+      - const: camss
+      - const: cx
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - interrupts
+  - interconnects
+  - interconnect-names
+  - iommus
+  - power-domains
+  - power-domain-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-qcm2290.h>
+    #include <dt-bindings/interconnect/qcom,qcm2290.h>
+    #include <dt-bindings/interconnect/qcom,rpm-icc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    camss_ope: isp@5c42400 {
+        compatible = "qcom,qcm2290-camss-ope";
+
+        reg = <0x5c42400 0x200>,
+              <0x5c42600 0x200>,
+              <0x5c42800 0x4400>,
+              <0x5c46c00 0x190>,
+              <0x5c46d90 0xa00>;
+        reg-names = "top", "qos", "pipeline",
+                    "bus_read", "bus_write";
+
+        clocks = <&gcc GCC_CAMSS_AXI_CLK>,
+                 <&gcc GCC_CAMSS_OPE_CLK>,
+                 <&gcc GCC_CAMSS_OPE_AHB_CLK>,
+                 <&gcc GCC_CAMSS_NRT_AXI_CLK>,
+                 <&gcc GCC_CAMSS_TOP_AHB_CLK>;
+        clock-names = "axi", "core", "iface", "nrt", "top";
+
+        interrupts = <GIC_SPI 209 IRQ_TYPE_EDGE_RISING>;
+
+        interconnects = <&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
+                         &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
+                        <&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
+                         &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>;
+        interconnect-names = "config", "data";
+
+        iommus = <&apps_smmu 0x820 0x0>,
+                 <&apps_smmu 0x840 0x0>;
+
+        operating-points-v2 = <&ope_opp_table>;
+        power-domains = <&gcc GCC_CAMSS_TOP_GDSC>,
+                         <&rpmpd QCM2290_VDDCX>;
+        power-domain-names = "camss", "cx";
+
+        ope_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-200000000 {
+                opp-hz = /bits/ 64 <200000000>;
+                required-opps = <&rpmpd_opp_svs>;
+            };
+
+            opp-465000000 {
+                opp-hz = /bits/ 64 <465000000>;
+                required-opps = <&rpmpd_opp_nom>;
+            };
+        };
+    };

-- 
2.34.1


