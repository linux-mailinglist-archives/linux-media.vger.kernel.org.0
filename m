Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFAC2568A43
	for <lists+linux-media@lfdr.de>; Wed,  6 Jul 2022 15:57:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232776AbiGFN5h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Jul 2022 09:57:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233598AbiGFN5b (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Jul 2022 09:57:31 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E978F175BC
        for <linux-media@vger.kernel.org>; Wed,  6 Jul 2022 06:57:29 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id y77so20028423oia.3
        for <linux-media@vger.kernel.org>; Wed, 06 Jul 2022 06:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5pcvxPYSCYAj/nTakeIqQbMhqO953IPXXQZS4ttxNlM=;
        b=T3IAxZjCTEVyP+AvZ1EHEGblZfO6ltkKGsggqJTXASicfK3e0OPUYMG1HLHp5Kzi3m
         eEZNIDlofIwZcTRTZy4R/qjxmGQtNQHwA8g9Ft1UIRmcFDGQhiAf5bkurlgq3cC+vkdy
         ezEvys6mcFi3H3f1WepVOdLUpuB5vMJFS9ved3S+wvyaFZSX0vHuC3Dva0vIV8vOpOQb
         52WekBwi+YNgIVDJJWMaUNk/HI9D6lV/usLUrbM85Xb1uDA/UIFu2kMZT54kbUF0adHP
         X2bp+l0Zd7aCpe2bGT4T+5hk3DTHtHasMcH6+sMNlfrZrwZxlxERKheOnro3IMXUelbe
         5row==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5pcvxPYSCYAj/nTakeIqQbMhqO953IPXXQZS4ttxNlM=;
        b=bR0GMp56ypMuFbH5+NAvj2IE7lIkRGeidU66Xk6ydOIUZuY/+U46MaG/Vzd9Qph66t
         BfCFIvbPiOJeEyVlGf0HPYmpXflPH7wTOxbKOoRz5/2VQaARqPkksTbIvO/hGrY6dwsS
         a372Wij3spRFUgsAti5BudEOCUep3fDNXPKN4cJwwOvtvmw/Lq/3pzNx1Zve0pLlTYMK
         D8eyUVQEjT+v6vhjgHO8daPPO/ktbCUcwNLk2iqt/Gt2LPogWdFj1k+Uqd1eC5C5JJl9
         CH4MYBNuuLjurddWxig4xkahPrdMJXwKciY6fBUw8agi4TH7Hk1zNwq9W4PY8AEVbLz7
         seFQ==
X-Gm-Message-State: AJIora+cMjr2MKT7WWBr1E6PbIhjyAgwC7KPEghbNtPGqrgYQ+pgVOwp
        lK4rEHTuTlJVbFQcNGzm/3I4KKoYuuAyG1swS6ybRv/8kJSQuw==
X-Google-Smtp-Source: AGRyM1sLkpG40GnDIjC56/7gGaEjdYaXQRNgeBE8LiHYYSOX9k70Kwo479vMt10j9j33ixs0ihcpN7pNJCl3WHSngds=
X-Received: by 2002:a05:6808:2020:b0:335:52b7:d447 with SMTP id
 q32-20020a056808202000b0033552b7d447mr22941752oiw.109.1657115849266; Wed, 06
 Jul 2022 06:57:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220704221548.629302-1-vladimir.zapolskiy@linaro.org> <20220704221548.629302-2-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20220704221548.629302-2-vladimir.zapolskiy@linaro.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Wed, 6 Jul 2022 15:57:18 +0200
Message-ID: <CAG3jFyt8aNBQaVZQnU5b3Efz8p6=Ww2Z0SZqM7NfpdcJwdk=4Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] media: camss: Collect information about a number of
 lite VFEs
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 5 Jul 2022 at 00:15, Vladimir Zapolskiy
<vladimir.zapolskiy@linaro.org> wrote:
>
> VFE lite IPs are found on CAMSS with TITAN_TOP power domains, and in
> some aspects these types of VFEs are different, in particular there
> is no need to enable VFE power domains to operate over VFE lite IPs.
>
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  drivers/media/platform/qcom/camss/camss.c | 20 +++++++++++---------
>  drivers/media/platform/qcom/camss/camss.h |  1 +
>  2 files changed, 12 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 7a929f19e79b..795eebd9af6c 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -1170,7 +1170,7 @@ static int camss_init_subdevices(struct camss *camss)
>         }
>
>         /* note: SM8250 requires VFE to be initialized before CSID */
> -       for (i = 0; i < camss->vfe_num; i++) {
> +       for (i = 0; i < camss->vfe_num + camss->vfe_lite_num; i++) {
>                 ret = msm_vfe_subdev_init(camss, &camss->vfe[i],
>                                           &vfe_res[i], i);
>                 if (ret < 0) {
> @@ -1242,7 +1242,7 @@ static int camss_register_entities(struct camss *camss)
>                 goto err_reg_ispif;
>         }
>
> -       for (i = 0; i < camss->vfe_num; i++) {
> +       for (i = 0; i < camss->vfe_num + camss->vfe_lite_num; i++) {
>                 ret = msm_vfe_register_entities(&camss->vfe[i],
>                                                 &camss->v4l2_dev);
>                 if (ret < 0) {
> @@ -1314,7 +1314,7 @@ static int camss_register_entities(struct camss *camss)
>                                 }
>         } else {
>                 for (i = 0; i < camss->csid_num; i++)
> -                       for (k = 0; k < camss->vfe_num; k++)
> +                       for (k = 0; k < camss->vfe_num + camss->vfe_lite_num; k++)
>                                 for (j = 0; j < camss->vfe[k].line_num; j++) {
>                                         struct v4l2_subdev *csid = &camss->csid[i].subdev;
>                                         struct v4l2_subdev *vfe = &camss->vfe[k].line[j].subdev;
> @@ -1338,7 +1338,7 @@ static int camss_register_entities(struct camss *camss)
>         return 0;
>
>  err_link:
> -       i = camss->vfe_num;
> +       i = camss->vfe_num + camss->vfe_lite_num;
>  err_reg_vfe:
>         for (i--; i >= 0; i--)
>                 msm_vfe_unregister_entities(&camss->vfe[i]);
> @@ -1377,7 +1377,7 @@ static void camss_unregister_entities(struct camss *camss)
>
>         msm_ispif_unregister_entities(camss->ispif);
>
> -       for (i = 0; i < camss->vfe_num; i++)
> +       for (i = 0; i < camss->vfe_num + camss->vfe_lite_num; i++)
>                 msm_vfe_unregister_entities(&camss->vfe[i]);
>  }
>
> @@ -1579,13 +1579,15 @@ static int camss_probe(struct platform_device *pdev)
>                 camss->version = CAMSS_845;
>                 camss->csiphy_num = 4;
>                 camss->csid_num = 3;
> -               camss->vfe_num = 3;
> +               camss->vfe_num = 2;
> +               camss->vfe_lite_num = 1;
>         } else if (of_device_is_compatible(dev->of_node,
>                                            "qcom,sm8250-camss")) {
>                 camss->version = CAMSS_8250;
>                 camss->csiphy_num = 6;
>                 camss->csid_num = 4;
> -               camss->vfe_num = 4;
> +               camss->vfe_num = 2;
> +               camss->vfe_lite_num = 2;
>         } else {
>                 return -EINVAL;
>         }
> @@ -1607,8 +1609,8 @@ static int camss_probe(struct platform_device *pdev)
>                         return -ENOMEM;
>         }
>
> -       camss->vfe = devm_kcalloc(dev, camss->vfe_num, sizeof(*camss->vfe),
> -                                 GFP_KERNEL);
> +       camss->vfe = devm_kcalloc(dev, camss->vfe_num + camss->vfe_lite_num,
> +                                 sizeof(*camss->vfe), GFP_KERNEL);
>         if (!camss->vfe)
>                 return -ENOMEM;
>
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index 0db80cadbbaa..3acd2b3403e8 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -97,6 +97,7 @@ struct camss {
>         struct csid_device *csid;
>         struct ispif_device *ispif;
>         int vfe_num;
> +       int vfe_lite_num;
>         struct vfe_device *vfe;
>         atomic_t ref_count;
>         int genpd_num;
> --
> 2.33.0
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
