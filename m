Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C8D77522D7
	for <lists+linux-media@lfdr.de>; Thu, 13 Jul 2023 15:05:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235132AbjGMNFB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jul 2023 09:05:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234205AbjGMNDp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Jul 2023 09:03:45 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A293E19BC;
        Thu, 13 Jul 2023 06:03:44 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 6133C1FD8B;
        Thu, 13 Jul 2023 13:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1689253423; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=X5e2EtC7tX/wjDBrtMR31UpAoX+1Wcwuu8ylwF2hDzw=;
        b=ljuqTdK+pyLCCWZlSJiCoSIze5kUH/vlBsXi7alQcYfj6LHV/glZ/Bd8nhoffzKnlG7nG5
        E7nMM5XDU6nKCvlODnaGiV5VQJfTyhX2ZRg0h0gUW1FoBfeO03LprOPZtqGWrm9OVR2xPF
        4OTrSn1/K/wI86kikfQ0eEiT22j4aBU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1689253423;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=X5e2EtC7tX/wjDBrtMR31UpAoX+1Wcwuu8ylwF2hDzw=;
        b=PJJxSgJlUZYLv6zPx3pYAuTdEkwJEjbsDRhzp+IGQHNzW5wkGANmKpDY/e7rXTnsjJXy9E
        ERWd0lw76m9ESzDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 03D4D13489;
        Thu, 13 Jul 2023 13:03:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id WIwCAC/2r2TVPgAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Thu, 13 Jul 2023 13:03:42 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     deller@gmx.de, javierm@redhat.com
Cc:     linux-sh@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
        linux-input@vger.kernel.org, linux-media@vger.kernel.org,
        linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-geode@lists.infradead.org, linux-nvidia@lists.surfsouth.com,
        linux-hyperv@vger.kernel.org, linux-omap@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 04/18] fbdev: Remove flag FBINFO_DEFAULT from fbdev drivers
Date:   Thu, 13 Jul 2023 14:58:24 +0200
Message-ID: <20230713130338.31086-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230713130338.31086-1-tzimmermann@suse.de>
References: <20230713130338.31086-1-tzimmermann@suse.de>
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

The flag FBINFO_DEFAULT is 0 and has no effect, as struct fbinfo.flags
has been allocated to zero by devm_kzalloc(). So do not set it.

Flags should signal differences from the default values. After cleaning
up all occurrences of FBINFO_DEFAULT, the token will be removed.

v2:
	* fix commit message (Miguel)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Helge Deller <deller@gmx.de>
---
 drivers/video/fbdev/pxafb.c    | 1 -
 drivers/video/fbdev/sa1100fb.c | 1 -
 drivers/video/fbdev/wm8505fb.c | 3 +--
 drivers/video/fbdev/xilinxfb.c | 1 -
 4 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/pxafb.c b/drivers/video/fbdev/pxafb.c
index 2a8b1dea3a67..c8c4677d06b4 100644
--- a/drivers/video/fbdev/pxafb.c
+++ b/drivers/video/fbdev/pxafb.c
@@ -1826,7 +1826,6 @@ static struct pxafb_info *pxafb_init_fbinfo(struct device *dev,
 	fbi->fb.var.vmode	= FB_VMODE_NONINTERLACED;
 
 	fbi->fb.fbops		= &pxafb_ops;
-	fbi->fb.flags		= FBINFO_DEFAULT;
 	fbi->fb.node		= -1;
 
 	addr = fbi;
diff --git a/drivers/video/fbdev/sa1100fb.c b/drivers/video/fbdev/sa1100fb.c
index a2408bf00ca0..3d76ce111488 100644
--- a/drivers/video/fbdev/sa1100fb.c
+++ b/drivers/video/fbdev/sa1100fb.c
@@ -1089,7 +1089,6 @@ static struct sa1100fb_info *sa1100fb_init_fbinfo(struct device *dev)
 	fbi->fb.var.vmode	= FB_VMODE_NONINTERLACED;
 
 	fbi->fb.fbops		= &sa1100fb_ops;
-	fbi->fb.flags		= FBINFO_DEFAULT;
 	fbi->fb.monspecs	= monspecs;
 	fbi->fb.pseudo_palette	= fbi->pseudo_palette;
 
diff --git a/drivers/video/fbdev/wm8505fb.c b/drivers/video/fbdev/wm8505fb.c
index 10a8b1250103..5833147aa43d 100644
--- a/drivers/video/fbdev/wm8505fb.c
+++ b/drivers/video/fbdev/wm8505fb.c
@@ -285,8 +285,7 @@ static int wm8505fb_probe(struct platform_device *pdev)
 	fbi->fb.fix.accel	= FB_ACCEL_NONE;
 
 	fbi->fb.fbops		= &wm8505fb_ops;
-	fbi->fb.flags		= FBINFO_DEFAULT
-				| FBINFO_HWACCEL_COPYAREA
+	fbi->fb.flags		= FBINFO_HWACCEL_COPYAREA
 				| FBINFO_HWACCEL_FILLRECT
 				| FBINFO_HWACCEL_XPAN
 				| FBINFO_HWACCEL_YPAN
diff --git a/drivers/video/fbdev/xilinxfb.c b/drivers/video/fbdev/xilinxfb.c
index 2aa3a528277f..768a281a8d2c 100644
--- a/drivers/video/fbdev/xilinxfb.c
+++ b/drivers/video/fbdev/xilinxfb.c
@@ -324,7 +324,6 @@ static int xilinxfb_assign(struct platform_device *pdev,
 	drvdata->info.fix.line_length = pdata->xvirt * BYTES_PER_PIXEL;
 
 	drvdata->info.pseudo_palette = drvdata->pseudo_palette;
-	drvdata->info.flags = FBINFO_DEFAULT;
 	drvdata->info.var = xilinx_fb_var;
 	drvdata->info.var.height = pdata->screen_height_mm;
 	drvdata->info.var.width = pdata->screen_width_mm;
-- 
2.41.0

