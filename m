Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDFD2513545
	for <lists+linux-media@lfdr.de>; Thu, 28 Apr 2022 15:35:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347309AbiD1NiZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Apr 2022 09:38:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347310AbiD1NiR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Apr 2022 09:38:17 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D870115A
        for <linux-media@vger.kernel.org>; Thu, 28 Apr 2022 06:35:02 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id EA56F1F745;
        Thu, 28 Apr 2022 13:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1651152900; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qanz/XQuIdO1OmNd+DubCNDUnpeUsq3UV9DMjixmjRk=;
        b=t0b3GptzJ2jpP4maCG5S3BC96QWT79PMNfc+K1E3q1kwl8yu2hc5SpJzCT++quHuA4AbtS
        veiiBwg6SQ4SzzraFHYRL8KJzUmCu1H4/BY50F2AEztvqJjB36WwvTAdsHi8xLz0Q+5rbq
        2CNi8gOegGFYiEw8RMAGuVmpRMqqYdU=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BD36813491;
        Thu, 28 Apr 2022 13:35:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id YJx8LASYamKuTAAAMHmgww
        (envelope-from <oneukum@suse.com>); Thu, 28 Apr 2022 13:35:00 +0000
From:   Oliver Neukum <oneukum@suse.com>
To:     sean@mess.org, mchehab@kernel.org, linux-media@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCH 3/3] USB: imon: drop references only after device is no longer used
Date:   Thu, 28 Apr 2022 15:34:55 +0200
Message-Id: <20220428133455.3200-3-oneukum@suse.com>
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

The point of using get/put_device() is to keep references
for as long as the device may be in use. That means dropping
them must be the penultimate action right before freeing the memory.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/media/rc/imon.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/rc/imon.c b/drivers/media/rc/imon.c
index 8dbeab48ed3c..ad8bca8a8abd 100644
--- a/drivers/media/rc/imon.c
+++ b/drivers/media/rc/imon.c
@@ -2523,7 +2523,6 @@ static void imon_disconnect(struct usb_interface *interface)
 	if (ifnum == 0) {
 		ictx->dev_present_intf0 = false;
 		usb_kill_urb(ictx->rx_urb_intf0);
-		usb_put_dev(ictx->usbdev_intf0);
 		input_unregister_device(ictx->idev);
 		rc_unregister_device(ictx->rdev);
 		if (ictx->display_supported) {
@@ -2532,14 +2531,15 @@ static void imon_disconnect(struct usb_interface *interface)
 			else if (ictx->display_type == IMON_DISPLAY_TYPE_VFD)
 				usb_deregister_dev(interface, &imon_vfd_class);
 		}
+		usb_put_dev(ictx->usbdev_intf0);
 	} else {
 		ictx->dev_present_intf1 = false;
 		usb_kill_urb(ictx->rx_urb_intf1);
-		usb_put_dev(ictx->usbdev_intf1);
 		if (ictx->display_type == IMON_DISPLAY_TYPE_VGA) {
 			del_timer_sync(&ictx->ttimer);
 			input_unregister_device(ictx->touch);
 		}
+		usb_put_dev(ictx->usbdev_intf1);
 	}
 
 	if (!ictx->dev_present_intf0 && !ictx->dev_present_intf1)
-- 
2.34.1

