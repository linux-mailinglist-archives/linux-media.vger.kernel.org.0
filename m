Return-Path: <linux-media+bounces-30840-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE80A9953A
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 18:34:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B9661602A1
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 16:33:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06B67280CD1;
	Wed, 23 Apr 2025 16:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="QNkugQ3U";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="alwILsjM"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7993A28369C;
	Wed, 23 Apr 2025 16:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745426015; cv=none; b=UHHhIUENWXrUH2juAqBidR4Ru+zBDM2PLKUxB+5dU/8AjaHaJ+B0Xb/K6bx88pJh8QAXUPoVEtLkwxD2Pqpmq1Q6VAjjKpysdP1T5ArsVCMgpCLYgFOvQlrWZ0yaUzJUwkICFSrkQQrXusjGed250/u99Y79NlrM3m3mIMz8kcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745426015; c=relaxed/simple;
	bh=vmopJahMxNrRlIiKaboDwYXysOBR1Y9N4Tj36E6mpUk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JcJ4lisLpfFcxA0DH2Dhxoob+pKWZnMACz1CLmtsHX2vhdPTTqPJRFDlbdYg+rEd4+qnu6s4/ynjtFNc/okav7tabM9m0SGfw8LQ+1RmlEwu9Ds7ct0CNvGe8GNzmMIl2npnzLMIkr1QCRvK9P0OZ793Ek3VjaofQX5m+SAxfTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=QNkugQ3U; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=alwILsjM; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 6CAEE13801DD;
	Wed, 23 Apr 2025 12:33:31 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Wed, 23 Apr 2025 12:33:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1745426011;
	 x=1745512411; bh=C4WJ6gjZMFsa1R/qLbsrhYT+OAjRhh+GvmkJTNQTqD8=; b=
	QNkugQ3UZrv50LzIGKpFwsuas4Zw55MX5Z/aHbhJwnalmFAXNsBm8cWHWtVtZoju
	Gq+JmLZ3+z2JDBB2fe1gB2uQCR4Rt+tAMePy8RC4WFCmJtoOsZVC3iinR6k7DMkF
	eB1yXfk4KtvfK77qibiBdVpOkhZ3astL/q4uRzbMQKVMXRCabmNRfT/ebtYCvzxo
	iBDvP5Tej57HZx0/2f9MS+66OOdFTtUiFHjmv/GArmeQeRp5f0QfhVK2dHKkSK+v
	KEHehARmi8Un0G/7G8NkrRl27g10us/yOqgSu62aX4dZMz6qGB1uP8JLzo4ss8p6
	AqS/bqMLTx9onVw74M/XBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1745426011; x=
	1745512411; bh=C4WJ6gjZMFsa1R/qLbsrhYT+OAjRhh+GvmkJTNQTqD8=; b=a
	lwILsjMGmJwgKPTFUpMY0UrTDcBJpljOM8engTTsS83A08lCuhctEZ03Rqq7tdq2
	1iNl0s+/CxJp+7GlfIE/gLo8dTa7rURdAwsLC/GhaNm1s62uU2IKDKEcEzCvcpXb
	RED7q4yqV0ZNi1scwoS0IEy8lcuNqgEY4rftjIDtQreEiK8STWHrD+jRMIv6TmxL
	Ms+AtfGLQZkA4e2NCnzHxedKLu5GlnzWSBo715TyOsfBINdDQ1gZICEuKJE7bGw1
	Yp2lbPqxYULye+CidbgT0QEQuwusRsjJtzIQcZGay414Pg9y1gKCgMuwRzatv2rV
	zvMI8XR16KQLtdL7ScJow==
X-ME-Sender: <xms:WxYJaJDdNCOzK6eAMqKvfn8yW5183MV1eY_6Kl9U7zqy9_AL_2YWxQ>
    <xme:WxYJaHjSR-UPky40L5Cnw1NHR1J0C6jVNHNQrhUk4I0oFi0M7cE_mtZdBZTkI5Ehe
    GnmsKUxPC0HtThucO4>
X-ME-Received: <xmr:WxYJaEnFrDSpqGHcTq8TBNWiwgEFvxe5w8fopYdpTytQZfC5Gcq5ey6su1Eiigj-8c23WHOtyDewQDBt3ntywrvk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeejtdekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertder
    tdejnecuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrsh
    houggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffr
    rghtthgvrhhnpeehiefgueevuedtfefhheegkeevtdelueeukeevfeduhefhhfejfffgge
    ffleefgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprh
    gtphhtthhopedugedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhgthhgvhhgr
    sgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegt
    ohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghgvvghrthdorhgvnh
    gvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopehhvhgvrhhkuhhilhesgihsgegr
    lhhlrdhnlhdprhgtphhtthhopehsrghkrghrihdrrghilhhusheslhhinhhugidrihhnth
    gvlhdrtghomhdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrthesihguvggr
    shhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepjhgrtghophhordhmohhnughisehiug
    gvrghsohhnsghorghrugdrtghomh
X-ME-Proxy: <xmx:WxYJaDwC_xiLDr5m9jYXirnOO6RcGIj3z5Nz7Py1o2JI_lRTzWrVrg>
    <xmx:WxYJaOSfKRQDhXXRQTcNJnSZ65KDVhAc8F313dUvYPJ4n6v7t5M5aQ>
    <xmx:WxYJaGaIdppVZRgpRARyqNOsEGIAyZdfPCcvkT3vlqT-GRrb2A5lEw>
    <xmx:WxYJaPRIqefJF_0376BSdegiOEMvLnbh_2hD4JeDVMF_hQvfRRGI4w>
    <xmx:WxYJaK1XGbpPe0PQy99XliXtyGXBPK9ZAEba1IzMqrtJU5XeKIE9d7Nj>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Apr 2025 12:33:30 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v3 1/7] dt-bindings: media: renesas,isp: Add ISP core function block
Date: Wed, 23 Apr 2025 18:31:07 +0200
Message-ID: <20250423163113.2961049-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250423163113.2961049-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250423163113.2961049-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some R-Car ISP instances have in addition to the channel selector (CS)
an ISP core (CORE) to perform operations on an image stream. The core
function is mapped to a different memory region and has a separate
interrupt than CS, extend the bindings to allow describing this.

On the same SoC different instances of the ISP IP may have, or not have,
the CORE functionality. The CS function on all instances on the SoC are
the same and the documentation describes the full ISP (CS + CORE) as a
single IP block. Where instances not having the CORE function simply
lack the functionality to modify the image data. There are dependencies
on the CS functionality while operating the CORE functionality.

In order for the ISP core to function in memory-to-memory mode it needs
to be feed input data from a Streaming Bridge interface. This interface
is provided thru the VSP-X device. Add an optional new property
"renesas,vspx" to provide a phandle to describe this relationship.

While adding mandatory reg-names and interrupt-names breaks existing
bindings the driver itself remains backward compatible and provides CS
functionality if a single unnamed reg and interrupt property is present.
Furthermore all existing users of the bindings are updated in following
work to add these new mandatory properties.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
* Changes since v2
- Fix spelling in commit message.
- Fix the core reg size in the example.

* Changes since v1
- Extend the commit message to make it explicit that different ISP
  instances on the same SoC (same compatible value) can have, or not
  have, a CORE function block attached.
- Update documentation for renesas,vspx property.
- Update example to cover all new properties.
---
 .../bindings/media/renesas,isp.yaml           | 63 ++++++++++++++++---
 1 file changed, 55 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/renesas,isp.yaml b/Documentation/devicetree/bindings/media/renesas,isp.yaml
index c4de4555b753..d25e020f5e5e 100644
--- a/Documentation/devicetree/bindings/media/renesas,isp.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,isp.yaml
@@ -25,19 +25,55 @@ properties:
           - renesas,r8a779h0-isp # V4M
       - const: renesas,rcar-gen4-isp # Generic R-Car Gen4
   reg:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
+
+  reg-names:
+    minItems: 1
+    items:
+      - const: cs
+      - const: core
 
   interrupts:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
+
+  interrupt-names:
+    minItems: 1
+    items:
+      - const: cs
+      - const: core
 
   clocks:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: cs
+      - const: core
 
   power-domains:
     maxItems: 1
 
   resets:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
+
+  reset-names:
+    minItems: 1
+    items:
+      - const: cs
+      - const: core
+
+  renesas,vspx:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      A phandle to the companion VSPX responsible for the Streaming Bridge
+      functionality. The Streaming Bridge is responsible for feeding image
+      and configuration data to the ISP when operating in memory-to-memory
+      mode.
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
@@ -103,10 +139,14 @@ properties:
 required:
   - compatible
   - reg
+  - reg-names
   - interrupts
+  - interrupt-names
   - clocks
+  - clock-names
   - power-domains
   - resets
+  - reset-names
   - ports
 
 additionalProperties: false
@@ -119,11 +159,18 @@ examples:
 
     isp1: isp@fed20000 {
             compatible = "renesas,r8a779a0-isp", "renesas,rcar-gen4-isp";
-            reg = <0xfed20000 0x10000>;
-            interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
-            clocks = <&cpg CPG_MOD 613>;
+            reg = <0xfed20000 0x10000>, <0xfee00000 0x100000>;
+            reg-names = "cs", "core";
+            interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "cs", "core";
+            clocks = <&cpg CPG_MOD 613>, <&cpg CPG_MOD 17>;
+            clock-names = "cs", "core";
             power-domains = <&sysc R8A779A0_PD_A3ISP01>;
-            resets = <&cpg 613>;
+            resets = <&cpg 613>, <&cpg 17>;
+            reset-names = "cs", "core";
+
+            renesas,vspx = <&vspx1>;
 
             ports {
                     #address-cells = <1>;
-- 
2.49.0


