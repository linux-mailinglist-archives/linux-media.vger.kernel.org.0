Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F6B2544337
	for <lists+linux-media@lfdr.de>; Thu,  9 Jun 2022 07:36:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238456AbiFIFgu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Jun 2022 01:36:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229673AbiFIFgt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Jun 2022 01:36:49 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42A581CB
        for <linux-media@vger.kernel.org>; Wed,  8 Jun 2022 22:36:46 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2864D6CF;
        Thu,  9 Jun 2022 07:36:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1654753004;
        bh=voIl4VoQcVKKd/QudeFM7eOl6MieS+ll1+LvoszNwl8=;
        h=From:To:Cc:Subject:Date:From;
        b=cnj1UAtXJIv2IK6JsXB2qLyHvSmRuRhFYmr89bM8fTRn5XlemHOlI3IVNYSR5AFC3
         nfM/6KzlmknIFmUfDS1355W2POVkGLVIctglwTxFbEXlzd6S2koCnnjiExNzGxN57+
         fxPIKkJ0smjwXAe3tOXD5SLFktch/T6b4xWFsLSI=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH] media: uvcvideo: Replace broken URL
Date:   Thu,  9 Jun 2022 08:36:31 +0300
Message-Id: <20220609053631.7210-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The link to the web page that explains continued fractions is broken.
Replace it with a link to the corresponding Wikipedia page.

Reported-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 77ac5716f99d..20d80d810d1f 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -350,7 +350,7 @@ void uvc_simplify_fraction(u32 *numerator, u32 *denominator,
 
 	/*
 	 * Convert the fraction to a simple continued fraction. See
-	 * https://mathforum.org/dr.math/faq/faq.fractions.html
+	 * https://en.wikipedia.org/wiki/Continued_fraction
 	 * Stop if the current term is bigger than or equal to the given
 	 * threshold.
 	 */
-- 
Regards,

Laurent Pinchart

