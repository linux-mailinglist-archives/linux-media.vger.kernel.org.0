Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C82732128
	for <lists+linux-media@lfdr.de>; Sun,  2 Jun 2019 01:39:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726587AbfFAXjn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Jun 2019 19:39:43 -0400
Received: from resqmta-po-02v.sys.comcast.net ([96.114.154.161]:50962 "EHLO
        resqmta-po-02v.sys.comcast.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726211AbfFAXjn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 1 Jun 2019 19:39:43 -0400
Received: from resomta-po-14v.sys.comcast.net ([96.114.154.238])
        by resqmta-po-02v.sys.comcast.net with ESMTP
        id XDDHhbgBYe2GbXDWahSq7o; Sat, 01 Jun 2019 23:34:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
        s=20190202a; t=1559432096;
        bh=+pSxTgpii/45NdX7PfQR4ak1is59c8lZ4lY6ef7EQAU=;
        h=Received:Received:From:Subject:To:Message-ID:Date:MIME-Version:
         Content-Type;
        b=ZVN64Ibfa9ZXpIsyGbNSAKH84r2ACSFdb45ESLjx+F1rNfkl4Tk8KZuUPtnvpVxd8
         K8MfKcLmF+wChYeJvjsWiIIe1A5qYM+3v/zAj4HYpLT2curaaK0zVm5W6U1n4z3MSv
         SS0ShZTrF2K7IA8Kh6jo+jRav77vGRaynasiRc0hWzJyMv2rpYu/lPlYyNfxYUoKW+
         Qun/b15enQ/HjV2Ad+fmUpMnShHMs+8i901BjjyNDW4s8+Twut3SfFGHdFrxkwuMoQ
         jUc37Qq9v7igy7/VTGADo2K70hDV8FYEbcn9j5duqoganQzQcwHQprcf3eaPf0XuUb
         6UBV4+LIaP/uw==
Received: from [192.168.4.4] ([73.248.220.215])
        by resomta-po-14v.sys.comcast.net with ESMTPA
        id XDWZhrEBiaUYaXDWZhaigk; Sat, 01 Jun 2019 23:34:56 +0000
X-Xfinity-VAAS: gggruggvucftvghtrhhoucdtuddrgeduuddrudefgedgvdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuvehomhgtrghsthdqtfgvshhipdfqfgfvpdfpqffurfetoffkrfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffuvfhfkffffgggjggtgfesthejredttdefjeenucfhrhhomheptecuufhunhcuoegrshdutdeffeigsegtohhmtggrshhtrdhnvghtqeenucffohhmrghinhepuhgsuhhnthhufhhorhhumhhsrdhorhhgnecukfhppeejfedrvdegkedrvddvtddrvdduheenucfrrghrrghmpehhvghloheplgduledvrdduieekrdegrdegngdpihhnvghtpeejfedrvdegkedrvddvtddrvdduhedpmhgrihhlfhhrohhmpegrshdutdeffeigsegtohhmtggrshhtrdhnvghtpdhrtghpthhtohepmhgthhgvhhgrsgesohhsghdrshgrmhhsuhhnghdrtghomhdprhgtphhtthhopehsvggrnhesmhgvshhsrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedt
X-Xfinity-VMeta: sc=-100;st=legit
From:   A Sun <as1033x@comcast.net>
Subject: [PATCH v1 3/3] [media] mceusb: Show USB halt/stall error recovery
To:     linux-media@vger.kernel.org
Cc:     Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@osg.samsung.com>
References: <999ae5cd-d72b-983f-2f96-5aaca72e8214@comcast.net>
Message-ID: <43f4ef6e-2c64-cd7a-26f7-3c1309b68936@comcast.net>
Date:   Sat, 1 Jun 2019 19:35:09 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <999ae5cd-d72b-983f-2f96-5aaca72e8214@comcast.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Update dev_err() messages to report status (including success) for each
step of USB RX HALT and TX HALT error recovery. If error recovery fails,
show the message:
        stuck RX HALT state requires USB Reset Device to clear
or
        stuck TX HALT state requires USB Reset Device to clear

This and related message revisions pertain to functions:
        mceusb_defer_kevent()           error handler dispatcher
        mceusb_deferred_kevent()        error handler itself

This patch just affects RX and TX HALT error handling and recovery
reporting.

A possible future patch may enable the mceusb driver to attempt
itself usb_reset_device() when necessary.

---

As seen on very rare occasions with mceusb device 2304:0225
        [59388.696941] mceusb 1-1.1.2:1.0: Error: urb status = -32 (RX HALT)
        [59388.698838] mceusb 1-1.1.2:1.0: rx clear halt error -32
the device can get into RX or TX HALT state where usb_clear_halt()
also fails and also returns -EPIPE (HALT/STALL). After which,
all further mceusb device control and data I/O fails with HALT/STALL.
Cause and problem replication conditions are still unknown.

As seen in https://ubuntuforums.org/showthread.php?t=2406882
        ...
        mceusb 2-1.4:1.0: Error: urb status = -32 (RX HALT)
        ...
for an unknown mceusb device, usb_clear_halt() apparently can return
false success. After which, RX HALT immediately reoccurs resulting in
a RX halt and clear halt infinite loop and message flooding. Again,
cause and problem replication conditions remain unknown.

After observing a rx clear halt fault with mceusb 2304:0225, further
troubleshooting reveals usb_reset_device() is able to restore device
functionality.
        $ lsusb
        Bus 001 Device 010: ID 2304:0225 Pinnacle Systems, Inc. Remote Kit Infrared Transceiver
        ...
        $ sudo ./usbreset /dev/bus/usb/001/010  # ioctl(fd, USBDEVFS_RESET, 0);
        Resetting USB device /dev/bus/usb/001/010
        Reset successful
        $ dmesg
        ...
        [272392.540679] usb 1-1.2.7: reset full-speed USB device number 10 using dwc_otg
        [272392.676616] Registered IR keymap rc-rc6-mce
        ...
        [272392.678313] rc rc0: lirc_dev: driver ir-lirc-codec (mceusb) registered at minor = 0
        [272392.678616] mceusb 1-1.2.7:1.0: long-range (0x1) receiver active
        [272392.940671] mceusb 1-1.2.7:1.0: Registered Pinnacle Systems PCTV Remote USB with mce emulator interface version 1
        [272392.940687] mceusb 1-1.2.7:1.0: 2 tx ports (0x3 cabled) and 2 rx sensors (0x1 active)
        ...

Additional findings are "modprobe -r mceusb" and "modprobe mceusb"
are unable to clear stuck RX or TX HALT state.
Attempts to call usb_reset_endpoint() and usb_reset_configuration()
from within the mceusb driver also did not clear stuck HALTs.

A possible future patch could have the mceusb call usb_reset_device()
on itself, when necessary. Limiting the number of HALT error recovery
attempts may also be necessary to prevent halt/clear-halt loops.

Unresolved for now, deadlock complications occur if mceusb's worker
thread, mceusb_deferred_kevent(), calls usb_reset_device(),
which calls mceusb_dev_disconnect(), which calls cancel_work_sync(),
which waits on the still active worker thread.

Signed-off-by: A Sun <as1033x@comcast.net>
---
 drivers/media/rc/mceusb.c | 35 +++++++++++++++++++++++++----------
 1 file changed, 25 insertions(+), 10 deletions(-)

diff --git a/drivers/media/rc/mceusb.c b/drivers/media/rc/mceusb.c
index efffb1795..5d81ccafc 100644
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
@@ -1404,19 +1404,26 @@ static void mceusb_deferred_kevent(struct work_struct *work)
 		container_of(work, struct mceusb_dev, kevent);
 	int status;
 
+	dev_info(ir->dev, "kevent handler called (flags 0x%lx)",
+		 ir->kevent_flags);
+
 	if (test_bit(EVENT_RX_HALT, &ir->kevent_flags)) {
 		usb_unlink_urb(ir->urb_in);
 		status = usb_clear_halt(ir->usbdev, ir->pipe_in);
+		dev_err(ir->dev, "rx clear halt status = %d", status);
 		if (status < 0) {
-			dev_err(ir->dev, "rx clear halt error %d",
-				status);
-		}
-		clear_bit(EVENT_RX_HALT, &ir->kevent_flags);
-		if (status == 0) {
+			/*
+			 * Unable to clear RX stall/halt.
+			 * Will need to call usb_reset_device().
+			 */
+			dev_err(ir->dev,
+				"stuck RX HALT state requires USB Reset Device to clear");
+		} else {
+			clear_bit(EVENT_RX_HALT, &ir->kevent_flags);
 			status = usb_submit_urb(ir->urb_in, GFP_KERNEL);
 			if (status < 0) {
 				dev_err(ir->dev,
-					"rx unhalt submit urb error %d",
+					"rx unhalt submit urb error = %d",
 					status);
 			}
 		}
@@ -1424,9 +1431,17 @@ static void mceusb_deferred_kevent(struct work_struct *work)
 
 	if (test_bit(EVENT_TX_HALT, &ir->kevent_flags)) {
 		status = usb_clear_halt(ir->usbdev, ir->pipe_out);
-		if (status < 0)
-			dev_err(ir->dev, "tx clear halt error %d", status);
-		clear_bit(EVENT_TX_HALT, &ir->kevent_flags);
+		dev_err(ir->dev, "tx clear halt status = %d", status);
+		if (status < 0) {
+			/*
+			 * Unable to clear TX stall/halt.
+			 * Will need to call usb_reset_device().
+			 */
+			dev_err(ir->dev,
+				"stuck TX HALT state requires USB Reset Device to clear");
+		} else {
+			clear_bit(EVENT_TX_HALT, &ir->kevent_flags);
+		}
 	}
 }
 
-- 
2.11.0

