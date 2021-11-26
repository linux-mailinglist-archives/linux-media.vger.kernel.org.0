Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 051F245E667
	for <lists+linux-media@lfdr.de>; Fri, 26 Nov 2021 04:02:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345036AbhKZDFS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Nov 2021 22:05:18 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:43028 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237257AbhKZDDL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Nov 2021 22:03:11 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C09C5340;
        Fri, 26 Nov 2021 03:59:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1637895598;
        bh=/0ZzhPI0j/d+Wdz9SOsh304ntMwGlhRenuwekVGpHqk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MAvPMWUcNoSuM+Gs1kq16S6nXwGCwZY7nqS4hD/52wfkjX14dELCE+VgqJgowG1d8
         A69tvO+0pMw4CXyYMJ5AROZkNw/FqRI8A6UXgSYDdCWJx6bLmxWpWHT1bId5AQgPx0
         NeKINRPuh5iHA6WWYTQDOpfZAC2YJ4M7RwwYqIrM=
Date:   Fri, 26 Nov 2021 04:59:34 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        hanlinchen@chromium.org, tfiga@chromium.org, hdegoede@redhat.com,
        kieran.bingham@ideasonboard.com
Subject: Re: [RFC PATCH 0/2] Introduce ancillary links
Message-ID: <YaBNlpcr+i6s5rng@pendragon.ideasonboard.com>
References: <20211126001603.41148-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211126001603.41148-1-djrscally@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Nov 26, 2021 at 12:16:01AM +0000, Daniel Scally wrote:
> Hello all
> 
> This series is not yet ready to merge, but I wanted to share it as I know some
> other folks are working in similar areas at the moment (and I am including the
> libcamera devel list for the same reason)

Seems you forgot to CC libcamera-devel :-) Let's fix that on v2.

> At present there's no means in the kernel of describing the supporting
> relationship between subdevices that work together to form an effective single
> unit - the type example in this case being a camera sensor and its
> corresponding vcm. To attempt to solve that, this series adds a new type of
> media link called MEDIA_LNK_FL_ANCILLARY_LINK, which connects two instances of
> struct media_entity. Further work would be needed to document it properly, and
> there may be ramifications within the v4l2-core which I have not yet discovered
> (a lot of places seem to assume that media_entity->links means pad-2-pad links,
> so some extra work might be needed to validate the link type before doing any
> thing to them).
> 
> The mechanism of connection I have modelled as a notifier and async subdev,
> which seemed the best route since sensor drivers already typically will call
> v4l2_async_register_subdev_sensor() on probe, and that function already looks
> for a reference to a firmware node with the reference named "lens-focus". To
> avoid boilerplate in the sensor drivers, I added some new functions in
> v4l2-async that are called in v4l2_async_match_notify() to create the ancillary
> links - checking the entity.function of both notifier and subdev to make sure
> that's appropriate. I haven't gone further than that yet, but I suspect we could
> cut down on code elsewhere by, for example, also creating pad-to-pad links in
> the same place.
> 
> Thoughts and comments very welcome :)
> 
> Dan
> 
> Daniel Scally (2):
>   media: entity: Add support for ancillary links
>   media: v4l2-async: Create links during v4l2_async_match_notify()
> 
>  drivers/media/mc/mc-entity.c         | 30 ++++++++++++++++
>  drivers/media/v4l2-core/v4l2-async.c | 51 ++++++++++++++++++++++++++++
>  include/media/media-entity.h         | 30 ++++++++++++++++
>  include/uapi/linux/media.h           |  1 +
>  4 files changed, 112 insertions(+)
> 

-- 
Regards,

Laurent Pinchart
