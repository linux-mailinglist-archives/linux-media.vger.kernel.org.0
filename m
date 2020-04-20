Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FEAE1AFFA8
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 04:02:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726083AbgDTCCp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 19 Apr 2020 22:02:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725953AbgDTCCp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 19 Apr 2020 22:02:45 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1737DC061A0C;
        Sun, 19 Apr 2020 19:02:45 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0362E528;
        Mon, 20 Apr 2020 04:02:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1587348163;
        bh=nBCXgbt9YKJZ4r6GF5gcm7TOi277R0jDhyi2OYl+G2o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NFFILPtETSfoOqOZd5RMrR1bPuB39+dUSlLSfGoR0b0W/KzXIHlJ1FOyaqLbO1Ti+
         a5zZmN3dzaGhr8ZladlZ0IhlCNjcFRiDV5pHsXUP2gqFgnVc+vUQHbYlUWBO7CZuLz
         XSm1bdzk7B8ZGFiP5GNiBGSBOOYyvT1BkBU94UEI=
Date:   Mon, 20 Apr 2020 05:02:28 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        sakari.ailus@linux.intel.com,
        niklas.soderlund+renesas@ragnatech.se,
        kieran.bingham@ideasonboard.com, dave.stevenson@raspberrypi.com,
        hyun.kwon@xilinx.com, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 0/6] v4l2-subdev: Introduce get_mbus_format pad op
Message-ID: <20200420020228.GF15673@pendragon.ideasonboard.com>
References: <20200415105004.2497356-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200415105004.2497356-1-jacopo+renesas@jmondi.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patches.

On Wed, Apr 15, 2020 at 12:49:57PM +0200, Jacopo Mondi wrote:
> v2 introduces two new patches that could be likely squashed in later to
> deprecate the g_mbus_config() operation in documentation and expand the newly
> introduced function documentation by popular demand.
> 
> Will report again the use cases I'm trying to address here:
> ------------------------------------------------------------------------------
> Quoting:
> https://patchwork.kernel.org/cover/10855919/
> "The use case this series cover is the following one:
> the Gen-3 R-Car boards include an ADV748x HDMI/CVBS to CSI-2 converter
> connected to its CSI-2 receivers. The ADV748x chip has recently gained support
> for routing both HDMI and analogue video streams through its 4 lanes TXA
> transmitter, specifically to support the Ebisu board that has a single CSI-2
> receiver, compared to all other Gen-3 board where the ADV748x TXes are connected
> to different CSI-2 receivers, and where analogue video is streamed out from the
> ADV748x single lane TXB transmitter.
> To properly support transmission of analogue video through TXA, the number of
> data lanes shall be dynamically reduced to 1, in order to comply with the MIPI
> CSI-2 minimum clock frequency requirements"
> 
> During the discussion of the RFC, Dave reported another use case for media
> bus parameter negotiation on his platform:
> https://patchwork.kernel.org/patch/10855923/#22569149
> 
> Another possible use case is for parallel bus multiplexing, where multiple image
> sensor share the parallel bus lines and they get activated alternatively through
> an enable signal. While this might not be most clever design, it's often seen
> in the wild, and this operation allow receivers to re-configure their bus
> parameter in between streaming session.

Isn't this already supported today, with the bus configuration for each
source specified in the corresponding endpoint (on the receiver side) in
DT ?

> Hyun is now using this series to configure GMSL devices.
> ------------------------------------------------------------------------------
> 
> v1->v2:
> - Address Sakari's comment to use unsigned int in place of bools
> - Add two new patches to address documentation
> - Adjust rcar-csi2 patch as much as possible according to Niklas comments
> - Add Niklas's tags
> 
> Jacopo Mondi (6):
>   media: v4l2-subdv: Introduce get_mbus_config pad op
>   media: v4l2-subdev: Deprecate g_mbus_config video op
>   media: v4l2-subdev: Expand get_mbus_config doc
>   media: i2c: adv748x: Adjust TXA data lanes number
>   media: i2c: adv748x: Implement get_mbus_config
>   media: rcar-csi2: Negotiate data lanes number
> 
>  drivers/media/i2c/adv748x/adv748x-core.c    | 31 ++++++--
>  drivers/media/i2c/adv748x/adv748x-csi2.c    | 15 ++++
>  drivers/media/i2c/adv748x/adv748x.h         |  1 +
>  drivers/media/platform/rcar-vin/rcar-csi2.c | 53 ++++++++++++-
>  include/media/v4l2-subdev.h                 | 82 ++++++++++++++++++++-
>  5 files changed, 171 insertions(+), 11 deletions(-)
> 

-- 
Regards,

Laurent Pinchart
