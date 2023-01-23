Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD66B678516
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 19:40:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232095AbjAWSkf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 13:40:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230109AbjAWSke (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 13:40:34 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A3C82310A
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 10:40:33 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="323808518"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="323808518"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 10:40:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="770006440"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="770006440"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP; 23 Jan 2023 10:40:30 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1pK1k4-00DsRe-2u;
        Mon, 23 Jan 2023 20:40:28 +0200
Date:   Mon, 23 Jan 2023 20:40:28 +0200
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 52/57] media: atomisp: ov2722: Fix GPIO1 polarity
Message-ID: <Y87UnIsgPOFvbHH6@smile.fi.intel.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-53-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123125205.622152-53-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_SOFTFAIL autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jan 23, 2023 at 01:52:00PM +0100, Hans de Goede wrote:
> The comment claims the PWDN pin is active when pulled down in other words,
> it is /power-down so it needs to be driven high to get the sensor
> powered-up (not powered down) and flag is 1 when powering-up the sensor
> so the ! is wrong, drop it.
> 
> This also matches with the schematics which I have which shows GPIO1 also
> enables a 3.3v line to the sensor-module which controls the privacy-LED
> and indeed before this patch the privacy LED was inverted from what it
> should be (and the sensor did not work).

Code-wise it's okay
Reviewed-by: Andy Shevchenko <andy@kernel.org>


> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/staging/media/atomisp/i2c/atomisp-ov2722.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
> index d874e12da8cc..83d036b5d772 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
> @@ -512,10 +512,7 @@ static int gpio_ctrl(struct v4l2_subdev *sd, bool flag)
>  	 * before PWDN# when turning it on or off.
>  	 */
>  	ret = dev->platform_data->gpio0_ctrl(sd, flag);
> -	/*
> -	 *ov2722 PWDN# active high when pull down,opposite to the convention
> -	 */
> -	ret |= dev->platform_data->gpio1_ctrl(sd, !flag);
> +	ret |= dev->platform_data->gpio1_ctrl(sd, flag);
>  	return ret;
>  }
>  
> -- 
> 2.39.0
> 

-- 
With Best Regards,
Andy Shevchenko


