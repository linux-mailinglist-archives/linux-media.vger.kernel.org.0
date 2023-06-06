Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D4207240D1
	for <lists+linux-media@lfdr.de>; Tue,  6 Jun 2023 13:27:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235601AbjFFL1X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Jun 2023 07:27:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235654AbjFFL1U (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Jun 2023 07:27:20 -0400
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F507E52;
        Tue,  6 Jun 2023 04:27:19 -0700 (PDT)
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-3f866383b25so28426851cf.2;
        Tue, 06 Jun 2023 04:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686050838; x=1688642838;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mgUkyPGtY/ECAh7OGy1FqTi4RQPwzsS/x8pOApuuV6s=;
        b=iIjniDGDdBz6cdq98ieWcGufN5ToqSK2sdkvaIeGmOJfDlGTz+ByyK+He666X0pxL2
         guktgF7MbaRVoFc8kXqWZdE5+fLM9SH49a8yh2G03ByOCo3NnEHwR7KUezQtmn6EJyvl
         cSsTCFihg3wo9+zNFOhInmZ9mPi/xibvOM4muUdfEP4zwNc5hNffEQkHQy8IoXUdzq5K
         3uzHkNmts/b8LsHpaFESTAKKoLGW+vnSupirXBCNe5WMtj3gc0p2/+dH0HO/5WkD8f6Q
         OXp+N47+g+he0Ggf3Y6Hz1iNOUIdfkHoyyYWzJ98TS10yzrIh8x9I8zj19ndKarIc535
         Ykhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686050838; x=1688642838;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mgUkyPGtY/ECAh7OGy1FqTi4RQPwzsS/x8pOApuuV6s=;
        b=AMOFdzrlA1xBx8CAtm2H2LcJYljdJe8z0LlUJMORkVAV0PzEl7mKS0wEJF8pccM2Tk
         oYHXCtP276pl841zviy2IG6cTs9rmky2fNfLfRdcKAwe7Mm2BB/xwS+Z2ShIFjh/DccE
         pgOn6BaVXJHtEvTfO1Fg3gcupixpVPskc10GaeqvBOG1IQzO3Uo4bJYpS064ispYiFmD
         hY5OOSMvKnWNQi5Q86a1b4/IfMduJgq+olVaAveiT61WXJtQs5Km3e+oa97tT7rBHuUB
         AgNkR2mSftEtysj37+IVwyYhgmHrs485Va0dvOniVqs/BMQrCBKBwHkuJyJFwNXi5YFe
         w+Hg==
X-Gm-Message-State: AC+VfDw3nUxQ9Z19QrMJ2R/N9ttQVkCvOh1XxdfX3jV/eijX8BYRoitL
        zsRyiTTXmt1AtOkRbeQ6aHLVkebGiSviphgC2rU=
X-Google-Smtp-Source: ACHHUZ5Q4F4QW87/DNVfTKCqbyYWyCtIdnNppxOTyRQLbUZ4pRst0b4pGcjiSEzo4MMe8TswTsQO8W9Ey6yMT4sGA20=
X-Received: by 2002:a05:6214:da9:b0:5f8:ad2a:fef7 with SMTP id
 h9-20020a0562140da900b005f8ad2afef7mr2141520qvh.32.1686050838562; Tue, 06 Jun
 2023 04:27:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230531134429.171337-1-hdegoede@redhat.com> <CAHp75VfZN5M8LiP3nw0NT5p3WyJJJJm6w2OZKgm28b6aokzopQ@mail.gmail.com>
 <b1cdf8b7-ae9b-a86d-5298-bd0cfa70f9cb@redhat.com>
In-Reply-To: <b1cdf8b7-ae9b-a86d-5298-bd0cfa70f9cb@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 6 Jun 2023 14:26:42 +0300
Message-ID: <CAHp75Vc7fq=PK5vN5Ya6yMRG3VCFhfwBVobxsSKYwKUyWnDq3g@mail.gmail.com>
Subject: Re: [PATCH v2] platform/x86: int3472: Evaluate device's _DSM method
 to control imaging clock
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        bingbu.cao@linux.intel.com, platform-driver-x86@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>,
        Hao Yao <hao.yao@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jun 6, 2023 at 12:23=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
> On 5/31/23 19:56, Andy Shevchenko wrote:
> > On Wed, May 31, 2023 at 4:44=E2=80=AFPM Hans de Goede <hdegoede@redhat.=
com> wrote:

...

> >> +       if (clk->ena_gpio)
> >> +               gpiod_set_value_cansleep(clk->ena_gpio, 1);
> >> +       else
> >> +               skl_int3472_enable_clk_acpi_method(clk, 1);
> >
> > Looking at this, can we avoid duplicative validation of the GPIO?
> > Perhaps skl_int3472_enable_clk_acpi_method() can have embedded another
> > check so they won't be called together?
> >
> > ...
> >
> >> +       if (clk->ena_gpio)
> >> +               gpiod_set_value_cansleep(clk->ena_gpio, 0);
> >> +       else
> >> +               skl_int3472_enable_clk_acpi_method(clk, 0);
> >
> > Ditto.
>
> Ack, I've squashed a fix for this into this patch while merging it into
> my review-hans branch.

Now you have two different checks for the same, I would suggest that
you switch to check clk->cl in the skl_int3472_enable_clk()
as it's done in the skl_int3472_register_dsm_clock() instead of GPIO.
Other way around is also possible but it seems to me that checking for
clock existence has better guarantees than just checking for GPIO
availability.

--=20
With Best Regards,
Andy Shevchenko
