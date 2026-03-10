Return-Path: <linux-media+bounces-55032-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNbXN3Ocr2kTbAIAu9opvQ
	(envelope-from <linux-media+bounces-55032-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 05:22:11 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2352453A8
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 05:22:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0DDDC3034323
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 04:21:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2AE63C3BE5;
	Tue, 10 Mar 2026 04:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="XQHfZvRf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-244122.protonmail.ch (mail-244122.protonmail.ch [109.224.244.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAFDD27A462
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 04:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773116499; cv=none; b=IX6JnHsY6R0xmdpiE9XerNA6yaElic+Td58umquxRdkJvFTUFPED6qIDcewq3a3i37H5ddKfKoIJflX6aTd6wskjIk4Re9p+1LD0GQNoSDIt+ByJEPaIWFtQv8gCXkgA3ld667+9KCaqihKfMcsHVAiYzTRJXHx4cHjJfDRvdGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773116499; c=relaxed/simple;
	bh=ptChQJtr5D7SZfCHDeVzqNLC0C+XZLoykLQhbmdJCyQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Gp5zR/yXwQgl9Sgjs4nupeMAI+ZRW1mdOedm4L+2D+cEnm9scu/+N9RVjOS9JKyXOrCbWWx0M/X82tVl0II7yIG/gI1urjwRhm18DYiEpQKZb7EpUgY50DvFTjA1wJTBFElzKs8YzeWHa/T/4XD1KIXj4AqC+mFxMkXlm57VWsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=XQHfZvRf; arc=none smtp.client-ip=109.224.244.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1773116496; x=1773375696;
	bh=qj+jNA2G+n0/7Su1xuSsbRWs+nuupzTStBckacHK2as=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=XQHfZvRfycw0/svcqjADs3Lu35rsOd1C713h8+UzUfhFFTStypmPhcWY6a0WCVWer
	 VMJTkRqN+KWUQn1waaYkPpkAsIsVQ+/WKjD59/XMTNoquEOhh6+VPS+TAL8VFOy25j
	 L6MnYH2CjcrHVl046q7XBoDYG7ANcPl7Z2MKGGAITU+yKq/3ZW83XjcbB8Zd7wW5DP
	 IOQSX+9ZoXvKV4w5A3VEXvqBaZC5Tr7Ljs/mYKOG500FV+n5XFDP3jxhT2CR5hXcpi
	 s/GmPkpbykCb9VI9qXUQoYWqVmVVqt0mz/xq2KkxQLkCOWciE628iirCcTKUfsrRdN
	 g39RFkLMbIfHQ==
Date: Tue, 10 Mar 2026 04:21:31 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH v2 1/2] media: dt-bindings: ovti,ov8856: Allow orientation & rotation props
Message-ID: <20260310-ov8856-v4l2-props-v2-1-2717404ed045@pm.me>
In-Reply-To: <20260310-ov8856-v4l2-props-v2-0-2717404ed045@pm.me>
References: <20260310-ov8856-v4l2-props-v2-0-2717404ed045@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 89df57fe2620ab6b7de43c27dfd459b759380108
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 9A2352453A8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55032-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[pm.me:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:dkim,pm.me:email,pm.me:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

Allow the orientation and rotation properties from video-interface-devices
to be specified. The sensor can be front or rear facing and can be mounted
at any rotation.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 Documentation/devicetree/bindings/media/i2c/ovti,ov8856.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov8856.yaml b=
/Documentation/devicetree/bindings/media/i2c/ovti,ov8856.yaml
index fa71f24823f2..24d4161a293b 100644
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
@@ -57,6 +60,10 @@ properties:
       This corresponds to the hardware pin XSHUTDOWN which is physically
       active low.
=20
+  orientation: true
+
+  rotation: true
+
   port:
     $ref: /schemas/graph.yaml#/$defs/port-base
     additionalProperties: false

--=20
2.53.0



