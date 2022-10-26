Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F21BC60E055
	for <lists+linux-media@lfdr.de>; Wed, 26 Oct 2022 14:09:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233509AbiJZMJI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Oct 2022 08:09:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233642AbiJZMIm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Oct 2022 08:08:42 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F8EA900FE;
        Wed, 26 Oct 2022 05:07:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B5AF7B82036;
        Wed, 26 Oct 2022 12:07:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12677C433C1;
        Wed, 26 Oct 2022 12:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1666786059;
        bh=8B4417bfAzlbIu20KS6Ht8E703c8EoXbWuOdXnxpT2c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=t1M/IL1bkXI2W3Z/CXVYUCOlXHFrd8hHyqPh6I3BHtBddDE/jevNGy+1DjHfAU03O
         5Q8/8/B7OHgECKl0f6yq+gAbeVEzPYcBDeJq7aubwgwbKS39mBWJb08jN6Fa1rF3an
         B8VXpe0xfFXkUgsVhm3+dA0bqc66zFBlieA9lqY0=
Date:   Wed, 26 Oct 2022 14:08:32 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Michael Grzeschik <mgr@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        balbi@kernel.org, laurent.pinchart@ideasonboard.com,
        kernel@pengutronix.de
Subject: Re: [PATCH v2] usb: gadget: uvc: limit isoc_sg to super speed gadgets
Message-ID: <Y1kjQNfQcI4Of5qS@kroah.com>
References: <20221017221141.3134818-1-m.grzeschik@pengutronix.de>
 <Y1PVhIGlh1uMR2i/@kroah.com>
 <20221025192537.GA10842@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221025192537.GA10842@pengutronix.de>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 25, 2022 at 09:25:37PM +0200, Michael Grzeschik wrote:
> Hi!
> 
> On Sat, Oct 22, 2022 at 01:35:32PM +0200, Greg KH wrote:
> > On Tue, Oct 18, 2022 at 12:11:41AM +0200, Michael Grzeschik wrote:
> > > The overhead of preparing sg data is high for transfers with limited
> > > payload. When transferring isoc over high-speed usb the maximum payload
> > > is rather small which is a good argument no to use sg. This patch is
> > > changing the uvc_video_encode_isoc_sg encode function only to be used
> > > for super speed gadgets.
> > > 
> > > Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> > > 
> > > ---
> > > v1 -> v2: - always setting mem and sg elements since now both is working in runtime
> > 
> > I'm guessing this is a "fix"?  If so, what commit id is this a fix for?
> 
> This is not a fix but a feature. I am working to improve it
> also to work with dmabuf memory comming in as vaddr. This needs some
> extra mapping. Since you already took this patch, I will send fix for
> this one then.

As it's not a fix, and it needs a fixup, I'll drop this from my tree for
now as it should not go into 6.1-final.  Please resend an updated, and
fixed, patch instead.

thanks,

greg k-h
