Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F71A4C0FFB
	for <lists+linux-media@lfdr.de>; Wed, 23 Feb 2022 11:15:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239507AbiBWKQH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Feb 2022 05:16:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237280AbiBWKQH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Feb 2022 05:16:07 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D8008B6D5
        for <linux-media@vger.kernel.org>; Wed, 23 Feb 2022 02:15:40 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0A69DDD;
        Wed, 23 Feb 2022 11:15:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1645611338;
        bh=oJIyzeO7xTzA2IkIUS7CIYXpogGCwlyvPKjNo7kcc50=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DtsxeUi/JBEHqzws82v8FJJ8NbeeKiXzxt4GmEBinwG7/iWkBi04s4SFmKGwRRVOh
         G2kP8se3xEuJTdI+loEFBzEoxyWSwWrPGb/6zfjHkwe2s9ikQViR8+IJqzr5592Gl3
         GCV7b4mjqSh8YMGwutoOWO4E0x5UCvQQ9CSYAsNw=
Date:   Wed, 23 Feb 2022 12:15:27 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 1/1] v4l: fwnode: Remove now-redundant loop from
 v4l2_fwnode_parse_reference()
Message-ID: <YhYJP+Skx1u2n2k/@pendragon.ideasonboard.com>
References: <20220223094720.19196-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220223094720.19196-1-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Wed, Feb 23, 2022 at 11:47:20AM +0200, Sakari Ailus wrote:
> v4l2_fwnode_parse_reference() relied on counting the number of references
> for async array memory allocation. The array is long gone so remove
> counting the references now.
> 
> This also changes how the function arrives in different unsuccessful
> return values but the functionality remains unchanged.
> 
> Also the check for -ENODATA is removed, it was made redundant by commit
> c343bc2ce2c6 ("ACPI: properties: Align return codes of
> __acpi_node_get_property_reference()").

I would have done this first in a separate patch.

> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/v4l2-core/v4l2-fwnode.c | 28 ++++++++-------------------
>  1 file changed, 8 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> index 71dcc9a96535..fe2dfc8f9d56 100644
> --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> @@ -894,25 +894,8 @@ static int v4l2_fwnode_reference_parse(struct device *dev,
>  	int ret;
>  
>  	for (index = 0;
> -	     !(ret = fwnode_property_get_reference_args(dev_fwnode(dev),
> -							prop, NULL, 0,
> -							index, &args));
> -	     index++)
> -		fwnode_handle_put(args.fwnode);
> -
> -	if (!index)
> -		return -ENOENT;
> -
> -	/*
> -	 * Note that right now both -ENODATA and -ENOENT may signal
> -	 * out-of-bounds access. Return the error in cases other than that.
> -	 */
> -	if (ret != -ENOENT && ret != -ENODATA)
> -		return ret;
> -
> -	for (index = 0;
> -	     !fwnode_property_get_reference_args(dev_fwnode(dev), prop, NULL,
> -						 0, index, &args);
> +	     !(ret = fwnode_property_get_reference_args(dev_fwnode(dev), prop,
> +							NULL, 0, index, &args));
>  	     index++) {
>  		struct v4l2_async_subdev *asd;
>  
> @@ -928,7 +911,12 @@ static int v4l2_fwnode_reference_parse(struct device *dev,
>  		}
>  	}
>  
> -	return 0;
> +	/* -ENOENT here means successful parsing */
> +	if (ret != -ENOENT)
> +		return ret;
> +
> +	/* Return -ENOENT if no references were found */
> +	return index ?: -ENOENT;

The function now returns index on success, while it used to return 0. Is
it intentional ?

>  }
>  
>  /*

-- 
Regards,

Laurent Pinchart
