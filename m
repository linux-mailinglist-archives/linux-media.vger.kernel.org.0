Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAC352FF5F2
	for <lists+linux-media@lfdr.de>; Thu, 21 Jan 2021 21:35:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726355AbhAUUdl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jan 2021 15:33:41 -0500
Received: from mx2.suse.de ([195.135.220.15]:36520 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727102AbhAUUaA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jan 2021 15:30:00 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id C4D1FABDA;
        Thu, 21 Jan 2021 20:29:01 +0000 (UTC)
From:   Takashi Iwai <tiwai@suse.de>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: pwc: Fix the URB buffer allocation
Date:   Thu, 21 Jan 2021 21:28:55 +0100
Message-Id: <20210121202855.17400-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The URB buffer allocation of pwc driver involves with the
dma_map_single(), and it needs to pass the right device.  Currently it
passes usb_device.dev, but it's no real device that manages the DMA.
Since the passed device has no DMA mask set up, now the pwc driver
hits the WARN_ON_ONCE() check in dma_map_page_attrs() (that was
introduced in 5.10), resulting in an error at URB allocations.
Eventually this ended up with the black output.

This patch fixes the bug by passing the proper device, the bus
controller, to make the URB allocation and map working again.

BugLink: https://bugzilla.suse.com/show_bug.cgi?id=1181133
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/media/usb/pwc/pwc-if.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/pwc/pwc-if.c b/drivers/media/usb/pwc/pwc-if.c
index 61869636ec61..d771160bb168 100644
--- a/drivers/media/usb/pwc/pwc-if.c
+++ b/drivers/media/usb/pwc/pwc-if.c
@@ -461,7 +461,7 @@ static int pwc_isoc_init(struct pwc_device *pdev)
 		urb->pipe = usb_rcvisocpipe(udev, pdev->vendpoint);
 		urb->transfer_flags = URB_ISO_ASAP | URB_NO_TRANSFER_DMA_MAP;
 		urb->transfer_buffer_length = ISO_BUFFER_SIZE;
-		urb->transfer_buffer = pwc_alloc_urb_buffer(&udev->dev,
+		urb->transfer_buffer = pwc_alloc_urb_buffer(udev->bus->controller,
 							    urb->transfer_buffer_length,
 							    &urb->transfer_dma);
 		if (urb->transfer_buffer == NULL) {
@@ -524,7 +524,7 @@ static void pwc_iso_free(struct pwc_device *pdev)
 		if (urb) {
 			PWC_DEBUG_MEMORY("Freeing URB\n");
 			if (urb->transfer_buffer)
-				pwc_free_urb_buffer(&urb->dev->dev,
+				pwc_free_urb_buffer(urb->dev->bus->controller,
 						    urb->transfer_buffer_length,
 						    urb->transfer_buffer,
 						    urb->transfer_dma);
-- 
2.26.2

