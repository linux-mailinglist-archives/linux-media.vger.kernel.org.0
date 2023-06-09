Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 664F772960D
	for <lists+linux-media@lfdr.de>; Fri,  9 Jun 2023 11:57:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241918AbjFIJ5c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Jun 2023 05:57:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241923AbjFIJ4q (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Jun 2023 05:56:46 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46F1165B5
        for <linux-media@vger.kernel.org>; Fri,  9 Jun 2023 02:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686304076; x=1717840076;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vrIHRkjDp3lE3EHm994foGsJHYSQkGp+/SVTPYvupoY=;
  b=Uk9ed1ELuSzTgs+J5x27RjnYhKYyxuZ9SZwUrd+3aQiMyP6MpYmThQv+
   nlrDnvhJUaKwikpOnQYFSULMyUkrZqIPJHorid/qWfVcFpHbC9XpbUv6e
   yV+UFyr81ogy574tOo1Fq2+AYhBOmWhL+GqWo6xKfdTu7cJkefCcxbi4a
   CA6uVxGoviRvDzZpZk0V1TMfvcb1gVNBHquMdIuPM9emnrPvN5BMo8p4F
   Lv2tCxI28/fvMu93GpGD3ubutRAFFcOCnVIMfBP2By2uPT6BauNHUXtlK
   IEMt/fZws/ZunJzVwU0QtgtnFVrCqdetqpx8EQcQj4HyEsydGhGyf0YXH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="337196541"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; 
   d="scan'208";a="337196541"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 02:47:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="800166338"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; 
   d="scan'208";a="800166338"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 02:47:55 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 9CCDC11F9D2;
        Fri,  9 Jun 2023 12:47:52 +0300 (EEST)
Date:   Fri, 9 Jun 2023 09:47:52 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH] media: i2c: adp1653: don't reuse the same node pointer
Message-ID: <ZIL1SCUUzd/xbJ+/@kekkonen.localdomain>
References: <da55b552-08ce-6bbe-c70b-eda6f53727f0@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da55b552-08ce-6bbe-c70b-eda6f53727f0@xs4all.nl>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thanks for the patch.

On Fri, Jun 09, 2023 at 11:43:14AM +0200, Hans Verkuil wrote:
> The child device_node pointer was used for two different childs.
> This confused smatch, causing this warning:
> 
> drivers/media/i2c/adp1653.c:444 adp1653_of_init() warn: missing unwind goto?
> 
> Use two different pointers, one for each child node, and add separate
> goto labels for each node as well. This also improves error logging
> since it will now state for which node the property was missing.

It would have been better to fix smatch. :-(

I guess changing the driver isn't wrong either still.

> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
> diff --git a/drivers/media/i2c/adp1653.c b/drivers/media/i2c/adp1653.c
> index 98ca417b8004..04ec465aaa94 100644
> --- a/drivers/media/i2c/adp1653.c
> +++ b/drivers/media/i2c/adp1653.c
> @@ -411,43 +411,43 @@ static int adp1653_of_init(struct i2c_client *client,
>  			   struct device_node *node)
>  {
>  	struct adp1653_platform_data *pd;
> -	struct device_node *child;
> +	struct device_node *node_flash, *node_indicator;
> 
>  	pd = devm_kzalloc(&client->dev, sizeof(*pd), GFP_KERNEL);
>  	if (!pd)
>  		return -ENOMEM;
>  	flash->platform_data = pd;
> 
> -	child = of_get_child_by_name(node, "flash");
> -	if (!child)
> +	node_flash = of_get_child_by_name(node, "flash");
> +	if (!node_flash)
>  		return -EINVAL;
> 
> -	if (of_property_read_u32(child, "flash-timeout-us",
> +	if (of_property_read_u32(node_flash, "flash-timeout-us",
>  				 &pd->max_flash_timeout))
> -		goto err;
> +		goto err_flash;
> 
> -	if (of_property_read_u32(child, "flash-max-microamp",
> +	if (of_property_read_u32(node_flash, "flash-max-microamp",
>  				 &pd->max_flash_intensity))
> -		goto err;
> +		goto err_flash;
> 
>  	pd->max_flash_intensity /= 1000;
> 
> -	if (of_property_read_u32(child, "led-max-microamp",
> +	if (of_property_read_u32(node_flash, "led-max-microamp",
>  				 &pd->max_torch_intensity))
> -		goto err;
> +		goto err_flash;
> 
>  	pd->max_torch_intensity /= 1000;
> -	of_node_put(child);
> +	of_node_put(node_flash);

How about moving this to where the other node is put, and initialise the
nodes to NULL and so continue having a single error label?

> 
> -	child = of_get_child_by_name(node, "indicator");
> -	if (!child)
> +	node_indicator = of_get_child_by_name(node, "indicator");
> +	if (!node_indicator)
>  		return -EINVAL;
> 
> -	if (of_property_read_u32(child, "led-max-microamp",
> +	if (of_property_read_u32(node_indicator, "led-max-microamp",
>  				 &pd->max_indicator_intensity))
> -		goto err;
> +		goto err_indicator;
> 
> -	of_node_put(child);
> +	of_node_put(node_indicator);
> 
>  	pd->enable_gpio = devm_gpiod_get(&client->dev, "enable", GPIOD_OUT_LOW);
>  	if (IS_ERR(pd->enable_gpio)) {
> @@ -456,9 +456,13 @@ static int adp1653_of_init(struct i2c_client *client,
>  	}
> 
>  	return 0;
> -err:
> -	dev_err(&client->dev, "Required property not found\n");
> -	of_node_put(child);
> +err_flash:
> +	dev_err(&client->dev, "Required flash property not found\n");
> +	of_node_put(node_flash);
> +	return -EINVAL;
> +err_indicator:
> +	dev_err(&client->dev, "Required indicator property not found\n");
> +	of_node_put(node_indicator);
>  	return -EINVAL;
>  }
> 

-- 
Kind regards,

Sakari Ailus
