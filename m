Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E51D9F2FF6
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2019 14:39:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388271AbfKGNjp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Nov 2019 08:39:45 -0500
Received: from mx2.suse.de ([195.135.220.15]:38508 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727858AbfKGNjo (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 7 Nov 2019 08:39:44 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id E32DCAE12;
        Thu,  7 Nov 2019 13:39:42 +0000 (UTC)
Date:   Thu, 7 Nov 2019 14:39:41 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-usb@vger.kernel.org
Subject: Re: Logitech C270 webcam floods the log
Message-ID: <20191107143941.1649db47@endymion>
In-Reply-To: <20191023142016.GA1904@pendragon.ideasonboard.com>
References: <20191023151859.30a8ce88@endymion>
        <20191023142016.GA1904@pendragon.ideasonboard.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thank you very much for your quick reply and sorry for getting back to
you only today, your message got moved to a different folder by a
filter rule I did not remember of.

On Wed, 23 Oct 2019 17:20:16 +0300, Laurent Pinchart wrote:
> On Wed, Oct 23, 2019 at 03:18:59PM +0200, Jean Delvare wrote:
> > When my Logitech C270 webcam is plugged in, my kernel log gets filled
> > with this message:
> > 
> > usb 3-4.1: reset high-speed USB device number 4 using xhci_hcd
> > 
> > every 5 seconds. I have the same problem on 3 different Intel-based
> > computers (different generations), using 2 different webcams, same
> > brand "same model".
> >
> > Is Logitech doing crappy hardware these days, or are we doing something
> > wrong? Is there any way to know the reason that triggers the reset?  
> 
> Is this before or after the uvcvideo driver gets involved ? One easy way
> to check is to move the uvcvideo.ko module out of the way so that it
> doesn't get loaded automatically (or just blacklist it in
> /etc/modprobe.d/) and then plug the camera.

I did as you suggested and it turns out that the "reset high-speed USB
device" messages are not printed originally, they start being printed
right after the uvcvideo kernel driver gets loaded. So that would be a
problem with the uvcvideo driver?

When unloading the uvcvideo driver, there's one more "reset high-speed
USB device" message and then no more.

For what it's worth, 2 things worth noting in the kernel log when the
device is being detected:

usb 3-12: set resolution quirk: cval->res = 384
(...)
uvcvideo: Found UVC 1.00 device <unnamed> (046d:0825)

"<unnamed>" seems weird. On the other hand lsusb properly lists it as:

Bus 003 Device 004: ID 046d:0825 Logitech, Inc. Webcam C270

I an older C270 webcam (3 year old, different package) connected to
another machine, USB device ID is the same, I compared the verbose
output of lsusb and one difference stands out:

     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       0
       bNumEndpoints           0
       bInterfaceClass        14 Video
       bInterfaceSubClass      2 Video Streaming
       bInterfaceProtocol      0 
       iInterface              0 
       VideoStreaming Interface Descriptor:
         (...)
-        bmaControls( 0)                    27
-        bmaControls( 1)                    27
-        bmaControls( 2)                    27
+        bmaControls( 0)                     0
+        bmaControls( 1)                     4
+        bmaControls( 2)                     4

(- is the new webcam, + is the old one)

I don't know if this tells anything useful though.

Thanks,
-- 
Jean Delvare
SUSE L3 Support
