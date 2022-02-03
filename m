Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A5444A7CE5
	for <lists+linux-media@lfdr.de>; Thu,  3 Feb 2022 01:32:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239323AbiBCAcP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Feb 2022 19:32:15 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:38204 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229976AbiBCAcO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Feb 2022 19:32:14 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 548A249C;
        Thu,  3 Feb 2022 01:32:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1643848333;
        bh=MA6aa4PX/lCOD/3MBoHp78BO/rTeZi5gvad3SqveS2Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DTnYta1scQQSSSE1jAZdr9ysLNyKhtumYqmNkcB0LrTvJcdsNVuy7h7t3U/qUOYTm
         CNi/xZZInodMrUxhpy2rWm56pSsyoM8UbPGDUMZd4HbXi9jxVrfUcyWtFBnRP53gih
         VA+GEnX9ZXT7fktkfAN0vN68cN+/Ew/NYDbfnNI8=
Date:   Thu, 3 Feb 2022 02:31:49 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Mohammad <moin@librem.one>
Cc:     Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org
Subject: Re: Get j5 WebCam JVCU100 supported by Linux UVC driver
Message-ID: <YfsidYtBQhhlP4Ab@pendragon.ideasonboard.com>
References: <a7e0c40f-3bf7-b564-c182-88bbb5d4b188@librem.one>
 <CANiDSCvbuUHU40CE+uGT56VUDMnLifTw7yAN+HD4WJVTyAg+Aw@mail.gmail.com>
 <CANiDSCuLQWFxMLKj9no7-qdZMRp3AJdgZ=u8356hc7mf-6fQyA@mail.gmail.com>
 <YfPJree+wFQ1869W@pendragon.ideasonboard.com>
 <38609c2c-8b15-4aa1-a1a1-c219d4ff4e83@librem.one>
 <YfbjyZ8aeJsNGoIm@pendragon.ideasonboard.com>
 <6cc718e4-87ee-cc91-1208-6f48419bad31@librem.one>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6cc718e4-87ee-cc91-1208-6f48419bad31@librem.one>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mohammad,

On Sun, Jan 30, 2022 at 09:18:32PM -0600, Mohammad wrote:
> Hi Laurent,
> 
> As it happens, I have two Windows machines; one with Windows 7 and
> another with Windows 10.  Which version of Windows should I test it on,
> and how do I capture a USB trace in Windows?  I appreciate the help!

I don't think the version matters too much. If you can test it on both
(just plugging it in and checking if it works), it's even better.

When it comes to capturing USB traces, I haven't tried that for probably
at least 15 years, so I'm afraid I can't help.

> On 1/30/22 6:00 PM, Laurent Pinchart wrote:
> > On Sun, Jan 30, 2022 at 12:12:53PM -0600, Mohammad wrote:
> >> Is there a way around this problem?  Would I have to reach out to the
> >> device manufacturer?
> >
> > If you have access to a Windows machine, it could be useful to check if
> > it works there. If it doesn't, the device is likely faulty. If it does,
> > then a debugging session would be required, which could involve
> > capturing a USB trace when using the camera under Windows, to figure out
> > what is different between Windows and Linux.
> >
> >> On 1/28/22 4:47 AM, Laurent Pinchart wrote:
> >>> On Fri, Jan 28, 2022 at 09:31:43AM +0100, Ricardo Ribalda wrote:
> >>>> I received out of list the dmesg output from Mohammad
> >>>>
> >>>> It looks like a hardware error to me:
> >>>>
> >>>> [   48.729618] iTCO_wdt: unable to reset NO_REBOOT flag, device disabled by hardware/BIOS
> >>>> [   48.749361] uvcvideo: Found UVC 1.00 device j5 WebCam JVCU100 (0711:3108)
> >>>> [   48.751876] uvcvideo: Failed to query (129) UVC probe control : -32 (exp. 26).
> >>>
> >>> A GET_CUR failure on the video probe control is indeed fairly bad. If I
> >>> had to guess, I would suspect either an issue at the USB level, or a
> >>> firmware bug in the webcam.
> >>>
> >>>> [   48.751879] uvcvideo: Failed to initialize the device (-5).
> >>>> [   48.751930] usbcore: registered new interface driver uvcvideo
> >>>>
> >>>> On Wed, 26 Jan 2022 at 17:23, Ricardo Ribalda wrote:
> >>>>> Hi Mohammad
> >>>>>
> >>>>> Could you share the output of dmesg when you connect the device?
> >>>>>
> >>>>> And also lsusb -vvvv -d 0711:3108
> >>>>>
> >>>>>
> >>>>> Thanks!
> >>>>>
> >>>>> On Wed, 26 Jan 2022 at 17:20, Mohammad wrote:
> >>>>>> Greetings,
> >>>>>>
> >>>>>> I have been trying to use the j5 WebCam JVCU100 on Linux and it doesn't
> >>>>>> function properly.  Cheese cannot seem to find it, and I did not see it
> >>>>>> listed on your list of supported devices, so I thought I would bring it
> >>>>>> to your attention.  Here is what I see from running lsusb:
> >>>>>>
> >>>>>> Bus 001 Device 006: ID 0711:3108 Magic Control Technology Corp. j5
> >>>>>> WebCam JVCU100
> >>>>>>
> >>>>>> Also, running lsusb -d 0711:3108 -v | grep "14 Video" returns
> >>>>>>
> >>>>>> Couldn't open device, some information will be missing
> >>>>>>       bFunctionClass         14 Video
> >>>>>>       bInterfaceClass        14 Video
> >>>>>>       bInterfaceClass        14 Video
> >>>>>>       bInterfaceClass        14 Video
> >>>>>>       bInterfaceClass        14 Video
> >>>>>>
> >>>>>> So, looks like the Linux UVC driver at least recognizes the webcam.
> >>>>>> Please let me know if you can help with this, thanks!

-- 
Regards,

Laurent Pinchart
