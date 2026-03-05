Return-Path: <linux-media+bounces-54613-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDM7OfNdqWlc6QAAu9opvQ
	(envelope-from <linux-media+bounces-54613-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 11:41:55 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4340620FD8E
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 11:41:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A0BF130D2EC9
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2026 10:39:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B29737D126;
	Thu,  5 Mar 2026 10:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L7cwBBHz"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6575C37D13A;
	Thu,  5 Mar 2026 10:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772707169; cv=none; b=hmivW+oJ+bGNzQknIJcIrbxHPV1VqAXCutYqsgphtqCjGRHyeB5QTF4vM9+Yr0WeVY2SIqCCbkOuODNFJJ5X0pn4/MEDSITup/Ij185RxcroxUArWzbT8ZjwMaV1Tag08SZXn/vbRlpsn38C21+CSqq5IyZNlvUcgoTmrGPxmoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772707169; c=relaxed/simple;
	bh=bdMXs3cKCsinjxiW7C7KKB3lLvMOBVAZch5dXGPzlBM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Oc/BI1/0BLL3ESmcOifS3Tvvmo1NGDnHoWZtOUpY60RwQ9XV7cTxGqTog6ZRmUJ/xdHdVwfwKOw/EIg49YuXcHlO+wXDjX12W/fJH2NZyYsm0GLR+PbqAN9tQb+VkU5uIsy56ucitUeA2NviLwOpqgsvX7QximxEGG62H+6TMB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L7cwBBHz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D611C4AF0B;
	Thu,  5 Mar 2026 10:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772707169;
	bh=bdMXs3cKCsinjxiW7C7KKB3lLvMOBVAZch5dXGPzlBM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L7cwBBHzcHKKwixohDAmXlENn32IwCK74hwBObabRGT7axxvtdWVBGlLkcMPEUscm
	 z1/wROdmWBc++Bl8RTStxd6Uha09eIMAjyQEQX4ziTXKaDxYmXd6+GxMMLfeGq4NTr
	 /VPBw1ONDHpVj9HIU9+xu0dszvl3HYPX4trFXga12caxdV1SvGRwvHYGXlflswob9B
	 voCsdvkz9L1yPe4YSGY8wYJAwZ1V5WzTuoBiR6UGQ0BMsgEyzYE0owJcbjpu1ACcxB
	 /f2KsTo3K+PKNnimWlx7QDcHaBOuHTTa1+dq7tlQ23S/zthD3ig6Z6dPQ+w67wxknM
	 Ou0tWlwB+8u5g==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vy674-0000000043U-3iYQ;
	Thu, 05 Mar 2026 11:39:26 +0100
From: Johan Hovold <johan@kernel.org>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 3/4] media: go7007-loader: drop redundant device reference
Date: Thu,  5 Mar 2026 11:39:18 +0100
Message-ID: <20260305103919.15560-4-johan@kernel.org>
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
X-Rspamd-Queue-Id: 4340620FD8E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54613-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
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
 drivers/media/usb/go7007/go7007-loader.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/media/usb/go7007/go7007-loader.c b/drivers/media/usb/go7007/go7007-loader.c
index 243aa0ad074c..5747e6e4f2d6 100644
--- a/drivers/media/usb/go7007/go7007-loader.c
+++ b/drivers/media/usb/go7007/go7007-loader.c
@@ -41,9 +41,7 @@ static int go7007_loader_probe(struct usb_interface *interface,
 	int ret;
 	int i;
 
-	usbdev = usb_get_dev(interface_to_usbdev(interface));
-	if (!usbdev)
-		goto failed2;
+	usbdev = interface_to_usbdev(interface);
 
 	if (usbdev->descriptor.bNumConfigurations != 1) {
 		dev_err(&interface->dev, "can't handle multiple config\n");
@@ -96,7 +94,6 @@ static int go7007_loader_probe(struct usb_interface *interface,
 	return 0;
 
 failed2:
-	usb_put_dev(usbdev);
 	dev_err(&interface->dev, "probe failed\n");
 	return -ENODEV;
 }
@@ -104,7 +101,6 @@ static int go7007_loader_probe(struct usb_interface *interface,
 static void go7007_loader_disconnect(struct usb_interface *interface)
 {
 	dev_info(&interface->dev, "disconnect\n");
-	usb_put_dev(interface_to_usbdev(interface));
 	usb_set_intfdata(interface, NULL);
 }
 
-- 
2.52.0


