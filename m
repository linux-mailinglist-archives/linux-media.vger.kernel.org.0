Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74228524D13
	for <lists+linux-media@lfdr.de>; Thu, 12 May 2022 14:37:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353863AbiELMhb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 May 2022 08:37:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353756AbiELMh1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 May 2022 08:37:27 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D178662136
        for <linux-media@vger.kernel.org>; Thu, 12 May 2022 05:37:26 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 8F4D521C82;
        Thu, 12 May 2022 12:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1652359045; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=L7b9NWV1Di5pSPdF/xuUrWQE6D56vC/QzYoNJmH9wT4=;
        b=vWoKwF800Vx/k/7F5layi9MYYFCtRK+d5yIeHn1qsX9EaRpEICK6Ugv08vaMFu/fITPvqD
        jW6NIEQPQuUHxxbusi+HNOTKAhfe1uoFvXoDw9mXWShVj3gNRPgJzqw5xBA9nPNJzg3xCZ
        sOX+rxkPqWQoKsWDzBXjovftVPrp4hw=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5F05713ABE;
        Thu, 12 May 2022 12:37:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id QCSQFYX/fGL/GgAAMHmgww
        (envelope-from <oneukum@suse.com>); Thu, 12 May 2022 12:37:25 +0000
From:   Oliver Neukum <oneukum@suse.com>
To:     linux-media@vger.kernel.org, mchehab@kernel.org, sean@mess.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCHv2 3/4] igorplugusb: break cyclical race on disconnect
Date:   Thu, 12 May 2022 14:37:22 +0200
Message-Id: <20220512123723.25815-3-oneukum@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220512123723.25815-1-oneukum@suse.com>
References: <20220512123723.25815-1-oneukum@suse.com>
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

The driver uses a timer, that may submit the URB and
the URB may start the timer. No simple order of killing
can break te cycle. Poison the URB before killing
the timer.

v2: Resending series due to omitting first patch

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/media/rc/igorplugusb.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/rc/igorplugusb.c b/drivers/media/rc/igorplugusb.c
index 1afba95409ff..b2245849f7aa 100644
--- a/drivers/media/rc/igorplugusb.c
+++ b/drivers/media/rc/igorplugusb.c
@@ -126,7 +126,7 @@ static void igorplugusb_cmd(struct igorplugusb *ir, int cmd)
 	ir->request.bRequest = cmd;
 	ir->urb->transfer_flags = 0;
 	ret = usb_submit_urb(ir->urb, GFP_ATOMIC);
-	if (ret)
+	if (ret && ret != -EPERM)
 		dev_err(ir->dev, "submit urb failed: %d", ret);
 }
 
@@ -223,7 +223,9 @@ static int igorplugusb_probe(struct usb_interface *intf,
 
 	return 0;
 fail:
+	usb_poison_urb(ir->urb);
 	del_timer(&ir->timer);
+	usb_unpoison_urb(ir->urb);
 	usb_free_urb(ir->urb);
 	rc_free_device(ir->rc);
 	kfree(ir->buf_in);
@@ -236,9 +238,10 @@ static void igorplugusb_disconnect(struct usb_interface *intf)
 	struct igorplugusb *ir = usb_get_intfdata(intf);
 
 	rc_unregister_device(ir->rc);
+	usb_poison_urb(ir->urb);
 	del_timer_sync(&ir->timer);
 	usb_set_intfdata(intf, NULL);
-	usb_kill_urb(ir->urb);
+	usb_unpoison_urb(ir->urb);
 	usb_free_urb(ir->urb);
 	kfree(ir->buf_in);
 }
-- 
2.35.3

