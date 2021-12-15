Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C367475584
	for <lists+linux-media@lfdr.de>; Wed, 15 Dec 2021 10:52:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241319AbhLOJwn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Dec 2021 04:52:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233733AbhLOJwn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Dec 2021 04:52:43 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD92BC061574
        for <linux-media@vger.kernel.org>; Wed, 15 Dec 2021 01:52:42 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0F2C6292;
        Wed, 15 Dec 2021 10:52:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1639561961;
        bh=78AHd+3m++S+gX2fZ38+9vvLLDBXS9tzJ+NOscEhWFA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=t3NKqhHkKnrOL1AB7jpXcP7lEu6kC/m3rdTkYDOMQ5A5Bylzsj9t6DEm249DzJU0j
         XBNNj0M9tVv8xKMYeGKiI4MlV3D2oGD07u5c6/Yz2MvYPEGVvxBcl6xBHYtf0QyKhI
         EKGNx8+TVVDM0PFYjIy0NqnCmDZJXkCZS7kiaG6A=
Date:   Wed, 15 Dec 2021 11:52:38 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Daniel Scally <djrscally@gmail.com>, linux-media@vger.kernel.org,
        libcamera-devel@lists.libcamera.org, sakari.ailus@linux.intel.com,
        hanlinchen@chromium.org, tfiga@chromium.org, hdegoede@redhat.com,
        kieran.bingham@ideasonboard.com, hpa@redhat.com
Subject: Re: [PATCH 0/5] Introduce ancillary links
Message-ID: <Ybm65tksXsT6N2B4@pendragon.ideasonboard.com>
References: <20211213232849.40071-1-djrscally@gmail.com>
 <20211215102509.2969578d@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211215102509.2969578d@coco.lan>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On Wed, Dec 15, 2021 at 10:25:09AM +0100, Mauro Carvalho Chehab wrote:
> Em Mon, 13 Dec 2021 23:28:44 +0000 Daniel Scally escreveu:
> 
> > Hello all
> > 
> > At present there's no means in the kernel of describing the supporting
> > relationship between subdevices that work together to form an effective single
> > unit - the type example in this case being a camera sensor and its
> > corresponding vcm. To attempt to solve that, this series adds a new type of
> > media link called MEDIA_LNK_FL_ANCILLARY_LINK, which connects two instances of
> > struct media_entity.
> > 
> > The mechanism of connection I have modelled as a notifier and async subdev,
> > which seemed the best route since sensor drivers already typically will call
> > v4l2_async_register_subdev_sensor() on probe, and that function already looks
> > for a reference to a firmware node with the reference named "lens-focus". To
> > avoid boilerplate in the sensor drivers, I added some new functions in
> > v4l2-async that are called in v4l2_async_match_notify() to create the ancillary
> > links - checking the entity.function of both notifier and subdev to make sure
> > that's appropriate. I haven't gone further than that yet, but I suspect we could
> > cut down on code elsewhere by, for example, also creating pad-to-pad links in
> > the same place.
> > 
> > Thoughts and comments very welcome 
> 
> The idea of ancillary link sounds interesting. I did a quick look at
> the series. 
> 
> Laurent already did some good points during his review.
> Besides that, one thing it is missing, though, is an implementation on
> a driver. At least vimc should gain an implementation at this series,
> in order to allow media developers to test and see how the graph will
> be after the patch series.

The whole point of patch 4/4 is to create those links in the core
without requiring manual involvement of the drivers :-)

> > Daniel Scally (5):
> >   media: media.h: Add new media link type
> >   media: entity: Add link_type() helper
> >   media: entity: Skip non-data links in graph iteration
> >   media: entity: Add support for ancillary links
> >   media: v4l2-async: Create links during v4l2_async_match_notify()
> > 
> >  drivers/media/mc/mc-entity.c         | 56 ++++++++++++++++++++++++++--
> >  drivers/media/v4l2-core/v4l2-async.c | 51 +++++++++++++++++++++++++
> >  include/media/media-entity.h         | 29 ++++++++++++++
> >  include/uapi/linux/media.h           |  1 +
> >  4 files changed, 134 insertions(+), 3 deletions(-)

-- 
Regards,

Laurent Pinchart
