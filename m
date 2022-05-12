Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8474524E73
	for <lists+linux-media@lfdr.de>; Thu, 12 May 2022 15:41:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354519AbiELNlx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 May 2022 09:41:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354535AbiELNlv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 May 2022 09:41:51 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 159885DE7F
        for <linux-media@vger.kernel.org>; Thu, 12 May 2022 06:41:45 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 1BB4921C75;
        Thu, 12 May 2022 13:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1652362904; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Qva2/AimS1lux9ZaJY+ZwaRaPYSNaI3e2zUqWJj9XKs=;
        b=aerY/KGW1fk+X83EszXb2uSaOftjIyRH+NtCsm/G9uxRq2wiwa/ROdEh/9WQD22Su3q1xl
        E0LG5EPHBW3Bg7/ANWowKjJhllqere7LywS2GQbdvKtrFtGxcK7oq45gIDtGrcLG1+cfL3
        /2i5H/Hv8WfrKlru4HcVbUjx66unAR0=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DE75613B35;
        Thu, 12 May 2022 13:41:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 2IZ2NJcOfWKPPAAAMHmgww
        (envelope-from <oneukum@suse.com>); Thu, 12 May 2022 13:41:43 +0000
From:   Oliver Neukum <oneukum@suse.com>
To:     linux-media@vger.kernel.org, mchehab@kernel.org, sean@mess.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCHv2 2/2] ttusbir: avoid unnecessary usb_unlink_urb()
Date:   Thu, 12 May 2022 15:41:41 +0200
Message-Id: <20220512134141.5388-2-oneukum@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220512134141.5388-1-oneukum@suse.com>
References: <20220512134141.5388-1-oneukum@suse.com>
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

While the completion handler is running,
usb_unlink_urb(9 on yourself is a NOP. Remove it.

v2: Resending due to typo in CC

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/media/rc/ttusbir.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/rc/ttusbir.c b/drivers/media/rc/ttusbir.c
index a8009dc958be..560a26f3965c 100644
--- a/drivers/media/rc/ttusbir.c
+++ b/drivers/media/rc/ttusbir.c
@@ -90,7 +90,6 @@ static void ttusbir_bulk_complete(struct urb *urb)
 	case -ECONNRESET:
 	case -ENOENT:
 	case -ESHUTDOWN:
-		usb_unlink_urb(urb);
 		return;
 	case -EPIPE:
 	default:
@@ -166,7 +165,6 @@ static void ttusbir_urb_complete(struct urb *urb)
 	case -ECONNRESET:
 	case -ENOENT:
 	case -ESHUTDOWN:
-		usb_unlink_urb(urb);
 		return;
 	case -EPIPE:
 	default:
-- 
2.35.3

