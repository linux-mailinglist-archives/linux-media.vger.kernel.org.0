Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF3CD7D04B7
	for <lists+linux-media@lfdr.de>; Fri, 20 Oct 2023 00:24:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235542AbjJSWYj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Oct 2023 18:24:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231238AbjJSWYi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Oct 2023 18:24:38 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A85CF115
        for <linux-media@vger.kernel.org>; Thu, 19 Oct 2023 15:24:31 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5C3BB10A;
        Fri, 20 Oct 2023 00:24:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1697754255;
        bh=vaWj0kMSqseaBTcldUWldrvr7bo9q3M16DQPb1Xfz1M=;
        h=From:To:Cc:Subject:Date:From;
        b=gCXDMgvSoZszVzxwMK+SAK+QPBtus2zhYNMWRM+Tv9xZnf90U+vPiYeW4n0biM0v/
         2CSmgPEfr2LzUiQ46D0zHpdmVsDrPSTUNXk1zr1C7tVT7RswRBMakf7LrjL3usMGM0
         shoRJ15orC/YBpeGlsacwZJxd4rX9vriA7qUxtrY=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Karel Janda <karel1@tutanota.com>,
        Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH] media: uvcvideo: Pick first best alternate setting insteed of last
Date:   Fri, 20 Oct 2023 01:24:30 +0300
Message-ID: <20231019222430.17043-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When selecting an alternate setting, the driver loops over all available
alternate settings to find the one with the lowest bandwidth high enough
for the selected format and resolution. While all alternate settings
should have different packet sizes, some buggy devices report multiple
alternate settings with the same size. The driver happens to pick the
last one in this case.

In theory this should work fine, but in real life we have device bugs.
The Ali Corp. Newmine Camera (0402:8841) exposes four alternate
settings with the same packet size. The first three seem to work fine,
while selecting the last one results in lots of transmission errors.

Switch to using the first best alternate setting when multiple are
present. This should be safe (last famous words), as sniffing USB
traffic with the faulty device shows that Windows 10 picks the first
alternate setting, and devices are typically tested on Windows.

Reported-by: Karel Janda <karel1@tutanota.com>
Closes: https://lore.kernel.org/linux-media/Nh6D0WI--3-9@tutanota.com/
Suggested-by: Karel Janda <karel1@tutanota.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Karel, could you please test this patch ? Please also let me know if you
are fine having your name recorded in the kernel git history with the
Reported-by and Suggested-by tags above. If not, I will drop them.
---
 drivers/media/usb/uvc/uvc_video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 28dde08ec6c5..7cbf4692bd87 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1954,7 +1954,7 @@ static int uvc_video_start_transfer(struct uvc_streaming *stream,
 
 			/* Check if the bandwidth is high enough. */
 			psize = uvc_endpoint_max_bpi(stream->dev->udev, ep);
-			if (psize >= bandwidth && psize <= best_psize) {
+			if (psize >= bandwidth && psize < best_psize) {
 				altsetting = alts->desc.bAlternateSetting;
 				best_psize = psize;
 				best_ep = ep;
-- 
Regards,

Laurent Pinchart

