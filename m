Return-Path: <linux-media+bounces-65846-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +1IXM/4bQmqE0QkAu9opvQ
	(envelope-from <linux-media+bounces-65846-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 09:17:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0206D6E0B
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 09:17:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=mCpiZhwL;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65846-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65846-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B04F9303D5B9
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 06:59:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63EDB3B42CA;
	Mon, 29 Jun 2026 06:57:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E831E3B14CC
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 06:57:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782716244; cv=none; b=gklV4C88fkYxwKkrUDSdXLOX3Nf53zOpwHSHgaYHvbGRiBgZ3q9rPbFOZWq0ZEbK+oLmc9at+/AuDcU5fksxCB+s5eMKut1npBY0UiffAWyksrYZ/vFwUTwzX3lPZJv9oCWAQb7Eu7q0MS6X90+MMp/6XoyyMunEaJngJUUVRnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782716244; c=relaxed/simple;
	bh=L4ZIaSgSn18Dc0IV+/DWIwUIfNDMqPHM8QEcLI7XBRA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EQ+onrfr8OTBqWQGqxoTSWCgVfaZdCXqY/i532kYTNSyzMOI2qIkFv9xSsG7Dq2iq0rynT3kzQ4pIBTZEHEwDcjqxuxc6oCjoV5I+K2ruPHbPteDgc8WMY1gK4B4od29gJDb4yYkL91exzqMTHJViGpFi3OzBVR0EnGOoyzJd9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mCpiZhwL; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BC4B1F00A3A;
	Mon, 29 Jun 2026 06:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782716243;
	bh=1cJMhEtD9ziEuGYdgVypiXucfXHVoCTjbE+HJ3YnPJk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mCpiZhwLpacN/p0Dc375Y+eij4iIiiamBiWK/GeNbeXgGLxW8E4M7FlYQkVpYJ/bh
	 W5Mt5I2xcbHtCvvgEHj15WgrCCcQJQyutn1dKFKsrBG4gE+i/zQPdEFKOs6vsNLlCt
	 6H0y86JI7dVfUKQ6Mebjr81YLFIm5JvJtsTkqMB+lDDmr2/xKo6TMCOqcYbELr4hQP
	 GDsa1NsmcfAirKTB1QYXK168Ug+3W1IlspXtJjM8yqroofOBu/iUi3Y+xOEpjHiEaT
	 cyvj/l7+HF19fjfu51fvTSdGa1y4YxNGQ57k09E3zop+lFyBg6lmP8lTkcVL0Rl2Sk
	 Gx1kIfEm10MKA==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Mauricio Faria de Oliveira <mfo@igalia.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCHv3 5/6] media: em28xx: dev_info->pr_info since dev has been freed
Date: Mon, 29 Jun 2026 08:55:53 +0200
Message-ID: <6a8b16c4ba53cf18f2f175313ccbcb2c3aad786f.1782716154.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1782716154.git.hverkuil+cisco@kernel.org>
References: <cover.1782716154.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-65846-lists,linux-media=lfdr.de,cisco];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:mfo@igalia.com,m:sakari.ailus@linux.intel.com,m:hverkuil+cisco@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BE0206D6E0B

In em28xx_free_device() dev_info passed &dev->intf->dev,
but that device can be freed already.

Just use pr_info instead.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/usb/em28xx/em28xx-cards.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/em28xx/em28xx-cards.c b/drivers/media/usb/em28xx/em28xx-cards.c
index fbfb74eab475..4d1e48c86ce8 100644
--- a/drivers/media/usb/em28xx/em28xx-cards.c
+++ b/drivers/media/usb/em28xx/em28xx-cards.c
@@ -3758,7 +3758,7 @@ void em28xx_free_device(struct kref *ref)
 {
 	struct em28xx *dev = kref_to_dev(ref);
 
-	dev_info(&dev->intf->dev, "Freeing device\n");
+	pr_info("%s: Freeing device\n", dev->name);
 
 	if (!dev->disconnected)
 		em28xx_release_resources(dev);
-- 
2.53.0


