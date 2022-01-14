Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A00848E58D
	for <lists+linux-media@lfdr.de>; Fri, 14 Jan 2022 09:19:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239739AbiANITD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Jan 2022 03:19:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234100AbiANISf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Jan 2022 03:18:35 -0500
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::225])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B0B8C061755;
        Fri, 14 Jan 2022 00:18:34 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 12B6B1C000E;
        Fri, 14 Jan 2022 08:18:30 +0000 (UTC)
Date:   Fri, 14 Jan 2022 09:19:31 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Subject: Re: [PATCH] media: i2c: max9286: Implement media entity
 .link_validate() operation
Message-ID: <20220114081931.3b6yugropjmboxnr@uno.localdomain>
References: <20220113205150.6533-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220113205150.6533-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Thu, Jan 13, 2022 at 10:51:50PM +0200, Laurent Pinchart wrote:
> The MAX9286 has sink pads, so it should implement .link_validate(). Do
> so.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Indeed

Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
   j

> ---
>  drivers/media/i2c/max9286.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index eb2b8e42335b..b4885d3b3059 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -846,6 +846,10 @@ static const struct v4l2_subdev_internal_ops max9286_subdev_internal_ops = {
>  	.open = max9286_open,
>  };
>
> +static const struct media_entity_operations max9286_media_ops = {
> +	.link_validate = v4l2_subdev_link_validate
> +};
> +
>  static int max9286_s_ctrl(struct v4l2_ctrl *ctrl)
>  {
>  	switch (ctrl->id) {
> @@ -895,6 +899,7 @@ static int max9286_v4l2_register(struct max9286_priv *priv)
>  		goto err_async;
>
>  	priv->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
> +	priv->sd.entity.ops = &max9286_media_ops;
>
>  	priv->pads[MAX9286_SRC_PAD].flags = MEDIA_PAD_FL_SOURCE;
>  	for (i = 0; i < MAX9286_SRC_PAD; i++)
> --
> Regards,
>
> Laurent Pinchart
>
