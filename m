Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C40E669EB42
	for <lists+linux-media@lfdr.de>; Wed, 22 Feb 2023 00:29:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230083AbjBUX3J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Feb 2023 18:29:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229688AbjBUX3I (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Feb 2023 18:29:08 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03EA126CFE
        for <linux-media@vger.kernel.org>; Tue, 21 Feb 2023 15:29:08 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 402822B3;
        Wed, 22 Feb 2023 00:29:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1677022146;
        bh=4GuG0FvxRU5q9lmNSt/fNQGESf/AXtkYtAL+IfgbeQI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XJ35Qd7X33RBj31iBV1PLQ9wJQMukrBPaDiM8kHT7foniTBSTYplleZyDnc6QyQ9C
         1GqMCm/KBifNFdNPs7Zj0RpNweOB+00713X7HcYLaoXgXdqD6luGOX3wYISSewDzZD
         28LAd+nacI1Sr5ndY+0iMOw8o2Mt09D1tSwJ1rLw=
Date:   Wed, 22 Feb 2023 01:29:04 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     Mikhail Rudenko <mike.rudenko@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org,
        Tommaso Merciai <tomm.merciai@gmail.com>
Subject: Re: [PATCH v2 2/2] media: i2c: ov5647: Use bus-locked i2c_transfer()
Message-ID: <Y/VTwBOSTX9WrJMz@pendragon.ideasonboard.com>
References: <20230221171048.203042-1-jacopo.mondi@ideasonboard.com>
 <20230221171048.203042-3-jacopo.mondi@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230221171048.203042-3-jacopo.mondi@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Feb 21, 2023 at 06:10:48PM +0100, Jacopo Mondi wrote:
> The ov5647_read() functions calls i2c_master_send() and
> i2c_master_read() in sequence. However this leaves space for other
> clients to contend the bus and insert an unrelated transaction in between
> the two calls.
> 
> Replace the two calls with a single i2c_transfer() one, that locks the
> bus in between the transactions.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Reviewed-by: Tommaso Merciai <tomm.merciai@gmail.com>
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Actually, small change of e-mail address:

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/i2c/ov5647.c | 30 ++++++++++++++++++------------
>  1 file changed, 18 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> index bde287e00c87..ca7079bb7589 100644
> --- a/drivers/media/i2c/ov5647.c
> +++ b/drivers/media/i2c/ov5647.c
> @@ -629,23 +629,29 @@ static int ov5647_write(struct v4l2_subdev *sd, u16 reg, u8 val)
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
> -	if (ret < 0) {
> -		dev_dbg(&client->dev, "%s: i2c write error, reg: %x\n",
> -			__func__, reg);
> -		return ret;
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
> +	if (ret != 2) {
> +		dev_err(&client->dev, "%s: i2c read error, reg: %x = %d\n",
> +			__func__, reg, ret);
> +		return ret >= 0 ? -EINVAL : ret;
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

-- 
Regards,

Laurent Pinchart
