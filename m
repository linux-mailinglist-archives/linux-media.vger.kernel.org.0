Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 535417BA297
	for <lists+linux-media@lfdr.de>; Thu,  5 Oct 2023 17:42:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233532AbjJEPmY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Oct 2023 11:42:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234152AbjJEPmJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Oct 2023 11:42:09 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5991E4DF59
        for <linux-media@vger.kernel.org>; Thu,  5 Oct 2023 07:57:31 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26E4AC116B5;
        Thu,  5 Oct 2023 08:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1696496311;
        bh=4u7zMz1tChsNoGb+xXZPQ0U/1bfNLWD4sHDlcDoasXc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=0im4Jip8wJzdQjGzdd3zWfjfUf6C2ZXsEbkgIgXiLqmcrcD7+kwzLSaT4y5l6SD18
         jeF67XMQkEmEwo7ZvecO2p8u1mTyVYFgLk7QEghv+XCuQeS9WLhHub1ecqzmQYbqYR
         zOUnPJ53FTWFE900s3P/tTSRwfWDtkRdEYm5EO3U=
Date:   Thu, 5 Oct 2023 10:58:28 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Michael Grzeschik <m.grzeschik@pengutronix.de>,
        linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        dan.scally@ideasonboard.com, nicolas@ndufresne.ca,
        kernel@pengutronix.de
Subject: Re: [PATCH v2 1/3] usb: gadget: uvc: stop pump thread on video
 disable
Message-ID: <2023100507-sponsor-guise-d459@gregkh>
References: <20230911140530.2995138-1-m.grzeschik@pengutronix.de>
 <20230911140530.2995138-2-m.grzeschik@pengutronix.de>
 <20231005081716.GA13853@pendragon.ideasonboard.com>
 <2023100557-crabbing-superhero-02f9@gregkh>
 <20231005084805.GB31450@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231005084805.GB31450@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Oct 05, 2023 at 11:48:05AM +0300, Laurent Pinchart wrote:
> On Thu, Oct 05, 2023 at 10:40:10AM +0200, Greg KH wrote:
> > On Thu, Oct 05, 2023 at 11:17:16AM +0300, Laurent Pinchart wrote:
> > > Hi Michael,
> > > 
> > > Thank you for the patch.
> > > 
> > > On Mon, Sep 11, 2023 at 04:05:28PM +0200, Michael Grzeschik wrote:
> > > > Since the uvc-video gadget driver is using the v4l2 interface,
> > > > the streamon and streamoff can be triggered at any times. To ensure
> > > > that the pump worker will be closed as soon the userspace is
> > > > calling streamoff we synchronize the state of the gadget ensuring
> > > > the pump worker to bail out.
> > > 
> > > I'm sorry but I really dislike this. Not only does the patch fail to
> > > ensure real synchronization, as the uvcg_video_pump() function still
> > > runs asynchronously, it messes up the usage of the state field that now
> > > tracks the state both from a host point of view (which it was doing so
> > > far, updating the state based on callbacks from the UDC), and from a
> > > gadget userspace point of view. This lacks clarity and is confusing.
> > > Furthermore, the commit message doesn't even explain what issue is being
> > > fixed here.
> > > 
> > > Greg, I think this series has been merged too soon :-(
> > 
> > Ok, I'll go revert them now, thanks for the review.
> 
> Or we can wait a day for Michael to reply, in case this can quickly be
> fixed on top for v6.7. I'm now reading on the loooon discussion from v1,
> and reviewing the other pending patches that try to tackle the same
> issue.

I'd rather take a patchset that everyone agrees with, reverting was easy
and now done.

thanks,

greg k-h
