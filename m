Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D11747551F
	for <lists+linux-media@lfdr.de>; Wed, 15 Dec 2021 10:25:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236355AbhLOJZQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Dec 2021 04:25:16 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:36194 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233708AbhLOJZP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Dec 2021 04:25:15 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3A1F561853
        for <linux-media@vger.kernel.org>; Wed, 15 Dec 2021 09:25:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95117C34600;
        Wed, 15 Dec 2021 09:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639560314;
        bh=Boi5KTv+fWa939z6smBHV7KAPcNZQ8kMnVrmfnBWFlI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=uddsRJD6hj0c8/VgEn8k8fIcbDPzGfvheB9m3WA0i2jhpKKEzGIJblPpx82HXLv/6
         jMAS6KVanLLcrADyzBJHfRR5yCnrnziSnIoHnkTZBZs7jLapCXuUYZK91KL0dHDuXP
         2kSrEhpQn7bRYOTHGIUqdEWcP4iPXeirfWTtJ7FkmHx1xJ5Hz/1i1EfVAdNCHSCf2Z
         vAB/UnIaIbNk1EHWa9n1ZlqoNfqbIIlLKiZVCRuvMYhG8/WLLdmkmLTZLFShQgV0D+
         tSs2X6KkvLU/kn7MbC1I8idmhFpQx93U2PVs2u/J0sbLRBw2dIPVOuE6jHszfY//8b
         mxHMKFV2a+BBg==
Date:   Wed, 15 Dec 2021 10:25:09 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        hanlinchen@chromium.org, tfiga@chromium.org, hdegoede@redhat.com,
        kieran.bingham@ideasonboard.com, hpa@redhat.com
Subject: Re: [PATCH 0/5] Introduce ancillary links
Message-ID: <20211215102509.2969578d@coco.lan>
In-Reply-To: <20211213232849.40071-1-djrscally@gmail.com>
References: <20211213232849.40071-1-djrscally@gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon, 13 Dec 2021 23:28:44 +0000
Daniel Scally <djrscally@gmail.com> escreveu:

> Hello all
> 
> At present there's no means in the kernel of describing the supporting
> relationship between subdevices that work together to form an effective single
> unit - the type example in this case being a camera sensor and its
> corresponding vcm. To attempt to solve that, this series adds a new type of
> media link called MEDIA_LNK_FL_ANCILLARY_LINK, which connects two instances of
> struct media_entity.
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
> Thoughts and comments very welcome 

The idea of ancillary link sounds interesting. I did a quick look at
the series. 

Laurent already did some good points during his review.
Besides that, one thing it is missing, though, is an implementation on
a driver. At least vimc should gain an implementation at this series,
in order to allow media developers to test and see how the graph will
be after the patch series.

Regards,
Mauro

> 
> Dan
> 
> Daniel Scally (5):
>   media: media.h: Add new media link type
>   media: entity: Add link_type() helper
>   media: entity: Skip non-data links in graph iteration
>   media: entity: Add support for ancillary links
>   media: v4l2-async: Create links during v4l2_async_match_notify()
> 
>  drivers/media/mc/mc-entity.c         | 56 ++++++++++++++++++++++++++--
>  drivers/media/v4l2-core/v4l2-async.c | 51 +++++++++++++++++++++++++
>  include/media/media-entity.h         | 29 ++++++++++++++
>  include/uapi/linux/media.h           |  1 +
>  4 files changed, 134 insertions(+), 3 deletions(-)
> 



Thanks,
Mauro
