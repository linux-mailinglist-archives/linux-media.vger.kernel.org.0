Return-Path: <linux-media+bounces-28293-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A14A62F1F
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 16:28:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 233A6189A419
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 15:28:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41CC5204692;
	Sat, 15 Mar 2025 15:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="MlWrJ/HQ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="SnP43BYr"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A790204598;
	Sat, 15 Mar 2025 15:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742052512; cv=none; b=pjdAwFNk/wytQ+DM0j4CApaTBWFiCazDgIgI4aOdRcp/7iYXEoulGVjREhSlFCmws+9ENRgMmvK4w6hMYBEKXbd23MSf/OIMICIzy71nJBaD6rE/j9votjqm+IiOL+umzvR65zjFgy3hYltht8TKZHmTNxUF8XP7xMlFcpyRwHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742052512; c=relaxed/simple;
	bh=EOOwImixY/OJZhvsUI26qv3Mt0nFrn1omfuvG4pLAP0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VNPXmwUCakGaPy4YRGqRM1LDybkVV+VMlcW7cp3OpUKxs74O1b76wSiJlISw45c02Im9lTd01+dtZBzdxJVQ2QgwIW3dOp2LFEsgysD+cQyUtVpGfmi6MZtkataGXoDiqp6NrSHlf9vmTwUnOixdNkkyocbAu3ShhL5Lqeoizpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=MlWrJ/HQ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=SnP43BYr; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id C56CD114013C;
	Sat, 15 Mar 2025 11:28:28 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Sat, 15 Mar 2025 11:28:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1742052508;
	 x=1742138908; bh=7VleYlkj9yhIrJRgP9K/bBzxUD/q3/HCfKjDUi6utYc=; b=
	MlWrJ/HQbzz8AM47cz+3/4Z7+8woUOpGTFQ+LaMI+PxXCREfPEWwtZ7c/BDygJRs
	NTymxy+UtqqAv9zNG3QPpv2hJPnbVOPg6GhUvB/YJJ1b8W4surJ1ry9ob7Wq6nRE
	77/suD64ICYpeE1OLqSjAcqAwIroc75i/+dnstWtVA6l97RiV5mrkdJ9evnt7abY
	EWsFCJABRwP0SdekWup+P7Wfuy22QB43hgFiv8pflWPagfzkO0gj8GARxtgJYqxh
	kZ3vyX2v2/Pg6tY6/9lUnFCscM8Z8pMh1QOfiFAR4wlH8anWfo8vIGtWghp1iRCs
	HjtWjpDf10rV+WBgM04gBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742052508; x=
	1742138908; bh=7VleYlkj9yhIrJRgP9K/bBzxUD/q3/HCfKjDUi6utYc=; b=S
	nP43BYrmvGuwZbDdRN8+cq9TwiFSuWg5EolvoFognt+nCSCaMkBCSu16cgpyJ4lo
	a9xLW1szgsUnnQzsMmJ2/Yem3loreXMAMtn+27OiXPhamb2gJNor8jzbW0lYIeY1
	+OKUiEXBkj0uRIKS9ssAmLt8RaEMru4k/D90fF1rh3R159D4ptMxS05d+rUf6hyq
	nSRi//W0tEBGhWSS0QthFCna5Dy4KQS0r8Dtfvu9e9aqdLKbQddHAr46CIvyZgbf
	lJdYet4py+C16n9jGfL5u3324OiKwGhi9EciTkY9v3bXKR3yi49NiSOSZhjeenwf
	/Ev2Gh2vm+oC3n312Tamw==
X-ME-Sender: <xms:m5zVZ_nT0Lh9kEYf0RFRcJUu8lut4SyUt4WBQfe3vclu_ADvVAh8xA>
    <xme:m5zVZy0T3u5AgPyfBD9iGn0wU6vcsRy5RlZs2BhtNgVpJHwc0dW1XkTcVGF0MzWzI
    -KkLw20lDYhJZfd8Xw>
X-ME-Received: <xmr:m5zVZ1rwpORnxqhaEOmBTPCvdX6vkKhiVwdtJ9hC_8YDdG1f6y4qrX3xWDP4bdWmZ2SEZ1Sk0qM-uyPhtki90ipJ6g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufeegtdelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertder
    tdejnecuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrsh
    houggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffr
    rghtthgvrhhnpeehiefgueevuedtfefhheegkeevtdelueeukeevfeduhefhhfejfffgge
    ffleefgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprh
    gtphhtthhopedufedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhgthhgvhhgr
    sgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegt
    ohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghgvvghrthdorhgvnh
    gvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopehhvhgvrhhkuhhilhesgihsgegr
    lhhlrdhnlhdprhgtphhtthhopehsrghkrghrihdrrghilhhusheslhhinhhugidrihhnth
    gvlhdrtghomhdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrthesihguvggr
    shhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepjhgrtghophhordhmohhnughisehiug
    gvrghsohhnsghorghrugdrtghomh
X-ME-Proxy: <xmx:m5zVZ3meBm5sLR6thEXnQkzT6QufIbcrOUKQk4CtzuWG1ddBVyL3pQ>
    <xmx:m5zVZ93zAQ3Eb7GHKH7Uf-pAPxcx1LlYxzW67grrK7QBSSB3n9vqqw>
    <xmx:m5zVZ2v_j0FXq8Ov85dr0ym1Zn-T2UBKPQPhww7lag3509TZJj5PFA>
    <xmx:m5zVZxV0C_2MGyldFZNV46y1QtYy0MhXxTqtZo-YtCJLRjkJrsKkng>
    <xmx:nJzVZ80AvsvjQ5k5PIu_aCnNzWJTl4fH0SrV65y8vs0sCky1WfeYWvxv>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 15 Mar 2025 11:28:27 -0400 (EDT)
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
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/7] dt-bindings: media: renesas,isp: Add ISP core function block
Date: Sat, 15 Mar 2025 16:27:02 +0100
Message-ID: <20250315152708.328036-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250315152708.328036-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250315152708.328036-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some R-Car ISP instances have in addition to the channel selector (CS)
an ISP core to perform operations on an image stream. The core function
is mapped to a different memory region and have a separate interrupt
that CS, extend the bindings to allow describing this.

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
---
 .../bindings/media/renesas,isp.yaml           | 56 +++++++++++++++++--
 1 file changed, 50 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/renesas,isp.yaml b/Documentation/devicetree/bindings/media/renesas,isp.yaml
index c4de4555b753..de9bc739e084 100644
--- a/Documentation/devicetree/bindings/media/renesas,isp.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,isp.yaml
@@ -25,19 +25,54 @@ properties:
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
+      functionality. This property is not mandatory and not all ISP devices
+      have one attached.
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
@@ -103,10 +138,14 @@ properties:
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
@@ -119,11 +158,16 @@ examples:
 
     isp1: isp@fed20000 {
             compatible = "renesas,r8a779a0-isp", "renesas,rcar-gen4-isp";
-            reg = <0xfed20000 0x10000>;
-            interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
+            reg = <0xfed20000 0x10000>, <0xfee00000 0x10000>;
+            reg-names = "cs", "core";
+            interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "cs", "core";
             clocks = <&cpg CPG_MOD 613>;
+            clock-names = "cs";
             power-domains = <&sysc R8A779A0_PD_A3ISP01>;
             resets = <&cpg 613>;
+            reset-names = "cs";
 
             ports {
                     #address-cells = <1>;
-- 
2.48.1


