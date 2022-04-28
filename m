Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C77F513543
	for <lists+linux-media@lfdr.de>; Thu, 28 Apr 2022 15:35:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347316AbiD1NiY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Apr 2022 09:38:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347309AbiD1NiR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Apr 2022 09:38:17 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08701FCF
        for <linux-media@vger.kernel.org>; Thu, 28 Apr 2022 06:35:02 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id B3C3B21872;
        Thu, 28 Apr 2022 13:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1651152900; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VYZ+UDp1nONzQN/HqiPcka54V8skLwOqfQ0S9hYLkgE=;
        b=pAFm/9X+J2/r2DMBTQ590etCAfRhPtQrQnjs+Tvtc2b3FvMoDQzwhYdU91TwBfNH9nrcHG
        i+6TmPKnRqJiZrjIFc9jilHhFSL9QHPgxZlFp7FeuvEskQkGoLj2kFYiMPsqPDRbtswWaB
        /qfhBXMAXnNprLw3qMulYdgL31fSqGA=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8479313491;
        Thu, 28 Apr 2022 13:35:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id uPdyHgSYamKuTAAAMHmgww
        (envelope-from <oneukum@suse.com>); Thu, 28 Apr 2022 13:35:00 +0000
From:   Oliver Neukum <oneukum@suse.com>
To:     sean@mess.org, mchehab@kernel.org, linux-media@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCH 2/3] USB: imon: fix timer racing disconnect
Date:   Thu, 28 Apr 2022 15:34:54 +0200
Message-Id: <20220428133455.3200-2-oneukum@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220428133455.3200-1-oneukum@suse.com>
References: <20220428133455.3200-1-oneukum@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The timer will report events for an input device.
Reporting events for an unregistered device is bad.
Hence the timer must be killed first.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/media/rc/imon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/rc/imon.c b/drivers/media/rc/imon.c
index 761b7fa57378..8dbeab48ed3c 100644
--- a/drivers/media/rc/imon.c
+++ b/drivers/media/rc/imon.c
@@ -2537,8 +2537,8 @@ static void imon_disconnect(struct usb_interface *interface)
 		usb_kill_urb(ictx->rx_urb_intf1);
 		usb_put_dev(ictx->usbdev_intf1);
 		if (ictx->display_type == IMON_DISPLAY_TYPE_VGA) {
-			input_unregister_device(ictx->touch);
 			del_timer_sync(&ictx->ttimer);
+			input_unregister_device(ictx->touch);
 		}
 	}
 
-- 
2.34.1

