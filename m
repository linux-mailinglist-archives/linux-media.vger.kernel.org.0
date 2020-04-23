Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AA121B56C1
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2020 09:56:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726070AbgDWH4F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Apr 2020 03:56:05 -0400
Received: from mga04.intel.com ([192.55.52.120]:21960 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725562AbgDWH4E (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Apr 2020 03:56:04 -0400
IronPort-SDR: 9q1XsrS7ReNvW3PVd2iLaDYK+pyRmnRIQ7Zsm7z9YFVu0j0jrdDwo17T+VfARP2fgSyV/FgZtm
 TmySfglMIOeA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2020 00:56:04 -0700
IronPort-SDR: r+jLurLD/ryur1rbMtyce0xKOEJmXIaoqKT5V0T+RrNwOh9LVjOo744jmIAT0wOwTME4+gLANB
 0TwumWeKu/hg==
X-IronPort-AV: E=Sophos;i="5.73,306,1583222400"; 
   d="scan'208";a="430232630"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2020 00:56:00 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 9B42C2080B; Thu, 23 Apr 2020 10:55:57 +0300 (EEST)
Date:   Thu, 23 Apr 2020 10:55:57 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Roman Kovalivskyi <roman.kovalivskyi@globallogic.com>
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Luis Oliveira <lolivei@synopsys.com>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>, Jacopo Mondi <jacopo@jmondi.org>,
        Michael Rodin <mrodin@de.adit-jv.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Maxime Ripard <mripard@kernel.org>,
        Adam Ford <aford173@gmail.com>,
        Todor Tomov <todor.tomov@linaro.org>,
        Suresh Udipi <sudipi@jp.adit-jv.com>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>
Subject: Re: [PATCH 4/4] media: ov5647: Use gpiod_set_value_cansleep
Message-ID: <20200423075557.GL5381@paasikivi.fi.intel.com>
References: <cover.1586759968.git.roman.kovalivskyi@globallogic.com>
 <f496fe5d364748e9d625a634581a404f30a13efa.1586759968.git.roman.kovalivskyi@globallogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f496fe5d364748e9d625a634581a404f30a13efa.1586759968.git.roman.kovalivskyi@globallogic.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Roman,

On Mon, Apr 13, 2020 at 12:17:47PM +0300, Roman Kovalivskyi wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.org>
> 
> All calls to the gpio library are in contexts that can sleep,
> therefore there is no issue with having those GPIOs controlled
> by controllers which require sleeping (eg I2C GPIO expanders).
> 
> Switch to using gpiod_set_value_cansleep instead of gpiod_set_value
> to avoid triggering the warning in gpiolib should the GPIO
> controller need to sleep.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
> Signed-off-by: Roman Kovalivskyi <roman.kovalivskyi@globallogic.com>

This should be merged with the second patch.

> ---
>  drivers/media/i2c/ov5647.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> index 8a1a515388e0..07550377be2e 100644
> --- a/drivers/media/i2c/ov5647.c
> +++ b/drivers/media/i2c/ov5647.c
> @@ -373,7 +373,7 @@ static int ov5647_sensor_power(struct v4l2_subdev *sd, int on)
>  		dev_dbg(&client->dev, "OV5647 power on\n");
>  
>  		if (ov5647->pwdn) {
> -			gpiod_set_value(ov5647->pwdn, 0);
> +			gpiod_set_value_cansleep(ov5647->pwdn, 0);
>  			msleep(PWDN_ACTIVE_DELAY_MS);
>  		}
>  
> @@ -415,7 +415,7 @@ static int ov5647_sensor_power(struct v4l2_subdev *sd, int on)
>  
>  		clk_disable_unprepare(ov5647->xclk);
>  
> -		gpiod_set_value(ov5647->pwdn, 1);
> +		gpiod_set_value_cansleep(ov5647->pwdn, 1);
>  	}
>  
>  	/* Update the power count. */
> @@ -648,13 +648,13 @@ static int ov5647_probe(struct i2c_client *client)
>  		goto mutex_remove;
>  
>  	if (sensor->pwdn) {
> -		gpiod_set_value(sensor->pwdn, 0);
> +		gpiod_set_value_cansleep(sensor->pwdn, 0);
>  		msleep(PWDN_ACTIVE_DELAY_MS);
>  	}
>  
>  	ret = ov5647_detect(sd);
>  
> -	gpiod_set_value(sensor->pwdn, 1);
> +	gpiod_set_value_cansleep(sensor->pwdn, 1);
>  
>  	if (ret < 0)
>  		goto error;
> -- 
> 2.17.1
> 

-- 
Sakari Ailus
