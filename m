Return-Path: <linux-media+bounces-67353-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SS9+ErBMUmoBOQMAu9opvQ
	(envelope-from <linux-media+bounces-67353-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 11 Jul 2026 16:01:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A44CA741BCF
	for <lists+linux-media@lfdr.de>; Sat, 11 Jul 2026 16:01:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=VxoTKKnQ;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67353-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67353-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 07593301725E
	for <lists+linux-media@lfdr.de>; Sat, 11 Jul 2026 14:00:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24F752D7DF1;
	Sat, 11 Jul 2026 14:00:14 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CE4246778;
	Sat, 11 Jul 2026 14:00:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783778411; cv=none; b=anRk0cBp8By6+CVIXAmuf4VyyGCZUtWobp+/oseOAcD/HW+BgtKlnFBwEHVvn3sVf15/vQXtkInQ3g95QsMSbkgWeGX4pCbbJ5v8cFSFQaFo8mnJIEVcUPP0hokr3nLg4YlR5BiHWs2xiK6MLSMnK0DdYwq3VFQBqdHgk5eDJvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783778411; c=relaxed/simple;
	bh=Cc3iXIe7vA6bWvZE/goaLJXnEVxUk1J4/yD+9CVPv6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k+YGxx3BdBCEfS/OKJ1rcK+hK6eLh0lvPptVFk+eJGv1++hkkdNcm6HQ0rXhoO1UweAn1rtY12gYmtolaUDZwYDBEbEkRkvYHlOWnocoX65e6aBNRfPOdAV6cWU0TVQlIXsOZpIbGuN9JPWap2H4r1IMUq9LxfL0QU1cJvQAbM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VxoTKKnQ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 427D41F000E9;
	Sat, 11 Jul 2026 14:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783778409;
	bh=4OuezE/moo5Tppqmye8t2PqCkPAk1kmw20Fa1p80Uak=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VxoTKKnQlVJcRhtm2Y+EIAozs1G5BEK9wTFm6xPfRXoQ6y3tXHpdw1DTbn7UQANLH
	 DnAOumu//hcPPhlJvcme/qgoh8yhuaPVRxc3lbm+EzAX129HxWPNtiqirqRVFQVLER
	 56e/9iTBSS5cu0WIjKLCnxEj/ghe8NUN3mja882bBZeGt/Phv/gy1ORHnE5CjKJ+dF
	 U+EMQyD7HbXFc3Aq2BcaLqi82cLx+zxxqXCLclDf8+IJeZk9dEMRwujbDzL4XSHxPQ
	 sfWWw6Qspf0+34ZclkRaWc7eSiE03VknPmvSyKWlafemSMXOojLy08CO5cpHdSyp/z
	 6QZMyNjfTYB6A==
Received: by wens.tw (Postfix, from userid 1000)
	id 545C65FDF3; Sat, 11 Jul 2026 22:00:06 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 2/7] dt-bindings: media: sun4i-a10-video-engine: Fix SRAM count for H6
Date: Sat, 11 Jul 2026 21:59:53 +0800
Message-ID: <20260711135959.3616919-3-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260711135959.3616919-1-wens@kernel.org>
References: <20260711135959.3616919-1-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67353-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,lists.linux.dev,lists.infradead.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[wens@kernel.org,linux-media@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mripard@kernel.org,m:paulk@sys-base.io,m:mchehab@kernel.org,m:wens@kernel.org,m:jernej@kernel.org,m:samuel@sholland.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:gregkh@linuxfoundation.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:jernej.skrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wens@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A44CA741BCF

On the H6, the SRAM C region includes an alias of part of the VE SRAM
used by the video engine. This region should also be claimed so that no
access happens through the alias window.

Add a second SRAM region phandle to the video engine for the H6.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 .../allwinner,sun4i-a10-video-engine.yaml     | 21 ++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
index 932043d7f0cc..818d815d4732 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
@@ -48,11 +48,15 @@ properties:
 
   allwinner,sram:
     $ref: /schemas/types.yaml#/definitions/phandle-array
+    minItems: 1
     items:
       - items:
           - description: phandle to SRAM
           - description: register value for device
-    description: Phandle to the device SRAM
+      - items:
+          - description: phandle to SRAM alias
+          - description: register value for device
+    description: Phandle to the device SRAM(s)
 
   iommus:
     minItems: 1
@@ -101,6 +105,21 @@ allOf:
         iommus:
           maxItems: 1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - allwinner,sun50i-h6-video-engine
+    then:
+      properties:
+        allwinner,sram:
+          minItems: 2
+    else:
+      properties:
+        allwinner,sram:
+          maxItems: 1
+
 additionalProperties: false
 
 examples:
-- 
2.47.3


