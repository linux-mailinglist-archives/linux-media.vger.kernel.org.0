Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76F122491DA
	for <lists+linux-media@lfdr.de>; Wed, 19 Aug 2020 02:37:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726745AbgHSAhH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Aug 2020 20:37:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725554AbgHSAhG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Aug 2020 20:37:06 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2076C061389
        for <linux-media@vger.kernel.org>; Tue, 18 Aug 2020 17:37:06 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 18F5729E;
        Wed, 19 Aug 2020 02:37:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1597797425;
        bh=doRQMUFC+gl9WuiGJoETbE6HxgeVfVjTifRLmyHCrWQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SVBA6AW7ygLQu5yd6RI/sN7KAMRjHqaQHd08wNTrunej1L5ODw659FIiuNO8gG1pG
         +NtUyOJpfCENDOe2uQ3qdz4UBAYuEPP2EAo/ldC5S0icOGVpzqGOjt24e4wODcfx/7
         rutq8Ee9nu/JPgiQurU0RXuDJgCGsbBr1szKXDMc=
Date:   Wed, 19 Aug 2020 03:36:47 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
        libcamera-devel@lists.libcamera.org
Subject: Re: your mail
Message-ID: <20200819003647.GH2360@pendragon.ideasonboard.com>
References: <20200805105721.15445-1-jacopo@jmondi.org>
 <20200809155311.GB5981@pendragon.ideasonboard.com>
 <20200810072814.vwr4ba5uv3ps7dfj@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200810072814.vwr4ba5uv3ps7dfj@uno.localdomain>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Mon, Aug 10, 2020 at 09:28:14AM +0200, Jacopo Mondi wrote:
> On Sun, Aug 09, 2020 at 06:53:11PM +0300, Laurent Pinchart wrote:
> > On Wed, Aug 05, 2020 at 12:57:17PM +0200, Jacopo Mondi wrote:
> > > Subject: [PATCH 0/4] media: docs: Document pixel array properties
> > >
> > > Hans' patch "[PATCH] imx219: selection compliance fixes" sparkled a discussion
> > > on how the V4L2 selection targets have to be used in order to access an
> > > image sensor pixel array properties.
> > >
> > > The discussion shown how much under-specified that part was, so this is
> > > an attempt to provide a bit documentation for this.
> > >
> > > My feeling is that we're hijacking the existing targets for this use case
> > > and we should probably define new ones, considering how few users we have in
> > > mainline of them at the moment.
> >
> > Do you mean you think we should create new targets instead of reusing
> > the existing ones as you do in this series ? I don't see anything really
> > wrong in reusing the existing targets, provided we document them
> > properly, and it's not too much of a hack (that is, the documented
> > purpose reasonably matches the target name), but maybe I'm missing the
> > issue.
> 
> Yes, that's what I meant.
> 
> To me, if you have something and you need to document it with "if
> applied to X it means Y, if applied to Z it means W etcetc" feels like
> we're abusing it.

I don't really agree, I think this is common, and I don't really see a
problem. Lots of V4L2 ioctls (or the structures they use) document how
they apply to capture and output devices for instance, and I don't think
that splitting ioctls into _CAPTURE and _OUTPUT variants would help
much.

If you were using a COMPOSE rectangle to specify a crop operation when
used with camera sensors it would of course be an API abuse, but as long
as CROP is crop, I see nothing wrong in differences in details of how
the rectangles apply to different types of devices.

> Having sensor's specific targets would make clear
> what a target represents without the ambiguities of defining the
> symbol semantic depending on the device it applies to (which means
> userspace would need to know what kind of device it's dealing with
> precisely).

Userspace would always need that, in order to pick the applicable
target.

> That said, my preference would be using a different API, but see my
> reply to your other email for that.
> 
> > > On top Hans' patch with reworded commit message and minor updates.
> > >
> > > For reference, we're using the V4L2 selection targets in libcamera to retrieve
> > > the sensor pixel array properties to be reported to applications for
> > > calibration purposes. The currently defined pixel properties for libcamera
> > > are available here:
> > > https://git.linuxtv.org/libcamera.git/tree/src/libcamera/property_ids.yaml#n390
> > >
> > > Thanks
> > >    j
> > >
> > > Hans Verkuil (1):
> > >   media: i2c: imx219: Selection compliance fixes
> > >
> > > Jacopo Mondi (3):
> > >   media: docs: Describe pixel array properties
> > >   media: docs: Describe targets for sensor properties
> > >   media: docs: USe SUBDEV_G_SELECTION for sensor properties
> > >
> > >  .../userspace-api/media/v4l/dev-subdev.rst    | 85 +++++++++++++++++++
> > >  .../media/v4l/v4l2-selection-targets.rst      | 49 +++++++++++
> > >  .../media/v4l/vidioc-subdev-g-selection.rst   |  4 +
> > >  drivers/media/i2c/imx219.c                    | 17 ++--
> > >  4 files changed, 147 insertions(+), 8 deletions(-)

-- 
Regards,

Laurent Pinchart
