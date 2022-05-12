Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D491524E6D
	for <lists+linux-media@lfdr.de>; Thu, 12 May 2022 15:39:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353158AbiELNjI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 May 2022 09:39:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354497AbiELNjD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 May 2022 09:39:03 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F81E247377
        for <linux-media@vger.kernel.org>; Thu, 12 May 2022 06:39:02 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 220D0218A9;
        Thu, 12 May 2022 13:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1652362741; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=B9+D8ai8AKeB7DLT4Xy4B98CPwnoGciMteeFkS7jfI8=;
        b=ZlwmfTCdoAMJS0Yh7yPR1VG6AU4pW2WEoI+TfMXtzqytUKFwLlphbMmzodKVBtLjPpp54n
        S7vEE4alJOgjYX+zW619LQbf+4kEhmfVCO17JGg/Ecrd3yfpZ8LsWNrcj6dD4GklVIBVdK
        tqzVmMJyu359iMqihwgFiVjjSR6baXQ=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D93FF13A84;
        Thu, 12 May 2022 13:39:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id gB1gM/QNfWJKOwAAMHmgww
        (envelope-from <oneukum@suse.com>); Thu, 12 May 2022 13:39:00 +0000
From:   Oliver Neukum <oneukum@suse.com>
To:     linux-media@vger.kernel.org, mchehab@kernel.org, sean@mess.org,
        benpicco@googlemail.com
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] xbox_remote: xbox_remote_initialize() cannot fail
Date:   Thu, 12 May 2022 15:38:58 +0200
Message-Id: <20220512133858.5335-1-oneukum@suse.com>
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

It cannot fail. Make it void.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/media/rc/xbox_remote.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/media/rc/xbox_remote.c b/drivers/media/rc/xbox_remote.c
index 98d0b43608ad..301682af0cec 100644
--- a/drivers/media/rc/xbox_remote.c
+++ b/drivers/media/rc/xbox_remote.c
@@ -163,7 +163,7 @@ static void xbox_remote_rc_init(struct xbox_remote *xbox_remote)
 	rdev->dev.parent = &xbox_remote->interface->dev;
 }
 
-static int xbox_remote_initialize(struct xbox_remote *xbox_remote,
+static void xbox_remote_initialize(struct xbox_remote *xbox_remote,
 				  struct usb_endpoint_descriptor *endpoint_in)
 {
 	struct usb_device *udev = xbox_remote->udev;
@@ -177,8 +177,6 @@ static int xbox_remote_initialize(struct xbox_remote *xbox_remote,
 	usb_fill_int_urb(xbox_remote->irq_urb, udev, pipe, xbox_remote->inbuf,
 			 maxp, xbox_remote_irq_in, xbox_remote,
 			 endpoint_in->bInterval);
-
-	return 0;
 }
 
 /*
@@ -249,9 +247,7 @@ static int xbox_remote_probe(struct usb_interface *interface,
 	xbox_remote_rc_init(xbox_remote);
 
 	/* Device Hardware Initialization */
-	err = xbox_remote_initialize(xbox_remote, endpoint_in);
-	if (err)
-		goto exit_kill_urbs;
+	xbox_remote_initialize(xbox_remote, endpoint_in);
 
 	/* Set up and register rc device */
 	err = rc_register_device(xbox_remote->rdev);
-- 
2.35.3

