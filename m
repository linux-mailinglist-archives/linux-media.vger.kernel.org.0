Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22A9E157D45
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2020 15:18:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727897AbgBJOSa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Feb 2020 09:18:30 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:33398 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727434AbgBJOS3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Feb 2020 09:18:29 -0500
Received: from pendragon.ideasonboard.com (236.249-200-80.adsl-static.isp.belgacom.be [80.200.249.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 19225808;
        Mon, 10 Feb 2020 15:18:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1581344307;
        bh=H4Lfal80navRWE85ASZ6DxsNe+fUpwm6ausCv/QBWPw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DrXdjuDHMXMJxWcqrJ7jjPNiBDU5qKbGqE9149OTyA5Tr3w3ON3+26zIMDdLiNmZT
         HmS1bPC5tnrbvs06RvXTMGbX8dqeGLUYGZfVFQ2vGTwAEtd/gKCaTHV0p2YqXqiLtc
         w6bRmLmy2WyhoYt2LV9OTckoezYPOjuMqKHnJDYQ=
Date:   Mon, 10 Feb 2020 16:18:12 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Oliver Neukum <oneukum@suse.de>
Cc:     syzbot <syzbot+9a48339b077c5a80b869@syzkaller.appspotmail.com>,
        andreyknvl@google.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: KASAN: use-after-free Read in uvc_probe
Message-ID: <20200210141812.GB4727@pendragon.ideasonboard.com>
References: <000000000000780999059c048dfc@google.com>
 <1581344006.26936.7.camel@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1581344006.26936.7.camel@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Oliver,

Thank you for the patch.

On Mon, Feb 10, 2020 at 03:13:26PM +0100, Oliver Neukum wrote:
> Am Montag, den 13.01.2020, 04:24 -0800 schrieb syzbot:
> > Hello,
> > 
> > syzbot found the following crash on:
> > 
> > HEAD commit:    ae179410 usb: gadget: add raw-gadget interface
> > git tree:       https://github.com/google/kasan.git usb-fuzzer
> > console output: https://syzkaller.appspot.com/x/log.txt?x=132223fee00000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=ad1d751a3a72ae57
> > dashboard link: https://syzkaller.appspot.com/bug?extid=9a48339b077c5a80b869
> > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16857325e00000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=142e069ee00000
> > 
> > IMPORTANT: if you fix the bug, please add the following tag to the commit:
> > Reported-by: syzbot+9a48339b077c5a80b869@syzkaller.appspotmail.com
> > 
> > usb 1-1: New USB device found, idVendor=0bd3, idProduct=0555,  
> > bcdDevice=69.6a
> > usb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
> > usb 1-1: config 0 descriptor??
> > usb 1-1: string descriptor 0 read error: -71
> > uvcvideo: Found UVC 0.00 device <unnamed> (0bd3:0555)
> > ==================================================================
> > BUG: KASAN: use-after-free in uvc_register_terms  
> > drivers/media/usb/uvc/uvc_driver.c:2038 [inline]
> > BUG: KASAN: use-after-free in uvc_register_chains  
> > drivers/media/usb/uvc/uvc_driver.c:2070 [inline]
> > BUG: KASAN: use-after-free in uvc_probe.cold+0x2193/0x29de  
> > drivers/media/usb/uvc/uvc_driver.c:2201
> > Read of size 2 at addr ffff8881d4f1bc2e by task kworker/1:2/94
> 
> #syz test: https://github.com/google/kasan.git ae179410
> 
> From db844641a5e30f3cfc0ce9cde156b3cc356b6c0c Mon Sep 17 00:00:00 2001
> From: Oliver Neukum <oneukum@suse.com>
> Date: Mon, 10 Feb 2020 15:10:36 +0100
> Subject: [PATCH] UVC: deal with unnamed streams
> 
> The pointer can be NULL
> 
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 99883550375e..26558a89f2fe 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -2069,7 +2069,8 @@ static int uvc_register_terms(struct uvc_device *dev,
>  		stream = uvc_stream_by_id(dev, term->id);
>  		if (stream == NULL) {
>  			uvc_printk(KERN_INFO, "No streaming interface found "
> -				   "for terminal %u.", term->id);
> +				   "for terminal %u.",
> +				   term->id ? term->id : "(Unnamed)");

Have you tried compiling this ?

>  			continue;
>  		}
>  

-- 
Regards,

Laurent Pinchart
