Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 029C146C8B4
	for <lists+linux-media@lfdr.de>; Wed,  8 Dec 2021 01:30:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242825AbhLHAeQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Dec 2021 19:34:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbhLHAeN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Dec 2021 19:34:13 -0500
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B79BFC061574
        for <linux-media@vger.kernel.org>; Tue,  7 Dec 2021 16:30:42 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id o4so1664821oia.10
        for <linux-media@vger.kernel.org>; Tue, 07 Dec 2021 16:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Nfzrxbng620nq55va9tM6ci7p9ooL9rZlFRg4+vJocI=;
        b=XyVq5SFNrvOi4TkILERaoNaya5/oARhF1g7bse1eQ30DGYzdyEjXYazTaTvR+Zi/LS
         h/zipq06MtE3fOmvK3hUyIOK5pfNHm+XY3y9ruxiVEQmZMxbANHglVpVEXQsPMqA5nDO
         YplHNbkXiTURZp3f4PylfGreENdjRAuCAiNGV1v+TaYyQgszNb9KV8Q/veZn2iky4V1C
         AcN44GXRBaMhOLngi/KlutgK2wDaTM9DpSFPnQBNV/G+RK+ro1NYTR1OJPOXH4p3GIeh
         j5fk/qQHvSzIRut0kX59Eq3UYkRkqMDOSYVKXiaIZrHjOrOuj2rrx0JBVNiA43QBeO9J
         qOMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Nfzrxbng620nq55va9tM6ci7p9ooL9rZlFRg4+vJocI=;
        b=qzrVglU1ewYyUVD0IqEydnfZtBYYrhPoN7n1+PK+B8stt/JykpU5uI/fn9/c3oKu+p
         Lld0X/zsibctx3sL6oY2S0xazdWIwnQt1TjGRKik2niTVQVbncpsji80DmUFem5bcSQS
         6WhEQOLZuSLg1D9JVwfr5caBwmFoJOxf/xC01kNBtIwUeNt7KH06rK1OoqCUehM5ATyz
         P+GzdagQ10V4NM/2gtxyXKrmudjo/hOi0K9YBgmzjxNm4hR+ZtS1P1QLGwLdUOlzbBKH
         rgmBgnuhhazeppVuQB49BAQw5+A7pL4WSi7dUikLYIsSF8LeZka/NvxlzvpVYRgfHlZ8
         M94Q==
X-Gm-Message-State: AOAM532NEp+a7mppzNZmkgTRwRNDgbE8VkxPMJ5BksoXFXrbElcdaLv1
        bSNYT2iiHPGONLfs1Ozvs7mGqVn4wFjFt4gwI/hlcLqE1w4=
X-Google-Smtp-Source: ABdhPJw9S5TQMu49bJHYKaS5oZkP3xYufwZOfM+nx3Jf5zHddvMejJrdZNbZn2yAn2uQ+EXDKtzbO8g6TUrMN8xcJFA=
X-Received: by 2002:a54:4791:: with SMTP id o17mr8686539oic.114.1638923442094;
 Tue, 07 Dec 2021 16:30:42 -0800 (PST)
MIME-Version: 1.0
References: <20211206131648.1521868-1-hverkuil-cisco@xs4all.nl> <CAHp75VcPhSvQvjA5WBO72Lb5idc6vkkodai_V=YmLWtsz-qg1A@mail.gmail.com>
In-Reply-To: <CAHp75VcPhSvQvjA5WBO72Lb5idc6vkkodai_V=YmLWtsz-qg1A@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 8 Dec 2021 01:30:29 +0100
Message-ID: <CACRpkda2d9j7_HOM1Q1dEsK+U4-4KmbvjvTAEvx2AbxMQtOgFA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] pinctrl: can_sleep and pinctrl_gpio_direction
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Florian Fainelli <f.fainelli@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Dec 7, 2021 at 11:14 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Monday, December 6, 2021, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrot=
e:
>>
>> Hi all,
>>
>> Based on this discussion:
>>
>> https://lore.kernel.org/linux-gpio/CACRpkdb3q4-9O3dHS6QDWnZZ5JJjXWXS9KPv=
wXVaowLMRhcejA@mail.gmail.com/T/#t
>>
>> I propose this RFC series.
>
>
> When I first saw your report I was thinking about actually adding a new c=
allback ->set_direction_atomic()
> and then make pinctrl use it, otherwise like you do, I.e. issue a warning=
 when it=E2=80=99s called in atomic context

The problem is inside of pinctrl core, not in any driver. It takes a
mutex when going over
the GPIO ranges.

I suggested maybe just replacing these mutexes with spinlocks, or RCU.

Yours,
Linus Walleij
