Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C73A4A0262
	for <lists+linux-media@lfdr.de>; Fri, 28 Jan 2022 21:57:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239235AbiA1U5V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jan 2022 15:57:21 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:40176 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236759AbiA1U5T (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jan 2022 15:57:19 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 536D261E49
        for <linux-media@vger.kernel.org>; Fri, 28 Jan 2022 20:57:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C2FAC340E7;
        Fri, 28 Jan 2022 20:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643403438;
        bh=sHKUbvK0RtlvkjpzfaWOCBoO/D18zt7Hz2IXrrbXzxg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=KcKrGmjr/JdJz40u0AT9WjcT0TeV68HYqk3iy1kgVgRIxMObHYFBw9YsS6IiEhED8
         BsLJN600nort8AO0tmMmmEtmdgwkU2k3Fp5KuqBKpwMSX/iCDhDowxysecGVjrNZ2H
         N0er+MfeAhqImC2xSqMbYGhkiIjldjHOt9PLVqf0oVBkBhAjq1+wgeUePvGtYXBY5U
         7qalWdwSXClbRzpS1jbPPJ7D6GycnxjE9Y05I/gNCr6VhirF3+Jp4uFLUyaZVQW6my
         Aw7Ahexyu/JBusmFuy7uL11FR8fxHiamSh/DcF4xzyG772JBvEuJ3zFlKQCduF+/hb
         fZrIZO7sKC3Cw==
Date:   Fri, 28 Jan 2022 21:57:13 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sean Young <sean@mess.org>
Subject: Re: [GIT PULL v2 FOR 5.18] V4L2 patches
Message-ID: <20220128215713.1abef17b@coco.lan>
In-Reply-To: <YfQ9eMB2aP5iH6AZ@valkosipuli.retiisi.eu>
References: <Ye7QMv0OBntzuC1C@valkosipuli.retiisi.eu>
        <20220128195312.092b1d3d@coco.lan>
        <YfQ9eMB2aP5iH6AZ@valkosipuli.retiisi.eu>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Fri, 28 Jan 2022 21:01:12 +0200
Sakari Ailus <sakari.ailus@iki.fi> escreveu:

> Hi Mauro,
> 
> On Fri, Jan 28, 2022 at 07:53:12PM +0100, Mauro Carvalho Chehab wrote:
> > Em Mon, 24 Jan 2022 18:13:38 +0200
> > Sakari Ailus <sakari.ailus@iki.fi> escreveu:
> >   
> > > Hi Mauro,
> > > 
> > > Here's a bunch of patches again for 5.18. Most notably there's V4L2 fwnode
> > > / mbus_config cleanup by Laurent, the hi847 camera sensor driver from Shawn
> > > Tu and the od08d10 camera sensor driver by Jimmy Su. Fixes elsewhere are
> > > included, too.
> > > 
> > > Since v1, a few more patches have been added and I've dropped a camss patch
> > > already picked by Hans.
> > > 
> > > Please pull.
> > > 
> > > 
> > > The following changes since commit 68b9bcc8a534cd11fe55f8bc82f948aae7d81b3c:
> > > 
> > >   media: ipu3-cio2: Add support for instantiating i2c-clients for VCMs (2021-12-16 20:58:56 +0100)
> > > 
> > > are available in the Git repository at:
> > > 
> > >   git://linuxtv.org/sailus/media_tree.git tags/for-5.18-1.1-signed
> > > 
> > > for you to fetch changes up to a6876b00e5daa786a406db09f214bbbb4d1f200c:
> > > 
> > >   media: i2c: dw9714: add optional regulator support (2022-01-22 18:27:43 +0200)
> > > 
> > > ----------------------------------------------------------------
> > > V4L2 patches for 5.18
> > > 
> > > ----------------------------------------------------------------
> > > Angus Ainslie (1):
> > >       media: i2c: dw9714: add optional regulator support
> > > 
> > > Benjamin Gaignard (1):
> > >       MAINTAINERS: Update Benjamin Gaignard maintainer status
> > > 
> > > Bingbu Cao (1):
> > >       media: ov2740: identify module after subdev initialisation
> > > 
> > > Janusz Krzysztofik (4):
> > >       media: ov6650: Fix set format try processing path
> > >       media: ov6650: Add try support to selection API operations
> > >       media: ov6650: Fix crop rectangle affected by set format
> > >       media: ov6650: Fix missing frame interval enumeration support
> > > 
> > > Jimmy Su (1):
> > >       media: i2c: Add ov08d10 camera sensor driver
> > > 
> > > Laurent Pinchart (9):
> > >       media: pxa_camera: Drop usage of .set_mbus_config()
> > >       media: i2c: ov6650: Drop implementation of .set_mbus_config()
> > >       media: v4l2-subdev: Drop .set_mbus_config() operation
> > >       media: v4l2-fwnode: Move bus config structure to v4l2_mediabus.h  
> >   
> > >       media: v4l2-mediabus: Use structures to describe bus configuration
> > >       media: v4l2-mediabus: Drop legacy V4L2_MBUS_CSI2_*_LANE flags
> > >       media: v4l2-mediabus: Drop legacy V4L2_MBUS_CSI2_CHANNEL_* flags
> > >       media: v4l2-mediabus: Drop V4L2_MBUS_CSI2_CONTINUOUS_CLOCK flag  
> > 
> > (Some of?) those broke build today:
> > 	https://builder.linuxtv.org/job/media_stage_clang/412/
> > 
> > Probably due to a conflict some other pull request.
> > 
> > So, I dropped them. Please rebase and re-submit.  
> 
> It seems patches got merged that make use of [gs]et_mbus_config that is
> changed by the patches. This isn't a very commonly used interface so
> there's a bit of bad luck here.
> 
> I'll see what needs to be changed there.

Yeah, patches that change kAPI have the potential of getting
such kind of conflicts. Thankfully we have now the media_stage
tree, and Jenkins builds are working properly. So we were able to 
solve it before reaching linux-next. No harm done.

> Please prioritise these on the next time, if possible.

(c/c the other media maintainers)

Sure. I usually priorize PRs that solve issues on previous one.

Yet, the order is not really important. I mean, if I end merging 
two PRs again at the same day and one causes breakage on another
due to kAPI changes, no matter where PR gets merged early, I 
would still get a Jenkins compilation error again, and the 
sanest way to solve such kind of conflicts is to drop the 
kAPI changes.

So, what we need to do, instead, is to coordinate such changes
with other maintainers and developers in order to ensure that 
everyone that would rely on a deprecated kAPI that will be
dropped will base their series on the top of the tree with the
replacement kAPI.

Maybe we could start doing some annotations at the kAPI docs
about any plans to deprecate such interfaces at least one
or two kernel versions before actually applying the old
API removal.

Comments?

Thanks,
Mauro
