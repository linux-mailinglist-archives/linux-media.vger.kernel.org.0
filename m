Return-Path: <linux-media+bounces-66625-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id awA+HbQtSmpe/AAAu9opvQ
	(envelope-from <linux-media+bounces-66625-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 05 Jul 2026 12:11:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF22C709B0F
	for <lists+linux-media@lfdr.de>; Sun, 05 Jul 2026 12:10:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=pm.me header.s=protonmail3 header.b=Kk57kR7J;
	dmarc=pass (policy=quarantine) header.from=pm.me;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66625-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66625-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1820D3022075
	for <lists+linux-media@lfdr.de>; Sun,  5 Jul 2026 10:10:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3459D3905FD;
	Sun,  5 Jul 2026 10:10:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A42364EB6;
	Sun,  5 Jul 2026 10:10:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783246244; cv=none; b=UDKtuKpXikJsCC72PQfmJEEkxPHF0lIMRC1Hnkfj+bhaOC8O2kpeTXLo30PrlX19Od48YpOAYeJt85USRlE2mT//rI0kg9NaSdbgKf1wnLKcS1cE7xNAhAjHY+gm/GfaDNQymOeE3Vm8RSYuOzeAt5zVHEoL48Loat8kxLyk98E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783246244; c=relaxed/simple;
	bh=d+1veSMMNhmMknc4U5tBLbwBt8Cc5m4SNqcJtqh3z/c=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i3CvhhI1b7RkDh6cHzNE296R2brSekiGKdkVYFg4/3+gbwMB4qyTxTvvOluZK1NroqPi3sHtFMcXph/mEEDJjG/4eGnxMtn95NVIqcmRrDpd/UxacsDm2OG0yMCUR6cICsVJdryZRYa0Y1d46z0A6g9EJpdvpi4c6eTDzW3jF5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=Kk57kR7J; arc=none smtp.client-ip=185.70.43.22
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1783246234; x=1783505434;
	bh=NwhQeFqh/lqgtoLPEMKrAqFCbpgQgElRtomSXFaHFkM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Kk57kR7JktrwEId5dWM6aqDKo20iwe8MwT67jEOfMvjfswfOjavgRSzmh/6Sgid7k
	 o9Xf5f0r+SiIXYKLhSTV13RAhclQczcgc5gK7PPgiYfq9mVgxNPycUsuYHVCArYFWN
	 4ZZk1f/cOggPSjI213sv2rcFG5VEsFAd59JCyI/ghYsVE9AodbF2GHcxEzBBnBZ/J8
	 86AAfAvsYHC0OU8FEclPwt1HWwdWGil5EqPw/+ooBABRsm4bGRwq2ndnl6pvKSMgmd
	 RRCWMNL9TFkmp2VdBjPQo1k2hvFuWtDsCHj/O2IVtyWB/H7xUDv0GaZPmLujlajOka
	 +KAOLyDf2HXag==
Date: Sun, 05 Jul 2026 10:10:27 +0000
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alexander Koskovich <akoskovich@pm.me>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/3] dt-bindings: media: qcom,milos-iris: Add Milos video codec
Message-ID: <20260705-milos-iris-v3-1-8c1353530f24@pm.me>
In-Reply-To: <20260705-milos-iris-v3-0-8c1353530f24@pm.me>
References: <20260705-milos-iris-v3-0-8c1353530f24@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 689114ff202948a983f967a93ea5944e50dcc115
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66625-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:akoskovich@pm.me,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[akoskovich@pm.me,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pm.me:from_mime,pm.me:email,pm.me:mid,pm.me:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BF22C709B0F

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
index 000000000000..b0b0355ad52e
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
+                                <&rpmhpd_opp_svs>;
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
+                                <&rpmhpd_opp_svs>;
+            };
+
+            opp-444000000 {
+                opp-hz =3D /bits/ 64 <444000000>;
+                required-opps =3D <&rpmhpd_opp_nom>,
+                                <&rpmhpd_opp_svs_l1>;
+            };
+
+            opp-552000000 {
+                opp-hz =3D /bits/ 64 <552000000>;
+                required-opps =3D <&rpmhpd_opp_turbo>,
+                                <&rpmhpd_opp_nom>;
+            };
+        };
+    };

--=20
2.53.0



