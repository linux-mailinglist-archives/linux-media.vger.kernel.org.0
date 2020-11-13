Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0CDB2B1DAB
	for <lists+linux-media@lfdr.de>; Fri, 13 Nov 2020 15:46:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726488AbgKMOqi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Nov 2020 09:46:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726587AbgKMOqh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Nov 2020 09:46:37 -0500
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53D0EC061A48
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2020 06:46:21 -0800 (PST)
Received: by mail-vs1-xe44.google.com with SMTP id u24so5309222vsl.9
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2020 06:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Aa2pPBMOldZH+yQGH0UrveON65rZ08/cb06MQFHGa0E=;
        b=oI7Irk60nS8p8IJ9aebTfBT8tKh0VFGTFn4N+jHvPSrvutUGz4HDN9F2eXGWUFLUJO
         pztkL1zvJJMqmmqAU4axiDuUUDb7ZZEfZv/0TZRBLjwcw3/kbFA/Hx96JgrITvvr02pZ
         P9ohzUknb4wDMFPoki9mO18MI2KcxcBOr1dFLBdisyT0QQlXZ092Oz52zVXzS4AIl6nm
         U8S/pCXL5v33Tp7vs3/soInXrThDoA5cbxXaCLXchnNuLPv28h5iBteaaK6ficGI1j82
         XTk7m3rfU//IdaFvmbs97w3+GVYDzQv+iWKbaHXieTVM3M0QznSjPWGv6+xYuZCuLvZr
         7YfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Aa2pPBMOldZH+yQGH0UrveON65rZ08/cb06MQFHGa0E=;
        b=BcXR8voD/UamWmhKF4CstntT+z5wBJKFCvTGrt2T7F3baHsQZ5+alHK7V9Ujr229OB
         U7hXPrGvjhEVMXZqLFtz79HR5DV+uQhPxaAGDY+gDW9nzRXwP++FMZECOfcWzCIlFd5+
         otBxafhX/cATMhBJfn/MOUIOpSvDrQvnVfq1WJv9OwcFxqIY4C0d+Def/CNQ1EXFoykS
         fgPH+qIhn7gJweEGxDlyICxxgQOiDF2G1XX0d7QgcN9uxIQrENCoLwo+8Ql0gv4xqA6m
         h4MtYeLDAg56li7AWaNGmcLC1o7TkkKVz+KX4O8aNcikLz4IwQmRh0PWSyqnE9LSFWpQ
         esZQ==
X-Gm-Message-State: AOAM532gK6KEvnvo/PfDQ2IgW83Wshl/HBD8Qx7ngJ5ebB86TRq/TguH
        27FzWFpcvxV0Ies5ZkeRWfOebvRoacP9Ji4xe6LOPA==
X-Google-Smtp-Source: ABdhPJwkbgKSdaTWhgIsxWjShz+Kw+ub2606C3A/AwjkR07HCOjuCnqip2AUmLV/UBcfKhNInvgSpQVBCTAIPmGnX5w=
X-Received: by 2002:a67:3256:: with SMTP id y83mr1567875vsy.48.1605278780301;
 Fri, 13 Nov 2020 06:46:20 -0800 (PST)
MIME-Version: 1.0
References: <20201104234427.26477-1-digetx@gmail.com> <CAPDyKFr7qTU2RPhA_ZrbCayoTTNUEno1zdmvmv+8HBe-Owrfeg@mail.gmail.com>
 <cd147ab0-1304-a491-7a56-ee6199c02d32@gmail.com> <2716c195-083a-112f-f1e5-2f6b7152a4b5@gmail.com>
 <CAPDyKFqUMsH9dCZ=OYqfdLt==+-8NjK9n=S5jGGNXZu6Y9q=2w@mail.gmail.com>
 <1f7e90c4-6134-2e2b-4869-5afbda18ead3@gmail.com> <20201112204358.GA1027187@ulmo>
 <25942da9-b527-c0aa-5403-53c9cc34ad93@gmail.com>
In-Reply-To: <25942da9-b527-c0aa-5403-53c9cc34ad93@gmail.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 13 Nov 2020 15:45:43 +0100
Message-ID: <CAPDyKFomk7mw7-wpZFPOfT27CEXuCbzRiBoicH5-k7QF_pphVw@mail.gmail.com>
Subject: Re: [PATCH v1 00/30] Introduce core voltage scaling for NVIDIA
 Tegra20/30 SoCs
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
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
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 12 Nov 2020 at 23:14, Dmitry Osipenko <digetx@gmail.com> wrote:
>
> 12.11.2020 23:43, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >> The difference in comparison to using voltage regulator directly is
> >> minimal, basically the core-supply phandle is replaced is replaced wit=
h
> >> a power-domain phandle in a device tree.
> > These new power-domain handles would have to be added to devices that
> > potentially already have a power-domain handle, right? Isn't that going
> > to cause issues? I vaguely recall that we already have multiple power
> > domains for the XUSB controller and we have to jump through extra hoops
> > to make that work.
>
> I modeled the core PD as a parent of the PMC sub-domains, which
> presumably is a correct way to represent the domains topology.
>
> https://gist.github.com/digetx/dfd92c7f7e0aa6cef20403c4298088d7

That could make sense, it seems.

Anyway, this made me realize that
dev_pm_genpd_set_performance_state(dev) returns -EINVAL, in case the
device's genpd doesn't have the ->set_performance_state() assigned.
This may not be correct. Instead we should likely consider an empty
callback as okay and continue to walk the topology upwards to the
parent domain, etc.

Just wanted to point this out. I intend to post a patch as soon as I
can for this.

[...]

Kind regards
Uffe
