Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B6AB530D88
	for <lists+linux-media@lfdr.de>; Mon, 23 May 2022 12:42:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232898AbiEWJ1a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 May 2022 05:27:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233109AbiEWJ1R (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 May 2022 05:27:17 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77807496A4
        for <linux-media@vger.kernel.org>; Mon, 23 May 2022 02:26:53 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id h186so13167660pgc.3
        for <linux-media@vger.kernel.org>; Mon, 23 May 2022 02:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ixiNRpXgz9b31FW61K2FmrqjzNzzz5ThFbdZe2OKzE4=;
        b=e1EL9cN1PwGrS9mLJ8F5/AZlqIa1OZUV1nl5rAs2SBow/yKNFiDxTZ9n93hqa9fNP+
         2JXuIb4G9KHGX/jgC9Oco9e4iDS+eDSAnob4rhPxAVcPgEIqmZVUB3oSVeKGzCu2QTlU
         e/NyO+f6mqgJUKxB39tTXa0Jmdpy5Hfar/hLrGDiqIVJPognNulug7fm0ej3NYZmPJqf
         WqBTWLeP4mYYvAF4V8FlD7SiBcq4QjACWPVIpx1zv8WKdo5SvHCtq6/r26L3JqFJamdc
         e64p0cxETG+1w5VOtHmQLnkv0N+wxtUZC9/e9IPPp/cw7U7XjpUV77y0ITBFpf8lGmhS
         ma/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ixiNRpXgz9b31FW61K2FmrqjzNzzz5ThFbdZe2OKzE4=;
        b=V7jHZmPJwvp2ik/yii5rd1r77LlbtIMLFSgeOlK1HIrju13n9VjjD+bMlBEVgzJCfz
         KZxaBkgaQ9oVT1NQVjDQPL1tAnzdo6ZAlneCq6bQX8LO3d3iK1k8EHZSG8dUde9Fi3fU
         BspynYYf7SjqjA6LVVY0L853gCHpOR6Vhf5K+6o0E/IZSQoFfHqViHRCVj6y7kuo4sYH
         9nVC66IRl3xXJuUp17YHv8QrVqs1bs8lqyyjgFuHReN59jbSOa+hgm00nJ2pJFoVdrKM
         xwYCTUUQFKid8aEXggUlUBa+SE+ThXKJ/DjVQo4aA7cXqFk9lMAN1K7kfYFzPlaW1twx
         MoUg==
X-Gm-Message-State: AOAM530G6T9zo53HmNmYjdOCrdAk6jaJ73Bypma9h467NEvZN+5S53Fv
        mPBUYhpTNBWUwdYjpXW4hyXcybbhZqGDPDivOwRnYA==
X-Google-Smtp-Source: ABdhPJwl5q5hyVIrH13jI86dttwT2QxJnpuzWWciT3MoCOiM9rBPI7x6vHmmoBZApKjaPehEkuKpnYkiG5HC0igtk84=
X-Received: by 2002:a62:6d47:0:b0:4fe:15fa:301d with SMTP id
 i68-20020a626d47000000b004fe15fa301dmr22519498pfc.29.1653298012582; Mon, 23
 May 2022 02:26:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220519051415.1198248-1-vladimir.zapolskiy@linaro.org> <2a813aab-424d-bc88-fb69-e9bbe9104736@xs4all.nl>
In-Reply-To: <2a813aab-424d-bc88-fb69-e9bbe9104736@xs4all.nl>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Mon, 23 May 2022 11:26:41 +0200
Message-ID: <CAG3jFyv=vTgR2GGqkWeUuQM4fJnvBrULKH7f_VFG+Tj9E7AmTA@mail.gmail.com>
Subject: Re: [PATCH v2] media: camss: Allocate camss struct as a managed
 device resource
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
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

On Thu, 19 May 2022 at 09:16, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> Robert, Vladimir,
>
> On 5/19/22 07:14, Vladimir Zapolskiy wrote:
> > The change simplifies driver's probe and remove functions, no functional
> > change is intended.
> >
> > Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> > ---
> > Changes from v1 to v2:
> > * rebased on top of media/master
> >
> >  drivers/media/platform/qcom/camss/camss.c | 33 +++++++----------------
> >  1 file changed, 10 insertions(+), 23 deletions(-)
> >
> > diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> > index 79ad82e233cb..2055233af101 100644
> > --- a/drivers/media/platform/qcom/camss/camss.c
> > +++ b/drivers/media/platform/qcom/camss/camss.c
> > @@ -1529,7 +1529,7 @@ static int camss_probe(struct platform_device *pdev)
> >       struct camss *camss;
> >       int num_subdevs, ret;
> >
> > -     camss = kzalloc(sizeof(*camss), GFP_KERNEL);
> > +     camss = devm_kzalloc(dev, sizeof(*camss), GFP_KERNEL);
>
> In general it is not a good idea to use devm_*alloc. The problem is that if a
> device instance is forcibly unbound, then all the memory allocated with devm_
> is immediately freed. But if an application still has a file handle to a device
> open, then it can still use that memory.
>
> Now in this case the driver is already using devm_kcalloc, so it doesn't matter,
> but it is something to keep in mind. In general, hotpluggable devices cannot use
> devm_*alloc.
>
> In general, my recommendation is to not use devm_*alloc for this, but since it
> is already in use in this driver, it's better to use devm_*alloc consistently.
> Or, alternatively, not use it all. That's up to Robert.
>
> This is just as background information.


Thanks for explaining the nuances Hans, that's very helpful.

I think this patch is ok, since it doesn't make the situation any worse,
and that CSI camera sensors are very likely to be hotplugged.

>
> Regards,
>
>         Hans
>
> >       if (!camss)
> >               return -ENOMEM;
> >
> > @@ -1567,39 +1567,30 @@ static int camss_probe(struct platform_device *pdev)
> >               camss->csid_num = 4;
> >               camss->vfe_num = 4;
> >       } else {
> > -             ret = -EINVAL;
> > -             goto err_free;
> > +             return -EINVAL;
> >       }
> >
> >       camss->csiphy = devm_kcalloc(dev, camss->csiphy_num,
> >                                    sizeof(*camss->csiphy), GFP_KERNEL);
> > -     if (!camss->csiphy) {
> > -             ret = -ENOMEM;
> > -             goto err_free;
> > -     }
> > +     if (!camss->csiphy)
> > +             return -ENOMEM;
> >
> >       camss->csid = devm_kcalloc(dev, camss->csid_num, sizeof(*camss->csid),
> >                                  GFP_KERNEL);
> > -     if (!camss->csid) {
> > -             ret = -ENOMEM;
> > -             goto err_free;
> > -     }
> > +     if (!camss->csid)
> > +             return -ENOMEM;
> >
> >       if (camss->version == CAMSS_8x16 ||
> >           camss->version == CAMSS_8x96) {
> >               camss->ispif = devm_kcalloc(dev, 1, sizeof(*camss->ispif), GFP_KERNEL);
> > -             if (!camss->ispif) {
> > -                     ret = -ENOMEM;
> > -                     goto err_free;
> > -             }
> > +             if (!camss->ispif)
> > +                     return -ENOMEM;
> >       }
> >
> >       camss->vfe = devm_kcalloc(dev, camss->vfe_num, sizeof(*camss->vfe),
> >                                 GFP_KERNEL);
> > -     if (!camss->vfe) {
> > -             ret = -ENOMEM;
> > -             goto err_free;
> > -     }
> > +     if (!camss->vfe)
> > +             return -ENOMEM;
> >
> >       v4l2_async_nf_init(&camss->notifier);
> >
> > @@ -1681,8 +1672,6 @@ static int camss_probe(struct platform_device *pdev)
> >       v4l2_device_unregister(&camss->v4l2_dev);
> >  err_cleanup:
> >       v4l2_async_nf_cleanup(&camss->notifier);
> > -err_free:
> > -     kfree(camss);
> >
> >       return ret;
> >  }
> > @@ -1709,8 +1698,6 @@ void camss_delete(struct camss *camss)
> >               device_link_del(camss->genpd_link[i]);
> >               dev_pm_domain_detach(camss->genpd[i], true);
> >       }
> > -
> > -     kfree(camss);
> >  }
> >
> >  /*

Reviewed-by: Robert Foss <robert.foss@linaro.org>
