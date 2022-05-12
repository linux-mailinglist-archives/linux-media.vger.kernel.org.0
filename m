Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3DC8524D11
	for <lists+linux-media@lfdr.de>; Thu, 12 May 2022 14:37:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353862AbiELMh2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 May 2022 08:37:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349758AbiELMh1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 May 2022 08:37:27 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 533F26212B
        for <linux-media@vger.kernel.org>; Thu, 12 May 2022 05:37:26 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 141441F88F;
        Thu, 12 May 2022 12:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1652359045; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=P9lhJMO5oZS2g47UJKj/tR2sGhDq+1Yr7qCMhH7/RDo=;
        b=Igu+hegJtWvM1nyX1ODL9u8tToH5KGnYvCdUGqDeD/3olK5CdKX2a5f8jIfhLwqRBC7tZR
        1su8f8UpA1yFcUyPs9vYpudA9jzJ5mgEsl+m9KElP8fRj3p9GTKmOaZnA6COIlFoLOf4SH
        xEzkvKhYVKPgPsi+pvHNCEfHxBjHCq4=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DA34B13ABE;
        Thu, 12 May 2022 12:37:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id hplyMoT/fGL/GgAAMHmgww
        (envelope-from <oneukum@suse.com>); Thu, 12 May 2022 12:37:24 +0000
From:   Oliver Neukum <oneukum@suse.com>
To:     linux-media@vger.kernel.org, mchehab@kernel.org, sean@mess.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCHv2 1/4] igorplugusb: respect DMA coherency
Date:   Thu, 12 May 2022 14:37:20 +0200
Message-Id: <20220512123723.25815-1-oneukum@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The coherency rules mean that you cannot embed
a buffer inside a descriptor. kmalloc() separately.

v2: Resending series due to omitting this patch

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/media/rc/igorplugusb.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/rc/igorplugusb.c b/drivers/media/rc/igorplugusb.c
index b40dbf500186..b46362da8623 100644
--- a/drivers/media/rc/igorplugusb.c
+++ b/drivers/media/rc/igorplugusb.c
@@ -38,7 +38,7 @@ struct igorplugusb {
 
 	struct timer_list timer;
 
-	uint8_t buf_in[MAX_PACKET];
+	u8 *buf_in;
 
 	char phys[64];
 };
@@ -177,6 +177,9 @@ static int igorplugusb_probe(struct usb_interface *intf,
 	if (!ir->urb)
 		goto fail;
 
+	ir->buf_in = kmalloc(MAX_PACKET, GFP_KERNEL);
+	if (!ir->buf_in)
+		goto fail;
 	usb_fill_control_urb(ir->urb, udev,
 		usb_rcvctrlpipe(udev, 0), (uint8_t *)&ir->request,
 		ir->buf_in, sizeof(ir->buf_in), igorplugusb_callback, ir);
@@ -223,6 +226,7 @@ static int igorplugusb_probe(struct usb_interface *intf,
 	rc_free_device(ir->rc);
 	usb_free_urb(ir->urb);
 	del_timer(&ir->timer);
+	kfree(ir->buf_in);
 
 	return ret;
 }
@@ -236,6 +240,7 @@ static void igorplugusb_disconnect(struct usb_interface *intf)
 	usb_set_intfdata(intf, NULL);
 	usb_kill_urb(ir->urb);
 	usb_free_urb(ir->urb);
+	kfree(ir->buf_in);
 }
 
 static const struct usb_device_id igorplugusb_table[] = {
-- 
2.35.3

