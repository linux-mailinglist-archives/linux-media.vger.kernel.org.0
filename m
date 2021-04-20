Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CEFA3652CB
	for <lists+linux-media@lfdr.de>; Tue, 20 Apr 2021 09:03:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230381AbhDTHDr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Apr 2021 03:03:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230340AbhDTHDq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Apr 2021 03:03:46 -0400
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14877C06174A;
        Tue, 20 Apr 2021 00:03:14 -0700 (PDT)
Received: by mail-io1-xd2f.google.com with SMTP id p8so16080971iol.11;
        Tue, 20 Apr 2021 00:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jEWvtlBhIntnzhav5G5MrselwR0xAfYI2wk8gXVRC+A=;
        b=ITeWcJSLe+GZk2elPX/TFR4u8+f72MTLMZoVVux4r4bBu5U3RkELxIdD87uv5JlBaS
         JKvzG76O2lZ1BVbKDTwPyn+Pjp7a5OI79E0dC3VFpsEpzPVOCm5xhtZxjbXVVLnjHoWQ
         F59FpSPugJfmjOW1kV0Y0tl7+org4RhWIjO2r3rQI7H7Vv4S7OxAO2FQ4nkC82nJMGlp
         hU1H/35BaDkyhAsWN5+WZwDaJXuBvEhA+GE97qt7Tbz9hkQmXNtWxBW57CIKjY1yyu6l
         r2oW/27RXFyDhKNh1+iJjSSQrxMo2njYnCS7VgMFeqkA9jaP6ZMWqM24R4B2EY+3YBTl
         6MxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jEWvtlBhIntnzhav5G5MrselwR0xAfYI2wk8gXVRC+A=;
        b=jaAJy6ifjRaAWiByTZ4Nha5jIlh9vUgtkr3z5EOpc2HGLoiRSYYNJPbWmvX7Zpn65u
         reYiGsEtePeBB/Z1GxeJnacAswssRQCZ+Nw4ANDWKeVPasTDN88Ka+MzSM47oAwVOj9f
         KoAQpyzpClbEtvs48+nqqBuH58lB3S7L8mFzGzQhuuMcq6unFwcuqdjiKEM2qa31qISC
         DXgh1z5KwnC9cIKUGtzmfzY0iWHz1pwFsdL9BsEJXDKDKGwCatHKSy4EU+dNvq83iZp8
         pnceqY7jEudpW8gUlGmiPF+49TNv9GwFQpQ6LWPd0fwaFxnS/wksvzxeksoPCSLvySnc
         jjmA==
X-Gm-Message-State: AOAM532T92T1o60FTFQCKGSRJb2W9qxX75rcmDj2ZcuIOyQapOxKl9zB
        tpQulvdj4DoJK5Rd76PN6jqdemqLnl9zqf27smE=
X-Google-Smtp-Source: ABdhPJzZkII1CqYKC7eld4JUICmDx78+DDe9rH1IidbIfouyiSkMp4gyT3A60Ty7ZzopOP7+Ia/aqjFzaGBEHUdbdnY=
X-Received: by 2002:a6b:5907:: with SMTP id n7mr7562820iob.3.1618902193574;
 Tue, 20 Apr 2021 00:03:13 -0700 (PDT)
MIME-Version: 1.0
References: <1618459535-8141-1-git-send-email-dillon.minfei@gmail.com>
 <1618459535-8141-5-git-send-email-dillon.minfei@gmail.com>
 <CAL9mu0LmZO38CvmRfBMvgJm6310eMY64tgTRw8kWKCPuGJReoA@mail.gmail.com> <CA+Eumj4M5k50Vv+5tzsY943yp2CVvXFxnf-W0nBf=Bj5M-1AQg@mail.gmail.com>
In-Reply-To: <CA+Eumj4M5k50Vv+5tzsY943yp2CVvXFxnf-W0nBf=Bj5M-1AQg@mail.gmail.com>
From:   dillon min <dillon.minfei@gmail.com>
Date:   Tue, 20 Apr 2021 15:02:37 +0800
Message-ID: <CAL9mu0+8RekaDTBEaJaK4ZFAbpcZfd3gJQ3=fmmY05n-SkEvPg@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] media: i2c: ov2659: Use clk_{prepare_enable,disable_unprepare}()
 to set xvclk on/off
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
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

On Tue, Apr 20, 2021 at 2:52 PM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On Tue, 20 Apr 2021 at 08:46, dillon min <dillon.minfei@gmail.com> wrote:
> >
> > Hi All,
> >
> > Just a gentle ping, hope some expert could take a look, thanks.
>
> Don't ping people after 5 days. It's not gentle.
Got it, thanks for reminding me.

Best regards,
Dillon
>
> Best regards,
> Krzysztof
