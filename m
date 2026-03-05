Return-Path: <linux-media+bounces-54616-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMfkEW9dqWkL6AAAu9opvQ
	(envelope-from <linux-media+bounces-54616-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 11:39:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A56F20FCD7
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 11:39:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E26D7301C54E
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2026 10:39:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 667A02882C5;
	Thu,  5 Mar 2026 10:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UyC5b2aS"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B695382368;
	Thu,  5 Mar 2026 10:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772707169; cv=none; b=dzOtx5bsgUloSzq/8SEaY/fE//EBXqyogZDpAt5Sq1ic1qz6C9/CQ1hARuCI/8963RE287Wg6LP/zjaLDFjKkSbFK9xFbrnHlAzRP9ShDpsPj0QvR1qe+zH8Z2jx4TKiqqkpcKbSze3Kl1g4CdWWTtaI/d6OiT7FyMEUevX5PvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772707169; c=relaxed/simple;
	bh=2IMZSnX3bItCAbNT5Kf1ig5Bae8qoO7U3f/Fz8jyTME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=peOSjnZW32v00CawXATjLAQSNius7BDVX0TcbPSdJrVVAaHlWrw7RFpMjeas/TjbfU64xgAbmlaNLr9svIxhZwKeXshAgHxP11ip8i727/kj6lvge2aL7muaEbEhQC6x4UAOlLzYsRWJOGqpWvAqrwHX+9kHk41ojLqJ220mDFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UyC5b2aS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54158C2BCAF;
	Thu,  5 Mar 2026 10:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772707169;
	bh=2IMZSnX3bItCAbNT5Kf1ig5Bae8qoO7U3f/Fz8jyTME=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UyC5b2aSIpNRUAWUqpTKvnXcWNHM8Qu5Bv/mOrYIW6UCUUnrvvQIXHKC8ONgQVed5
	 kk0/IAOKGeDlH6gaMAO6ffKOVKVEsxpo8TQDi2gX7eh83oYazHFrP/nf53vRwFu/a6
	 mqrq1uf/Dy60c8cIn/Cfli4jP10dxgDasP2Yi0fX+eNRDwJD4sVaFl+txKKZjlunp8
	 gNlREtzDey4o78nV6ylGI8Fd9TLLtNOP6e0ZkVHmbohOUxdknKCWM73NplMAnkHGAD
	 pSiumtuujTP1dk5vQS6E6sZ7484ede0oBRCGosXoPnPVvEzJbDb7iLzYuXdOyl+yUI
	 kUpmqVZP5I7Pw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vy674-0000000043S-3fvU;
	Thu, 05 Mar 2026 11:39:26 +0100
From: Johan Hovold <johan@kernel.org>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 2/4] media: mceusb: drop redundant device reference
Date: Thu,  5 Mar 2026 11:39:17 +0100
Message-ID: <20260305103919.15560-3-johan@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260305103919.15560-1-johan@kernel.org>
References: <20260305103919.15560-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1A56F20FCD7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54616-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

Driver core holds a reference to the USB interface and its parent USB
device while the interface is bound to a driver and there is no need to
take additional references unless the structures are needed after
disconnect.

Drop the redundant device reference to reduce cargo culting, make it
easier to spot drivers where an extra reference is needed, and reduce
the risk of memory leaks when drivers fail to release it.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/media/rc/mceusb.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/rc/mceusb.c b/drivers/media/rc/mceusb.c
index ed55e9ec3c57..d9bdf0b9487a 100644
--- a/drivers/media/rc/mceusb.c
+++ b/drivers/media/rc/mceusb.c
@@ -1729,7 +1729,7 @@ static int mceusb_dev_probe(struct usb_interface *intf,
 		goto urb_in_alloc_fail;
 
 	ir->usbintf = intf;
-	ir->usbdev = usb_get_dev(dev);
+	ir->usbdev = dev;
 	ir->dev = &intf->dev;
 	ir->len_in = maxp;
 	ir->flags.microsoft_gen1 = is_microsoft_gen1;
@@ -1817,7 +1817,6 @@ static int mceusb_dev_probe(struct usb_interface *intf,
 	/* Error-handling path */
 rc_dev_fail:
 	cancel_work_sync(&ir->kevent);
-	usb_put_dev(ir->usbdev);
 	usb_kill_urb(ir->urb_in);
 	usb_free_urb(ir->urb_in);
 urb_in_alloc_fail:
@@ -1849,7 +1848,6 @@ static void mceusb_dev_disconnect(struct usb_interface *intf)
 	usb_kill_urb(ir->urb_in);
 	usb_free_urb(ir->urb_in);
 	usb_free_coherent(dev, ir->len_in, ir->buf_in, ir->dma_in);
-	usb_put_dev(dev);
 
 	kfree(ir);
 }
-- 
2.52.0


