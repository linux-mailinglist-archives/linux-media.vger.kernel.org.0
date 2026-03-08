Return-Path: <linux-media+bounces-54862-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMdCA4MBrWlZxAEAu9opvQ
	(envelope-from <linux-media+bounces-54862-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 08 Mar 2026 05:56:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 709D522E864
	for <lists+linux-media@lfdr.de>; Sun, 08 Mar 2026 05:56:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6DDFF30379A7
	for <lists+linux-media@lfdr.de>; Sun,  8 Mar 2026 04:56:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53819314B63;
	Sun,  8 Mar 2026 04:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="nDNz76tF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701CD2DECA0
	for <linux-media@vger.kernel.org>; Sun,  8 Mar 2026 04:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772945769; cv=none; b=amhL8b8h1y9inUPoRuYC5n+P6L7DisBwm0Y5Mz2VR1HxuIxuf7J4Nnf4Cez6/XSICVZWfeHqyRVA4FLh5+FftJOkOjR7/5UprkV9f/pK/1VDC4mnHLEEXlljHHQIzb5otudmQU1vHL72cOskBsyBqKTMAnHujPQlLWaKs0fxcIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772945769; c=relaxed/simple;
	bh=NObbB3Y6tBf9KU6y9C3j6Huocw1YB2uVQ7daSqrG904=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Qf991aEvt85z68n01SdjBNuxr1WVXhcu2pmK0mrLd7senfnIgRw29006YePkMzmkrWi4gFJl1gy9D1kq5b6xtUR8yJ0d4Ie6NZqn3JcNvv80pLuj5G7MwZWqv4VSNAJ4zYXke1Whj86knCco0kDDz6npMxL1O599267MrIttqJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=nDNz76tF; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1772945765; x=1773204965;
	bh=TqRnUldtrdT4+71j90HrC5V1jmxVeZaQ0UFljkkxru8=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=nDNz76tF3h7i0VA9LHtyUUfimOZh4G7GLrqVV+jFnq7qH7Eo5TVvTbvoP4G12wAve
	 gs4EsJm0Qne3klATMTh4SGT1ss9V/fIdLnDWf9Qttv0+dLXb823dGD/O9/k1OufEuR
	 3wl6lpsq5dVDhE45OSlWlAGGX009fiFC+8LSgGDqWfNUmUaUyEUjLIKtXtqLqvZHpc
	 /QXmgryjfDqcZqwtnNWdiwlhpa3/n0StbxGW24M0Zx4BeZfpwXIYks18R4VL8Tje8E
	 bWK5sD1fJFR40GwiJyf3YAtFUfLyUElDZFsx0Ue5fdEaxNsLbTZP0PFeZiPGpFeTq5
	 nl0j183Y5YPAg==
Date: Sun, 08 Mar 2026 04:55:58 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
From: Alexander Koskovich <AKoskovich@pm.me>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH 0/2] ov8856: Add V4L2 device tree properties support
Message-ID: <20260307-ov8856-v4l2-props-v1-0-7677b4c658e4@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 6c0bedffffaee727e847def8804ed2b3e657ef79
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 709D522E864
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
	TAGGED_FROM(0.00)[bounces-54862-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[pm.me:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.971];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[AKoskovich@pm.me,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:dkim,pm.me:email,pm.me:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
Alexander Koskovich (2):
      media: dt-bindings: ovti,ov8856: Allow props from video-interface-dev=
ices
      media: i2c: ov8856: parse and register V4L2 device tree properties

 .../devicetree/bindings/media/i2c/ovti,ov8856.yaml     |  5 ++++-
 drivers/media/i2c/ov8856.c                             | 18 ++++++++++++++=
+++-
 2 files changed, 21 insertions(+), 2 deletions(-)
---
base-commit: 11439c4635edd669ae435eec308f4ab8a0804808
change-id: 20260307-ov8856-v4l2-props-def87d7854b1

Best regards,
--=20
Alexander Koskovich <akoskovich@pm.me>



