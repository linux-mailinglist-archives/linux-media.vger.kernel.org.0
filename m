Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FAF9524E74
	for <lists+linux-media@lfdr.de>; Thu, 12 May 2022 15:41:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354527AbiELNly (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 May 2022 09:41:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354534AbiELNlv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 May 2022 09:41:51 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1563F5AEF3
        for <linux-media@vger.kernel.org>; Thu, 12 May 2022 06:41:45 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id E542521C46;
        Thu, 12 May 2022 13:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1652362903; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=TBogSLbrzDheDl9JWtJlE531/TnT1oqPt1a4DyEmp/I=;
        b=r4vWdfOak3IaHO3yq8sHMosQy5F+ndPApwIbvgwFLwJLG27MVvUwrsCFOrtaKSK3aLjgTF
        s79TWNvH6A78eioV52wW6fy7Zt7a7wJdPYKmUQdo0mldkOzJ+336eHzj9lo0dpMVcDo1ew
        8SVG0E3DYF9ytKGAxvYV/OcEZUHNbI4=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 99BB513A84;
        Thu, 12 May 2022 13:41:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id OCwyI5cOfWKPPAAAMHmgww
        (envelope-from <oneukum@suse.com>); Thu, 12 May 2022 13:41:43 +0000
From:   Oliver Neukum <oneukum@suse.com>
To:     linux-media@vger.kernel.org, mchehab@kernel.org, sean@mess.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCHv2 1/2] ttusbir: NOIO during resume
Date:   Thu, 12 May 2022 15:41:40 +0200
Message-Id: <20220512134141.5388-1-oneukum@suse.com>
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

During resume we must assume tat devices are
not ready for block IO. Use GFP_NOIO.

v2: Resending due to typo in CC

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/media/rc/ttusbir.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/rc/ttusbir.c b/drivers/media/rc/ttusbir.c
index 629787d53ee1..a8009dc958be 100644
--- a/drivers/media/rc/ttusbir.c
+++ b/drivers/media/rc/ttusbir.c
@@ -402,7 +402,7 @@ static int ttusbir_resume(struct usb_interface *intf)
 	led_classdev_resume(&tt->led);
 
 	for (i = 0; i < NUM_URBS; i++) {
-		rc = usb_submit_urb(tt->urb[i], GFP_KERNEL);
+		rc = usb_submit_urb(tt->urb[i], GFP_NOIO);
 		if (rc) {
 			dev_warn(tt->dev, "failed to submit urb: %d\n", rc);
 			break;
-- 
2.35.3

