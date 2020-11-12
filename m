Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 889582B08BD
	for <lists+linux-media@lfdr.de>; Thu, 12 Nov 2020 16:46:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728794AbgKLPqA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Nov 2020 10:46:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:51536 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728750AbgKLPp7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Nov 2020 10:45:59 -0500
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F094B2224A;
        Thu, 12 Nov 2020 15:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605195958;
        bh=uedioChmpjX+rYYatjJTIqC28httXXTj7mTg0k5ibY0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=FWSbf6uwaVU4Xm/6UDHgNU5HBpbAU+X28ap/afQNMZctuC694B3L7U/G/0wz1S9jl
         6ECn2yi38Ym089qRc6Md3Ns5FTL/rLNEW6gkYWa9mpz18sjuEpy1O9TzukIye3UDuX
         Ai+BVrlFmVegSBDJZpQAz5A7ht+2XHrrs2q3jXvg=
Received: by mail-ot1-f49.google.com with SMTP id a15so6004560otf.5;
        Thu, 12 Nov 2020 07:45:57 -0800 (PST)
X-Gm-Message-State: AOAM53322+zMEuBf2Gzcpp3L6UEHDijsqsetc9sLQU5jEYpsZAZi/w/w
        t9ESBzBfWVhVOJn+LdwFjpbJVW4n7ypK0TkG0Q==
X-Google-Smtp-Source: ABdhPJzD+QJuIKJODRkmIOSEt7UHTD9ojZDt9bzfTQpijq/kH6OQ6Bg2UVX/XBm3s05J7Rba7bTOxHXaZgKoJ8c26VM=
X-Received: by 2002:a05:6830:2f8:: with SMTP id r24mr21898398ote.129.1605195957153;
 Thu, 12 Nov 2020 07:45:57 -0800 (PST)
MIME-Version: 1.0
References: <20201112115646.2562467-1-linus.walleij@linaro.org>
 <20201112145846.GA3588803@bogus> <CACRpkdbciyjbe6p-ckvXezyVvaExgdq8T2soqAhVPQQpCWmFpA@mail.gmail.com>
In-Reply-To: <CACRpkdbciyjbe6p-ckvXezyVvaExgdq8T2soqAhVPQQpCWmFpA@mail.gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Thu, 12 Nov 2020 09:45:45 -0600
X-Gmail-Original-Message-ID: <CAL_JsqK91Pd=iZhMb8EYHgaMNgxaQ7xpO_9TP_i+Q-i_UTFQPg@mail.gmail.com>
Message-ID: <CAL_JsqK91Pd=iZhMb8EYHgaMNgxaQ7xpO_9TP_i+Q-i_UTFQPg@mail.gmail.com>
Subject: Re: [PATCH 1/2 v4] dt-bindings: leds: Add DT binding for Richtek RT8515
To:     Linus Walleij <linus.walleij@linaro.org>
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

On Thu, Nov 12, 2020 at 9:04 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Thu, Nov 12, 2020 at 3:58 PM Rob Herring <robh@kernel.org> wrote:
>
> > My bot found errors running 'make dt_binding_check' on your patch:
>
> I have a real hard time even testing YAML bindings after updating to the lates
> dtschema, I just get so many errors from all over the tree and then it stops:
>
> make[3]: *** [../Documentation/devicetree/bindings/Makefile:59:
> Documentation/devicetree/bindings/processed-schema-examples.json]

I assume there was some error message more useful before this.

> Error 123
> make[3]: Target '__build' not remade because of errors.
> make[2]: *** [/var/linus/linux-nomadik/Makefile:1364: dt_binding_check] Error 2
> make[2]: Leaving directory '/var/linus/linux-nomadik/build-ux500'
> make[1]: *** [Makefile:185: __sub-make] Error 2
> make[1]: Target 'dt_binding_check' not remade because of errors.
> make[1]: Leaving directory '/var/linus/linux-nomadik'
> make: *** [ux500.mak:573: check-bindings] Error 2
>
> Is it necessary to run on linux-next to test schema/DTS for the moment?

next and rc3 are broken thanks to flexcan changes that should be v5.11
material. next pretty much always has something warning. It's like
maintainers just apply bindings without checking or something. rc2 and
rc1 should be good.

You can see current master and next builds here:

https://gitlab.com/robherring/linux-dt-bindings/-/jobs

You can also use 'make -k' to get all the warnings/errors.

Rob
