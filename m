Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 451092A7C77
	for <lists+linux-media@lfdr.de>; Thu,  5 Nov 2020 11:57:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726762AbgKEK5U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Nov 2020 05:57:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726996AbgKEK5P (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Nov 2020 05:57:15 -0500
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4091C061A4A
        for <linux-media@vger.kernel.org>; Thu,  5 Nov 2020 02:57:14 -0800 (PST)
Received: by mail-vs1-xe41.google.com with SMTP id b129so526435vsb.1
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2020 02:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NZmePoLLIiaP7pYwZl5Ym7F23h4GkDT/CkXYHiP4lxo=;
        b=sMrO9GRUiQTa3qJHIC5F27I3pHGV5/pX9nBuQ9TmRTxE01Ehxii8CB9TiezKwc2tYJ
         3SHV/Rhxs7BmoKB4aJ9W24W7rjat8dvXU+F20+lfe5dyWM1qwmiRT2/Hz4E+yVMLYnPt
         b7MnO/qq1/9P+on1rkNYRYvwC+wu1WaH12rx3rIlc9KubXnGg8K8RqrwvSVobVT1eBhL
         S5jUjJHcPKtkeDXyshEdMUlmsFSrn0JHuPLo57AVegznV5Ma/kMzEcO9yRsB/eDD9c8G
         VI/lxjTY1cQzy9HDsuMni9iMjRs1YrWj3PYOnqX2Fk0T+EROO60K2racmtEoxOny53Bc
         Vckg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NZmePoLLIiaP7pYwZl5Ym7F23h4GkDT/CkXYHiP4lxo=;
        b=Ej8XMtYHcpceyyMKu0HZT29R1bG/OKdfyjU0cTIedswRIIHnvQgaOJD/6LAoIXjIqv
         1MP1P4e9rLKY+RsT7ozKKaKlF7dNZE2ZHRpY26lt6Rt/OtaLY3YWqHV2uol3+SbSkyyw
         o+gsyydaMn3MmpBI8f0h++8S58WdU4kTSz9Fz+NhrV7IyjB7y6vJIfmRXJ+GRzYQ1k0f
         vrKNN71OGbFGV5NoyKdkjaXVesAObHzXXdJqixU7pFRgYq1W/XXinmthzdRiouF93IhR
         eA6TJQdiZe1VYaj/3OqC0EzlPAQcj/SXnnzvjWRYfpm8w61yiHKGezgV1xQPT3Zy0A6T
         /QQw==
X-Gm-Message-State: AOAM531mU41QBe0u6U+XBpTjK6PjBe/n6mFYGHGp1w8eK8WszGIjxD/n
        kbfl5VPNeFNwGQovbnWjVXbMLalb0LaMcBkhFrBjCQ==
X-Google-Smtp-Source: ABdhPJxaRHBJV2RUrIs2kqpAdWFFr8Yx3RVQqbiDwrHCSiI8zLcVccVJz2D9BrdKdQ25WwGzjdkbJ1OYioX7LFmCPEw=
X-Received: by 2002:a67:310d:: with SMTP id x13mr785780vsx.19.1604573833960;
 Thu, 05 Nov 2020 02:57:13 -0800 (PST)
MIME-Version: 1.0
References: <20201104234427.26477-1-digetx@gmail.com> <CAPDyKFr7qTU2RPhA_ZrbCayoTTNUEno1zdmvmv+8HBe-Owrfeg@mail.gmail.com>
 <20201105100603.skrirm7uke4s2xyl@vireshk-i7> <CAPDyKFoCJt5MBSKBJ8n1OAMdVsWHdwXTx0zFEcZw_F_gQ6Ug0w@mail.gmail.com>
 <20201105104009.oo4dc6a2gdcwduhk@vireshk-i7>
In-Reply-To: <20201105104009.oo4dc6a2gdcwduhk@vireshk-i7>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 5 Nov 2020 11:56:37 +0100
Message-ID: <CAPDyKFpQG98d6foc1U6fp3YEBdZ1vLqY9cmWxpUwXoKgDn+ojQ@mail.gmail.com>
Subject: Re: [PATCH v1 00/30] Introduce core voltage scaling for NVIDIA
 Tegra20/30 SoCs
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Peter Chen <Peter.Chen@nxp.com>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Lee Jones <lee.jones@linaro.org>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        driverdevel <devel@driverdev.osuosl.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        linux-pwm@vger.kernel.org,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 5 Nov 2020 at 11:40, Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 05-11-20, 11:34, Ulf Hansson wrote:
> > I am not objecting about scaling the voltage through a regulator,
> > that's fine to me. However, encoding a power domain as a regulator
> > (even if it may seem like a regulator) isn't. Well, unless Mark Brown
> > has changed his mind about this.
> >
> > In this case, it seems like the regulator supply belongs in the
> > description of the power domain provider.
>
> Okay, I wasn't sure if it is a power domain or a regulator here. Btw,
> how do we identify if it is a power domain or a regulator ?

Good question. It's not a crystal clear line in between them, I think.

A power domain to me, means that some part of a silicon (a group of
controllers or just a single piece, for example) needs some kind of
resource (typically a power rail) to be enabled to be functional, to
start with. If there are operating points involved, that's also a
clear indication to me, that it's not a regular regulator.

Maybe we should try to specify this more exactly in some
documentation, somewhere.

>
> > > In case of Qcom earlier (when we added the performance-state stuff),
> > > the eventual hardware was out of kernel's control and we didn't wanted
> > > (allowed) to model it as a virtual regulator just to pass the votes to
> > > the RPM. And so we did what we did.
> > >
> > > But if the hardware (where the voltage is required to be changed) is
> > > indeed a regulator and is modeled as one, then what Dmitry has done
> > > looks okay. i.e. add a supply in the device's node and microvolt
> > > property in the DT entries.
> >
> > I guess I haven't paid enough attention how power domain regulators
> > are being described then. I was under the impression that the CPUfreq
> > case was a bit specific - and we had legacy bindings to stick with.
> >
> > Can you point me to some other existing examples of where power domain
> > regulators are specified as a regulator in each device's node?
>
> No, I thought it is a regulator here and not a power domain.

Okay, thanks!

Kind regards
Uffe
