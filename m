Return-Path: <linux-media+bounces-54535-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SG8EMLydqGmHwAAAu9opvQ
	(envelope-from <linux-media+bounces-54535-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 22:01:48 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 63713207C95
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 22:01:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5E702302C53A
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2026 21:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB1CA38C2CC;
	Wed,  4 Mar 2026 21:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="kXMJaybA"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C705638657A;
	Wed,  4 Mar 2026 21:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772658088; cv=none; b=Epk+4ejn/GLGOqhvTbnCgCYVJZPbvmCfQ9JK39kCBC5yM+gbruWRlsxAJ+UQXW1Ec/n/nUHg7761bWRuaY5cu7LKKj5nL+GM+s3h55QzV3WFWuXe6Cfp4542rbTLKGwJgrBgMpFB+oFvmNsVL6P9L2iGwCXzNo5Dz75Yxjf7DiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772658088; c=relaxed/simple;
	bh=a/HGKKp36P4xwIgVOjxXKaE5Sm+HcFjvPXuxNlLisNk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AgOQElGuvSh+UxJzYd2WbfM/3Lf03S/iUHmGpw0uA4vcMEWZzh/Hh7yDNFJJLkSCGra5NnGJ4F1CzkpMktnStnFFyftgtOv3sngz85rS8pie6M2q3yKBZr1Ln8UNHZG6kIrXR9Bhte3DRFN+M4ygEQNwymExfT4zabsPLP0F02k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=kXMJaybA; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772658083;
	bh=a/HGKKp36P4xwIgVOjxXKaE5Sm+HcFjvPXuxNlLisNk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kXMJaybAEGK07Gwif/cj2yrNWjboBQUlWFjrANuL0U+WCHbbaka75eAJCcJe3keeE
	 0IBEZPUaecdjQZIYxPqGmNXu+2dinO519xQyrz89pMHVr8MbFUh8s8l4N9L2i8EvC3
	 wjhwG2x5Mf0MOmzydHAvbj9VJ2PU05g6Kn8aW4sYSy6bWJveJrSBhvr6jQVPMfxYv4
	 +MvBsh961jLAW4hTI1E+dV7KzDK5+g/KxTOKcK7+9kQW0EY9/USv5HASeqT5xu2aFF
	 5sE4faByX/1jycDkpaNqTafGhTkf+laH3xDMD/yvScINK6vKInXQEenPdxYhsNfiI8
	 oOveZ5KKhKaIw==
Received: from localhost (unknown [86.123.23.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A683F17E108B;
	Wed,  4 Mar 2026 22:01:23 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 04 Mar 2026 23:00:41 +0200
Subject: [PATCH v5 2/4] media: dt-bindings: rockchip,vdec: Add alternative
 reg-names order for RK35{76,88}
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-vdec-reg-order-rk3576-v5-2-7006fad42c3a@collabora.com>
References: <20260304-vdec-reg-order-rk3576-v5-0-7006fad42c3a@collabora.com>
In-Reply-To: <20260304-vdec-reg-order-rk3576-v5-0-7006fad42c3a@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
 linux-media@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: 63713207C95
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54535-lists,linux-media=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian.ciocaltea@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,collabora.com:email,collabora.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Action: no action

With the introduction of the RK3588 SoC, and RK3576 afterwards, three
register blocks have been provided for the video decoder unit instead of
just one, which are further referenced in vendor's datasheet by 'link
table', 'function' and 'cache'.  The former is present at the top of the
listing, starting at video decoder unit base address.

However, while documenting RK3588, the binding broke the convention
expecting the unit address to indicate the start of the primary register
range, i.e. the 'function' block got listed before the 'link' one.

Since the binding changes have been already released and a fix would
bring up an ABI break, mark the current 'reg-names' ordering as
deprecated and introduce an alternative 'link,function,cache' listing
which follows the address-based ordering according to the TRM.

Additionally, drop the 'reg' description items as the order is not fixed
anymore, while the information they offer is not very relevant anyway.

It's worth noting there are currently no (known) users impacted by these
binding changes, since the video decoder support for the aforementioned
SoCs in mainline driver and devicetrees hasn't been released yet - it
landed in v7.0-rc1 while all DTS updates resulting from this will be
handled before v7.0 is out.

Fixes: c6ffb7e1fb90 ("media: dt-bindings: rockchip: Document RK3588 Video Decoder bindings")
Fixes: a5c4a6526476 ("media: dt-bindings: rockchip: Add RK3576 Video Decoder bindings")
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 .../devicetree/bindings/media/rockchip,vdec.yaml     | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
index dc4ebb50b316..42022401d0ff 100644
--- a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
@@ -28,16 +28,20 @@ properties:
 
   reg:
     minItems: 1
-    items:
-      - description: The function configuration registers base
-      - description: The link table configuration registers base
-      - description: The cache configuration registers base
+    maxItems: 3
 
   reg-names:
-    items:
-      - const: function
-      - const: link
-      - const: cache
+    oneOf:
+      - items:
+          - const: link
+          - const: function
+          - const: cache
+      - items:
+          - const: function
+          - const: link
+          - const: cache
+        deprecated: true
+        description: Use link,function,cache block order instead.
 
   interrupts:
     maxItems: 1

-- 
2.52.0


