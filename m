Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 916C21D96DB
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2020 15:00:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728806AbgESNAk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 May 2020 09:00:40 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:44149 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727077AbgESNAk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 May 2020 09:00:40 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id EE7544000F;
        Tue, 19 May 2020 13:00:36 +0000 (UTC)
Date:   Tue, 19 May 2020 15:03:55 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Naushir Patuck <naush@raspberrypi.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v2 33/34] staging: bcm2835-isp: Add support for BC2835 ISP
Message-ID: <20200519130355.ehe5ejf7jigrwnad@uno.localdomain>
References: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
 <20200504092611.9798-34-laurent.pinchart@ideasonboard.com>
 <3de6ce28-1089-19c2-cdac-64796a46638f@xs4all.nl>
 <CAEmqJPo-ST8msiQVedLmH48vsMBz2WeaK6WXyN5fiP5z1b+wAA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEmqJPo-ST8msiQVedLmH48vsMBz2WeaK6WXyN5fiP5z1b+wAA@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Tue, May 19, 2020 at 01:47:16PM +0100, Naushir Patuck wrote:

[snip]

> > > +++ b/drivers/staging/vc04_services/include/uapi/linux/bcm2835-isp.h
> > > @@ -0,0 +1,333 @@
> > > +/* SPDX-License-Identifier: ((GPL-2.0+ WITH Linux-syscall-note) OR BSD-3-Clause) */
> > > +/*
> > > + * bcm2835-isp.h
> > > + *
> > > + * BCM2835 ISP driver - user space header file.
> > > + *
> > > + * Copyright © 2019-2020 Raspberry Pi (Trading) Ltd.
> > > + *
> > > + * Author: Naushir Patuck (naush@raspberrypi.com)
> > > + *
> > > + */
> > > +
> > > +#ifndef __BCM2835_ISP_H_
> > > +#define __BCM2835_ISP_H_
> > > +
> > > +#include <linux/v4l2-controls.h>
> > > +
> > > +/* TODO: move the control IDs definitions to v4l2-controls.h */
> > > +#define V4L2_CID_USER_BCM2835_ISP_BASE         (V4L2_CID_USER_BASE + 0x10c0)
> >
> > As the TODO says: move this to v4l2-controls.h. Currently the 0x10c0 offset
> > clashes with V4L2_CID_USER_ATMEL_ISC_BASE, so that certainly should be fixed.
> >
>
> Unfortunately, there seems to be a mixup here.  Laurent, we have
> accidentally mailed a WIP revision of this patch.  The final version
> does have V4L2_CID_USER_BCM2835_ISP_BASE with a unique id in
> v4l2-controls.h.  I will talk with Laurent separately to get the
> correct revison included in the next patch-set.

I have created this file in this directory with the intention not to
pollute the kernel headers with definitions for a staging driver,
like in example, the IPU3 definitions in
drivers/staging/media/ipu3/include/intel-ipu3.h

Which, by the way, has another conflicting definition for its control
base
define V4L2_CID_INTEL_IPU3_BASE        (V4L2_CID_USER_BASE + 0x10c0)

>
> > > +
> > > +/* TODO: move the formats definitions to videodev2.h */
> > > +/* 12  Y/CbCr 4:2:0 128 pixel wide column */
> > > +#define V4L2_PIX_FMT_NV12_COL128 v4l2_fourcc('N', 'C', '1', '2')
> > > +/* Y/CbCr 4:2:0 10bpc, 3x10 packed as 4 bytes in a 128 bytes / 96 pixel wide column */
> > > +#define V4L2_PIX_FMT_NV12_10_COL128 v4l2_fourcc('N', 'C', '3', '0')
> > > +/* Sensor Ancillary metadata */
> > > +#define V4L2_META_FMT_SENSOR_DATA v4l2_fourcc('S', 'E', 'N', 'S')
> > > +/* BCM2835 ISP image statistics output */
> > > +#define V4L2_META_FMT_BCM2835_ISP_STATS v4l2_fourcc('B', 'S', 'T', 'A')
> > > +
>
> Similarly, these have also been moved to the right header files.

Same. I'm not sure now what the right policy for a staging driver
should be then.

>
> > > +#define V4L2_CID_USER_BCM2835_ISP_CC_MATRIX  \
> > > +                             (V4L2_CID_USER_BCM2835_ISP_BASE + 0x0001)
> > > +#define V4L2_CID_USER_BCM2835_ISP_LENS_SHADING       \
> > > +                             (V4L2_CID_USER_BCM2835_ISP_BASE + 0x0002)
> > > +#define V4L2_CID_USER_BCM2835_ISP_BLACK_LEVEL        \
> > > +                             (V4L2_CID_USER_BCM2835_ISP_BASE + 0x0003)
> > > +#define V4L2_CID_USER_BCM2835_ISP_GEQ                \
> > > +                             (V4L2_CID_USER_BCM2835_ISP_BASE + 0x0004)
> > > +#define V4L2_CID_USER_BCM2835_ISP_GAMMA              \
> > > +                             (V4L2_CID_USER_BCM2835_ISP_BASE + 0x0005)
> > > +#define V4L2_CID_USER_BCM2835_ISP_DENOISE    \
> > > +                             (V4L2_CID_USER_BCM2835_ISP_BASE + 0x0006)
> > > +#define V4L2_CID_USER_BCM2835_ISP_SHARPEN    \
> > > +                             (V4L2_CID_USER_BCM2835_ISP_BASE + 0x0007)
> > > +#define V4L2_CID_USER_BCM2835_ISP_DPC                \
> > > +                             (V4L2_CID_USER_BCM2835_ISP_BASE + 0x0008)
> >
> > There is no documentation for these controls. Specifically, it doesn't
> > tell you which struct should be used.
>
> As above, the documentaiton is available in the newer patch.
>

related: the documentation for this driver is in
drivers/staging/vc04_services/Documentation/

should this be moved to Documentation already ?
(as Nuash said, there's no documentation for controls in this version)

Thanks
  j
