Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96074524E03
	for <lists+linux-media@lfdr.de>; Thu, 12 May 2022 15:16:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354240AbiELNQN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 May 2022 09:16:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354107AbiELNQL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 May 2022 09:16:11 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B761B22B26
        for <linux-media@vger.kernel.org>; Thu, 12 May 2022 06:16:08 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 6AEF521C62;
        Thu, 12 May 2022 13:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1652361367; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=JlRcrDB8KabZ01qDWgUNyT+oi6c1KVOKGETH1O2TxQ0=;
        b=qQYCuLRAiEGJXY66ICMyd6UcnU5/bcrpPjsX3JOMVnDPqev/bOeNvF7xZsJqQKpW+R8t0s
        96tq3zBx9LpFDyTqNeOxlAUW7MnbjBtvfQ1nYB+gD+a1K+Wu5vQ15TmglMu2hJHMrC/tgN
        WQG49CBmesIlz3dBw4kj8Icu2z9H9pY=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3A36313ABE;
        Thu, 12 May 2022 13:16:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id etuBDJcIfWLGLwAAMHmgww
        (envelope-from <oneukum@suse.com>); Thu, 12 May 2022 13:16:07 +0000
From:   Oliver Neukum <oneukum@suse.com>
To:     linux-media@vger.kernel.org, mchehab@kernel.org, sean@mess.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] redrat3: no unnecessary GFP_ATOMIC
Date:   Thu, 12 May 2022 15:16:05 +0200
Message-Id: <20220512131605.13091-1-oneukum@suse.com>
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

During resume() GFP_NOIO will do.
No need for GFP_ATOMIC

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/media/rc/redrat3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/rc/redrat3.c b/drivers/media/rc/redrat3.c
index cb22316b3f00..9f2947af33aa 100644
--- a/drivers/media/rc/redrat3.c
+++ b/drivers/media/rc/redrat3.c
@@ -1155,9 +1155,9 @@ static int redrat3_dev_resume(struct usb_interface *intf)
 {
 	struct redrat3_dev *rr3 = usb_get_intfdata(intf);
 
-	if (usb_submit_urb(rr3->narrow_urb, GFP_ATOMIC))
+	if (usb_submit_urb(rr3->narrow_urb, GFP_NOIO))
 		return -EIO;
-	if (usb_submit_urb(rr3->wide_urb, GFP_ATOMIC))
+	if (usb_submit_urb(rr3->wide_urb, GFP_NOIO))
 		return -EIO;
 	led_classdev_resume(&rr3->led);
 	return 0;
-- 
2.35.3

