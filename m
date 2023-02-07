Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31A2068CC5B
	for <lists+linux-media@lfdr.de>; Tue,  7 Feb 2023 02:55:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229732AbjBGBz3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Feb 2023 20:55:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229692AbjBGBz2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Feb 2023 20:55:28 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 507D0196A9
        for <linux-media@vger.kernel.org>; Mon,  6 Feb 2023 17:55:27 -0800 (PST)
Received: from pendragon.ideasonboard.com (unknown [109.136.43.56])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D3C814AF;
        Tue,  7 Feb 2023 02:55:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675734925;
        bh=HiZhaowstq7nvwO1g7/PXPi2hpGBxPNBvGBfqDCZYzU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BqVEriv99KjN9kEynWsghn0PBOIDZR48BQbj+t/US9uLj0R3mTP2rLxhKEj7teCYu
         DvNATPoPMjThhvtRThwIqXnDRCCD1pIsbTLo96/+/DNjrfup8KD5alDFA8DcgZkOEU
         gjNvibSjKee6weB95+Tvdnt5FlZ8dpX2hX1NlGtI=
Date:   Tue, 7 Feb 2023 03:55:24 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH v2 00/13] imx290: Minor fixes, support for alternate
 INCK, and more ctrls
Message-ID: <Y+GvjLTl6N8oun2A@pendragon.ideasonboard.com>
References: <20230203191811.947697-1-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230203191811.947697-1-dave.stevenson@raspberrypi.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

On Fri, Feb 03, 2023 at 07:17:58PM +0000, Dave Stevenson wrote:
> Hi All
> 
> This is a small patch set that fixes a number of issues, adds in support
> for the alternate input clock frequency option, and expands the control support
> for flips and VBLANK/HBLANK.
> 
> My source tree has the 2 patches I've just sent for mono support first, but I
> believe the two series should apply in either order (true for v1, possibly not
> for v2).
> There's tree with both patchsets applied at [1]. 

This is a great series, thank you for upstreaming it.

Patch 04/13 conflicts with the latest media tree, but the conflict is
easy to fix. I've taken the whole series in my tree to test it when I'll
get access to hardware at the end of this week, I can then post a v3
with the review comments addressed. As for the other imx290 series
you've submitted, feel free to beat me to it if you want to.

> Changes since v1:
> 2/11: Hardcoded colourspace values.
> 4/11: Missing blank line added.
> 6/11: s/repitition/repetition/
> 8/11: Set exposure range on changing mode.
> 8/11: Alter the initial exposure to be max.
> 8/11: Split out allowing VMAX to drop to 750 in 720p mode into a new patch.
> 10/11: Switch to an enum.
> 10/11: Compute IMX290_EXTCK_FREQ.
> 10/11: Move EXCK_FREQ and IMX290_INCKSEL7 settings to 
> New patch: Add error code to logging in imx290_start_streaming.
> Collected R-B tags.
> 
> [1] https://github.com/6by9/linux/tree/upstream_imx290
> 
> Dave Stevenson (13):
>   media: i2c: imx290: Match kernel coding style on whitespace
>   media: i2c: imx290: Set the colorspace fields in the format
>   media: i2c: imx290: Add V4L2_SUBDEV_FL_HAS_EVENTS and subscribe hooks
>   media: i2c: imx290: Fix the pixel rate at 148.5Mpix/s
>   media: i2c: imx290: Support 60fps in 2 lane operation
>   media: i2c: imx290: Use CSI timings as per datasheet
>   media: i2c: imx290: Convert V4L2_CID_HBLANK to read/write
>   media: i2c: imx290: Convert V4L2_CID_VBLANK to read/write
>   media: i2c: imx290: VMAX is mode dependent
>   media: i2c: imx290: Remove duplicated write to IMX290_CTRL_07
>   media: i2c: imx290: Add support for 74.25MHz external clock
>   media: i2c: imx290: Add support for H & V Flips
>   media: i2c: imx290: Add the error code to logs in start_streaming
> 
>  drivers/media/i2c/imx290.c | 464 +++++++++++++++++++++++++++++--------
>  1 file changed, 365 insertions(+), 99 deletions(-)

-- 
Regards,

Laurent Pinchart
