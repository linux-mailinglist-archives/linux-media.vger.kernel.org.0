Return-Path: <linux-media+bounces-53505-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJJ9B4FPoGmIiAQAu9opvQ
	(envelope-from <linux-media+bounces-53505-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 14:49:53 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A41B91A6F64
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 14:49:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8083131B3849
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 13:42:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69ED137B3F4;
	Thu, 26 Feb 2026 13:41:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7D836CE1B;
	Thu, 26 Feb 2026 13:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772113269; cv=none; b=lVAff3VOa3fmt9ggBGJU7J3ajwlu3Nl0weZE/Thu9dYhtruqFKPJ0te8+GfIqRt9U5SjAkNaFDIk2NB6S3TKOrWbi77e57Ausg07TL4qrBOUNbuy3yFcyqqURJozr6mzwqHLEhHIcA9tRBApxFx4540IgjaitZnXIzGwhgvNGjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772113269; c=relaxed/simple;
	bh=EX2bIZOSowP7el+n7llkL5Myq7aMQsIPLE13DNgNaf0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=trzaRKPIa8GHgAF3WtlGEY/1tDiWyQxIB2yLRRvUjtL2k/lUUnH7RLPIO42VwfOvZT8X5w9CNYgi1MnYRQYA+hI1XuObESP8DjISm7pxy9fozS8KnTniKtUxTGDmmesVNORQIXjmBSOt0LNFoO+iyD3T992kTu1wupr4U2kvCRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 55E461A14A2;
	Thu, 26 Feb 2026 14:41:01 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 405991A14A9;
	Thu, 26 Feb 2026 14:41:01 +0100 (CET)
Received: from lsv15149.swis.ro-buh01.nxp.com (lsv15149.swis.ro-buh01.nxp.com [10.162.246.145])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 8A45A2035B;
	Thu, 26 Feb 2026 14:40:59 +0100 (CET)
From: Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
Date: Thu, 26 Feb 2026 15:40:42 +0200
Subject: [PATCH 3/9] dt-bindings: npu: Add bindings for NXP Neutron
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-neutron-v1-3-46eccb3bb50a@nxp.com>
References: <20260226-neutron-v1-0-46eccb3bb50a@nxp.com>
In-Reply-To: <20260226-neutron-v1-0-46eccb3bb50a@nxp.com>
To: Oded Gabbay <ogabbay@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Jiwei Fu <jiwei.fu@nxp.com>, 
 Forrest Shi <xuelin.shi@nxp.com>, Alexandru Taran <alexandru.taran@nxp.com>, 
 Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772113256; l=3009;
 i=ruxandra.radulescu@nxp.com; s=20260204; h=from:subject:message-id;
 bh=EX2bIZOSowP7el+n7llkL5Myq7aMQsIPLE13DNgNaf0=;
 b=tPxIFYSc7cbZSar8MAZ2vi5SJTPMRU/MOwR6ASpB1hIm7foVZJIzow1x+B7uPluDrCqVmZjC0
 UbPbT0uDRp6D2R7LlgfcgzTj+tB0JQdwp92nBdYyDP1Jra2XEl0bXlE
X-Developer-Key: i=ruxandra.radulescu@nxp.com; a=ed25519;
 pk=zoq4b4OYR0c4faAH97xoTxdr6vfR8OvPbS+Cx0XhIBY=
X-Virus-Scanned: ClamAV using ClamSMTP
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,nxp.com,amd.com];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-53505-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ruxandra.radulescu@nxp.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.993];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:mid,nxp.com:email,devicetree.org:url,4ab00000:email]
X-Rspamd-Queue-Id: A41B91A6F64
X-Rspamd-Action: no action

Add the bindings for Neutron, a Neural Processing Unit from NXP.

Signed-off-by: Jiwei Fu <jiwei.fu@nxp.com>
Signed-off-by: Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
---
 .../devicetree/bindings/npu/nxp,imx95-neutron.yaml | 95 ++++++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/Documentation/devicetree/bindings/npu/nxp,imx95-neutron.yaml b/Documentation/devicetree/bindings/npu/nxp,imx95-neutron.yaml
new file mode 100644
index 000000000000..ba1f6851866b
--- /dev/null
+++ b/Documentation/devicetree/bindings/npu/nxp,imx95-neutron.yaml
@@ -0,0 +1,95 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/npu/nxp,imx95-neutron.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP Neutron NPU
+
+maintainers:
+  - Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
+  - Jiwei Fu <jiwei.fu@nxp.com>
+
+description:
+  Neutron is an NPU from NXP targeting edge AI inference applications.
+  Initially supported on i.MX95 SoCs.
+
+properties:
+  compatible:
+    enum:
+      - nxp,imx95-neutron
+
+  reg:
+    items:
+      - description: Register space
+      - description: Instruction area of the TCM space
+      - description: Data area of the TCM space
+
+  reg-names:
+    items:
+      - const: regs
+      - const: itcm
+      - const: dtcm
+
+  memory-region:
+    description:
+      Phandle referencing a "shared-dma-pool" to be used for Neutron
+      inference buffers, which need to be 1MB aligned.
+
+      The memory region must be defined with alignment of 1MB and size
+      should be large enough to accommodate the targeted ML models. It
+      should be marked as reusable.
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 2
+    maxItems: 3
+
+  clock-names:
+    minItems: 2
+    items:
+      - const: npu
+      - const: npu_apb
+      - const: npu_cgc
+
+  iommus:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - memory-region
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    bus {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      neutron@4ab00000 {
+              compatible = "nxp,imx95-neutron";
+              reg = <0x0 0x4ab00000 0x0 0x00000400>,
+                    <0x0 0x4AB10000 0x0 0x00010000>,
+                    <0x0 0x4AB08000 0x0 0x00008000>;
+              reg-names = "regs", "itcm", "dtcm";
+              memory-region = <&neutron_pool>;
+              interrupts = <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>;
+              clocks = <&scmi_clk 68>, <&scmi_clk 67>;
+              clock-names = "npu", "npu_apb";
+              power-domains = <&scmi_devpd 20>;
+      };
+    };
+...

-- 
2.34.1


