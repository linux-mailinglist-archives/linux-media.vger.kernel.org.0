Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD66254D26F
	for <lists+linux-media@lfdr.de>; Wed, 15 Jun 2022 22:23:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235568AbiFOUXk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 16:23:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231317AbiFOUXk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 16:23:40 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 262BF4FC43;
        Wed, 15 Jun 2022 13:23:39 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 25so17772489edw.8;
        Wed, 15 Jun 2022 13:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PXt3RdHLeGINg4yxXorienYktyDgObMjDMbWVl7BWsk=;
        b=KXZ2+v4pB+2qbAYGzjRzDzf5N/FIVRKhj96xYwE1vF5kUN0OtkFe9xaDGtDanFONLy
         hTPZE9BYpcQdjTudH/oFniRh8iBYS/c4UeqaUYPwh2lfS22ODF3u97tyELRsJAEAD6RQ
         XzWUflxaDj9Iu61DuaeDp+azVZ6V13cNbqU61orL81dExdC116TjkX33GuszgTOcEEvU
         GzVSKpsmN9Ed5bYW34e8z5P5bSZUO3hseQ9JF3OB2VQmBTRpr4mRhHHoSIsAF/FCWDuG
         kBQq6IcC9BM5Dg/ILKxnsITQERCqOt1fO9wBv0c6m5vvEQHDWieBkMh2OPDFrT40CG/E
         Gg5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PXt3RdHLeGINg4yxXorienYktyDgObMjDMbWVl7BWsk=;
        b=foRJR4Z5O1Xn5NaUZ+zwvqUnHWCUQAYkiS0+3B4TRJkCcjijeH9VAfd46s8dPgByKC
         VYJW6Ooblfc/0ow9ul+XxiH1QNyDcmUAznibiSnagW0k7vVXhqT0NAI+v19fWOYAiiui
         QDc5i4YAjt6wmXXUMPHujkxZ5Fvd9kcjTjOidas4lEuH7z6xDya0RQ8RcbOtq7woOMCO
         TNqBluKDFjTDpxtKO7fYznyLuVUD5GH5DGxmFPdcVAH0yvCIdW6RBOqQ3gwgVqX1gi39
         9e7Sf97gkb0Q90KO+vYWsPXtaQePvZngDCHinKoMe5UWGEFm3hqFdXcDOEVIb1mgbhgT
         qThQ==
X-Gm-Message-State: AJIora/cw7V1qS/IP5j6UKWX0yqUDarjJxwypp3SSqGju42WvbHKKQ3D
        CZuJaPVI1kc0x2fd8rf+y9YQQHeyGT3pe+KRw8A=
X-Google-Smtp-Source: AGRyM1ttWT68UgN+Rc46Ac5PG1YpNjzWfiePHBmGn7NJyquiZSoFYih8qcY3rjMrbDxNpWSQCqulgS89b6u9UPfVJg8=
X-Received: by 2002:a05:6402:3325:b0:42d:e1d8:99e9 with SMTP id
 e37-20020a056402332500b0042de1d899e9mr1927169eda.87.1655324617605; Wed, 15
 Jun 2022 13:23:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220615104833.3963552-1-windhl@126.com> <Yqm6LvDGqaRMaUHa@kroah.com>
In-Reply-To: <Yqm6LvDGqaRMaUHa@kroah.com>
From:   Dave Airlie <airlied@gmail.com>
Date:   Thu, 16 Jun 2022 06:23:26 +1000
Message-ID: <CAPM=9twCiqyakgPLz0v=7-abUhzLb8ZZH7-U65PV8qtQOP7Xww@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] Re: [PATCH] drivers: tty: serial: Add missing
 of_node_put() in serial-tegra.c
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     heliang <windhl@126.com>, linux-serial@vger.kernel.org,
        linux-tegra@vger.kernel.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>
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

On Wed, 15 Jun 2022 at 20:53, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Wed, Jun 15, 2022 at 06:48:33PM +0800, heliang wrote:
> > In tegra_uart_init(), of_find_matching_node() will return a node
> > pointer with refcount incremented. We should use of_node_put()
> > when it is not used anymore.
> >
> > Signed-off-by: heliang <windhl@126.com>
>
> We need a real name please, one you sign documents with.

How do we enforce that? What if Wong, Adele or Beyonce submit a patch?

What happens if that patch gets reposted, with S-o-b: He Liang
<windhl@126.com> or Hel Iang, Heli Ang? Do you know any of those are
real names? What happens if they post a real name in
Mandarin/Thai/Cyrillic, can you validate it?

Really we require you have an identity attached to an email. If there
is a problem in the future, we'd prefer the email continues to work so
that you are contactable. If you are submitting a small amount of
changes it's probably never going to matter. If you are submitting
larger bodies of work of course it would be good to have a company or
larger org attached to track things down legally later, but again that
isn't always possible.

I don't think alienating the numerous developers who no longer use
their legal names are identified by one name, but haven't changed
their legal one yet people who get married and change their legal name
but don't change their contribution name and I could run this sentence
on forever.

Dave.
