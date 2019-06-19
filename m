Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52F464B380
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2019 09:59:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731063AbfFSH7q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Jun 2019 03:59:46 -0400
Received: from resqmta-ch2-10v.sys.comcast.net ([69.252.207.42]:53904 "EHLO
        resqmta-ch2-10v.sys.comcast.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725946AbfFSH7q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Jun 2019 03:59:46 -0400
Received: from resomta-ch2-08v.sys.comcast.net ([69.252.207.104])
        by resqmta-ch2-10v.sys.comcast.net with ESMTP
        id dVPyhD9Dv8ekNdVQphZW5m; Wed, 19 Jun 2019 07:54:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
        s=20190202a; t=1560930899;
        bh=jP5FlzmBz0gabNl7H3NPBrPVWTIIU7pNFFw3I8Wh1yE=;
        h=Received:Received:Subject:To:From:Message-ID:Date:MIME-Version:
         Content-Type;
        b=6Mb72ftWnfOgDc7YusPB06tq5k52btRD0293Zl47QLv3vjVPJ3g4//pZev1k8xNCu
         GLs0ajPWsqip7t2JYaYroIT8q1T1EyDgh//RQq2GuX7Xo4j5COd+Egulx5I3WxgtTu
         nkLasMGXSEX4yTJ3/wBdo0ylUyRbWGEtwBR/h9zPW37biHBvYnsCbmAn/RJcnemQV8
         dHo0NJDCKYBgIrXwi10XkimG0iSWKZC1a8zkSZRH4Tp5W0zXJ3XXE9n1il84kVPu6S
         JB7q56MNFjw+KBamPQmQqC8eN+nQFcaectm0HEc+R3FyQ3m+s0jl/9inxs5LiV0DPz
         qwNsfPhcanNpg==
Received: from [192.168.4.4] ([73.248.220.215])
        by resomta-ch2-08v.sys.comcast.net with ESMTPA
        id dVQohMi6gjGx4dVQphQdRd; Wed, 19 Jun 2019 07:54:59 +0000
X-Xfinity-VAAS: gggruggvucftvghtrhhoucdtuddrgeduvddrtddugdduvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuvehomhgtrghsthdqtfgvshhipdfqfgfvpdfpqffurfetoffkrfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthejredttdefjeenucfhrhhomheptecuufhunhcuoegrshdutdeffeigsegtohhmtggrshhtrdhnvghtqeenucfkphepjeefrddvgeekrddvvddtrddvudehnecurfgrrhgrmhephhgvlhhopegludelvddrudeikedrgedrgegnpdhinhgvthepjeefrddvgeekrddvvddtrddvudehpdhmrghilhhfrhhomheprghsuddtfeefgiestghomhgtrghsthdrnhgvthdprhgtphhtthhopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshgvrghnsehmvghsshdrohhrghenucevlhhushhtvghrufhiiigvpedt
X-Xfinity-VMeta: sc=-100;st=legit
Subject: [PATCH v2 3/3] [media] mceusb: Show USB halt/stall error recovery
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <999ae5cd-d72b-983f-2f96-5aaca72e8214@comcast.net>
 <43f4ef6e-2c64-cd7a-26f7-3c1309b68936@comcast.net>
 <20190606095337.jfhmc6jqgyhmxn4q@gofer.mess.org>
 <2548e827-1d11-4ce2-013f-bf36c9f5436e@comcast.net>
 <20190608083729.bw47vkplpf3r4e4b@gofer.mess.org>
From:   A Sun <as1033x@comcast.net>
Message-ID: <2e8059be-d6ec-f649-356e-3f3b3095e6ec@comcast.net>
Date:   Wed, 19 Jun 2019 03:54:53 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190608083729.bw47vkplpf3r4e4b@gofer.mess.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


patch v2 revisions:
 . Limit patch to message changes only.

Update dev_err() messages to report status (including success) for each
step of USB RX HALT and TX HALT error recovery. If error recovery fails,
show the message:
        stuck RX HALT state requires USB Reset Device to clear
or
        stuck TX HALT state requires USB Reset Device to clear

This patch only affects RX and TX HALT error reporting.

The capability for mceusb to invoke USB reset device for itself is
deferred to a future patch. It's unsafe to perform usb_reset_device()
when and where the driver posts the "... requires USB Reset ..."
message.

Users can fix their mceusb device manually by issuing
ioctl(fd, USBDEVFS_RESET, 0) to the mceusb device, as in:
        $ sudo ./usbreset /dev/bus/usb/001/010

---

As seen on very rare occasions with mceusb device 2304:0225
        [59388.696941] mceusb 1-1.1.2:1.0: Error: urb status = -32 (RX HALT)
        [59388.698838] mceusb 1-1.1.2:1.0: rx clear halt error -32
the device can get into RX or TX HALT state where usb_clear_halt()
also fails and also returns -EPIPE (HALT/STALL). After which,
all further mceusb device control and data I/O fails with HALT/STALL.
Cause and problem replication conditions are still unknown.

Further troubleshooting revealed that usb_reset_device() successfully
restores mceusb device operation.

Of note is "modprobe -r mceusb" with "modprobe mceusb"
usb_reset_endpoint(), and usb_reset_configuration(), were all
unsuccessful.

Signed-off-by: A Sun <as1033x@comcast.net>
---
 drivers/media/rc/mceusb.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/media/rc/mceusb.c b/drivers/media/rc/mceusb.c
index efffb1795..fffd826c6 100644
--- a/drivers/media/rc/mceusb.c
+++ b/drivers/media/rc/mceusb.c
@@ -765,7 +765,7 @@ static void mceusb_defer_kevent(struct mceusb_dev *ir, int kevent)
 {
 	set_bit(kevent, &ir->kevent_flags);
 	if (!schedule_work(&ir->kevent))
-		dev_err(ir->dev, "kevent %d may have been dropped", kevent);
+		dev_dbg(ir->dev, "kevent %d already scheduled", kevent);
 	else
 		dev_dbg(ir->dev, "kevent %d scheduled", kevent);
 }
@@ -1404,19 +1404,27 @@ static void mceusb_deferred_kevent(struct work_struct *work)
 		container_of(work, struct mceusb_dev, kevent);
 	int status;
 
+	dev_err(ir->dev, "kevent handler called (flags 0x%lx)",
+		ir->kevent_flags);
+
 	if (test_bit(EVENT_RX_HALT, &ir->kevent_flags)) {
 		usb_unlink_urb(ir->urb_in);
 		status = usb_clear_halt(ir->usbdev, ir->pipe_in);
+		dev_err(ir->dev, "rx clear halt status = %d", status);
 		if (status < 0) {
-			dev_err(ir->dev, "rx clear halt error %d",
-				status);
+			/*
+			 * Unable to clear RX halt/stall.
+			 * Will need to call usb_reset_device().
+			 */
+			dev_err(ir->dev,
+				"stuck RX HALT state requires USB Reset Device to clear");
 		}
 		clear_bit(EVENT_RX_HALT, &ir->kevent_flags);
 		if (status == 0) {
 			status = usb_submit_urb(ir->urb_in, GFP_KERNEL);
 			if (status < 0) {
 				dev_err(ir->dev,
-					"rx unhalt submit urb error %d",
+					"rx unhalt submit urb error = %d",
 					status);
 			}
 		}
@@ -1424,8 +1432,15 @@ static void mceusb_deferred_kevent(struct work_struct *work)
 
 	if (test_bit(EVENT_TX_HALT, &ir->kevent_flags)) {
 		status = usb_clear_halt(ir->usbdev, ir->pipe_out);
-		if (status < 0)
-			dev_err(ir->dev, "tx clear halt error %d", status);
+		dev_err(ir->dev, "tx clear halt status = %d", status);
+		if (status < 0) {
+			/*
+			 * Unable to clear TX halt/stall.
+			 * Will need to call usb_reset_device().
+			 */
+			dev_err(ir->dev,
+				"stuck TX HALT state requires USB Reset Device to clear");
+		}
 		clear_bit(EVENT_TX_HALT, &ir->kevent_flags);
 	}
 }
-- 
2.11.0

