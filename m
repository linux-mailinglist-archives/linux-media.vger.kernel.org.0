Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 290817A1A9A
	for <lists+linux-media@lfdr.de>; Fri, 15 Sep 2023 11:33:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233693AbjIOJdD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Sep 2023 05:33:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233701AbjIOJdD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Sep 2023 05:33:03 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E1FE1FFA
        for <linux-media@vger.kernel.org>; Fri, 15 Sep 2023 02:32:58 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 32C392C6;
        Fri, 15 Sep 2023 11:31:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694770283;
        bh=0Wo3XTuk0XYGA62dDhqnBoCPKyvnN058NnBhq0LrVKY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=up0SxppjLFZAzvaL4R+Vl6zMRrgNxczhDJHZuCWUiee+IETFFn2XeGrZG73Oxyub2
         HMrdxl298fvDi/ii74qriEzwBSbL96M0MgAsJOBSCtXFlgI88LrNYJnZa6l1Xelmqx
         T2tPUUNTDvWgjZb2ToWCf4vGimjopC+tb+VW+npM=
Date:   Fri, 15 Sep 2023 12:33:10 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH 4/7] media: ccs: Correct error handling in
 ccs_register_subdev
Message-ID: <20230915093310.GE14641@pendragon.ideasonboard.com>
References: <20230915072809.37886-1-sakari.ailus@linux.intel.com>
 <20230915072809.37886-5-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230915072809.37886-5-sakari.ailus@linux.intel.com>
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

On Fri, Sep 15, 2023 at 10:28:06AM +0300, Sakari Ailus wrote:
> ccs_register_subdev() did not clean up the media entity in error case, do
> that now. Also switch to goto based error handling.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/ccs/ccs-core.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> index 6f8fbd82e21c..3fed071b65ab 100644
> --- a/drivers/media/i2c/ccs/ccs-core.c
> +++ b/drivers/media/i2c/ccs/ccs-core.c
> @@ -2968,7 +2968,7 @@ static int ccs_register_subdev(struct ccs_sensor *sensor,
>  	rval = v4l2_device_register_subdev(sensor->src->sd.v4l2_dev, &ssd->sd);
>  	if (rval) {
>  		dev_err(&client->dev, "v4l2_device_register_subdev failed\n");
> -		return rval;
> +		goto out_media_entity_cleanup;
>  	}
>  
>  	rval = media_create_pad_link(&ssd->sd.entity, source_pad,
> @@ -2976,11 +2976,18 @@ static int ccs_register_subdev(struct ccs_sensor *sensor,
>  				     link_flags);
>  	if (rval) {
>  		dev_err(&client->dev, "media_create_pad_link failed\n");
> -		v4l2_device_unregister_subdev(&ssd->sd);
> -		return rval;
> +		goto out_v4l2_device_unregister_subdev;
>  	}
>  
>  	return 0;
> +
> +out_v4l2_device_unregister_subdev:
> +	v4l2_device_unregister_subdev(&ssd->sd);
> +
> +out_media_entity_cleanup:
> +	media_entity_cleanup(&ssd->sd.entity);
> +
> +	return rval;
>  }
>  
>  static void ccs_unregistered(struct v4l2_subdev *subdev)

-- 
Regards,

Laurent Pinchart
