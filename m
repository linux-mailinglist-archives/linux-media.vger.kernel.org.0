Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77BEC3171E7
	for <lists+linux-media@lfdr.de>; Wed, 10 Feb 2021 22:05:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232735AbhBJVFC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Feb 2021 16:05:02 -0500
Received: from mga11.intel.com ([192.55.52.93]:45271 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232602AbhBJVFA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Feb 2021 16:05:00 -0500
IronPort-SDR: Do12InMSPhptCVHBXSWMUe4TxsfzpXfVcuT/wMDiVyCTCQhWNhy5NvdBVYqB/eyeNuhD9FboUf
 cHeppZ5bMQPg==
X-IronPort-AV: E=McAfee;i="6000,8403,9891"; a="178642631"
X-IronPort-AV: E=Sophos;i="5.81,169,1610438400"; 
   d="scan'208";a="178642631"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2021 13:03:08 -0800
IronPort-SDR: TRsLjxcExqvxBTIs/gaxWi3GsYIua5c2s2KCNNinaewD13f7bBzd9MxZrC858yxAqKhAqbOGSd
 PXk4IX9DMYcQ==
X-IronPort-AV: E=Sophos;i="5.81,169,1610438400"; 
   d="scan'208";a="361478356"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2021 13:03:05 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 5E4EC2011B;
        Wed, 10 Feb 2021 23:03:03 +0200 (EET)
Date:   Wed, 10 Feb 2021 23:03:03 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Colin King <colin.king@canonical.com>
Cc:     "Paul J . Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Martina Krasteva <martinax.krasteva@intel.com>,
        Gjorgji Rosikopulos <gjorgjix.rosikopulos@intel.com>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] media: i2c: imx334: Fix a read of the
 uninitialized variable ret
Message-ID: <20210210210303.GE3@paasikivi.fi.intel.com>
References: <20210210190752.146631-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210210190752.146631-1-colin.king@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Colin,

On Wed, Feb 10, 2021 at 07:07:52PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently there is a dev_err error message that is printing the
> error status in variable ret (that has not been set) instead of
> the correct error status from imx334->reset_gpio.  Fix this.
> 
> Addresses-Coverity: ("Uninitialized scalar variable")
> Fixes: 9746b11715c3 ("media: i2c: Add imx334 camera sensor driver")
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/media/i2c/imx334.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
> index 07e31bc2ef18..f8b1caf26c9b 100644
> --- a/drivers/media/i2c/imx334.c
> +++ b/drivers/media/i2c/imx334.c
> @@ -790,7 +790,8 @@ static int imx334_parse_hw_config(struct imx334 *imx334)
>  	imx334->reset_gpio = devm_gpiod_get_optional(imx334->dev, "reset",
>  						     GPIOD_OUT_LOW);
>  	if (IS_ERR(imx334->reset_gpio)) {
> -		dev_err(imx334->dev, "failed to get reset gpio %d", ret);
> +		dev_err(imx334->dev, "failed to get reset gpio %ld",
> +			IS_ERR_VALUE(imx334->reset_gpio));
>  		return PTR_ERR(imx334->reset_gpio);
>  	}

Thanks for the patch. This has been already addressed by another patch
here, and has just been applied to linux-media master.

commit c702e2f70275dbc5373aef50c450cf9c5730636c
Author: Hans Verkuil <hverkuil@xs4all.nl>
Date:   Mon Feb 8 12:32:29 2021 +0100

    media: imx334: 'ret' is uninitialized, should have been PTR_ERR()
    
    Fix this compiler warning:
    
    drivers/media/i2c/imx334.c: In function 'imx334_parse_hw_config':
    include/linux/dev_printk.h:112:2: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
      112 |  _dev_err(dev, dev_fmt(fmt), ##__VA_ARGS__)
          |  ^~~~~~~~
    drivers/media/i2c/imx334.c:783:6: note: 'ret' was declared here
      783 |  int ret;
          |      ^~~
    
    Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
    Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
    Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

-- 
Kind regards,

Sakari Ailus
