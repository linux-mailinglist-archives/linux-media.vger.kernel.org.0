Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE17B26EF55
	for <lists+linux-media@lfdr.de>; Fri, 18 Sep 2020 04:35:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728927AbgIRCN1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 22:13:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:40698 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728516AbgIRCN1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 22:13:27 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 967562389E;
        Fri, 18 Sep 2020 02:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600395206;
        bh=YTi2DVDTYY9Gzpuq/f0hpUTUJ4WQ85KgDRz9QQ36yCU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RZ2+F+rN3JRrcnkFBHsapyA4y8yGjKe2udBgn4avHxvGnpNpM6Woo+JP90kSDrfhu
         X9IBjujBTWFKvjxDt0xBYHwaJxKXKqP6LVk0wdYnZR3SM/Inr57MndV+Qqe25sLXuN
         CP2qs7Wy+jR1P6OcFsO1h2v7mfQuF/x48mJMdU9o=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Takashi Iwai <tiwai@suse.de>,
        =?UTF-8?q?Josef=20M=C3=B6llers?= <josef.moellers@suse.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 055/127] media: go7007: Fix URB type for interrupt handling
Date:   Thu, 17 Sep 2020 22:11:08 -0400
Message-Id: <20200918021220.2066485-55-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200918021220.2066485-1-sashal@kernel.org>
References: <20200918021220.2066485-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Takashi Iwai <tiwai@suse.de>

[ Upstream commit a3ea410cac41b19a5490aad7fe6d9a9a772e646e ]

Josef reported that his old-and-good Plextor ConvertX M402U video
converter spews lots of WARNINGs on the recent kernels, and it turned
out that the device uses a bulk endpoint for interrupt handling just
like 2250 board.

For fixing it, generalize the check with the proper verification of
the endpoint instead of hard-coded board type check.

Fixes: 7e5219d18e93 ("[media] go7007: Fix 2250 urb type")
Reported-and-tested-by: Josef Möllers <josef.moellers@suse.com>
BugLink: https://bugzilla.suse.com/show_bug.cgi?id=1162583
BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=206427

Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/usb/go7007/go7007-usb.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/go7007/go7007-usb.c b/drivers/media/usb/go7007/go7007-usb.c
index ed9bcaf08d5ec..ddfaabd4c0813 100644
--- a/drivers/media/usb/go7007/go7007-usb.c
+++ b/drivers/media/usb/go7007/go7007-usb.c
@@ -1052,6 +1052,7 @@ static int go7007_usb_probe(struct usb_interface *intf,
 	struct go7007_usb *usb;
 	const struct go7007_usb_board *board;
 	struct usb_device *usbdev = interface_to_usbdev(intf);
+	struct usb_host_endpoint *ep;
 	unsigned num_i2c_devs;
 	char *name;
 	int video_pipe, i, v_urb_len;
@@ -1147,7 +1148,8 @@ static int go7007_usb_probe(struct usb_interface *intf,
 	if (usb->intr_urb->transfer_buffer == NULL)
 		goto allocfail;
 
-	if (go->board_id == GO7007_BOARDID_SENSORAY_2250)
+	ep = usb->usbdev->ep_in[4];
+	if (usb_endpoint_type(&ep->desc) == USB_ENDPOINT_XFER_BULK)
 		usb_fill_bulk_urb(usb->intr_urb, usb->usbdev,
 			usb_rcvbulkpipe(usb->usbdev, 4),
 			usb->intr_urb->transfer_buffer, 2*sizeof(u16),
-- 
2.25.1

