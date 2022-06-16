Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8A5454EA66
	for <lists+linux-media@lfdr.de>; Thu, 16 Jun 2022 21:55:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377700AbiFPTzG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jun 2022 15:55:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238054AbiFPTzE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jun 2022 15:55:04 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 726A5580FF
        for <linux-media@vger.kernel.org>; Thu, 16 Jun 2022 12:55:03 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1o1va1-00021T-Pk; Thu, 16 Jun 2022 21:55:01 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1o1vZz-000vTF-Cb; Thu, 16 Jun 2022 21:55:00 +0200
Received: from mgr by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1o1vZz-00CW5i-Se; Thu, 16 Jun 2022 21:54:59 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, kernel@pengutronix.de
Subject: [PATCH] usb: uvcvideo: remove unneeded goto
Date:   Thu, 16 Jun 2022 21:54:54 +0200
Message-Id: <20220616195454.2983249-1-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The goto statement in uvc_v4l2_try_format can simply be replaced by an
direct return. There is no further user of the label, so remove it.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 26cf0517e36195..957f44f44a9a14 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -254,7 +254,7 @@ static int uvc_v4l2_try_format(struct uvc_streaming *stream,
 	ret = uvc_probe_video(stream, probe);
 	mutex_unlock(&stream->mutex);
 	if (ret < 0)
-		goto done;
+		return ret;
 
 	/* After the probe, update fmt with the values returned from
 	 * negotiation with the device. Some devices return invalid bFormatIndex
@@ -300,7 +300,6 @@ static int uvc_v4l2_try_format(struct uvc_streaming *stream,
 	if (uvc_frame != NULL)
 		*uvc_frame = frame;
 
-done:
 	return ret;
 }
 
-- 
2.30.2

