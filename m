Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 804E837653D
	for <lists+linux-media@lfdr.de>; Fri,  7 May 2021 14:36:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235742AbhEGMh4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 May 2021 08:37:56 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:59626 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229849AbhEGMhz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 May 2021 08:37:55 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 466A32CF;
        Fri,  7 May 2021 14:36:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1620391014;
        bh=zuzpyxuxe8jk+q4il+pD/z4Lc/soEoZk550ZldRWODg=;
        h=From:To:Cc:Subject:Date:From;
        b=XEcSxd3zgmxojc80b5uQbHwmQzL2+yx7Lt66KOeUcAUmR7jL+ColHjOOdqxiEF3oS
         xjRGZTguuV5fp+EBkECh17BsQ+Rj1BypHQuv/7Gw5h45pC8lkKUtxMFQkTkA5LPMsY
         dkl4aEgaJNFFFwCqbsPYn1fonrQyk1qWcGq/WbGg=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>, john.wei@mediatek.com,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [RFC 00/11] v4l2: multistream support via stream based configuration
Date:   Fri,  7 May 2021 15:35:47 +0300
Message-Id: <20210507123558.146948-1-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

I have sent a few serieses to linux-media recently, which have been
aiming at adding multiplexed streams support to v4l2 framework and to
TI CAL driver.

https://lore.kernel.org/linux-media/20210427124523.990938-1-tomi.valkeinen@ideasonboard.com/
https://lore.kernel.org/linux-media/20210420120433.902394-1-tomi.valkeinen@ideasonboard.com/
https://lore.kernel.org/linux-media/20210423102952.137638-1-tomi.valkeinen@ideasonboard.com/

The approach in those serieses was to have two different kinds of subdev
pads: the normal ones that support configuration and pass a single
stream, and the new ones supporting multiple streams. These new ones do
not support any configuration.

The idea is that somewhere along the pipeline there must be a
non-multiplexed pad with the format. So, if you have a pad with
multiplexed streams, you need to follow that stream to either direction
and find a non-multiplexed pad. The format on that pad is also the
format on the stream.

Some of the problems with that approach are:
- Subdevs no longer support self-contained configuration, as the configs
  come from some other subdev.
- A subdev with multiple streams cannot do any config changes (like
  scaling), but instead has to be split up to multiple subdevs to get
  non-multiplexed pads.
- A sensor that provides multiple streams must be split into a sensor
  subdev and a mux subdev.
- It's not possible to link a subdev with multiplexed-supporting pad and
  a subdev with non-multiplexed pad.
- I think it is just a bit messy, and the behavior when looking from
  the userspace side is a bit odd.

I have a new approach in my work branch, which this series introduces as
an RFC.

In this approach the subdevs are configured based on streams, not pads.
Each pad can contain multiple streams.  In other words, previously
set_fmt was called for pad X, now set_fmt is called for pad X + stream
Y.

I think this approach is much better than the previous one. All the
problems above go away, and I think the code is simpler and the behavior
of the subdevs is easier to understand.

This series is not based on an upstream branch, and is not meant for
real code review. The intention is to get an ack for the approach, after
which I'll send proper serieses for these.

This also includes the previously sent RFC for a subdev-wide state
struct. This is needed to add TRY support for routing and the stream
based configuration.

This series is based on most of the work I've sent previously, but the
following old patches have been dropped:

v4l: subdev: Add [GS]_ROUTING subdev ioctls and operations
media: Documentation: Add GS_ROUTING documentation
v4l: subdev: routing kernel helper functions
v4l: subdev: add v4l2_subdev_get_format_dir()
media: uapi: add MEDIA_PAD_FL_MULTIPLEXED flag
v4l: subdev: Take routing information into account in link validation
media: ti-vpe: cal: add routing support
media: ti-vpe: cal: add multiplexed streams support

The new patches, along with all the more hacky driver patches I need for
testing can be found from:

git://git.kernel.org/pub/scm/linux/kernel/git/tomba/linux.git multistream/work

 Tomi

Laurent Pinchart (1):
  v4l: subdev: Add [GS]_ROUTING subdev ioctls and operations

Tomi Valkeinen (10):
  media: v4l2-subdev: add subdev-wide state struct
  media: v4l2-subdev: driver fixes for subdev-wide state struct
  v4l: subdev: routing kernel helper functions
  v4l: subdev: add V4L2_SUBDEV_ROUTE_FL_SOURCE
  v4l: subdev: add stream based configuration
  v4l: subdev: add 'stream' to subdev ioctls
  v4l: subdev: use streams in v4l2_subdev_link_validate()
  v4l: subdev: add routing & stream config to v4l2_subdev_state
  v4l: subdev: add V4L2_SUBDEV_FL_MULTIPLEXED
  media: ti-vpe: cal: add multistream support

 drivers/media/i2c/ov5640.c                   |  10 +-
 drivers/media/platform/ti-vpe/cal-camerarx.c | 322 ++++++++++--
 drivers/media/platform/ti-vpe/cal-video.c    | 103 +++-
 drivers/media/platform/ti-vpe/cal.c          |  34 +-
 drivers/media/platform/ti-vpe/cal.h          |  12 +-
 drivers/media/v4l2-core/v4l2-ioctl.c         |  25 +-
 drivers/media/v4l2-core/v4l2-subdev.c        | 523 ++++++++++++++++---
 include/media/v4l2-subdev.h                  | 141 +++--
 include/uapi/linux/v4l2-subdev.h             |  73 ++-
 9 files changed, 1049 insertions(+), 194 deletions(-)

-- 
2.25.1

