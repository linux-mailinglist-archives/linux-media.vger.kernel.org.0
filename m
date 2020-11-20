Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71D282BA63C
	for <lists+linux-media@lfdr.de>; Fri, 20 Nov 2020 10:32:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727692AbgKTJbV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Nov 2020 04:31:21 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:60653 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727566AbgKTJbR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Nov 2020 04:31:17 -0500
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id A72F620003C;
        Fri, 20 Nov 2020 09:31:12 +0000 (UTC)
Date:   Fri, 20 Nov 2020 10:31:16 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Rikard Falkeborn <rikard.falkeborn@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: rdacm20: Constify static structs
Message-ID: <20201120093116.x43pqej4lsz5ynmz@uno.localdomain>
References: <20201119222248.148845-1-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201119222248.148845-1-rikard.falkeborn@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rikard,

On Thu, Nov 19, 2020 at 11:22:48PM +0100, Rikard Falkeborn wrote:
> The only usage of rdacm20_video_ops is to assign it to the video field
> in the v4l2_subdev_ops struct which is a pointer to const,  and the only
> usage of rdacm20_subdev_ops is to pass its address to
> v4l2_i2c_subdev_init() which accepts a pointer to const. Make them const
> to allow the compiler to put them in read-only memory.
>
> Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>

Thanks
Acked-by: Jacopo Mondi <jacopo@jmondi.org>

> ---
>  drivers/media/i2c/rdacm20.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
> index 1ed928c4ca70..ac00a6743623 100644
> --- a/drivers/media/i2c/rdacm20.c
> +++ b/drivers/media/i2c/rdacm20.c
> @@ -435,7 +435,7 @@ static int rdacm20_get_fmt(struct v4l2_subdev *sd,
>  	return 0;
>  }
>
> -static struct v4l2_subdev_video_ops rdacm20_video_ops = {
> +static const struct v4l2_subdev_video_ops rdacm20_video_ops = {
>  	.s_stream	= rdacm20_s_stream,
>  };
>
> @@ -445,7 +445,7 @@ static const struct v4l2_subdev_pad_ops rdacm20_subdev_pad_ops = {
>  	.set_fmt	= rdacm20_get_fmt,
>  };
>
> -static struct v4l2_subdev_ops rdacm20_subdev_ops = {
> +static const struct v4l2_subdev_ops rdacm20_subdev_ops = {
>  	.video		= &rdacm20_video_ops,
>  	.pad		= &rdacm20_subdev_pad_ops,
>  };
> --
> 2.29.2
>
