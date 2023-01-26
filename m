Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21A3167D8C0
	for <lists+linux-media@lfdr.de>; Thu, 26 Jan 2023 23:48:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232873AbjAZWsh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 17:48:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232852AbjAZWsg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 17:48:36 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4354838E99
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 14:48:35 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9F4AA975;
        Thu, 26 Jan 2023 23:48:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674773313;
        bh=u379sj/bBgAMripwLKZPVx5M8iJG+dLyncmbuKI5xbc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YZvTzU+2CXZ7v5HHAJQT0Nzca3E1Mxozy4IV2f4SuBfe9mpJmgzgDCE1CkjG/hpM7
         J9kNYTVq8gmQjirfp9sLHV702XiNYe4Hsakpej3t2D7UVOuQ7a1Wil+QpyBmfW3zY8
         chCpnuHDbncF5Z7VI3OYueBZow33HgJuCrIOwSwY=
Date:   Fri, 27 Jan 2023 00:48:28 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Michael Grzeschik <mgr@pengutronix.de>
Cc:     marex@denx.de, gregkh@linuxfoundation.org, kernel@pengutronix.de,
        linux-media@vger.kernel.org
Subject: Re: [GIT PULL FOR v6.3] uvcgadget changes
Message-ID: <Y9MDPEyN8+oRPkre@pendragon.ideasonboard.com>
References: <20230124144929.GB19219@pengutronix.de>
 <Y8/6vHUoB4WjbLk2@kroah.com>
 <20230124161709.GA23507@pengutronix.de>
 <20230126223330.GI7611@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230126223330.GI7611@pengutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On Thu, Jan 26, 2023 at 11:33:30PM +0100, Michael Grzeschik wrote:
> On Tue, Jan 24, 2023 at 05:17:09PM +0100, Michael Grzeschik wrote:
> > On Tue, Jan 24, 2023 at 04:35:24PM +0100, Greg KH wrote:
> >> On Tue, Jan 24, 2023 at 03:49:29PM +0100, Michael Grzeschik wrote:
> >>> The following changes since commit 82adfe34694c98f1115a7b75cff6af9c4a35dba9:
> >>>
> >>> Merge tag 'media-uvc-next-20230115' of git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux into media_stage (2023-01-22 08:43:14 +0100)
> >>>
> >>> are available in the Git repository at:
> >>>
> >>> git://git.pengutronix.de/mgr/linux tags/uvc-gadget-next-20230124
> >>>
> >>> for you to fetch changes up to e88f760d0f7054f49aa68b75bf0530840f031d34:
> >>>
> >>> usb: uvc: use v4l2_fill_fmtdesc instead of open coded format name (2023-01-24 15:26:07 +0100)
> >>>
> >>> ----------------------------------------------------------------
> >>> Marek Vasut (1):
> >>>     media: uvcvideo: Add GUID for BGRA/X 8:8:8:8
> >>>
> >>> Michael Grzeschik (4):
> >>>     usb: uvc: move media/v4l2-uvc.h to usb/uvc.h
> >>>     usb: uvc: move uvc_fmts and uvc_format_by_guid to own compile unit
> >>>     usb: uvc: make uvc_format_desc table const
> >>>     usb: uvc: use v4l2_fill_fmtdesc instead of open coded format name
> >>
> >> Sorry, but I can't take patches like this as a pull request.  I want to
> >> see the real patches and get people to review them properly that way.
> >
> > I just did like Laurent suggested. Since the series was already properly
> > reviewed I also thought this would be fine.
> >
> > https://lore.kernel.org/linux-media/Y8VdpQGcqmoKESk8@pendragon.ideasonboard.com/
> >
> > Anyway. I can send another round with the patch from Marek in the
> > series.
> 
> I am unsure how to proceed here.
> 
> I could send the series again and hope for Greg to take them. But
> without Mauros merge of your changes underneath, Greg will not be
> able to apply my series.

I think Greg would like to see a v3 of the series exactly as it exists
in your branch, based on top of media-uvc-next-20230115, with Marek's
patch included. Could you post that, and indicate in the cover letter
than it applies on top of

git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git media-uvc-next-20230115

which has been merged in the Linux media tree for v6.3 (as shown by
https://git.linuxtv.org/media_stage.git/commit/?id=82adfe34694c98f1115a7b75cff6af9c4a35dba9).

Greg, can you then merge that tag in your tree first, and then pick
Michael's patches up on top ?

-- 
Regards,

Laurent Pinchart
