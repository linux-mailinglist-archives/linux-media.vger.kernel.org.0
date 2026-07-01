Return-Path: <linux-media+bounces-66165-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id i6cuHO7LRGpC1AoAu9opvQ
	(envelope-from <linux-media+bounces-66165-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 10:12:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F257F6EAFB7
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 10:12:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=imi+BWwE;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66165-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66165-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BEED93028618
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 08:12:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7BFB3A48D5;
	Wed,  1 Jul 2026 08:11:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD78F3DE429
	for <linux-media@vger.kernel.org>; Wed,  1 Jul 2026 08:11:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782893507; cv=none; b=cz1iMKzcKdtIkqyPzocCReZEty8vmAfeZLVtUsYBIkly96WOaE/UjzfOxc4HKGJJTGtKRsTphHfgSYbRPjBfQi2Y/NgqCaeBlv5hg1aTD8cehNHhcI1kIF+cV2v1uJtiuA5FSW6ZL7DtG0cl/a1fzYdqsXGNFOcQfcDotWBQbLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782893507; c=relaxed/simple;
	bh=Omg0L+jHBbqGMI96o5dDyfWiKFOGucuS11BRsHb78AY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=b+kUsk1O0p1pvI3Rdta9uPqZFsTFytHk60bR+oLJCK45ZveZOw+mWJ0lsL8d0nN/ol+AvyV1me/a2OpvICuBtI6IuqaAC8Z2Seo1pMN7Y53oOgXOUyzsGF+DpFGtkF8i99B3oZlMXij5dRxOBuN94FD5oLfRrABYFESChWiu6Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=imi+BWwE; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABD331F000E9;
	Wed,  1 Jul 2026 08:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782893500;
	bh=WlEwdExSQscV0bZdHceyNjPPwgBzkhKjWfPlGay8kTk=;
	h=From:Date:Subject:To:Cc;
	b=imi+BWwERdICHTVit1X/9ukI6lHydUWPgZah9XBGMvlbQa+cAzHD1gmaiQYZ/w4lr
	 6rUxdG0qgGtap0anNc/O+ozllDvFq/uwVXJbl3A/tSdeATmE+zdJRFvBRZ3WugMT0m
	 uw39gcq1quXDpCPh/2PL9zQoyEMLtCUtHEchjzPRQoGdlRonR1J4+KbQlEV3icHaUn
	 hXSaPQPu1KLA7EmLQMTWErPBDSQN7rdM9tEqyA6EvqFKw1cfgYG5BH7rBSEdS4mpZi
	 UUPwHyIiiCG3rk8C0YOY35gSXRZSa+1k2IH8nuCi2xU6abINTwXuxRFvgTgr8qbo/6
	 dOlcIeAjv2h4A==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 01 Jul 2026 10:11:20 +0200
Subject: [PATCH] media: v4l2-ctrls: document expected validation scope
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-v4l2-doc-v1-1-9cce64b7a1c2@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMyw5AMBCF4VeRWWsyrbtXEQvawYggLSIR765Yf
 sl/zgWOLJODMrjA0sGOl9lDhgHooZl7Emy8QaFKMUMpjnhSwixa6BRlkZgoN4jg89VSx+d3VdW
 /3d6OpLd3D/f9AI7RSA5sAAAA
X-Change-ID: 20260701-v4l2-doc-c60195d38d00
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Nayden Kanchev <nayden.kanchev@arm.com>, 
 Konstantin Babin <Konstantin.Babin@arm.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.15.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66165-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:laurent.pinchart@ideasonboard.com,m:vincenzo.frascino@arm.com,m:jacopo.mondi@ideasonboard.com,m:nayden.kanchev@arm.com,m:Konstantin.Babin@arm.com,m:dan.scally@ideasonboard.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linusw@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F257F6EAFB7

After discussion on the mailing list it became clear that these
validations are not expected to be exhaustive.

Link: https://lore.kernel.org/linux-media/20260629133209.GG3054459@killaraus.ideasonboard.com/
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
index b8698b85bd80..58184b6e386f 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
@@ -118,6 +118,18 @@ correct. This prevents the situation where only some of the controls
 were set/get. Only low-level errors (e. g. a failed i2c command) can
 still cause this situation.
 
+The validation of controls is not expected to be exhaustive, for example
+custom controls under ``V4L2_CTRL_CLASS_USER`` would become very voluminous.
+The expected behaviour is to reject settings that could:
+
+1. Pose stability issues, such as turning the hardware unresponsive requiring
+   a hard reset, such controls must be rejected.
+
+2. Pose security issues, such as compromising unrelated kernel-contained
+   data to userspace.
+
+Extended validation of control values should be performed in userspace.
+
 .. tabularcolumns:: |p{6.8cm}|p{4.0cm}|p{6.5cm}|
 
 .. c:type:: v4l2_ext_control

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260701-v4l2-doc-c60195d38d00

Best regards,
--  
Linus Walleij <linusw@kernel.org>


