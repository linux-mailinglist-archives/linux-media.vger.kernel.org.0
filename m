Return-Path: <linux-media+bounces-19559-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E8799C4D2
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 11:08:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F854283471
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 09:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD97C158874;
	Mon, 14 Oct 2024 09:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GDnuCl2v"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99D6156F36;
	Mon, 14 Oct 2024 09:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728896871; cv=none; b=AQRyIbZhDfHlpzMhyHN4bUHdnp7Ah9PRheqYAmFQ7wB5cOI9bw54oI2iTTI8OBKeMsYcopfzREYtz831POXaE7rccgkUpc9jihGIbtij8G2IEaqUN1efzwfkgQQfDJHzVDFUUdn56QmOBPRONTVSW4GkQXaernobf8XQeXG6qLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728896871; c=relaxed/simple;
	bh=L+cbcUPc4pRS7LMp4mMheSyZgCgfQE9FYbV2jd7u3rQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=FmJGYIprKNEH0D2gDSJ5LC1jl4cca1lmxj4BCMFFjqoZC6jeKKRdH2Vkc45vrpRVBIqDM19YvAGXT3xnTkVCP2oNkeX520BOUxnEeHW05F/vwhuIvZhdJ+pd5Mq+2sEwW4zT3SrdEaqLPpKlBagQ6NUgkbKXEQfLG2NjI2E6C4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GDnuCl2v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49E0T36B004410;
	Mon, 14 Oct 2024 09:07:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SjJm2ZVKazNZGHz8Eap8SwPYUOh49oI5wTW/BULIFFQ=; b=GDnuCl2vXomcX+2L
	bzJOVaG+0On/DZ159kUZjAmdYZLk2GCFi3ApAXEzHR5fDIXg7GRo7bKFQ8UkL5vq
	+GDzALZzilv3wQiI8PbN3AqwYZC1TyuiRq4UAaLnge9iYRGCsD5qRJmklZDzSNGC
	VdJrS8AEITD/GMGe/aHazKQ/dyti5PVaWa+trLUf4UlowPOvRIUQyfGHjEfD6y1X
	CbmjvOEPC/o6YE9KmEQqeFdm3Ef0UbqzBjC4DvJ78Jg7o1Dq/RUAI0UTju4z7XQv
	Q0UEeZI612TuQ+SZ6VGU+XRWdrs4c0VGLk7cRAMHiqP+DuZbNUGq6Wdpn7zQtNMS
	amqzvw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 427etec23b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 09:07:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49E97hss021950
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 09:07:43 GMT
Received: from hu-dikshita-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 14 Oct 2024 02:07:39 -0700
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
Date: Mon, 14 Oct 2024 14:37:22 +0530
Subject: [PATCH v4 01/28] dt-bindings: media: Add video support for QCOM
 SM8550 SoC
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241014-qcom-video-iris-v4-v4-1-c5eaa4e9ab9e@quicinc.com>
References: <20241014-qcom-video-iris-v4-v4-0-c5eaa4e9ab9e@quicinc.com>
In-Reply-To: <20241014-qcom-video-iris-v4-v4-0-c5eaa4e9ab9e@quicinc.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: Hans Verkuil <hverkuil@xs4all.nl>,
        Sebastian Fricke
	<sebastian.fricke@collabora.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728896853; l=5054;
 i=quic_dikshita@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=L+cbcUPc4pRS7LMp4mMheSyZgCgfQE9FYbV2jd7u3rQ=;
 b=0H6sUsaHcgYHN60Ei/wnB+pOHMi9ny0ykI9eCtl32l18UuQUjrqve3YE5a+6V/DXfL+/41Gje
 r/s8iJIPt/HB3VvYl8BSl7HkBbixlEA3CSABYV1MHHbz9b9+AEofxa1
X-Developer-Key: i=quic_dikshita@quicinc.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 1g9Dfj0TR-o-dVdX0qaGYA3WSvFcw2gg
X-Proofpoint-GUID: 1g9Dfj0TR-o-dVdX0qaGYA3WSvFcw2gg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 mlxscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410140066

Introduce support for Qualcomm new video acceleration
hardware i.e. iris, used for video stream decoding and
encoding on QCOM SM8550 SoC.

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 .../bindings/media/qcom,sm8550-iris.yaml           | 158 +++++++++++++++++++++
 1 file changed, 158 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
new file mode 100644
index 000000000000..e424ea84c211
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
@@ -0,0 +1,158 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm iris video encode and decode accelerators
+
+maintainers:
+  - Vikash Garodia <quic_vgarodia@quicinc.com>
+  - Dikshita Agarwal <quic_dikshita@quicinc.com>
+
+description:
+  The iris video processing unit is a video encode and decode accelerator
+  present on Qualcomm platforms.
+
+allOf:
+  - $ref: qcom,venus-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,sm8550-iris
+
+  power-domains:
+    maxItems: 4
+
+  power-domain-names:
+    items:
+      - const: venus
+      - const: vcodec0
+      - const: mxc
+      - const: mmcx
+
+  clocks:
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: iface
+      - const: core
+      - const: vcodec0_core
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: cpu-cfg
+      - const: video-mem
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    items:
+      - const: bus
+
+  iommus:
+    maxItems: 2
+
+  dma-coherent: true
+
+  operating-points-v2: true
+
+  opp-table:
+    type: object
+
+required:
+  - compatible
+  - power-domain-names
+  - interconnects
+  - interconnect-names
+  - resets
+  - reset-names
+  - iommus
+  - dma-coherent
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/clock/qcom,sm8550-gcc.h>
+    #include <dt-bindings/clock/qcom,sm8450-videocc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,sm8550-rpmh.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    video-codec@aa00000 {
+        compatible = "qcom,sm8550-iris";
+        reg = <0x0aa00000 0xf0000>;
+        interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+        power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
+                        <&videocc VIDEO_CC_MVS0_GDSC>,
+                        <&rpmhpd RPMHPD_MXC>,
+                        <&rpmhpd RPMHPD_MMCX>;
+        power-domain-names = "venus", "vcodec0", "mxc", "mmcx";
+
+        clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+                 <&videocc VIDEO_CC_MVS0C_CLK>,
+                 <&videocc VIDEO_CC_MVS0_CLK>;
+        clock-names = "iface", "core", "vcodec0_core";
+
+        interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+                         &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ALWAYS>,
+                        <&mmss_noc MASTER_VIDEO QCOM_ICC_TAG_ALWAYS
+                         &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+        interconnect-names = "cpu-cfg", "video-mem";
+
+        memory-region = <&video_mem>;
+
+        resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
+        reset-names = "bus";
+
+        iommus = <&apps_smmu 0x1940 0x0000>,
+                 <&apps_smmu 0x1947 0x0000>;
+        dma-coherent;
+
+        operating-points-v2 = <&iris_opp_table>;
+
+        iris_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-240000000 {
+                opp-hz = /bits/ 64 <240000000>;
+                required-opps = <&rpmhpd_opp_svs>,
+                                <&rpmhpd_opp_low_svs>;
+            };
+
+            opp-338000000 {
+                opp-hz = /bits/ 64 <338000000>;
+                required-opps = <&rpmhpd_opp_svs>,
+                                <&rpmhpd_opp_svs>;
+            };
+
+            opp-366000000 {
+                opp-hz = /bits/ 64 <366000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_svs_l1>;
+            };
+
+            opp-444000000 {
+                opp-hz = /bits/ 64 <444000000>;
+                required-opps = <&rpmhpd_opp_turbo>,
+                                <&rpmhpd_opp_turbo>;
+            };
+
+            opp-533333334 {
+                opp-hz = /bits/ 64 <533333334>;
+                required-opps = <&rpmhpd_opp_turbo_l1>,
+                                <&rpmhpd_opp_turbo_l1>;
+            };
+        };
+    };
+...

-- 
2.34.1


