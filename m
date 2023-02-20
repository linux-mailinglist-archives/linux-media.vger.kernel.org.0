Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6163B69CF99
	for <lists+linux-media@lfdr.de>; Mon, 20 Feb 2023 15:43:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232184AbjBTOn4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Feb 2023 09:43:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231848AbjBTOnz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Feb 2023 09:43:55 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6084F15543
        for <linux-media@vger.kernel.org>; Mon, 20 Feb 2023 06:43:53 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id cy6so118326edb.5
        for <linux-media@vger.kernel.org>; Mon, 20 Feb 2023 06:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iKijfuj2j1S0TLmPw43C0OdgdeZjWXd42ORnI16fjGo=;
        b=QfljmbPiQuomrYBdPu2jJ1IJiffHZOZYYjwOSknZa/Gt2vxRbP5WoJmcvjkkpFpIjP
         X5WRI3PwHQVIXi8uzRBJu08NCzpEZhX6g0yLv0iFikyOeznfITvOIbsI+duMEU419Gdf
         BIlwOShi6CtC9KaRE+vtqhWse6gm9TXoN3ZNX67XWjfzf3t2bDWipuBWdZe/lD/Yu19d
         fXD1jN/HYK7RcDLYdjLqiX/qBW17IR8LvUeHixAmHLyxeCp6Rn6ekqT+Kxd/y6Q+N4Ek
         ZiA/1xohrWPgFU899mbgApCMPmmpwAqPytxFsAk0YOri5OS2CgbUBp9hGk7hlsdyMQxB
         pRHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iKijfuj2j1S0TLmPw43C0OdgdeZjWXd42ORnI16fjGo=;
        b=yV0eR1c5tVH7+wCFwFnQ71ZhkCSeyxZm/uZcrmyXCGVH6ghMXlbdUHRXDIXzFjSq6+
         4jLjDdAx2JEMbR/9YJUGFQvkzAcf4aDotqXJpt+YQjI2ipRe/oCqWnDYRSCnCDB1xppj
         nXtqPw6wA9SJn7e1OXcM4cf5W21jqgN8ixUjSv5esbRpUtDcuVOsaMF3aMXkRkQWQhhc
         fjAPGCHATfDIsIfQoWSm4wZlzRSXBTOyRwzwMhmsvEBYhh60YH0+sI48Gr2IAtVq4iKY
         s6SSPSIYaG+ylGIQZev8z5oKzVbEuRb89Ub6tSp3C8smk8YznUruJ49ieltn6Y8L2gD+
         1OhQ==
X-Gm-Message-State: AO0yUKVNNNS4GNKM1vkUMp3FNVv1XKlKwWCVzx3v/tgYkYTxCaCVjNiy
        6QqNXUgj8gaELQk9XK2+R6I=
X-Google-Smtp-Source: AK7set97XRihPnRU+OgpPvNzrqfBnK1+NGjgFI0e9E8ZHwuRna1pgbI3nT/HqhtV/cHyYimzDJGDkQ==
X-Received: by 2002:a05:6402:c8:b0:4ac:bbdb:462a with SMTP id i8-20020a05640200c800b004acbbdb462amr2172145edu.14.1676904231576;
        Mon, 20 Feb 2023 06:43:51 -0800 (PST)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation (net-188-217-56-131.cust.vodafonedsl.it. [188.217.56.131])
        by smtp.gmail.com with ESMTPSA id f29-20020a50a6dd000000b004ad6e3e4a26sm1830963edc.84.2023.02.20.06.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 06:43:51 -0800 (PST)
Date:   Mon, 20 Feb 2023 15:43:49 +0100
From:   Tommaso Merciai <tomm.merciai@gmail.com>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     Mikhail Rudenko <mike.rudenko@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 2/2] media: i2c: ov5647: Use bus-locked i2c_transfer()
Message-ID: <Y/OHJb3sSJsRtIj8@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
References: <20230219180334.980950-1-jacopo.mondi@ideasonboard.com>
 <20230220124101.1010317-1-jacopo.mondi@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230220124101.1010317-1-jacopo.mondi@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Mon, Feb 20, 2023 at 01:41:01PM +0100, Jacopo Mondi wrote:
> The ov5647_read() functions calls i2c_master_send() and
> i2c_master_read() in sequence. However this leaves space for other
> clients to contend the bus and insert a unrelated transaction in between
> the two calls.
> 
> Replace the two calls with a single i2c_transfer() one, that locks the
> bus in between the transactions.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/media/i2c/ov5647.c | 24 +++++++++++++++---------
>  1 file changed, 15 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> index 0b88ac6dee41..a423ee8fe20c 100644
> --- a/drivers/media/i2c/ov5647.c
> +++ b/drivers/media/i2c/ov5647.c
> @@ -631,23 +631,29 @@ static int ov5647_write(struct v4l2_subdev *sd, u16 reg, u8 val)
> 
>  static int ov5647_read(struct v4l2_subdev *sd, u16 reg, u8 *val)
>  {
> -	unsigned char data_w[2] = { reg >> 8, reg & 0xff };
>  	struct i2c_client *client = v4l2_get_subdevdata(sd);
> +	u8 buf[2] = { reg >> 8, reg & 0xff };
> +	struct i2c_msg msg[2];
>  	int ret;
> 
> -	ret = i2c_master_send(client, data_w, 2);
> +	msg[0].addr = client->addr;
> +	msg[0].flags = client->flags;
> +	msg[0].buf = buf;
> +	msg[0].len = sizeof(buf);
> +
> +	msg[1].addr = client->addr;
> +	msg[1].flags = client->flags | I2C_M_RD;
> +	msg[1].buf = buf;
> +	msg[1].len = 1;
> +
> +	ret = i2c_transfer(client->adapter, msg, 2);
>  	if (ret < 0) {
> -		dev_dbg(&client->dev, "%s: i2c write error, reg: %x\n",
> +		dev_err(&client->dev, "%s: i2c read error, reg: %x\n",
>  			__func__, reg);
>  		return ret;
>  	}
> 
> -	ret = i2c_master_recv(client, val, 1);
> -	if (ret < 0) {
> -		dev_dbg(&client->dev, "%s: i2c read error, reg: %x\n",
> -				__func__, reg);
> -		return ret;
> -	}
> +	*val = buf[0];
> 
>  	return 0;
>  }
> --
> 2.39.0
> 

Fully agree.
Reviewed-by: Tommaso Merciai <tomm.merciai@gmail.com>

Thanks,
Tommaso


