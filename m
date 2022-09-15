Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 095575BA20D
	for <lists+linux-media@lfdr.de>; Thu, 15 Sep 2022 22:55:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229471AbiIOUzr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Sep 2022 16:55:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbiIOUzp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Sep 2022 16:55:45 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11C4A564ED
        for <linux-media@vger.kernel.org>; Thu, 15 Sep 2022 13:55:44 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dkwl20tj04snw15cjtflt-3.rev.dnainternet.fi [IPv6:2001:14ba:4493:6f40:fec3:d72a:e447:8113])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 298D020167;
        Thu, 15 Sep 2022 23:55:40 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1663275340;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=7Zjv0NRzx/kQorjsaQ6DQnJzto3ssRyb7aVSqxQwwZM=;
        b=Qv8GeTFHSCp9NZoUnjsmKVs7m3/vAnzxgIYvV478M0zke94AIb6x1/+cVm+OJyPIRZopWB
        iQ2GbHBVEtvcb0A3UHr8H/mDHosjus0afuPjss78cJcSuPQ6qIIeFZCJY/835/4tAKzm5t
        uYSwGJi3QVr/XKIpeFT78psn/2tcmQk=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 42305634C91;
        Thu, 15 Sep 2022 23:55:39 +0300 (EEST)
Date:   Thu, 15 Sep 2022 23:55:39 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     jacopo@jmondi.org, paul.j.murphy@intel.com,
        daniele.alessandrelli@intel.com, mchehab@kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v3 5/5] media: i2c: imx412: Add imx577 compatible string
Message-ID: <YyORS+qWivhAM62K@valkosipuli.retiisi.eu>
References: <20220915003522.1227073-1-bryan.odonoghue@linaro.org>
 <20220915003522.1227073-6-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220915003522.1227073-6-bryan.odonoghue@linaro.org>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1663275340; a=rsa-sha256; cv=none;
        b=ItPIXoclq/6+lCJOQfZ2MQa/tQSgEvA5VeojONhJsFaDj0jOFghJuUA7hUAO2f/b8pGztV
        gW9dZKA0KbzIHacLERE6LCjsZtjxE17zNQCNb8J0gj3FoQtTOZYDriy2G8rAETiAeB3amC
        JEBQchERmXXedj/W1ZWa0mIkCQqJXgw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1663275340;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=7Zjv0NRzx/kQorjsaQ6DQnJzto3ssRyb7aVSqxQwwZM=;
        b=cPAnKoO3hzY3clpyt6YfSAvLSVM8es/M7P98g97LPlPqGCHiBwl8R9uWx2Kq1AEJh9Hc/x
        wTkGkagL17iAiIAAeI1V4y5ZM3D9SKgY93rxs7/4Rp2enZeLYTQx4ykScG3USCyRzSI954
        z6ApVz1CF6PTFcz5D5VWpBoubGqFLGw=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 15, 2022 at 01:35:22AM +0100, Bryan O'Donoghue wrote:
> The Sony imx577 uses the same silicon enabling reference code from Sony in
> the available examples provided.
> 
> Add an imx577 compatible string and re-use the existing imx412 code.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/i2c/imx412.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
> index 1013a5afc85f..776cc058edf2 100644
> --- a/drivers/media/i2c/imx412.c
> +++ b/drivers/media/i2c/imx412.c
> @@ -1290,6 +1290,7 @@ static const struct dev_pm_ops imx412_pm_ops = {
>  static const struct of_device_id imx412_of_match[] = {
>  	{ .compatible = "sony,imx412", .data = "imx412" },
>  	{ .compatible = "sony,imx477", .data = "imx477" },
> +	{ .compatible = "sony,imx577", .data = "imx577" },

Please squash patche 1 with 2 and patch 4 with 5.

Then I think these should be ready for merging.

>  	{ }
>  };
>  

-- 
Kind regards,

Sakari Ailus
