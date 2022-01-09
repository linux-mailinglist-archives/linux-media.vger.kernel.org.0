Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F5854889E6
	for <lists+linux-media@lfdr.de>; Sun,  9 Jan 2022 15:35:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232832AbiAIOf2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 9 Jan 2022 09:35:28 -0500
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:38681 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229922AbiAIOf1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 9 Jan 2022 09:35:27 -0500
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 51360240002;
        Sun,  9 Jan 2022 14:35:24 +0000 (UTC)
Date:   Sun, 9 Jan 2022 15:36:24 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: Re: [RFC PATCH 0/8] media: Drop .set_mbus_config(), improve
 .get_mbus_config()
Message-ID: <20220109143624.p25busbiwi2z4buk@uno.localdomain>
References: <20220103162414.27723-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220103162414.27723-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Mon, Jan 03, 2022 at 06:24:06PM +0200, Laurent Pinchart wrote:
> Hello,
>
> This patch series reworks the V4L2 subdev .get_mbus_config() and
> .set_mbus_config() operations to improve the former and drop the latter.
>
> These subdev operations originate from soc-camera (for those who
> remember the framework), and were designed to let a transmitter and a
> receiver negotiate the physical configuration of the bus that connects
> them. The operations use bitflags to represent bus parameters, with
> supported options set by the caller of .set_mbus_config(), and selected
> options among those returned by the callee. This mechanism is
> deprecated, as selection of the bus configuration has long been moved to
> the firmware interface (DT or ACPI), and usage of bitflags prevents from
> adding more complex configuration parameters (timings in particular).
>
> As .set_mbus_config() is deprecated and used by one pair of drivers only
> (pxa_camera and ov6650), it wasn't difficult to drop usage of that
> operation in patches 1/8 and 2/8, and remove the operation itself in
> patch 3/8.
>
> With that operation gone, .get_mbus_config() can be moved from bitflags
> to structures. It turned out that the needed data structures were
> already present in v4l2_fwnode.h. Patch 4/8 moves them to
> v4l2_mediabus.h (and renames them to drop the fwnode mention, as they're
> not specific to the fwnode API), and patch 5/8 makes use of them.

great, when the soc_camera version was dropped, the next thing to do
was to move away from bitflags and move to structure fields...

> Patches 6/8 to 8/8 then removes media bus configuration bitflags that
> are unneeded (and now unused).

Parallel might require a bit more of work, but csi2 already has a
single flag

/* Clock non-continuous mode support. */
#define V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK	BIT(0)

so it should be trivial to replace 'flags' with a boolean
'clock_noncontinuous' field.

One things leaves me a bit confused: we're now mixing run-time
configurable paramters (eg the number of data lanes in use in the
current streaming sessions) and paramters which come from DT and are
usually fixed by the HW design like lanes ordering.

Is this ok in your opinion ?

>
> The series is an RFC as not everything has been converted from bitflags
> to named fields in structures. In particular, the parallel bus flags
> haven't been touched at all. Patch 8/8 shows how mutually exclusive
> flags can be reworked to drop one of them. We then need to decide
> whether to keep expressing the flag as macros, or move to C bitfields
> with dedicated structure member names. I didn't want to include this
> change in the RFC before getting feedback on the general approach
> (feedback on those specific questions will also be appreciated).
>

There's also an opportunity to use v4l2_mbus_config as part of
v4l2_fwnode_endpoint instead of repeating the same fields ?

struct v4l2_fwnode_endpoint {
	struct fwnode_endpoint base;
	/*
	 * Fields below this line will be zeroed by
	 * v4l2_fwnode_endpoint_parse()
	 */
        -------------------------------------------------------------
	enum v4l2_mbus_type bus_type;
	struct {
		struct v4l2_mbus_config_parallel parallel;
		struct v4l2_mbus_config_mipi_csi1 mipi_csi1;
		struct v4l2_mbus_config_mipi_csi2 mipi_csi2;
	} bus;
        -------------------------------------------------------------
	u64 *link_frequencies;
	unsigned int nr_of_link_frequencies;
};

struct v4l2_mbus_config {
	enum v4l2_mbus_type type;
	union {
		struct v4l2_mbus_config_parallel parallel;
		struct v4l2_mbus_config_mipi_csi1 mipi_csi1;
		struct v4l2_mbus_config_mipi_csi2 mipi_csi2;
	} bus;
};


> Laurent Pinchart (8):
>   media: pxa_camera: Drop usage of .set_mbus_config()
>   media: i2c: ov6650: Drop implementation of .set_mbus_config()
>   media: v4l2-subdev: Drop .set_mbus_config() operation
>   media: v4l2-fwnode: Move bus config structure to v4l2_mediabus.h
>   media: v4l2-mediabus: Use structures to describe bus configuration
>   media: v4l2-mediabus: Drop legacy V4L2_MBUS_CSI2_*_LANE flags
>   media: v4l2-mediabus: Drop legacy V4L2_MBUS_CSI2_CHANNEL_* flags
>   media: v4l2-mediabus: Drop V4L2_MBUS_CSI2_CONTINUOUS_CLOCK flag
>
>  drivers/gpu/ipu-v3/ipu-csi.c                  |   6 +-
>  drivers/media/i2c/adv7180.c                   |  10 +-
>  drivers/media/i2c/adv748x/adv748x-csi2.c      |  18 +--
>  drivers/media/i2c/ml86v7667.c                 |   5 +-
>  drivers/media/i2c/mt9m001.c                   |   8 +-
>  drivers/media/i2c/mt9m111.c                   |  16 +--
>  drivers/media/i2c/ov5648.c                    |   4 +-
>  drivers/media/i2c/ov6650.c                    |  51 ++-------
>  drivers/media/i2c/ov8865.c                    |   4 +-
>  drivers/media/i2c/ov9640.c                    |   8 +-
>  drivers/media/i2c/tc358743.c                  |  26 +----
>  drivers/media/i2c/tvp5150.c                   |   6 +-
>  drivers/media/platform/pxa_camera.c           |  21 ++--
>  drivers/media/platform/qcom/camss/camss.c     |   2 +-
>  drivers/media/platform/rcar-vin/rcar-csi2.c   |  16 +--
>  drivers/media/platform/rcar-vin/rcar-vin.h    |   2 +-
>  drivers/media/platform/stm32/stm32-dcmi.c     |   2 +-
>  .../platform/sunxi/sun4i-csi/sun4i_csi.h      |   2 +-
>  .../platform/sunxi/sun4i-csi/sun4i_dma.c      |   2 +-
>  drivers/media/platform/ti-vpe/cal-camerarx.c  |   6 +-
>  drivers/media/v4l2-core/v4l2-fwnode.c         |  16 ++-
>  drivers/media/v4l2-core/v4l2-subdev.c         |   8 --
>  drivers/staging/media/imx/imx-media-csi.c     |   7 +-
>  drivers/staging/media/imx/imx6-mipi-csi2.c    |  25 +----
>  drivers/staging/media/imx/imx7-mipi-csis.c    |   2 +-
>  drivers/staging/media/imx/imx8mq-mipi-csi2.c  |   2 +-
>  drivers/staging/media/max96712/max96712.c     |   2 +-
>  include/media/v4l2-fwnode.h                   |  61 +---------
>  include/media/v4l2-mediabus.h                 | 104 ++++++++++++------
>  include/media/v4l2-subdev.h                   |  13 ---
>  30 files changed, 168 insertions(+), 287 deletions(-)
>
>
> base-commit: 68b9bcc8a534cd11fe55f8bc82f948aae7d81b3c
> --
> Regards,
>
> Laurent Pinchart
>
