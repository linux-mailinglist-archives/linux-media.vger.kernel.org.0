Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE95B5FC0FE
	for <lists+linux-media@lfdr.de>; Wed, 12 Oct 2022 08:59:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229712AbiJLG7a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Oct 2022 02:59:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229563AbiJLG73 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Oct 2022 02:59:29 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD34980F6B;
        Tue, 11 Oct 2022 23:59:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 15FCAB8168A;
        Wed, 12 Oct 2022 06:59:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 535E2C433C1;
        Wed, 12 Oct 2022 06:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1665557965;
        bh=KNXP/yuvIKyB5/D8uMXmcEGaahkP82Y4IiUwnvBx3iQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=r6GEzmJ8AGcy3DgVUX9p86/UyhSqkBu7+WXGkx/Pnvg4ig5gzuiruxT6rWVSxXIwd
         Yxun71LZxCQzcQIWIt+84yrn6uCy6e/b1SiQZXCJQy0RMbjTkknt1rPnI6BsDhiOgZ
         8JCaE5Gpul9q2M4I9JvrAaUk2nuyl1I/MDO6rBlc=
Date:   Wed, 12 Oct 2022 09:00:10 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Michael Grzeschik <mgr@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, balbi@kernel.org,
        laurent.pinchart@ideasonboard.com, kernel@pengutronix.de,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: uvc: limit isoc_sg to super speed gadgets
Message-ID: <Y0Zl+r0QowRg3n4a@kroah.com>
References: <20221011205707.1603017-1-m.grzeschik@pengutronix.de>
 <20221011213256.GI27626@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221011213256.GI27626@pengutronix.de>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 11, 2022 at 11:32:56PM +0200, Michael Grzeschik wrote:
> On Tue, Oct 11, 2022 at 10:57:07PM +0200, Michael Grzeschik wrote:
> > The overhead of preparing sg data is high for transfers with limited
> > payload. When transferring isoc over high-speed usb the maximum payload
> > is rather small which is a good argument no to use sg. This patch is
> > changing the uvc_video_encode_isoc_sg encode function only to be used
> > for super speed gadgets.
> > 
> > Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> > ---
> > drivers/usb/gadget/function/uvc_video.c | 9 +++++++--
> > 1 file changed, 7 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
> > index bb037fcc90e69e..5081eb3bc5484c 100644
> > --- a/drivers/usb/gadget/function/uvc_video.c
> > +++ b/drivers/usb/gadget/function/uvc_video.c
> > @@ -448,6 +448,9 @@ static void uvcg_video_pump(struct work_struct *work)
> >  */
> > int uvcg_video_enable(struct uvc_video *video, int enable)
> > {
> > +	struct uvc_device *uvc = video->uvc;
> > +	struct usb_composite_dev *cdev = uvc->func.config->cdev;
> > +	struct usb_gadget *gadget = cdev->gadget;
> > 	unsigned int i;
> > 	int ret;
> > 
> > @@ -479,9 +482,11 @@ int uvcg_video_enable(struct uvc_video *video, int enable)
> > 	if (video->max_payload_size) {
> > 		video->encode = uvc_video_encode_bulk;
> > 		video->payload_size = 0;
> > -	} else
> > -		video->encode = video->queue.use_sg ?
> > +	} else {
> > +		video->encode = (video->queue.use_sg &&
> > +				 !(gadget->speed <= USB_SPEED_HIGH)) ?
> 
> I also came up with the following Idea:
> 
> -                                !(gadget->speed <= USB_SPEED_HIGH)) ?
> +                                video->req_size > 4096) ?
> 
> Would this threshold of 4096 make sense? What should be preferred?

Where did you pick 4096 from?  Even if you pick PAGE_SIZE, why?  Last
time I ran memcpy() tests vs. sg on a range of processors the benifit
did not kick in until the value was MUCH larger than just 4k, but I
guess that depends on the overall codepath involved here.

So please test, and don't just guess, and then document it really really
well why you picked that value.

For now, the SPEED_HIGH should be sufficient I think.

thanks,

greg k-h
