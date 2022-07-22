Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6161857E283
	for <lists+linux-media@lfdr.de>; Fri, 22 Jul 2022 15:46:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235211AbiGVNqH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Jul 2022 09:46:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235156AbiGVNqG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Jul 2022 09:46:06 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 788A85D0E7;
        Fri, 22 Jul 2022 06:46:05 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dkwl20tj04snw15cjtflt-3.rev.dnainternet.fi [IPv6:2001:14ba:4493:6f40:fec3:d72a:e447:8113])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 1E3FF1B00027;
        Fri, 22 Jul 2022 16:46:02 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1658497562;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=JltLyLDfTY6UaGSagwl0LhSEJZzZ7879PoXeKZFbAgw=;
        b=RT2wvTgf0HUAqyFkpdosiQM6mlNv7VgXaOzMtmcSxfKEaEW7x5ds6hL9NOQRJzj+Xp5LbG
        4otY7sUMx2zLHfu4pXZmvYs1SEePZ7G3+GG/6HDUdqKEbOXA6Zy5yekBP+GgRy+mWi5c94
        FY+nfqtp+jFO59mR1AuoYk5CNRzBAoN6gwjI4BfU+xpNK+4UJkfYsUh2ZLknRrsLPQoSpQ
        z4QBZT+FpnKAPbacetq3FXsLIDvRJggq5q9G/VoL/fSquAhlUoFtqUO0azsPx3fu7dkGXZ
        4lWn9XbK5qENanEtJX9nKvDVTu00V/6gokiztog46QTaSZgtXO4qgJJKNRb1/g==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 9E9C7634C95;
        Fri, 22 Jul 2022 16:46:01 +0300 (EEST)
Date:   Fri, 22 Jul 2022 16:46:01 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     "Paul J . Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 7/7] media: i2c: ov9282: Add regmap support
Message-ID: <YtqqGcVm79oTBi5L@valkosipuli.retiisi.eu>
References: <20220722131947.2456988-1-alexander.stein@ew.tq-group.com>
 <20220722131947.2456988-8-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220722131947.2456988-8-alexander.stein@ew.tq-group.com>
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1658497562; a=rsa-sha256;
        cv=none;
        b=LtJKWBjPAbyfWB4IO61SVDnypjTkWfO5V3e8aNFBgjO1LCH/brM2hk+Qi0KwX92UXwFpth
        bGb+8K1X7wYc0aD9rrr0VNTmoNrt1RU+PV/AQh2Yl52JG8NAIResMz8aUnlyEa+PKUdYaV
        ZNf/SfbkwIE8/J2eZePL2sEJLmsgRF3UMRG3FSXlm6bJFxJQum1w3o6JYCY1vMMM5cI2Db
        Bw7Q+aQpRoe4XxqwM84PH7B/U715c1y0M3XQsWWsHGrfIdre829LBg+TYcZJzoDzjUT8Qv
        n1TY7epriU2IGOocSDx1hlFbzldkd+4hJMBsDy+ZYmCnOVy2SiPQg9m9m6LUpw==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1658497562;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=JltLyLDfTY6UaGSagwl0LhSEJZzZ7879PoXeKZFbAgw=;
        b=tnRcW3P3zQH8+y8hqLHpFmpOrnLPX8Qwdqx9veuWlwnjg/EZk1ajAvZdOmcvhHKOISxXi1
        c+PrW8uP77yikBhe3y/W6CcrvvpSttbixlAvI7KucGTDV8ZEn5ZIs9ZZkZEbmb04urXnRN
        JOHMux66i9ATCZe0j/ELufadrNypKvI73Ao8dTq8Fcx9euiI+wTvjP6IbwSqzZSFetAJ05
        Q59vGEOO2158/6SiQ5bv/lwnyDOZcVaLaZnDS7aHnMbuRg0crwvZGVA2d1Z1gp1McXo1Nt
        zCtHvhk6B4tJDKbgJQauEc++1ps53NqBShE+qYA31ll9xe2DGJqkElpa1zkDXA==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexander,

Thanks for the update.

On Fri, Jul 22, 2022 at 03:19:47PM +0200, Alexander Stein wrote:
> Register values apparently are stored in MSB format, hence the manual
> swap when reading/writing.
> regmap's endianness swapping is not applied when reading with val_bits = 8.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  drivers/media/i2c/ov9282.c | 59 +++++++++++++++++++-------------------
>  1 file changed, 30 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index dbc0a4cd060f..d8eb71245aae 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -10,6 +10,7 @@
>  #include <linux/delay.h>
>  #include <linux/i2c.h>
>  #include <linux/module.h>
> +#include <linux/regmap.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/regulator/consumer.h>
>  
> @@ -113,6 +114,7 @@ struct ov9282_mode {
>  /**
>   * struct ov9282 - ov9282 sensor device structure
>   * @dev: Pointer to generic device
> + * @regmap: sensor's regmap
>   * @sd: V4L2 sub-device
>   * @pad: Media pad. Only one pad supported
>   * @reset_gpio: Sensor reset gpio
> @@ -131,6 +133,7 @@ struct ov9282_mode {
>   */
>  struct ov9282 {
>  	struct device *dev;
> +	struct regmap *regmap;
>  	struct v4l2_subdev sd;
>  	struct media_pad pad;
>  	struct gpio_desc *reset_gpio;
> @@ -151,6 +154,11 @@ struct ov9282 {
>  	bool streaming;
>  };
>  
> +static const struct regmap_config ov9282_regmap_config = {
> +	.reg_bits = 16,
> +	.val_bits = 8,
> +};
> +
>  static const s64 link_freq[] = {
>  	OV9282_LINK_FREQ,
>  };
> @@ -297,35 +305,20 @@ static inline struct ov9282 *to_ov9282(struct v4l2_subdev *subdev)
>   */
>  static int ov9282_read_reg(struct ov9282 *ov9282, u16 reg, u32 len, u32 *val)
>  {
> -	struct i2c_client *client = v4l2_get_subdevdata(&ov9282->sd);
> -	struct i2c_msg msgs[2] = {0};
> -	u8 addr_buf[2] = {0};
> -	u8 data_buf[4] = {0};
> +	u8 data[4] = {0, 0, 0, 0};

You'll just need to initialise one of the array entries. I.e. this should
be { 0 }.

>  	int ret;
>  
>  	if (WARN_ON(len > 4))
>  		return -EINVAL;
>  
> -	put_unaligned_be16(reg, addr_buf);
> -
> -	/* Write register address */
> -	msgs[0].addr = client->addr;
> -	msgs[0].flags = 0;
> -	msgs[0].len = ARRAY_SIZE(addr_buf);
> -	msgs[0].buf = addr_buf;
> -
> -	/* Read data from register */
> -	msgs[1].addr = client->addr;
> -	msgs[1].flags = I2C_M_RD;
> -	msgs[1].len = len;
> -	msgs[1].buf = &data_buf[4 - len];
> -
> -	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
> -	if (ret != ARRAY_SIZE(msgs))
> -		return -EIO;
> -
> -	*val = get_unaligned_be32(data_buf);
> +	ret = regmap_raw_read(ov9282->regmap, reg, &data[4 - len], len);
> +	if (ret < 0) {
> +		dev_err(ov9282->dev, "read from 0x%04x failed: %d\n",
> +			reg, ret);
> +		return ret;
> +	}
>  
> +	*val = get_unaligned_be32(data);
>  	return 0;
>  }
>  
> @@ -340,16 +333,19 @@ static int ov9282_read_reg(struct ov9282 *ov9282, u16 reg, u32 len, u32 *val)
>   */
>  static int ov9282_write_reg(struct ov9282 *ov9282, u16 reg, u32 len, u32 val)
>  {
> -	struct i2c_client *client = v4l2_get_subdevdata(&ov9282->sd);
> -	u8 buf[6] = {0};
> +	u8 data[4] = {0, 0, 0, 0};

Ditto.

> +	int ret;
>  
>  	if (WARN_ON(len > 4))
>  		return -EINVAL;
>  
> -	put_unaligned_be16(reg, buf);
> -	put_unaligned_be32(val << (8 * (4 - len)), buf + 2);
> -	if (i2c_master_send(client, buf, len + 2) != len + 2)
> -		return -EIO;
> +	put_unaligned_be32(val << (8 * (4 - len)), data);
> +
> +	ret = regmap_raw_write(ov9282->regmap, reg, data, len);
> +	if (ret < 0) {
> +		dev_err(ov9282->dev, "write to 0x%04x failed: %d\n",
> +			reg, ret);

Fits on one line.

> +	}
>  
>  	return 0;
>  }
> @@ -1044,6 +1040,11 @@ static int ov9282_probe(struct i2c_client *client)
>  		return -ENOMEM;
>  
>  	ov9282->dev = &client->dev;
> +	ov9282->regmap = devm_regmap_init_i2c(client, &ov9282_regmap_config);
> +	if (IS_ERR(ov9282->regmap)) {
> +		dev_err(ov9282->dev, "Unable to initialize I2C\n");
> +		return -ENODEV;
> +	}
>  
>  	/* Initialize subdev */
>  	v4l2_i2c_subdev_init(&ov9282->sd, client, &ov9282_subdev_ops);

-- 
Sakari Ailus
