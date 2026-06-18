Return-Path: <linux-media+bounces-65168-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id s1ksOF3LM2qcGQYAu9opvQ
	(envelope-from <linux-media+bounces-65168-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 12:41:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 904BA69F6FC
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 12:41:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=gCIVh2UU;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XSU6psx+;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65168-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65168-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C02843159B41
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 10:38:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB11C3EE1EA;
	Thu, 18 Jun 2026 10:38:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D299D3C13E9
	for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 10:38:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781779113; cv=none; b=Y/awisyJfW8MbMdYYpfqdR21XonisLmo04oZtcg/ob5+l8i5794tpG+oHECMlTIcOJwMXjZmzelldbMepK8cIsvTHR6RKI5y1Km6oMJKR8rSHsd+4IzPR5D/uJ8m8BQonKp+Vev9QdbQGKDpKWJz5a4CyEONA8vP7p33rza/rFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781779113; c=relaxed/simple;
	bh=eSkFI5t6hprmrdXrRPzVamv5V/JatdRl+BeQjBKafZs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pexkw2+A4tGhz/uqjnkG1du5go/ybq67pvpk6roRtSd/vTsBzyxNbXN8Ey2DD7T9/xLqL/dEnzYDcxe5UBbP882g2f2Z3OvV/ErmVH1MAN/Zog7oj7+6S91+ofrWYMmV0/mRu+9VKEJ0XEBTJJXt7/7K2b3V6ANN3XuPGh+0npg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gCIVh2UU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XSU6psx+; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65IAJxTL1524636
	for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 10:38:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yf2jlXAbj2YnI2cYC4j4v6Rq+TD6gPSztRDJGC/3ss0=; b=gCIVh2UUD2Pk+v0O
	+TgJONgNUEOqfeodq7EsS2O98qXjeGrV2fHX3YB7Clifyuuf8NiKbcC8F7znvey1
	lBqMH9Q0l3UMPm/HeS4sMeGppcrt1y7U0J6IM0xHvyALGAzh65AYy/eRJ2+v3h70
	kXO1SPkvoW6wyyKCFwwkZt7BF7s8WtUPI646Fn1WrlLmU4bECOLetGhwr9+j2iUY
	6JXNHlsB+SDbGCgpPXp9i6WTz64Y1+BGgEgfc4U2xSM0m1lumEZ3YAu49MzXQWJb
	s+4Nmw6AtXmCBWPl7CWjrcu7FaVWn9b0iTKV965AZKPRFYEEjTbXSVHwGs1NfTGh
	ggMHVA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eux2jv58h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 10:38:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-91574ad681eso152545085a.0
        for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 03:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781779110; x=1782383910; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yf2jlXAbj2YnI2cYC4j4v6Rq+TD6gPSztRDJGC/3ss0=;
        b=XSU6psx+THw1fiBPN1dMldLnvC+il3ZNdKUOMA0jwnVc88Gf5eux7N6dYGcubvbhgT
         2kKN0WarZBljT4fX8GiTBx5c43c/U5ysnGAor+t9Sx21Z10pLDXKHNNXl4xZVtTLxyla
         KeT5zzxfxg37o3CPpyzUK0WTj+c0zhnLR4C5J04rdpqoV8Zcs5KFCBrp33NTxuihw8pp
         wxxfxkUbzfWpcltv9xSiSuvNyDVvNSsWCEr5y+fWKJz3eyYrQT5Cs/bbtfrpzSu4rtIg
         eAOY8bL4dXUTdsSBd4OyO7MJzl+KyoBorYxjVqbr0FC5w3owDtA26ZEvGwJS2SmNL7ch
         WuEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781779110; x=1782383910;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yf2jlXAbj2YnI2cYC4j4v6Rq+TD6gPSztRDJGC/3ss0=;
        b=dFMdd8WwQ8rW8U+6zx6xvyeRc4m/6EOHWbvFKvUPf4uAp40cZCOQbNcIROnPJ2U2G3
         fdIKOqAHdUrabdXCYwlzq1F+pjdEcPOPHkQP695pufDS3x38Gy3VhDEneEUv8tgT9CtG
         HMxBtKC9AhGFEAMpgdXSnW2Tc9BWIyblIYqh3gZmB+yD2YWTq1jIHwSxQW97Aa+FGheA
         OUPWrYd65QVl7NgePW1fONJCYLq/K3OZok1UphZKsruI765Re/K31KBT+aIKArtC9rUG
         pCTHPEujudgip7U3sApi3TVNlzcQ99SnfbSNSoRr/2KRKRsw9tVSCr+3Slcbryf6HzuZ
         c4Pw==
X-Gm-Message-State: AOJu0YwIGkvlPq4xwDNZfqGcwbuE5A09SMhRytYwU0ocPsvBpe/MXpWU
	yDPQuFg7B1sMUqZecvbu0MD7A7CayqfOgJbYxTHCEL703tUn8BcCapDLKK7CxtdVpMVwsbpi7tm
	x/0g9sngWwSGV8906ZjjZY56dF9a/WqQ38grQ/7KtQ472gyV2fLvPnHaijtcpAH9zQw==
X-Gm-Gg: AfdE7cndCVU/KAbn2Nu2mBGiwV1Wa72aY4/srthNm3EphdGDMOKiVAINdJCSAiHBq4H
	c/5ern4oJL8+D2Vl40nZvTeNpPotvNy4MzUp62i19kd0CKctQ9eQINpBgBbKmcq8xbY7nAmFjG0
	psj+RooPfT28Czk7fd4oTKZijsYoJDYThniO6Sl/qCV7XD5HDW3eew3u3SdUk2yhLYbMok4CKfY
	0qnWGyC2FYz2+IAS9wZVZbFo7TxsVw9kK0ep20yafhVA4a219BxzUf73NXiyktfaAjD6pTgK4+t
	biTcquhLPapBWr+Bi9WqJFEU0V+5taFpkaa97MaHiYzaEoUAfr1VFuWa8KYo153I3XBE2Ha+DXs
	tIGF8T9Oaj8xJl4nzqfl/SdmoxNfYWXnPo1Ln5Fz4iyp8kcKXM/UfFRZfdEvnkWQ+aahVgiSlX4
	NEPF4=
X-Received: by 2002:a05:620a:172b:b0:90d:c28d:9666 with SMTP id af79cd13be357-91d8aae0b22mr1344635085a.30.1781779110068;
        Thu, 18 Jun 2026 03:38:30 -0700 (PDT)
X-Received: by 2002:a05:620a:172b:b0:90d:c28d:9666 with SMTP id af79cd13be357-91d8aae0b22mr1344630985a.30.1781779109575;
        Thu, 18 Jun 2026 03:38:29 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9161a04b472sm2029316185a.37.2026.06.18.03.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 03:38:29 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 18:37:43 +0800
Subject: [PATCH 1/2] dt-bindings: media: i2c: Add OmniVision OG0VA1B
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-og0va1b-v1-1-dda71bb83009@oss.qualcomm.com>
References: <20260618-og0va1b-v1-0-dda71bb83009@oss.qualcomm.com>
In-Reply-To: <20260618-og0va1b-v1-0-dda71bb83009@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781779102; l=4118;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=eSkFI5t6hprmrdXrRPzVamv5V/JatdRl+BeQjBKafZs=;
 b=+Gq58PPajRPg8IeHPL2PV0bsfTPsxhNKshWLiwnF/PCoIBUiAiz1VPU+xkufFeJZUGINirGJ9
 syG5hXrExYwAWgvLrxtZlKiQ2BQN5yzcUzRa0QqbhRl9BIFc0WGIb9q
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA5OCBTYWx0ZWRfX+q5LPjkvAYeB
 J7U+JSUwiYbERj4/YEuPchus1sH+PJ6LA9tznun2lfn2usnv/XvkJfnQPW1bV7w8xvlvHBqu1P8
 eWGL+yoTD0b4P2SefkLIIg3A2BkKR8XAkaecfb4v59qIHUYHCfLF9ROO6cwEQVA8wLeMDtQNd7C
 CMiiDagWYsnTOXprUOjeYqmo2g1KgxPYDCs22UVtpuSEByt1SEMLguLeWYSSHKc7vMa80Ta+BVR
 N8zgynQZInc0K5jutm1k2eqD6BcuUi7mEjIFmGvbdSBkU0k2I6OvVnCSBQo2dpO3mFzcQmZ3LPR
 8ZjdoOsHuD7PSAbvqzoonZ7OBjr0PUzlPh0AMura8vmF4qGF7LH6tQFJa8rqDzqzdiElaGG9VV9
 j8E7j+uzbwQlyqSACGVuZTamjaB0CS/17BzTIva7JPa4GlDRFKnMbYe5HHFn2jDhUXT8hujGv+q
 yFTg4ujmdvn2F+pZXRQ==
X-Authority-Analysis: v=2.4 cv=Fsg1OWrq c=1 sm=1 tr=0 ts=6a33caa6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=mTQZ0Vat4jrIGxsPDm8A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 6dwjJf2-GV2HRviSuwmB07W_rKYPx1rE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA5OCBTYWx0ZWRfX4BLPw15ZUqlt
 Lcb01aPtK7uRpdHWs4SYYPWa36oM7HqENY08P+8U0CH+6+0Nu/5WNcpvE+pHuv98sHFs1+o3yP7
 7fsuxNRrS3JcVrMzvyuYbAk6ldzNJVM=
X-Proofpoint-GUID: 6dwjJf2-GV2HRviSuwmB07W_rKYPx1rE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606180098
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65168-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,devicetree.org:url,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:wenmeng.liu@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 904BA69F6FC

Add devicetree binding for OmniVision OG0VA1B image sensor.
OmniVision OG0VA1B is an image sensor, which produces frames in 10-bit
raw output format (Y10) over a 1-lane MIPI CSI-2 interface and supports
the 640x480 (VGA) resolution.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 .../bindings/media/i2c/ovti,og0va1b.yaml           | 104 +++++++++++++++++++++
 MAINTAINERS                                        |   6 ++
 2 files changed, 110 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,og0va1b.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,og0va1b.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..302afc41bb776f75c08b26ac2f04014f8cbea4fa
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,og0va1b.yaml
@@ -0,0 +1,104 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ovti,og0va1b.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OmniVision OG0VA1B Image Sensor
+
+maintainers:
+  - Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
+
+description:
+  The OmniVision OG0VA1B is a 1/10-inch black and white CMOS VGA (640x480)
+  image sensor. It is controlled over an I2C-compatible SCCB bus and transmits
+  images on a 1-lane MIPI CSI-2 output interface.
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: ovti,og0va1b
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  reset-gpios:
+    description: Active low GPIO connected to XSHUTDN pad of the sensor.
+    maxItems: 1
+
+  avdd-supply:
+    description: Analogue circuit voltage supply.
+
+  dovdd-supply:
+    description: I/O circuit voltage supply.
+
+  dvdd-supply:
+    description: Digital circuit voltage supply.
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+    description:
+      Output port node, single endpoint describing the CSI-2 transmitter.
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            description: OG0VA1B supports a single MIPI CSI-2 data lane only.
+            items:
+              - const: 1
+
+          link-frequencies: true
+
+        required:
+          - data-lanes
+          - link-frequencies
+
+    required:
+      - endpoint
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        sensor@36 {
+            compatible = "ovti,og0va1b";
+            reg = <0x36>;
+            clocks = <&clk 0>;
+            reset-gpios = <&gpio 42 GPIO_ACTIVE_LOW>;
+            avdd-supply = <&vreg_2v8>;
+            dovdd-supply = <&vreg_1v8>;
+            dvdd-supply = <&vreg_1v2>;
+
+            port {
+                og0va1b_ep: endpoint {
+                    remote-endpoint = <&csiphy_ep>;
+                    data-lanes = <1>;
+                    link-frequencies = /bits/ 64 <480000000>;
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 069b4aa6b523c72b661418d8f37cd214a061f9af..5aa846c8479b20651291d5bd2e316308310f826c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19886,6 +19886,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/ovti,og01a1b.yaml
 F:	drivers/media/i2c/og01a1b.c
 
+OMNIVISION OG0VA1B SENSOR DRIVER
+M:	Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/ovti,og0va1b.yaml
+
 OMNIVISION OG0VE1B SENSOR DRIVER
 M:	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
 L:	linux-media@vger.kernel.org

-- 
2.34.1


