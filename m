Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FE594A7B2F
	for <lists+linux-media@lfdr.de>; Wed,  2 Feb 2022 23:38:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345624AbiBBWii (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Feb 2022 17:38:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232825AbiBBWih (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Feb 2022 17:38:37 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B920EC061714
        for <linux-media@vger.kernel.org>; Wed,  2 Feb 2022 14:38:37 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E0172D88;
        Wed,  2 Feb 2022 23:38:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1643841516;
        bh=0KEJlIcJbBlJrMCUhGyiZY5rEnnWm2uO1tOGKFIgczY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jMcPQ8gxNKc+HdIsVhsChoWwmH76gk2yDLBGRySYzpvIlK4E6YxM0CRuePQCVbtWc
         LB3aZjsMsfTUw0WGJzZjlA2J1nsxKQJO+sZNdOyy1EYXs/v6y+YxbdKp4oRe8AbFPZ
         63fToJ4ZQXAJeVNxP7tMGqy07niJmW9SlDz6MDWY=
Date:   Thu, 3 Feb 2022 00:38:12 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     slongerbeam@gmail.com, sakari.ailus@iki.fi,
        hverkuil-cisco@xs4all.nl, mirela.rabulea@nxp.com,
        xavier.roumegue@oss.nxp.com, tomi.valkeinen@ideasonboard.com,
        hugues.fruchet@st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        aford173@gmail.com, festevam@gmail.com,
        eugen.hristev@microchip.com, jbrunet@baylibre.com,
        mchehab@kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 15/21] media: ov5640: Limit format to FPS in DVP mode only
Message-ID: <YfsH1ME0ThYXkJGY@pendragon.ideasonboard.com>
References: <20220131143245.128089-1-jacopo@jmondi.org>
 <20220131144444.129036-1-jacopo@jmondi.org>
 <20220131144444.129036-4-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220131144444.129036-4-jacopo@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Mon, Jan 31, 2022 at 03:44:43PM +0100, Jacopo Mondi wrote:
> In MIPI mode the frame rate control is performed by adjusting the
> frame blankings and the s_frame_interval function is not used anymore.
> 
> Only check for the per-mode supported frame rate in DVP mode and do not
> restrict MIPI mode.

This certainly aligns better with how the sensor driver is supposed to
operate. I however wonder why you don't do so in DVP mode too. Is it for
backward-compatibility ? If so a comment would be useful.

> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/ov5640.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index ae22300b9655..ec46e16223af 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -1845,8 +1845,13 @@ ov5640_find_mode(struct ov5640_dev *sensor, enum ov5640_frame_rate fr,
>  	     (mode->crop.width != width || mode->crop.height != height)))
>  		return NULL;
>  
> -	/* Check to see if the current mode exceeds the max frame rate */
> -	if (ov5640_framerates[fr] > ov5640_framerates[mode->max_fps])
> +	/*
> +	 * Check to see if the current mode exceeds the max frame rate.
> +	 * Only DVP mode uses the frame rate set by s_frame_interval, MIPI
> +	 * mode controls framerate by setting blankings.
> +	 */
> +	if (!ov5640_is_mipi(sensor) &&
> +	    ov5640_framerates[fr] > ov5640_framerates[mode->max_fps])
>  		return NULL;
>  
>  	return mode;

-- 
Regards,

Laurent Pinchart
