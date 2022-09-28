Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0E015EE69B
	for <lists+linux-media@lfdr.de>; Wed, 28 Sep 2022 22:26:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232784AbiI1U0M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Sep 2022 16:26:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229698AbiI1U0K (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Sep 2022 16:26:10 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 827AC9F766;
        Wed, 28 Sep 2022 13:26:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 49FC9B821C0;
        Wed, 28 Sep 2022 20:26:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6766FC433D6;
        Wed, 28 Sep 2022 20:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664396767;
        bh=Uf/RWfsJ4uG1flfMDOCujgroHWmzllXe1x8nZ+2cFEE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HlZxDtA1P4UdIeyz2nmLSVG78oo9Sf11JwRJ7rWgPiMSPvqW5LOwQQyd1QM1nKl5K
         5QuLz7aOmGBE0WR0GtUFLEnUkc+FaSApUpWmbiuMXF4++f235KsPe3aimOdVR3Ymwi
         q+64yIlSlgUxcdUQKvJdSTMePNIteklMv8Kmxtx2xC5JDAcJw65y4CN+KpQi7MdDMV
         PPTD5ga8pUGU9EfEZdql1RtFuQg+HchYfIKx8BN6VG+mbslu3BoON/7jvvFvBDRnpL
         kGY/vCDGW1bdx+24OoIzDcbOffetYPWA9LkT2fqrh1LBIRPeM/QIxzhT4mqph/RY+x
         wiRkz7Nbd+itg==
Date:   Wed, 28 Sep 2022 13:26:04 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Michael Grzeschik <mgr@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        balbi@kernel.org, paul.elder@ideasonboard.com,
        kieran.bingham@ideasonboard.com, nicolas@ndufresne.ca,
        laurent.pinchart@ideasonboard.com, kernel@pengutronix.de,
        Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH v4] usb: gadget: uvc: increase worker prio to WQ_HIGHPRI
Message-ID: <YzSt3HmbEXx3DmfM@dev-arch.thelio-3990X>
References: <20220907215818.2670097-1-m.grzeschik@pengutronix.de>
 <YzR2gyyuU6luYRBP@dev-arch.thelio-3990X>
 <20220928194529.GA27265@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220928194529.GA27265@pengutronix.de>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 28, 2022 at 09:45:29PM +0200, Michael Grzeschik wrote:
> Hi Nathan!
> 
> On Wed, Sep 28, 2022 at 09:29:55AM -0700, Nathan Chancellor wrote:
> > On Wed, Sep 07, 2022 at 11:58:18PM +0200, Michael Grzeschik wrote:
> > > This patch is changing the simple workqueue in the gadget driver to be
> > > allocated as async_wq with a higher priority. The pump worker, that is
> > > filling the usb requests, will have a higher priority and will not be
> > > scheduled away so often while the video stream is handled. This will
> > > lead to fewer streaming underruns.
> > > 
> > > Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> > 
> > ...
> > 
> > > diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
> > > index 58e383afdd4406..1a31e6c6a5ffb8 100644
> > > --- a/drivers/usb/gadget/function/uvc.h
> > > +++ b/drivers/usb/gadget/function/uvc.h
> > > @@ -88,6 +88,7 @@ struct uvc_video {
> > >  	struct usb_ep *ep;
> > > 
> > >  	struct work_struct pump;
> > > +	struct workqueue_struct *async_wq;
> > > 
> > >  	/* Frame parameters */
> > >  	u8 bpp;
> > 
> > I am commenting here because this is the most recent change but after
> > this showed up in -next as commit 9b91a6523078 ("usb: gadget: uvc:
> > increase worker prio to WQ_HIGHPRI"), I see the following warning/error
> > when building s390 allmodconfig:
> > 
> >  In file included from ../include/linux/string.h:253,
> >                   from ../include/linux/bitmap.h:11,
> >                   from ../include/linux/cpumask.h:12,
> >                   from ../include/linux/smp.h:13,
> >                   from ../include/linux/lockdep.h:14,
> >                   from ../include/linux/rcupdate.h:29,
> >                   from ../include/linux/rculist.h:11,
> >                   from ../include/linux/pid.h:5,
> >                   from ../include/linux/sched.h:14,
> >                   from ../include/linux/ratelimit.h:6,
> >                   from ../include/linux/dev_printk.h:16,
> >                   from ../include/linux/device.h:15,
> >                   from ../drivers/usb/gadget/function/f_uvc.c:9:
> >  In function ‘fortify_memset_chk’,
> >      inlined from ‘uvc_register_video’ at ../drivers/usb/gadget/function/f_uvc.c:424:2:
> >  ../include/linux/fortify-string.h:301:25: error: call to ‘__write_overflow_field’ declared with attribute warning: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Werror=attribute-warning]
> >    301 |                         __write_overflow_field(p_size_field, size);
> >        |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > 
> > This commit did not directly cause this, it just made the issue more
> > obvious. In commit e4ce9ed835bc ("usb: gadget: uvc: ensure the vdev is
> > unset"), also authored by you, the size parameter appears to be wrong?
> > It is using the size of 'struct uvc_video', instead of the size of
> > 'struct video_device'. It appears to be pure luck that everything worked
> > up until this point, as those two types had the same size (1400 bytes)
> > before this change but now 'struct uvc_video' is 1408 bytes, meaning
> > there is now an overwrite. Any reason this is not the fix?
> > 
> > Cheers,
> > Nathan
> > 
> > diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
> > index e6948cf8def3..836601227155 100644
> > --- a/drivers/usb/gadget/function/f_uvc.c
> > +++ b/drivers/usb/gadget/function/f_uvc.c
> > @@ -421,7 +421,7 @@ uvc_register_video(struct uvc_device *uvc)
> > 	int ret;
> > 
> > 	/* TODO reference counting. */
> > -	memset(&uvc->vdev, 0, sizeof(uvc->video));
> > +	memset(&uvc->vdev, 0, sizeof(uvc->vdev));
> > 	uvc->vdev.v4l2_dev = &uvc->v4l2_dev;
> > 	uvc->vdev.v4l2_dev->dev = &cdev->gadget->dev;
> > 	uvc->vdev.fops = &uvc_v4l2_fops;
> > 
> 
> This sounds right. Do you send a proper patch?

Yup, I sent

https://lore.kernel.org/20220928201921.3152163-1-nathan@kernel.org/

which should be in your mailbox now :)

Cheers,
Nathan
