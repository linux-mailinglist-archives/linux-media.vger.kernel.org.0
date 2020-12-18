Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13B3C2DE0B1
	for <lists+linux-media@lfdr.de>; Fri, 18 Dec 2020 11:02:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733156AbgLRKAn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Dec 2020 05:00:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:48314 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733012AbgLRKAn (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Dec 2020 05:00:43 -0500
X-Gm-Message-State: AOAM533Q3QTHEi11MgQAX1dLn/tzkyMxR41ESdvSQuXvU3X4ejE84WF5
        pX3qWyGsiGHKWdLDZagQijVL4q4EBGJcI6oyuEk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608285602;
        bh=Yv4ehNWrxhpZcvfC+h8QoKTm11DudEJN27fvhSVn57o=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=WurfVnPrYSZY5vv4EOmWqSNbyP47kxGrj380USxOOKWsCaoN83IVMuNssozp3DWY4
         H7hN79TZaEdh4qpW4k/VZAHAJ54sHE/FGB5f+zfuyf7zY8ekCyH6rd0z6tfmc4L5KH
         RfF3SPasU0TItrvRRm1NqbuFofsUU/z+kqHdjgnZESpIHj+MMHjM/mmzwdGyv84Nqm
         tubA4kz/uxZDfiVB29bSrOcCjO+ITTnCWNglyfw9ZZJcRVkuHdcv7SVAUoK0039Uad
         QJaH8niuZUyG+RU0jgftC7AdCPgZp1tjAgDngMgeYz+N9cTW7qocxoxitWYbaTjMug
         qY6g0peszyqTQ==
X-Google-Smtp-Source: ABdhPJxkDlRRJAF7ZQwc5naGuJKcxES24HLh+ph9YFONqtW/bBULM8erNl5wUccYIOpBpFSPBFu+cizSLRfJRbHTIZs=
X-Received: by 2002:a17:906:9588:: with SMTP id r8mr3170102ejx.148.1608285600737;
 Fri, 18 Dec 2020 02:00:00 -0800 (PST)
MIME-Version: 1.0
References: <20201206172720.9406-1-michael.srba@seznam.cz> <20201207055952.GB14307@pengutronix.de>
 <222f5118-72ac-d291-f8d9-743d5c45c4ea@seznam.cz>
In-Reply-To: <222f5118-72ac-d291-f8d9-743d5c45c4ea@seznam.cz>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Fri, 18 Dec 2020 10:59:48 +0100
X-Gmail-Original-Message-ID: <CAJKOXPeBtCZ35uThAr1=fmK3km_fJNYBDrah-fNapV_E3HDaxg@mail.gmail.com>
Message-ID: <CAJKOXPeBtCZ35uThAr1=fmK3km_fJNYBDrah-fNapV_E3HDaxg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] media: i2c: imx219: add support for specifying clock-frequencies
To:     Michael Srba <Michael.Srba@seznam.cz>
Cc:     Sascha Hauer <s.hauer@pengutronix.de>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 10 Dec 2020 at 21:56, Michael Srba <Michael.Srba@seznam.cz> wrote:
>
> Hi,
>
> sorry for late reply.
>
> I copied this approach from looking at other camera sensor drivers,
> and it seemed less "ugly" to me than using assigned-rates (I will be
> upstreaming required dts changes for Samsung Galaxy A3 (2015), so the
> dts feeling "proper" is important to me).

The clean solution is the assigned-clock properties. It's handled by
the core. Duplicating the same feature to every driver is not
"cleaner", but the opposite - ugly one.

> I however am not qualified to make that decision, so if you believe
> that the assigned-rates approach is cleaner and more suitable for mainline,
> I will try to adjust my internal filter for what is "more proper" :)

More proper is handling stuff in the core, not implementing the same
thing in every driver, one more time. Therefore, the assigned-clock
properties.

Best regards,
Krzysztof
Best regards,
Krzysztof
