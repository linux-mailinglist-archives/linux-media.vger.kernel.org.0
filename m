Return-Path: <linux-media+bounces-38891-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DD7B1AE8B
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 08:44:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E2C5E175618
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 06:44:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6D1A221729;
	Tue,  5 Aug 2025 06:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eHMTxenB"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C81721C161
	for <linux-media@vger.kernel.org>; Tue,  5 Aug 2025 06:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754376281; cv=none; b=fm+q9knYEWFg5+ZLqT9/o4MQiUYAwUbq+cLm1x8bcZwWQUJenKcSV5F1EFkZb947bT52XoDBCSx1VuAS4fUr55oX+s2i9MxJAqgMi82/gmepQjHY4FD/MhOwf2d8Mn6NvJ6OaR4LFZL/BSSC1xTj1uTcaM2v9ziI8uHeE5OWb28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754376281; c=relaxed/simple;
	bh=VO/XqcSD3T9bRV+GvDZsTJwOmB/gxlb+z0LFlAiA8e0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DWmqw8Q3yyEgDDrvX+SKT1FUUpzDPn4gYO4xdzlRpesH6a2pqu9zTtvjL1dq6ulR5ub+ixxsDSVG59eiWG4cSj9YFxLS5K/DciVrItmO6Q6bCHOGI5gNPfzz+x6Mls6UwGD90RYSCCnbEBye6wukD2PvrwRad4+BK1l5IhnavPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eHMTxenB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5752JZBr016998
	for <linux-media@vger.kernel.org>; Tue, 5 Aug 2025 06:44:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YY+jHz5mvoy
	usButmdCoBF7o4RYZY+zFj5xw1jAtys8=; b=eHMTxenB3GhC0qyrsJ59RPWDiD0
	ZOWyoc8l1g/ya1F7eip9mP3MAsCoDxnxMSr/ZA5ct4o7WiM1olC1tRsD9i8LiN+9
	kwUku5QWg7YG+YWUYi1ImpST9Wn4AkR3ITwKmHawdpmvCpMKEcnUnZ+e24EsloOU
	EtuI9tXu7dMQQ5LniunOFZ1QFRWHROI5Eb7mnuGtb/1FEDZkfXanJnswC/HCz8ZV
	PuA6bEsF4txItZ9JcLAsdzLmgnxJdyCDOJW22Po8ACOXwx+4utY1g3j8w77DApAp
	HKcWRE6iQSsSEL/vlGD9oA80CNO9QBA1L8Ymz7BhP98ikxgrASg9OMetM7Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48aqyv3ptj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 05 Aug 2025 06:44:38 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-7074bad0561so121871506d6.1
        for <linux-media@vger.kernel.org>; Mon, 04 Aug 2025 23:44:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754376277; x=1754981077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YY+jHz5mvoyusButmdCoBF7o4RYZY+zFj5xw1jAtys8=;
        b=O/puI/JPiZjGwVgZ9acRuhYadAUuyojqLhiC6RqRnTj1PrpbMnecPg8MI45KMDRm+1
         2TJPAHSI/ygJFFaz9mStwzvKPZRyU+ycKzooqI4J34hXHjRAUvli64w/f5ZZq1DfJnFl
         jCPtt0QBjn6NNmrur7a+1hmX1VniRD09kBh2kFxvXluf25UdUNIToLAXpEx4fKY8+3Cd
         CECwBKNRNZNWJF+x1J4oR67uXsMCiDm/CRedtJJwBeLyw7vEdsNhRAJ8hwPeZ4mQxuZ8
         zFbKDPNl2wjKThWtbmcGvIY6WQ3YnVoKNieTxiDpOMJpDnmKkpGz12bJMPSLez609Pnd
         E0LQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQqoDo/J6wKqvgFHnImEL5mJIXJ7bMXaMC9vUKdHEfR64EUlluykfZSskiEnOsSUnkjxTzRBwSD3nJIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyenbns9Tl9hOV7HYxt7QNHCW6VGzwUcvvU2xoBsUI3kR0ihjZp
	d2W89IIk28jREgI7/ESHvN0Z8IHnRimg/4/qoW179oj2xRIQ5EJwYGxlbUkd+7EvXaMxciSEB3v
	0zcTNV6kWDb5rzb9LUTiBA7A9JdgZcqx8SLKcO4JB1DpwOroDYBZsTOdRVhdFuEvB8A==
X-Gm-Gg: ASbGncsPGAD2rAjstuX64rBz6eNqzpXWug9eo3S5Gn9QSazIo3gOoTZ0KW4H3aBWYAT
	vVRJFKrYN+dCGk5gxHy+/6ijyYHyNe2eCBGVYImlwMwUYkss0lsKyijFWptdZb+1AOCg088Di7K
	r7w/269YLUyH/zN+q6hB9FbiLJHn6ZcDeqacLO50V8l6VWFeevyFJfQOUWkWhqajQ07yw8AeaTW
	5/O9QAzXDB03Bcr+nsdG8fLKNjSmWjqURZOC9nnz26nj4jqhQMMGVbcMhy3w0Mz1O4MHEjgoa4b
	RIsDITRnItTJLOblDRQMYs6rQDAvorZyWAw82yxdlpcv7nH12ucLJxpmur3U9eZk8aYTTJW8zI2
	fMMGTc5cw0Y7j
X-Received: by 2002:a05:6214:2468:b0:707:76ab:191d with SMTP id 6a1803df08f44-709362f965cmr141513626d6.0.1754376277242;
        Mon, 04 Aug 2025 23:44:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHC8OIIb3ezKwBlHEgk4U+PRUs0PBwTkcvvFOqdI/Jk6JhjlGC6seYwNUOkw74LiGAywMUGVQ==
X-Received: by 2002:a05:6214:2468:b0:707:76ab:191d with SMTP id 6a1803df08f44-709362f965cmr141513456d6.0.1754376276813;
        Mon, 04 Aug 2025 23:44:36 -0700 (PDT)
Received: from trex.. (205.red-83-60-94.dynamicip.rima-tde.net. [83.60.94.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4589ee57922sm194015815e9.22.2025.08.04.23.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 23:44:36 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, bryan.odonoghue@linaro.org,
        quic_dikshita@quicinc.com, quic_vgarodia@quicinc.com,
        konradybcio@kernel.org, krzk+dt@kernel.org
Cc: mchehab@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v8 1/7] media: dt-bindings: venus: Add qcm2290 dt schema
Date: Tue,  5 Aug 2025 08:44:24 +0200
Message-Id: <20250805064430.782201-2-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250805064430.782201-1-jorge.ramirez@oss.qualcomm.com>
References: <20250805064430.782201-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: j9JOtu6MsTLByZ_-3PiaC7InpysQMlBu
X-Authority-Analysis: v=2.4 cv=F/xXdrhN c=1 sm=1 tr=0 ts=6891a856 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=Rr2dNH5/fcnoRoBmcVUeRg==:17
 a=2OwXVqhp2XgA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=Wl4eHCndyL1IYbKsAYUA:9 a=1HOtulTD9v-eNWfpl4qZ:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: j9JOtu6MsTLByZ_-3PiaC7InpysQMlBu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDA0NiBTYWx0ZWRfX7cNP6xl7I4f4
 VBOMu79fV1eOjq+AXUFgyjhWfdv0B4YUKEEUG37QJfITM5G+CHKV2cikYRSfvzY/zUmwir8vmLN
 Y7lYS1VCc0JWgHcwsZSHuWz/HDzUBUHRetw5MgdfW39AR6SkmrhPlfiBeXBNCqAVZxuqGz6lKjw
 vVKdwFsR5pHQ06f3sVNaMWo38scfX0SylqssLAjlPsv3/fLZYLWlkyKhP/1zGDSnl7Ij4k24nXt
 AvOMQOSUCG/vys7EmQo+5f80ZZl2acrJpyi9K6BDkuaM4QTCexKnO2zfap2ioN9rat/CSjioZUn
 cvcoZcjKVSwf1ORDre+ntcqbXZxdr9qp3otfTX4zB8m5QGuZdgISF2rsO61Qrg6cjEVgyUbxit7
 UmR3xEypXSJpWb1SQ87PJqWd/U928UJ89bYQdA+4gavaqCJVHyBIMnryuclokzPd8NDte7ai
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_01,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 mlxscore=0 phishscore=0 bulkscore=0 adultscore=0
 clxscore=1015 mlxlogscore=999 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508050046

Add a schema for the venus video encoder/decoder on the qcm2290.

The order of the IOMMU list is strict: the first two entries correspond
to non-secure IOMMUs, and the remaining three to secure IOMMUs.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/media/qcom,qcm2290-venus.yaml    | 130 ++++++++++++++++++
 1 file changed, 130 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
new file mode 100644
index 000000000000..3f3ee82fc878
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
@@ -0,0 +1,130 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,qcm2290-venus.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm QCM2290 Venus video encode and decode accelerators
+
+maintainers:
+  - Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
+
+description:
+  The Venus AR50_LITE IP is a video encode and decode accelerator present
+  on Qualcomm platforms.
+
+allOf:
+  - $ref: qcom,venus-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,qcm2290-venus
+
+  power-domains:
+    maxItems: 3
+
+  power-domain-names:
+    items:
+      - const: venus
+      - const: vcodec0
+      - const: cx
+
+  clocks:
+    maxItems: 6
+
+  clock-names:
+    items:
+      - const: core
+      - const: iface
+      - const: bus
+      - const: throttle
+      - const: vcodec0_core
+      - const: vcodec0_bus
+
+  iommus:
+    maxItems: 5
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: video-mem
+      - const: cpu-cfg
+
+  operating-points-v2: true
+  opp-table:
+    type: object
+
+required:
+  - compatible
+  - power-domain-names
+  - iommus
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-qcm2290.h>
+    #include <dt-bindings/interconnect/qcom,qcm2290.h>
+    #include <dt-bindings/interconnect/qcom,rpm-icc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    venus: video-codec@5a00000 {
+        compatible = "qcom,qcm2290-venus";
+        reg = <0x5a00000 0xf0000>;
+
+        interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
+
+        power-domains = <&gcc GCC_VENUS_GDSC>,
+                        <&gcc GCC_VCODEC0_GDSC>,
+                        <&rpmpd QCM2290_VDDCX>;
+        power-domain-names = "venus",
+                             "vcodec0",
+                             "cx";
+
+        operating-points-v2 = <&venus_opp_table>;
+
+        clocks = <&gcc GCC_VIDEO_VENUS_CTL_CLK>,
+                 <&gcc GCC_VIDEO_AHB_CLK>,
+                 <&gcc GCC_VENUS_CTL_AXI_CLK>,
+                 <&gcc GCC_VIDEO_THROTTLE_CORE_CLK>,
+                 <&gcc GCC_VIDEO_VCODEC0_SYS_CLK>,
+                 <&gcc GCC_VCODEC0_AXI_CLK>;
+        clock-names = "core",
+                       "iface",
+                       "bus",
+                       "throttle",
+                       "vcodec0_core",
+                       "vcodec0_bus";
+
+        memory-region = <&pil_video_mem>;
+
+        iommus = <&apps_smmu 0x860 0x0>,
+                 <&apps_smmu 0x880 0x0>,
+                 <&apps_smmu 0x861 0x04>,
+                 <&apps_smmu 0x863 0x0>,
+                 <&apps_smmu 0x804 0xe0>;
+
+        interconnects = <&mmnrt_virt MASTER_VIDEO_P0 RPM_ALWAYS_TAG
+                         &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>,
+                        <&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
+                         &config_noc SLAVE_VENUS_CFG RPM_ACTIVE_TAG>;
+        interconnect-names = "video-mem",
+                             "cpu-cfg";
+
+        venus_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-133333333 {
+                opp-hz = /bits/ 64 <133333333>;
+                required-opps = <&rpmpd_opp_low_svs>;
+            };
+
+            opp-240000000 {
+                opp-hz = /bits/ 64 <240000000>;
+                required-opps = <&rpmpd_opp_svs>;
+            };
+        };
+    };
-- 
2.34.1


