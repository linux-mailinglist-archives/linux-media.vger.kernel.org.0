Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 044DF513546
	for <lists+linux-media@lfdr.de>; Thu, 28 Apr 2022 15:35:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347308AbiD1NiX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Apr 2022 09:38:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347288AbiD1NiR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Apr 2022 09:38:17 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD827CD5
        for <linux-media@vger.kernel.org>; Thu, 28 Apr 2022 06:35:01 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 7A4D721870;
        Thu, 28 Apr 2022 13:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1651152900; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=rGry2or8ZnSvGQwINbJylSjvHJHz+Cs/k6Wvfz4ZDK4=;
        b=o6WgskfmOeQPR62kBvu6pwIvzxIkN8rJ53QmFY+3LLLhGl3CnOnS964qM+D7BZoCBciMyD
        JweWlpcZ3xtuUslcvI3JP19kyaEyif2hSmUw5MPiQX8H49BN1KMSEZ93bzB45DAutcLgFQ
        YKadUuuDYRjOSHV1NkcK/nJvRflMHPk=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4A5EB13491;
        Thu, 28 Apr 2022 13:35:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id d1N6EASYamKuTAAAMHmgww
        (envelope-from <oneukum@suse.com>); Thu, 28 Apr 2022 13:35:00 +0000
From:   Oliver Neukum <oneukum@suse.com>
To:     sean@mess.org, mchehab@kernel.org, linux-media@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCH 1/3] USB: imon: avoid needless atomic allocations in resume
Date:   Thu, 28 Apr 2022 15:34:53 +0200
Message-Id: <20220428133455.3200-1-oneukum@suse.com>
X-Mailer: git-send-email 2.34.1
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

GFP_NOIO is fine here.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/media/rc/imon.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/rc/imon.c b/drivers/media/rc/imon.c
index 54da6f60079b..761b7fa57378 100644
--- a/drivers/media/rc/imon.c
+++ b/drivers/media/rc/imon.c
@@ -2578,7 +2578,7 @@ static int imon_resume(struct usb_interface *intf)
 			usb_rx_callback_intf0, ictx,
 			ictx->rx_endpoint_intf0->bInterval);
 
-		rc = usb_submit_urb(ictx->rx_urb_intf0, GFP_ATOMIC);
+		rc = usb_submit_urb(ictx->rx_urb_intf0, GFP_NOIO);
 
 	} else {
 		usb_fill_int_urb(ictx->rx_urb_intf1, ictx->usbdev_intf1,
@@ -2588,7 +2588,7 @@ static int imon_resume(struct usb_interface *intf)
 			usb_rx_callback_intf1, ictx,
 			ictx->rx_endpoint_intf1->bInterval);
 
-		rc = usb_submit_urb(ictx->rx_urb_intf1, GFP_ATOMIC);
+		rc = usb_submit_urb(ictx->rx_urb_intf1, GFP_NOIO);
 	}
 
 	return rc;
-- 
2.34.1

