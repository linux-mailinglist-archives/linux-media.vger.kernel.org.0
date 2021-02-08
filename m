Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C5143131E1
	for <lists+linux-media@lfdr.de>; Mon,  8 Feb 2021 13:12:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229983AbhBHMLt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Feb 2021 07:11:49 -0500
Received: from mga18.intel.com ([134.134.136.126]:8099 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230012AbhBHMKX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 8 Feb 2021 07:10:23 -0500
IronPort-SDR: 7GaMTY3450s9AXMtjekWoi02rP23KuuiRjh2DKrGVQu8mcF+6Y3/Ybheww3bVCHxFtejOw7JHJ
 xu7vc4c8acug==
X-IronPort-AV: E=McAfee;i="6000,8403,9888"; a="169383253"
X-IronPort-AV: E=Sophos;i="5.81,161,1610438400"; 
   d="scan'208";a="169383253"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2021 04:08:34 -0800
IronPort-SDR: D42qDcLZlom31NbLcmgyd73o5EU55AHnqFEBpkIWxc17bdE21tGieehUL0l48Qo147REL7Zsx9
 1f+MVWlSV7GA==
X-IronPort-AV: E=Sophos;i="5.81,161,1610438400"; 
   d="scan'208";a="358761446"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2021 04:08:33 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id E8C1E2082C; Mon,  8 Feb 2021 14:08:30 +0200 (EET)
Date:   Mon, 8 Feb 2021 14:08:30 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Martina Krasteva <martinax.krasteva@linux.intel.com>
Subject: Re: [PATCH] imx334: 'ret' is uninitialized, should have been
 PTR_ERR()
Message-ID: <20210208120830.GT32460@paasikivi.fi.intel.com>
References: <917ccfef-b93e-4d90-0b5a-4974145ab187@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <917ccfef-b93e-4d90-0b5a-4974145ab187@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Mon, Feb 08, 2021 at 12:32:29PM +0100, Hans Verkuil wrote:
> Fix this compiler warning:
> 
> drivers/media/i2c/imx334.c: In function 'imx334_parse_hw_config':
> include/linux/dev_printk.h:112:2: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
>   112 |  _dev_err(dev, dev_fmt(fmt), ##__VA_ARGS__)
>       |  ^~~~~~~~
> drivers/media/i2c/imx334.c:783:6: note: 'ret' was declared here
>   783 |  int ret;
>       |      ^~~
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/media/i2c/imx334.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
> index 07e31bc2ef18..ad530f0d338a 100644
> --- a/drivers/media/i2c/imx334.c
> +++ b/drivers/media/i2c/imx334.c
> @@ -790,7 +790,8 @@ static int imx334_parse_hw_config(struct imx334 *imx334)
>  	imx334->reset_gpio = devm_gpiod_get_optional(imx334->dev, "reset",
>  						     GPIOD_OUT_LOW);
>  	if (IS_ERR(imx334->reset_gpio)) {
> -		dev_err(imx334->dev, "failed to get reset gpio %d", ret);
> +		dev_err(imx334->dev, "failed to get reset gpio %ld",
> +			PTR_ERR(imx334->reset_gpio));
>  		return PTR_ERR(imx334->reset_gpio);
>  	}
> 

Thanks for the patch.

Feel free to merge this through your tree if you think you'll have other
fixes. In that case,

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

I can also pick it if you like.

-- 
Regards,

Sakari Ailus
