Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE8CF32413D
	for <lists+linux-media@lfdr.de>; Wed, 24 Feb 2021 17:05:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234479AbhBXPom (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Feb 2021 10:44:42 -0500
Received: from mail.kernel.org ([198.145.29.99]:38720 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234663AbhBXOgT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Feb 2021 09:36:19 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5609964EF5;
        Wed, 24 Feb 2021 14:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614177185;
        bh=KZhGj6qe5j0syEVNI++CgqtBRU7J+USl4NFuEWBkjVA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=QyIh+YMCwbpRAINMvFTccX47lNnfNUsdk+zCV4F4Qw9zcXd/+LXdVJfa4W0xKU1aN
         QBOuEuJU1oMCpcTNeWcdgzhXTK0cJIsnG/8M+Ysxdo5BA2HMIcuA/wKjXjLaKu47iI
         iuGobUvyTYJgXpSBwGpvFx7S2SPz9LCiI0qHPf5/WCDMSFdztk6tIkxXYEjY+BokIJ
         LhbUkRWVf/IacrXFj8m0zsf/NTxlTfmRZiwRX7dHTvibWSRJ1UNwIf2S58RGqRW36g
         snd8A6NHQ0IagRboGDJHZjD61tu3EIcyWDrjAoHXTkgjxRQGCLQgVFdPfD/Sfv+TpO
         r5Py3qIDifz4g==
Received: by mail-ed1-f54.google.com with SMTP id cf12so1945784edb.8;
        Wed, 24 Feb 2021 06:33:05 -0800 (PST)
X-Gm-Message-State: AOAM531K4Ayfmq4swkH5i5fGq9OeJ7qJy+8sldlhA+MQ9ZS9J22FExGo
        XRYzBoEWpJzNhz5GoJaiwOFPZj4l4xOGziOlb7I=
X-Google-Smtp-Source: ABdhPJyGdFxiQsQv4scJMUh5ZIZPJ9YHWxjHVyJ9CKEA66GBNayYBVB67ycSuwQRa6mGxkRNruowf8J2XkFZSRs3Z7c=
X-Received: by 2002:a05:6402:1152:: with SMTP id g18mr34147943edw.18.1614177183720;
 Wed, 24 Feb 2021 06:33:03 -0800 (PST)
MIME-Version: 1.0
References: <20210223210127.55455-1-robh@kernel.org>
In-Reply-To: <20210223210127.55455-1-robh@kernel.org>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Wed, 24 Feb 2021 15:32:52 +0100
X-Gmail-Original-Message-ID: <CAJKOXPds-Qh2Hvs2fAvrM59xgTWtYROwocTVuqFaBBd=JYwmow@mail.gmail.com>
Message-ID: <CAJKOXPds-Qh2Hvs2fAvrM59xgTWtYROwocTVuqFaBBd=JYwmow@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: media: Use graph and video-interfaces
 schemas, round 2
To:     Rob Herring <robh@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        "Paul J. Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 23 Feb 2021 at 22:02, Rob Herring <robh@kernel.org> wrote:
>
> A couple of media schemas got applied without using or incorrectly
> using the video-interfaces.yaml and graph.yaml schemas. Fix them up
> before we have more copy-n-paste errors.
>
> Fixes: 41b3e23376e9 ("media: dt-bindings: media: Add bindings for imx334")
> Fixes: d899e5f1db7a ("media: dt-bindings: media: imx258: add bindings for IMX258 sensor")
> Fixes: 918b866edfec ("media: dt-bindings: Remove old ov5647.yaml file, update ovti,ov5647.yaml")
> Fixes: 22f2b47517a6 ("media: dt-bindings: media: i2c: Add OV8865 bindings documentation")
> Fixes: 29a202fa7acc ("media: dt-bindings: media: i2c: Add OV5648 bindings documentation")
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Cc: Jacopo Mondi <jacopo@jmondi.org>
> Cc: "Paul J. Murphy" <paul.j.murphy@intel.com>
> Cc: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> Cc: linux-media@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Please ack and I'll send to Linus for rc1.
>
>  .../devicetree/bindings/media/i2c/imx258.yaml    | 14 +++++++-------

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
