Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B0BB52C2C2
	for <lists+linux-media@lfdr.de>; Wed, 18 May 2022 20:53:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241588AbiERSqh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 May 2022 14:46:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241589AbiERSqT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 May 2022 14:46:19 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 273CA326DF
        for <linux-media@vger.kernel.org>; Wed, 18 May 2022 11:46:15 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id q76so2913548pgq.10
        for <linux-media@vger.kernel.org>; Wed, 18 May 2022 11:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=V3B7kLzjrW5rguicjsbjnac0GJd5nT7pv1U8tFVF6k4=;
        b=kkJjzHseFV9SY+eiOLyT/krH1kR54Z5+JvbWNCnIMccJFZO9K6fZTmpMPlJXsTBeBy
         jFLND0W5BOiyXkwNg5VWiwUprWy9TplkY68zhNstWI9oj1SM3fYeDY2l7P1ya326rxJV
         BwbuauDOM4Yc+VP3piFDLCuBRcY+f+nR6cFi8OcGWrx+LCrc9voJyh/BJ40eITNG5HDt
         Ft4iFNHeeVuB0027YAn7fY/Xj/OUovoXKe2+O43rsqctglZ5osdApvIiY7+MulE5I2/x
         l4drm8180FZWUMDpFMFeKYXn4lcMOHxIicSchMdkp6g8AhlGyq2dkM/EfJJDnfAJ0oUd
         hQog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V3B7kLzjrW5rguicjsbjnac0GJd5nT7pv1U8tFVF6k4=;
        b=klStG0akr76oV7ZN1D5CPl4co0ypZaVzQw9SWZVD8K3C3csSxwOHIQHO6AtRGAaJPX
         dRNmBPl/BLv/igKSpiWXR7F8f42o+D3YG/rukyGupC3/sy0mpaJKEjoOEHSiNP+75YPU
         JIu9FJ2jqnhnrh7OuwPicep+v69ATMwxu6EC2/uwRpuobtQv2Z5X3D50eV2kN8xDnpvZ
         BbSWrGMlSaIB//DuiPYr994IXy23McyBm9QWoXZbsaeRc8Pvjih1XWEmvGuoaav2xkEA
         4rmPzL2xswlV3tAJ0lD17y09AH3C2mWxL4Gtd1QuiDxSNxoNcGouK/AmWcYy6wyOSgRP
         7btg==
X-Gm-Message-State: AOAM533L+I4c9J3HijIwlREi36i2fictw7DwvapbdrOm0kWIO+lBiv5o
        l47DdlrckZrJEs1ozUTTvSJEs8dlpXhUZhTzrke0KA==
X-Google-Smtp-Source: ABdhPJw16sFRxn+XBqlBpkQ7tTOZLgFCztuokY0MmhP07niyY0+fvYhgvaKniUihL4ir/xd6aTsvu4FlVlBb4ZFQz8M=
X-Received: by 2002:a63:d04a:0:b0:3c1:65f2:5d09 with SMTP id
 s10-20020a63d04a000000b003c165f25d09mr674822pgi.201.1652899574596; Wed, 18
 May 2022 11:46:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220513080529.416245-1-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20220513080529.416245-1-vladimir.zapolskiy@linaro.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Wed, 18 May 2022 20:46:03 +0200
Message-ID: <CAG3jFyuupy=rcY3Nsg=n52t_JZ1ePDW28RGMi=2Lzdx6LNRetA@mail.gmail.com>
Subject: Re: [PATCH] media: camss: Allocate camss struct as a managed device resource
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Todor Tomov <todor.too@gmail.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Vladimir,

On Fri, 13 May 2022 at 10:05, Vladimir Zapolskiy
<vladimir.zapolskiy@linaro.org> wrote:
>
> The change simplifies driver's probe and remove functions, no functional
> change is intended.
>
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
> The change is supposed to be applied on top of this one:
>
>   https://lore.kernel.org/linux-media/20220512082318.189398-1-vladimir.zapolskiy@linaro.org/
>
> drivers/media/platform/qcom/camss/camss.c | 33 +++++++----------------
>  1 file changed, 10 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index e90fea28ac88..0f4908fa21e2 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -1751,7 +1751,7 @@ static int camss_probe(struct platform_device *pdev)
>         struct camss *camss;
>         int num_subdevs, ret;
>
> -       camss = kzalloc(sizeof(*camss), GFP_KERNEL);
> +       camss = devm_kzalloc(dev, sizeof(*camss), GFP_KERNEL);
>         if (!camss)
>                 return -ENOMEM;
>
> @@ -1795,39 +1795,30 @@ static int camss_probe(struct platform_device *pdev)
>                 camss->csid_num = 5;
>                 camss->vfe_num = 5;
>         } else {
> -               ret = -EINVAL;
> -               goto err_free;
> +               return -EINVAL;
>         }
>
>         camss->csiphy = devm_kcalloc(dev, camss->csiphy_num,
>                                      sizeof(*camss->csiphy), GFP_KERNEL);
> -       if (!camss->csiphy) {
> -               ret = -ENOMEM;
> -               goto err_free;
> -       }
> +       if (!camss->csiphy)
> +               return -ENOMEM;
>
>         camss->csid = devm_kcalloc(dev, camss->csid_num, sizeof(*camss->csid),
>                                    GFP_KERNEL);
> -       if (!camss->csid) {
> -               ret = -ENOMEM;
> -               goto err_free;
> -       }
> +       if (!camss->csid)
> +               return -ENOMEM;
>
>         if (camss->version == CAMSS_8x16 ||
>             camss->version == CAMSS_8x96) {
>                 camss->ispif = devm_kcalloc(dev, 1, sizeof(*camss->ispif), GFP_KERNEL);
> -               if (!camss->ispif) {
> -                       ret = -ENOMEM;
> -                       goto err_free;
> -               }
> +               if (!camss->ispif)
> +                       return -ENOMEM;
>         }
>
>         camss->vfe = devm_kcalloc(dev, camss->vfe_num, sizeof(*camss->vfe),
>                                   GFP_KERNEL);
> -       if (!camss->vfe) {
> -               ret = -ENOMEM;
> -               goto err_free;
> -       }
> +       if (!camss->vfe)
> +               return -ENOMEM;
>
>         v4l2_async_nf_init(&camss->notifier);
>
> @@ -1909,8 +1900,6 @@ static int camss_probe(struct platform_device *pdev)
>         v4l2_device_unregister(&camss->v4l2_dev);
>  err_cleanup:
>         v4l2_async_nf_cleanup(&camss->notifier);
> -err_free:
> -       kfree(camss);
>
>         return ret;
>  }
> @@ -1929,8 +1918,6 @@ void camss_delete(struct camss *camss)
>                 device_link_del(camss->genpd_link[i]);
>                 dev_pm_domain_detach(camss->genpd[i], true);
>         }
> -
> -       kfree(camss);
>  }
>
>  /*
> --
> 2.33.0
>

I'm  having issues applying this patch to upstream/master or
upstream-media/master, even when first applying the patch you
mentioned above.
