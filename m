Return-Path: <linux-media+bounces-57588-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPb6IMhOymmb7QUAu9opvQ
	(envelope-from <linux-media+bounces-57588-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 12:22:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8629C359169
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 12:21:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C42C43095BF7
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 10:13:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 438D73BFE50;
	Mon, 30 Mar 2026 10:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s6jAlVAs"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925793BED58;
	Mon, 30 Mar 2026 10:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774865516; cv=none; b=QnVKSVr3GRTOxuEQH+uiYGFj7FH/ZABMkSkBHEsEgUXsH6dqQ1si0BUJ4bPWTnDunwbgN6f2165WNEwhH3/qSa7ojhyhggoZGeUqNryRNIPqB2Fsub0pwV2rtlo+i/CLcvdQTdT5Ja+TKpQaUaIJtcwI2mT21UetNf5993HiTfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774865516; c=relaxed/simple;
	bh=9/pTkhn2u2LSwJWS3DyDgtL8TAWdS/g1l4ZFCYjsYio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=er1Vx6xCSTSausFNNWGhDgAzW+YTW9z3dw8FLpavBr4EIUNjyXIzPOk8p1tBSqDVP2x2kFz510xbtNcaMP17TuS2zzCRJooYYKW1yPLev+JcUECsi2CB1DvELM/VTiguR7LvZi1H+iRqWuukZkoiNn/r6z5uOn2nOiyLEpnzNeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s6jAlVAs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F5B9C2BCB3;
	Mon, 30 Mar 2026 10:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774865516;
	bh=9/pTkhn2u2LSwJWS3DyDgtL8TAWdS/g1l4ZFCYjsYio=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s6jAlVAscj5D3hAlHXt6P8nkcGjbsXp9T11dY+dUwjTqtONYDTlh9UTWBT+XD8T4l
	 sH5xbxXXRM3NxIexG23NiSLa3ex68nLMt0KpchGwIme1YYP2ICpZVAYYlD7pGrW3l2
	 Ri2jMaLx+FjSrb68Qe7FXduSK6rRzo9lzyksstLW1SVLFR7NTbyWnVzgtaxB+nDGXu
	 DBrX8acXEuIrCEvbOQwPaCwoOC0ongeopUglUoD1DsVH5EscTcKR/R7uympswkOiyK
	 8r7lgVdslm5ANekAE6XYU0sKzEuV0KUDbGMqoAREP9QkxAXfjEMHKCHvkFQqUu3K9z
	 HrNPfhQdad1wA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1w79b8-00000006yvk-1TFJ;
	Mon, 30 Mar 2026 12:11:54 +0200
From: Johan Hovold <johan@kernel.org>
To: Hans Verkuil <hverkuil@kernel.org>,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 5/6] media: hdpvr: refactor endpoint lookup
Date: Mon, 30 Mar 2026 12:11:40 +0200
Message-ID: <20260330101141.1664143-6-johan@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57588-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8629C359169
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use the common USB helper for looking up bulk-in endpoints instead of
open coding.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/media/usb/hdpvr/hdpvr-core.c | 26 ++++++++------------------
 1 file changed, 8 insertions(+), 18 deletions(-)

diff --git a/drivers/media/usb/hdpvr/hdpvr-core.c b/drivers/media/usb/hdpvr/hdpvr-core.c
index d42336836b18..849a2be416bd 100644
--- a/drivers/media/usb/hdpvr/hdpvr-core.c
+++ b/drivers/media/usb/hdpvr/hdpvr-core.c
@@ -265,13 +265,10 @@ static int hdpvr_probe(struct usb_interface *interface,
 		       const struct usb_device_id *id)
 {
 	struct hdpvr_device *dev;
-	struct usb_host_interface *iface_desc;
 	struct usb_endpoint_descriptor *endpoint;
 #if IS_ENABLED(CONFIG_I2C)
 	struct i2c_client *client;
 #endif
-	size_t buffer_size;
-	int i;
 	int dev_num;
 	int retval = -ENOMEM;
 
@@ -321,25 +318,18 @@ static int hdpvr_probe(struct usb_interface *interface,
 
 	/* set up the endpoint information */
 	/* use only the first bulk-in and bulk-out endpoints */
-	iface_desc = interface->cur_altsetting;
-	for (i = 0; i < iface_desc->desc.bNumEndpoints; ++i) {
-		endpoint = &iface_desc->endpoint[i].desc;
-
-		if (!dev->bulk_in_endpointAddr &&
-		    usb_endpoint_is_bulk_in(endpoint)) {
-			/* USB interface description is buggy, reported max
-			 * packet size is 512 bytes, windows driver uses 8192 */
-			buffer_size = 8192;
-			dev->bulk_in_size = buffer_size;
-			dev->bulk_in_endpointAddr = endpoint->bEndpointAddress;
-		}
-
-	}
-	if (!dev->bulk_in_endpointAddr) {
+	if (usb_find_bulk_in_endpoint(interface->cur_altsetting, &endpoint)) {
 		v4l2_err(&dev->v4l2_dev, "Could not find bulk-in endpoint\n");
 		goto error_put_usb;
 	}
 
+	/*
+	 * USB interface description is buggy, reported max packet size is 512
+	 * bytes, windows driver uses 8192
+	 */
+	dev->bulk_in_size = 8192;
+	dev->bulk_in_endpointAddr = endpoint->bEndpointAddress;
+
 	/* init the device */
 	if (hdpvr_device_init(dev)) {
 		v4l2_err(&dev->v4l2_dev, "device init failed\n");
-- 
2.52.0


