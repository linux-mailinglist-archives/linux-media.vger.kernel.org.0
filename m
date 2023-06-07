Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2400C726743
	for <lists+linux-media@lfdr.de>; Wed,  7 Jun 2023 19:27:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229893AbjFGR1g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jun 2023 13:27:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbjFGR1e (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jun 2023 13:27:34 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88F06213B
        for <linux-media@vger.kernel.org>; Wed,  7 Jun 2023 10:27:08 -0700 (PDT)
Received: from pendragon.ideasonboard.com (om126233170111.36.openmobile.ne.jp [126.233.170.111])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 25A6F74C;
        Wed,  7 Jun 2023 19:26:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1686158801;
        bh=x71GIRK1MzEw98Y83/eMk/JC80FEhJlvLA5JeyWCPM8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=O5jaU5QCic0GIczcyRnltry4P/KfgeoYAdweYDhI3aTrrHr3+mn5zNyWe0co7zlUg
         1UG7mACc87+sryRA4wkhEGL3LeoWgb+7HqImqtA89+JLi9UKU+CJzbM0EndWTwdZgl
         5BEq5lRXOHtEdtvfLU7nRucrJ+I+kwmyenGm9si4=
Date:   Wed, 7 Jun 2023 20:27:03 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dmitry Perchanov <dmitry.perchanov@intel.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@intel.com>
Subject: Re: [GIT PULL FOR v6.5] uvcvideo changes
Message-ID: <20230607172703.GE5058@pendragon.ideasonboard.com>
References: <20230605183025.GA22339@pendragon.ideasonboard.com>
 <2e66f338213f828b6bc1d97e30da93da08cad8fe.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2e66f338213f828b6bc1d97e30da93da08cad8fe.camel@intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dmitry,

On Wed, Jun 07, 2023 at 08:21:18PM +0300, Dmitry Perchanov wrote:
> Hi Laurent,
> 
> There is path mistake for patch:
> media: uapi: v4l: Intel metadata format update
> 
> Probably pull request was misformated.
> 
> It is submitted with correct path and I fetched your tag and file is
> in place.
> 
> Thanks for your patience.
> 
> Dmitry P.
>  
> On Mon, 2023-06-05 at 21:30 +0300, Laurent Pinchart wrote:
> > Hi Mauro,
> > 
> > The following changes since commit 9561de3a55bed6bdd44a12820ba81ec416e705a7:
> > 
> >   Linux 6.4-rc5 (2023-06-04 14:04:27 -0400)
> > 
> > are available in the Git repository at:
> > 
> >   git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git tags/media-uvc-next-20230606
> > 
> > for you to fetch changes up to 9bfc8e4d0972d3732bd8c6038c2bf1636780d727:
> > 
> >   media: uvcvideo: Constify descriptor buffers (2023-06-05 18:39:47 +0300)
> > 
> > Please note that this pull request is based on v6.4-rc5 as it depends on
> > a fix that was merged in that version.
> > 
> > ----------------------------------------------------------------
> > Miscellaneous uvcvideo changes:
> > 
> > - Support for more Intel RealSense devices
> > - Small cleanups and constifications
> > - Drop duplicate device
> > 
> > ----------------------------------------------------------------
> > Dmitry Perchanov (2):
> >       media: uapi: v4l: Intel metadata format update
> >       media: uvcvideo: Enable Intel RealSense metadata for devices
> > 
> > Laurent Pinchart (7):
> >       media: uvcvideo: Rename uvc_streaming 'format' field to 'formats'
> >       media: uvcvideo: Rename uvc_format 'frame' field to 'frames'
> >       media: uvcvideo: Use clamp() to replace manual implementation
> >       media: uvcvideo: Reorganize format descriptor parsing
> >       media: uvcvideo: Increment intervals pointer at end of parsing
> >       media: uvcvideo: Constify formats, frames and intervals
> >       media: uvcvideo: Constify descriptor buffers
> > 
> > Sakari Ailus (1):
> >       Revert "media: uvcvideo: Limit power line control for Acer EasyCamera"
> > 
> >  .../userspace-api/media/v4l/pixfmt-meta-d4xx.rst   |  55 +++++++--
> 
> This path above is incorrect.

git shortens long lines by removing the left-most parts of the path and
replacing it with '...'. The file is in
Documentation/userspace-api/media/v4l/pixfmt-meta-d4xx.rst, it's only
the shortlog that shows the shortened path.

> >  drivers/media/usb/uvc/uvc_driver.c                 | 137 ++++++++++++++++-----
> >  drivers/media/usb/uvc/uvc_v4l2.c                   |  79 ++++++------
> >  drivers/media/usb/uvc/uvc_video.c                  |  20 +--
> >  drivers/media/usb/uvc/uvcvideo.h                   |  12 +-
> >  5 files changed, 208 insertions(+), 95 deletions(-)

-- 
Regards,

Laurent Pinchart
