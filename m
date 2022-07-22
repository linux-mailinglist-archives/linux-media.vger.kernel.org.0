Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3529057E290
	for <lists+linux-media@lfdr.de>; Fri, 22 Jul 2022 15:50:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231603AbiGVNug (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Jul 2022 09:50:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229605AbiGVNuf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Jul 2022 09:50:35 -0400
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AEE123163;
        Fri, 22 Jul 2022 06:50:34 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (89-27-103-169.bb.dnainternet.fi [89.27.103.169])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 0C460202A5;
        Fri, 22 Jul 2022 16:50:31 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1658497831;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=dGA7TmfBUtzcH5UoFGnG6EflU62ob49cdU4Ktc31jOg=;
        b=aMoQwN/Y0biKaWZTf/VnpugTZuJINcI1mm1WPb833sNBCld9i1FZZ9T8rV2yFAt8bkU69q
        Sv7V6LACesTZ6vGMpWTkn5QY4uhi+pjWB3GXNx8waR8rx2UjnIcL7iZup9d94bnH1JNJW1
        MiXqM5V0kmwQiH/5MOE8WWY2lGwVDDg=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id A5A1A634C95;
        Fri, 22 Jul 2022 16:50:30 +0300 (EEST)
Date:   Fri, 22 Jul 2022 16:50:30 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     "Paul J . Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 6/7] media: i2c: ov9282: Set v4l2 subdev name
 according to sensor model
Message-ID: <YtqrJp8qZOwYdUrZ@valkosipuli.retiisi.eu>
References: <20220722131947.2456988-1-alexander.stein@ew.tq-group.com>
 <20220722131947.2456988-7-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220722131947.2456988-7-alexander.stein@ew.tq-group.com>
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1658497831;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=dGA7TmfBUtzcH5UoFGnG6EflU62ob49cdU4Ktc31jOg=;
        b=ylbRUaTL5LTvUfw6foD4+Y62/NCNou8GJbZYgS6V8V+Ggn1y43X8WQSWwz9UT4qrr7dgpQ
        2swJ21ME4LIHqels6UXpIJyGx6d94X6yI+uRrbsL5dzHjSg8quo7bnI46U7CS8E6FDrxWa
        0Mq9NI1+wFDs+lHLGiJ6eIG71ZxANpw=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1658497831; a=rsa-sha256; cv=none;
        b=s99f1cJmnxXqRevDNXi2/rxL7ikkD1W3/Z83oBJmnUGUxhqGtY+nXNUPKrlKuNLGhnOFD/
        Ts48LVk345RYzXEGXszDz6BiI7qeNakGKaq9rPclEGumTVqmIKQkehAep9l9yNeY98vXDo
        2/KBixT46LPi32zT/Ir1Io5b+ovloF0=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexander,

On Fri, Jul 22, 2022 at 03:19:46PM +0200, Alexander Stein wrote:
> To distinguish ov9281 & ov9282 the name has to be explicitly set.
> i2c_client already has the name parsed from the compatible.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  drivers/media/i2c/ov9282.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index 352dbe21a902..dbc0a4cd060f 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -1047,6 +1047,7 @@ static int ov9282_probe(struct i2c_client *client)
>  
>  	/* Initialize subdev */
>  	v4l2_i2c_subdev_init(&ov9282->sd, client, &ov9282_subdev_ops);
> +	v4l2_i2c_subdev_set_name(&ov9282->sd, client, client->name, NULL);
>  

Could you instead do this based on the compatible string in the driver,
using device_get_match_data()? The approach works on non-OF systems, too.

>  	ret = ov9282_parse_hw_config(ov9282);
>  	if (ret) {

-- 
Regards,

Sakari Ailus
