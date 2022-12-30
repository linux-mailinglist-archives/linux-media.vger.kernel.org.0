Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0D1E659BA7
	for <lists+linux-media@lfdr.de>; Fri, 30 Dec 2022 20:33:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231598AbiL3Tdv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Dec 2022 14:33:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229610AbiL3Tdv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Dec 2022 14:33:51 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33AA218681
        for <linux-media@vger.kernel.org>; Fri, 30 Dec 2022 11:33:49 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EAF022F5;
        Fri, 30 Dec 2022 20:33:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1672428827;
        bh=a1R48NRM4T6yPSKCJeGmrKrGzRtSwQgspOFrB7Iemuk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BQkM41Qrsc5sTtyT114f8IQwGXOjtF03iybtF+0peW/akHeSQUgDsQtXxCOoRZZWQ
         7tBSqNpAYbyOtFd56TSmxYb3IOTLQ/RK4xoQ96tEZ6vUbxgnK4YM3eulzxYYXs+Sy4
         WUBPygmwZP7v9q188uMNnhlAnXxGRCVx3LJ647tg=
Date:   Fri, 30 Dec 2022 21:33:42 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Giuliano Lotta <giuliano.lotta@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        mchehab@kernel.org
Subject: Re: ucv camera fix : tester offering :-)
Message-ID: <Y689FvF1zULBkSHs@pendragon.ideasonboard.com>
References: <CA+DpmqZ1fh=MqEn-G6wb_6yELuPWVTROG2ReUDPJGAAOn7FN9Q@mail.gmail.com>
 <CANiDSCuoL4-L4zXPFRS88NpmYMdbbP2QNi90U9LkpS90_unb1w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCuoL4-L4zXPFRS88NpmYMdbbP2QNi90U9LkpS90_unb1w@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Dec 21, 2022 at 09:09:37PM +0100, Ricardo Ribalda wrote:
> Hi Giuliano
> 
> Usually it is better to ask at the linux-media mailing list
> https://www.linuxtv.org/lists.php. there is better chance to get an
> answer and your question will get better chances to get be answered.
> 
> On Wed, 21 Dec 2022 at 15:14, Giuliano Lotta wrote:
> >
> > Hi Laurent,
> >
> > I'm using using an ubuntu Ubuntu 22.04.1 LTS on 5.15.0-56-generic
> >
> > with an Acer Nitro 5 AN517-55 with Quanta ACER HD User Facing', USB
> > 0408:4035.
> >
> > Currently the camera is not working under linux. The camera works
> > perfectly on Windows 11 dual boot.
> >
> > The camera is reported to have problems on other linux versions:
> > https://linux-hardware.org/?id=usb:0408-4035
> >
> > My console commands report similar info to other users:
> > https://unix.stackexchange.com/questions/723504/integrated-camera-not-detected-working-on-acer-nitro-5-an515-58
> >
> > I see also that there is a proposed fix at
> > https://patchwork.kernel.org/project/linux-media/patch/20220617235610.321917-9-ribalda@chromium.org/
> 
> If your error in dmesg is simiar
> 
> [    4.629731] uvcvideo 3-6:1.1: Failed to query (129) UVC probe control : 26 (exp. 48).

It looks like your device advertise UVC 1.5 support (as also hinted by
the availability of the Region of Interest control in the camera input
terminal) but implements the UVC 1.0a video control. I'm honestly
puzzled by how abysmal compliance testing seems to be among webcam
manufacturers. In older days this would have called for beheading with a
rusty tea spoon, or worse, cursing in them Finnish.

> I am afraid that my patch won't help you much. My patch fixes the way
> a control can be configured.
> 
> Can you copy your whole dmesg when you get an error.

That would be useful.

> Also the output of lsusb -v -d 0408:4035

That seems to be available from https://pastebin.com/raw/GQVWC6i3.

Giuliano, could you try the following patch ? You need to apply it to
the sources of the kernel you're running (available from your
distribution), and compile the uvcvideo module. Depending on the
distribution, it may sign kernel modules, in which case you may need to
recompile the whole kernel. That's a distribution-specific issue that
you should bring up with your distribution's support channel if you run
into issues.

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 6abec7a51f47..52e7cae5c249 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2447,6 +2447,17 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= UVC_PC_PROTOCOL_15,
 	  .driver_info		= (kernel_ulong_t)&uvc_ctrl_power_line_limited },
+	/* Quanta ACER HD User Facing */
+	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
+				| USB_DEVICE_ID_MATCH_INT_INFO,
+	  .idVendor		= 0x0408,
+	  .idProduct		= 0x4035,
+	  .bInterfaceClass	= USB_CLASS_VIDEO,
+	  .bInterfaceSubClass	= 1,
+	  .bInterfaceProtocol	= UVC_PC_PROTOCOL_15,
+	  .driver_info		= (kernel_ulong_t)&(const struct uvc_device_info){
+		.uvc_version = 0x010a,
+	  } },
 	/* LogiLink Wireless Webcam */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,

This may cause side effects, for instance when it comes to handling of
the power line frequency control or other controls whose implementation
depend on the UVC version, but we'll worry about that later.

> > Installed linux-source but uvc_driver.c I found in the directory tree of Ubuntu is different from both :
> >
> > - https://github.com/torvalds/linux/blob/master/drivers/media/usb/uvc/uvc_driver.c
> >
> > - https://patchwork.kernel.org/project/linux-media/patch/20220617235610.321917-9-ribalda@chromium.org/
> >
> >
> > I would like to test your patch and see if the solution can be
> > submitted to Ubuntu for the next fix release.
> >
> > - Could you give me some instructions on how to proceed ?
> >
> > - Should I compile a new whole kernel or just a mod?
> >
> > - Where can I find the source to which your fix applies (seems to
> >   apply to something different from Ubuntu and torvald versions) ?
> >   Will it be compatible with the current Ubuntu version?
> >
> > - May I ask for some instructions on how to proceed with testing
> >   your fix ?

-- 
Regards,

Laurent Pinchart
