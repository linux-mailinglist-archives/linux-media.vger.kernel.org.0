Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2A5B7B9E15
	for <lists+linux-media@lfdr.de>; Thu,  5 Oct 2023 16:01:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232422AbjJEN6T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Oct 2023 09:58:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231237AbjJEN4S (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Oct 2023 09:56:18 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 293649037;
        Thu,  5 Oct 2023 01:47:58 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E161C57E;
        Thu,  5 Oct 2023 10:46:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1696495570;
        bh=yyZkL3J0cAG69HxOIHd2njTkV5Y3dqSsqRG6fdLy8wo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gaZQe4MFEjjJQ7qmyxmz2zo7ADttChrv79R8RaxrV4b1opqmiwoCk8i00TR+ZRgK7
         ZDsIItpZ0sBpIGZa2e8d1EG7NTbEBEQ9f20EMZceotV6pEGzh5Yb8Z1vtH3sJfwmd7
         zTJ6wjxMEfymcf3JPCnz51WuyonvLiYO17ThSAi4=
Date:   Thu, 5 Oct 2023 11:48:05 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Michael Grzeschik <m.grzeschik@pengutronix.de>,
        linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        dan.scally@ideasonboard.com, nicolas@ndufresne.ca,
        kernel@pengutronix.de
Subject: Re: [PATCH v2 1/3] usb: gadget: uvc: stop pump thread on video
 disable
Message-ID: <20231005084805.GB31450@pendragon.ideasonboard.com>
References: <20230911140530.2995138-1-m.grzeschik@pengutronix.de>
 <20230911140530.2995138-2-m.grzeschik@pengutronix.de>
 <20231005081716.GA13853@pendragon.ideasonboard.com>
 <2023100557-crabbing-superhero-02f9@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2023100557-crabbing-superhero-02f9@gregkh>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Oct 05, 2023 at 10:40:10AM +0200, Greg KH wrote:
> On Thu, Oct 05, 2023 at 11:17:16AM +0300, Laurent Pinchart wrote:
> > Hi Michael,
> > 
> > Thank you for the patch.
> > 
> > On Mon, Sep 11, 2023 at 04:05:28PM +0200, Michael Grzeschik wrote:
> > > Since the uvc-video gadget driver is using the v4l2 interface,
> > > the streamon and streamoff can be triggered at any times. To ensure
> > > that the pump worker will be closed as soon the userspace is
> > > calling streamoff we synchronize the state of the gadget ensuring
> > > the pump worker to bail out.
> > 
> > I'm sorry but I really dislike this. Not only does the patch fail to
> > ensure real synchronization, as the uvcg_video_pump() function still
> > runs asynchronously, it messes up the usage of the state field that now
> > tracks the state both from a host point of view (which it was doing so
> > far, updating the state based on callbacks from the UDC), and from a
> > gadget userspace point of view. This lacks clarity and is confusing.
> > Furthermore, the commit message doesn't even explain what issue is being
> > fixed here.
> > 
> > Greg, I think this series has been merged too soon :-(
> 
> Ok, I'll go revert them now, thanks for the review.

Or we can wait a day for Michael to reply, in case this can quickly be
fixed on top for v6.7. I'm now reading on the loooon discussion from v1,
and reviewing the other pending patches that try to tackle the same
issue.

-- 
Regards,

Laurent Pinchart
