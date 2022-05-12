Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43E96524CF3
	for <lists+linux-media@lfdr.de>; Thu, 12 May 2022 14:34:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353812AbiELMeG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 May 2022 08:34:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353805AbiELMeB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 May 2022 08:34:01 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 910BC644C1
        for <linux-media@vger.kernel.org>; Thu, 12 May 2022 05:33:59 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 0A84421C82;
        Thu, 12 May 2022 12:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1652358838; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=BNJI+u1QPL4iKmQOgR9HOOU515MZvyu/0IWN9/HT5Jw=;
        b=Dg3vstJ0lKsW7i9xNb+gw+90ec8sXPQk1eyHiLaUIKaWoCqAptmUTYKQph8CWn43uCjs29
        pEKa6jklPyMC6GjaAxAwMXOOqPoSbUGRknbIcIsXCw9WlDAn1xoN8h8S5GAdRpyPsLsxTc
        xqA5XbaXjMeTn8voUhwFuiG0BJq7vCE=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C685C13ABE;
        Thu, 12 May 2022 12:33:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 9orWLrX+fGL+GAAAMHmgww
        (envelope-from <oneukum@suse.com>); Thu, 12 May 2022 12:33:57 +0000
From:   Oliver Neukum <oneukum@suse.com>
To:     linux-media@vger.kernel.org, mchehab@kernel.org, sean@mess.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCH 1/3] igorplugusb: prevent use after free in probe error
Date:   Thu, 12 May 2022 14:33:52 +0200
Message-Id: <20220512123354.25766-1-oneukum@suse.com>
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

The timer uses the URB. Free it only after the timer
has been stopped.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/media/rc/igorplugusb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/rc/igorplugusb.c b/drivers/media/rc/igorplugusb.c
index b46362da8623..1afba95409ff 100644
--- a/drivers/media/rc/igorplugusb.c
+++ b/drivers/media/rc/igorplugusb.c
@@ -223,9 +223,9 @@ static int igorplugusb_probe(struct usb_interface *intf,
 
 	return 0;
 fail:
-	rc_free_device(ir->rc);
-	usb_free_urb(ir->urb);
 	del_timer(&ir->timer);
+	usb_free_urb(ir->urb);
+	rc_free_device(ir->rc);
 	kfree(ir->buf_in);
 
 	return ret;
-- 
2.35.3

