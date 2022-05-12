Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 800FF524CEE
	for <lists+linux-media@lfdr.de>; Thu, 12 May 2022 14:34:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353803AbiELMeD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 May 2022 08:34:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353807AbiELMeB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 May 2022 08:34:01 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B5E6644D1
        for <linux-media@vger.kernel.org>; Thu, 12 May 2022 05:33:59 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 858D21F8F7;
        Thu, 12 May 2022 12:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1652358838; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dOSpqB3pLDS6sMKSpThZSIaP5oLpMXTeavYUI6S8mW8=;
        b=BMa7c+uQOEtVa/VzlLhxhM+ECdKhIZrNghJVZGfCtwPi2LsCmi/yR9C6AO5ze3mRLPOdRr
        0wCp7CX2Ph1Qc8TMNSyvMLPgUMgD4s/vT32sNFTCCPIYl97SRrVP97lZeF5hd+dbN3Dlwf
        7kHB2aGmDWPlW9UcfK7q9jS87qMA/VQ=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4C09A13ABE;
        Thu, 12 May 2022 12:33:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id MGQFEbb+fGL+GAAAMHmgww
        (envelope-from <oneukum@suse.com>); Thu, 12 May 2022 12:33:58 +0000
From:   Oliver Neukum <oneukum@suse.com>
To:     linux-media@vger.kernel.org, mchehab@kernel.org, sean@mess.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCH 3/3] igorplugusb: remove superfluous usb_unlink_urb()
Date:   Thu, 12 May 2022 14:33:54 +0200
Message-Id: <20220512123354.25766-3-oneukum@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220512123354.25766-1-oneukum@suse.com>
References: <20220512123354.25766-1-oneukum@suse.com>
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

Calling that on yourself while the completion handler
is running is a NOP. Remove it.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/media/rc/igorplugusb.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/rc/igorplugusb.c b/drivers/media/rc/igorplugusb.c
index b2245849f7aa..12ee5dd0a61a 100644
--- a/drivers/media/rc/igorplugusb.c
+++ b/drivers/media/rc/igorplugusb.c
@@ -110,7 +110,6 @@ static void igorplugusb_callback(struct urb *urb)
 	case -ECONNRESET:
 	case -ENOENT:
 	case -ESHUTDOWN:
-		usb_unlink_urb(urb);
 		return;
 	default:
 		dev_warn(ir->dev, "Error: urb status = %d\n", urb->status);
-- 
2.35.3

