Return-Path: <linux-media+bounces-56712-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OF3cAUk6wWn2RgQAu9opvQ
	(envelope-from <linux-media+bounces-56712-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 14:04:09 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3477D2F2721
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 14:04:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5011F304C956
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 12:58:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E52023AA4F1;
	Mon, 23 Mar 2026 12:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h4bOTYQu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fgPPo+Z2"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6763AA1A5
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 12:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774270714; cv=none; b=radKlW8+/yWdTSz4bT74FhUimkMxcawK7ZpUUDHMNb41uLb1mFC3EXIUJx6/yr5TENZTL2C6i7nmPFxnOhVKex2J5MHxKosGmxe4x5owwFZtGdl7vr5ZZd/GB9k7Y5PaECgLUzM9OzCJV9M0hLXMoZC3jmgHwAoaw9/1HCPoPzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774270714; c=relaxed/simple;
	bh=KQty+qIegyI7QufJCyR7H0o8gE6RrZyNKWlDUtYTku0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SrRYPPMJvIq2gkw1ytI3zotsFsQonizTx9pDmGQTf/aYd0l2vpMyjq5J8gDyZYnAT1MsV/sp0udBhDVHM6xIttn6hG9XUxjJnoQJYCGRt+chlyYyq8NCfIfJEApBjY/LuR5XQ9XWqWPjuugehPwlajyHVmKNm+lD0Y0frhnO+Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h4bOTYQu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fgPPo+Z2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7tn6i3468097
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 12:58:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FbLe/4W/tcC
	wJ1F3660nrpNBZS4syb6G0J+e/7YYzwk=; b=h4bOTYQuq6bUumUdz1goKoJmtmP
	61wPfGPcWf0P7W3vwebwPwsBmXTf2aEbZRDWhXO1SzZil63qzTx4ZL+iJV7xgrzx
	Ruih3rYl1qjfMxOk5pEhBwrKc8QajTqXUZLDuatpy3j/8t/+KFhFLa1Ht+CpqRRl
	SnuauOEQd6dKmxb1ZvHpN8WvZN1d5W3p3uTRDNaxhqxSRW5XsXYkEmcuruAxajX3
	D1CHsXy4A/b/jH9C+pGlnLNMEm6drfBIzUUxLq3bLInenKy5FlGvkb/Dl430vXDG
	eV+Sf/ORoBT7eCKwRvU7n4ybmip8PFKiowXuYs9neVuT0DwilT+xsswtL8Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jgh1k9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 12:58:32 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b5f675be9so95495281cf.0
        for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 05:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774270711; x=1774875511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FbLe/4W/tcCwJ1F3660nrpNBZS4syb6G0J+e/7YYzwk=;
        b=fgPPo+Z2UGz7nJREYLFJdmZvTabFKwxnTPpmSGe1IEN3CVK6spK1ENjLEbTHwmD/sH
         5uyBwR8bAYCjIV6PvUkJK9lpi9nLMTq7LlmCR6mSHMK4/t74XbPTyAqzFTPmb5An1otI
         Xga1BIdQFA/gq9gQ+Qr9jh2e9HoFrChNOmIGHQQcQ4abwFMhkJFN28VE8BR097YXTCLh
         C+4khq6xwA39r7ox92Bscs+NB7g/LSqFjJ1b+91ZW/a1RVAAAzTNYdsMvQTvq1xfdmEY
         8/xgbd1j27ngKE8tCabbGFvMFe2YKQLRjvBMk50+AW1hKJ5omcG8KfYYEft3cF66hRV3
         nDCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774270711; x=1774875511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FbLe/4W/tcCwJ1F3660nrpNBZS4syb6G0J+e/7YYzwk=;
        b=cTC3J5HmFEUdY+sWepHuK1bdFoIWPThv5P5HIwjO8GYOFAPr9fESkvI8ItaM4+mkO5
         MZhH/dGAjLJyCNGsOR36mYB4W+OtPERAxkv5QJFcMO5dOLWiCJne+p0hfVdTbursG3SK
         YO6Sj1BkRimXp2P1O3PxP634V4c13z+6pNoF9aCeExo3XfEn0/n/Ey4lC2rm/KosUpf8
         8DhAFKuz4Zcw+gIsy6/Diii4M9ns8SY1kQ6f49QOUcqtV2giOiFBDFKY9RhHQQyWIdR1
         4dMVLNNaeBoN3rz8hZt4FjD/ehGfvLSxPMYejhJ+MUfkQNIhs0BNLJGNnSOwBnRXrfqm
         ebNw==
X-Gm-Message-State: AOJu0Yw5abOJ0Mht3mnQEHKSjVl9uACuOG5X0v59UcoKAt6RmvnsZSlV
	titBAoBWRqvGVokLAli+7X1m//IrrOfr2yVwrTeH0pxuXs9a08W0MRhmPerscENe/F0FfNX3EXH
	KSTk8Iy8fPKTZ9bfeypoqeljbmZ93NV6DnwYyCtJzSJhgSg3IVSvJ8gpjQM73/MIZ3g==
X-Gm-Gg: ATEYQzwQBfNNykeoLHENP3nFWlSZYClgmYfF4Y0OvFpY+YodIj/dggF7Y9TaznItIT3
	rCUQ0LgysLpV9HVnaoo4voRhiMmbGmqzo89BSRK/dLvsTpcZFY9JpSMDXuLoBSsPS9ftg8mvtkt
	zbg+Qls90T5Sxf8R7ig3zMQXRqcB2JVnyvuyU/yd5VRuRXspI/w9N1uRBslOPjDIHCuB7L4o8RC
	QZGypOzETqYsM+oPRItFFYYZ8IV4m8XGFpsUtEnQPKzTg+BxqXTHTteoVAaQia+jbftLoJWzpRI
	HCiK7urFeAQ9a+zECZdWdFZprt18d+Yocs+TPhXLTiFf1sUwyjzKUWG+r5et1ZOjh3cDgOBh310
	liOa3zAMG2ewFby6br51F+pRiLyxJspK/wslxGrAz2O+SFzhJ2yqDMAwBcdKgvA5KKUDyq9TbEQ
	bZufPIUPTnxMFB
X-Received: by 2002:ac8:57c7:0:b0:50b:567a:e941 with SMTP id d75a77b69052e-50b567aef11mr67494371cf.36.1774270710918;
        Mon, 23 Mar 2026 05:58:30 -0700 (PDT)
X-Received: by 2002:ac8:57c7:0:b0:50b:567a:e941 with SMTP id d75a77b69052e-50b567aef11mr67493751cf.36.1774270709953;
        Mon, 23 Mar 2026 05:58:29 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:830:450:d9f3:cf55:9f3d:be1c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b98335ddfb9sm487139066b.37.2026.03.23.05.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 05:58:29 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bod@kernel.org, vladimir.zapolskiy@linaro.org,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com,
        robh@kernel.org, krzk+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        johannes.goede@oss.qualcomm.com, mchehab@kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [RFC PATCH 1/3] dt-bindings: media: qcom: Add CAMSS Offline Processing Engine (OPE)
Date: Mon, 23 Mar 2026 13:58:22 +0100
Message-Id: <20260323125824.211615-2-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260323125824.211615-1-loic.poulain@oss.qualcomm.com>
References: <20260323125824.211615-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: skJs1oy3gRRdIBkriI751tXdnVtNTSvD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEwMCBTYWx0ZWRfX5sGJJ3kYl3nv
 zUmKIYlXhjvty6w6ibW8WSKqWN4sEXrinwXimz902sL1eQNTk49jMNW6JXJ320+8x/OFNPP53Cj
 ZV5LiaqzyIsWuprFzTtbFvDLJgIb2oPD06vgcAf/hpvG2rOxODmi95K1nUZNDC5yxWRu/dW5GNg
 9FdpLHE6b15vAwEzfMp+5FveCORa00trEmc0/mYtOSCkHFlMQGsrwklnMKwH9qmDsKeQBSwJPjR
 xIzWo8hUNVe0xGohYa7roE5jbKli5yfBzXnYCinMAswiRBZdN9ETzvcI9Kbm5b5suqjM3fQiD/r
 lzcx9tDmgB/YVq0GoTvJlLobpmGjykRzMXJobccVn+oSToArxX9NI1eOouHA0mlzRW6/AxqJ3ub
 p7N1kqGMadAqfwiPdDOVu++d7L1DG+16t9UC7D7zdH2gmga18y54mjVS7H4WsvYAatBuee/Fjuh
 p9brZaYttoMnssLrvpg==
X-Authority-Analysis: v=2.4 cv=CMInnBrD c=1 sm=1 tr=0 ts=69c138f8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=SSwZ1itlJRgpVSTRIaIA:9 a=kacYvNCVWA4VmyqE58fU:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: skJs1oy3gRRdIBkriI751tXdnVtNTSvD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230100
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56712-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,devicetree.org:url,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3477D2F2721
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add Devicetree binding documentation for the Qualcomm Camera Subsystem
Offline Processing Engine (OPE) found on platforms such as Agatti.
The OPE is a memory-to-memory image processing block which operates
on frames read from and written back to system memory.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../bindings/media/qcom,camss-ope.yaml        | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,camss-ope.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,camss-ope.yaml b/Documentation/devicetree/bindings/media/qcom,camss-ope.yaml
new file mode 100644
index 000000000000..509b4e89a88a
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,camss-ope.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,camss-ope.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Camera Subsystem Offline Processing Engine
+
+maintainers:
+  - Loic Poulain <loic.poulain@oss.qualcomm.com>
+
+description:
+  The Qualcomm Camera Subsystem (CAMSS) Offline Processing Engine (OPE)
+  is a memory-to-memory image processing block used. It supports a
+  range of pixel-processing operations such as scaling, cropping, gain
+  adjustments, white-balancing, and various format conversions. The OPE
+  does not interface directly with image sensors, instead, it processes
+  frames sourced from and written back to system memory.
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
+      - const: bus_read
+      - const: bus_write
+      - const: pipeline
+      - const: qos
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
+    maxItems: 2
+
+  operating-points-v2: true
+
+  opp-table:
+    type: object
+
+  power-domains:
+    maxItems: 2
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
+additionalProperties: true
-- 
2.34.1


