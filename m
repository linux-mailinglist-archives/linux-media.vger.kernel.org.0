Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23EAA191D97
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 00:34:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726956AbgCXXey (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Mar 2020 19:34:54 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:60153 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726911AbgCXXey (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Mar 2020 19:34:54 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 129AEFF809;
        Tue, 24 Mar 2020 23:34:49 +0000 (UTC)
Date:   Wed, 25 Mar 2020 00:37:47 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        libcamera-devel@lists.libcamera.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [libcamera-devel] [PATCH 0/4] media: Register read-only sub-dev
 devnode
Message-ID: <20200324233747.jwt2ph5r2etxw6wj@uno.localdomain>
References: <20200324202844.1518292-1-jacopo@jmondi.org>
 <CAPY8ntCM7MyP6xt-Bqg5pMLdqGSR=GW3mi3grEBn94nqhbLuRA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntCM7MyP6xt-Bqg5pMLdqGSR=GW3mi3grEBn94nqhbLuRA@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

On Tue, Mar 24, 2020 at 10:25:59PM +0000, Dave Stevenson wrote:
> Hi Jacopo
>
> On Tue, 24 Mar 2020 at 20:25, Jacopo Mondi <jacopo@jmondi.org> wrote:
> >
> > Add new functio v4l2_device_register_ro_subdev_nodes() to pair with
> > v4l2_device_register_subdev_nodes() that allows a bridge driver to register the
> > device node for its subdevices in read-only mode.
> >
> > devnode-centric (aka non-MC) bridge drivers control their subdevices through
> > direct calls to v4l2 subdev operations and do not want userspace to be able
> > to control the subdevice configuration by calling ioctls on the sub-device
> > devnode. For this reason, they mostly refrain from registering any devnode at
> > all for their subdevices.
> >
> > However it is sometimes required for userspace to access the sub-dev device
> > nodes to collect information on the actual configuration, without changing
> > the one currently applied to the device.
> >
> > This requirement became pressing while working on libcamera on devnode-centric
> > platforms that do not expose any sub-device for their camera sensor to prevent
> > userspace from changing their configuration. To allow them to register device
> > node and being guaranteed to retain control of the subdevice configuration this
> > series proposes a way to register device nodes in read-only to restrict
> > access to all ioctls that could potentially affect the sub-dev configuration.
> >
> > Thanks
> >    j
> >
> > Jacopo Mondi (4):
> >   Documentation: media: Document read-only subdevice
> >   media: v4l2-dev: Add v4l2_device_register_ro_subdev_node()
> >   media: bcm2835: Register sensor devnode as read-only
> >   media: bcm2835: Fix trivial whitespace error
>
> Minor point - you've sent this to linux-media. We (Raspberry Pi)
> haven't pushed the bcm2835-unicam driver to mainline as yet (it's
> still on the to-do list).
> Yes, we need the core functionality that is in the first two patches,
> but the last two aren't going to apply to any mainline tree.

You are very right!

Only the first 2 are relevant for linux-media, I should have reported
it here.


>
>   Dave
>
> >  Documentation/media/kapi/v4l2-subdev.rst      | 38 +++++++++++++++++++
> >  .../media/uapi/v4l/vidioc-g-dv-timings.rst    |  6 +++
> >  Documentation/media/uapi/v4l/vidioc-g-std.rst |  6 +++
> >  .../media/uapi/v4l/vidioc-subdev-g-crop.rst   |  9 +++++
> >  .../media/uapi/v4l/vidioc-subdev-g-fmt.rst    |  8 ++++
> >  .../v4l/vidioc-subdev-g-frame-interval.rst    |  8 ++++
> >  .../uapi/v4l/vidioc-subdev-g-selection.rst    |  8 ++++
> >  .../media/platform/bcm2835/bcm2835-unicam.c   |  4 +-
> >  drivers/media/v4l2-core/v4l2-device.c         | 16 +++++++-
> >  drivers/media/v4l2-core/v4l2-subdev.c         | 19 ++++++++++
> >  include/media/v4l2-dev.h                      |  7 ++++
> >  include/media/v4l2-device.h                   | 10 +++++
> >  12 files changed, 136 insertions(+), 3 deletions(-)
> >
> > --
> > 2.25.1
> >
> > _______________________________________________
> > libcamera-devel mailing list
> > libcamera-devel@lists.libcamera.org
> > https://lists.libcamera.org/listinfo/libcamera-devel
