Return-Path: <linux-media+bounces-53329-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMmwE8Dpnmk/XwQAu9opvQ
	(envelope-from <linux-media+bounces-53329-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 13:23:28 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A46B71973AD
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 13:23:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C98B31001F3
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 12:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51E613AEF2F;
	Wed, 25 Feb 2026 12:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ikhbhifT"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DE63AE70C;
	Wed, 25 Feb 2026 12:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772022006; cv=none; b=Ts8Na/o0MBd27dvUwYknK6q9X/yItj6YmMJpPdCGOsjlAoRodMmgd8g6Mg4tXxf8vqX2QU4Ek+sgE5P0yf03zl7EtMqjsiKebUsmyBTjcS1AJqmQnYB44TkZgbxljQAsaYUF6Oa2MvouCyquglRnV7GXbHzwhohymRD3wdlueGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772022006; c=relaxed/simple;
	bh=5vb/63Vg1zh5nED3D61MNyCtaS3psPO98Y/6tkPDleU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hn7FJFh39DWu4Lc6ef5xssL3NqUmlu8mi7vuY4rfZANdV7jpj9l3ST4Z0S088Fi/vE2Va5HW/45gs8RJLp+psO/IEWDnOZxzbRBWA5QAHpxOSXl6yQ76RxeJjGWKfvzlK/wKctXSRP8Nl8FjF4j4lhV1ovFl44NEq3OACMSogfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ikhbhifT; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772022001;
	bh=5vb/63Vg1zh5nED3D61MNyCtaS3psPO98Y/6tkPDleU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ikhbhifTL9C/xEAfLs7iQbQPAdqG6wRoodYW1tBAHNtAoWWBL1JfXJJappgxqrsaM
	 Q2qfANnTW+rkaTH/LYWzl0+yT8R9We9IPPEigv97tmyWLYlMsbaaaZJ6QKetXMUNee
	 dWeWLbQsgV9BQdGZwnLXRvnYj2CVChAejRXV4/midgxe8f7v6AN1nr564flS9U63Sw
	 66GeMZYPFVliyqr43WN23NIe1rEY8cYiH8fwm9wTTLfUiZgdo6a8dQPyNqPpoZAlcL
	 +CXcxBxfOFjTX/ePdfPwnLMdoc9a9acuIjj64dSnkK3//jYUZVGOw4yLZnVoMF0UmA
	 ZmdAzOM3y/kcA==
Received: from localhost (unknown [86.123.23.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7E3DD17E04C4;
	Wed, 25 Feb 2026 13:20:01 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 25 Feb 2026 14:19:57 +0200
Subject: [PATCH v3 1/3] media: dt-bindings: rockchip,vdec: Add alternative
 reg-names order for RK35{76,88}
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-vdec-reg-order-rk3576-v3-1-5a2ebe1b11a8@collabora.com>
References: <20260225-vdec-reg-order-rk3576-v3-0-5a2ebe1b11a8@collabora.com>
In-Reply-To: <20260225-vdec-reg-order-rk3576-v3-0-5a2ebe1b11a8@collabora.com>
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
 linux-media@vger.kernel.org
X-Mailer: b4 0.14.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53329-lists,linux-media=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian.ciocaltea@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A46B71973AD
X-Rspamd-Action: no action

With the introduction of the RK3588 SoC, and RK3576 afterwards, the
'link' and 'cache' register blocks have been provided for the video
decoder unit in addition to the existing 'function' one, which now shows
up in between them (from address-based ordering point of view).

However, the binding does not properly describe this hardware layout, as
the new blocks are listed after the old one.  Therefore it breaks the
convention expecting the unit address to indicate the first register
range.

Since the binding changes have been already released and a fix would
bring up an ABI break, mark the current 'reg-names' listing as
deprecated and introduce an alternative 'link,function,cache' one.

Additionally, drop the 'reg' description items as the order is not fixed
anymore, while the information they offer is not very relevant anyway.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 .../devicetree/bindings/media/rockchip,vdec.yaml      | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
index 809fda45b3bd..3f6072e8baa5 100644
--- a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
@@ -28,16 +28,21 @@ properties:
 
   reg:
     minItems: 1
-    items:
-      - description: The function configuration registers base
-      - description: The link table configuration registers base
-      - description: The cache configuration registers base
+    maxItems: 3
 
   reg-names:
-    items:
+    oneOf:
       - const: function
-      - const: link
-      - const: cache
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


