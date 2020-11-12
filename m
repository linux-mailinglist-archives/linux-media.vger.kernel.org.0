Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AA3C2B114B
	for <lists+linux-media@lfdr.de>; Thu, 12 Nov 2020 23:20:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726278AbgKLWUb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Nov 2020 17:20:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:57020 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725903AbgKLWUb (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Nov 2020 17:20:31 -0500
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E364222227;
        Thu, 12 Nov 2020 22:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605219630;
        bh=9ycpbLumJtS7fHn1k6l+gI/yJqQN0wcgs02cW6LY5sg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=jDNP9TUZeFwJcJ4LobFWuzAjidPEeQaWVbtN4r3n6fWiWpFlbVetd1Pe+x1FenD7Y
         D4/YGeMVE4XMnkokV66jvF5SZNHBs8AQB6XJOxzZphbKHLXqQenQLlsqJ3uCk+BjtO
         QUYzahRgI+1WEk7KUQ7l6UJXeRN8yK01M+HtRfrM=
Received: by mail-oi1-f172.google.com with SMTP id q206so8166527oif.13;
        Thu, 12 Nov 2020 14:20:29 -0800 (PST)
X-Gm-Message-State: AOAM530cRzHjlK6dLitmjn0LzJBtq7pZsD7lTyYlApCSABuyCpCe4Z16
        HG6UiDzCtMiCeUPB/dzMEqrB+ofzfg/PXV+aIg==
X-Google-Smtp-Source: ABdhPJykQD3qpcE/ZfnvlggV9bjwmdiTcLrykvOIRMUDNBDZYb7CyCNuzFq5gPyiG98eoHDwDkRCQDMn1hFIMnid2SA=
X-Received: by 2002:aca:5dc2:: with SMTP id r185mr1327635oib.106.1605219629175;
 Thu, 12 Nov 2020 14:20:29 -0800 (PST)
MIME-Version: 1.0
References: <20201112115646.2562467-1-linus.walleij@linaro.org>
 <20201112145846.GA3588803@bogus> <CACRpkdbciyjbe6p-ckvXezyVvaExgdq8T2soqAhVPQQpCWmFpA@mail.gmail.com>
 <CAL_JsqK91Pd=iZhMb8EYHgaMNgxaQ7xpO_9TP_i+Q-i_UTFQPg@mail.gmail.com>
In-Reply-To: <CAL_JsqK91Pd=iZhMb8EYHgaMNgxaQ7xpO_9TP_i+Q-i_UTFQPg@mail.gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Thu, 12 Nov 2020 16:20:17 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKgV6jjW-Z9Ekgy3w0+u8gbCLYJZnu3=nsBV7MBmsZ7rQ@mail.gmail.com>
Message-ID: <CAL_JsqKgV6jjW-Z9Ekgy3w0+u8gbCLYJZnu3=nsBV7MBmsZ7rQ@mail.gmail.com>
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

On Thu, Nov 12, 2020 at 9:45 AM Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Nov 12, 2020 at 9:04 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> > On Thu, Nov 12, 2020 at 3:58 PM Rob Herring <robh@kernel.org> wrote:
> >
> > > My bot found errors running 'make dt_binding_check' on your patch:
> >
> > I have a real hard time even testing YAML bindings after updating to the lates
> > dtschema, I just get so many errors from all over the tree and then it stops:
> >
> > make[3]: *** [../Documentation/devicetree/bindings/Makefile:59:
> > Documentation/devicetree/bindings/processed-schema-examples.json]
>
> I assume there was some error message more useful before this.
>
> > Error 123
> > make[3]: Target '__build' not remade because of errors.
> > make[2]: *** [/var/linus/linux-nomadik/Makefile:1364: dt_binding_check] Error 2
> > make[2]: Leaving directory '/var/linus/linux-nomadik/build-ux500'
> > make[1]: *** [Makefile:185: __sub-make] Error 2
> > make[1]: Target 'dt_binding_check' not remade because of errors.
> > make[1]: Leaving directory '/var/linus/linux-nomadik'
> > make: *** [ux500.mak:573: check-bindings] Error 2
> >
> > Is it necessary to run on linux-next to test schema/DTS for the moment?
>
> next and rc3 are broken thanks to flexcan changes that should be v5.11
> material. next pretty much always has something warning. It's like
> maintainers just apply bindings without checking or something. rc2 and
> rc1 should be good.

Actually, rc1 was not good. I didn't get all the fixes in since armsoc
changes came in so late.

Rob
