Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D506635A80
	for <lists+linux-media@lfdr.de>; Wed, 23 Nov 2022 11:49:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237279AbiKWKth (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Nov 2022 05:49:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236452AbiKWKtK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Nov 2022 05:49:10 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DD4515F2AF
        for <linux-media@vger.kernel.org>; Wed, 23 Nov 2022 02:35:33 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id l24so11671013edj.8
        for <linux-media@vger.kernel.org>; Wed, 23 Nov 2022 02:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fdk6ayM1Ct66O9yHo4VxrA9gKbs+xznnUkFGTJiMlC0=;
        b=ixd/SW/4mbmK6Eq8U/7u9FDripN0Ee0KDzFNOLNcZkTXpLexIRwydzZqRg+uK2N2Ru
         Dcdxr5iVaE74MXUhXzk1nNzoxluSpStPsJ/g5j/xJskSFfxW5u2r9voPSKtL08AendVN
         3nlEF2kGhoNuamYFmkMBRY1/o/FaI4tEX6WcA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fdk6ayM1Ct66O9yHo4VxrA9gKbs+xznnUkFGTJiMlC0=;
        b=pj1fNTMmF/+jw7bpD+1Cd8FZI143vYFv4ZFL7R/dw4FSgpaMvDU+BLetBzCqf1Z8kC
         pJ6BUx3uOknyzZQvA5L1YJJTTU94QueuY+RS1SVDs4MFykDKPVQQOGGWd06pfapYpXwG
         WswYehjOLiu7j3szwzjWlJdYiWuUDWjR2FP4MCmkVBKQRp+EDSywhRhkOh6dNjjNfv83
         hCZi125W6LcTt3lk5vc/YN9yeVW+76yEMKK7pqjJT5OK6cDe/qc+SVtei6IE/XkMoDWT
         bIPQpEgthUjGdboNWKK7LjwOWkvQzNyn4ttcba1gJ3NwE38xkUCK4GaNRqKDi3acY+Dn
         te8Q==
X-Gm-Message-State: ANoB5pmxs0/qU4fGiceKN7FsSDQ66CxXtmffGbjAU2iMEyiCuAYZ1l/7
        D5vYqmqP0plGZI30PuqdwIZ9Fg==
X-Google-Smtp-Source: AA0mqf74EvznZPyWVMWqJcVg8W8zFDmrOicPF2lAdmAcsc0cuX+YS8xaKiCmanEDyWJxlD9Befz3bw==
X-Received: by 2002:a05:6402:291b:b0:461:60b1:5c6d with SMTP id ee27-20020a056402291b00b0046160b15c6dmr13199766edb.182.1669199720603;
        Wed, 23 Nov 2022 02:35:20 -0800 (PST)
Received: from tom-ThinkPad-T14s-Gen-2i (net-188-217-55-94.cust.vodafonedsl.it. [188.217.55.94])
        by smtp.gmail.com with ESMTPSA id e12-20020a1709062c0c00b0073d7b876621sm7043433ejh.205.2022.11.23.02.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 02:35:19 -0800 (PST)
Date:   Wed, 23 Nov 2022 11:35:17 +0100
From:   Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH resend] media: staging: stkwebcam: Restore
 MEDIA_{USB,CAMERA}_SUPPORT dependencies
Message-ID: <20221123103517.GA2874916@tom-ThinkPad-T14s-Gen-2i>
References: <a50fa46075fb760d8409ff6ea2232b2ddb7a102b.1669046259.git.geert+renesas@glider.be>
 <20221123100831.GE39395@tom-ThinkPad-T14s-Gen-2i>
 <CAMuHMdUW8iKFjDj4fPtWfPvyQ1sjGcAy1Kz5j-osz9F4pdA47Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUW8iKFjDj4fPtWfPvyQ1sjGcAy1Kz5j-osz9F4pdA47Q@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Gaert,

On Wed, Nov 23, 2022 at 11:13:31AM +0100, Geert Uytterhoeven wrote:
> Hi Tommaso,
> 
> On Wed, Nov 23, 2022 at 11:08 AM Tommaso Merciai
> <tommaso.merciai@amarulasolutions.com> wrote:
> > On Mon, Nov 21, 2022 at 04:58:33PM +0100, Geert Uytterhoeven wrote:
> > > By moving support for the USB Syntek DC1125 Camera to staging, the
> > > dependencies on MEDIA_USB_SUPPORT and MEDIA_CAMERA_SUPPORT were lost.
> > >
> > > Fixes: 56280c64ecacc971 ("media: stkwebcam: deprecate driver, move to staging")
> >
> > Patch itself looks good but we have some style issue. Applying this
> > patch I got the following warning from checkpatchl:
> >
> > WARNING: Please use correct Fixes: style 'Fixes: <12 chars of sha1> ("<title line>")' - ie: 'Fixes: 56280c64ecac ("media: stkwebcam: deprecate driver, move to staging")'
> > #10:
> >
> > You have to pass only the first 12 chars of the sha1 commit into Fixes
> > msg:
> >
> > Use:
> >
> >  Fixes: 56280c64ecac ("media: stkwebcam: deprecate driver, move to staging")
> >
> > Instead of:
> >
> >  Fixes: 56280c64ecacc971 ("media: stkwebcam: deprecate driver, move to staging")
> 
> I always use 16 chars, to avoid these becoming ambiguous in a few years.
> 
> Gr{oetje,eeting}s,

Thanks for sharing this info.

Regards,
Tommaso

> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Tommaso Merciai
Embedded Linux Engineer
tommaso.merciai@amarulasolutions.com
__________________________________

Amarula Solutions SRL
Via Le Canevare 30, 31100 Treviso, Veneto, IT
T. +39 042 243 5310
info@amarulasolutions.com
www.amarulasolutions.com
