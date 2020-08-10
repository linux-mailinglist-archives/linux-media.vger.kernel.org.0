Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88C67240267
	for <lists+linux-media@lfdr.de>; Mon, 10 Aug 2020 09:24:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725984AbgHJHYi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Aug 2020 03:24:38 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:52997 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725911AbgHJHYh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Aug 2020 03:24:37 -0400
X-Originating-IP: 82.52.18.94
Received: from uno.localdomain (host-82-52-18-94.retail.telecomitalia.it [82.52.18.94])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id C0BC640008;
        Mon, 10 Aug 2020 07:24:32 +0000 (UTC)
Date:   Mon, 10 Aug 2020 09:28:14 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
        libcamera-devel@lists.libcamera.org
Subject: Re: your mail
Message-ID: <20200810072814.vwr4ba5uv3ps7dfj@uno.localdomain>
References: <20200805105721.15445-1-jacopo@jmondi.org>
 <20200809155311.GB5981@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200809155311.GB5981@pendragon.ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Sun, Aug 09, 2020 at 06:53:11PM +0300, Laurent Pinchart wrote:
> Hi Jacopo,
>
> On Wed, Aug 05, 2020 at 12:57:17PM +0200, Jacopo Mondi wrote:
> > Subject: [PATCH 0/4] media: docs: Document pixel array properties
> >
> > Hans' patch "[PATCH] imx219: selection compliance fixes" sparkled a discussion
> > on how the V4L2 selection targets have to be used in order to access an
> > image sensor pixel array properties.
> >
> > The discussion shown how much under-specified that part was, so this is
> > an attempt to provide a bit documentation for this.
> >
> > My feeling is that we're hijacking the existing targets for this use case
> > and we should probably define new ones, considering how few users we have in
> > mainline of them at the moment.
>
> Do you mean you think we should create new targets instead of reusing
> the existing ones as you do in this series ? I don't see anything really
> wrong in reusing the existing targets, provided we document them
> properly, and it's not too much of a hack (that is, the documented
> purpose reasonably matches the target name), but maybe I'm missing the
> issue.

Yes, that's what I meant.

To me, if you have something and you need to document it with "if
applied to X it means Y, if applied to Z it means W etcetc" feels like
we're abusing it. Having sensor's specific targets would make clear
what a target represents without the ambiguities of defining the
symbol semantic depending on the device it applies to (which means
userspace would need to know what kind of device it's dealing with
precisely).

That said, my preference would be using a different API, but see my
reply to your other email for that.

Thanks
  j

>
> > On top Hans' patch with reworded commit message and minor updates.
> >
> > For reference, we're using the V4L2 selection targets in libcamera to retrieve
> > the sensor pixel array properties to be reported to applications for
> > calibration purposes. The currently defined pixel properties for libcamera
> > are available here:
> > https://git.linuxtv.org/libcamera.git/tree/src/libcamera/property_ids.yaml#n390
> >
> > Thanks
> >    j
> >
> > Hans Verkuil (1):
> >   media: i2c: imx219: Selection compliance fixes
> >
> > Jacopo Mondi (3):
> >   media: docs: Describe pixel array properties
> >   media: docs: Describe targets for sensor properties
> >   media: docs: USe SUBDEV_G_SELECTION for sensor properties
> >
> >  .../userspace-api/media/v4l/dev-subdev.rst    | 85 +++++++++++++++++++
> >  .../media/v4l/v4l2-selection-targets.rst      | 49 +++++++++++
> >  .../media/v4l/vidioc-subdev-g-selection.rst   |  4 +
> >  drivers/media/i2c/imx219.c                    | 17 ++--
> >  4 files changed, 147 insertions(+), 8 deletions(-)
>
> --
> Regards,
>
> Laurent Pinchart
