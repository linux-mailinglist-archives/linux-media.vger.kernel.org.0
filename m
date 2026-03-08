Return-Path: <linux-media+bounces-54863-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6E8yO5wBrWlZxAEAu9opvQ
	(envelope-from <linux-media+bounces-54863-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 08 Mar 2026 05:57:00 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4B222E87B
	for <lists+linux-media@lfdr.de>; Sun, 08 Mar 2026 05:57:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 16B263041A6C
	for <lists+linux-media@lfdr.de>; Sun,  8 Mar 2026 04:56:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 179DC314A8E;
	Sun,  8 Mar 2026 04:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="gcZwXq0K"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-244123.protonmail.ch (mail-244123.protonmail.ch [109.224.244.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A1D280CFB
	for <linux-media@vger.kernel.org>; Sun,  8 Mar 2026 04:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772945777; cv=none; b=c3iP9eCZ6VX+eqlfOp2md2OHfXjgwJcP7Ll+K+64AKzAnrdeQYNMEHpoALw3/pOJm+U15JUXJH37LNfHhf9y6tmE62C2RumStT/adbRTsp00y2RtV32oNiSx1aAyNYs7vvgFt8DkbLckeQveRtC1ZGp0Ya7qh4jJC1u8GYAXwp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772945777; c=relaxed/simple;
	bh=xrhR4w/P66G2lu8n0EXg28+qKKuFIIivWfsY+e2Iigk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dLack0oHyVLxfbKwV8Q3TGP2zswj19KN5AkoMmbxnHXurUDg48W15DvgTPvF3A12ak7WP7OjXVgsUEBzgdTGeo7CtVIA3G5hF9NHlr5sqkrsEFyGvgHKWYKNqy3m5WCIbWlBjizyRM2q7TYiOrWgV/Y5qFRprzYHfS/A+bpylEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=gcZwXq0K; arc=none smtp.client-ip=109.224.244.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1772945768; x=1773204968;
	bh=hNbq6p+FybAuD3Jad3kad86ZswQ4KYlevL1/2Li+U4s=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=gcZwXq0K7ygN/kAWZNyeAGQJCVkjdG1CBCqZ4PbzcE4z/AS0wWnEkMdAgGcusx5p0
	 Z5SIyYTEvwt/bEXuzYJLmjI4yUp3yRO67KBQGP9F90jY3m4ya5tFxQg199fL2v6LRV
	 /Z2uv0sy234wXYJTKlR3TunRu8L1IiSQacAVeXA6MjJCfjJApv9bMtIlrUHg0WjOTi
	 3IAOhHvWpC2czHLjcDkeT/MsGBsCcHk0FMAbvrLtGjAKhUmiKE1dEygsCcjQwNdP02
	 gDqneW25PtoSCv457mZ3MzticWm97UQSlCpUn+Onlxm8lUfOr23Uyfjo9O6hF35YGJ
	 y5FBGXxuTLtJg==
Date: Sun, 08 Mar 2026 04:56:04 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
From: Alexander Koskovich <AKoskovich@pm.me>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH 1/2] media: dt-bindings: ovti,ov8856: Allow props from video-interface-devices
Message-ID: <20260307-ov8856-v4l2-props-v1-1-7677b4c658e4@pm.me>
In-Reply-To: <20260307-ov8856-v4l2-props-v1-0-7677b4c658e4@pm.me>
References: <20260307-ov8856-v4l2-props-v1-0-7677b4c658e4@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 79adcdbba321a8713dd64d33301de3d1760c00ba
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 9A4B222E87B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54863-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[pm.me:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.965];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[AKoskovich@pm.me,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:dkim,pm.me:email,pm.me:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

There is no reason to restrict the allowed rotation degrees to 0 and 180,
as the sensor can be mounted with any rotation.

Also, as all the properties described by video-interface-devices.yaml are
allowed for the image sensor, make them accepted by changing
additionalProperties: false" to "unevaluatedProperties: false" at the
schema top-level.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 Documentation/devicetree/bindings/media/i2c/ovti,ov8856.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov8856.yaml b=
/Documentation/devicetree/bindings/media/i2c/ovti,ov8856.yaml
index fa71f24823f2..73a9d3288897 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov8856.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov8856.yaml
@@ -18,6 +18,9 @@ description: |-
   through I2C and two-wire SCCB. The sensor output is available via CSI-2
   serial data output (up to 4-lane).
=20
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
 properties:
   compatible:
     const: ovti,ov8856
@@ -94,7 +97,7 @@ required:
   - reset-gpios
   - port
=20
-additionalProperties: false
+unevaluatedProperties: false
=20
 examples:
   - |

--=20
2.53.0



