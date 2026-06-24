Return-Path: <linux-media+bounces-65538-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ndWDC4XCO2pxcQgAu9opvQ
	(envelope-from <linux-media+bounces-65538-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 13:41:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B996BDBAA
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 13:41:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mess.org header.s=2020 header.b=hVl8Z8qV;
	dkim=pass header.d=mess.org header.s=2020 header.b=h3dATFmq;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65538-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65538-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=mess.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 26EB830D8FD1
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 11:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFCEB389105;
	Wed, 24 Jun 2026 11:39:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD41388E7A;
	Wed, 24 Jun 2026 11:39:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782301191; cv=none; b=NsLmag/JHdOGAfpUdsN/P9B5XyFOIc7OmdW04VGKLUernBWmVuOyCLyMuHzONR/tZuYR8l+yDV197EYnQIBnUEKwRKbXQcrXXXBqvyPPrOk11w4S4lmS/L1FYduEnZU9ewWXuH6Dy7G2TkW1TbjQD/XUNnFP4qt6E189EP4fFM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782301191; c=relaxed/simple;
	bh=JeiH2gsePdz8X68mAnrXbsQHM0IcoUyU3SvqsBLugxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oOPhLw2a2QdLuuIpjY94+RBn9kDgX9BZdbimlg5UDdXIxUGMCcyxIAJu6J+sJueDmdSSlAKvdrSiXLidUIXbYgLuVwU3HAi58/SWDcvz9JnN+foNO44bRj1jri6yaQ2fK5ILlYZ0gwFFPQYbYDuYpFJOEWtRZwIlfcdABKlq4i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=hVl8Z8qV; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=h3dATFmq; arc=none smtp.client-ip=92.243.27.206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1782301182; bh=JeiH2gsePdz8X68mAnrXbsQHM0IcoUyU3SvqsBLugxg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hVl8Z8qVf4FSVtDoMS9JBBn4hkVdGtESIW6EGn0zX5VXN3G9/QLYJGstp5ODru0g0
	 1shjt2sN2w8ezM39emVqKQ2Oj5Pd9BdZVtfjYAmBm6GWvI6D6UDXAenzyR4wDk9fo3
	 Mdf/oUVm6wdhc7D7TWE4dxsQT7kJPs/pHocWd8duzfOGMKlerPFGq+Qx7CL77+UIlz
	 WI9YNzvP5Lw6SOmfWqWbX2TBQgxmj8q+ncjxoP6lxOnLYpDOV+wE3/h4tyYa9ooba2
	 jK1uWWsF4ix9P76tGb4XNZze9F5U7EfgaDuvqf78Gykk8rLGyCQZIv/jpeUShn6HV1
	 xkA0dsZjyAFbA==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id 19DDA4253A; Wed, 24 Jun 2026 12:39:42 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1782301181; bh=JeiH2gsePdz8X68mAnrXbsQHM0IcoUyU3SvqsBLugxg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h3dATFmqMrhMFdbt6JrF5UB7TCmXqzqCx3DpKsYeqGnd4zWiqva12WiRYbeIO62yq
	 5RAAhzPHfOB5Zh66wwC+39GtzHYmjTzb4VSKUnSzRds/18CBIBZUtnQDMP86wTWmlJ
	 6PyEDJlIZbGuIPqRKVfgkvc5jmuAMLsKt/cWRoo5o1C3Uhdo44RfF5Rc5IgtMk5v2X
	 Ez1FKPeX+JSsnnN1Pkc3eh1ilwBlbCc8Rzg97EcWUPyLfhv6aKcRIn9ITRu78kiqFd
	 mexN/oI8R56ukVHxrnRfNVfg9IjJeNX2ViUyP4ZS9lq87KU4qRhynMVkD+HAwEYbRU
	 fd2DgEM62gZGQ==
Received: from maru.local (unknown [62.232.99.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id 9FE4F42528;
	Wed, 24 Jun 2026 12:39:41 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Young <sean@mess.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] media: dt-bindings: rc: Sync keymap list with latest list
Date: Wed, 24 Jun 2026 12:39:21 +0100
Message-ID: <2d87b050777b95ffe8adbdf156d2fb1de14c4dfb.1782300922.git.sean@mess.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1782300922.git.sean@mess.org>
References: <cover.1782300922.git.sean@mess.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[mess.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[mess.org:s=2020];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65538-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sean@mess.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sean@mess.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[sean@mess.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ALIAS_RESOLVED(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[mess.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mess.org:dkim,mess.org:email,mess.org:mid,mess.org:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 79B996BDBAA

The list is out of sync, so add missing entries, remove obsolete
entries and sort.

Signed-off-by: Sean Young <sean@mess.org>
---
 Documentation/devicetree/bindings/media/rc.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/rc.yaml b/Documentation/devicetree/bindings/media/rc.yaml
index dedc5a4b81ec..43d84296e70d 100644
--- a/Documentation/devicetree/bindings/media/rc.yaml
+++ b/Documentation/devicetree/bindings/media/rc.yaml
@@ -122,10 +122,10 @@ properties:
       - rc-proteus-2309
       - rc-purpletv
       - rc-pv951
-      - rc-rc5-tv
       - rc-rc6-mce
       - rc-real-audio-220-32-keys
       - rc-reddo
+      - rc-siemens-gigaset-rc20
       - rc-snapstream-firefly
       - rc-streamzap
       - rc-su3000
@@ -147,11 +147,11 @@ properties:
       - rc-tt-1500
       - rc-twinhan-dtv-cab-ci
       - rc-twinhan1027
+      - rc-vega-s9x
       - rc-videomate-k100
       - rc-videomate-s350
       - rc-videomate-tv-pvr
       - rc-videostrong-kii-pro
-      - rc-vega-s9x
       - rc-wetek-hub
       - rc-wetek-play2
       - rc-winfast
-- 
2.54.0


