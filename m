Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 119D45BA209
	for <lists+linux-media@lfdr.de>; Thu, 15 Sep 2022 22:54:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbiIOUyt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Sep 2022 16:54:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbiIOUyr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Sep 2022 16:54:47 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD455BCB7
        for <linux-media@vger.kernel.org>; Thu, 15 Sep 2022 13:54:45 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (89-27-103-169.bb.dnainternet.fi [89.27.103.169])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id EDEE02031D;
        Thu, 15 Sep 2022 23:54:41 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1663275282;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=evwqLK5ReUdOPl05YVbPJdKWA7Gky4wUlQsq2eynLlU=;
        b=LJM2fesKk3jw3yA4mhx9LNaUN/Y/blgOkf9dQtDK7V7HOWaQgHEwPAvzd92rceOtoZRGJj
        VLLu2Bjz3xlWyciBUORyN7G1AI+CUCkWONbg6NLdgiU6t7VYWjemym+0BEqulm3Hv0NVm8
        eiNkRTvQHCj3CDDRgUwYNbsY3G3rkvU=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 6A837634C91;
        Thu, 15 Sep 2022 23:54:41 +0300 (EEST)
Date:   Thu, 15 Sep 2022 23:54:41 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     jacopo@jmondi.org, paul.j.murphy@intel.com,
        daniele.alessandrelli@intel.com, mchehab@kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v3 3/5] media: i2c: imx412: Assign v4l2 device subname
 based on compat string
Message-ID: <YyOREQf7d4mcCF9H@valkosipuli.retiisi.eu>
References: <20220915003522.1227073-1-bryan.odonoghue@linaro.org>
 <20220915003522.1227073-4-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220915003522.1227073-4-bryan.odonoghue@linaro.org>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1663275282; a=rsa-sha256; cv=none;
        b=opzDPrO+LSr9bPxceRHBy5zj2eTX2mZkTWllQW1nhLCRw+NKsq6aae1RLgvyZw4j3o3q7y
        9o1ennsGfPGS0ol0tAzp4XVpXJ8Il3RKQgS5HouOUc22wkjfjv0+LpaozGrFCcz3BP9iAB
        Imkq+xSNeLDmRkJMNx/399m48vJCnOU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1663275282;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=evwqLK5ReUdOPl05YVbPJdKWA7Gky4wUlQsq2eynLlU=;
        b=QqZwd0RY6fDHkMOJngqEvdODbuCTy2IddhnsKDrtpr0DmvUtzHvrc+SLQBMkXJe3pWnh0S
        Zb0THLroAZYR9wpnkAsC4WLwuFnxxvClWKRm4pxX+FwyE4W+kqToav1BxYVwo6RK7Wnxyj
        EMJuP3jYuMvA9rg/KB7J01CCUOkV6fw=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bryan,

Thanks for the update.

On Thu, Sep 15, 2022 at 01:35:20AM +0100, Bryan O'Donoghue wrote:
> imx412, imx477 and imx577 all return the same chip-id when interrogated via
> i2c. I've confirmed this myself by
> 
> - Looking at the code in Qcom and Nvidia stacks
> - Running the upstream imx412 driver on imx577 with a Qcom sm8250 RB5
> - Running the downstream Qcom stack on the same hardware. This uses a
>   commercial licensed stack with a driver/userspace pair that make no
>   differentiation between imx412, imx477 and imx577.
> - Running the imx412 and imx577 on a Nvidia Nano with cameras from Leopard
>   Imaging. Again this is a commercial non-upstream user-space/kernel-space
>   pairing and again the same imx driver, works for both parts.
> 
> Sakari suggested we should add a new compat but that the compat string
> should also set the media entity name also
> 
> https://patchwork.kernel.org/project/linux-media/patch/20220607134057.2427663-3-bryan.odonoghue@linaro.org/#24894500
> 
> Set up the .data parameter of of_device_id to pass a string which
> we use to set the media entity name. Once done we can add in imx477 and
> imx577 as compatible chips with the media names reflecting the directed
> compat string.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/i2c/imx412.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
> index a1394d6c1432..bc7fdb24235f 100644
> --- a/drivers/media/i2c/imx412.c
> +++ b/drivers/media/i2c/imx412.c
> @@ -1172,6 +1172,7 @@ static int imx412_init_controls(struct imx412 *imx412)
>  static int imx412_probe(struct i2c_client *client)
>  {
>  	struct imx412 *imx412;
> +	const char *name;
>  	int ret;
>  
>  	imx412 = devm_kzalloc(&client->dev, sizeof(*imx412), GFP_KERNEL);
> @@ -1179,6 +1180,10 @@ static int imx412_probe(struct i2c_client *client)
>  		return -ENOMEM;
>  
>  	imx412->dev = &client->dev;
> +	if (dev_fwnode(&client->dev))
> +		name = device_get_match_data(&client->dev);

No need to make this conditional.

But you could return an error if name is NULL. It would most probably mean
a driver bug though.

> +	else
> +		return -ENODEV;
>  
>  	/* Initialize subdev */
>  	v4l2_i2c_subdev_init(&imx412->sd, client, &imx412_subdev_ops);
> @@ -1218,6 +1223,8 @@ static int imx412_probe(struct i2c_client *client)
>  	imx412->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
>  	imx412->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
>  
> +	v4l2_i2c_subdev_set_name(&imx412->sd, client, name, NULL);
> +
>  	/* Initialize source pad */
>  	imx412->pad.flags = MEDIA_PAD_FL_SOURCE;
>  	ret = media_entity_pads_init(&imx412->sd.entity, 1, &imx412->pad);
> @@ -1281,7 +1288,7 @@ static const struct dev_pm_ops imx412_pm_ops = {
>  };
>  
>  static const struct of_device_id imx412_of_match[] = {
> -	{ .compatible = "sony,imx412" },
> +	{ .compatible = "sony,imx412", .data = "imx412" },
>  	{ }
>  };
>  

-- 
Kind regards,

Sakari Ailus
