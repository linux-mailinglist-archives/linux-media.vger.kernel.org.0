Return-Path: <linux-media+bounces-65639-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pcHKEoovPWqTyggAu9opvQ
	(envelope-from <linux-media+bounces-65639-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 15:39:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E08046C6308
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 15:39:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=opcPxYQV;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=A5B0Zg30;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65639-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65639-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DAFA2304DE8D
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 13:39:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FFD8343D85;
	Thu, 25 Jun 2026 13:39:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1743328FC
	for <linux-media@vger.kernel.org>; Thu, 25 Jun 2026 13:38:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782394740; cv=none; b=uRL9T3AzieoWT1OcryWvHy3HUJnFU/M649ZnjMW1mxtUPsp6ncb9X99dka5denvBaJ9JzEBVxmw1Ylh2O7V6RE1TBzW534GMm5KO+CVduuVyNGmzzcnESUHbS+EkasMTUhfOI29k9kG7Jw/QVdUPjxnb/wT/kZNIG8jdPxzTBHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782394740; c=relaxed/simple;
	bh=BeeUpBP+MqcSp9z+rfQuEFHTfniuNHSPXQVaYkS/Ams=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JZmoo+D1yyL/aHpE7l1BBGer0Hth+Om4KfnGocsWUVF3zJKO77hBZS0Ej7soI0Go/IFNW3/QphkCegbzEZ6k4kkki60sTktrzLBh1kjB7zvlRn4YaLP8q1y4MLXH2TQB2+iEU5g1PggCoZpd7F1mgub8zsu2OnqALstRXUSQZGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=opcPxYQV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A5B0Zg30; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P9junG1470528
	for <linux-media@vger.kernel.org>; Thu, 25 Jun 2026 13:38:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=MmXxdsWF9PR
	x9r6aStfR3QBWOWUptVPg6sB1TDaNcaM=; b=opcPxYQVi+iBT5WWXmsCqCBiUS7
	dh1JmgaqWK4TP4YQZalSHGpU7Zmubx9XGAbgp90vCfOCpWxxHeg5udPZTe5cSOI6
	vcJxbjdsUGk+eWowEcl/yM5W8HnEGLFFFFV8K5SI4IswzDlWQRP/UEUo7Sm+K4Es
	EE38Y9a5qwh65nesv1hhDAXUrxcdYvYdum3jIfarz5LBQqsETRBI/Djp3nA/hMx1
	wFUSKkhv/Fvwko7/WOKgN3PTtdN5GjRc7ThUAe19+6eJpzlRNIPVfYhwestB7VoW
	XwCwhI8HwBi6uB3RFjJ4GUz62x6AWHbiinDKxVDRnrBgEouQiUOVBANCk8w==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0nv7kgua-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 25 Jun 2026 13:38:58 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-966a61478ceso641457241.2
        for <linux-media@vger.kernel.org>; Thu, 25 Jun 2026 06:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782394738; x=1782999538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MmXxdsWF9PRx9r6aStfR3QBWOWUptVPg6sB1TDaNcaM=;
        b=A5B0Zg30cbA2qZfVjg2IZSjhX2vHkCz2OjYJKmW20ILcMUg6W64AnkcSSgSLriAOKG
         AEeTugPH53k+Do3ux64liX8PmWqTiipES9GWSq9MQO26A3gfR3o+TMxaMFXXpr9d5eSj
         XvYuYSLjL+rc2vQPegiBO5hvinNKLNC7oP+flKL5oOkU76Aj1zmPjyk2YkLsTYXe7jn1
         5p1dUSAjOh0gijQS5lWR1qgy+4NBf5GIpAvBu1a8wRmKDr7UCqRfJampBr9sUFAF0C8A
         E/sGNL96UtgqizoU6FI/frqEIiEtZB91DnVnUJQQMCXcJEbpT68d79YBKaUagM0nR2aK
         Y9bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782394738; x=1782999538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MmXxdsWF9PRx9r6aStfR3QBWOWUptVPg6sB1TDaNcaM=;
        b=Izk4VY35vKLqiyR396HWrJb5OJYsDMLIBM7EFo4aujJZNB+j+PoWeQ/HVULdV66sT4
         UWUZxCJXk9Qph5yRgxhjgnto+exU08yTQ7t3dZWhOKzplLDdCdmG/9WW33gQNr5ps8qg
         QgRc4szrRDhchz+Bo3SQpLzNSkxHCNSGbgjJnkwUj+PpJ60GtescqcRmh0QjXJpq5osv
         uvpH2q5lVEdOdXRNi2MdtXMnUQ0O4qujTVkKvvkvKcPPw0Df9BkkZXHclxVR+T9c7C8R
         A4PzZp5G1vGdBjDKxmS61EZXfyWMAqXuXTDkpfKGrk79FbWFpQiOfs17m9jLai04ctrp
         TtDg==
X-Gm-Message-State: AOJu0YxeYR/Fq/jfIxAwBpj8iNCi8ZkzmyoCtVc3FjIGQdsHmGNkqUQu
	bd1Rs3yZtHr0KQkJ6DXc9A4ZkfoSl191Y5Y3Rk57+2kiROtKN7HjsTZ03Cs9FXlHJhmXOjr//jA
	5WcFmc230wY3goXF+yIzjEUGBv4cLsfz1UlyMUOO8FGUu3ZfzovPzOIdFNgQKt8ER83TW7SYkEZ
	rx
X-Gm-Gg: AfdE7cmI4c7Ty+pFBt3aUnUl0Aot+a+3rRlnwGtwqlNanaGWZwg3pNMpEMTfwj402Wz
	XCEtm4gduc8JsfBc8GIZvbOD0TPR7/FX2ZEdaxKQTGt4PCRTgY7uZEO6rbs+Z+BWIJaAqEIXSzd
	MDyg+MXGLt5ioNZTeX/XaHU5xjr75OM05O3LSbNGYpSdCHBj8vkl9O8tpyu9ITGOuR30WTginWF
	Xwo7cvoRlBQXQvLbI4ejSYgDXXipF0APjxs1gyHi/M8+irv8kSTrwJIst0axMb8qEUNw8FZ8LGB
	Ch7Q9JUAAnN/PQcvPtYbs8TJfA4zZsA76KSJ9p2vwfAfp9xZ1QucVbzyRILkkRgkoZ49FlL1OEg
	wER3N6gKcmwgP5SG2No5F7DJpMLBsHPWtVhE=
X-Received: by 2002:a05:6102:8014:b0:6d3:9409:d1bb with SMTP id ada2fe7eead31-734361a0fddmr771915137.19.1782394737634;
        Thu, 25 Jun 2026 06:38:57 -0700 (PDT)
X-Received: by 2002:a05:6102:8014:b0:6d3:9409:d1bb with SMTP id ada2fe7eead31-734361a0fddmr771904137.19.1782394737208;
        Thu, 25 Jun 2026 06:38:57 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbbaa238sm189172266b.8.2026.06.25.06.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 06:38:56 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: bod@kernel.org, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Subject: [PATCH v2 1/3] dt-bindings: media: qcom: Add JPEG encoder binding
Date: Thu, 25 Jun 2026 16:38:26 +0300
Message-Id: <20260625133828.3221781-2-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260625133828.3221781-1-atanas.filipov@oss.qualcomm.com>
References: <20260625133828.3221781-1-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDExNyBTYWx0ZWRfX38sUiWQgt6g0
 IPpza1tfFz4hH3IIeSkoa2TxIF31KKNPMoCjwNhk0FjPU1B5OU9oPjNn3Vv77sWaHJwzQu+elgO
 2o7DzFYZItZ0O+kS70Zoer3n2M1UbaE=
X-Authority-Analysis: v=2.4 cv=RJiD2Yi+ c=1 sm=1 tr=0 ts=6a3d2f72 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=VGq5m62kFjE_L6vmAZkA:9 a=TOPH6uDL9cOC6tEoww4z:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: oiGMH-DC1TBIkS-IR3SvqRdJZiA1iAI6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDExNyBTYWx0ZWRfXyi2BkFvlHcXJ
 NXkjVeDRcScL5CSlPaAHy4wyQbvs3cOZPLUGYiQ8f5QhSnvcvMvlsrREsZXbNztnR6x1xhGbFUK
 0M93HcgV459RnEZoVol3QaXvDgJ0M4/h18yj2o+4mzfHxFeO+Fafu4VWMRy1+ZpTXOCUan9RiZG
 wqZ6QK+uqwW4Brb6f70xmmlhTQn6rIU9rZHH82EVFUoTB0ohJASY9jih9YCMzH8rzXXoWl9/bya
 JbMq2GamXXtYG+HtB07pY9cWbBEIY2eHzl/KIA62+ei7qMFM/bdiQLlrrH6ZHx8wyVdkApzmSMX
 m3LkEjYQ/NEaDyf8O7jaZcVyculArqLUytTDU0Ajkof0/QQGZ8vPBi5hFfDJSGEr73P2cLjpfih
 ETjNvJ3UInIzn7LZMIfPU0PoUcmugOERg0kaNVZ9CCFTWOh7TmvZyVi4SMMx2ZTC3Xlqke/PpAd
 w5HgABK9KmyVLPo//sg==
X-Proofpoint-GUID: oiGMH-DC1TBIkS-IR3SvqRdJZiA1iAI6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250117
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65639-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:bod@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:atanas.filipov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[atanas.filipov@oss.qualcomm.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atanas.filipov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,devicetree.org:url,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E08046C6308

Add device-tree binding for the Qualcomm JPEG encoder hardware block
present in SM8250 (Kona) SoCs.

The JPEG encoder is a standalone hardware IP within the camera subsystem
that performs JPEG compression in memory-to-memory fashion.  It is
separate from the CAMSS ISP pipeline and has its own register space,
interrupt, clocks, power domain, IOMMU streams, and interconnect paths.

Properties documented:
- compatible: qcom,sm8250-jenc
- reg / reg-names: single MMIO region named "jpeg"
- interrupts: single edge-triggered interrupt
- clocks / clock-names: Common clocks and JPEG core clock
- power-domains: TITAN_TOP_GDSC common domain
- iommus: two SMMU stream IDs for JPEG pixel and JPEG DMA processing
- interconnects / interconnect-names
- OPP table mapping performance levels to clock frequencies

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../bindings/media/qcom,jpeg-encoder.yaml     | 135 ++++++++++++++++++
 1 file changed, 135 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
new file mode 100644
index 000000000000..ab8d8951d21f
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
@@ -0,0 +1,135 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,jpeg-encoder.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm JPEG Encoder
+
+maintainers:
+  - Atanas Filipov <atanas.filipov@oss.qualcomm.com>
+
+description:
+  Qualcomm JPEG Encoder is the JPEG encode hardware present in Qualcomm SoCs.
+
+properties:
+  compatible:
+    enum:
+      - qcom,sm8250-jenc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 6
+    maxItems: 6
+
+  clock-names:
+    items:
+      - const: bus_hf
+      - const: bus_sf
+      - const: iface
+      - const: cpas
+      - const: axi
+      - const: core
+
+  power-domains:
+    maxItems: 1
+
+  iommus:
+    description:
+      Two SMMU stream IDs for the JPEG hardware. The first entry is for
+      the JPEG core engine; the second is for the JPEG DMA/scale path.
+      The exact stream ID assignment is SoC-specific and not publicly
+      documented by Qualcomm.
+    minItems: 2
+    maxItems: 2
+
+  interconnects:
+    maxItems: 4
+
+  interconnect-names:
+    items:
+      - const: cam_ahb
+      - const: cam_hf_0_mnoc
+      - const: cam_sf_0_mnoc
+      - const: cam_sf_icp_mnoc
+
+  operating-points-v2: true
+
+  opp-table:
+    type: object
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+  - power-domains
+  - iommus
+  - interconnects
+  - interconnect-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,camcc-sm8250.h>
+    #include <dt-bindings/clock/qcom,gcc-sm8250.h>
+    #include <dt-bindings/interconnect/qcom,sm8250.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    jpeg-encoder@ac53000 {
+        compatible = "qcom,sm8250-jenc";
+        reg = <0xac53000 0x1000>;
+
+        interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
+        power-domains = <&camcc TITAN_TOP_GDSC>;
+
+        clocks = <&gcc GCC_CAMERA_HF_AXI_CLK>,
+                 <&gcc GCC_CAMERA_SF_AXI_CLK>,
+                 <&camcc CAM_CC_CORE_AHB_CLK>,
+                 <&camcc CAM_CC_CPAS_AHB_CLK>,
+                 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+                 <&camcc CAM_CC_JPEG_CLK>;
+        clock-names =
+            "bus_hf",
+            "bus_sf",
+            "iface",
+            "cpas",
+            "axi",
+            "core";
+
+        iommus = <&apps_smmu 0x2040 0x400>,
+                 <&apps_smmu 0x2440 0x400>;
+
+        interconnects =
+            <&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_CAMERA_CFG 0>,
+            <&mmss_noc MASTER_CAMNOC_HF 0 &mc_virt SLAVE_EBI_CH0 0>,
+            <&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_EBI_CH0 0>,
+            <&mmss_noc MASTER_CAMNOC_ICP 0 &mc_virt SLAVE_EBI_CH0 0>;
+        interconnect-names =
+            "cam_ahb",
+            "cam_hf_0_mnoc",
+            "cam_sf_0_mnoc",
+            "cam_sf_icp_mnoc";
+
+        operating-points-v2 = <&jpeg_opp_table>;
+
+        jpeg_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-300000000 {
+                opp-hz = /bits/ 64 <300000000>;
+                opp-level = <0>;
+            };
+
+            opp-600000000 {
+                opp-hz = /bits/ 64 <600000000>;
+                opp-level = <3>;
+            };
+        };
+    };
-- 
2.34.1


