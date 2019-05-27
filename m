Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 551132B807
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2019 17:01:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726884AbfE0O7s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 May 2019 10:59:48 -0400
Received: from mail-yb1-f194.google.com ([209.85.219.194]:35135 "EHLO
        mail-yb1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726704AbfE0O7s (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 May 2019 10:59:48 -0400
Received: by mail-yb1-f194.google.com with SMTP id s69so6527315ybi.2;
        Mon, 27 May 2019 07:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=qHKlqaDcjkkJBYjpD6p5oVuBHv3/XDA8/X7EQnB7SeY=;
        b=SXkK6kBCFfbLWyL8ky6jB32sMjtkgipf5iPMaiQvEQlh1c8BE9HZm4zfmahGWPH44f
         BgzQvy+TwIpvXWgH3ugw/56DlzKr2xioHXkSYmaMNcOIsxYv/c7wj8eRXsO4/78DSHE8
         sRbSpiIzqb8EtSXt0ILGkSFa2G/1f+tklT5EtEmLF/mLV7iLgC2dJuDWkQrY9CpCtUfo
         UYHBmslUM1zUJthKMQ0rOkjrZWPwKeZRx+afnk5AhUzamFa1H5zjgiHexTTfDILstfc4
         kmWOoV25LeeJT+d9vifZs0IKB69qUyB6p8rLkqxEr3ovyUQvLprM99ti6xRexUEaqfJG
         Eppg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=qHKlqaDcjkkJBYjpD6p5oVuBHv3/XDA8/X7EQnB7SeY=;
        b=nDaZw123ufapc3Mg6+WUjw7jJ1kRf8y+IAMdL3de17r6uG2TQwe+rZBSHshaVir4PU
         K7aNhqF4mnVZd7sPv3zLkc4q/gJSOsA/tCrS/fo5LEEh8zVCVlP9UDMGxhgKc/KDmPfF
         Vwe4oMBYAAvZ+51mqO4qWlR5XEmU/eDX9tCh6083DSWK8Ta7LRkscwrfR30nfZT0Gc9c
         oKv36EnFxN2A2JSvkOEFhyrqSivTZRykUP1rFTS3WFEb++R/rWyg/M+jAdtOHGhhsuUN
         Hjkxd7UK2NCHpc66alIAWd58obZQ+4LmKfwCX3ZS2ayAQE4B4awKibFeQuTLXncChLVI
         nyJA==
X-Gm-Message-State: APjAAAWpHR2gEUkl8vwSJtUerokPM2FWjp/lGU4E/bsLzR2tFhk4lSls
        Q3RzCUsWOhNyqXMifIdWVRsL2v+dx9So0GJfUQ69N4c/eRYYBA==
X-Google-Smtp-Source: APXvYqzIB91v4uwsl17oRKUKktkU9IRGKO5MyrKYomIW70qShKac/i2k5ZBdNkZTwL9MRRb3bjsZpmhw8fwpTTZ/CKU=
X-Received: by 2002:a25:138a:: with SMTP id 132mr54282750ybt.127.1558969186997;
 Mon, 27 May 2019 07:59:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190526222536.10917-1-peron.clem@gmail.com> <20190527134805.j7t4ffstrnhdml47@core.my.home>
In-Reply-To: <20190527134805.j7t4ffstrnhdml47@core.my.home>
From:   =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date:   Mon, 27 May 2019 16:59:35 +0200
Message-ID: <CAJiuCcdnQa0TArduT4yBbUyd+dOaM0cQ1JcRUQLXLR6s_5e8sA@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] Allwinner A64/H6 IR support
To:     =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ond=C5=99ej,

On Mon, 27 May 2019 at 15:48, Ond=C5=99ej Jirman <megous@megous.com> wrote:
>
> Hi Cl=C3=A9ment,
>
> On Mon, May 27, 2019 at 12:25:26AM +0200, Cl=C3=A9ment P=C3=A9ron wrote:
> > Hi,
> >
> > A64 IR support series[1] pointed out that an A31 bindings should be
> > introduced.
> >
> > This series introduce the A31 compatible bindings, then switch it on
> > the already existing board.
> >
> > Finally introduce A64 and H6 support.
>
> Does H6 support actually work? I don't see any driver changes and last ti=
me
> I tried with the exact same bindings, I got RCU stalls shortly after boot=
.

Actually, I have tested only on H6 on my Beelink GS1 with a "NEC" remote.

I have manually toggle the protocols and do a simple cat in /dev/input/even=
t0
# echo nec > /sys/class/rc/rc0/protocols
# cat /dev/input/event0 | hexdump
0000000 0093 0000 0000 0000 8bfb 0009 0000 0000
0000010 0004 0004 8028 0000 0093 0000 0000 0000
0000020 8bfb 0009 0000 0000 0000 0000 0000 0000
0000030 0093 0000 0000 0000 55be 000a 0000 0000
0000040 0004 0004 8028 0000 0093 0000 0000 0000
0000050 55be 000a 0000 0000 0000 0000 0000 0000
0000060 0093 0000 0000 0000 fa42 000d 0000 0000
0000070 0004 0004 8028 0000 0093 0000 0000 0000
0000080 fa42 000d 0000 0000 0000 0000 0000 0000
0000090 0093 0000 0000 0000 c41a 000e 0000 0000
00000a0 0004 0004 8028 0000 0093 0000 0000 0000
00000b0 c41a 000e 0000 0000 0000 0000 0000 0000


Which kernel did you test with? Do you have any log?

Thanks,
Cl=C3=A9ment

>
> Enabling/disabling ir node was enough to trigger/stop the RCU stalls on H=
6.
>
> regards,
>         o.
>
> > Regards,
> > Cl=C3=A9ment
> >
> > [1] https://lore.kernel.org/patchwork/patch/1031390/#1221464
> >
> > Changes since v1:
> >  - Document reset lines as required since A31
> >  - Explain the memory mapping difference in commit log
> >  - Fix misspelling "Allwiner" to "Allwinner"
> >
> > Cl=C3=A9ment P=C3=A9ron (8):
> >   dt-bindings: media: sunxi-ir: add A31 compatible
> >   media: rc: sunxi: Add A31 compatible
> >   ARM: dts: sunxi: prefer A31 instead of A13 for ir
> >   dt-bindings: media: sunxi-ir: Add A64 compatible
> >   dt-bindings: media: sunxi-ir: Add H6 compatible
> >   arm64: dts: allwinner: h6: Add IR receiver node
> >   arm64: dts: allwinner: h6: Enable IR on H6 boards
> >   arm64: defconfig: enable IR SUNXI option
> >
> > Igors Makejevs (1):
> >   arm64: dts: allwinner: a64: Add IR node
> >
> > Jernej Skrabec (1):
> >   arm64: dts: allwinner: a64: Enable IR on Orange Pi Win
> >
> >  .../devicetree/bindings/media/sunxi-ir.txt    | 11 +++++++++--
> >  arch/arm/boot/dts/sun6i-a31.dtsi              |  2 +-
> >  arch/arm/boot/dts/sun8i-a83t.dtsi             |  2 +-
> >  arch/arm/boot/dts/sun9i-a80.dtsi              |  2 +-
> >  arch/arm/boot/dts/sunxi-h3-h5.dtsi            |  2 +-
> >  .../dts/allwinner/sun50i-a64-orangepi-win.dts |  4 ++++
> >  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 18 ++++++++++++++++++
> >  .../dts/allwinner/sun50i-h6-beelink-gs1.dts   |  4 ++++
> >  .../dts/allwinner/sun50i-h6-orangepi.dtsi     |  4 ++++
> >  .../boot/dts/allwinner/sun50i-h6-pine-h64.dts |  4 ++++
> >  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  | 19 +++++++++++++++++++
> >  arch/arm64/configs/defconfig                  |  1 +
> >  drivers/media/rc/sunxi-cir.c                  |  1 +
> >  13 files changed, 68 insertions(+), 6 deletions(-)
> >
> > --
> > 2.20.1
> >
> >
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
