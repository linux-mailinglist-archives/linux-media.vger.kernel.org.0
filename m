Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B3271F9203
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 10:44:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729027AbgFOIoz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Jun 2020 04:44:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728603AbgFOIoy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Jun 2020 04:44:54 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CBCEC061A0E;
        Mon, 15 Jun 2020 01:44:54 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id k1so6426365pls.2;
        Mon, 15 Jun 2020 01:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=myvNnjze95Yl2SyKV+SrVEtGJL4UPmr2kTdonMuTSII=;
        b=oISdFcYSOQZNDKsKZuBBTK+7unBXRFo+muI/V1jUc3IfXu3i7HmaqO+k2IqsjChblm
         xgKiEbr3IRoIzbdmFXzO62cdT0AcUo8LzLRd9WnCoWE6FHTzuNLG7QGW7lZhlFvAult6
         EzBIfeZUJ++8H4GKeNlQyAF4m6xYscy67qYLE+kusDfC+LzuidKlXdhA9dhO628EK/hz
         04ZRl2osW+mN5jz0r4gS127mX2uebX/qvvkk7ZfpQhhMuRnl/Ty9lhAqMuOCJjpDlGG5
         83xoWWLOVAdS22ZZGIOqmu9Y2ghUHftTcHtA2Ic0x0tSeLjpcMcq/I29llSpScOOtdlm
         a2Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=myvNnjze95Yl2SyKV+SrVEtGJL4UPmr2kTdonMuTSII=;
        b=Y2kIFY6BwBxzW3TFPYRHLE/3+3OT8NBp9RYl54rjhWMI8ck7NkjctV40rvV1neEUpi
         tprROxDyPxIUmo7Cj80H0bBXZMSEVCg3BB5foNVFrCy/GhsbVORxKS4rq2BJlsKYVJ0u
         ChL+X49kNbOWlsb/Lbvi8SUywgNkk8rwnFPYXCuEHY4qio6R8OEVTgcD+iIbRDMqQktF
         CDzhbNKqN1EB+OFK44w3m2uyuY1tkztVcq8X1ilwpB1h/z8FbEOtg439uV9jfy/tWZVo
         8VPS6aCS5Bpu4CwzdL4kGuBs88cAotujrX+0tNOHPlCAdJaUvyS+0uZ0MbcQXPZtdEBG
         0nag==
X-Gm-Message-State: AOAM531pXqAZfsa3cfbkE20VpbNZMezQ4MfRr32CSK6ANn3KW/b6Z9KJ
        u+2UbSGL3ay5iok016N2TWn4gdTGR7zSdaXxoHY=
X-Google-Smtp-Source: ABdhPJzZSVB9+37ZECL2ML/pFpQxuUFxCPGZLcIJ+xzsp2pcKjg11WpH23kGVz5r9pIbWTHuVH/fIRyg3tivNSH3Q30=
X-Received: by 2002:a17:90a:ac05:: with SMTP id o5mr11342618pjq.228.1592210693624;
 Mon, 15 Jun 2020 01:44:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200509080627.23222-1-dongchun.zhu@mediatek.com>
 <20200509080627.23222-3-dongchun.zhu@mediatek.com> <20200521193204.GA14214@chromium.org>
 <1590209415.8804.431.camel@mhfsdcap03> <20200610183600.GI201868@chromium.org>
 <1591954266.8804.646.camel@mhfsdcap03> <CAAFQd5CboZ9aFhUyKPES_2oO_AKAOh3Pg8D+9YpfmzJ8v-yFHw@mail.gmail.com>
 <1592205866.8804.686.camel@mhfsdcap03>
In-Reply-To: <1592205866.8804.686.camel@mhfsdcap03>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 15 Jun 2020 11:44:41 +0300
Message-ID: <CAHp75Ve12f7skOs1iW5U4=meP5-fXRppH=XMST6asQbjxn2OGg@mail.gmail.com>
Subject: Re: [V8, 2/2] media: i2c: ov02a10: Add OV02A10 image sensor driver
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Cao Bing Bu <bingbu.cao@intel.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        Sj Huang <sj.huang@mediatek.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        Louis Kuo <louis.kuo@mediatek.com>,
        =?UTF-8?B?U2hlbmduYW4gV2FuZyAo546L5Zyj55S3KQ==?= 
        <shengnan.wang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jun 15, 2020 at 10:30 AM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
> On Fri, 2020-06-12 at 20:49 +0200, Tomasz Figa wrote:
> > On Fri, Jun 12, 2020 at 11:33 AM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:

...

> > [1] https://www.kernel.org/doc/html/latest/driver-api/gpio/consumer.html#the-active-low-and-open-drain-semantics
> >
>
> Thank you for the sharing.
> If driver only focus on the logical function of GPIO pins,
> 'n_rst_gpio' may need to be renamed back to the 1st version 'rst_gpio'.

Yes, we should not have any of n_* GPIOs, they must be marked as Active Low.

-- 
With Best Regards,
Andy Shevchenko
