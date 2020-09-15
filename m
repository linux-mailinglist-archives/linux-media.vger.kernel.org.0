Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21F2D26B911
	for <lists+linux-media@lfdr.de>; Wed, 16 Sep 2020 02:56:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726106AbgIOLaW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Sep 2020 07:30:22 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:33903 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726202AbgIOLWt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Sep 2020 07:22:49 -0400
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 84C3524000E;
        Tue, 15 Sep 2020 11:20:52 +0000 (UTC)
Date:   Tue, 15 Sep 2020 13:24:43 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] rcar-csi2: Switch to using fwnode instead of OF
Message-ID: <20200915112443.kdvrvhxb75vnel3c@uno.localdomain>
References: <20200914215011.339387-1-niklas.soderlund+renesas@ragnatech.se>
 <20200914215011.339387-2-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200914215011.339387-2-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Mon, Sep 14, 2020 at 11:50:10PM +0200, Niklas Söderlund wrote:
> Use the fwnode_graph_get_endpoint_by_id() interface instead of
> of_graph_get_endpoint_by_regs() to fetch the fwnode. This saves
> translating between a device_node and fwnode_handle.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Looks good
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
  j

> ---
>  drivers/media/platform/rcar-vin/rcar-csi2.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
> index 511cd4984777ad99..23e89ef2429d310a 100644
> --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> @@ -873,31 +873,31 @@ static int rcsi2_parse_dt(struct rcar_csi2 *priv)
>  {
>  	struct v4l2_async_subdev *asd;
>  	struct fwnode_handle *fwnode;
> -	struct device_node *ep;
> +	struct fwnode_handle *ep;
>  	struct v4l2_fwnode_endpoint v4l2_ep = { .bus_type = 0 };
>  	int ret;
>
> -	ep = of_graph_get_endpoint_by_regs(priv->dev->of_node, 0, 0);
> +	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(priv->dev), 0, 0, 0);
>  	if (!ep) {
>  		dev_err(priv->dev, "Not connected to subdevice\n");
>  		return -EINVAL;
>  	}
>
> -	ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(ep), &v4l2_ep);
> +	ret = v4l2_fwnode_endpoint_parse(ep, &v4l2_ep);
>  	if (ret) {
>  		dev_err(priv->dev, "Could not parse v4l2 endpoint\n");
> -		of_node_put(ep);
> +		fwnode_handle_put(ep);
>  		return -EINVAL;
>  	}
>
>  	ret = rcsi2_parse_v4l2(priv, &v4l2_ep);
>  	if (ret) {
> -		of_node_put(ep);
> +		fwnode_handle_put(ep);
>  		return ret;
>  	}
>
> -	fwnode = fwnode_graph_get_remote_endpoint(of_fwnode_handle(ep));
> -	of_node_put(ep);
> +	fwnode = fwnode_graph_get_remote_endpoint(ep);
> +	fwnode_handle_put(ep);
>
>  	dev_dbg(priv->dev, "Found '%pOF'\n", to_of_node(fwnode));
>
> --
> 2.28.0
>
