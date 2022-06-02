Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E118653B7E1
	for <lists+linux-media@lfdr.de>; Thu,  2 Jun 2022 13:34:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233316AbiFBLeG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Jun 2022 07:34:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231533AbiFBLeG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Jun 2022 07:34:06 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8E13167FB
        for <linux-media@vger.kernel.org>; Thu,  2 Jun 2022 04:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654169644; x=1685705644;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=p7/TA1laRSuWcDz5d06Vv03+bPeFnXUnBRBZD4+wAYM=;
  b=MuimK9AFNo45RNDd5BC1fYHU3pKbxuGckJyl/mF0ZRJPTqD7f4uiB5kp
   lC7gkTzz6s0mTdK/7iEUjlJPstwXzsIBpO/zPPExjhunxp7h33/5ukcgC
   LAZr24jDxMOGDmvPy54PW3sJBKAP2GzNwh+9Xx5Y5tB9wggBDPVXH+2x6
   zp47/Yxyx3XcrdNW7FLo5DCGUIpOFqAjHJRmTBTpjt0I51in1rBuKFBhM
   ZscsMscuCxwLhIc9zQJ8jmSu1xHI1bxYgcZX8XbdUW+W85Vy6MM+sQmds
   XTehPRCScxTaYOhXYjvBYSjxJw1ta7zg7W33dmkHIXh2EfTem2mJw+gtL
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10365"; a="273486828"
X-IronPort-AV: E=Sophos;i="5.91,271,1647327600"; 
   d="scan'208";a="273486828"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2022 04:34:04 -0700
X-IronPort-AV: E=Sophos;i="5.91,271,1647327600"; 
   d="scan'208";a="612784362"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2022 04:34:02 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nwj5T-000Rbi-6w;
        Thu, 02 Jun 2022 14:33:59 +0300
Date:   Thu, 2 Jun 2022 14:33:58 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, yong.zhi@intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        hverkuil-cisco@xs4all.nl, Daniel Scally <djrscally@gmail.com>
Subject: Re: [PATCH v2 1/1] ov7251: Fix multiple problems in s_stream callback
Message-ID: <YpigJom+FwVPLPXB@smile.fi.intel.com>
References: <20220518155408.12843-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220518155408.12843-1-sakari.ailus@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, May 18, 2022 at 06:54:08PM +0300, Sakari Ailus wrote:
> The s_stream callback had several issues:
> 
> - If pm_runtime_get_sync() fails, the usage_count is not put.
> 
> - The sensor wasn't suspended if s_stream(subdev, 1) failed.
> 
> Fix this.

Perhaps late, but nevertheless
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Fixes: ("media: i2c: Add pm_runtime support to ov7251")
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/ov7251.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
> index 0e7be15bc20a7..603a4c7049e69 100644
> --- a/drivers/media/i2c/ov7251.c
> +++ b/drivers/media/i2c/ov7251.c
> @@ -1340,7 +1340,7 @@ static int ov7251_s_stream(struct v4l2_subdev *subdev, int enable)
>  	if (enable) {
>  		ret = pm_runtime_get_sync(ov7251->dev);
>  		if (ret < 0)
> -			goto unlock_out;
> +			goto err_power_down;
>  
>  		ret = ov7251_pll_configure(ov7251);
>  		if (ret) {
> @@ -1372,12 +1372,11 @@ static int ov7251_s_stream(struct v4l2_subdev *subdev, int enable)
>  		pm_runtime_put(ov7251->dev);
>  	}
>  
> -unlock_out:
>  	mutex_unlock(&ov7251->lock);
>  	return ret;
>  
>  err_power_down:
> -	pm_runtime_put_noidle(ov7251->dev);
> +	pm_runtime_put(ov7251->dev);
>  	mutex_unlock(&ov7251->lock);
>  	return ret;
>  }
> -- 
> 2.30.2
> 

-- 
With Best Regards,
Andy Shevchenko


