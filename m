Return-Path: <linux-media+bounces-55396-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFAoDjJvsWlVvAIAu9opvQ
	(envelope-from <linux-media+bounces-55396-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 14:33:38 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A06722649BB
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 14:33:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 10EBB3083CF2
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 13:31:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F284132B9B6;
	Wed, 11 Mar 2026 13:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=schnwalter.eu header.i=@schnwalter.eu header.b="VQwlPdye";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="A3qk3XXD"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36512320A14;
	Wed, 11 Mar 2026 13:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773235870; cv=none; b=XlPv2TK65vhvqyV7V02RPogv77jMOQdJ0RVsl5gTdnzqT8GXzmO6KXN26BKnocRMhX+QUjmtqDzXMAgHwPzaeZaCB/jrRtWUEN5Gm54ApSGFxa5DedTeS8ft8YkgwQf4HfqXuGxiYvtC8BzAEu3mXnSOUAAeqdS5+pf6mGHCfjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773235870; c=relaxed/simple;
	bh=Nc8wI+h1xYC7JImOYtaea4+ehwlNl8vethAfXtZHc9Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gcv/6Wk3vdOojhwrzps/E6li1P8454/zMC5dDr0XL916B3yT/wjtY2SrbRVwD9KrQXaxkf3RI0fmA4kFsxWsVbFroZM66CyHsIRZMrZQcw17w8jMCcReKFK9Hjs3/sWvQbFaxgLgesyo1FWe8rWFJSuAaPav7tgqGbBDt8Orc/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=schnwalter.eu; spf=pass smtp.mailfrom=schnwalter.eu; dkim=pass (2048-bit key) header.d=schnwalter.eu header.i=@schnwalter.eu header.b=VQwlPdye; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=A3qk3XXD; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=schnwalter.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=schnwalter.eu
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 6958C14002A8;
	Wed, 11 Mar 2026 09:31:08 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Wed, 11 Mar 2026 09:31:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=schnwalter.eu;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1773235868; x=1773322268; bh=2u/eKkREDSPEVK7UigkmucCANswJViIR
	fHAx4c54GiM=; b=VQwlPdye45VcSo7k7RZ8mCnnSgKipS2AiZXQbhl6YwhC5sro
	CNPAmKaDlj9bGcdep/EFk0j14o6ekGdN4K/1eVyLz/O7Fc6+4McVu9KHABvl6lZY
	kdDlXmlIxJVe8YXSRw8DB2sZxjtjS2itCfU12cY2wAvNnPCSHQztHM1rDnmhId+q
	l4kAr8VKTddNOVhuOk0IfAWAMFQ24DHOiTKfph2Mn1C9FJOH2H9m7vVTjRKNaWZc
	Bv7RZh4P2M54N4AtcNO7ifT6gUL22l2rJfSFVaKtiLfTdLyxN22L1gG88hoWGExx
	Y/MrNpM3LHjWFf12lVAtLFCIpg27tIfJ4EQDBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773235868; x=
	1773322268; bh=2u/eKkREDSPEVK7UigkmucCANswJViIRfHAx4c54GiM=; b=A
	3qk3XXDag7iHLrxMcY3I78irBq2A6TaIUUxAYFAo3TnZ6gcMiXnaKYzYostCf+w3
	KmiQXtezd2D98od4SF3Sf/+oVWKV9a6KkORO+bRAsks/Km/v28FFii8OYMPvfDpp
	UM7pDAoZLLqAgdXkgVG3tcoCq6zyJU0HJMBznFBqEZ/BEBIfd3GBToP+HNHzBu6Y
	vXtCBYd5nWlQZENzbdebWh9AlKMtCL68gbsLsfTchSGzt0BpMULcEaEka6lI3PBP
	+HrntAPOMnRTRpA+RC1rv7tma9d7nFv+jLbfgej5F1Pctn9WV2cV7F+68dbYOqNo
	sXUu1mmfizEIVglHfwU0Q==
X-ME-Sender: <xms:nG6xaZxM3NGCwPTAEMxUhNapU2t16k5hrbS61CNKOlf33_B_brK2kQ>
    <xme:nG6xaa0DH2KGlP56RKBn6Obu_BZMYw78vVRmxtDL-Md7-g1qGWMDSNVL38-WUEdcx
    r_bpACIcejP8ku4PFkZ6JWMORO56mTpBr3Ug1sZdj92tRAP9HfGMw>
X-ME-Received: <xmr:nG6xaSmViFTFPJMskbLnNIEcKP8Zt41HabgaUKsW3rQQpjtoRGnXFHOjzgtvOg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvkeegtdefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeghrghlthgv
    rhcuhggvrhhnvghrucfutghhnhgvihguvghruceotghonhhtrggtthesshgthhhnfigrlh
    htvghrrdgvuheqnecuggftrfgrthhtvghrnhephfdthefhgeehteejtdfhieegledtgefh
    ieduieekieffkedutdelffefkeehleefnecuffhomhgrihhnpeguvghvihgtvghtrhgvvg
    drohhrghdplhhinhhugihtvhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgr
    rhgrmhepmhgrihhlfhhrohhmpegtohhnthgrtghtsehstghhnhifrghlthgvrhdrvghupd
    hnsggprhgtphhtthhopeduuddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhgt
    hhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghl
    rdhorhhgpdhrtghpthhtohepjhgrtghophhordhmohhnughisehiuggvrghsohhnsghorg
    hrugdrtghomhdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprh
    gtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgt
    phhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonh
    htrggtthesshgthhhnfigrlhhtvghrrdgvuh
X-ME-Proxy: <xmx:nG6xaR8q9e5ZmgTFjtoVRpTTLqCZP4mwr7fuwdFfWnjsCoFmlpIDTg>
    <xmx:nG6xaQLXZ4IHTgHnMz6wc86Zc3JYSr3L801VYlUjJezkWzTwV-f8Jg>
    <xmx:nG6xaWjWpBXPogy8gdqnSdwtuL1mygcTHpFDxaJ1imt3rnDj088aBA>
    <xmx:nG6xac_boKT-xGlBx2sN_oMor6KTX5qZrQEK8fTomJ74PHJzBIwQCg>
    <xmx:nG6xaSSqsKOy5GYVXJaN612TiKxiU0ppXsfYnxpWYkWWYY1aekKq-beu>
Feedback-ID: i455149b6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 Mar 2026 09:31:06 -0400 (EDT)
From: Walter Werner Schneider <contact@schnwalter.eu>
Date: Wed, 11 Mar 2026 15:30:46 +0200
Subject: [PATCH v7 1/2] dt-bindings: media: i2c: Add ov2732 image sensor
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-ov2732-driver-v7-1-2e036d7b679e@schnwalter.eu>
References: <20260311-ov2732-driver-v7-0-2e036d7b679e@schnwalter.eu>
In-Reply-To: <20260311-ov2732-driver-v7-0-2e036d7b679e@schnwalter.eu>
To: linux-media@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Walter Werner Schneider <contact@schnwalter.eu>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773235863; l=3936;
 i=contact@schnwalter.eu; s=20251106; h=from:subject:message-id;
 bh=Nc8wI+h1xYC7JImOYtaea4+ehwlNl8vethAfXtZHc9Y=;
 b=28+lH5jT0u6BBaok0YOntqji+t8yO1XC3s+UvVJOXguuUdaiIKc5Mzbo0Q8qewnqQDg6smwG8
 GQVDt9+oJLxDKhIdB2pKEpOj7192cdxo3Mjz4h0/gSfQ0YqWWYavTli
X-Developer-Key: i=contact@schnwalter.eu; a=ed25519;
 pk=OoafUGtB7zQJLYhKA7ALCjqddXAaem/uP/eb3GGNkTI=
X-Rspamd-Queue-Id: A06722649BB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[schnwalter.eu,quarantine];
	R_DKIM_ALLOW(-0.20)[schnwalter.eu:s=fm2,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[schnwalter.eu:+,messagingengine.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55396-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[contact@schnwalter.eu,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.36:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[siliconsignals.io:email,devicetree.org:url,messagingengine.com:dkim,qualcomm.com:email,schnwalter.eu:dkim,schnwalter.eu:email,schnwalter.eu:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

Add bindings for OmniVision OV2732 image sensor.

Signed-off-by: Walter Werner Schneider <contact@schnwalter.eu>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/media/i2c/ovti,ov2732.yaml | 103 +++++++++++++++++++++
 MAINTAINERS                                        |   6 ++
 2 files changed, 109 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov2732.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov2732.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..814fc568c550af58540d92b7ffa427de2363fc7d
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov2732.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ovti,ov2732.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OmniVision OV2732 Image Sensor
+
+maintainers:
+  - Walter Werner Schneider <contact@schnwalter.eu>
+
+description:
+  The OmniVision OV2732 is a 2MP (1920x1080) color CMOS image sensor controlled
+  through an I2C-compatible SCCB bus.
+
+properties:
+  compatible:
+    const: ovti,ov2732
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: XVCLK clock
+
+  avdd-supply:
+    description: Analog Domain Power Supply
+
+  dovdd-supply:
+    description: I/O Domain Power Supply
+
+  dvdd-supply:
+    description: Digital Domain Power Supply
+
+  powerdown-gpios:
+    maxItems: 1
+    description: Reference to the GPIO connected to the pwdn pin. Active low.
+
+  reset-gpios:
+    maxItems: 1
+    description: Reference to the GPIO connected to the reset pin. Active low.
+
+  port:
+    description: MIPI CSI-2 transmitter port
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
+            items:
+              - const: 1
+              - const: 2
+
+        required:
+          - data-lanes
+          - link-frequencies
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - avdd-supply
+  - dovdd-supply
+  - dvdd-supply
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ov2732: camera@36 {
+            compatible = "ovti,ov2732";
+            reg = <0x36>;
+            clocks = <&ov2732_clk>;
+
+            avdd-supply = <&ov2732_avdd>;
+            dovdd-supply = <&ov2732_dovdd>;
+            dvdd-supply = <&ov2732_dvdd>;
+
+            powerdown-gpios = <&gpio0 13 GPIO_ACTIVE_LOW>;
+            reset-gpios = <&gpio0 8 GPIO_ACTIVE_LOW>;
+
+            port {
+                camera_out: endpoint {
+                  data-lanes = <1 2>;
+                  link-frequencies = /bits/ 64 <360000000>;
+                  remote-endpoint = <&mipi_in_camera>;
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 237397f18f07a792381c10faf0b0b62df53d4010..65c4675e529037a39e618f4f104e06460f3e055a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19545,6 +19545,12 @@ T:	git git://linuxtv.org/media.git
 F:	Documentation/devicetree/bindings/media/i2c/ovti,ov2685.yaml
 F:	drivers/media/i2c/ov2685.c
 
+OMNIVISION OV2732 SENSOR DRIVER
+M:	Walter Werner Schneider <contact@schnwalter.eu>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/ovti,ov2732.yaml
+
 OMNIVISION OV2735 SENSOR DRIVER
 M:	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
 M:	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>

-- 
2.53.0


