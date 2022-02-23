Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB7234C0B4E
	for <lists+linux-media@lfdr.de>; Wed, 23 Feb 2022 05:58:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236866AbiBWE6e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Feb 2022 23:58:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229674AbiBWE6e (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Feb 2022 23:58:34 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DBFB60CC3
        for <linux-media@vger.kernel.org>; Tue, 22 Feb 2022 20:58:07 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3F2B4482;
        Wed, 23 Feb 2022 05:58:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1645592285;
        bh=IHHqig6LVvPy+2QYtpLGa7/Vo/zFp5XtZPgyxb1Agd8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iJ71LeuVRCc9sHDzHj7SxWd/qJjGcgKV1VqaNdwm0AF/KXwZqbyo9sO+FavmMTyna
         dRV/STtCMps3RD90UfUJBmLCwZx82i+qw5bkCHVtV/ZMHUlWKSj3eTMbAoq7UCw/AG
         AzMrUPsLlv7tmnzgFUMb24hi58fZT2hZW9YTYC3g=
Date:   Wed, 23 Feb 2022 06:57:55 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     hverkuil@xs4all.nl, sakari.ailus@linux.intel.com,
        aford173@gmail.com, slongerbeam@gmail.com, rmfrfs@gmail.com,
        alexander.stein@ew.tq-group.com, linux-imx@nxp.com,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] media: imx: csis: Store pads format separately
Message-ID: <YhW+08HNhHAs4W7l@pendragon.ideasonboard.com>
References: <20220222214643.587535-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220222214643.587535-1-jacopo@jmondi.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Tue, Feb 22, 2022 at 10:46:43PM +0100, Jacopo Mondi wrote:
> As the formats on the sink and source pad might be different store
> them separately.
> 
> The pad format is used to configure the image width and height in
> mipi_csis_system_enable(). As the csis cannot downscale, using the sink
> or the source one isn't relevant.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> 
> Hans, this comes as a late fix for pull request
> [GIT PULL FOR v5.18] De-stage imx7-mipi-csis & some fixes
> 
> I'm sorry if this arrives a bit late, but I only realized when I
> exercized RGB24 today.
> 
> Can this be collected together with the above pull request ?
> Thanks
>   j
> ---
>  drivers/media/platform/imx/imx-mipi-csis.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/imx/imx-mipi-csis.c b/drivers/media/platform/imx/imx-mipi-csis.c
> index 6f975b3702bc..c23e512886f9 100644
> --- a/drivers/media/platform/imx/imx-mipi-csis.c
> +++ b/drivers/media/platform/imx/imx-mipi-csis.c
> @@ -330,7 +330,7 @@ struct csi_state {
> 
>  	struct mutex lock;	/* Protect csis_fmt, format_mbus and state */
>  	const struct csis_pix_format *csis_fmt;
> -	struct v4l2_mbus_framefmt format_mbus;
> +	struct v4l2_mbus_framefmt format_mbus[CSIS_PADS_NUM];
>  	u32 state;
> 
>  	spinlock_t slock;	/* Protect events */
> @@ -535,7 +535,7 @@ static void mipi_csis_system_enable(struct csi_state *state, int on)
>  /* Called with the state.lock mutex held */
>  static void __mipi_csis_set_format(struct csi_state *state)
>  {
> -	struct v4l2_mbus_framefmt *mf = &state->format_mbus;
> +	struct v4l2_mbus_framefmt *mf = &state->format_mbus[CSIS_PAD_SINK];
>  	u32 val;
> 
>  	/* Color format */
> @@ -967,7 +967,7 @@ mipi_csis_get_format(struct csi_state *state,
>  	if (which == V4L2_SUBDEV_FORMAT_TRY)
>  		return v4l2_subdev_get_try_format(&state->sd, sd_state, pad);
> 
> -	return &state->format_mbus;
> +	return &state->format_mbus[pad];
>  }
> 
>  static int mipi_csis_init_cfg(struct v4l2_subdev *sd,

-- 
Regards,

Laurent Pinchart
