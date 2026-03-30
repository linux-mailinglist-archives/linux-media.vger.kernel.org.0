Return-Path: <linux-media+bounces-57586-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CTJG0ZNymmb7QUAu9opvQ
	(envelope-from <linux-media+bounces-57586-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 12:15:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7A3358FED
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 12:15:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3B41930357A6
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 10:13:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31A6F3BFE41;
	Mon, 30 Mar 2026 10:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ry7RZOy5"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879043BED40;
	Mon, 30 Mar 2026 10:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774865516; cv=none; b=SoV4/LS1MhyqHmumkgbguLBuJw0JT9y+gigL43MWhAJ1lRHmyvjt95vv9UkVKAfhv+e9mj1N+T6By7EfFwBEATL3IyY/ImdIUVQ6/E4FMKO1pHXVzbbPWi5ZY2HbNRQRO8zhc8Vopx5oCfY8Xi6S/vFJjuARg3uOlNzAnJcyqcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774865516; c=relaxed/simple;
	bh=w6KzY0XzyjcyMRUlPVjJZv6AcnGT6wLQdMD+us8oX/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uqxKCqeJMVk3UFYvexRis9d9CFbwpdZhbRMRha/HSLs1WinNMMmQh9/UEzDMvqjswcD4ibqIEzG8kt3wbY+Bu1lS1KnDN5yxrw26dhZX0O4owXuYPswHtI0d67OuLxrOApIDOH7GrYuRqL7MxDssqUDo0MgDfzvjE9zSivEPqSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ry7RZOy5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D276C2BCB4;
	Mon, 30 Mar 2026 10:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774865516;
	bh=w6KzY0XzyjcyMRUlPVjJZv6AcnGT6wLQdMD+us8oX/4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ry7RZOy5B1YvtLjvnkCyB2d/qGBT0h9iJ3fkbKdgbJ4iZb+GcQhvmFY90Krz5N7Xi
	 v+rpSbLVXsomwLl+N3erzReMxsfClkBgA0H1ELMsy58LawUXarWrz1t96oyQkr9djd
	 Lk995DyGBQSDGz1B1yVcAfSBWIWzyMQLQoic6aCEmBGUXgc/w7jLQnGC7dohsYNhdT
	 Zp3GDP9NppBduFYYm39ZATlUUZheJ9oiqSkDbANSA9hSSwViup4pAkzsVwUjac4Bxw
	 1XTkB94EVfHeYuPPbGZrZbww1Bgi4KswXTmXlHSafVRC4tj6kGciI/A8Dnq69xpOAo
	 dxfEIXao27xXw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1w79b8-00000006yve-1MUj;
	Mon, 30 Mar 2026 12:11:54 +0200
From: Johan Hovold <johan@kernel.org>
To: Hans Verkuil <hverkuil@kernel.org>,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 2/6] media: imon_raw: refactor endpoint lookup
Date: Mon, 30 Mar 2026 12:11:37 +0200
Message-ID: <20260330101141.1664143-3-johan@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57586-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0B7A3358FED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use the common USB helper for looking up interrupt-in endpoints instead
of open coding.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/media/rc/imon_raw.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/media/rc/imon_raw.c b/drivers/media/rc/imon_raw.c
index 3a526dea6532..295acd6ba9e1 100644
--- a/drivers/media/rc/imon_raw.c
+++ b/drivers/media/rc/imon_raw.c
@@ -105,26 +105,16 @@ static void imon_ir_rx(struct urb *urb)
 static int imon_probe(struct usb_interface *intf,
 		      const struct usb_device_id *id)
 {
-	struct usb_endpoint_descriptor *ir_ep = NULL;
-	struct usb_host_interface *idesc;
+	struct usb_endpoint_descriptor *ir_ep;
 	struct usb_device *udev;
 	struct rc_dev *rcdev;
 	struct imon *imon;
-	int i, ret;
+	int ret;
 
 	udev = interface_to_usbdev(intf);
-	idesc = intf->cur_altsetting;
-
-	for (i = 0; i < idesc->desc.bNumEndpoints; i++) {
-		struct usb_endpoint_descriptor *ep = &idesc->endpoint[i].desc;
-
-		if (usb_endpoint_is_int_in(ep)) {
-			ir_ep = ep;
-			break;
-		}
-	}
 
-	if (!ir_ep) {
+	ret = usb_find_int_in_endpoint(intf->cur_altsetting, &ir_ep);
+	if (ret) {
 		dev_err(&intf->dev, "IR endpoint missing");
 		return -ENODEV;
 	}
-- 
2.52.0


