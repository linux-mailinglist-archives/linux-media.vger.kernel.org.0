Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 652145BCF01
	for <lists+linux-media@lfdr.de>; Mon, 19 Sep 2022 16:36:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbiISOgZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Sep 2022 10:36:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbiISOgY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Sep 2022 10:36:24 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F9452CE17
        for <linux-media@vger.kernel.org>; Mon, 19 Sep 2022 07:36:22 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BB5CB9BA;
        Mon, 19 Sep 2022 16:36:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1663598181;
        bh=MOGESb6yACH0/Smtn9/MYBWIxYx7GhYWr+3nA9WSELk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JmqzovvB0C6tuStJqRhTOEpAu/K/SyF979RbOhcPFE22jI5BQgw0UtB7XUHR4okDw
         3wlm9RE/9SHj5C9VrI1HPju0YAB4dbKz7aSiuSB7t4nt7R5dTTzW1QAH6HJkSjbEea
         6hcJDFdT0PWfT1XyvNH89GxjN2Kqxl9qnB3WUru8=
Date:   Mon, 19 Sep 2022 17:36:07 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, pavel@ucw.cz,
        sakari.ailus@linux.intel.com, sean@mess.org
Subject: Re: [PATCH -next 12/13] media: rc: ir-rx51: Switch to use
 dev_err_probe() helper
Message-ID: <Yyh+V5HZ+U2/XlF4@pendragon.ideasonboard.com>
References: <20220915150324.688062-1-yangyingliang@huawei.com>
 <20220915150324.688062-13-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220915150324.688062-13-yangyingliang@huawei.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Yang,

Thank you for the patch.

On Thu, Sep 15, 2022 at 11:03:23PM +0800, Yang Yingliang wrote:
> In the probe path, dev_err() can be replace with dev_err_probe()
> which will check if error code is -EPROBE_DEFER.
> 
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/rc/ir-rx51.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/rc/ir-rx51.c b/drivers/media/rc/ir-rx51.c
> index a3b145183260..85080c3d2053 100644
> --- a/drivers/media/rc/ir-rx51.c
> +++ b/drivers/media/rc/ir-rx51.c
> @@ -231,13 +231,8 @@ static int ir_rx51_probe(struct platform_device *dev)
>  	struct rc_dev *rcdev;
>  
>  	pwm = pwm_get(&dev->dev, NULL);
> -	if (IS_ERR(pwm)) {
> -		int err = PTR_ERR(pwm);
> -
> -		if (err != -EPROBE_DEFER)
> -			dev_err(&dev->dev, "pwm_get failed: %d\n", err);
> -		return err;
> -	}
> +	if (IS_ERR(pwm))
> +		return dev_err_probe(&dev->dev, PTR_ERR(pwm), "pwm_get failed\n");
>  
>  	/* Use default, in case userspace does not set the carrier */
>  	ir_rx51.freq = DIV_ROUND_CLOSEST_ULL(pwm_get_period(pwm), NSEC_PER_SEC);

-- 
Regards,

Laurent Pinchart
