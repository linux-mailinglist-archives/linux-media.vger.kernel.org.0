Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D86EC4B6648
	for <lists+linux-media@lfdr.de>; Tue, 15 Feb 2022 09:38:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234344AbiBOIiP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Feb 2022 03:38:15 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:56256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234333AbiBOIiL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Feb 2022 03:38:11 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D749ED21EF;
        Tue, 15 Feb 2022 00:38:01 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B7E38315;
        Tue, 15 Feb 2022 09:37:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1644914279;
        bh=Zq3UvFy0SJMpJOqEzhnaTGojWYEiLnd93IDZUxgV+ww=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kwu9dvBMQ4iUvu3AROxKrlVVomK6TP/AtXkqbyph7hJrQGG2xub40d3++RNceILLv
         /OyMd/2HARlmVuDYBS7TAAxBEpLihNkkX/QVIOjLLai9yCXwEyBx/oG7hBv3AzEJIY
         K8zizZ7OGuD31frlRavNTa+kEn9vU1805+0D0sxc=
Date:   Tue, 15 Feb 2022 10:37:53 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: Re: [RFC PATCH 0/8] media: Drop .set_mbus_config(), improve
 .get_mbus_config()
Message-ID: <YgtmYcHf/Lg2VMXo@pendragon.ideasonboard.com>
References: <20220103162414.27723-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220103162414.27723-1-laurent.pinchart+renesas@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

Reviews or 5/8 to 8/8 would be nice :-) Thanks.

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
> Patches 6/8 to 8/8 then removes media bus configuration bitflags that
> are unneeded (and now unused).
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

-- 
Regards,

Laurent Pinchart
