Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F3AF28299B
	for <lists+linux-media@lfdr.de>; Sun,  4 Oct 2020 10:32:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725830AbgJDIbz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 4 Oct 2020 04:31:55 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:53590 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbgJDIbz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 4 Oct 2020 04:31:55 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 93E852A2;
        Sun,  4 Oct 2020 10:31:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1601800313;
        bh=ASvvRjputQfL6yjUwONkjJypc9Q6ZmfRu4QYQFDVMlQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=G0kWsGE48yiSNWGcYecbLlSgiBfBtT4ebF0a1KSibFuxEJqIa8SyzTwh83xSir46M
         Cx9mapHKaIzyOFeJcq4qASg/ta8hbsSPRKCXsSfOUmjXRi9kMH3fV6fiHJXD1dCLxz
         tQRBV2Ka2xXyFoa3+qMWNTjhPItianWDqE1PDbIw=
Date:   Sun, 4 Oct 2020 11:31:15 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, jmondi@jmondi.org
Subject: Re: [PATCH 1/5] adv748x: Zero entire struct v4l2_fwnode_endpoint
Message-ID: <20201004083115.GB3938@pendragon.ideasonboard.com>
References: <20200930144811.16612-1-sakari.ailus@linux.intel.com>
 <20200930144811.16612-2-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200930144811.16612-2-sakari.ailus@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Wed, Sep 30, 2020 at 05:48:07PM +0300, Sakari Ailus wrote:
> The v4l2_fwnode_parse_endpoint() function can make use of defaults in
> multiple bus types. To use this feature, all callers must zero the rest of
> the fields of this struct, too. All other drivers appear to do that
> already apart from this one.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/adv748x/adv748x-core.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/adv748x/adv748x-core.c b/drivers/media/i2c/adv748x/adv748x-core.c
> index 1fe7f97c6d52..ae8b7ebf3830 100644
> --- a/drivers/media/i2c/adv748x/adv748x-core.c
> +++ b/drivers/media/i2c/adv748x/adv748x-core.c
> @@ -589,14 +589,13 @@ static int adv748x_parse_csi2_lanes(struct adv748x_state *state,
>  				    unsigned int port,
>  				    struct device_node *ep)
>  {
> -	struct v4l2_fwnode_endpoint vep;
> +	struct v4l2_fwnode_endpoint vep = { .bus_type = V4L2_MBUS_CSI2_DPHY };
>  	unsigned int num_lanes;
>  	int ret;
>  
>  	if (port != ADV748X_PORT_TXA && port != ADV748X_PORT_TXB)
>  		return 0;
>  
> -	vep.bus_type = V4L2_MBUS_CSI2_DPHY;
>  	ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(ep), &vep);
>  	if (ret)
>  		return ret;

-- 
Regards,

Laurent Pinchart
