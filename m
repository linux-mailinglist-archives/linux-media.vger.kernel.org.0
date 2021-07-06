Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2FD03BDB37
	for <lists+linux-media@lfdr.de>; Tue,  6 Jul 2021 18:15:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229869AbhGFQSB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Jul 2021 12:18:01 -0400
Received: from mslow1.mail.gandi.net ([217.70.178.240]:33047 "EHLO
        mslow1.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229834AbhGFQSB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Jul 2021 12:18:01 -0400
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
        by mslow1.mail.gandi.net (Postfix) with ESMTP id 9CCEECFD30;
        Tue,  6 Jul 2021 16:08:43 +0000 (UTC)
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 77982FF808;
        Tue,  6 Jul 2021 16:08:21 +0000 (UTC)
Date:   Tue, 6 Jul 2021 18:09:10 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 02/11] rcar-vin: Fix error paths for rvin_mc_init()
Message-ID: <20210706160910.akx66qshd4wl4h2h@uno.localdomain>
References: <20210413180253.2575451-1-niklas.soderlund+renesas@ragnatech.se>
 <20210413180253.2575451-3-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210413180253.2575451-3-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Tue, Apr 13, 2021 at 08:02:44PM +0200, Niklas Söderlund wrote:
> The error paths of rvin_mc_init() do not clean up properly, fix this.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/media/platform/rcar-vin/rcar-core.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
> index c798dc9409e4cdcd..d4932f7b42647ee1 100644
> --- a/drivers/media/platform/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> @@ -946,17 +946,23 @@ static int rvin_mc_init(struct rvin_dev *vin)
>  	if (ret)
>  		return ret;
>
> +	ret = rvin_create_controls(vin, NULL);
> +	if (ret < 0)
> +		return ret;
> +
>  	ret = rvin_group_get(vin);
>  	if (ret)
> -		return ret;
> +		goto err_controls;
>
>  	ret = rvin_mc_parse_of_graph(vin);
>  	if (ret)
> -		rvin_group_put(vin);
> +		goto err_group;
>
> -	ret = rvin_create_controls(vin, NULL);
> -	if (ret < 0)
> -		return ret;
> +	return 0;

Empty line maybe ?

Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
  j
> +err_group:
> +	rvin_group_put(vin);
> +err_controls:
> +	rvin_free_controls(vin);
>
>  	return ret;
>  }
> --
> 2.31.1
>
