Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6442736E3E8
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 06:00:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238346AbhD2DyQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 23:54:16 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:42768 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238329AbhD2DyQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 23:54:16 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4E989BC0;
        Thu, 29 Apr 2021 05:53:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1619668408;
        bh=n0b40VLEzbS1OoYz0xc6JZAIL6M1snsDz26CaxKrP0c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HtZcfcR2KbZfrU8X2jgkHK91dJSo8IpUKRwpIupyHSz5pdUBC57GDf+CM2/gj6tUv
         +5JhG4cVISsH3pwAaPzfHmdX7OlKmTtxhVlyDlTNiXfDId1kDuGaHiaF00mDwTUAx3
         pRbSjGpXEeJ3ulH1hPK9S8Yr8QEKK0GM9sViuq+M=
Date:   Thu, 29 Apr 2021 06:53:22 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Benoit Parrot <bparrot@ti.com>, Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org,
        sakari.ailus@linux.intel.com
Subject: Re: [PATCH 0/4] media: ti-vpe: cal: multiplexed streams support
Message-ID: <YIotsrlLrFYeNN/b@pendragon.ideasonboard.com>
References: <20210427132028.1005757-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210427132028.1005757-1-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the series. Nice to see the multiplexed streams API in
operation.

On Tue, Apr 27, 2021 at 04:20:24PM +0300, Tomi Valkeinen wrote:
> Hi,
> 
> This series adds embedded data and multiplexed streams support to TI CAL
> driver. These patches depend on the subdev routing series and CAL preparation
> series:
> 
> https://lore.kernel.org/linux-media/20210427124523.990938-1-tomi.valkeinen@ideasonboard.com/
> 
> https://lore.kernel.org/linux-media/20210420120433.902394-1-tomi.valkeinen@ideasonboard.com/
> 
> One detail I'm not too happy about is adding a new kernel module parameter
> 'cal_streams_api'. Setting this parameter enables the multiplexed streams
> support for the CAL sink pads. I'd like the driver to be able to figure this
> out itself, but there's no simple answer to it.
> 
> A pad in a subdev has to be either in non-multiplexed or multiplexed mode. If
> the subdev cannot support multiplexed streams, then the answer is clear. But if
> it can, then the question becomes "what's connected to the pad, and what does
> it want". Afaik, the idea with subdev configuration is that each subdev can be
> configured independently, so the driver trying to figure out the answer to that
> question breaks this idea. Also, two connected subdevs that both can support
> both modes wouldn't even give the answer, but the answer might be found further
> away, probably from the sensor subdev.
> 
> So, maybe it should be the userspace that can set a subdev pad to either of the
> modes. There's currently no such uAPI, but I think this option makes the most
> sense.

We'll need to brainstorm this a bit. I agree that the module parameter
isn't a good solution.

> Another detail to note is the embedded data support. I don't have hardware with
> real embedded data, so I have not added any embedded data formats. Also, the
> embedded data is captured with the video capture ioctls, not the metadata
> capture ioctls. The reason for this is that in the case of CSI-2 embedded data
> (at least for this hardware) the embedded data is very much like pixel data:
> the data is sent in lines just before or after the pixel content and each
> subdev needs a set_fmt call with the width, height, and mbus-code.
> 
> Using the metadata ioctls is possible, but it only results in much more complex
> driver code, and, I think, more confusing userspace.
> 
>  Tomi
> 
> Tomi Valkeinen (4):
>   media: ti-vpe: cal: add embedded data support
>   media: ti-vpe: cal: use frame desc to get vc and dt
>   media: ti-vpe: cal: add routing support
>   media: ti-vpe: cal: add multiplexed streams support
> 
>  drivers/media/platform/ti-vpe/cal-camerarx.c | 234 ++++++++++++++++---
>  drivers/media/platform/ti-vpe/cal-video.c    |  95 +++++++-
>  drivers/media/platform/ti-vpe/cal.c          | 102 ++++++--
>  drivers/media/platform/ti-vpe/cal.h          |  10 +-
>  4 files changed, 383 insertions(+), 58 deletions(-)

-- 
Regards,

Laurent Pinchart
