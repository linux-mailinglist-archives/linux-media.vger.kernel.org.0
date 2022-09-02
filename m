Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9C715AAAF6
	for <lists+linux-media@lfdr.de>; Fri,  2 Sep 2022 11:11:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235504AbiIBJLR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Sep 2022 05:11:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235491AbiIBJLP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Sep 2022 05:11:15 -0400
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F6309752C
        for <linux-media@vger.kernel.org>; Fri,  2 Sep 2022 02:11:14 -0700 (PDT)
Received: by mail-qk1-x734.google.com with SMTP id a15so1242648qko.4
        for <linux-media@vger.kernel.org>; Fri, 02 Sep 2022 02:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=lEZBf5387b/IcGftjc6Ta+buddrM2qanjqr8oAzK+a4=;
        b=NWjr6NGK1ZsB9Arf+R0br2abbPtWKmE9iEhd2LqJzb1wIvaD0TaMofWMFOKKZG/52G
         TMEaH0/Rim8/8dnd6KlaffH9BXbFwqZl/lSKTogz5g7NdUO7khN8fbHRTxbGwUwcveDR
         r3gUzjRVaJy8dawNeHOOu3fTYPYEmcWIGS1qXEE7A8kQOuMmlEe6jI+ypG0TokcIvd8I
         5IX83jA6WoVZH86nbhmAOxSCUdZVl/Fx7VuJMD1w5osJwHwnRUk6BH9MC4rNmNMoOrBV
         zHFF/5KKz4uZnUxWsl4+yM5KtIorpJMGGcFuFqpS3HZi+t5hSCYGf8EiVTwWLk1IQ903
         d4tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=lEZBf5387b/IcGftjc6Ta+buddrM2qanjqr8oAzK+a4=;
        b=fcpGfcb8ltd1mz4TauEpqxt4gHmf0Blys6w+2dWRCizHQwWkIhRtATwwD0O3DcPQqO
         AZVIRW93c4+RtYa9gKsbIBS4/ZwRcvsmtNSS5s1G/xCy1oOrkvVJR/zVGbkgX6/fwTXy
         NqJHbi2EHFLmN8xl0b19/APUA1MlrofO7DzU2ten6EcVTMfXtKM7BOeoiF4ll3TkRslk
         WVbgBHgtJrZVKQv2UZty2DW4lrWBX9vPGAqoW4fy5YvUknheZUqxmoOpyEpeQWDh0y8+
         kp91PwCLpphufk8h0DxLyrmh1HQAwfgPiljaBjZBOxA1Wp6HdDkFDefldagoaNFt+U0i
         nBpA==
X-Gm-Message-State: ACgBeo023lij0jmQTR9cx6EWo5pfOhUWY/AjGlPenO8Gi61VvvTriXzE
        jjdjjzzmBpQudTIlEn8WTy7qoBQ7JWrKfpwEjXM=
X-Google-Smtp-Source: AA6agR43+S/HlMPFCV3gOAajzuirEQx6jnsl2ia36BsxPKvZ3S952xNdqUAyVtvKJpk3iyXp7vwC2kupf8CMOUvgiYo=
X-Received: by 2002:ae9:e311:0:b0:6ba:e711:fb27 with SMTP id
 v17-20020ae9e311000000b006bae711fb27mr22636792qkf.320.1662109873634; Fri, 02
 Sep 2022 02:11:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220901094626.11513-1-hdegoede@redhat.com> <20220901094626.11513-11-hdegoede@redhat.com>
 <YxEOhy0YPnBuZiQs@smile.fi.intel.com> <ce0d2ec6-3ec7-9f9f-59f9-0bf2a6078c9c@redhat.com>
In-Reply-To: <ce0d2ec6-3ec7-9f9f-59f9-0bf2a6078c9c@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 2 Sep 2022 12:10:37 +0300
Message-ID: <CAHp75Vf=_2yJdPvpkx2iYoYOPzxf6sNMBD4EizYc1WAnFMWYtg@mail.gmail.com>
Subject: Re: [PATCH 10/14] media: atomisp: Register /dev/* nodes at the end of atomisp_pci_probe()
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andriy.shevchenko@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        "andrey.i.trufanov" <andrey.i.trufanov@gmail.com>,
        Fabio Aiuto <fabioaiuto83@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Sep 2, 2022 at 12:04 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 9/1/22 21:56, Andy Shevchenko wrote:
> > On Thu, Sep 01, 2022 at 11:46:22AM +0200, Hans de Goede wrote:

...

> >>                      for (; i > 0; i--)
> >>                              atomisp_subdev_unregister_entities(
> >>                                  &isp->asd[i - 1]);
> >
> > This...
>
> I presume you mean the few lines above that actually:

No, I cited a not modified code in the upper part. That said, it's a
remark for further improvements, but a helper can be introduced in
this patch due to the below part.

> >> +    for (i = 0; i < isp->num_of_streams; i++) {
> >> +            err = atomisp_subdev_register_video_nodes(&isp->asd[i], &isp->v4l2_dev);
> >> +            if (err)
> >> +                    return err;
> >> +    }
> >
> > ...and this looks like a dup.

-- 
With Best Regards,
Andy Shevchenko
