Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EC5E2BA8C4
	for <lists+linux-media@lfdr.de>; Fri, 20 Nov 2020 12:14:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728340AbgKTLLY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Nov 2020 06:11:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727838AbgKTLLX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Nov 2020 06:11:23 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD1E4C0613CF
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2020 03:11:23 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 54B682A3;
        Fri, 20 Nov 2020 12:11:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1605870680;
        bh=AzRLBYXeVmwkIIkUsnc+sI+njjio7UA8E83GygWkEpc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sfgP/0GriQ9rhlAKKjXz6eIMVGBf262XXzgqUBR5Gcnvfjhz3wFq6LJjMP73IZAKB
         QX769BFVifDFMAU4L8k3ZijRG5h8PP0K9QlLdFErkySdyGmXkxBgP9AhKltfzwSSlD
         U+Z/6tEio1aY0fJ1rhg+dzW15Af3DzW+LHaIR96A=
Date:   Fri, 20 Nov 2020 13:11:13 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Doncho Minkov <donchominkov@gmail.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: My camera does work on manjaro linux
Message-ID: <20201120111113.GA13334@pendragon.ideasonboard.com>
References: <CANdtHpC-a5SS=9rOTAbkvFyfFJrM7Yas1fJszZRuFwj4cT6q3w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANdtHpC-a5SS=9rOTAbkvFyfFJrM7Yas1fJszZRuFwj4cT6q3w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Doncho,

On Thu, Nov 19, 2020 at 11:52:28AM +0200, Doncho Minkov wrote:
> Hello!
> 
> My new webcam does not work on my Manjaro, but works fine on my Windows machine.
> 
> I've read the article at https://www.ideasonboard.org/uvc/faq/ and
> tried to troubleshoot it, but to no success.
> 
> Can you help me? I am attaching the logs from lsubs and dmesg.

Could you please send the output of 'lsusb -v -d 1bcf:0b40', running as
root if possible ('sudo lsusb -v -d 1bcf:0b40' should do) ?

[snip]

> [    2.740672] usb 1-4: New USB device found, idVendor=1bcf, idProduct=0b40, bcdDevice= 9.14
> [    2.740674] usb 1-4: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> [    2.740674] usb 1-4: Product: 2K FHD camera
> [    2.740675] usb 1-4: Manufacturer: SHENZHENAONI ELECTRONIC CO.,LTD
> [    2.740676] usb 1-4: SerialNumber: AN2020091401

[snip]

> [    4.856500] usb 1-4: 3:1: cannot get freq at ep 0x86
> [    4.895811] usbcore: registered new interface driver snd-usb-audio
> [    4.900922] uvcvideo: Found UVC 1.10 device 2K FHD camera (1bcf:0b40)

Your device claims it implements UVC 1.10.

> [    4.920820] uvcvideo: Failed to query (GET_INFO) UVC control 14 on unit 1: -32 (exp. 1).
> [    4.977348] uvcvideo: UVC non compliance - GET_DEF(PROBE) not supported. Enabling workaround.
> [    4.982821] uvcvideo: Failed to query (129) UVC probe control : 26 (exp. 34).

But it handles the probe control as in UVC 1.0a (the size of the control
was 26 in UVC 1.0a, and got extended to 34 bytes in UVC 1.10).

> [    4.982836] uvcvideo: Failed to initialize the device (-5).
> [    4.982884] usbcore: registered new interface driver uvcvideo
> [    4.982884] USB Video Class driver (1.1.1)

Could you try the following patch ?

commit 9f01208d6d06568dabb67fa04efbae2cec51d7a2
Author: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date:   Fri Nov 20 12:57:48 2020 +0200

    media: uvcvideo: Force UVC version to 1.0a for 1bcf:0b40

    The Shenzhen Aoni Electronic Co.,Ltd 2K FHD camera reports a UVC 1.10
    version, but implements UVC 1.0a as shown by the UVC probe control being
    26 bytes long. Force the UVC version for that device.

    Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index ddb9eaa11be7..05aea3ce2e23 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2274,6 +2274,12 @@ static int uvc_probe(struct usb_interface *intf,
 			"linux-uvc-devel mailing list.\n");
 	}

+	if (dev->info->uvc_version) {
+		dev->uvc_version = dev->info->uvc_version;
+		uvc_printk(KERN_INFO, "Forcing UVC version to %u.%02x\n",
+			   dev->uvc_version >> 8, dev->uvc_version & 0xff);
+	}
+
 	/* Register the V4L2 device. */
 	if (v4l2_device_register(&intf->dev, &dev->vdev) < 0)
 		goto error;
@@ -2923,6 +2929,17 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= (kernel_ulong_t)&uvc_quirk_probe_minmax },
+	/* Shenzhen Aoni Electronic Co.,Ltd 2K FHD camera */
+	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
+				| USB_DEVICE_ID_MATCH_INT_INFO,
+	  .idVendor		= 0x1bcf,
+	  .idProduct		= 0x0b40,
+	  .bInterfaceClass	= USB_CLASS_VIDEO,
+	  .bInterfaceSubClass	= 1,
+	  .bInterfaceProtocol	= 0,
+	  .driver_info		= (kernel_ulong_t)&(const struct uvc_device_info){
+		.uvc_version = 0x010a,
+	  } },
 	/* SiGma Micro USB Web Camera */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index a3dfacf069c4..8ec9eca07f06 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -635,6 +635,7 @@ static inline u32 uvc_urb_index(const struct uvc_urb *uvc_urb)
 struct uvc_device_info {
 	u32	quirks;
 	u32	meta_format;
+	u16	uvc_version;
 };

 struct uvc_device {

-- 
Regards,

Laurent Pinchart
