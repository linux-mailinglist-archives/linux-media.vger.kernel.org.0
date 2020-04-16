Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3848B1ABD33
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2020 11:47:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504190AbgDPJqy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Apr 2020 05:46:54 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:42084 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2504172AbgDPJqt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Apr 2020 05:46:49 -0400
Received: by mail-ot1-f65.google.com with SMTP id m18so2530127otq.9;
        Thu, 16 Apr 2020 02:46:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RM/nTDzMiJT/jjtvKRl0rtdDn36SiM29khhvLS3Fy9U=;
        b=Xccck0PlJztAKzkOSS8HtUFqxL1IblHjJXccTmztJ0vL0ZAKoUxiptOtLUQQ/47P0X
         FFjXZgHOu+GQ3OUTwKRERci9fnF2M6M4ztzkjQHC+SKl8l948nSFRcIfgUoM5Db9NqVB
         9182lSVlbXYnMtZ2TUe2e3l33hZ/LW+DedQiIIOv636gRoOyskpMDdAOMMtAmr6OIMdY
         GSQWa4IrDsOlh9iopemdCLMrsuqCj2RA84KJj22hOXJTwYPZ3FrYn2j1ma2lWE92w1Dp
         jNY7JyXABwnH7zMbg44B8dP7DUx3rjv4jZYxScLVI3TD1eJwIgBOz3JPKsmtkW3S7wOD
         wJ2w==
X-Gm-Message-State: AGi0PuYF9yaPBC+PfS6B3fT7Dvi90QoRNgOGYna65I3FF73VVWeK9Vtw
        ssmgGtFC3dAoEOeJr8jAm0PDv+xvE61mV88kvYE=
X-Google-Smtp-Source: APiQypIl3DcyhF0BNQx8p7xql+qmz/EnqLfrFLnv69mUOw78OJnDaQgEns2mc5nF+ZGDxENyc+UKCUv1ihzy5/CmGB4=
X-Received: by 2002:a9d:6299:: with SMTP id x25mr20179548otk.107.1587030408635;
 Thu, 16 Apr 2020 02:46:48 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1586946605.git.mchehab+huawei@kernel.org> <221ac8f88034bb55c7029c162c0273eccd6b6480.1586946605.git.mchehab+huawei@kernel.org>
In-Reply-To: <221ac8f88034bb55c7029c162c0273eccd6b6480.1586946605.git.mchehab+huawei@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 16 Apr 2020 11:46:37 +0200
Message-ID: <CAMuHMdXuq0SVUUE3gN5sF2pPaHfhQXX8JsXaR6+qXdnBXVikHg@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] media: move CEC platform drivers to a separate directory
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Guenter Roeck <groeck@chromium.org>,
        Kukjin Kim <kgene@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        Ettore Chimenti <ek5.chimenti@gmail.com>,
        Benson Leung <bleung@chromium.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On Wed, Apr 15, 2020 at 12:32 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
> As CEC support doesn't depend on MEDIA_SUPPORT, let's
> place the platform drivers outside the media menu.

Thanks for your patch!

> As a side effect, instead of depends on PCI, seco driver
> can select it (and DMI).

I don't think that's a good idea, as it suddenly enables selecting all PCI
drivers on platforms that do not have PCI.

    WARNING: unmet direct dependencies detected for PCI
      Depends on [n]: HAVE_PCI [=n]
      Selected by [m]:
      - CEC_SECO [=m] && MEDIA_CEC_SUPPORT [=y] && (X86 || IA64 ||
COMPILE_TEST [=y])

However, it already exposed some bugs that were hidden by PCI=n ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
