Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E970E6A4798
	for <lists+linux-media@lfdr.de>; Mon, 27 Feb 2023 18:11:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229660AbjB0RL4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Feb 2023 12:11:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbjB0RLz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Feb 2023 12:11:55 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 964531F93E
        for <linux-media@vger.kernel.org>; Mon, 27 Feb 2023 09:11:54 -0800 (PST)
Received: from ideasonboard.com (host-87-18-61-24.retail.telecomitalia.it [87.18.61.24])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EF2ECB6C;
        Mon, 27 Feb 2023 18:11:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1677517912;
        bh=Z1LGPu2WGBf6FdGipe6xou+/V3t33vuF0o3hoqoKy+I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ilfiKYwqEbrCTUczQoBbrRBBFnjrScM990izIdVTNSLQFLDsgF1v3DaLMXpVfueMF
         7w1q/QjZSefbfoIbaze9SPahI2vCTLVMaNYqSoEz0bk6uiqR88+Ag1RQxQMAyes5dj
         nTPrcpaE1uQZUYVtv7ZGXi/ben1aY9LPnsk4XhBs=
Date:   Mon, 27 Feb 2023 18:11:47 +0100
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Robert Mader <robert.mader@collabora.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 0/3] media: imx258: Remove rotation=<80 requirement
Message-ID: <20230227171147.f4o2r5yajoj5nhyi@uno.localdomain>
References: <20230117100603.51631-1-jacopo.mondi@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230117100603.51631-1-jacopo.mondi@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari

   I don't see this patch being collected for 6.3 while I recall that
based on the discussion we concluded we can have these in and the
iterate on top ?

Thanks
  j

On Tue, Jan 17, 2023 at 11:06:00AM +0100, Jacopo Mondi wrote:
> Currently the imx258 driver requires to have the 'rotation' device node
> property specified in DTS with a fixed value of 180 degrees.
>
> The "rotation" fwnode device property is intended to allow specify the
> sensor's physical mounting rotation, so that it can be exposed through
> the read-only V4L2_CID_CAMERA_SENSOR_ROTATION control and applications
> can decide how to compensate for that.
>
> The imx258 driver has read-only VFLIP and HFLIP enabled, resulting in
> a 180 degrees image rotation being produced by the sensor. But this
> doesn't imply that the physical mounting rotation should match the
> driver's implementation.
>
> I took into the series Robert's patch that register device node properties and
> on top of that register flips controls, in order to remove the hard requirement
> of the 180 degrees rotation property presence.
>
> Jacopo Mondi (2):
>   media: imx258: Register H/V flip controls
>   media: imx258: Remove mandatory 180 degrees rotation
>
> Robert Mader (1):
>   media: imx258: Parse and register properties
>
>  drivers/media/i2c/imx258.c | 33 ++++++++++++++++++++++++---------
>  1 file changed, 24 insertions(+), 9 deletions(-)
>
> --
> 2.39.0
>
