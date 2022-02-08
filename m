Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BCA14ACF03
	for <lists+linux-media@lfdr.de>; Tue,  8 Feb 2022 03:40:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345304AbiBHCkc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Feb 2022 21:40:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344406AbiBHCdL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Feb 2022 21:33:11 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BC0FC061355
        for <linux-media@vger.kernel.org>; Mon,  7 Feb 2022 18:33:11 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 87AE1340;
        Tue,  8 Feb 2022 03:33:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1644287589;
        bh=zlLxbADdM2CmzUjtuY/UYHqQjjlbZzgB269DnjrGJgc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QRVbEDdT1DqyEd27ib2kv6pxvVMUJcKE0sUn/o9+BewP/352rygBlezGtJCLgT7di
         /cR5IGyvd5hivP0b4lrXFDHW9y4VabWoVfs18FBsrbivC17dw3uWggxNNNYV82HTqW
         59BN7Be3tfbBI6Ovzem/Y4YlhySFlVzik3OtJZEY=
Date:   Tue, 8 Feb 2022 04:33:07 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH v3 0/7] v4l: subdev active state
Message-ID: <YgHWY380pK/YgGSt@pendragon.ideasonboard.com>
References: <20220207161107.1166376-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220207161107.1166376-1-tomi.valkeinen@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

On Mon, Feb 07, 2022 at 06:11:00PM +0200, Tomi Valkeinen wrote:
> Hi,
> 
> This is v3 of the subdev active state series. Changes since v2:
> 
> - Doc improvements
> - Allow state->lock to be set by the driver (similarly to v4l2_ctrl_handler)

While I think we need better in the longer term, this seems like a
reasonable compromise to land this series and continue building on top.

> - Rename fields in 'struct v4l2_subdev_pad_config' and drop the try_ prefix.
> - Add v4l2_subdev_get_locked_active_state(), which calls lockdep_assert_locked() and returns the state.
> - Changed v4l2_subdev_get_active_state() to call lockdep_assert_not_locked()
> 
> The idea with the v4l2_subdev_get_active_state /
> v4l2_subdev_get_locked_active_state change is to have a lockdep_assert
> called. Roughly I think there are two cases where the
> v4l2_subdev_get_active_state could be called:
> 
> - With the intention of just passing it forward to another subdev, in
>   which case the state must _not_ be locked. Here
>   v4l2_subdev_get_active_state() can be called.
> 
> - With the intention of using the state in a case where the state is
>   known to be already locked. Here v4l2_subdev_get_locked_active_state()
>   can be called.

I'm not sure how this will work out, but it seems fine to me to start
with.

> The state->lock change hopefully solves Sakari's concerns about the
> locking between controls and state.
> 
>  Tomi
> 
> Tomi Valkeinen (7):
>   media: subdev: rename subdev-state alloc & free
>   media: subdev: add active state to struct v4l2_subdev
>   media: subdev: pass also the active state to subdevs from ioctls
>   media: subdev: add subdev state locking
>   media: subdev: Add v4l2_subdev_lock_and_return_state()
>   media: Documentation: add documentation about subdev state
>   media: subdev: rename v4l2_subdev_pad_config.try_* fields
> 
>  .../driver-api/media/v4l2-subdev.rst          |  60 ++++++
>  drivers/media/i2c/adv7183.c                   |   2 +-
>  drivers/media/i2c/imx274.c                    |  12 +-
>  drivers/media/i2c/mt9m001.c                   |   2 +-
>  drivers/media/i2c/mt9m111.c                   |   2 +-
>  drivers/media/i2c/mt9t112.c                   |   2 +-
>  drivers/media/i2c/mt9v011.c                   |   2 +-
>  drivers/media/i2c/mt9v111.c                   |   4 +-
>  drivers/media/i2c/ov2640.c                    |   2 +-
>  drivers/media/i2c/ov6650.c                    |  18 +-
>  drivers/media/i2c/ov772x.c                    |   2 +-
>  drivers/media/i2c/ov9640.c                    |   2 +-
>  drivers/media/i2c/rj54n1cb0c.c                |   2 +-
>  drivers/media/i2c/saa6752hs.c                 |   2 +-
>  drivers/media/i2c/sr030pc30.c                 |   2 +-
>  drivers/media/i2c/tw9910.c                    |   2 +-
>  drivers/media/i2c/vs6624.c                    |   2 +-
>  drivers/media/platform/atmel/atmel-isc-base.c |   8 +-
>  drivers/media/platform/atmel/atmel-isi.c      |   8 +-
>  drivers/media/platform/rcar-vin/rcar-v4l2.c   |   9 +-
>  drivers/media/platform/vsp1/vsp1_entity.c     |  10 +-
>  drivers/media/v4l2-core/v4l2-subdev.c         | 126 +++++++++--
>  drivers/staging/media/tegra-video/vi.c        |  10 +-
>  include/media/v4l2-subdev.h                   | 201 ++++++++++++++++--
>  24 files changed, 415 insertions(+), 77 deletions(-)

-- 
Regards,

Laurent Pinchart
