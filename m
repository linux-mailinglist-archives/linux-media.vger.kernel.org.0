Return-Path: <linux-media+bounces-57592-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EAaDNKFOymmb7QUAu9opvQ
	(envelope-from <linux-media+bounces-57592-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 12:21:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9378235914B
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 12:21:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4BA2D309FC20
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 10:13:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BB643BAD91;
	Mon, 30 Mar 2026 10:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CxD6eS8d"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D573BED71;
	Mon, 30 Mar 2026 10:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774865516; cv=none; b=qy2ZE0kz+s/KpBmGoYtbnf80lfxs873cbESYHtjuefXIyZ2s3r7SkECvolEKqIlqgr1jhkCH8NSQsDXxspPSImUoqLstP0HxbWbJ9dhAFinGOvDW/gqLH+gWgY09XZVlyJFCIgOt4OFMWEpWme4uEQiFww5Qdr8W7SsiyXaxLuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774865516; c=relaxed/simple;
	bh=6VibEfDAOyJ/XX44ABuAxySDVtz6MUTLimWq8vsgG2I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aimJtcBK5crEcMup3YKJTHc5+UlnukUvmcG0ZleNOJOdeQ4Eg/NcU6CO2NAsjWsuL9G0LmVLE3/AgvrUs5a5/8/RzRC804rGuxO7olO0YUtpB+X2/QSJgRRjxJUKUvGuoX6uCriJLqS/V48kXowVrGCEI9TGGHJFNedVO1dXCgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CxD6eS8d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DD32C2BCB7;
	Mon, 30 Mar 2026 10:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774865516;
	bh=6VibEfDAOyJ/XX44ABuAxySDVtz6MUTLimWq8vsgG2I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CxD6eS8dLSI5fSuDPt9HIxzH6s027/A1HnNeldpnoEBXgJzRMkeIr+562ymzmYrJJ
	 42sKJjxz3AHoGe4apaOEbcJxxKFNd0Ok24ZIcslt/acboT3fi6R30tvoI/UDZU7mQg
	 EulGARPqdOuw/kbue1wapeLriOi64W4bb+VptFmcTnY42hjALaqVm4ESyIQbIZZ3Rt
	 QTUqwktOGlq4N6qyLOP1/Am//KemvQqMG4i39XT7g4TMSTXVps49TZvzxobdqj5An9
	 htdXeFx+w4TMOzP285Yr2K6Cx1HGxbpY7BkoyVpgw5QluibhnmwE3jG/8+QGXjIOq7
	 VJHnBbjcQRWrg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1w79b8-00000006yvm-1VZD;
	Mon, 30 Mar 2026 12:11:54 +0200
From: Johan Hovold <johan@kernel.org>
To: Hans Verkuil <hverkuil@kernel.org>,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 6/6] media: s2255: refactor endpoint lookup
Date: Mon, 30 Mar 2026 12:11:41 +0200
Message-ID: <20260330101141.1664143-7-johan@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260330101141.1664143-1-johan@kernel.org>
References: <20260330101141.1664143-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57592-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9378235914B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use the common USB helper for looking up bulk-in endpoints instead of
open coding.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/media/usb/s2255/s2255drv.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/media/usb/s2255/s2255drv.c b/drivers/media/usb/s2255/s2255drv.c
index 2c02873d09b5..0b8182edf8e4 100644
--- a/drivers/media/usb/s2255/s2255drv.c
+++ b/drivers/media/usb/s2255/s2255drv.c
@@ -2240,18 +2240,14 @@ static int s2255_probe(struct usb_interface *interface,
 	iface_desc = interface->cur_altsetting;
 	dev_dbg(&interface->dev, "num EP: %d\n",
 		iface_desc->desc.bNumEndpoints);
-	for (i = 0; i < iface_desc->desc.bNumEndpoints; ++i) {
-		endpoint = &iface_desc->endpoint[i].desc;
-		if (!dev->read_endpoint && usb_endpoint_is_bulk_in(endpoint)) {
-			/* we found the bulk in endpoint */
-			dev->read_endpoint = endpoint->bEndpointAddress;
-		}
-	}
 
-	if (!dev->read_endpoint) {
+	if (usb_find_bulk_in_endpoint(iface_desc, &endpoint)) {
 		dev_err(&interface->dev, "Could not find bulk-in endpoint\n");
 		goto errorEP;
 	}
+
+	dev->read_endpoint = endpoint->bEndpointAddress;
+
 	timer_setup(&dev->timer, s2255_timer, 0);
 	init_waitqueue_head(&dev->fw_data->wait_fw);
 	for (i = 0; i < MAX_CHANNELS; i++) {
-- 
2.52.0


