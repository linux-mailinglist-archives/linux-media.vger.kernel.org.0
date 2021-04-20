Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B0AE36529B
	for <lists+linux-media@lfdr.de>; Tue, 20 Apr 2021 08:52:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230226AbhDTGwv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Apr 2021 02:52:51 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:59791 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230143AbhDTGwu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Apr 2021 02:52:50 -0400
Received: from mail-ej1-f71.google.com ([209.85.218.71])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lYkF7-0005b0-NE
        for linux-media@vger.kernel.org; Tue, 20 Apr 2021 06:52:17 +0000
Received: by mail-ej1-f71.google.com with SMTP id c18-20020a17090603d2b029037c77ad778eso4386690eja.1
        for <linux-media@vger.kernel.org>; Mon, 19 Apr 2021 23:52:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j1PGlFqGKikJO8z0lD8lXj0af4Bf8i36wqtsVcNsaxY=;
        b=I0uZG0zYfVgC+B2uwVSapwNrKe8At4lj6RY88rH9GbvMvMeB0xZMcQDdfwuEspaush
         JlKjCWVEs4GrUL+Qir02r/SRIeNxEXqsSg355euDNk4HOkNE9O5bPXVGcQiJHsTRq9qx
         i/asFwzkhLJwcHNklcXzOz631zIehN3gIFOXTK2/7LVov8Vqms+oyn5sd0MHXUYoD38z
         U0I9cs6G4+X0Iul0cJ6v3dCO3ZClumjP1Yh/LFhS0o2k35CET4wYdRHgK03AvN94JSbM
         d+om7SZq1kAVlhVolkfv4E/cpdMYyT4y6Hn65JEfwgVkVnYdugdQzhvR+fk95zERFzyH
         DJBg==
X-Gm-Message-State: AOAM532MP+/R2uzsc1m/iIu/mtaFxsYZlbd67LhoD48DfHM9MvOSoBU+
        YHYM+XZTHi37BWvJQp43jbRiKI8+q/S7T1G2svqGbMm0NRtYAfIhCI3yfhimaOfRxVXAn2WmyuK
        mNEM2G51f4gQRxRNdIJdxn/IAa4l6EzC27xGddTPtf/TyhOKCtfjIuJbN
X-Received: by 2002:a17:906:dc92:: with SMTP id cs18mr26604229ejc.27.1618901537484;
        Mon, 19 Apr 2021 23:52:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxPmpfM8eOEJS4rNHtsnpZr74Ds25XYl77S+to6BTJGlDIYnIAMsIXABdzM4aZ2fcwaE9A8kv+s/P3C8NzZfSU=
X-Received: by 2002:a17:906:dc92:: with SMTP id cs18mr26604211ejc.27.1618901537323;
 Mon, 19 Apr 2021 23:52:17 -0700 (PDT)
MIME-Version: 1.0
References: <1618459535-8141-1-git-send-email-dillon.minfei@gmail.com>
 <1618459535-8141-5-git-send-email-dillon.minfei@gmail.com> <CAL9mu0LmZO38CvmRfBMvgJm6310eMY64tgTRw8kWKCPuGJReoA@mail.gmail.com>
In-Reply-To: <CAL9mu0LmZO38CvmRfBMvgJm6310eMY64tgTRw8kWKCPuGJReoA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Date:   Tue, 20 Apr 2021 08:52:06 +0200
Message-ID: <CA+Eumj4M5k50Vv+5tzsY943yp2CVvXFxnf-W0nBf=Bj5M-1AQg@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] media: i2c: ov2659: Use clk_{prepare_enable,disable_unprepare}()
 to set xvclk on/off
To:     dillon min <dillon.minfei@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        krzk@kernel.org, linux@rempel-privat.de, s.riedmueller@phytec.de,
        matthias.schiffer@ew.tq-group.com, leoyang.li@nxp.com,
        arnd@arndb.de, olof@lixom.net,
        Sascha Hauer <s.hauer@pengutronix.de>, kernel@pengutronix.de,
        festevam@gmail.com, prabhakar.csengg@gmail.com, mchehab@kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-imx@nxp.com, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 20 Apr 2021 at 08:46, dillon min <dillon.minfei@gmail.com> wrote:
>
> Hi All,
>
> Just a gentle ping, hope some expert could take a look, thanks.

Don't ping people after 5 days. It's not gentle.

Best regards,
Krzysztof
