Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CECB26869D
	for <lists+linux-media@lfdr.de>; Mon, 14 Sep 2020 09:56:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726135AbgINH4C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Sep 2020 03:56:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726046AbgINHzy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Sep 2020 03:55:54 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2132C06174A;
        Mon, 14 Sep 2020 00:55:53 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id c2so17754171ljj.12;
        Mon, 14 Sep 2020 00:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OLKPHbtOt8z8JIW1cBDEqkvkofIIPjEN7iRAGXlScGQ=;
        b=UNTubtzZLEL8oapWyD53tB8szukUP0AsmWl7SbBE//kxC0c5XMcjBS6sLBATSDVR0L
         IuE5QOsKg8Z7ySquYugpz11Rnpjcczw6WLt23YwjdbPhYhE+s8AtwAKd0lmVypuaKUAm
         WnDbCLuYROjkokJMWl5HQTzaEkHHorc236gPnmWlDu89LOHv4fdV47LNV35Eh/7MHzch
         GkB/RCzN7Df7uAt3kYFACzQ4EXUcvAGS9JkEOzpuYFOo+ClyR4eO8b2SWveMCzIPTS4t
         XSGpah8zxJIgzICSppIZO7ur7/HHngsoldfPVNV2D/LXWaQBtOVIiv05AjerqOXxiZ5N
         paKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=OLKPHbtOt8z8JIW1cBDEqkvkofIIPjEN7iRAGXlScGQ=;
        b=lAAWy+dWcKcACWSDGUafjQ3FVLOvcF9uEpKyMpvfcvjW1omlx74sKZz62Kwm+9wXKm
         ty9nWizsl8yukUQ+pbGH0nwWtfolZRoYE5zQrKwwortS04gq/7nJuXhnF9gHIlNYuQfu
         l9R1sJoX0i79vYWIVsqGAqGrI5gyJ1PYft8uN18XiAL5EaGISYfghcP1RWOOtImvP0Qy
         y4Y4jEH2rlEUBy0wGebqi5YcudIqGvmjmo7iiXd/Eogbm9dNh6OrsbrfNX04o7Ou4KNI
         6vtmygbQEJP0zZ1/yUxeVa6s2qZYnFwfsqH2/eQNhW/9lb/VvmpnNc2HYBFS9SDPEl91
         mlaQ==
X-Gm-Message-State: AOAM533EpOUyU2WbEOMAE/WioWA6lJpf0Wp7LUip66EUtHGUlzOQY/of
        1wzqPubIBtoRdDYH40N6a1f2i6OJ8gE7mw==
X-Google-Smtp-Source: ABdhPJw1Eycx1S/HY2dEZIfzRDk6BOovCZSHzkBaMT4r1idgXaFwjQ+i7sxIZUsbExhYOCgFKvCMjg==
X-Received: by 2002:a2e:92cd:: with SMTP id k13mr4455424ljh.138.1600070152066;
        Mon, 14 Sep 2020 00:55:52 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:239:d1e4:b56b:9cf2:d12e:444? ([2a00:1fa0:239:d1e4:b56b:9cf2:d12e:444])
        by smtp.gmail.com with ESMTPSA id h16sm3577107lfc.63.2020.09.14.00.55.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2020 00:55:51 -0700 (PDT)
Subject: Re: [PATCH v4 2/3] media: i2c: ov772x: Add support for BT656 mode
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
References: <20200913184247.618-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200913184247.618-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <bb9fcd11-21d9-1ce0-4247-a5f80d836da7@gmail.com>
Date:   Mon, 14 Sep 2020 10:55:48 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200913184247.618-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello!

On 13.09.2020 21:42, Lad Prabhakar wrote:

> Add support to read the bus-type for V4L2_MBUS_BT656 and
> enable BT656 mode in the sensor if needed.

    Isn't it called BT.656?

> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>   drivers/media/i2c/ov772x.c | 27 +++++++++++++++++++++------
>   1 file changed, 21 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov772x.c b/drivers/media/i2c/ov772x.c
> index 551082aa7026..edd7c4c22225 100644
> --- a/drivers/media/i2c/ov772x.c
> +++ b/drivers/media/i2c/ov772x.c
[...]
> @@ -1427,16 +1434,24 @@ static int ov772x_probe(struct i2c_client *client)
>   		goto error_clk_put;
>   	}
>   
> -	bus_cfg.bus_type = V4L2_MBUS_PARALLEL;
> +	bus_cfg = (struct v4l2_fwnode_endpoint)
> +		  { .bus_type = V4L2_MBUS_BT656 };
>   	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
>   	priv->bus_type = bus_cfg.bus_type;
>   	v4l2_fwnode_endpoint_free(&bus_cfg);
>   	if (ret) {
> -		/* For backward compatibility with the existing DT where
> -		 * bus-type isnt specified fallback to V4L2_MBUS_PARALLEL
> -		 */
> -		priv->bus_type = V4L2_MBUS_PARALLEL;
> -		dev_notice(&client->dev, "Falling back to V4L2_MBUS_PARALLEL mode\n");
> +		bus_cfg.bus_type = V4L2_MBUS_PARALLEL;
> +		ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
> +		priv->bus_type = bus_cfg.bus_type;
> +		v4l2_fwnode_endpoint_free(&bus_cfg);
> +		if (ret) {
> +			/* For backward compatibility with the existing DT where
> +			 * bus-type isnt specified fallback to V4L2_MBUS_PARALLEL
                                     ^^^^ isn't
    Could be fixed, while at it?

> +			 */
> +			priv->bus_type = V4L2_MBUS_PARALLEL;
> +			dev_notice(&client->dev,
> +				   "Falling back to V4L2_MBUS_PARALLEL mode\n");
> +		}
>   	}
>   
>   	ret = ov772x_video_probe(priv);

MBR, Sergei
