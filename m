Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB4D652A01C
	for <lists+linux-media@lfdr.de>; Tue, 17 May 2022 13:12:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234751AbiEQLLb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 May 2022 07:11:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344121AbiEQLLD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 May 2022 07:11:03 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDDBF3465C
        for <linux-media@vger.kernel.org>; Tue, 17 May 2022 04:10:53 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id EAD1F1F8A6;
        Tue, 17 May 2022 11:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1652785851; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=b0MF9CyOCIJi0mR6Mje8V+9jQJsHGG1nWsPrFtU067E=;
        b=XV/cUDuNJ5/bf2+/HYk0GX7uwzYYh7Ftax+BKwG7KdBt6TRWKi8yI/uAfWU8ioR+X7liYB
        PfDgOE/2Erovp1FlIJX5+dqezfXVcSzmuky4HXVB5W3bNINsHTBkkZ3HTPIgQDqdplPOLZ
        qhR9onGy98fuTn7lb6+/vEJ26EWfhUg=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B982913AA2;
        Tue, 17 May 2022 11:10:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id fRiWK7uCg2LjaQAAMHmgww
        (envelope-from <oneukum@suse.com>); Tue, 17 May 2022 11:10:51 +0000
From:   Oliver Neukum <oneukum@suse.com>
To:     linux-media@vger.kernel.org, mchehab@kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] as102: avoid GFP_ATOMIC
Date:   Tue, 17 May 2022 13:10:49 +0200
Message-Id: <20220517111049.25611-1-oneukum@suse.com>
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

No need for GFP_ATOMIC during probe()

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/media/usb/as102/as102_usb_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/as102/as102_usb_drv.c b/drivers/media/usb/as102/as102_usb_drv.c
index 50419e8ae56c..3c8b35dc0266 100644
--- a/drivers/media/usb/as102/as102_usb_drv.c
+++ b/drivers/media/usb/as102/as102_usb_drv.c
@@ -259,7 +259,7 @@ static int as102_alloc_usb_stream_buffer(struct as102_dev_t *dev)
 	for (i = 0; i < MAX_STREAM_URB; i++) {
 		struct urb *urb;
 
-		urb = usb_alloc_urb(0, GFP_ATOMIC);
+		urb = usb_alloc_urb(0, GFP_KERNEL);
 		if (urb == NULL) {
 			as102_free_usb_stream_buffer(dev);
 			return -ENOMEM;
-- 
2.35.3

