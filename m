Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CADD31AE49
	for <lists+linux-media@lfdr.de>; Sat, 13 Feb 2021 23:34:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbhBMWeW convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Sat, 13 Feb 2021 17:34:22 -0500
Received: from gloria.sntech.de ([185.11.138.130]:35464 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229647AbhBMWeV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 Feb 2021 17:34:21 -0500
Received: from p508fc8c7.dip0.t-ipconnect.de ([80.143.200.199] helo=phil.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1lB3Ti-0006HN-Bi; Sat, 13 Feb 2021 23:33:26 +0100
From:   Heiko Stuebner <heiko@sntech.de>
To:     Sebastian Fricke <sebastian.fricke@posteo.net>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        hjc@rock-chips.com, robh+dt@kernel.org,
        linux-media@vger.kernel.org, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        cmuellner@linux.com
Subject: Re: [PATCH 0/6] Support second Image Signal Processor on rk3399
Date:   Sat, 13 Feb 2021 23:33:25 +0100
Message-ID: <7871592.T7Z3S40VBb@phil>
In-Reply-To: <20210213111957.3ocxgcyno6ent4vt@basti-TUXEDO-Book-XA1510>
References: <20210202145632.1263136-1-heiko@sntech.de> <16789691.tv2OnDr8pf@diego> <20210213111957.3ocxgcyno6ent4vt@basti-TUXEDO-Book-XA1510>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="iso-8859-1"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sebastian,

Am Samstag, 13. Februar 2021, 12:19:57 CET schrieb Sebastian Fricke:
> On 11.02.2021 15:42, Heiko Stübner wrote:
> >Am Donnerstag, 11. Februar 2021, 06:25:15 CET schrieb Sebastian Fricke:
> >> On 10.02.2021 12:15, Heiko Stübner wrote:
> >> >Am Freitag, 5. Februar 2021, 15:55:56 CET schrieb Heiko Stübner:
> >> >> I did some tests myself today as well and can confirm your
> >> >> hdmi related finding - at least when plugged in on boot.
> >> >>
> >> >> I tried some combinations of camera vs. hdmi and it seems
> >> >> really only when hdmi is plugged in on boot
> >> >
> >> >as you can see in v2, it should work now even with hdmi
> >> >connected on boot. My patch ignored the grf-clock when
> >> >doing the grf-based init.
> >> >
> >> >All clocks are on during boot and I guess the hdmi-driver
> >> >did disable it after its probe. The phy_power_on functions
> >> >did handle it correctly already, so it was only happening
> >> >with hdmi connected on boot.
> >>
> >> Thank you very much for solving that problem, I've tested the scenarios
> >> described below and it works like a charm. (With your V2)
> >> >
> >> >
> >> >Btw. do you plan on submitting your ov13850 driver
> >> >soonish?
> >>
> >> Actually, I have posted the patch already see here:
> >> https://patchwork.kernel.org/project/linux-media/patch/20210130182313.32903-2-sebastian.fricke@posteo.net/
> >
> >very cool to see
> >
> >> I currently review the requested changes and questions and will soon
> >> post a second version, but I expect quite some time until it is actually
> >> merged.
> >
> >could you Cc me on future versions?
> 
> Sure will do :)

by the way, you could also answer the v2 series with a

Tested-by: Sebastian Fricke <sebastian.fricke@posteo.net>

so we get some coverage :-)

Thanks
Heiko


