Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 706F152A2D7
	for <lists+linux-media@lfdr.de>; Tue, 17 May 2022 15:12:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347299AbiEQNMW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 May 2022 09:12:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347841AbiEQNLS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 May 2022 09:11:18 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54C94CE27
        for <linux-media@vger.kernel.org>; Tue, 17 May 2022 06:11:13 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 0D0D621BDC;
        Tue, 17 May 2022 13:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1652793072; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=XNtzrKQIRs4jXOmw6zlq9nxTzRLmvC7+f7PLdykTkGs=;
        b=UmGrgNWLS/bd1RQm2eoPuCy8Eq817vPsGTG1YCDSHX7la0a4i+GQ6w5ivKKlcOHRO9lJZe
        4A3HxksqH+jWXI7lJNvH0SbM9vGivISggnxmmLUu3SsFBwVpwqUUhLOCMwdenf74RD5fH8
        jC/g5YLzzVTka9HfwVfILXtPfDMaFU0=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C47FF13AA2;
        Tue, 17 May 2022 13:11:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id RQkHLu+eg2KzKwAAMHmgww
        (envelope-from <oneukum@suse.com>); Tue, 17 May 2022 13:11:11 +0000
From:   Oliver Neukum <oneukum@suse.com>
To:     linux-media@vger.kernel.org, gushengxian@yulong.com,
        johan@kernel.org, hverkuil-cisco@xs4all.nl, mchehab@kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCH 1/2] flexcop: unneeded ATOMIC
Date:   Tue, 17 May 2022 15:11:08 +0200
Message-Id: <20220517131109.28371-1-oneukum@suse.com>
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
 drivers/media/usb/b2c2/flexcop-usb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/b2c2/flexcop-usb.c b/drivers/media/usb/b2c2/flexcop-usb.c
index 7835bb0f32fc..98d9912a4efb 100644
--- a/drivers/media/usb/b2c2/flexcop-usb.c
+++ b/drivers/media/usb/b2c2/flexcop-usb.c
@@ -446,7 +446,7 @@ static int flexcop_usb_transfer_init(struct flexcop_usb *fc_usb)
 	/* creating iso urbs */
 	for (i = 0; i < B2C2_USB_NUM_ISO_URB; i++) {
 		fc_usb->iso_urb[i] = usb_alloc_urb(B2C2_USB_FRAMES_PER_ISO,
-			GFP_ATOMIC);
+			GFP_KERNEL);
 		if (fc_usb->iso_urb[i] == NULL) {
 			ret = -ENOMEM;
 			goto urb_error;
@@ -479,7 +479,7 @@ static int flexcop_usb_transfer_init(struct flexcop_usb *fc_usb)
 			frame_offset += frame_size;
 		}
 
-		if ((ret = usb_submit_urb(fc_usb->iso_urb[i],GFP_ATOMIC))) {
+		if ((ret = usb_submit_urb(fc_usb->iso_urb[i],GFP_KERNEL))) {
 			err("submitting urb %d failed with %d.", i, ret);
 			goto urb_error;
 		}
-- 
2.35.3

