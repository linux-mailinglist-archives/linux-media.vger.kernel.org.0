Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5952260DC03
	for <lists+linux-media@lfdr.de>; Wed, 26 Oct 2022 09:21:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232731AbiJZHV4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Oct 2022 03:21:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230134AbiJZHVz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Oct 2022 03:21:55 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C11338681
        for <linux-media@vger.kernel.org>; Wed, 26 Oct 2022 00:21:53 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dkxjnptf9d2bpn7gcmbty-3.rev.dnainternet.fi [IPv6:2001:14ba:44ce:b640:9d1d:82c5:eca2:5060])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 515171B00203;
        Wed, 26 Oct 2022 10:21:51 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1666768911;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=QGLSMhn6R0TKJBQoFnxwmLTm48g/MsAbAQ1sfnvkeiw=;
        b=fUGBE7PS96Wva1RtbxMYEOM/6HeYq7DSWvVZVZlkDDzZzcs2VTkqCuyBknMIYXvetHKD4I
        y00waHm1OZf3CE03tZ1AfO6R04KRM+yHondEyhUF6y+XBC1JGEdsys0vS3of324jN7C4la
        1K+npE/FAfUX1f76b1JCKqsQ8K5/JRPHm5bn3m9DCVrpjg94YWY3uJ65Z3uSLPKmGZonFK
        jkg/vyhsEs6Y2FSKrRrIN1BXl1I6LS0i9G6Tg/CcUuKRINnbgQMr+T1BYVKjExemm1pjSD
        ghNKaZKNH+xDibvY/XLqZoe2blqde7goYFY5bS3WD9WZbnSaeUSuy2DNsspqIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1666768911;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=QGLSMhn6R0TKJBQoFnxwmLTm48g/MsAbAQ1sfnvkeiw=;
        b=JgQCOabTPm/L8voNx+uUFu0F7fpQupXjnGgjCyEM2KLLTnt7SpqYNbBhfs5qPiZ+wOauEY
        7P6uUBzlvBo0i9d31H6AC5xwenMKUdDmO9uIewMOEUP2OmBf2mXTBn6tCg9Hd/wo9nW4YJ
        8WsESBVHYaH/HAd3O6lGouT2src2BB7bYefe6vUEqk9JYCayT4k/+N5iVkGSQLTWCfKr3J
        V6DoXAzEKtRctoxBHqc/cniWdqNXe5Ek1AQK7b+RUR7mq9iRCIpQQ/StzeoN/faO91i/7w
        lc9R31ME5eyDKY/W2BsfHYc7AVX4EpuaR6OdywwvbwxYhS9mc3gYMoU8B8HJRg==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1666768911; a=rsa-sha256;
        cv=none;
        b=iYmE02Cn04OBTvLBqBFk8ZSfiUitP3/Hg4H+5lw4ayESwT1wIfBdrt+OaItihiwe6/mnJs
        bFernlPCM0QvT0WPjtL5TaoLIwP+M+imMJ5BrWPKtqzEJIcJgT8eaFs/VrzHWq/GAMM92Y
        7ZFdgRI58Vvsc2PH83nnJHyWf5FyWp3mxGZ2hkXPipbQWC1IMkLLxCw941U814rhRURTva
        oMXqvM9Auf/XY+Hkqxsn3Jys0LgMGVuG7o1jpmYbiA8nEyiNTqo5J1J+sji4Z0yqzYEw8k
        fHBOHnJjxUChDN7j/IXB1+Fr65n39q+CiN1iezaBDdaj5vJPJP705LbfnGo/qw==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id D088D634DB0;
        Wed, 26 Oct 2022 10:21:50 +0300 (EEST)
Date:   Wed, 26 Oct 2022 10:21:50 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 08/16] media: i2c: ov9282: Add selection for CSI2 clock
 mode
Message-ID: <Y1jgDsmgXZYx0rZf@valkosipuli.retiisi.eu>
References: <20221005152809.3785786-1-dave.stevenson@raspberrypi.com>
 <20221005152809.3785786-9-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221005152809.3785786-9-dave.stevenson@raspberrypi.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

On Wed, Oct 05, 2022 at 04:28:01PM +0100, Dave Stevenson wrote:
> The sensor supports either having the CSI2 clock lane free
> running, or gated when there is no packet to transmit.
> The driver only selected gated (non-continuous) clock mode.
> 
> Add code to allow fwnode to configure whether the clock is
> gated or free running.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/media/i2c/ov9282.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index abb1223c0260..334b31af34a4 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -46,6 +46,9 @@
>  /* Group hold register */
>  #define OV9282_REG_HOLD		0x3308
>  
> +#define OV9282_REG_MIPI_CTRL00	0x4800
> +#define OV9282_GATED_CLOCK	BIT(5)
> +
>  /* Input clock rate */
>  #define OV9282_INCLK_RATE	24000000
>  
> @@ -138,6 +141,7 @@ struct ov9282 {
>  	struct clk *inclk;
>  	struct regulator_bulk_data supplies[OV9282_NUM_SUPPLIES];
>  	struct v4l2_ctrl_handler ctrl_handler;
> +	bool noncontinuous_clock;
>  	struct v4l2_ctrl *link_freq_ctrl;
>  	struct v4l2_ctrl *hblank_ctrl;
>  	struct v4l2_ctrl *vblank_ctrl;
> @@ -211,7 +215,6 @@ static const struct ov9282_reg common_regs[] = {
>  	{0x4601, 0x04},
>  	{0x470f, 0x00},
>  	{0x4f07, 0x00},
> -	{0x4800, 0x20},
>  	{0x5000, 0x9f},
>  	{0x5001, 0x00},
>  	{0x5e00, 0x00},
> @@ -684,6 +687,14 @@ static int ov9282_start_streaming(struct ov9282 *ov9282)
>  		return ret;
>  	}
>  
> +	ret = ov9282_write_reg(ov9282, OV9282_REG_MIPI_CTRL00, 1,
> +			       ov9282->noncontinuous_clock ?
> +					OV9282_GATED_CLOCK : 0);

Wouldn't this better fit for power on?

> +	if (ret) {
> +		dev_err(ov9282->dev, "fail to write MIPI_CTRL00");
> +		return ret;
> +	}
> +
>  	/* Write sensor mode registers */
>  	reg_list = &ov9282->cur_mode->reg_list;
>  	ret = ov9282_write_regs(ov9282, reg_list->regs, reg_list->num_of_regs);
> @@ -861,6 +872,9 @@ static int ov9282_parse_hw_config(struct ov9282 *ov9282)
>  	if (ret)
>  		return ret;
>  
> +	ov9282->noncontinuous_clock =
> +		bus_cfg.bus.mipi_csi2.flags & V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK;
> +
>  	if (bus_cfg.bus.mipi_csi2.num_data_lanes != OV9282_NUM_DATA_LANES) {
>  		dev_err(ov9282->dev,
>  			"number of CSI2 data lanes %d is not supported",

-- 
Kind regards,

Sakari Ailus
