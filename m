Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 586BD26A417
	for <lists+linux-media@lfdr.de>; Tue, 15 Sep 2020 13:24:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbgIOLYc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Sep 2020 07:24:32 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:42119 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726150AbgIOLYM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Sep 2020 07:24:12 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id B9A03FF80E;
        Tue, 15 Sep 2020 11:24:02 +0000 (UTC)
Date:   Tue, 15 Sep 2020 13:27:52 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] rcar-csi2: Set bus type when parsing fwnode
Message-ID: <20200915112752.f2vpxnvusson65uz@uno.localdomain>
References: <20200914215011.339387-1-niklas.soderlund+renesas@ragnatech.se>
 <20200914215011.339387-3-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200914215011.339387-3-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Mon, Sep 14, 2020 at 11:50:11PM +0200, Niklas Söderlund wrote:
> The only supported bus for the R-Car CSI-2 driver is CSI-2 DPHY, specify
> this before parsing the fwnode.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/media/platform/rcar-vin/rcar-csi2.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
> index 23e89ef2429d310a..b2e58f51b94fccd7 100644
> --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> @@ -874,7 +874,9 @@ static int rcsi2_parse_dt(struct rcar_csi2 *priv)
>  	struct v4l2_async_subdev *asd;
>  	struct fwnode_handle *fwnode;
>  	struct fwnode_handle *ep;
> -	struct v4l2_fwnode_endpoint v4l2_ep = { .bus_type = 0 };
> +	struct v4l2_fwnode_endpoint v4l2_ep = {
> +		.bus_type = V4L2_MBUS_CSI2_DPHY
> +	};

I would also take the occasion to make bus-type mandatory in
bindings as v4l2_fwnode_endpoint_parse() will fail only if it detect a
mismatch between bus_type and "bus-type".

For older DTS we won't detect mismatches, but that's not worse than
what we have today.

In case you update bindings I would update the error message in the
v4l2_fwnode_endpoint_parse() failure path to report the mismatch.

The patch itself is good
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
  j


>  	int ret;
>
>  	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(priv->dev), 0, 0, 0);
> --
> 2.28.0
>
