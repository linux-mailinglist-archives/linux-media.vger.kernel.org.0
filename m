Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FAC966B821
	for <lists+linux-media@lfdr.de>; Mon, 16 Jan 2023 08:23:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231991AbjAPHXz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Jan 2023 02:23:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232110AbjAPHXe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Jan 2023 02:23:34 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 538B0C650
        for <linux-media@vger.kernel.org>; Sun, 15 Jan 2023 23:23:15 -0800 (PST)
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E2858802;
        Mon, 16 Jan 2023 08:23:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673853793;
        bh=anGZSrkTIJj6o5hZPYZPZGSb5R8JVtftgjzJXCdcPKc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FNVvngANsq2ocWxC8euJbp8DQe+e3ILU5MsjN7oc6n6+d7G0+N636WIP/ce8KMhVD
         jiJY7UZV06DKjZFJ9LLH9ly5JGtb8c0h7KNSXLNoyRmWbHkT8mJzs+PM17smGAI7Tz
         ShNGZnrHulPi55fq3G1lNV0OX16WNW/KgW83dWwQ=
Date:   Mon, 16 Jan 2023 08:23:09 +0100
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Subject: Re: [PATCH] media: max9286: Free control handler
Message-ID: <20230116072309.ebo54zclyeic5mou@uno.localdomain>
References: <20230114214650.2984-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230114214650.2984-1-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Sat, Jan 14, 2023 at 11:46:50PM +0200, Laurent Pinchart wrote:
> The control handler is leaked in some probe-time error paths, as well as
> in the remove path. Fix it.
>
> Fixes: 66d8c9d2422d ("media: i2c: Add MAX9286 driver")
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

> ---
>  drivers/media/i2c/max9286.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index 701038d6d19b..13a986b88588 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -1122,6 +1122,7 @@ static int max9286_v4l2_register(struct max9286_priv *priv)
>  static void max9286_v4l2_unregister(struct max9286_priv *priv)
>  {
>  	fwnode_handle_put(priv->sd.fwnode);
> +	v4l2_ctrl_handler_free(&priv->ctrls);
>  	v4l2_async_unregister_subdev(&priv->sd);
>  	max9286_v4l2_notifier_unregister(priv);
>  }
> --
> Regards,
>
> Laurent Pinchart
>
