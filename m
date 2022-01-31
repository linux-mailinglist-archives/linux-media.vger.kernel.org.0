Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DBAD4A3C08
	for <lists+linux-media@lfdr.de>; Mon, 31 Jan 2022 01:01:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235063AbiAaABE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 30 Jan 2022 19:01:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235023AbiAaABC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 30 Jan 2022 19:01:02 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3AA7C061714
        for <linux-media@vger.kernel.org>; Sun, 30 Jan 2022 16:01:01 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 37160A4D;
        Mon, 31 Jan 2022 01:00:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1643587259;
        bh=cGIgkW2eXZW3tt9h7LPwc7bV+MpONBqLi7VC9Oaa2MA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oK1rX3hmAJk/gd6tZ2yqcNh8bJIcUGSmDP0vJyjTB7lJEvfTG3x/q/tV2jZIRjEaz
         t+tbzYI4m63udQ6MIilfO2e+Qq7YFYoNh2DNPbZT7pLuQ8VwsYOAqcDu5k/zuNYPWR
         PSXFK/kjf7jwlEzteF3EzlGmRbuIa0e8KNo/SmHw=
Date:   Mon, 31 Jan 2022 02:00:37 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Mohammad <moin@librem.one>
Cc:     Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org
Subject: Re: Get j5 WebCam JVCU100 supported by Linux UVC driver
Message-ID: <YfbjyZ8aeJsNGoIm@pendragon.ideasonboard.com>
References: <a7e0c40f-3bf7-b564-c182-88bbb5d4b188@librem.one>
 <CANiDSCvbuUHU40CE+uGT56VUDMnLifTw7yAN+HD4WJVTyAg+Aw@mail.gmail.com>
 <CANiDSCuLQWFxMLKj9no7-qdZMRp3AJdgZ=u8356hc7mf-6fQyA@mail.gmail.com>
 <YfPJree+wFQ1869W@pendragon.ideasonboard.com>
 <38609c2c-8b15-4aa1-a1a1-c219d4ff4e83@librem.one>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <38609c2c-8b15-4aa1-a1a1-c219d4ff4e83@librem.one>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mohammad,

On Sun, Jan 30, 2022 at 12:12:53PM -0600, Mohammad wrote:
> Is there a way around this problem?  Would I have to reach out to the
> device manufacturer?

If you have access to a Windows machine, it could be useful to check if
it works there. If it doesn't, the device is likely faulty. If it does,
then a debugging session would be required, which could involve
capturing a USB trace when using the camera under Windows, to figure out
what is different between Windows and Linux.

> On 1/28/22 4:47 AM, Laurent Pinchart wrote:
> > On Fri, Jan 28, 2022 at 09:31:43AM +0100, Ricardo Ribalda wrote:
> >> I received out of list the dmesg output from Mohammad
> >>
> >> It looks like a hardware error to me:
> >>
> >> [   48.729618] iTCO_wdt: unable to reset NO_REBOOT flag, device disabled by hardware/BIOS
> >> [   48.749361] uvcvideo: Found UVC 1.00 device j5 WebCam JVCU100 (0711:3108)
> >> [   48.751876] uvcvideo: Failed to query (129) UVC probe control : -32 (exp. 26).
> >
> > A GET_CUR failure on the video probe control is indeed fairly bad. If I
> > had to guess, I would suspect either an issue at the USB level, or a
> > firmware bug in the webcam.
> >
> >> [   48.751879] uvcvideo: Failed to initialize the device (-5).
> >> [   48.751930] usbcore: registered new interface driver uvcvideo
> >>
> >> On Wed, 26 Jan 2022 at 17:23, Ricardo Ribalda wrote:
> >>> Hi Mohammad
> >>>
> >>> Could you share the output of dmesg when you connect the device?
> >>>
> >>> And also lsusb -vvvv -d 0711:3108
> >>>
> >>>
> >>> Thanks!
> >>>
> >>> On Wed, 26 Jan 2022 at 17:20, Mohammad wrote:
> >>>> Greetings,
> >>>>
> >>>> I have been trying to use the j5 WebCam JVCU100 on Linux and it doesn't
> >>>> function properly.  Cheese cannot seem to find it, and I did not see it
> >>>> listed on your list of supported devices, so I thought I would bring it
> >>>> to your attention.  Here is what I see from running lsusb:
> >>>>
> >>>> Bus 001 Device 006: ID 0711:3108 Magic Control Technology Corp. j5
> >>>> WebCam JVCU100
> >>>>
> >>>> Also, running lsusb -d 0711:3108 -v | grep "14 Video" returns
> >>>>
> >>>> Couldn't open device, some information will be missing
> >>>>       bFunctionClass         14 Video
> >>>>       bInterfaceClass        14 Video
> >>>>       bInterfaceClass        14 Video
> >>>>       bInterfaceClass        14 Video
> >>>>       bInterfaceClass        14 Video
> >>>>
> >>>> So, looks like the Linux UVC driver at least recognizes the webcam.
> >>>> Please let me know if you can help with this, thanks!

-- 
Regards,

Laurent Pinchart
