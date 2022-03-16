Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3533A4DAD90
	for <lists+linux-media@lfdr.de>; Wed, 16 Mar 2022 10:33:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354895AbiCPJfI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Mar 2022 05:35:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242712AbiCPJfH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Mar 2022 05:35:07 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D646013EB2
        for <linux-media@vger.kernel.org>; Wed, 16 Mar 2022 02:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1647423232;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=g0QoVJurl6KK3rlbhKndKVTVS4HCyEO8q4IyxNqkWMk=;
        b=GHGYq9UjezB+iLzMUe4QU5ZGC97c+JoSqEoqIp52gNv0qra5WEKw8DJ3CYHZKDcw6tDtjA
        HVpySLHFKKHRqe36TAYDhvI78YiNtEkFMgZlN4hWQHWcYguVkdBPK/OYH/rNUS2q+3eZ49
        /Qkq4vynckA0JPA/L2RSZuskQT+9oF0=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-421-Ns-aAbLNP6e1j8xGQ5lKqw-1; Wed, 16 Mar 2022 05:33:51 -0400
X-MC-Unique: Ns-aAbLNP6e1j8xGQ5lKqw-1
Received: by mail-oo1-f71.google.com with SMTP id a66-20020a4a4c45000000b00320f84498feso1066266oob.21
        for <linux-media@vger.kernel.org>; Wed, 16 Mar 2022 02:33:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g0QoVJurl6KK3rlbhKndKVTVS4HCyEO8q4IyxNqkWMk=;
        b=E78FiDh8ZvjaGXPMHh7ITPe9wtApgyy5H8/qA3vACIyOHZI3GfoswGQIODLSjNXkAR
         fWA4VPvu8Vag9MEaGQhv/PHx0HTPJEnc5+e5FOmx9GXx05SnsPs1u/z1SRCYTvBd3H0C
         R7xdcN6fzgyFZmgSuUWo1i+RyqCSTgh9DV36e4rSZ2jaVmuqoNNjc1wcg/v271Oif4ec
         DRAdBqyd6eTxk8XgGuoUFLF5RCrVcCnTK9Mgqm9ul6Ens6vWyYEbILVeicvppmBl7e3G
         NZqFjxpGV2AjcOKmzc1ZOydzLnH4M4xw7t227wFo+0FdT1w7r1UpJ8yR5yTIhV2kbPdc
         UZwQ==
X-Gm-Message-State: AOAM531IARxZhil6g0o+0SjYVmXbGBT5IyCZoBxI0P/ARt2vAwFu4qQ5
        iKDaohcgSH58qob7B2uR1j2nDpQCteAcQFwAxb7Q4lrzuj8gzgG34eW+ZunSqzxuYmhJWXrHivr
        lLp/OGPH7YZJCs1670f9aDvYKOyhmlPNUHqSl9O8=
X-Received: by 2002:a05:6870:14c5:b0:da:ab41:3a78 with SMTP id l5-20020a05687014c500b000daab413a78mr3273463oab.23.1647423230814;
        Wed, 16 Mar 2022 02:33:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSH0VjypowhPYfTXaUbcR6ddqy3et+gJ4RZnTZUs3ieCNnMAY9fFRbvaHeehLpfn97TUxEhlwCZ7C2THapvzg=
X-Received: by 2002:a05:6870:14c5:b0:da:ab41:3a78 with SMTP id
 l5-20020a05687014c500b000daab413a78mr3273454oab.23.1647423230510; Wed, 16 Mar
 2022 02:33:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220314101523.129672-1-hpa@redhat.com> <YjGncJFYky69Fjmz@paasikivi.fi.intel.com>
In-Reply-To: <YjGncJFYky69Fjmz@paasikivi.fi.intel.com>
From:   Kate Hsuan <hpa@redhat.com>
Date:   Wed, 16 Mar 2022 17:33:39 +0800
Message-ID: <CAEth8oGMyO6BJ6kPuXYYZ_bGmwq+AfGMrrcK38UxtnJs1NfjRg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] staging: media: ipu3: Fix AF x_start position when
 rightmost stripe is used
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, Hans De Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Wed, Mar 16, 2022 at 5:02 PM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Kate,
>
> On Mon, Mar 14, 2022 at 06:15:22PM +0800, Kate Hsuan wrote:
> > For the AF configuration, if the rightmost stripe is used, the AF scene
> > will be at the incorrect location of the sensor.
> >
> > The AF coordinate may be set to the right part of the sensor. This
> > configuration would lead to x_start being greater than the
> > down_scaled_stripes offset and the leftmost stripe would be disabled
> > and only the rightmost stripe is used to control the AF coordinate. If
> > the x_start doesn't perform any adjustments, the AF coordinate will be
> > at the wrong place of the sensor since down_scaled_stripes offset
> > would be the new zero of the coordinate system.
> >
> > In this patch, if only the rightmost stripe is used, x_start should
> > minus down_scaled_stripes offset to maintain its correctness of AF
> > scene coordinate.
> >
> > Changes in v2:
> > 1. Remove the setting of the first stripe.
> >
> > Signed-off-by: Kate Hsuan <hpa@redhat.com>
> > ---
> >  drivers/staging/media/ipu3/ipu3-css-params.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/staging/media/ipu3/ipu3-css-params.c b/drivers/staging/media/ipu3/ipu3-css-params.c
> > index d9e3c3785075..5a8c07f34756 100644
> > --- a/drivers/staging/media/ipu3/ipu3-css-params.c
> > +++ b/drivers/staging/media/ipu3/ipu3-css-params.c
> > @@ -2556,6 +2556,10 @@ int imgu_css_cfg_acc(struct imgu_css *css, unsigned int pipe,
> >               /* Enable only for rightmost stripe, disable left */
> >               acc->af.stripes[0].grid_cfg.y_start &=
> >                       ~IPU3_UAPI_GRID_Y_START_EN;
> > +             acc->af.stripes[1].grid_cfg.x_start -=
> > +                     acc->stripe.down_scaled_stripes[1].offset;
> > +             acc->af.stripes[1].grid_cfg.x_end -=
> > +                     acc->stripe.down_scaled_stripes[1].offset;
>
> Could you calculate the values the same way as for the two stripes case, as
> I've been asking since v1?

Sorry for my misunderstanding of the comments.
You mean x_end could be estimated by the width here and could use the
same way as for two stripes case to estimate this.
I'll correct this in my v4 patch. :)

Thank you.

>
> >       } else if (acc->af.config.grid_cfg.x_end <=
> >                  acc->stripe.bds_out_stripes[0].width - min_overlap) {
> >               /* Enable only for leftmost stripe, disable right */
>
> --
> Regards,
>
> Sakari Ailus
>


-- 
BR,
Kate

