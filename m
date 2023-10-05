Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1BDE7BA1E3
	for <lists+linux-media@lfdr.de>; Thu,  5 Oct 2023 17:02:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230042AbjJEPCU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Oct 2023 11:02:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233909AbjJEPAu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Oct 2023 11:00:50 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD19816A97
        for <linux-media@vger.kernel.org>; Thu,  5 Oct 2023 07:37:31 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 901E2C116AD;
        Thu,  5 Oct 2023 08:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1696495212;
        bh=mwYaaJbWlAoopqVEUrMRNTuhiIF9DxtU8jT69JwJkzc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=z8VVPNJzgmmhxQaQ6f2FwT4nIhXH1wTWASWD0bnxEc5r1uDnsWbi9tfLqgkvwIp9y
         GxDNIJLkIuki8KJM6nBPy0cvtIkDZiYqNSKIIM4H+vYPR5C7Qbf1FYZS0mPC3VCgNG
         xSjLYqyHhp3UK3By74Zf5YWH7ekeO82TTIbAxnww=
Date:   Thu, 5 Oct 2023 10:40:10 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Michael Grzeschik <m.grzeschik@pengutronix.de>,
        linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        dan.scally@ideasonboard.com, nicolas@ndufresne.ca,
        kernel@pengutronix.de
Subject: Re: [PATCH v2 1/3] usb: gadget: uvc: stop pump thread on video
 disable
Message-ID: <2023100557-crabbing-superhero-02f9@gregkh>
References: <20230911140530.2995138-1-m.grzeschik@pengutronix.de>
 <20230911140530.2995138-2-m.grzeschik@pengutronix.de>
 <20231005081716.GA13853@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231005081716.GA13853@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Oct 05, 2023 at 11:17:16AM +0300, Laurent Pinchart wrote:
> Hi Michael,
> 
> Thank you for the patch.
> 
> On Mon, Sep 11, 2023 at 04:05:28PM +0200, Michael Grzeschik wrote:
> > Since the uvc-video gadget driver is using the v4l2 interface,
> > the streamon and streamoff can be triggered at any times. To ensure
> > that the pump worker will be closed as soon the userspace is
> > calling streamoff we synchronize the state of the gadget ensuring
> > the pump worker to bail out.
> 
> I'm sorry but I really dislike this. Not only does the patch fail to
> ensure real synchronization, as the uvcg_video_pump() function still
> runs asynchronously, it messes up the usage of the state field that now
> tracks the state both from a host point of view (which it was doing so
> far, updating the state based on callbacks from the UDC), and from a
> gadget userspace point of view. This lacks clarity and is confusing.
> Furthermore, the commit message doesn't even explain what issue is being
> fixed here.
> 
> Greg, I think this series has been merged too soon :-(

Ok, I'll go revert them now, thanks for the review.

greg k-h
