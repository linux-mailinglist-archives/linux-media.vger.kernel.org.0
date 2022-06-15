Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE4F254D293
	for <lists+linux-media@lfdr.de>; Wed, 15 Jun 2022 22:31:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346656AbiFOUbA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 16:31:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239653AbiFOUbA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 16:31:00 -0400
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com [IPv6:2001:4860:4864:20::36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A29F544FC
        for <linux-media@vger.kernel.org>; Wed, 15 Jun 2022 13:30:59 -0700 (PDT)
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-100eb6f7782so18040493fac.2
        for <linux-media@vger.kernel.org>; Wed, 15 Jun 2022 13:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CGPPd7PZu9HxKtdoxwqOJ2SMNchnSdrXD0y0lHK5RM0=;
        b=k7lq/649HWyaLEl+V4GP0HGGDcXAP+RhRvBEADeIv7GUFO0qUVrNhFontAKLV3JBvt
         UbDBedGWxkU3gwCqht3eXCQYJ8J23LpA18DaW+kcUUhGDVplOTg4+PKlS7HQFiXKkj5W
         inHbFs70gJ0tCHEGajDCVSbWE2lDopKrg7nBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CGPPd7PZu9HxKtdoxwqOJ2SMNchnSdrXD0y0lHK5RM0=;
        b=RAarKJ2kbXeTjnXgj1Z6gDqJehdT0eVYNE6yx7/uNEThNWfYLFvp1QfHJ060sfC49J
         yGwMxe7Sx0LrM6gbwY0T+0InQUtQ5zARBWrMGJRHd/JLjG8MJtiCkcAT0A451XaBxPMM
         lh/7P8KnL4scPpP7zb0zZIeS1L7v2svrHvbdR4m8f1Du4JYBDbTK0OSfVR1/QuD+L13k
         gaWA0Vp632rmg1Yoq7qUNsBbNb7NJ3QTkzhV4d7du/LKDAmV9aZehDq2Cm0rHhUg4Jb/
         mgTIxsFYBn0FviZ3KR9c3xKahu8ofjwlzLe2NUv9WQG4JFpEo8OIelybcxBXQhsAhd7s
         KCFQ==
X-Gm-Message-State: AJIora+VlYNrlwubuWJDY4dpOgiks5oho4Bok2G3nQbeq7Z/LDOCAuxn
        aAe+azCclCmo25P9yxwpGWvt3yisKRVARHTqNyS74fEtFuo=
X-Google-Smtp-Source: AGRyM1uQi1TMDIgq4wQD38w0gj+e0oSvQLAqdIgjR30ifcAeVJd+TJKWOQNN+zZeiC0VAkmK67zEb03FcFdj9exTByA=
X-Received: by 2002:a05:6870:3053:b0:f3:2997:659a with SMTP id
 u19-20020a056870305300b000f32997659amr876535oau.7.1655325058338; Wed, 15 Jun
 2022 13:30:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220615104833.3963552-1-windhl@126.com> <Yqm6LvDGqaRMaUHa@kroah.com>
 <CAPM=9twCiqyakgPLz0v=7-abUhzLb8ZZH7-U65PV8qtQOP7Xww@mail.gmail.com>
In-Reply-To: <CAPM=9twCiqyakgPLz0v=7-abUhzLb8ZZH7-U65PV8qtQOP7Xww@mail.gmail.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Wed, 15 Jun 2022 22:30:47 +0200
Message-ID: <CAKMK7uG+TeATXctJaXBgSRxpinDdtOhGa+o2CMPaPtO1QyHtJA@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] Re: [PATCH] drivers: tty: serial: Add missing
 of_node_put() in serial-tegra.c
To:     Dave Airlie <airlied@gmail.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-tegra@vger.kernel.org,
        heliang <windhl@126.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-serial@vger.kernel.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 15 Jun 2022 at 22:23, Dave Airlie <airlied@gmail.com> wrote:
>
> On Wed, 15 Jun 2022 at 20:53, Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Wed, Jun 15, 2022 at 06:48:33PM +0800, heliang wrote:
> > > In tegra_uart_init(), of_find_matching_node() will return a node
> > > pointer with refcount incremented. We should use of_node_put()
> > > when it is not used anymore.
> > >
> > > Signed-off-by: heliang <windhl@126.com>
> >
> > We need a real name please, one you sign documents with.
>
> How do we enforce that? What if Wong, Adele or Beyonce submit a patch?
>
> What happens if that patch gets reposted, with S-o-b: He Liang
> <windhl@126.com> or Hel Iang, Heli Ang? Do you know any of those are
> real names? What happens if they post a real name in
> Mandarin/Thai/Cyrillic, can you validate it?
>
> Really we require you have an identity attached to an email. If there
> is a problem in the future, we'd prefer the email continues to work so
> that you are contactable. If you are submitting a small amount of
> changes it's probably never going to matter. If you are submitting
> larger bodies of work of course it would be good to have a company or
> larger org attached to track things down legally later, but again that
> isn't always possible.
>
> I don't think alienating the numerous developers who no longer use
> their legal names are identified by one name, but haven't changed
> their legal one yet people who get married and change their legal name
> but don't change their contribution name and I could run this sentence
> on forever.

Yeah like absolute best case trying to "enforce" this just results in
encouraging people to come up with entirely fake but English looking
names for themselves. Which ... just no.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
