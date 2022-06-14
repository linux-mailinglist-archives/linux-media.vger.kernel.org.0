Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C3F054AFB6
	for <lists+linux-media@lfdr.de>; Tue, 14 Jun 2022 14:01:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236054AbiFNMBK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jun 2022 08:01:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231868AbiFNMBJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jun 2022 08:01:09 -0400
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D237A47387
        for <linux-media@vger.kernel.org>; Tue, 14 Jun 2022 05:01:03 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (89-27-103-169.bb.dnainternet.fi [89.27.103.169])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id D9CD720093;
        Tue, 14 Jun 2022 15:01:00 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1655208061;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=5TjZ/gqgROtL97DCQETaGYLnvhs62Wwryrn+IXjST84=;
        b=WMDmYf1DGiMTznXG1gw82IbKBmPwhjeuoiQJN/BM8CYQ6R0jcVrLP56bgaITQrzdxHY70B
        rPAtQQuWgcYoLD45HovKUXsNQHDLFtVcK/ZM2HwbRAB3OVIMvmfYF0gO165JC7ihak4rWt
        xiX2nND/ibaLWsCS8YG96r8yzkBddpk=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 052B0634C91;
        Tue, 14 Jun 2022 15:00:59 +0300 (EEST)
Date:   Tue, 14 Jun 2022 15:00:59 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     jacopo@jmondi.org, paul.j.murphy@intel.com,
        daniele.alessandrelli@intel.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        dmitry.baryshkov@linaro.org, konrad.dybcio@somainline.org,
        andrey.konovalov@linaro.org
Subject: Re: [PATCH 2/2] media: i2c: imx412: Add imx577 compatible string
Message-ID: <Yqh4ewFMP5QcO/ta@valkosipuli.retiisi.eu>
References: <20220607134057.2427663-1-bryan.odonoghue@linaro.org>
 <20220607134057.2427663-3-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220607134057.2427663-3-bryan.odonoghue@linaro.org>
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1655208061;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=5TjZ/gqgROtL97DCQETaGYLnvhs62Wwryrn+IXjST84=;
        b=XLq/2+AgFk2745zqCcCDPaAoHT5fXdPdUqXpUhmw5eG2dM2x3VdzGBFrHFKqg4CCJQNnRk
        JtWNurS2fK04UIydf047dra3CYtexVdZXlAiSHvMuZnJHyx59kZyn/R12vHvMGOSEooU7x
        saZ8VhB4VFXzp4Uc/+/EmSmwoUFpDII=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1655208061; a=rsa-sha256; cv=none;
        b=vXwJk2R6lPTcS/+8fxuRoISHlIeQx3FOO+CiGuNBSxYDHJ3fHkWaJT0BmUtTRpfJ0UwArk
        W+oiBK3dNDh/qUvILhNJHFFXvqzwLDx7ze6nD+WXRXIV9/wfk41WpIb0332KwWvo0TAMnp
        ZVUaXJtQ9vaypFUyL1f96uyde0bY6cs=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bryan,

On Tue, Jun 07, 2022 at 02:40:57PM +0100, Bryan O'Donoghue wrote:
> The Sony IMX577 uses the same silicon enabling reference code from Sony in
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
> index a1394d6c1432..3b7011ab0a8f 100644
> --- a/drivers/media/i2c/imx412.c
> +++ b/drivers/media/i2c/imx412.c
> @@ -1282,6 +1282,7 @@ static const struct dev_pm_ops imx412_pm_ops = {
>  
>  static const struct of_device_id imx412_of_match[] = {
>  	{ .compatible = "sony,imx412" },
> +	{ .compatible = "sony,imx577" },

Thanks for the patch.

Surely the sensors still have some differences.

Even if the same registers would work as-is (the imx577 might still benefit
from different MSRs?), the user should know which sensor it is. I.e. please
set the media entity name accordingly. See e.g. the CCS driver for an
example.

>  	{ }
>  };
>  

-- 
Kind regards,

Sakari Ailus
