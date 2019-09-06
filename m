Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 520B8AB387
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2019 09:54:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732587AbfIFHy3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Sep 2019 03:54:29 -0400
Received: from retiisi.org.uk ([95.216.213.190]:54912 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725290AbfIFHy3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 6 Sep 2019 03:54:29 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id C6EAA634C87;
        Fri,  6 Sep 2019 10:54:13 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1i694P-0000kT-Pu; Fri, 06 Sep 2019 10:54:13 +0300
Date:   Fri, 6 Sep 2019 10:54:13 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Jan Kotas <jank@cadence.com>
Cc:     maxime.ripard@bootlin.com, mchehab@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, rafalc@cadence.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] media: Add lane checks for Cadence CSI2RX
Message-ID: <20190906075413.GE1586@valkosipuli.retiisi.org.uk>
References: <20190905105601.27034-1-jank@cadence.com>
 <20190905105601.27034-3-jank@cadence.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190905105601.27034-3-jank@cadence.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jan,

Thanks for the patchset.

On Thu, Sep 05, 2019 at 11:56:00AM +0100, Jan Kotas wrote:
> This patch adds lane checks for CSI2RX, to prevent clock lane
> being used as a data lane.
> 
> Signed-off-by: Jan Kotas <jank@cadence.com>
> ---
>  drivers/media/platform/cadence/cdns-csi2rx.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
> index 31ace114e..97ec09e72 100644
> --- a/drivers/media/platform/cadence/cdns-csi2rx.c
> +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
> @@ -2,7 +2,7 @@
>  /*
>   * Driver for Cadence MIPI-CSI2 RX Controller v1.3
>   *
> - * Copyright (C) 2017 Cadence Design Systems Inc.
> + * Copyright (C) 2017-2019 Cadence Design Systems Inc.
>   */
>  
>  #include <linux/clk.h>
> @@ -364,7 +364,7 @@ static int csi2rx_parse_dt(struct csi2rx_priv *csi2rx)
>  	struct v4l2_fwnode_endpoint v4l2_ep = { .bus_type = 0 };
>  	struct fwnode_handle *fwh;
>  	struct device_node *ep;
> -	int ret;
> +	int ret, i;
>  
>  	ep = of_graph_get_endpoint_by_regs(csi2rx->dev->of_node, 0, 0);
>  	if (!ep)
> @@ -395,6 +395,15 @@ static int csi2rx_parse_dt(struct csi2rx_priv *csi2rx)
>  		return -EINVAL;
>  	}
>  
> +	for (i = 0; i < csi2rx->num_lanes; i++) {
> +		if (csi2rx->lanes[i] < 1) {

Do you need this? v4l2_fwnode_parse_endpoint() already has a more thorough
check for the lane numbers.

> +			dev_err(csi2rx->dev, "Invalid lane[%d] number: %u\n",
> +				i, csi2rx->lanes[i]);
> +			of_node_put(ep);
> +			return -EINVAL;
> +		}
> +	}
> +
>  	csi2rx->asd.match.fwnode = fwnode_graph_get_remote_port_parent(fwh);
>  	csi2rx->asd.match_type = V4L2_ASYNC_MATCH_FWNODE;
>  	of_node_put(ep);

-- 
Regards,

Sakari Ailus
