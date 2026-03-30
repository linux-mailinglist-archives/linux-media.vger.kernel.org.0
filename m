Return-Path: <linux-media+bounces-57587-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCddCoFOymmb7QUAu9opvQ
	(envelope-from <linux-media+bounces-57587-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 12:20:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DB877359110
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 12:20:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1D7F6309118B
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 10:13:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FD2F3BFE4C;
	Mon, 30 Mar 2026 10:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Efo5yv+u"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924363BED4A;
	Mon, 30 Mar 2026 10:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774865516; cv=none; b=ESdUyUXSqyBIOGwTYFPnDyr9CGgskwZGUpWWVuCz68D8SroH5bVuEXhZSMgtplKqwXKRE6doYlcbaSiuJIrnVE7PViSWhtfxFQTdWQgboaJDvNd2mXj445BICXs18bhqLHdwmmXx7VOly8eiIMZENLjdW2STJd1L+8ybptoPzeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774865516; c=relaxed/simple;
	bh=vmqS9U+ZM9NT3WFh5nEgoWc0CR8M4Yem0Ykyth1Z57w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PrPA5b4Iu25xiuo5l5yEG2oPO4AyZg5mvQbzB/It2WWBCK7AcCDDElJI6NJz06dd/RIGMIZXaWV6wQ682EkK+ZPdKcH2s8eMax1GbI8qe3zHMLao5p7kjvmai8bytxjQ51B0eRwfau0JgisxUWbQ/H6QDQnFgBCqzinlK1tTkRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Efo5yv+u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 717E7C2BCB6;
	Mon, 30 Mar 2026 10:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774865516;
	bh=vmqS9U+ZM9NT3WFh5nEgoWc0CR8M4Yem0Ykyth1Z57w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Efo5yv+uBud+ifjcOEiz02N85gmMloAGkqhQgZnYxTQnb+C1smemez9f9iWPKyr9c
	 CIZUAxWbNMR+YN/TOh7uSYuUE5sGe3fy1eleeQV/ya5Vn8//GSWGvsIlIsIkdpoHxm
	 RLmBdhiqAyPwGUt8F4LvDfMGZ5IFhAucOw6q7CwPF3vrM0irmhXBK72pAL6AeqRa+K
	 lptqJUAPGXSnMrKLZbX57GNfJ/TQvEDYm78t37bT1F9sdc1ThLWGWSowmxqLws3+/W
	 W49ecvNrCz1OHYgvnYXCAL9qlylgCK/VeezaxyposTTZLfDMuPD7HjTPYlDe7hvjl5
	 1/B7Cy5mpmmBg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1w79b8-00000006yvg-1Oik;
	Mon, 30 Mar 2026 12:11:54 +0200
From: Johan Hovold <johan@kernel.org>
To: Hans Verkuil <hverkuil@kernel.org>,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 3/6] media: irtoy: refactor endpoint lookup
Date: Mon, 30 Mar 2026 12:11:38 +0200
Message-ID: <20260330101141.1664143-4-johan@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57587-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DB877359110
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use the common USB helpers for looking up bulk and interrupt endpoints
(and determining max packet size) instead of open coding.

Note that the device has two bulk endpoints so there is no functional
change here.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/media/rc/ir_toy.c | 23 ++++++-----------------
 1 file changed, 6 insertions(+), 17 deletions(-)

diff --git a/drivers/media/rc/ir_toy.c b/drivers/media/rc/ir_toy.c
index d6472de5da87..f63f06509786 100644
--- a/drivers/media/rc/ir_toy.c
+++ b/drivers/media/rc/ir_toy.c
@@ -393,27 +393,15 @@ static int irtoy_probe(struct usb_interface *intf,
 {
 	struct usb_host_interface *idesc = intf->cur_altsetting;
 	struct usb_device *usbdev = interface_to_usbdev(intf);
-	struct usb_endpoint_descriptor *ep_in = NULL;
-	struct usb_endpoint_descriptor *ep_out = NULL;
-	struct usb_endpoint_descriptor *ep = NULL;
+	struct usb_endpoint_descriptor *ep_in, *ep_out;
 	struct irtoy *irtoy;
 	struct rc_dev *rc;
 	struct urb *urb;
-	int i, pipe, err = -ENOMEM;
+	int pipe, err;
 
-	for (i = 0; i < idesc->desc.bNumEndpoints; i++) {
-		ep = &idesc->endpoint[i].desc;
-
-		if (!ep_in && usb_endpoint_is_bulk_in(ep) &&
-		    usb_endpoint_maxp(ep) == MAX_PACKET)
-			ep_in = ep;
-
-		if (!ep_out && usb_endpoint_is_bulk_out(ep) &&
-		    usb_endpoint_maxp(ep) == MAX_PACKET)
-			ep_out = ep;
-	}
-
-	if (!ep_in || !ep_out) {
+	err = usb_find_common_endpoints(idesc, &ep_in, &ep_out, NULL, NULL);
+	if (err || usb_endpoint_maxp(ep_in) != MAX_PACKET ||
+	    usb_endpoint_maxp(ep_out) != MAX_PACKET) {
 		dev_err(&intf->dev, "required endpoints not found\n");
 		return -ENODEV;
 	}
@@ -422,6 +410,7 @@ static int irtoy_probe(struct usb_interface *intf,
 	if (!irtoy)
 		return -ENOMEM;
 
+	err = -ENOMEM;
 	irtoy->in = kmalloc(MAX_PACKET,  GFP_KERNEL);
 	if (!irtoy->in)
 		goto free_irtoy;
-- 
2.52.0


