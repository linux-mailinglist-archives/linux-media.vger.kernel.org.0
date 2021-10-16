Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BB11430335
	for <lists+linux-media@lfdr.de>; Sat, 16 Oct 2021 17:15:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237370AbhJPPRa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 16 Oct 2021 11:17:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237195AbhJPPR3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 16 Oct 2021 11:17:29 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A712FC061765
        for <linux-media@vger.kernel.org>; Sat, 16 Oct 2021 08:15:21 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id e7so11501722pgk.2
        for <linux-media@vger.kernel.org>; Sat, 16 Oct 2021 08:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=54yvKUvR70e1EUwEjIQrkBtCHRmu0YRGTVj0j6VpK3k=;
        b=IysGORiq0W50u0akiTJ9sGN7Z9uuIDcmR686khN26vdHXQFuJn55dgb+npETZ86Uoh
         djy/tOVziUjsSsKRmrcVh3O6JPhchV2oc/0PetyLF3E0f189sqsTWlvfb+7gmXEM9HRn
         nKNZGUYgziwq6GFnJBUW0dl8FEC9IWAc9B3GQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=54yvKUvR70e1EUwEjIQrkBtCHRmu0YRGTVj0j6VpK3k=;
        b=6pb2dJ03l/MdLvxvYk/0Ml6s/pQAfZoB8W/gO1w+y6ji3jZcBMftqFcxZ2rYeJz2Qt
         AuvxxLB6psO9eZE7TumPOw2ngLD4wo72LykfxzfPG6SCfP/kh8uECTbG59mjdo0zmgLZ
         jc0c+M2NXoTry81uLYuXhAa7gBShiRIk/bKRNVftDQwhVrR9mq66A26CaODWhaIt/afS
         a1vgb3W4dCPrWyYswn1w5DLfoDqAS1MnrcR5Q83rR3GgoqEakmSujuQyOLkztuoEe2tm
         LXDtPe7gYWWAwGLJQf/Xrf8lcmQaf3dXaM6KYc9+eQHLB/Q6fn4lJQRCn/aXdzqT4kjk
         ry0A==
X-Gm-Message-State: AOAM533qZ72CBeQjzC2sGN+1zAgeuSIY0yFKi4iyOBm+P0ghe9nr90Z0
        hszjateV3wXTUFz0ZUZShiKoeykdqu/nw9xbygXGlw==
X-Google-Smtp-Source: ABdhPJy/nsmwbNl980n8mO/eYo1HFVH3q5bZkzrm1syD7NgEFUwCZ6QMxfbKqYniPiykBAAfioXb3n3ioZcUYQ8uhes=
X-Received: by 2002:a63:334c:: with SMTP id z73mr14603487pgz.160.1634397320877;
 Sat, 16 Oct 2021 08:15:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210107134101.195426-1-paul.kocialkowski@bootlin.com> <62c3e6bccfb3d8c0ef6190861a8608abff34e885.camel@collabora.com>
In-Reply-To: <62c3e6bccfb3d8c0ef6190861a8608abff34e885.camel@collabora.com>
From:   Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date:   Sat, 16 Oct 2021 17:15:09 +0200
Message-ID: <CAOf5uwkuBYuFaoakiBvPb9eomSDdPWOL01w0=-e4Ud-h8QafbQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] Rockchip PX30 RGA and VPU support
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Jacob Chen <jacob-chen@iotwrt.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Alex Bee <knaerzche@gmail.com>, Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all

On Mon, Jun 21, 2021 at 5:00 AM Ezequiel Garcia <ezequiel@collabora.com> wrote:
>
> Hi Paul,
>
> On Thu, 2021-01-07 at 14:40 +0100, Paul Kocialkowski wrote:
> > This series adds the required bits for RGA and VPU support on the
> > Rockchip PX30 SoC.
> >
>
> Do you plan to resend this series?
>
> Alex recently renamed [1] things so some tweaking will be needed,
> but it shouldn't be complicated.
>
> [1] https://lore.kernel.org/linux-media/20210614213215.99389-1-knaerzche@gmail.com/
>
> It would be great to have support RK3326 and PX30 :)

I can re-spin and test it, but I don't find the whole thread

Michael

>
> Kindly,
> Ezequiel
>
>
>
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip



-- 
Michael Nazzareno Trimarchi
Co-Founder & Chief Executive Officer
M. +39 347 913 2170
michael@amarulasolutions.com
__________________________________

Amarula Solutions BV
Joop Geesinkweg 125, 1114 AB, Amsterdam, NL
T. +31 (0)85 111 9172
info@amarulasolutions.com
www.amarulasolutions.com
