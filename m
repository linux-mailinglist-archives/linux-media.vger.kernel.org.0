Return-Path: <linux-media+bounces-63071-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uAxULSH+GWr80QgAu9opvQ
	(envelope-from <linux-media+bounces-63071-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 22:59:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 33EA0608BB3
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 22:59:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 083BC302A7F1
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 20:58:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72F6D42847C;
	Fri, 29 May 2026 20:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="Ug2e6ITg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADA7428487;
	Fri, 29 May 2026 20:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780088324; cv=none; b=i1Z4eE4uTyR/M6YoJBiknVSwaSyGu2Icscvfi0AnaM8QKYfBmFe08/bE+XXu4r9Ics/MLzEwWg73muwYNnyR8tvFtev3cyQpyi+fM/6mGkZUcCWd2zDAw3FS+/qetcghxp/wwJcuSVRYKAv3pqplviRexiUFVyB5cpw8DUyw4R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780088324; c=relaxed/simple;
	bh=vD28/AyGV0MmCW4G4slp4QTDTlnESABAhUPRS1FugYQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=itH5FEvO9guVZqhpWm3lFzgHDh8zRY3qPcnkQsdMoZ6lxWx5rDRdX22sZyf/89gDboeRSNtIXJV//HiszPz1RqAREpCuy5A59oyr+cL8DHmp1bogks8A1w00FzLmnjIqcVILhgBJ5a571O1E4NgZDiM0VmHMSvfpSZZ2diI8obE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=Ug2e6ITg; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1780088321; x=1780347521;
	bh=f6tp+bBd2jU8ODsBayxMkDKqDmaxrKiuA1glTqBTayY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Ug2e6ITgyqZ+q+EUnjwZKlLetIsVOfYqLc0gX0NsKI7mzlaTTxHFRV5zvI2pCU2Cp
	 790WfYuLojI8/YcgkF4u3vLfes/i7+1+K17qg8XGo13yXUAK5O11D0H9MDNEu+p1sL
	 xe8fkNOBWwDw6qOCmUC1Z7wgZ/preYMuelgyhkzqdPjgwF4t6iznCq29dmoBQEx86J
	 hgyvMx9cFSwkviW9gOHcd+usDrl3zQeJtB6U8UVVxYXQgzfV4rXcjddTE5YZ+r4GIX
	 sdfXRSVjbTTxTWoZzMx5iObWT9jcTSm+ev4lC40ixvQ09Wgm64c20iB9MZxt62qUzM
	 QvO5n3K01KhUQ==
Date: Fri, 29 May 2026 20:58:34 +0000
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alexander Koskovich <akoskovich@pm.me>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 1/3] dt-bindings: media: qcom,milos-iris: Add Milos video codec
Message-ID: <20260529-milos-iris-v2-1-7a763d7195ae@pm.me>
In-Reply-To: <20260529-milos-iris-v2-0-7a763d7195ae@pm.me>
References: <20260529-milos-iris-v2-0-7a763d7195ae@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 315cb6a380129afce23b99d1fa2505931176395e
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63071-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,pm.me:email,pm.me:mid,pm.me:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,aa00000:email]
X-Rspamd-Queue-Id: 33EA0608BB3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add binding for Qualcomm Milos Iris video codec.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 .../devicetree/bindings/media/qcom,milos-iris.yaml | 166 +++++++++++++++++=
++++
 1 file changed, 166 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,milos-iris.yaml b=
/Documentation/devicetree/bindings/media/qcom,milos-iris.yaml
new file mode 100644
index 000000000000..36f49590d7b8
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,milos-iris.yaml
@@ -0,0 +1,166 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,milos-iris.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Milos SoC Iris video encoder and decoder
+
+maintainers:
+  - Alexander Koskovich <akoskovich@pm.me>
+
+description:
+  The Iris video processing unit on Qualcomm Milos SoC is a video encode a=
nd
+  decode accelerator.
+
+properties:
+  compatible:
+    enum:
+      - qcom,milos-iris
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
+  dma-coherent: true
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: cpu-cfg
+      - const: video-mem
+
+  iommus:
+    maxItems: 2
+
+  operating-points-v2: true
+  opp-table:
+    type: object
+
+  power-domains:
+    maxItems: 4
+
+  power-domain-names:
+    items:
+      - const: venus
+      - const: vcodec0
+      - const: cx
+      - const: mx
+
+  resets:
+    maxItems: 2
+
+  reset-names:
+    items:
+      - const: bus
+      - const: core
+
+required:
+  - compatible
+  - dma-coherent
+  - interconnects
+  - interconnect-names
+  - iommus
+  - power-domain-names
+  - resets
+  - reset-names
+
+allOf:
+  - $ref: qcom,venus-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/clock/qcom,milos-gcc.h>
+    #include <dt-bindings/clock/qcom,milos-videocc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,milos-rpmh.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    video-codec@aa00000 {
+        compatible =3D "qcom,milos-iris";
+        reg =3D <0x0aa00000 0xf0000>;
+
+        clocks =3D <&gcc GCC_VIDEO_AXI0_CLK>,
+                 <&videocc VIDEO_CC_MVS0C_CLK>,
+                 <&videocc VIDEO_CC_MVS0_CLK>;
+        clock-names =3D "iface",
+                      "core",
+                      "vcodec0_core";
+
+        dma-coherent;
+        iommus =3D <&apps_smmu 0x1960 0>,
+                 <&apps_smmu 0x1967 0>;
+
+        interconnects =3D <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_=
ONLY
+                         &cnoc_cfg SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONL=
Y>,
+                        <&mmss_noc MASTER_VIDEO QCOM_ICC_TAG_ALWAYS
+                         &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+        interconnect-names =3D "cpu-cfg",
+                             "video-mem";
+
+        interrupts =3D <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+        operating-points-v2 =3D <&iris_opp_table>;
+
+        memory-region =3D <&video_mem>;
+
+        power-domains =3D <&videocc VIDEO_CC_MVS0C_GDSC>,
+                        <&videocc VIDEO_CC_MVS0_GDSC>,
+                        <&rpmhpd RPMHPD_CX>,
+                        <&rpmhpd RPMHPD_MX>;
+        power-domain-names =3D "venus",
+                             "vcodec0",
+                             "cx",
+                             "mx";
+
+        resets =3D <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
+                 <&videocc VIDEO_CC_MVS0C_CLK_ARES>;
+        reset-names =3D "bus",
+                      "core";
+
+        iris_opp_table: opp-table {
+            compatible =3D "operating-points-v2";
+
+            opp-240000000 {
+                opp-hz =3D /bits/ 64 <240000000>;
+                required-opps =3D <&rpmhpd_opp_low_svs>,
+                                <&rpmhpd_opp_low_svs>;
+            };
+
+            opp-338000000 {
+                opp-hz =3D /bits/ 64 <338000000>;
+                required-opps =3D <&rpmhpd_opp_svs>,
+                                <&rpmhpd_opp_svs>;
+            };
+
+            opp-366000000 {
+                opp-hz =3D /bits/ 64 <366000000>;
+                required-opps =3D <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_svs_l1>;
+            };
+
+            opp-444000000 {
+                opp-hz =3D /bits/ 64 <444000000>;
+                required-opps =3D <&rpmhpd_opp_nom>,
+                                <&rpmhpd_opp_nom>;
+            };
+
+            opp-552000000 {
+                opp-hz =3D /bits/ 64 <552000000>;
+                required-opps =3D <&rpmhpd_opp_turbo>,
+                                <&rpmhpd_opp_turbo>;
+            };
+        };
+    };

--=20
2.53.0



