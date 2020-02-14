Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CA9A15D680
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2020 12:23:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387397AbgBNLXB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Feb 2020 06:23:01 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:35086 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726220AbgBNLXA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Feb 2020 06:23:00 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D1E09504;
        Fri, 14 Feb 2020 12:22:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1581679378;
        bh=ZSkmN5u06wPe7iYRdeMx/Hh4C2B8L2HC0yJxyMiKJYU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dbikSYFkwW/xuDj7JtfCtOEgsCQw9RHd6Xo311tS/fZc898nEr+BmYGr5xtoxEJ6G
         5fKjigyeoRYxKmnl4YiCrlCPHu9hqclEX/wnmygzarg5JWVAtPUS7MXMpVNCytl/aB
         lwco81mD9hPvBEjYdHD+I0x3SBCfJF37KMlTbbMQ=
Date:   Fri, 14 Feb 2020 13:22:39 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        syzbot <syzbot+75287f75e2fedd69d680@syzkaller.appspotmail.com>,
        Hillf Danton <hdanton@sina.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Allison Randal <allison@lohutok.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Souptick Joarder <jrdr.linux@gmail.com>, andreyknvl@google.com,
        bnvandana@gmail.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] media: usbvision: Fix a use after free in v4l2_release()
Message-ID: <20200214112239.GC4831@pendragon.ideasonboard.com>
References: <20200124141356.365bgzg2lp3tjedm@kili.mountain>
 <d8663b81-e920-3e1d-11d0-f636ea52c6ef@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d8663b81-e920-3e1d-11d0-f636ea52c6ef@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Fri, Feb 14, 2020 at 11:06:36AM +0100, Hans Verkuil wrote:
> On 1/24/20 3:13 PM, Dan Carpenter wrote:
> > Syzbot triggered a use after free in v5.5-rc6:
> > 
> > BUG: KASAN: use-after-free in v4l2_release+0x2f1/0x390 drivers/media/v4l2-core/v4l2-dev.c:459
> > 
> > Allocated by task 94:
> >  usbvision_alloc drivers/media/usb/usbvision/usbvision-video.c:1315 [inline]
> >  usbvision_probe.cold+0x5c5/0x1f21 drivers/media/usb/usbvision/usbvision-video.c:1469
> > 
> > Freed by task 1913:
> >  kfree+0xd5/0x300 mm/slub.c:3957
> >  usbvision_release+0x181/0x1c0 drivers/media/usb/usbvision/usbvision-video.c:1364
> >  usbvision_radio_close.cold+0x2b/0x74 drivers/media/usb/usbvision/usbvision-video.c:1130
> >  v4l2_release+0x2e7/0x390 drivers/media/v4l2-core/v4l2-dev.c:455
> > 
> > The problem is that the v4l2_release() calls usbvision_release() which
> > frees "usbvision" but v4l2_release() still wants to use
> > "usbvision->vdev".  One solution is to make this devm_ allocated memory
> > so the memory isn't freed until later.
> 
> devm_ allocated memory is freed after disconnect, so I doubt this will help, or at
> best it will just move the problem elsewhere.

Yes, devm_*alloc is evil :-( It has spread to many drivers and is used
incorrectly in most cases.

> The right approach would be to use the release() callback from struct v4l2_device:
> that's called when the very last open filehandle is closed.

Hillf Danton has sent a patch to do so in the "Re: KASAN: use-after-free
Read in v4l2_release (3)" thread. Have you seen it ?

> But I'm not sure if it is worth the effort. The usbvision driver is a mess and
> personally I think it should be deprecated.

I agree.

> > Reported-by: syzbot+75287f75e2fedd69d680@syzkaller.appspotmail.com
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> > I copied this idea from a different driver, but I haven't tested it.
> > I wanted to try the #syz fix command to see if it works.
> > 
> >  drivers/media/usb/usbvision/usbvision-video.c | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> > 
> > diff --git a/drivers/media/usb/usbvision/usbvision-video.c b/drivers/media/usb/usbvision/usbvision-video.c
> > index 93d36aab824f..07b4763062c4 100644
> > --- a/drivers/media/usb/usbvision/usbvision-video.c
> > +++ b/drivers/media/usb/usbvision/usbvision-video.c
> > @@ -1312,7 +1312,7 @@ static struct usb_usbvision *usbvision_alloc(struct usb_device *dev,
> >  {
> >  	struct usb_usbvision *usbvision;
> >  
> > -	usbvision = kzalloc(sizeof(*usbvision), GFP_KERNEL);
> > +	usbvision = devm_kzalloc(&dev->dev, sizeof(*usbvision), GFP_KERNEL);
> >  	if (!usbvision)
> >  		return NULL;
> >  
> > @@ -1336,7 +1336,6 @@ static struct usb_usbvision *usbvision_alloc(struct usb_device *dev,
> >  	v4l2_ctrl_handler_free(&usbvision->hdl);
> >  	v4l2_device_unregister(&usbvision->v4l2_dev);
> >  err_free:
> > -	kfree(usbvision);
> >  	return NULL;
> >  }
> >  
> > @@ -1361,7 +1360,6 @@ static void usbvision_release(struct usb_usbvision *usbvision)
> >  
> >  	v4l2_ctrl_handler_free(&usbvision->hdl);
> >  	v4l2_device_unregister(&usbvision->v4l2_dev);
> > -	kfree(usbvision);
> >  
> >  	PDEBUG(DBG_PROBE, "success");
> >  }

-- 
Regards,

Laurent Pinchart
