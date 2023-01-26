Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B93C67D00A
	for <lists+linux-media@lfdr.de>; Thu, 26 Jan 2023 16:23:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232434AbjAZPXn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 10:23:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231579AbjAZPXa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 10:23:30 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E34DD6D5CF
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 07:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674746591; x=1706282591;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SBRnsc+ijcXfcDBQEXXDzEEk0+AN5dREP8kLgIXRVKw=;
  b=D6sXy0+Cjt1GCYflXpNIOwuArJu6HKAWaiOupF8tQReSTpoyhcAFOvgU
   zXuct68CsGrN0gDu2o99UJSmpXbSSeMxkUvdusEDPamVWnBWGeKvmBPFl
   AyB3J+tJQr0sP2wn8ENofFClYmOj7oKZpq9+wfGVPH3DyiHWOZRNUTDnk
   7JvAPYIJQPYYLVNuu/QmFRNNvDvriY4K81PaWyUtOG8grV/OfoVlI7njz
   YqA1dd6wAqs8gAaAQdn0v74pcWEoiEklqm67gVbHsDkXS0gelT+rFEvaR
   wMjddfFZZde2KzXQC/XOe4NVJpu1AFBqHfJV7t6VGxj9o2//XWnmw2GBh
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="326865224"
X-IronPort-AV: E=Sophos;i="5.97,248,1669104000"; 
   d="scan'208";a="326865224"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2023 07:19:54 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="726288814"
X-IronPort-AV: E=Sophos;i="5.97,248,1669104000"; 
   d="scan'208";a="726288814"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2023 07:19:53 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id E3EC111F78D;
        Thu, 26 Jan 2023 17:19:50 +0200 (EET)
Date:   Thu, 26 Jan 2023 17:19:50 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 15/17] media: i2c: adp1653: introduce 'no_child' label
Message-ID: <Y9KaFkDXIWjiKPzc@kekkonen.localdomain>
References: <20230126150657.367921-1-hverkuil-cisco@xs4all.nl>
 <20230126150657.367921-16-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230126150657.367921-16-hverkuil-cisco@xs4all.nl>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Thu, Jan 26, 2023 at 04:06:55PM +0100, Hans Verkuil wrote:
> The code mixed gotos and returns, which confused smatch. Add a no_child
> label before the 'return -EINVAL;' to help smatch understand this.
> It's a bit more consistent as well.
> 
> This fixes this smatch warning:
> 
> adp1653.c:444 adp1653_of_init() warn: missing unwind goto?

This is clearly a false positive. There's also no reason to just have a
label where you simply return a value.

Would it be possible to just fix smatch instead?

> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/adp1653.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/adp1653.c b/drivers/media/i2c/adp1653.c
> index a61a77de6eee..136bca801db7 100644
> --- a/drivers/media/i2c/adp1653.c
> +++ b/drivers/media/i2c/adp1653.c
> @@ -420,7 +420,7 @@ static int adp1653_of_init(struct i2c_client *client,
>  
>  	child = of_get_child_by_name(node, "flash");
>  	if (!child)
> -		return -EINVAL;
> +		goto no_child;
>  
>  	if (of_property_read_u32(child, "flash-timeout-us",
>  				 &pd->max_flash_timeout))
> @@ -441,7 +441,7 @@ static int adp1653_of_init(struct i2c_client *client,
>  
>  	child = of_get_child_by_name(node, "indicator");
>  	if (!child)
> -		return -EINVAL;
> +		goto no_child;
>  
>  	if (of_property_read_u32(child, "led-max-microamp",
>  				 &pd->max_indicator_intensity))
> @@ -459,6 +459,7 @@ static int adp1653_of_init(struct i2c_client *client,
>  err:
>  	dev_err(&client->dev, "Required property not found\n");
>  	of_node_put(child);
> +no_child:
>  	return -EINVAL;
>  }
>  

-- 
Kind regards,

Sakari Ailus
