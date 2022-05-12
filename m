Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2F76524E24
	for <lists+linux-media@lfdr.de>; Thu, 12 May 2022 15:22:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354332AbiELNWn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 May 2022 09:22:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354331AbiELNWk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 May 2022 09:22:40 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76EA03ED02
        for <linux-media@vger.kernel.org>; Thu, 12 May 2022 06:22:39 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 283502187F;
        Thu, 12 May 2022 13:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1652361758; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=LB97Pvfyb7dNKsTgqStQYA7fRDmG6pOEVt+HW4noAdE=;
        b=SS47XaWBOiDJyDi/am4UkTDaTY+mt1LWz8MOICU2UXpIo56dvr2vFF9qDOh6VMvM+AR4wa
        tJjwHKWVrt9RbM0oC5tcN0PHaVxNqCtvJuz8xebTvaMGqkpPDSLR75i1WFnh3x2JVByhS1
        dk52s/AEvM5ZJthKnRuiYoP7QSn4Y00=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DF9AF13ABE;
        Thu, 12 May 2022 13:22:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 8KHmNB0KfWI4MwAAMHmgww
        (envelope-from <oneukum@suse.com>); Thu, 12 May 2022 13:22:37 +0000
From:   Oliver Neukum <oneukum@suse.com>
To:     linux-media@vger.kernel.org, mchehab@kernel.org, sean@mess.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] streamzap: avoid unnecessary GFP_ATOMIC
Date:   Thu, 12 May 2022 15:22:35 +0200
Message-Id: <20220512132235.26837-1-oneukum@suse.com>
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

During resume() GFP_NOIO is enough.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/media/rc/streamzap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/rc/streamzap.c b/drivers/media/rc/streamzap.c
index 16ba85d7c090..2418bbff3d9e 100644
--- a/drivers/media/rc/streamzap.c
+++ b/drivers/media/rc/streamzap.c
@@ -406,7 +406,7 @@ static int streamzap_resume(struct usb_interface *intf)
 {
 	struct streamzap_ir *sz = usb_get_intfdata(intf);
 
-	if (usb_submit_urb(sz->urb_in, GFP_ATOMIC)) {
+	if (usb_submit_urb(sz->urb_in, GFP_NOIO)) {
 		dev_err(sz->dev, "Error submitting urb\n");
 		return -EIO;
 	}
-- 
2.35.3

