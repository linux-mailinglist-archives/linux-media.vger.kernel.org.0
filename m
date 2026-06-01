Return-Path: <linux-media+bounces-63298-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yCIBI4GqHWq+cwkAu9opvQ
	(envelope-from <linux-media+bounces-63298-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 17:51:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3663B6220FF
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 17:51:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 160B8301954B
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 15:51:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2ECB3DB30E;
	Mon,  1 Jun 2026 15:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KxEUpnrP"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53AB33DA5A5;
	Mon,  1 Jun 2026 15:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780329074; cv=none; b=CZluvA1UdclCBLIl8Jqn3LlRy98irZqRFargKuKyjqvujqO/Gx+cftOGhOgIjgn90MUNf4LLHiI9TIN8rudymaEjoFUMvqB9Wg719dqOfbGr8T6P+Y3bHvu70yNu81lBgxVuyPx2L/r1VU7pZfJTKXybuu5x72JThWQlgv7AhaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780329074; c=relaxed/simple;
	bh=HHWTC+r+cyP3n7QXyqzBK7oC1U3IpIF2L7kzFKk7RQM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ky0jhPXhfQE3k0satvLPNNNlfuBg/fiENO+4ZFAU8Pq5+1I1C/Kz/WNCJVlmv50jT5tF5dVN4/aJwsUfSOg0FLBjqhcEXgRDBIGs+5KGBkqLvT8S3NabAhi9WOD7n63DPZY/p2nJItA7v34VF3QNCgc53fvMkvnfZEX4whic4Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KxEUpnrP; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43BC81F00893;
	Mon,  1 Jun 2026 15:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780329073;
	bh=5uAcEHbEKk6ioPO7d/CfxHr1XmEEHtQLx8OM2DUt0t0=;
	h=From:To:Cc:Subject:Date;
	b=KxEUpnrPHmgAcVfD5pYnrcWJkLT04x3zxEmUTfqzD0cHyPROz0XKn0oLyIqhfTjn5
	 JdrL7s/CgXRTMibaHiVNunBfB+R/XTPpJ7t1QAzibxcP1R4yI238yp4pDmlgAYFx/7
	 UpJo7Zv3xHCScIAEz64vpc2zMvRtGkR1ca1yKeeN2icfE0TRcnaA2tTHww15gDuQeC
	 eRz4ZOx/hcuPkFNLfVbqdMhUaSPdaQEXFZ87DnKE+yF5Qx3DbCfwcnSjnDWMmcL9JF
	 QJHWxc25HeAksq3peL+Pb8lcOo7/w3/J1jGv4ZwkIN4iUNpehhfJpi+zUA8PicSliB
	 dDTIdNgNKb5Ug==
From: bod@kernel.org
To: p.zabel@pengutronix.de,
	xavier.roumegue@oss.nxp.com,
	hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com
Cc: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bryan O'Donoghue <bod@kernel.org>
Subject: [PATCH 1/2] MAINTAINERS: Add myself to imx-pip as reviewer
Date: Mon,  1 Jun 2026 16:50:58 +0100
Message-ID: <20260601155059.1332290-1-bod@kernel.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63298-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[pengutronix.de,oss.nxp.com,xs4all.nl,ideasonboard.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 3663B6220FF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Bryan O'Donoghue <bod@kernel.org>

As discussed @ the media-summit in Nice this year I'd like to volunteer to
do some review on this driver, mostly as a learning exercise and because
more eyeballs equals hopefully less bugs. Mostly for the learning though.

Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index efbf808063e50..ec0743b41a463 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16027,6 +16027,7 @@ F:	include/uapi/linux/media.h
 
 MEDIA DRIVER FOR FREESCALE IMX PXP
 M:	Philipp Zabel <p.zabel@pengutronix.de>
+R:	Bryan O'Donoghue <bod@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
-- 
2.54.0


