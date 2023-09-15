Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECD317A1B45
	for <lists+linux-media@lfdr.de>; Fri, 15 Sep 2023 11:53:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233941AbjIOJxo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Sep 2023 05:53:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233197AbjIOJxo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Sep 2023 05:53:44 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C72EC44B4
        for <linux-media@vger.kernel.org>; Fri, 15 Sep 2023 02:50:49 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 57CC92C6;
        Fri, 15 Sep 2023 11:48:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694771320;
        bh=za/4Gb9HXUVJusk5CthVoJeFvBAVHWNCvava7MDaF0g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=n/G1AfTMkbOmkhIllflnYo3AQvYriB3ouKqitPlGM0ITT3nbkFjTIPoTiWtr8mTzP
         Vml+pTcQRWEQI2Qt1B1EkTFiBqCIVSEiKDZvBdmhTUsqvdgUnY8y3XRT6druMWiYgw
         JO61XLfhorDIepPdv0c/avGRhYIsLVu7/gRvmSSA=
Date:   Fri, 15 Sep 2023 12:50:27 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH 7/7] media: ov2740: Return -EPROBE_DEFER if no endpoint
 is found
Message-ID: <20230915095027.GH14641@pendragon.ideasonboard.com>
References: <20230915072809.37886-1-sakari.ailus@linux.intel.com>
 <20230915072809.37886-8-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230915072809.37886-8-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Fri, Sep 15, 2023 at 10:28:09AM +0300, Sakari Ailus wrote:
> With ipu bridge, endpoints may only be created when ipu bridge has
> initialised. This may happen after the sensor driver has first probed.

That's hard to understand for someone not familiar with the ipu-bridge
driver. Could you please expand the commit message ?

Also, is there a way to avoid the ov2740 probing before the required
initialization is complete ?

> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/ov2740.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
> index de39a66b1b81..a132e8a283b4 100644
> --- a/drivers/media/i2c/ov2740.c
> +++ b/drivers/media/i2c/ov2740.c
> @@ -976,7 +976,7 @@ static int ov2740_check_hwcfg(struct device *dev)
>  
>  	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
>  	if (!ep)
> -		return -ENXIO;
> +		return -EPROBE_DEFER;
>  
>  	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
>  	fwnode_handle_put(ep);

-- 
Regards,

Laurent Pinchart
