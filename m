Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7224F56740D
	for <lists+linux-media@lfdr.de>; Tue,  5 Jul 2022 18:19:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232312AbiGEQT1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jul 2022 12:19:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229798AbiGEQT0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jul 2022 12:19:26 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DA431C919
        for <linux-media@vger.kernel.org>; Tue,  5 Jul 2022 09:19:25 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id z41so15979695ede.1
        for <linux-media@vger.kernel.org>; Tue, 05 Jul 2022 09:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jYZi8rRbHn8tW6ukNBHgDr7LhwZ5zS5lnEhO2Ak2igg=;
        b=QdHnGJG9DT6rEloPFwd7YvkIKVolkTouLjq7lM8+wlzBwMERfD6toyZW0AOVQ9kJ6y
         A6k3Tp1xU+pX4IW/wcYcCWYsS8wLqb1HR3gD3CIm7wv2c6PxUokCiMrBLo8PLilvsdzk
         jyYwJ6OpM/61mtYOvZTLCdPJULcv98E670xeA+W3ZgiiGt4ZfMmJKooScLo4v3HCFtDk
         9ATpc+IgFXU8mIGzi3XyAyUiXCPREbw/Dhjc1v9hDh873301doPIx2K5A+1q9VSVYk+G
         2i28wkXV7j7jVi4MiBbv57h/Yt040xIP93Ij/WjDvsobOIJT9aWjYt7EzoHgSo/mQXzn
         3obg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jYZi8rRbHn8tW6ukNBHgDr7LhwZ5zS5lnEhO2Ak2igg=;
        b=PBWjtmEslrwBHwUdS5rlAb4Z5NuLBEW7myX13UtVc5dQ8GQJpf7St/h+gK0EkumzuW
         CuC4myZAf3IK4tR/31JUXtsfrH6RUcOKYKMf5rLGenENeaCyDHINVwxFT9TaRLzCrziJ
         +1Q3uiQwQUNbK6JdvJhXvd8Z2bXaypTuFpTKTLqvgSD55aJqSBaoBRBDGcmrFnjPSu4T
         yn48A8r/GhfUNnYbsneknMNJcFLiRHE+JdWnrMOl0yVATHCxz5/oI7TotlIpuCsnbdTv
         C8UIOLkKBOhVd0y7nOShiqSH6Ich73nB4mAB3Nn0gEDWzHg5jGZHdXJ6vhvBfryvSzgt
         b0hw==
X-Gm-Message-State: AJIora+OoRQbA/k74xK2kSLaLSn+4K+zsIDwu0b60YGZEQ6b9KdNbXFG
        fdR0fGVsL/rGe6UKeiFO7wwjh2UvougS3GR6gqr0ew==
X-Google-Smtp-Source: AGRyM1uB27HRZg8W8xYPv7TCcAhKGqKs//KSawcHJS04Mu1OQie7j0MwhR7ZT74oMo0NdgDgHW3BxQMkqVF5lv2at3c=
X-Received: by 2002:aa7:cdc2:0:b0:43a:7255:5274 with SMTP id
 h2-20020aa7cdc2000000b0043a72555274mr8914387edw.159.1657037963909; Tue, 05
 Jul 2022 09:19:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220704220814.629130-1-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20220704220814.629130-1-vladimir.zapolskiy@linaro.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Tue, 5 Jul 2022 18:19:12 +0200
Message-ID: <CAG3jFyvXt1AdJLBU55phM1matF3VRdu8re1tFkJdgtEFrPbVuw@mail.gmail.com>
Subject: Re: [PATCH v2] media: camss: Do not attach an already attached power
 domain on MSM8916 platform
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Todor Tomov <todor.too@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
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

On Tue, 5 Jul 2022 at 00:08, Vladimir Zapolskiy
<vladimir.zapolskiy@linaro.org> wrote:
>
> The change to dynamically allocated power domains neglected a case of
> CAMSS on MSM8916 platform, where a single VFE power domain is neither
> attached, linked or managed in runtime in any way explicitly.
>
> This is a special case and it shall be kept as is, because the power
> domain management is done outside of the driver, and it's very different
> in comparison to all other platforms supported by CAMSS.
>
> Fixes: 6b1814e26989 ("media: camss: Allocate power domain resources dynamically")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
> Changes from v1 to v2:
> * corrected the fixed commit id, which is found on media/master
>
>  drivers/media/platform/qcom/camss/camss.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 932968e5f1e5..7a929f19e79b 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -1465,6 +1465,14 @@ static int camss_configure_pd(struct camss *camss)
>                 return camss->genpd_num;
>         }
>
> +       /*
> +        * If a platform device has just one power domain, then it is attached
> +        * at platform_probe() level, thus there shall be no need and even no
> +        * option to attach it again, this is the case for CAMSS on MSM8916.
> +        */
> +       if (camss->genpd_num == 1)
> +               return 0;
> +
>         camss->genpd = devm_kmalloc_array(dev, camss->genpd_num,
>                                           sizeof(*camss->genpd), GFP_KERNEL);
>         if (!camss->genpd)
> @@ -1698,6 +1706,9 @@ void camss_delete(struct camss *camss)
>
>         pm_runtime_disable(camss->dev);
>
> +       if (camss->genpd_num == 1)
> +               return;
> +
>         for (i = 0; i < camss->genpd_num; i++) {
>                 device_link_del(camss->genpd_link[i]);
>                 dev_pm_domain_detach(camss->genpd[i], true);
> --
> 2.33.0
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
