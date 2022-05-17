Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B534C52A222
	for <lists+linux-media@lfdr.de>; Tue, 17 May 2022 14:55:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242248AbiEQMyz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 May 2022 08:54:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243754AbiEQMyx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 May 2022 08:54:53 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40C1D4D24D
        for <linux-media@vger.kernel.org>; Tue, 17 May 2022 05:54:51 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 013221F8B3;
        Tue, 17 May 2022 12:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1652792090; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=O+9mtNz4QsFjc69uuVeUeTSprxMfYIwHbv0ZfYgpkeU=;
        b=AYCIhll4XdoXy4nF0vX/GaAxicu6bYfT+F2YbIR0rxWAlgzzKwG/2rXkVdgK5d6TBq2l/1
        z3ikiLI+c88ViTnVP/f2u11oefHrWMy+fgIDAGkha0MGlwQ1lZH3x758goG6FwZ3S15ZN0
        FSLqACiSW6DEJstB1KENF1lJmQobxqI=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BE7FF13AA2;
        Tue, 17 May 2022 12:54:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id NXDLLBmbg2KTIgAAMHmgww
        (envelope-from <oneukum@suse.com>); Tue, 17 May 2022 12:54:49 +0000
From:   Oliver Neukum <oneukum@suse.com>
To:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl,
        dan.carpenter@oracle.com, mchehab@kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] au0828: allow higher speeds
Date:   Tue, 17 May 2022 14:54:47 +0200
Message-Id: <20220517125447.19535-1-oneukum@suse.com>
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

This should be taken as a minimum speed.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/media/usb/au0828/au0828-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/au0828/au0828-core.c b/drivers/media/usb/au0828/au0828-core.c
index caefac07af92..963ed0630121 100644
--- a/drivers/media/usb/au0828/au0828-core.c
+++ b/drivers/media/usb/au0828/au0828-core.c
@@ -669,7 +669,7 @@ static int au0828_usb_probe(struct usb_interface *interface,
 	 * video stream wouldn't likely work, since 12 Mbps is generally
 	 * not enough even for most Digital TV streams.
 	 */
-	if (usbdev->speed != USB_SPEED_HIGH && disable_usb_speed_check == 0) {
+	if (usbdev->speed < USB_SPEED_HIGH && disable_usb_speed_check == 0) {
 		pr_err("au0828: Device initialization failed.\n");
 		pr_err("au0828: Device must be connected to a high-speed USB 2.0 port.\n");
 		return -ENODEV;
-- 
2.35.3

