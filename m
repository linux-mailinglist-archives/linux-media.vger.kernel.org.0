Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1028967DE58
	for <lists+linux-media@lfdr.de>; Fri, 27 Jan 2023 08:15:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232038AbjA0HPe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Jan 2023 02:15:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231769AbjA0HPd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Jan 2023 02:15:33 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5DB745F66
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 23:15:29 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 57C74619EB
        for <linux-media@vger.kernel.org>; Fri, 27 Jan 2023 07:15:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CBE5C433D2;
        Fri, 27 Jan 2023 07:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1674803728;
        bh=0RhprIRGcYQQjw+lfWUpycE8l6HXlVurbYVUmzm1gio=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rVAtHboqItd1kpXsNCUnGlKLF6F1Fcs4x0jTGEMkQoqRQVhjwm4Fh42PEc8XuvBkk
         QOPXKU1YUtSYLrOfcREc5ii7HwJRoMbYD6MUCDpPXksz9ovCy33h4KquJFHROAAxLf
         AWiaZ2dheuv+J5dvT8MpZVqctYp8FMqpA7bo3EPI=
Date:   Fri, 27 Jan 2023 08:15:25 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Michael Grzeschik <mgr@pengutronix.de>, marex@denx.de,
        kernel@pengutronix.de, linux-media@vger.kernel.org
Subject: Re: [GIT PULL FOR v6.3] uvcgadget changes
Message-ID: <Y9N6DYUHcS9hzIte@kroah.com>
References: <20230124144929.GB19219@pengutronix.de>
 <Y8/6vHUoB4WjbLk2@kroah.com>
 <20230124161709.GA23507@pengutronix.de>
 <20230126223330.GI7611@pengutronix.de>
 <Y9MDPEyN8+oRPkre@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y9MDPEyN8+oRPkre@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jan 27, 2023 at 12:48:28AM +0200, Laurent Pinchart wrote:
> Hello,
> 
> On Thu, Jan 26, 2023 at 11:33:30PM +0100, Michael Grzeschik wrote:
> > On Tue, Jan 24, 2023 at 05:17:09PM +0100, Michael Grzeschik wrote:
> > > On Tue, Jan 24, 2023 at 04:35:24PM +0100, Greg KH wrote:
> > >> On Tue, Jan 24, 2023 at 03:49:29PM +0100, Michael Grzeschik wrote:
> > >>> The following changes since commit 82adfe34694c98f1115a7b75cff6af9c4a35dba9:
> > >>>
> > >>> Merge tag 'media-uvc-next-20230115' of git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux into media_stage (2023-01-22 08:43:14 +0100)
> > >>>
> > >>> are available in the Git repository at:
> > >>>
> > >>> git://git.pengutronix.de/mgr/linux tags/uvc-gadget-next-20230124
> > >>>
> > >>> for you to fetch changes up to e88f760d0f7054f49aa68b75bf0530840f031d34:
> > >>>
> > >>> usb: uvc: use v4l2_fill_fmtdesc instead of open coded format name (2023-01-24 15:26:07 +0100)
> > >>>
> > >>> ----------------------------------------------------------------
> > >>> Marek Vasut (1):
> > >>>     media: uvcvideo: Add GUID for BGRA/X 8:8:8:8
> > >>>
> > >>> Michael Grzeschik (4):
> > >>>     usb: uvc: move media/v4l2-uvc.h to usb/uvc.h
> > >>>     usb: uvc: move uvc_fmts and uvc_format_by_guid to own compile unit
> > >>>     usb: uvc: make uvc_format_desc table const
> > >>>     usb: uvc: use v4l2_fill_fmtdesc instead of open coded format name
> > >>
> > >> Sorry, but I can't take patches like this as a pull request.  I want to
> > >> see the real patches and get people to review them properly that way.
> > >
> > > I just did like Laurent suggested. Since the series was already properly
> > > reviewed I also thought this would be fine.
> > >
> > > https://lore.kernel.org/linux-media/Y8VdpQGcqmoKESk8@pendragon.ideasonboard.com/
> > >
> > > Anyway. I can send another round with the patch from Marek in the
> > > series.
> > 
> > I am unsure how to proceed here.
> > 
> > I could send the series again and hope for Greg to take them. But
> > without Mauros merge of your changes underneath, Greg will not be
> > able to apply my series.
> 
> I think Greg would like to see a v3 of the series exactly as it exists
> in your branch, based on top of media-uvc-next-20230115, with Marek's
> patch included. Could you post that, and indicate in the cover letter
> than it applies on top of
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git media-uvc-next-20230115
> 
> which has been merged in the Linux media tree for v6.3 (as shown by
> https://git.linuxtv.org/media_stage.git/commit/?id=82adfe34694c98f1115a7b75cff6af9c4a35dba9).
> 
> Greg, can you then merge that tag in your tree first, and then pick
> Michael's patches up on top ?

Yes, I will be glad to do that, thanks.

greg k-h
