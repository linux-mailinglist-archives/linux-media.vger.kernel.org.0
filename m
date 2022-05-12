Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00BED524D7F
	for <lists+linux-media@lfdr.de>; Thu, 12 May 2022 14:50:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354024AbiELMub (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 May 2022 08:50:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354072AbiELMuG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 May 2022 08:50:06 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5090D24F0E2
        for <linux-media@vger.kernel.org>; Thu, 12 May 2022 05:50:04 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id C3EF51F460;
        Thu, 12 May 2022 12:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1652359802; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=CslvULihxlWB2th/s86ScxpkpSoRJZVkSougqY454Po=;
        b=e/zYCfH3+l811SiFghuijgamfLOrVZkaBIfaJTYV4GI5vJRf/yTKBAGRg0cbxUsUt8t/qx
        XMl66p9hJorPRcSY74NbaJVWy60I8zAEEiYfPqtLeIOPLKQfvQxbQ0LXRpRnXW84TvHimj
        eDs9wY94bGUn+Nkaa0Xp87cEfwKgYJk=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9450613ABE;
        Thu, 12 May 2022 12:50:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id c8ahInoCfWLmIQAAMHmgww
        (envelope-from <oneukum@suse.com>); Thu, 12 May 2022 12:50:02 +0000
From:   Oliver Neukum <oneukum@suse.com>
To:     linux-media@vger.kernel.org, mchehab@kernel.org, sean@mess.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] iguanair: no superfluous usb_unlink_urb()
Date:   Thu, 12 May 2022 14:50:00 +0200
Message-Id: <20220512125000.8340-1-oneukum@suse.com>
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

Unlinking yourself while the completion handler
is running is a NOP. Drop it.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/media/rc/iguanair.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/rc/iguanair.c b/drivers/media/rc/iguanair.c
index c9cb8277723f..276bf3c8a8cb 100644
--- a/drivers/media/rc/iguanair.c
+++ b/drivers/media/rc/iguanair.c
@@ -149,10 +149,8 @@ static void iguanair_rx(struct urb *urb)
 		return;
 
 	ir = urb->context;
-	if (!ir) {
-		usb_unlink_urb(urb);
+	if (!ir)
 		return;
-	}
 
 	switch (urb->status) {
 	case 0:
@@ -161,7 +159,6 @@ static void iguanair_rx(struct urb *urb)
 	case -ECONNRESET:
 	case -ENOENT:
 	case -ESHUTDOWN:
-		usb_unlink_urb(urb);
 		return;
 	case -EPIPE:
 	default:
-- 
2.35.3

