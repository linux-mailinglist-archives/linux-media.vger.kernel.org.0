Return-Path: <linux-media+bounces-17434-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F4D969450
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 08:58:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1141BB22FE0
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 06:58:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 955851D6DD5;
	Tue,  3 Sep 2024 06:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aDR7sLR6"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36DFA1D61B5;
	Tue,  3 Sep 2024 06:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725346638; cv=none; b=bcIj5TztiMmsPFZVE0eeznyHwIBeUF8fBJY3JNYrHmtMhgBZJFKhCRU2dg4CwSpfh1ImrTmEGgc5iYIOyBUTKTqPhMlM/AWhbiD+XJ/gKX6MAtJFY324LgJjxDlamxgo54eynoX/bhiFA0j5p4ukkYkXN/vk50bujY1CYhAS94E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725346638; c=relaxed/simple;
	bh=DoV3cEjHCrj0em+ctd2tdl1ECJ6y+HIT5C7bI5MI8yg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ECLb0kT2fyq1503duSKRIqozeNwEUx8bEcReFy8rSmFesM0eZBNNhAyw/1zisZZEENnm5m8TvdPEXjMZ2kdnsNobjJa3hPAnxbdbwR2ki7i0aTLAC0jTnMKYMemKs6jEAyu/w4ZwtP6Wh3gK0+Myf1ac8J9Ks04orVJArVf85q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aDR7sLR6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B6806C4CECE;
	Tue,  3 Sep 2024 06:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725346637;
	bh=DoV3cEjHCrj0em+ctd2tdl1ECJ6y+HIT5C7bI5MI8yg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=aDR7sLR61WBXzHUj+N4X4cmpt25+hkB2xg9KDhbWeN1lcEx8E1KduRxfAJCZmy4I7
	 0ocn0reg3XtoeLuGaKwCJhMRtDkWAb4r1EJ7+ShJ4cVneV0dvzTMAE5sKhzXzCLPqb
	 vlp6D/Ewz2o7khafrpQ8EvO8cjcwRYr6XYqi4izPzykSMi0k+fG8UOAo8+LNYItEzk
	 33OtttlyQ6Miiv7bmgvGx7KC3OKl3O4Ej0eibYyXwYRSmYglAE9j8bG5TKQNA6+DQ3
	 cDVb5SMC0IQzG3RlKKtVVwr1Admxzo8DQhWd3PLOA2HDcGC6lm46ptXzxMiLsSBtME
	 FpG5IuoN0ROXA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A17DECD342C;
	Tue,  3 Sep 2024 06:57:17 +0000 (UTC)
From: Keke Li via B4 Relay <devnull+keke.li.amlogic.com@kernel.org>
Date: Tue, 03 Sep 2024 14:57:07 +0800
Subject: [PATCH 3/9] dt-bindings: media: Add amlogic,c3-mipi-adapter.yaml
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240903-c3isp-v1-3-8af0edcc13c8@amlogic.com>
References: <20240903-c3isp-v1-0-8af0edcc13c8@amlogic.com>
In-Reply-To: <20240903-c3isp-v1-0-8af0edcc13c8@amlogic.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kieran.bingham@ideasonboard.com, 
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, 
 Keke Li <keke.li@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725346629; l=3216;
 i=keke.li@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=mM/xUp1DyGw7cG0o1hSmUP9EbGmgw9MXz0V3Yhw5n8Y=;
 b=dWlU1ZByk7gk8ONpixARdJBipuUI8wOBQFtpPPa76wUzeVZZaJ3WHcx2SB0+SQ5zrvbWSv9AX
 HriBruWRYIOA+Rxk+6ze0oSnnmvrfXxQ6E9NA6g0q7ZjriuZgslWVLZ
X-Developer-Key: i=keke.li@amlogic.com; a=ed25519;
 pk=XxNPTsQ0YqMJLLekV456eoKV5gbSlxnViB1k1DhfRmU=
X-Endpoint-Received: by B4 Relay for keke.li@amlogic.com/20240902 with
 auth_id=204
X-Original-From: Keke Li <keke.li@amlogic.com>
Reply-To: keke.li@amlogic.com

From: Keke Li <keke.li@amlogic.com>

c3-mipi-adapter is used to organize mipi data and
send raw data to ISP module.

Signed-off-by: Keke Li <keke.li@amlogic.com>
---
 .../bindings/media/amlogic,c3-mipi-adapter.yaml    | 114 +++++++++++++++++++++
 1 file changed, 114 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/amlogic,c3-mipi-adapter.yaml b/Documentation/devicetree/bindings/media/amlogic,c3-mipi-adapter.yaml
new file mode 100644
index 000000000000..e1873fe829c7
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/amlogic,c3-mipi-adapter.yaml
@@ -0,0 +1,114 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/amlogic,c3-mipi-adapter.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic C3 MIPI adapter receiver
+
+maintainers:
+  - Keke Li <keke.li@amlogic.com>
+
+description: |-
+  MIPI adapter is used to convert the MIPI CSI-2 data
+  into an ISP supported data format.
+
+properties:
+  compatible:
+    enum:
+      - amlogic,c3-mipi-adapter
+
+  reg:
+    minItems: 3
+    maxItems: 3
+
+  reg-names:
+    items:
+      - const: adap_top
+      - const: adap_fd
+      - const: adap_rd
+
+  power-domains:
+    maxItems: 1
+
+  clocks:
+    minItems: 2
+
+  clock-names:
+    items:
+      - const: vapb
+      - const: adap
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: input port node.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: output port node.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - power-domains
+  - clocks
+  - clock-names
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/amlogic,c3-peripherals-clkc.h>
+    #include <dt-bindings/power/amlogic,c3-pwrc.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        adap: adap@ff010000 {
+            compatible = "amlogic,c3-mipi-adapter";
+
+            reg = <0x0 0xff010000 0x0 0x100>,
+                  <0x0 0xff01b000 0x0 0x100>,
+                  <0x0 0xff01d000 0x0 0x200>;
+
+            reg-names = "adap_top", "adap_fd", "adap_rd";
+
+            power-domains = <&pwrc PWRC_C3_ISP_TOP_ID>;
+
+            clocks = <&clkc_periphs CLKID_VAPB>,
+                     <&clkc_periphs CLKID_ISP0>;
+
+            clock-names = "vapb", "adap";
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    c3_adap_in: endpoint {
+                        remote-endpoint = <&c3_mipi_csi_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    c3_adap_out: endpoint {
+                        remote-endpoint = <&c3_isp_in>;
+                    };
+                };
+            };
+        };
+    };
+...

-- 
2.45.2



