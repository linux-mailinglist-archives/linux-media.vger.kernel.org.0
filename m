Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D6222B1B06
	for <lists+linux-media@lfdr.de>; Fri, 13 Nov 2020 13:23:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726443AbgKMMXT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Nov 2020 07:23:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726237AbgKMMXT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Nov 2020 07:23:19 -0500
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC413C0617A6
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2020 04:23:18 -0800 (PST)
Received: by mail-lj1-x242.google.com with SMTP id 11so10459316ljf.2
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2020 04:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dmgC8A97V7x5suiNCMl412lXX/jW6+OasEq3qdC5flo=;
        b=CMSkbrn1HlJPVpVE5iZcjuQxcDUTIWwFuKKqwZXujVWGnXLWK4DDEEfcqYBHCHKfzi
         FFfPZvOMv/MUgqIYJG23Np3juKPHHK2T4rmXPag7QeCU/+MXfIDaygPW5C+Zepp/oPzU
         0qNl56ZhdMPj7FkJ5XebIKjfzqEK9E4LzWbWsGQ4RcM2U6qfkRRuvVkusrKf9Fqe/dr9
         zjNnheFeJxD6WXypSe2B+tSldZUXMSqp06lhbLx5WPbMoz1agRQY9ZsQVlMl3c5UIcCO
         Nm78AqHC5noJoqg5YsYB1rbRcB61vY9SYSokvtSzoEt9w42zVNKzaf+b3Yx50D2QufnQ
         DsLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dmgC8A97V7x5suiNCMl412lXX/jW6+OasEq3qdC5flo=;
        b=jZQ6OKSqR1XjTe8etCexHcyeG+3mooVo34r0kMQzIoPqHJ4Z71NUanynhBLygF50oJ
         CM3gOkOty3+laVX0M/qjk7SUOt3aHuGjak0Od5UnE7TWQYldUwObIqclCUKB0VOmsiKz
         F+Vfy+JB+ZRQes4EDkIIzS4gHFGxculfwgeSxqoocXCP5fb4Bt8MTeVKWpZLcFpIlYM3
         C28TsyNwAzPWhG6wG9hOd+2DCsSlasHC6izNuH3weCWTTTu6ozN6HIr/LVwCZXHu3z3j
         ljH+TMPKA3WtLJFPhqMR6y/DcMS0a8/0+3VyTtHUmFOPcrf+009kcXsbF+nUQYAbIHUx
         YloA==
X-Gm-Message-State: AOAM530M/DRVV5o4AfF8KSUkUqmc8rIPWa1qTkbv9FZ51kVMQJSopbsj
        YNWOSyhZZFmVLIOIwQBe+hH8iIv+Sz8E/X22kUk45g==
X-Google-Smtp-Source: ABdhPJyWNf6qJzeTJtgKr//xb7A2QSRZxAGqltnhtV3A8/WBgSRjeKeRngG5/KcF97gs3wY+HSUr9vPazrCEEPEl6Co=
X-Received: by 2002:a2e:95d2:: with SMTP id y18mr1069890ljh.286.1605270197017;
 Fri, 13 Nov 2020 04:23:17 -0800 (PST)
MIME-Version: 1.0
References: <20201112115646.2562467-1-linus.walleij@linaro.org>
 <20201112145846.GA3588803@bogus> <CACRpkdbciyjbe6p-ckvXezyVvaExgdq8T2soqAhVPQQpCWmFpA@mail.gmail.com>
 <CAL_JsqK91Pd=iZhMb8EYHgaMNgxaQ7xpO_9TP_i+Q-i_UTFQPg@mail.gmail.com> <CAL_JsqKgV6jjW-Z9Ekgy3w0+u8gbCLYJZnu3=nsBV7MBmsZ7rQ@mail.gmail.com>
In-Reply-To: <CAL_JsqKgV6jjW-Z9Ekgy3w0+u8gbCLYJZnu3=nsBV7MBmsZ7rQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 13 Nov 2020 13:23:05 +0100
Message-ID: <CACRpkdZyQZjOotrmD+otPU8VfWYjc_B+FDmbnKY2v1togXCcYw@mail.gmail.com>
Subject: Re: [PATCH 1/2 v4] dt-bindings: leds: Add DT binding for Richtek RT8515
To:     Rob Herring <robh@kernel.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        newbytee@protonmail.com,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, phone-devel@vger.kernel.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Pavel Machek <pavel@ucw.cz>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Nov 12, 2020 at 11:20 PM Rob Herring <robh@kernel.org> wrote:
> On Thu, Nov 12, 2020 at 9:45 AM Rob Herring <robh@kernel.org> wrote:
> > On Thu, Nov 12, 2020 at 9:04 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> > > On Thu, Nov 12, 2020 at 3:58 PM Rob Herring <robh@kernel.org> wrote:
> > >
> > > > My bot found errors running 'make dt_binding_check' on your patch:
> > >
> > > I have a real hard time even testing YAML bindings after updating to the lates
> > > dtschema, I just get so many errors from all over the tree and then it stops:
> > >
> > > make[3]: *** [../Documentation/devicetree/bindings/Makefile:59:
> > > Documentation/devicetree/bindings/processed-schema-examples.json]
> >
> > I assume there was some error message more useful before this.
> >
> > > Error 123
> > > make[3]: Target '__build' not remade because of errors.
> > > make[2]: *** [/var/linus/linux-nomadik/Makefile:1364: dt_binding_check] Error 2
> > > make[2]: Leaving directory '/var/linus/linux-nomadik/build-ux500'
> > > make[1]: *** [Makefile:185: __sub-make] Error 2
> > > make[1]: Target 'dt_binding_check' not remade because of errors.
> > > make[1]: Leaving directory '/var/linus/linux-nomadik'
> > > make: *** [ux500.mak:573: check-bindings] Error 2
> > >
> > > Is it necessary to run on linux-next to test schema/DTS for the moment?
> >
> > next and rc3 are broken thanks to flexcan changes that should be v5.11
> > material. next pretty much always has something warning. It's like
> > maintainers just apply bindings without checking or something. rc2 and
> > rc1 should be good.
>
> Actually, rc1 was not good. I didn't get all the fixes in since armsoc
> changes came in so late.

OK I try to rebase onto -rc2 and see if that solves my problem.

Yours,
Linus Walleij
