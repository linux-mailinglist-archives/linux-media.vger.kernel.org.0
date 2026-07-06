Return-Path: <linux-media+bounces-66648-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PeqNCIoWS2ovLwEAu9opvQ
	(envelope-from <linux-media+bounces-66648-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 04:44:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 934D470C325
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 04:44:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=OIrdOyn+;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66648-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66648-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 08D58300CBD9
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2026 02:43:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96A903AA9D8;
	Mon,  6 Jul 2026 02:43:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0E13A8747;
	Mon,  6 Jul 2026 02:43:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783305811; cv=none; b=FZhlkcEDozHQlU1pGNnz/sja29hAUmRmmQEZ9rEcscUt7CcjcFOP4BWgXY2u8a0ftSJBiW3GCYWDohwEFnjvNAzUrmwTN+qYXFktvKr/qzvnMb8RboREhh74Z+ZzCmH4o+M/YoVuu9ooNIDHAETG/az2EAz35H62nd15C92Uti4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783305811; c=relaxed/simple;
	bh=RdHJ5I75Tcbgivqf+f/sQIrZyTTONH3eIvRriKAVuhk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aOLhJBmb3NUDdL5QCr+hl9QMkYH0q8CdqKqXk1by4IhRcILbBTo1TyZXtr9DI3wuVry5lH06Ii0/VQ6fRGEhtHzOGM+dADCOi/SlwD7A4pwQR4R4ml1YwAw/B3TKoDTdpXYqkV5OEOBPw0IS6owemIZy2DlxnWeA1sRgpx3AU9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OIrdOyn+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 93682C2BCF5;
	Mon,  6 Jul 2026 02:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783305810;
	bh=RdHJ5I75Tcbgivqf+f/sQIrZyTTONH3eIvRriKAVuhk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OIrdOyn++q3OekiH1zDQY4tqQ750ZnIn66/vXdQv8Re0k+xQFZA9VZc3w2FthjsXj
	 BeZBXZ5Uoc/tcFRnELL7ZbuqrEQrU+nC7+tgMzpP/21zpDace43pp9JX8FynOK5dCf
	 ya0h4dakRTpBTcO4ntA9CGvjxwTFWwkG2pTklBsRnrVR+NzevYoSOeHOjBsPdd/fWW
	 +mBQ9XhI8hROno7oc/IacKGYyhMQznEyFUQqhMBxdOjWpnhlnddtTn6PZ2H7PFRrJ5
	 yX+Gn87z80xe+Nfa7mv2eZr8cdrhl9NQC6b8vl648OkSQU7osNDEwSU5BnJlZp6Wpm
	 +u3hj/RpGwCFA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73FECC44500;
	Mon,  6 Jul 2026 02:43:30 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Mon, 06 Jul 2026 02:43:27 +0000
Subject: [PATCH 1/2] dt-bindings: media: meson6-ir: Add Amlogic A9 IR
 compatible
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-a9-ir-v1-1-4f082ca8aaf1@amlogic.com>
References: <20260706-a9-ir-v1-0-4f082ca8aaf1@amlogic.com>
In-Reply-To: <20260706-a9-ir-v1-0-4f082ca8aaf1@amlogic.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783305808; l=1001;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=zbm1gpme/ld1wK4sUZ5JpKgpU+xuYVReKQPeHKlYNSc=;
 b=HW66s1CZtmd6uNLpNkxRqmusfq/dDOVZlGpW/vZYF/lQfw1W9ziZFq4h6okqg13y93in2GZA3
 DStB+h1BUCKA2+Us+plj3yL28IDY8ygsKhsljLbuxRcyv2XfNe4+4V3
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66648-lists,linux-media=lfdr.de,xianwei.zhao.amlogic.com];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-amlogic@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:xianwei.zhao@amlogic.com,m:krzk@kernel.org,m:conor@kernel.org,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,baylibre.com,googlemail.com];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[xianwei.zhao@amlogic.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amlogic.com:replyto,amlogic.com:mid,amlogic.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 934D470C325

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Document the Amlogic A9 IR controller compatible string. The A9 IR
controller shares the same implementation as the Meson S4 IR block,
so add "amlogic,a9-ir" with "amlogic,meson-s4-ir" as the fallback
compatible.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml b/Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml
index 0f95fe8dd9ac..db9387e43eff 100644
--- a/Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml
+++ b/Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml
@@ -23,6 +23,10 @@ properties:
       - items:
           - const: amlogic,meson-gx-ir
           - const: amlogic,meson-gxbb-ir
+      - items:
+          - enum:
+              - amlogic,a9-ir
+          - const: amlogic,meson-s4-ir
 
   reg:
     maxItems: 1

-- 
2.52.0



