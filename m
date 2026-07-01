Return-Path: <linux-media+bounces-66195-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QuB5C6z4RGop4QoAu9opvQ
	(envelope-from <linux-media+bounces-66195-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 13:23:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 923AD6ECC23
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 13:23:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=AZeB5dk1;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66195-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66195-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9236330F73B2
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 11:10:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF6BC3EFD09;
	Wed,  1 Jul 2026 11:10:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5116243635E
	for <linux-media@vger.kernel.org>; Wed,  1 Jul 2026 11:10:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782904237; cv=none; b=Y+/RGDxenpdRpbIT6zrMtGAilF1jx4EY0LLfBRsmNOA1aXkI7dSoCfljI097UtJ3KQKwX/qfna+KGBfYz5NMVERMsB9KiBwt0oXwzUxZEQYtMgU8AbNbLYnbPMDQJ0McYxXBsiDvSpNNL9fM5aVgtOIEipg0ki+wc2vuubXr8BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782904237; c=relaxed/simple;
	bh=54Z8ebyMGwsiFggi8lyifa3oKewmpj4h2I/gwRMXjto=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=k1/oszUQ0NUgdMc4op/E372gQTtAZpQXimGC97q6jAqnMPwijun6cEHLW13E4TXd4GNQzWpMJie4tDzefwMQRKdluhSqRmeW4r5kIxfaNsH1IZJeY82olz6CV1ZaKCBZeasBjPkAMS2b0MgnDIplPI2Wz3ikknyY0ChLQofZgcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AZeB5dk1; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38F6B1F000E9;
	Wed,  1 Jul 2026 11:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782904236;
	bh=IENBa8vKx096O9q7fFWvahFHzaMPS+ANW+reWWzlZGs=;
	h=Date:From:Subject:To:Cc;
	b=AZeB5dk1iVugsp+xoQPz/wqpJfiWGHVXWSswF4kJhSRF8h4sj1NcCjhcP4Dd4LBvV
	 dTi0VHpLNlCGDbEdkO4adk4XUdlMyPvWzIJ1qpzZDU8X3PgangfwNhL/aRwS1+SrK0
	 8c3PlE5ytA5jK3K7Brr72ZYNa/WO3E256xB2vmH8c7J91bBhlSod6j4j5mqgVkdCt+
	 sZMTsfRGwo5QH9mdq/exzeGaMeUWvgnG10UlyfUelKf5LSj9HAKXCBxo6mO7Bo4JtE
	 c+mdwagiZpXWHVFme3GQ54rF3RnAo5bfjCAvXJkK4+lmef60Jy+ylIJRpYbEkGRISn
	 eIvWFrdVb4DCw==
Message-ID: <cee27768-b068-4dc6-81f6-426d6dc49aaa@kernel.org>
Date: Wed, 1 Jul 2026 13:10:33 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Content-Language: en-US, nl
Subject: [PATCH] Documentation: media: vidioc-g-ext-ctrls: clarify try/set
 behavior
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66195-lists,linux-media=lfdr.de,cisco];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:linusw@kernel.org,m:jacopo.mondi@ideasonboard.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 923AD6ECC23

It was not clearly stated in the documentation that calling
VIDIOC_S_EXT_CTRLS implies an internal VIDIOC_TRY_EXT_CTRLS
call.

Clarify this.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Acked-by: Linus Walleij <linusw@kernel.org>
Link: https://lore.kernel.org/linux-media/20260701-v4l2-doc-v1-1-9cce64b7a1c2@kernel.org/
---
 .../media/v4l/vidioc-g-ext-ctrls.rst              | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
index b8698b85bd80..d78328152b75 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
@@ -72,12 +72,6 @@ partial array, all elements have to be set or retrieved. The total size
 is calculated as ``elems`` * ``elem_size``. These values can be obtained
 by calling :ref:`VIDIOC_QUERY_EXT_CTRL <VIDIOC_QUERYCTRL>`.

-To change the value of a set of controls applications initialize the
-``id``, ``size``, ``reserved2`` and ``value/value64/string/ptr`` fields
-of each struct :c:type:`v4l2_ext_control` and call
-the :ref:`VIDIOC_S_EXT_CTRLS <VIDIOC_G_EXT_CTRLS>` ioctl. The controls will only be set if *all*
-control values are valid.
-
 To check if a set of controls have correct values applications
 initialize the ``id``, ``size``, ``reserved2`` and
 ``value/value64/string/ptr`` fields of each struct
@@ -86,6 +80,15 @@ initialize the ``id``, ``size``, ``reserved2`` and
 values are automatically adjusted to a valid value or if an error is
 returned.

+To change the value of a set of controls applications initialize the
+``id``, ``size``, ``reserved2`` and ``value/value64/string/ptr`` fields
+of each struct :c:type:`v4l2_ext_control` and call
+the :ref:`VIDIOC_S_EXT_CTRLS <VIDIOC_G_EXT_CTRLS>` ioctl.
+:ref:`VIDIOC_S_EXT_CTRLS <VIDIOC_G_EXT_CTRLS>` will implicitly call
+:ref:`VIDIOC_TRY_EXT_CTRLS <VIDIOC_G_EXT_CTRLS>` first and return an
+error if that fails. So the controls will only be set if *all*
+control values are valid.
+
 When the ``id`` or ``which`` is invalid drivers return an ``EINVAL`` error
 code. When the value is out of bounds drivers can choose to take the
 closest valid value or return an ``ERANGE`` error code, whatever seems more
-- 
2.53.0


