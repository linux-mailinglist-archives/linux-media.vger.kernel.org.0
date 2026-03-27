Return-Path: <linux-media+bounces-57218-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBV6BSpjxmm+JAUAu9opvQ
	(envelope-from <linux-media+bounces-57218-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 11:59:54 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D6A343017
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 11:59:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 14C563084468
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 10:44:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 006EF3DDDB1;
	Fri, 27 Mar 2026 10:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AQPa98aY"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0B03CB2EF;
	Fri, 27 Mar 2026 10:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774608271; cv=none; b=JrJeA8ttJWHLCNKf8LWA0RNV3c1bgOs1aw92ezQ611nr/l8XaB0DS/3ZyBvZKyQg0pIMMz/qRSOIrPMmOe1GW82d67zoWByk2rQd/9gCumDJTOkuVrUyCkkLq+6hGGiB26CxNOYSY/oB9TnTx/f7tLEd7x73E/B5NptptFRyhqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774608271; c=relaxed/simple;
	bh=ABG0CSIH876atnwjG/bMJyj5tgP2Y1cXgkDnMZe6CTo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L709n8JxgFPhn4l8Lei6j5Lypvmfbbv9MLF6a6huI4CMj7HsHg5qBXHjSFrEoArc+PsEzDFAAkOvBRf9RMYiqSGNJd/6VTKYEkqIOmFLR1PU+GH1P+vMdCwwdyPYka6NtRVrXJnzjklJMGCtfKemq/yLXVzjTDGjygbq5HAtKrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AQPa98aY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8040C19423;
	Fri, 27 Mar 2026 10:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774608270;
	bh=ABG0CSIH876atnwjG/bMJyj5tgP2Y1cXgkDnMZe6CTo=;
	h=From:To:Cc:Subject:Date:From;
	b=AQPa98aYFXl1baRQfvEcgwBx29S8DOvo0FY1ZytboPnCjplJxXTa1nAr8BVebuOAr
	 zZ9ZD1wwt1qQDWbVnpCcArchYezz3Mnh8pnLPWRlHXuine7MCNXtdHHsjkaDjb5/sB
	 ZUKvDuL3rfZjRuvQh6nPnlZz24GlTeeIUs9Qy+Ow93fty0FsDdg6XhH4YwVmjfpHhy
	 imeHSxeoFG5k1p17tlN7P8byAlpPCOMPs7BciHOA9MiPaZ6Cir/NqO5dhYJhyOtGag
	 PIYkwfHI6y0kMGRMG8qgLn4YRSxV1or0HB137D8maYNnI/90fUO0tgoIiiFXoagX5m
	 tUqACEb9OyLjw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1w64g0-00000005UoM-2ObN;
	Fri, 27 Mar 2026 11:44:28 +0100
From: Johan Hovold <johan@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH] media: cx231xx: fix devres lifetime
Date: Fri, 27 Mar 2026 11:43:55 +0100
Message-ID: <20260327104355.1310012-1-johan@kernel.org>
X-Mailer: git-send-email 2.52.0
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57218-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 15D6A343017
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

USB drivers bind to USB interfaces and any device managed resources
should have their lifetime tied to the interface rather than parent USB
device. This avoids issues like memory leaks when drivers are unbound
without their devices being physically disconnected (e.g. on probe
deferral or configuration changes).

Fix the driver state lifetime so that it is released on driver unbind.

Fixes: 184a82784d50 ("[media] cx231xx: use devm_ functions to allocate memory")
Cc: stable@vger.kernel.org	# 3.17
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/media/usb/cx231xx/cx231xx-cards.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-cards.c b/drivers/media/usb/cx231xx/cx231xx-cards.c
index b75535d6abaf..69b24205bc56 100644
--- a/drivers/media/usb/cx231xx/cx231xx-cards.c
+++ b/drivers/media/usb/cx231xx/cx231xx-cards.c
@@ -1573,7 +1573,8 @@ static int cx231xx_init_v4l2(struct cx231xx *dev,
 		 dev->video_mode.end_point_addr,
 		 dev->video_mode.num_alt);
 
-	dev->video_mode.alt_max_pkt_size = devm_kmalloc_array(&udev->dev, 32, dev->video_mode.num_alt, GFP_KERNEL);
+	dev->video_mode.alt_max_pkt_size = devm_kmalloc_array(&interface->dev, 32,
+							      dev->video_mode.num_alt, GFP_KERNEL);
 	if (dev->video_mode.alt_max_pkt_size == NULL)
 		return -ENOMEM;
 
@@ -1614,7 +1615,8 @@ static int cx231xx_init_v4l2(struct cx231xx *dev,
 		 dev->vbi_mode.num_alt);
 
 	/* compute alternate max packet sizes for vbi */
-	dev->vbi_mode.alt_max_pkt_size = devm_kmalloc_array(&udev->dev, 32, dev->vbi_mode.num_alt, GFP_KERNEL);
+	dev->vbi_mode.alt_max_pkt_size = devm_kmalloc_array(&interface->dev, 32,
+							    dev->vbi_mode.num_alt, GFP_KERNEL);
 	if (dev->vbi_mode.alt_max_pkt_size == NULL)
 		return -ENOMEM;
 
@@ -1656,7 +1658,9 @@ static int cx231xx_init_v4l2(struct cx231xx *dev,
 		 "sliced CC EndPoint Addr 0x%x, Alternate settings: %i\n",
 		 dev->sliced_cc_mode.end_point_addr,
 		 dev->sliced_cc_mode.num_alt);
-	dev->sliced_cc_mode.alt_max_pkt_size = devm_kmalloc_array(&udev->dev, 32, dev->sliced_cc_mode.num_alt, GFP_KERNEL);
+	dev->sliced_cc_mode.alt_max_pkt_size = devm_kmalloc_array(&interface->dev, 32,
+								  dev->sliced_cc_mode.num_alt,
+								  GFP_KERNEL);
 	if (dev->sliced_cc_mode.alt_max_pkt_size == NULL)
 		return -ENOMEM;
 
@@ -1720,7 +1724,7 @@ static int cx231xx_usb_probe(struct usb_interface *interface,
 	udev = interface_to_usbdev(interface);
 
 	/* allocate memory for our device state and initialize it */
-	dev = devm_kzalloc(&udev->dev, sizeof(*dev), GFP_KERNEL);
+	dev = devm_kzalloc(&interface->dev, sizeof(*dev), GFP_KERNEL);
 	if (dev == NULL) {
 		retval = -ENOMEM;
 		goto err_if;
@@ -1850,7 +1854,9 @@ static int cx231xx_usb_probe(struct usb_interface *interface,
 			 dev->ts1_mode.end_point_addr,
 			 dev->ts1_mode.num_alt);
 
-		dev->ts1_mode.alt_max_pkt_size = devm_kmalloc_array(&udev->dev, 32, dev->ts1_mode.num_alt, GFP_KERNEL);
+		dev->ts1_mode.alt_max_pkt_size = devm_kmalloc_array(&interface->dev, 32,
+								    dev->ts1_mode.num_alt,
+								    GFP_KERNEL);
 		if (dev->ts1_mode.alt_max_pkt_size == NULL) {
 			retval = -ENOMEM;
 			goto err_video_alt;
-- 
2.52.0


