Return-Path: <linux-media+bounces-67686-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id p22hHtmWV2o/XgAAu9opvQ
	(envelope-from <linux-media+bounces-67686-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 16:19:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F1175F485
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 16:19:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=CdWDSxdn;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67686-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67686-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BC3BA308492C
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 13:58:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3412736F434;
	Wed, 15 Jul 2026 13:57:16 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8C1320A04
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 13:57:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784123835; cv=none; b=mK13zUvI3RFsv9IRQ0QIY7SvGsnrrwjONwXN4ON0oOR84psIlFHjDwTvLFpl9QVm6tyaBmUyR2tVeIYu+F6qY+MrNHfHlgzbnOPwoLe/sovA2cqtCci0xDZs+P9sRwu9jJ6N62UNG6dXlY+QCOvYAAFNDLJJhnwe9E71FPy7jDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784123835; c=relaxed/simple;
	bh=QLdW9lCW6QkSZ8fHcCMIJRqmx68mlFq2mbrCnEpwkFk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SGJ2GA1DZAYStRlkltEBm/n7og1UQqGxhGgbU7YJqHoSG6qellN9kXgte2E+bpUeM5cKYV8wwhEFKVhKvYZTY/d2Pucteo1XfQOXBpIucRJd/Ns8DoTUWn9EIOJP4/3sxCHyzFaDJjS9R3pZ/ndgFTpbbO2KgmDjcfzac5JyxOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CdWDSxdn; arc=none smtp.client-ip=198.175.65.20
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784123834; x=1815659834;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QLdW9lCW6QkSZ8fHcCMIJRqmx68mlFq2mbrCnEpwkFk=;
  b=CdWDSxdnNE+6En7aNGYgn3KD8SOnqDHjZFbQ/Qe7I6vrXJzN0+CKmIDx
   lPOh+Tcij04HDi4bXyJ+2qK6CV3wzPAWx3Y7cNQDnoufpba2nWnQEBSCp
   GsLDInIvCa50RQAVVV5jFjQk/YyCYPGp10Cs2cZ0Ae62yyH4VtOdC55Ky
   M3YwBhCGRBtY6dXHM61qJMFavOGYaQnale8neR4AWnzipVEB7aadrg4/3
   Xnrij4wn2mEwagsgLlxdlhZEBXGeKAQr48jyeJMrRx87etryMZsEk4hvf
   WuZDyRAPa2E5ucz3oDYlxqRPu1GiBjrgPnnnGmXe5b9MBR5miwvnc6JW0
   Q==;
X-CSE-ConnectionGUID: W4qbbtYuQyqvwhO7u8Ow+Q==
X-CSE-MsgGUID: HPmRU9p/SJqC5kC5z1kSyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84543038"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="84543038"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 06:57:13 -0700
X-CSE-ConnectionGUID: Jxz0bMDmSAGNV98maSrJkg==
X-CSE-MsgGUID: csMX9vLZTL2mHw+fVSi4CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="255681408"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.106])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 06:57:12 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 3EB0312080C;
	Wed, 15 Jul 2026 16:57:11 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wk06p-00000002Xct-0jpZ;
	Wed, 15 Jul 2026 16:57:11 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Jai Luthra <jai.luthra@ideasonboard.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH 1/1] dt-bindings: media: i2c: Add Sony IMX678
Date: Wed, 15 Jul 2026 16:57:11 +0300
Message-ID: <20260715135711.605907-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67686-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:jai.luthra@ideasonboard.com,m:robh@kernel.org,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,linux.intel.com:from_mime,linux.intel.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,devicetree.org:url];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 64F1175F485
X-Rspamd-Action: no action

Really add Sony IMX678 bindings this time. Those were accidentally missed
from commit 447ea0c26e57 ("dt-bindings: media: i2c: Add Sony IMX678") even
though the original patch included them.

Fixes: 447ea0c26e57 ("dt-bindings: media: i2c: Add Sony IMX678")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../bindings/media/i2c/sony,imx678.yaml       | 130 ++++++++++++++++++
 1 file changed, 130 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
new file mode 100644
index 000000000000..098f72544216
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
@@ -0,0 +1,130 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2026 Ideas on Board Oy
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/sony,imx678.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sony IMX678 Sensor
+
+maintainers:
+  - Jai Luthra <jai.luthra@ideasonboard.com>
+
+description:
+  Sony IMX678 diagonal 8.86 mm (Type 1/1.8) CMOS active pixel type solid-state
+  image sensor with a square pixel array and 8.40M (3856x2180) effective pixels.
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - sony,imx678-aamr
+          - sony,imx678-aaqr
+      - const: sony,imx678
+    description:
+      The IMX678 sensor exists in a colour variant (IMX678-AAQR) and a mono
+      variant (IMX678-AAMR). The variant-specific compatible describes the
+      exact sensor variant, with the generic IMX678 compatible as a fallback.
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description: |
+      Input clock (INCK). Only the rates listed in the datasheet are supported:
+      13.5, 18, 24, 27, 36, 37.125, 72, and 74.25 MHz.
+    maxItems: 1
+
+  avdd-supply:
+    description: Analog power supply (3.3V)
+
+  ovdd-supply:
+    description: Interface power supply (1.8V)
+
+  dvdd-supply:
+    description: Digital power supply (1.1V)
+
+  reset-gpios:
+    description: Sensor RESETN (XCLR) GPIO
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            oneOf:
+              - items:
+                  - const: 1
+                  - const: 2
+              - items:
+                  - const: 1
+                  - const: 2
+                  - const: 3
+                  - const: 4
+              - items:
+                  - const: 1
+                  - const: 2
+                  - const: 3
+                  - const: 4
+                  - const: 5
+                  - const: 6
+                  - const: 7
+                  - const: 8
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
+  - avdd-supply
+  - ovdd-supply
+  - dvdd-supply
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
+        camera@1a {
+            compatible = "sony,imx678-aaqr", "sony,imx678";
+            reg = <0x1a>;
+            clocks = <&imx678_clk>;
+
+            avdd-supply = <&camera_avdd_3v3>;
+            ovdd-supply = <&camera_ovdd_1v8>;
+            dvdd-supply = <&camera_dvdd_1v1>;
+
+            reset-gpios = <&gpio 0 GPIO_ACTIVE_LOW>;
+
+            port {
+                imx678: endpoint {
+                    remote-endpoint = <&cam>;
+                    data-lanes = <1 2 3 4>;
+                    link-frequencies = /bits/ 64 <720000000>;
+                };
+            };
+        };
+    };
+...
-- 
2.47.3


