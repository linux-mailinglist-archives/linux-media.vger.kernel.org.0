Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF67A7A4DB3
	for <lists+linux-media@lfdr.de>; Mon, 18 Sep 2023 17:57:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229761AbjIRP5m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Sep 2023 11:57:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229831AbjIRP5k (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Sep 2023 11:57:40 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DADE2199A
        for <linux-media@vger.kernel.org>; Mon, 18 Sep 2023 08:56:03 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B3E71BC4;
        Mon, 18 Sep 2023 15:23:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1695043387;
        bh=kR7oF4Q/0jubAklPZb2UsV0nUtYoB3nBz9XRgzKSY1I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=o43VL2O9OSbuOS78dr+J5bjuA0UFWXQot+zA/0+5G5BLrxdeZBS0tiNDYvBlnZE+y
         B7HAoviQ107J/l5TUWS7HHl4jAfCA/Qz2kRHPVAl4iUsPWxXE6Gxxb/PABcTI+yoDX
         d/4Kc2Tfwa1pWixyD7jMnmG3WKfdb2ngL82wfREg=
Date:   Mon, 18 Sep 2023 16:24:55 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Martin Kepplinger <martink@posteo.de>
Subject: Re: [PATCH v2 09/12] media: ov2740: Return -EPROBE_DEFER if no
 endpoint is found
Message-ID: <20230918132455.GD28874@pendragon.ideasonboard.com>
References: <20230918125138.90002-1-sakari.ailus@linux.intel.com>
 <20230918125138.90002-10-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230918125138.90002-10-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Mon, Sep 18, 2023 at 03:51:35PM +0300, Sakari Ailus wrote:
> With ipu bridge, endpoints may only be created when ipu bridge has
> initialised. This may happen after the sensor driver has first probed.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/ov2740.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
> index 2c00e653ec47..ccbb15e730ae 100644
> --- a/drivers/media/i2c/ov2740.c
> +++ b/drivers/media/i2c/ov2740.c
> @@ -976,7 +976,7 @@ static int ov2740_check_hwcfg(struct device *dev)
>  
>  	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
>  	if (!ep)
> -		return -ENXIO;
> +		return -EPROBE_DEFER;

This is fine as a quick fix, so

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

but I'm thinking that we need better in the long run, for multiple
reasons:

- All sensor drivers that support ACPI should do the same, as they
  shouldn't be aware of platform-specific integration details. This
  could be done by mass-patching them, with a documentation update to
  clearly indicate what error code is appropriate. Another option could
  be to return an error pointer from fwnode_graph_get_next_endpoint(),
  with the appropriate error being set depending on the platform. Other
  solutions may be possible too.

- On OF systems, a DT error will result in probe deferral, which is
  harder to debug than probe failures. It would be nice to avoid that.

>  
>  	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
>  	fwnode_handle_put(ep);

-- 
Regards,

Laurent Pinchart
