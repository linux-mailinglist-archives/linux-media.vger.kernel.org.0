Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EAB2A4DAE9D
	for <lists+linux-media@lfdr.de>; Wed, 16 Mar 2022 12:03:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344523AbiCPLEy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Mar 2022 07:04:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235189AbiCPLEx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Mar 2022 07:04:53 -0400
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0443E3334B
        for <linux-media@vger.kernel.org>; Wed, 16 Mar 2022 04:03:35 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 7E5D51BF204;
        Wed, 16 Mar 2022 11:03:31 +0000 (UTC)
Date:   Wed, 16 Mar 2022 12:03:29 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH v11 30/36] media: subdev: Fallback to pad config in
 v4l2_subdev_get_fmt()
Message-ID: <20220316110329.mhuarq2vk4w7gcqv@uno.localdomain>
References: <20220301161156.1119557-1-tomi.valkeinen@ideasonboard.com>
 <20220301161156.1119557-31-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220301161156.1119557-31-tomi.valkeinen@ideasonboard.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Mar 01, 2022 at 06:11:50PM +0200, Tomi Valkeinen wrote:
> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> If the subdev doesn't implement routing support, fallback to pad config
> as the storage for pad formats. This allows using the V4L2 subdev active
> state API and the v4l2_subdev_get_fmt() helper in subdev drivers that
> don't implement routing support.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index c1cc9b91dba7..7f50871054cd 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -1512,8 +1512,14 @@ int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
>  {
>  	struct v4l2_mbus_framefmt *fmt;
>
> -	fmt = v4l2_subdev_state_get_stream_format(state, format->pad,
> -						  format->stream);
> +	if (sd->flags & V4L2_SUBDEV_FL_MULTIPLEXED)
> +		fmt = v4l2_subdev_state_get_stream_format(state, format->pad,
> +							  format->stream);
> +	else if (format->pad < sd->entity.num_pads && format->stream == 0)
> +		fmt = v4l2_subdev_get_try_format(sd, state, format->pad);
> +	else
> +		fmt = NULL;

You could initialize fmt = NULL and skip the else

Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
   j

> +
>  	if (!fmt)
>  		return -EINVAL;
>
> --
> 2.25.1
>
