Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 463764A0291
	for <lists+linux-media@lfdr.de>; Fri, 28 Jan 2022 22:12:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239231AbiA1VL5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jan 2022 16:11:57 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:44488 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351334AbiA1VL4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jan 2022 16:11:56 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2E3AA471;
        Fri, 28 Jan 2022 22:11:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1643404315;
        bh=3RP0KZlqBg6gAHtq91vqwCX0wJm5HFwIHhBxEPi+fKI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=byJs3D9hwnfIZFoWRU7zt4+/tQ6Wsck7lDNA+3w2Vb50yPMmNZQQ3kXveeqY5ekq6
         Zi/TeGYl0dSuENZpe31kTPkP3orpN3PeZxveijxJCbzOUwBT9us/o3Qjh7aOA1IV3f
         gFhj6J6jC3mntSda6s5//lOwz9roSOWMpZWA2Rhc=
Date:   Fri, 28 Jan 2022 23:11:33 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil@xs4all.nl>, Sean Young <sean@mess.org>
Subject: Re: [GIT PULL v2 FOR 5.18] V4L2 patches
Message-ID: <YfRcBaVnWCkd+AF3@pendragon.ideasonboard.com>
References: <Ye7QMv0OBntzuC1C@valkosipuli.retiisi.eu>
 <20220128195312.092b1d3d@coco.lan>
 <YfQ9eMB2aP5iH6AZ@valkosipuli.retiisi.eu>
 <20220128215713.1abef17b@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220128215713.1abef17b@coco.lan>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Glad to see you're still alive :-)

On Fri, Jan 28, 2022 at 09:57:13PM +0100, Mauro Carvalho Chehab wrote:
> Em Fri, 28 Jan 2022 21:01:12 +0200 Sakari Ailus escreveu:
> > On Fri, Jan 28, 2022 at 07:53:12PM +0100, Mauro Carvalho Chehab wrote:
> > > Em Mon, 24 Jan 2022 18:13:38 +0200 Sakari Ailus escreveu:
> > >   
> > > > Hi Mauro,
> > > > 
> > > > Here's a bunch of patches again for 5.18. Most notably there's V4L2 fwnode
> > > > / mbus_config cleanup by Laurent, the hi847 camera sensor driver from Shawn
> > > > Tu and the od08d10 camera sensor driver by Jimmy Su. Fixes elsewhere are
> > > > included, too.
> > > > 
> > > > Since v1, a few more patches have been added and I've dropped a camss patch
> > > > already picked by Hans.
> > > > 
> > > > Please pull.
> > > > 
> > > > 
> > > > The following changes since commit 68b9bcc8a534cd11fe55f8bc82f948aae7d81b3c:
> > > > 
> > > >   media: ipu3-cio2: Add support for instantiating i2c-clients for VCMs (2021-12-16 20:58:56 +0100)
> > > > 
> > > > are available in the Git repository at:
> > > > 
> > > >   git://linuxtv.org/sailus/media_tree.git tags/for-5.18-1.1-signed
> > > > 
> > > > for you to fetch changes up to a6876b00e5daa786a406db09f214bbbb4d1f200c:
> > > > 
> > > >   media: i2c: dw9714: add optional regulator support (2022-01-22 18:27:43 +0200)
> > > > 
> > > > ----------------------------------------------------------------
> > > > V4L2 patches for 5.18
> > > > 
> > > > ----------------------------------------------------------------
> > > > Angus Ainslie (1):
> > > >       media: i2c: dw9714: add optional regulator support
> > > > 
> > > > Benjamin Gaignard (1):
> > > >       MAINTAINERS: Update Benjamin Gaignard maintainer status
> > > > 
> > > > Bingbu Cao (1):
> > > >       media: ov2740: identify module after subdev initialisation
> > > > 
> > > > Janusz Krzysztofik (4):
> > > >       media: ov6650: Fix set format try processing path
> > > >       media: ov6650: Add try support to selection API operations
> > > >       media: ov6650: Fix crop rectangle affected by set format
> > > >       media: ov6650: Fix missing frame interval enumeration support
> > > > 
> > > > Jimmy Su (1):
> > > >       media: i2c: Add ov08d10 camera sensor driver
> > > > 
> > > > Laurent Pinchart (9):
> > > >       media: pxa_camera: Drop usage of .set_mbus_config()
> > > >       media: i2c: ov6650: Drop implementation of .set_mbus_config()
> > > >       media: v4l2-subdev: Drop .set_mbus_config() operation
> > > >       media: v4l2-fwnode: Move bus config structure to v4l2_mediabus.h  
> > > >       media: v4l2-mediabus: Use structures to describe bus configuration
> > > >       media: v4l2-mediabus: Drop legacy V4L2_MBUS_CSI2_*_LANE flags
> > > >       media: v4l2-mediabus: Drop legacy V4L2_MBUS_CSI2_CHANNEL_* flags
> > > >       media: v4l2-mediabus: Drop V4L2_MBUS_CSI2_CONTINUOUS_CLOCK flag  
> > > 
> > > (Some of?) those broke build today:
> > > 	https://builder.linuxtv.org/job/media_stage_clang/412/
> > > 
> > > Probably due to a conflict some other pull request.
> > > 
> > > So, I dropped them. Please rebase and re-submit.  
> > 
> > It seems patches got merged that make use of [gs]et_mbus_config that is
> > changed by the patches. This isn't a very commonly used interface so
> > there's a bit of bad luck here.
> > 
> > I'll see what needs to be changed there.
> 
> Yeah, patches that change kAPI have the potential of getting
> such kind of conflicts. Thankfully we have now the media_stage
> tree, and Jenkins builds are working properly. So we were able to 
> solve it before reaching linux-next. No harm done.
> 
> > Please prioritise these on the next time, if possible.
> 
> (c/c the other media maintainers)
> 
> Sure. I usually priorize PRs that solve issues on previous one.
> 
> Yet, the order is not really important. I mean, if I end merging 
> two PRs again at the same day and one causes breakage on another
> due to kAPI changes, no matter where PR gets merged early, I 
> would still get a Jenkins compilation error again, and the 
> sanest way to solve such kind of conflicts is to drop the 
> kAPI changes.
> 
> So, what we need to do, instead, is to coordinate such changes
> with other maintainers and developers in order to ensure that 
> everyone that would rely on a deprecated kAPI that will be
> dropped will base their series on the top of the tree with the
> replacement kAPI.
> 
> Maybe we could start doing some annotations at the kAPI docs
> about any plans to deprecate such interfaces at least one
> or two kernel versions before actually applying the old
> API removal.
> 
> Comments?

That would slow down development.

I think this could be caught easily if we all merged pull requests in
the stage tree, in a -next branch. Jenkins should build that, and once
the build completes without errors, it could be merged in the master
branch, which you could then pull.

-- 
Regards,

Laurent Pinchart
