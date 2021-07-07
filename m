Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A39463BE670
	for <lists+linux-media@lfdr.de>; Wed,  7 Jul 2021 12:39:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231364AbhGGKma (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jul 2021 06:42:30 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:1411 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230354AbhGGKma (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jul 2021 06:42:30 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 6DBB824000D;
        Wed,  7 Jul 2021 10:39:48 +0000 (UTC)
Date:   Wed, 7 Jul 2021 12:40:36 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 09/11] rcar-vin: Specify media device ops at group
 creation time
Message-ID: <20210707104036.m6qr2cqobbvvtd4v@uno.localdomain>
References: <20210413180253.2575451-1-niklas.soderlund+renesas@ragnatech.se>
 <20210413180253.2575451-10-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210413180253.2575451-10-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Tue, Apr 13, 2021 at 08:02:51PM +0200, Niklas Söderlund wrote:
> The media device operations structure will be different deepening on

s/deepening/depending

> what media graph layout is used. Instead of hard-coding the R-Car CSI-2
> layout allow the operations to be passed as an argument.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/media/platform/rcar-vin/rcar-core.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
> index d03ecd443b01c2b3..28bf9e8f19a1a27b 100644
> --- a/drivers/media/platform/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> @@ -248,7 +248,8 @@ static void rvin_group_cleanup(struct rvin_group *group)
>  }
>
>  static int rvin_group_init(struct rvin_group *group, struct rvin_dev *vin,
> -			   void (*link_setup)(struct rvin_dev *))
> +			   void (*link_setup)(struct rvin_dev *),
> +			   const struct media_device_ops *ops)
>  {
>  	struct media_device *mdev = &group->mdev;
>  	const struct of_device_id *match;
> @@ -267,7 +268,7 @@ static int rvin_group_init(struct rvin_group *group, struct rvin_dev *vin,
>  	group->link_setup = link_setup;
>
>  	mdev->dev = vin->dev;
> -	mdev->ops = &rvin_media_ops;
> +	mdev->ops = ops;
>
>  	match = of_match_node(vin->dev->driver->of_match_table,
>  			      vin->dev->of_node);
> @@ -299,7 +300,8 @@ static void rvin_group_release(struct kref *kref)
>  }
>
>  static int rvin_group_get(struct rvin_dev *vin,
> -			  void (*link_setup)(struct rvin_dev *))
> +			  void (*link_setup)(struct rvin_dev *),
> +			  const struct media_device_ops *ops)
>  {
>  	struct rvin_group *group;
>  	u32 id;
> @@ -331,7 +333,7 @@ static int rvin_group_get(struct rvin_dev *vin,
>  			goto err_group;
>  		}
>
> -		ret = rvin_group_init(group, vin, link_setup);
> +		ret = rvin_group_init(group, vin, link_setup, ops);
>  		if (ret) {
>  			kfree(group);
>  			vin_err(vin, "Failed to initialize group\n");
> @@ -984,7 +986,7 @@ static int rvin_csi2_init(struct rvin_dev *vin)
>  	if (ret < 0)
>  		return ret;
>
> -	ret = rvin_group_get(vin, rvin_csi2_setup_links);
> +	ret = rvin_group_get(vin, rvin_csi2_setup_links, &rvin_media_ops);

I would continue the effort of using the csi2_ prefix for CSI-2
related fields. Just a nit, the change looks good

Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
  j

>  	if (ret)
>  		goto err_controls;
>
> --
> 2.31.1
>
