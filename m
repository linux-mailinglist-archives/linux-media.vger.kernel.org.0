Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 866FC5A25FD
	for <lists+linux-media@lfdr.de>; Fri, 26 Aug 2022 12:41:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245660AbiHZKlR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Aug 2022 06:41:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245302AbiHZKlO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Aug 2022 06:41:14 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0F94C694E
        for <linux-media@vger.kernel.org>; Fri, 26 Aug 2022 03:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661510472; x=1693046472;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=iPraGZxgsWqkvlO7fTo7ixT0A0c54kiEbWIoX5d+Rww=;
  b=OjOdeKq1QhiD7DXOvrUrLFZ/irgEQOtyUPkIs+xhvrUOylA8qzcV/aDI
   FQb1urCBGngXXzVW/D3ti0r1gdh7acXhS1uTu64KdufoGjpKsIQKzV1on
   gCsNgfpV98lC5C3cyMptGJWxx9nRgPNmOhYOzzAYRhFNEQI93HhwFTsfQ
   Ndvfmqm1PUS4keEDtGcpbSc3BcY3zjbUsi5pNeu41JXpFHkmbOHPwb5xp
   FU59nVVgL0gqgxbEFeYfLHPGFg48G/tepEMIujLEHbmKapBKQHQ1zsKWA
   Aer04xY+yd7HMHto08/HxWS+W1BSAh5uVMH8ynDAXWHZUYQ85LVXjxZyC
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10450"; a="274874458"
X-IronPort-AV: E=Sophos;i="5.93,265,1654585200"; 
   d="scan'208";a="274874458"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2022 03:41:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,265,1654585200"; 
   d="scan'208";a="640011310"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.188]) ([10.238.232.188])
  by orsmga008.jf.intel.com with ESMTP; 26 Aug 2022 03:41:03 -0700
Subject: Re: [PATCH 1/1] ipu3-imgu: Fix NULL pointer dereference in active
 selection access
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
References: <20220825190351.3241444-1-sakari.ailus@linux.intel.com>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <0f351df8-3f2c-74fc-3f9e-089761d53c63@linux.intel.com>
Date:   Fri, 26 Aug 2022 18:40:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20220825190351.3241444-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sakari, 

Thanks for your patch, does it make sense that prevent the
NULL deference and throw warning in v4l2-subdev API? Though it
is the responsibility of driver to keep it safe.


Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>



On 8/26/22 3:03 AM, Sakari Ailus wrote:
> What the IMGU driver did was that it first acquired the pointers to active
> and try V4L2 subdev state, and only then figured out which one to use.
> 
> The problem with that approach and a later patch (see Fixes: tag) is that
> as sd_state argument to v4l2_subdev_get_try_crop() et al is NULL, there is
> now an attempt to dereference that.
> 
> Fix this.
> 
> Also rewrap lines a little.
> 
> Fixes: 0d346d2a6f54 ("media: v4l2-subdev: add subdev-wide state struct")
> Cc: stable@vger.kernel.org # for v5.14 and later
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/staging/media/ipu3/ipu3-v4l2.c | 31 ++++++++++++--------------
>  1 file changed, 14 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
> index d1c539cefba87..2234bb8d48b34 100644
> --- a/drivers/staging/media/ipu3/ipu3-v4l2.c
> +++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
> @@ -192,33 +192,30 @@ static int imgu_subdev_get_selection(struct v4l2_subdev *sd,
>  				     struct v4l2_subdev_state *sd_state,
>  				     struct v4l2_subdev_selection *sel)
>  {
> -	struct v4l2_rect *try_sel, *r;
> -	struct imgu_v4l2_subdev *imgu_sd = container_of(sd,
> -							struct imgu_v4l2_subdev,
> -							subdev);
> +	struct imgu_v4l2_subdev *imgu_sd =
> +		container_of(sd, struct imgu_v4l2_subdev, subdev);
>  
>  	if (sel->pad != IMGU_NODE_IN)
>  		return -EINVAL;
>  
>  	switch (sel->target) {
>  	case V4L2_SEL_TGT_CROP:
> -		try_sel = v4l2_subdev_get_try_crop(sd, sd_state, sel->pad);
> -		r = &imgu_sd->rect.eff;
> -		break;
> +		if (sel->which == V4L2_SUBDEV_FORMAT_TRY)
> +			sel->r = *v4l2_subdev_get_try_crop(sd, sd_state,
> +							   sel->pad);
> +		else
> +			sel->r = imgu_sd->rect.eff;
> +		return 0;
>  	case V4L2_SEL_TGT_COMPOSE:
> -		try_sel = v4l2_subdev_get_try_compose(sd, sd_state, sel->pad);
> -		r = &imgu_sd->rect.bds;
> -		break;
> +		if (sel->which == V4L2_SUBDEV_FORMAT_TRY)
> +			sel->r = *v4l2_subdev_get_try_compose(sd, sd_state,
> +							      sel->pad);
> +		else
> +			sel->r = imgu_sd->rect.bds;
> +		return 0;
>  	default:
>  		return -EINVAL;
>  	}
> -
> -	if (sel->which == V4L2_SUBDEV_FORMAT_TRY)
> -		sel->r = *try_sel;
> -	else
> -		sel->r = *r;
> -
> -	return 0;
>  }
>  
>  static int imgu_subdev_set_selection(struct v4l2_subdev *sd,
> 

-- 
Best regards,
Bingbu Cao
