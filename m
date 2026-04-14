Return-Path: <linux-media+bounces-58693-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFiwLjjK3WknjQkAu9opvQ
	(envelope-from <linux-media+bounces-58693-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 07:01:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5683F594F
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 07:01:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8B7FB306B9D7
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 05:00:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6235514F9FB;
	Tue, 14 Apr 2026 05:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="apcGzutO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S0/E08zB"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B09125A9
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 05:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776142838; cv=none; b=NingGvGn3xT8kU9erI9RdBADQG0y52VV4ToibsD0S9ug082oG+u0r9vi9OQ+d+IgwFQ86fHFfN6ZWnDVBXNB7n1t8+V4jIeiKN0t12RKZlld1h6dhXCguXDhl2ErhlVkX3crTPZ+svgv8vY/dM2e3r0bvm/ge8NsRQqMT9XRPeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776142838; c=relaxed/simple;
	bh=+G8A9ery+s3UQR4ks8cuL74090Vvan1tS6zqjUU4Zrk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OoAfOf4KvkjabVLlwL2dbdW+rnM6TZ38aaI4jnzBRUKm9USnIKtSpsWmE2e6HOJColaoTOUO1La125khmvTwndGNOM6fzRI9wHwpEkDmxJph7MVpkFy4glO8JTfKhc9SVE7lZrmjfRV7y0ILYU4dwf5pDHyzE2l9XvcpfL/+/uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=apcGzutO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S0/E08zB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DLBBEl3157277
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 05:00:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fKV/5f3Zwel3X0HBSamMpA4C9Dpr5+g/2xdz/loKqVQ=; b=apcGzutOoE2Vbx5N
	MqeP2A+WfN6Lu4A8/aXlHbG0SCvgqt/uvlBpGyk0cTSAcnscG2XrNFXSppUbWLnU
	PBmxJz/BKs6Gr4I4+lDU6ah30DqGAG7epR9rEDG+1unKxHev6f1TR9D6jJ6WzdFy
	r/t+teaOKRlIhnXMA2fM6wMafx4znIVUswDsB1fSkn5j0XKhPMaa9uBDsTfPSVR5
	CZqRHupdwqHBegVtmsJ2l+POgiBsYlr9R8hu//gNfVTufKQaiDY1Ef/pu3aeCzVU
	0P/v9Sz30ZaOdzP19Py8+H13SS2zpHgKkeuqjqHyB2j/NXD/njiD4zoq5eBueIHQ
	5qdR2Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86b91wy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 14 Apr 2026 05:00:35 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b250d3699aso102670775ad.2
        for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 22:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776142835; x=1776747635; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fKV/5f3Zwel3X0HBSamMpA4C9Dpr5+g/2xdz/loKqVQ=;
        b=S0/E08zBfo1uza0mKRy25bIahqqjsYn5rzGxOkOTIEZFmr6D7Hup/Ka9TOOA/HImsK
         dcX3j0ieCardGzYfdOuLCTyQ//2PfSXId8FVtunuGTsyaTEtHPWcp0/t3lCMge4C0mUB
         TgNSi/mamvHS4Yu9s45wJwpJCokaoY1czH8Ci5JdKPE8WffYuDhc/DKYi1QcQKSoypxx
         GaaFAlyfzoOF0i/vFAHK/UWNt+oTQJy8q2iUMpVHv6/QR9umO5haigYaS2S3/ncEoLVT
         MgzoXHT9bm3Y8hhR9WRGAWJFg2wCYi4cd04noGqc1JGRMRndw7muF5/feBJs1wtT8R19
         67Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776142835; x=1776747635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fKV/5f3Zwel3X0HBSamMpA4C9Dpr5+g/2xdz/loKqVQ=;
        b=bPQphoAA3/dgkc4mZ/8s+EUktv1Ir1x2QFI9AE4geCp7/doLA3YRoHZdh891FE1ECa
         38GKZbNltcp9fFPVRa2Tssoox2Mckd3+I9adv8FsqsOMYWFD/zWw2ST2oaRkIYYLS/4y
         m+JX84niE+ZWnsFOlkXsiTbV6er+dMBfyhCJ9+EXEODaOo5tVK4s4MRb2IKtYoHg9R4Q
         QHcCzfSBmxw+3NIOLJRu+oWUC2074Q0dT+KnZbCAtYO7WpuuF7iqUBlckR+k0Lyx+nHu
         o85oQJ3Ych+9Agn9XWMzbkYg+mFi3BuPRSiRS4IucRADfiRO5x0PV5yovl3LyLXu1TKI
         tf7Q==
X-Gm-Message-State: AOJu0YxrHzsGAKj4kF7tDDKYjGf6hM5y4b3jyIaHibKZkz5MbGsg+ATg
	Qy8zodhizEg93Di0rW9im1dbh6CWyfYaSp3PHAfbFdoqX6Yy01n9n9UCkscOfkaAUW2wmho0d55
	iF8I4udn2H2f9gSf2B8gbVkVv5pxaBtFh9VLY4kTmnB25A2npqcCddLlb/tZdtdhGEw==
X-Gm-Gg: AeBDies3QBb66amQC3MyDnOXBEExSF3ck+zKAXWHuFp+O9AnSzJYFdrH0nadsTNKRJT
	2aitrUy7Oha63yIowRfiF9ZA1UiZbq4ON3kXFLHRvnr1n7aW1L0Idu5eWKTCNo+XWVrB97XlWo3
	E/LMUOMTGJ+Q+0Ud/UyoyZoTAvXURtCkVnkeyz8CFioq9dq37qnz/DA2WBSaDuhcAIkt1wGU1ye
	8EkFqRMnw/+4RwmaTEbQoimv5jDjv5QF1IVA/HkFgu2/4B5B7tKgMJ5OC1fzj6reHrktb60l2yz
	aXBo7CsoRq1th7315KF2qrwBDBGeyUp7m+wZ7I/flkuE3/UuGCD2RYgeGF5Yf+4Z0Y2kYOlpKzC
	Lu6cVSEd0IR4Y0khqWX3FAL2D3PjHWAQUO4twR1J70Ke+SIfVR3EvZ94=
X-Received: by 2002:a17:903:1d1:b0:2b2:5c31:24bf with SMTP id d9443c01a7336-2b2d59b838cmr173346625ad.19.1776142834872;
        Mon, 13 Apr 2026 22:00:34 -0700 (PDT)
X-Received: by 2002:a17:903:1d1:b0:2b2:5c31:24bf with SMTP id d9443c01a7336-2b2d59b838cmr173346045ad.19.1776142834257;
        Mon, 13 Apr 2026 22:00:34 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4db198asm134678425ad.3.2026.04.13.22.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 22:00:33 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 10:29:57 +0530
Subject: [PATCH 01/11] dt-bindings: media: qcom,glymur-iris: Add glymur
 video codec
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-glymur-v1-1-7d3d1cf57b16@oss.qualcomm.com>
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
In-Reply-To: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776142821; l=7566;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=+G8A9ery+s3UQR4ks8cuL74090Vvan1tS6zqjUU4Zrk=;
 b=XO1zeby/rN6i9PLEcVfWtA0m0CIuWGsMgjInqQlzFiOsTdjyiloYh9P4cjbtWRq/DqAw3dmE3
 c3nzQHxMEHqB8QMmy569IAuCmPBR1bLQH8lMu4YGlGuaWOfd7bbQZNB
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA0NSBTYWx0ZWRfX3NeuWYuE8bBw
 fTwIPsNAkYYxkf8NJuViSUtxK+Nvwu7ijR9MGpx17BOuebgnwVqw5xKakY6Sc/16WJzEWo0A+kY
 wCxANqhYt83DOjTIgBkiKqAI0XAnBofSeE4XOO186NrmXgkuW/F6/J1KSQDZIk7u6k/pwmjyZ0l
 dRWVnrhuiLd8xwv97DQ95SLrS4mCPiMwgwW2eHVahggz64rrG4pP10d+SJ6M6PxvYROdiebqm5o
 8xh8NMoqeXmqa+SXQZQhbcuuCGMLhWqA5Ob9MTwNaR9laB48uGciYZMrOt0zkeHF8MF08LT/vn4
 wlPKEYpubuNr7NpiIARwcptM8a1Nz5h8NeH9ZCYUvXoK/XlvGK8dp0Bvxr+uM62qBz0pCB7Wc24
 CrlY55M22x/N+3thqptsdfBqmIqkyG09le4yf0OxyeGerX8ezJQcyx03iEudY/Jmvn6le7fVLrl
 DvkW7CclNpRkBtWh7mg==
X-Authority-Analysis: v=2.4 cv=MahcfZ/f c=1 sm=1 tr=0 ts=69ddc9f4 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=17OVpTNTOV0qq6DYWkQA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: YXUG_66Cg2HfKirjL46sulPpFxDGWTOK
X-Proofpoint-GUID: YXUG_66Cg2HfKirjL46sulPpFxDGWTOK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140045
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58693-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,aa00000:email,devicetree.org:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3A5683F594F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add device tree binding for the Qualcomm Glymur Iris video codec. Glymur
is a new generation of video IP that introduces a dual-core architecture.
The second core brings its own power domain, clocks, and reset lines,
requiring additional power domains and clocks in the power sequence.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 .../bindings/media/qcom,glymur-iris.yaml           | 220 +++++++++++++++++++++
 include/dt-bindings/media/qcom,glymur-iris.h       |  11 ++
 2 files changed, 231 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
new file mode 100644
index 000000000000..10ee02cd1a7d
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
@@ -0,0 +1,220 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,glymur-iris.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Glymur SoC Iris video encoder and decoder
+
+maintainers:
+  - Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
+
+description:
+  The Iris video processing unit on Qualcomm Glymur SoC is a video encode and
+  decode accelerator.
+
+properties:
+  compatible:
+    const: qcom,glymur-iris
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 9
+
+  clock-names:
+    items:
+      - const: iface
+      - const: core
+      - const: vcodec0_core
+      - const: iface_ctrl
+      - const: core_freerun
+      - const: vcodec0_core_freerun
+      - const: iface1
+      - const: vcodec1_core
+      - const: vcodec1_core_freerun
+
+  dma-coherent: true
+
+  firmware-name:
+    maxItems: 1
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: cpu-cfg
+      - const: video-mem
+
+  interrupts:
+    maxItems: 1
+
+  iommus:
+    maxItems: 4
+
+  iommu-map:
+    maxItems: 1
+
+  memory-region:
+    maxItems: 1
+
+  operating-points-v2: true
+  opp-table:
+    type: object
+
+  power-domains:
+    maxItems: 5
+
+  power-domain-names:
+    items:
+      - const: venus
+      - const: vcodec0
+      - const: mxc
+      - const: mmcx
+      - const: vcodec1
+
+  resets:
+    maxItems: 6
+
+  reset-names:
+    items:
+      - const: bus0
+      - const: bus_ctrl
+      - const: core
+      - const: vcodec0_core
+      - const: bus1
+      - const: vcodec1_core
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - dma-coherent
+  - interconnects
+  - interconnect-names
+  - interrupts
+  - iommus
+  - memory-region
+  - power-domains
+  - power-domain-names
+  - resets
+  - reset-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/media/qcom,glymur-iris.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    video-codec@aa00000 {
+        compatible = "qcom,glymur-iris";
+        reg = <0x0aa00000 0xf0000>;
+
+        clocks = <&gcc_video_axi0_clk>,
+                 <&videocc_mvs0c_clk>,
+                 <&videocc_mvs0_clk>,
+                 <&gcc_video_axi0c_clk>,
+                 <&videocc_mvs0c_freerun_clk>,
+                 <&videocc_mvs0_freerun_clk>,
+                 <&gcc_video_axi1_clk>,
+                 <&videocc_mvs1_clk>,
+                 <&videocc_mvs1_freerun_clk>;
+        clock-names = "iface",
+                      "core",
+                      "vcodec0_core",
+                      "iface_ctrl",
+                      "core_freerun",
+                      "vcodec0_core_freerun",
+                      "iface1",
+                      "vcodec1_core",
+                      "vcodec1_core_freerun";
+
+        dma-coherent;
+
+        interconnects = <&hsc_noc_master_appss_proc &config_noc_slave_venus_cfg>,
+                        <&mmss_noc_master_video &mc_virt_slave_ebi1>;
+        interconnect-names = "cpu-cfg",
+                             "video-mem";
+
+        interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+        iommus = <&apps_smmu 0x1940 0x0>,
+                 <&apps_smmu 0x1943 0x0>,
+                 <&apps_smmu 0x1944 0x0>,
+                 <&apps_smmu 0x19e0 0x0>;
+
+        iommu-map = <IRIS_FIRMWARE &apps_smmu 0x19e2 0x1>;
+
+        memory-region = <&video_mem>;
+
+        operating-points-v2 = <&iris_opp_table>;
+
+        power-domains = <&videocc_mvs0c_gdsc>,
+                        <&videocc_mvs0_gdsc>,
+                        <&rpmhpd RPMHPD_MXC>,
+                        <&rpmhpd RPMHPD_MMCX>,
+                        <&videocc_mvs1_gdsc>;
+        power-domain-names = "venus",
+                             "vcodec0",
+                             "mxc",
+                             "mmcx",
+                             "vcodec1";
+
+        resets = <&gcc_video_axi0_clk_ares>,
+                 <&gcc_video_axi0c_clk_ares>,
+                 <&videocc_mvs0c_freerun_clk_ares>,
+                 <&videocc_mvs0_freerun_clk_ares>,
+                 <&gcc_video_axi1_clk_ares>,
+                 <&videocc_mvs1_freerun_clk_ares>;
+        reset-names = "bus0",
+                      "bus_ctrl",
+                      "core",
+                      "vcodec0_core",
+                      "bus1",
+                      "vcodec1_core";
+
+        iris_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-240000000 {
+                opp-hz = /bits/ 64 <240000000 240000000 360000000>;
+                required-opps = <&rpmhpd_opp_svs>,
+                                <&rpmhpd_opp_low_svs>;
+            };
+
+            opp-338000000 {
+                opp-hz = /bits/ 64 <338000000 338000000 507000000>;
+                required-opps = <&rpmhpd_opp_svs>,
+                                <&rpmhpd_opp_svs>;
+            };
+
+            opp-366000000 {
+                opp-hz = /bits/ 64 <366000000 366000000 549000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_svs_l1>;
+            };
+
+            opp-444000000 {
+                opp-hz = /bits/ 64 <444000000 444000000 666000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_nom>;
+            };
+
+            opp-533333334 {
+                opp-hz = /bits/ 64 <533333334 533333334 800000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_turbo>;
+            };
+
+            opp-655000000 {
+                opp-hz = /bits/ 64 <655000000 655000000 982000000>;
+                required-opps = <&rpmhpd_opp_nom>,
+                                <&rpmhpd_opp_turbo_l1>;
+            };
+        };
+    };
diff --git a/include/dt-bindings/media/qcom,glymur-iris.h b/include/dt-bindings/media/qcom,glymur-iris.h
new file mode 100644
index 000000000000..5766db0b9247
--- /dev/null
+++ b/include/dt-bindings/media/qcom,glymur-iris.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_MEDIA_QCOM_GLYMUR_IRIS_H_
+#define _DT_BINDINGS_MEDIA_QCOM_GLYMUR_IRIS_H_
+
+#define IRIS_FIRMWARE	0
+
+#endif

-- 
2.34.1


