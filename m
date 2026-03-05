Return-Path: <linux-media+bounces-54644-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ABt5NDh/qWnA9QAAu9opvQ
	(envelope-from <linux-media+bounces-54644-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 14:03:52 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC9721256F
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 14:03:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1D84330525F6
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2026 13:00:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 755AE39EF18;
	Thu,  5 Mar 2026 13:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BDuDv7mm"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC0D3A0B03;
	Thu,  5 Mar 2026 13:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772715651; cv=none; b=hOT3asKVKnr6AE5/nnfdFs4wXO9R5bnm38sHnxYka44Lylt8+1EpSjlUYrbCT+5cH4ajJcq80mUABTRhLsVGNnCKe9NU6ZjvTSaFSm3Haqi1G1+WN9KlapnnOhSUCgHSRYJXiVYO1ygAizUikeqbopg1MKW0oEuUqnQxLAYym9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772715651; c=relaxed/simple;
	bh=iLXItyju+vlbawpEF9Ci2ONaYR5dmnrvlKJ6+cSzH+E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bq/v9MYq/OO32K/MxXRUnwP39vPVNoKMKDfOYrA82tL5q9CFazLlf2MIfyvvXtODHFeKxIsoEg3s6MUQnwLNtU/Ha4GQfWvc/bkj0SIVwbcbbSiD2GSejLZfJPwjvAbS7aMMGayTdKq1S/KUz3zDz+m95j+slVng044Ho0lzEN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BDuDv7mm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2090C19423;
	Thu,  5 Mar 2026 13:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772715651;
	bh=iLXItyju+vlbawpEF9Ci2ONaYR5dmnrvlKJ6+cSzH+E=;
	h=From:To:Cc:Subject:Date:From;
	b=BDuDv7mmU/BffO/Qo6SAeBdvNc4hvKc4ZrD3n6hy3Twh5/a23cqsSu0DRv61bBcGI
	 N8w0cWjCHcB7cLycERrL7MMKNv+vS7SGwcC3UXqeDF5mFIfAVLoO4zeJzfMVHxSFQy
	 VNYsQbzkTjP1dH6bxYy11wctwlbwO7CoUB9+y4BkI5YPRGbUaNdvU1ey0MT6KlDYfL
	 HfkCYUMe6YwEtPUBs91PGgteGnx5a1VRuyEerPJOLSyx3CohCnbjRRNHu4LXo3xi7D
	 5GIXENsmJcU48skpOLBKXbeC8sg8+Pr+CTFwfU4jew4sluGNJsqwqguQex7iFw2avs
	 xss5iFcECJLmg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vy8Jt-000000004D7-1uaE;
	Thu, 05 Mar 2026 14:00:49 +0100
From: Johan Hovold <johan@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH] media: cx231xx: drop redundant device reference
Date: Thu,  5 Mar 2026 14:00:25 +0100
Message-ID: <20260305130025.16153-1-johan@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4EC9721256F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54644-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-media@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
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
 drivers/media/usb/cx231xx/cx231xx-cards.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-cards.c b/drivers/media/usb/cx231xx/cx231xx-cards.c
index b64a37d1acf4..b75535d6abaf 100644
--- a/drivers/media/usb/cx231xx/cx231xx-cards.c
+++ b/drivers/media/usb/cx231xx/cx231xx-cards.c
@@ -1369,8 +1369,6 @@ void cx231xx_release_resources(struct cx231xx *dev)
 
 	cx231xx_unregister_media_device(dev);
 
-	usb_put_dev(dev->udev);
-
 	/* Mark device as unused */
 	clear_bit(dev->devno, &cx231xx_devused);
 }
@@ -1719,7 +1717,7 @@ static int cx231xx_usb_probe(struct usb_interface *interface,
 		}
 	} while (test_and_set_bit(nr, &cx231xx_devused));
 
-	udev = usb_get_dev(interface_to_usbdev(interface));
+	udev = interface_to_usbdev(interface);
 
 	/* allocate memory for our device state and initialize it */
 	dev = devm_kzalloc(&udev->dev, sizeof(*dev), GFP_KERNEL);
@@ -1915,7 +1913,6 @@ static int cx231xx_usb_probe(struct usb_interface *interface,
 err_media_init:
 	usb_set_intfdata(interface, NULL);
 err_if:
-	usb_put_dev(udev);
 	clear_bit(nr, &cx231xx_devused);
 	return retval;
 }
-- 
2.52.0


