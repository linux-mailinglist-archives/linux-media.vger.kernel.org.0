Return-Path: <linux-media+bounces-67161-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rr6MHFihT2pvlQIAu9opvQ
	(envelope-from <linux-media+bounces-67161-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 15:25:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E25277318CB
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 15:25:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=ALANPZ2x;
	dkim=pass header.d=suse.com header.s=susede1 header.b=ALANPZ2x;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67161-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67161-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A84C030DA771
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 13:21:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 579E2292B2E;
	Thu,  9 Jul 2026 13:21:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB19B280CF6
	for <linux-media@vger.kernel.org>; Thu,  9 Jul 2026 13:21:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783603291; cv=none; b=gZ4QFKQT0obY6WAih3fsg9HHb4tuSmn+CJGr0OJrEBney+ISc4IVZytrLam6hRCUj3eZs0ugMsLicWmi78D4HC65PChwMup0vGoBd2k4H9+rkF12rqapoQzUX/qdc3aQdxQ9bg5/dgb0DYHq2t72b8II/Rk1oQ12/BisPhfanJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783603291; c=relaxed/simple;
	bh=WtTBgcmnHtv1pAYHiul1Ga3BWXNSOwi/34J6VWd0MDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WGoIt9Xxzb/+JrMmNw995XP/rdzH+5iekKPEQqwBfzDepjVM2RRUIFQcfaqCpwB3r6ybPbuZutcIETjg7UDAbY6isDQbzEHi8AjzI9fBTVfA1e8B1wfpL3Oe+6+ODhlzzzoSj2x2pdh+uYVy0snTXdrVo0NEcIhbzIsEuEPR7dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=ALANPZ2x; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=ALANPZ2x; arc=none smtp.client-ip=195.135.223.131
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 16ED57606A;
	Thu,  9 Jul 2026 13:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1783603287; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HAgK9nE7znkT2mO8Waz8g6StkdgS+jWk6LKdL3vtKTU=;
	b=ALANPZ2xiuWMqbG7RmwAL0tdjojRfxrCyWXPX9WyA2V1VmB0jrg36Lj6P1mGwtVCI1HB2d
	wIzb5AJQockYbtpCf8N3THZDlhvFON4hZMu4d6Y1UMmkA3gAdHiJ+P1X3UNIRffHtuY6rP
	+NeyMDWfB4jiLM7vzGU8dL/UVLAhneQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1783603287; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HAgK9nE7znkT2mO8Waz8g6StkdgS+jWk6LKdL3vtKTU=;
	b=ALANPZ2xiuWMqbG7RmwAL0tdjojRfxrCyWXPX9WyA2V1VmB0jrg36Lj6P1mGwtVCI1HB2d
	wIzb5AJQockYbtpCf8N3THZDlhvFON4hZMu4d6Y1UMmkA3gAdHiJ+P1X3UNIRffHtuY6rP
	+NeyMDWfB4jiLM7vzGU8dL/UVLAhneQ=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E2C9A779AC;
	Thu,  9 Jul 2026 13:21:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ANtNNlagT2oTKgAAD6G6ig
	(envelope-from <oneukum@suse.com>); Thu, 09 Jul 2026 13:21:26 +0000
From: Oliver Neukum <oneukum@suse.com>
To: ezequiel@vanguardiasur.com.ar,
	mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [PATCH 2/2] media: stk1160: handle ESHUTDOWN gracefully
Date: Thu,  9 Jul 2026 15:21:24 +0200
Message-ID: <20260709132124.1453410-2-oneukum@suse.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260709132124.1453410-1-oneukum@suse.com>
References: <20260709132124.1453410-1-oneukum@suse.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67161-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ezequiel@vanguardiasur.com.ar,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:oneukum@suse.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oneukum@suse.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,suse.com:from_mime,suse.com:email,suse.com:mid,suse.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E25277318CB

Give it its own error message.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/media/usb/stk1160/stk1160-video.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/usb/stk1160/stk1160-video.c b/drivers/media/usb/stk1160/stk1160-video.c
index f4baf9263286..020b75fc5b2d 100644
--- a/drivers/media/usb/stk1160/stk1160-video.c
+++ b/drivers/media/usb/stk1160/stk1160-video.c
@@ -48,6 +48,9 @@ static inline void print_err_status(struct stk1160 *dev,
 	case -EILSEQ:
 		errmsg = "CRC/Timeout (could be anything)";
 		break;
+	case -ESHUTDOWN:
+		errmsg = "host controller removed";
+		break;
 	case -ETIME:
 		errmsg = "Device does not respond";
 		break;
-- 
2.54.0


