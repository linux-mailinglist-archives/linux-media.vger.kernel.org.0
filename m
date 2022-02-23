Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E4C54C12AC
	for <lists+linux-media@lfdr.de>; Wed, 23 Feb 2022 13:22:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240223AbiBWMXF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Feb 2022 07:23:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237783AbiBWMXE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Feb 2022 07:23:04 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 323559AE4E
        for <linux-media@vger.kernel.org>; Wed, 23 Feb 2022 04:22:37 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id ADF9CDD;
        Wed, 23 Feb 2022 13:22:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1645618955;
        bh=6o7j/FmbkRPZMXcFeREOKMmTu1EQ/j8+0ePV0qiqB8E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AlhlRZEJDQp4a/fi8idpNwD16n09TiB/4ZOCO3ceXbyNLvkf2kZreeSPN2frz2Ixz
         /njdjvL0kCZZE1ScTCzsDx6oIn9H1GBshUB8+astw6NtFiaBo3X3Dp8A/vu0HNsowx
         9UuACJiqMsGHhYBwkxVhTWjuAbCXvxVQUmymB2k4=
Date:   Wed, 23 Feb 2022 14:22:25 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 2/2] v4l: fwnode: Remove now-redundant loop from
 v4l2_fwnode_parse_reference()
Message-ID: <YhYnAVdGkbyRZp5A@pendragon.ideasonboard.com>
References: <20220223115434.21316-1-sakari.ailus@linux.intel.com>
 <20220223115434.21316-3-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220223115434.21316-3-sakari.ailus@linux.intel.com>
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

On Wed, Feb 23, 2022 at 01:54:34PM +0200, Sakari Ailus wrote:
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

This paragraph should be dropped.

> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/v4l2-core/v4l2-fwnode.c | 24 ++++++++----------------
>  1 file changed, 8 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> index ae140443847b..afceb35e500c 100644
> --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> @@ -894,21 +894,8 @@ static int v4l2_fwnode_reference_parse(struct device *dev,
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
> -	if (ret != -ENOENT)
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
> @@ -924,7 +911,12 @@ static int v4l2_fwnode_reference_parse(struct device *dev,
>  		}
>  	}
>  
> -	return 0;
> +	/* -ENOENT here means successful parsing */
> +	if (ret != -ENOENT)
> +		return ret;
> +
> +	/* Return -ENOENT if no references were found */
> +	return index ? 0 : -ENOENT;
>  }
>  
>  /*

-- 
Regards,

Laurent Pinchart
