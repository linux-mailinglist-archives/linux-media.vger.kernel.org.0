Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4834E3B1D8C
	for <lists+linux-media@lfdr.de>; Wed, 23 Jun 2021 17:22:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230243AbhFWPYr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Jun 2021 11:24:47 -0400
Received: from mslow1.mail.gandi.net ([217.70.178.240]:32873 "EHLO
        mslow1.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbhFWPYq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Jun 2021 11:24:46 -0400
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
        by mslow1.mail.gandi.net (Postfix) with ESMTP id 4F744D291F
        for <linux-media@vger.kernel.org>; Wed, 23 Jun 2021 15:14:05 +0000 (UTC)
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id E7E23FF806;
        Wed, 23 Jun 2021 15:13:42 +0000 (UTC)
Date:   Wed, 23 Jun 2021 17:14:32 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: Re: [PATCH 5/6] media: rcar-vin: Remove explicit device availability
 check
Message-ID: <20210623151432.xoupeveqgd6hswzz@uno.localdomain>
References: <20210622112200.13914-1-sakari.ailus@linux.intel.com>
 <20210622112200.13914-6-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210622112200.13914-6-sakari.ailus@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Tue, Jun 22, 2021 at 02:21:59PM +0300, Sakari Ailus wrote:
> From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
>
> The fwnode is retrieved using fwnode_graph_get_endpoint_by_id() without
> the FWNODE_GRAPH_DEVICE_DISABLED flag set. So there is no need to
> explicitly check if the fwnode is available as it always will be when
> the check is performed, remove it.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
  j

> ---
>  drivers/media/platform/rcar-vin/rcar-core.c | 7 -------
>  1 file changed, 7 deletions(-)
>
> diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
> index 3b7052ff7117..a24aeda37e74 100644
> --- a/drivers/media/platform/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> @@ -834,13 +834,6 @@ static int rvin_mc_parse_of(struct rvin_dev *vin, unsigned int id)
>  		goto out;
>  	}
>
> -	if (!of_device_is_available(to_of_node(fwnode))) {
> -		vin_dbg(vin, "OF device %pOF disabled, ignoring\n",
> -			to_of_node(fwnode));
> -		ret = -ENOTCONN;
> -		goto out;
> -	}
> -
>  	asd = v4l2_async_nf_add_fwnode(&vin->group->notifier, fwnode,
>  				       struct v4l2_async_subdev);
>  	if (IS_ERR(asd)) {
> --
> 2.30.2
>
