Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43E832EAB56
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 14:01:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729694AbhAENAa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 08:00:30 -0500
Received: from mga12.intel.com ([192.55.52.136]:60338 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727524AbhAENA3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 Jan 2021 08:00:29 -0500
IronPort-SDR: bICjH5i68eVLn38AHziT3cRV1aniqVl6/UbYlq5SRAgaW45G5JkZuY0L/JRpCqIZ8h37U463Ey
 b1c3WQb11bQA==
X-IronPort-AV: E=McAfee;i="6000,8403,9854"; a="156293975"
X-IronPort-AV: E=Sophos;i="5.78,476,1599548400"; 
   d="scan'208";a="156293975"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2021 04:58:44 -0800
IronPort-SDR: exPky2lEHu5+iUuOLfjXZ+fqO5wRrh67x/0HSBaQL+2MW6nT7yXJutUQGP3NqM/2YCYpwZsCev
 xP+i2SngoaXQ==
X-IronPort-AV: E=Sophos;i="5.78,476,1599548400"; 
   d="scan'208";a="395255933"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2021 04:58:43 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id D4FF9206FD; Tue,  5 Jan 2021 14:58:10 +0200 (EET)
Date:   Tue, 5 Jan 2021 14:58:10 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH] media: i2c: ov5648/ov8865: Minor cosmetic fixes
Message-ID: <20210105125810.GQ11878@paasikivi.fi.intel.com>
References: <20210105093803.5247-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210105093803.5247-1-paul.kocialkowski@bootlin.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Paul,

Thanks for the patch.

On Tue, Jan 05, 2021 at 10:38:03AM +0100, Paul Kocialkowski wrote:
> This solves a few minor cosmetic issues picked up by checkpatch for
> the OV5648 and OV8865 drivers.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  drivers/media/i2c/ov5648.c | 2 +-
>  drivers/media/i2c/ov8865.c | 7 +++----
>  2 files changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5648.c b/drivers/media/i2c/ov5648.c
> index 609aa67b54ce..752a2e035c49 100644
> --- a/drivers/media/i2c/ov5648.c
> +++ b/drivers/media/i2c/ov5648.c
> @@ -496,7 +496,7 @@
>  	container_of(s, struct ov5648_sensor, subdev)
>  
>  #define ov5648_ctrl_subdev(c) \
> -	(&container_of(c->handler, struct ov5648_sensor, ctrls.handler)->subdev)
> +	(&container_of((c)->handler, struct ov5648_sensor, ctrls.handler)->subdev)

Over 80; please wrap.

>  
>  /* Data structures */
>  
> diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
> index fda5a55979aa..704d75b601e3 100644
> --- a/drivers/media/i2c/ov8865.c
> +++ b/drivers/media/i2c/ov8865.c
> @@ -223,7 +223,6 @@
>  #define OV8865_FORMAT2_FLIP_HORZ_SENSOR_EN	BIT(1)
>  #define OV8865_FORMAT2_SYNC_HBIN_EN		BIT(0)
>  
> -
>  #define OV8865_INC_Y_ODD_REG			0x382a
>  #define OV8865_INC_Y_ODD(v)			((v) & GENMASK(4, 0))
>  #define OV8865_INC_Y_EVEN_REG			0x382b
> @@ -460,7 +459,7 @@
>  	container_of(s, struct ov8865_sensor, subdev)
>  
>  #define ov8865_ctrl_subdev(c) \
> -	(&container_of(c->handler, struct ov8865_sensor, ctrls.handler)->subdev)
> +	(&container_of((c)->handler, struct ov8865_sensor, ctrls.handler)->subdev)

Ditto.

>  
>  /* Data structures */
>  
> @@ -1598,8 +1597,8 @@ static int ov8865_mode_pll1_configure(struct ov8865_sensor *sensor,
>  		return ret;
>  
>  	ret = ov8865_update_bits(sensor, OV8865_PCLK_SEL_REG,
> -			   OV8865_PCLK_SEL_PCLK_DIV_MASK,
> -			   OV8865_PCLK_SEL_PCLK_DIV(config->pclk_div));
> +				 OV8865_PCLK_SEL_PCLK_DIV_MASK,
> +				 OV8865_PCLK_SEL_PCLK_DIV(config->pclk_div));
>  	if (ret)
>  		return ret;
>  
> -- 
> 2.29.2
> 

-- 
Sakari Ailus
