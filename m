Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12E97708DD
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2019 20:48:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730747AbfGVSsA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Jul 2019 14:48:00 -0400
Received: from mail-yw1-f65.google.com ([209.85.161.65]:35980 "EHLO
        mail-yw1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727821AbfGVSsA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Jul 2019 14:48:00 -0400
Received: by mail-yw1-f65.google.com with SMTP id x67so14826907ywd.3;
        Mon, 22 Jul 2019 11:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=lnE336ol7UtWWyvT7pstYIwsA7GlNHlOv0FUk0/J68Y=;
        b=BURfqZq7P/O/sG44ork/tTKY1izQw7U9rjQEfM/z1B77XiJamgEIBCWQ0OxEtHl0s0
         f0y2qGZE6pl91DrsChbghyv2ENPnN7X1qm1HtcQFkywwf+QvYPBPa8TQb7xV9LdsRaKg
         NpZGST16ISEdIFvk7GiT1k4LrvHK1rZJtpMiWsnrYTTvSm9+NsccBRd1fXZ6vxsF0Vwa
         +2FQFcJSgKuB3Fvs5TGUooQ27UgvqUxXes+rpgPNWYuBPu36CFFQHFVPEApr/U16u6JW
         Se0+gfnHFgrmm8PSp/xN9JvirgBNC9Q4JHfiprsPBJb/jNIMYKd9JrIuXe09cIPALkb8
         EAxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=lnE336ol7UtWWyvT7pstYIwsA7GlNHlOv0FUk0/J68Y=;
        b=pKF/Occ3sBX500ZDAxVJ1VScfLrvt5s12EFmTlrhNrxoUwEm7meargCKsVBaGYi3rL
         Zs44iwtSB7TB7zmCIsf78quI1ehXXQfezGwYlWIPoZrTYWAQaWM/C2e7+t2UDRF5Q4B6
         SRDOw4D3fBM8TFZYhDhIMC/fHWxaPlvJVMa09W8kzxiCbgrQ+eJPpVdIupKoqTVrzlhs
         O5xjED5cvBiccdEaRuBn95vsNpu1HyRE90CJlP7WpW/By+HRobUCqBLrsREiHsiMrHzV
         nNtr33stOH0GARfvn7berRYzVxVSJdhWgCbPxAAmVlDLJJ0d5JNrNUPfFfkQZJOQVdAO
         mD0Q==
X-Gm-Message-State: APjAAAV3ZVq4+eNH2mqE5Xl4HAD8T4fdxByJq/7xgPxIj5DLwEyp7Qoj
        zI4CYEnW5pKIKcEPznMJpQac6Tv8QID8L5mzv0s=
X-Google-Smtp-Source: APXvYqx/tuXnxs2Gu9sEhEFXA6paSQTqA/Ul5WtWTjJWRdhdJzhu+zXmbi8TUw0r6bbvPPDpILKJ8v+oDhe9S7MbBtw=
X-Received: by 2002:a81:5957:: with SMTP id n84mr41206570ywb.234.1563821278770;
 Mon, 22 Jul 2019 11:47:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190607231100.5894-1-peron.clem@gmail.com>
In-Reply-To: <20190607231100.5894-1-peron.clem@gmail.com>
From:   =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date:   Mon, 22 Jul 2019 20:48:47 +0200
Message-ID: <CAJiuCcetkGEpD_BrOvipi3yhy_TWgFYSVuLoExcw5=7nyPhY7A@mail.gmail.com>
Subject: Re: [PATCH v5 00/13] Allwinner A64/H6 IR support
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     devicetree <devicetree@vger.kernel.org>,
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

Hi,

This series received ack from device-tree, media and sunxi maintainers.

Can patch 2/3/4 goes to linux-media and the rest to linux-sunxi ?

Thanks,
Cl=C3=A9ment

On Sat, 8 Jun 2019 at 01:11, Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>=
 wrote:
>
> Hi,
>
> A64 IR support series[1] pointed out that an A31 bindings should be
> introduced.
>
> This series introduce the A31 compatible bindings, then switch it on
> the already existing board.
>
> Finally introduce A64 and H6 support.
>
> I have reenable the other H6 boards IR support as Ondrej solve the issue.
>
> Regards,
> Cl=C3=A9ment
>
> [1] https://lore.kernel.org/patchwork/patch/1031390/#1221464
> [2] https://lkml.org/lkml/2019/5/27/321
> [3] https://patchwork.kernel.org/patch/10975563/
>
> Changes since v4:
>  - Reuse defines for RXSTA bits definition
>
> Changes since v3:
>  - Reenable IR for other H6 boards
>  - Add RXSTA bits definition
>  - Add Sean Young's "Acked-by" tags
>
> Changes since v2:
>  - Disable IR for other H6 boards
>  - Split DTS patch for H3/H5
>  - Introduce IR quirks
>
> Cl=C3=A9ment P=C3=A9ron (11):
>   dt-bindings: media: sunxi-ir: Add A31 compatible
>   media: rc: Introduce sunxi_ir_quirks
>   media: rc: sunxi: Add A31 compatible
>   media: rc: sunxi: Add RXSTA bits definition
>   ARM: dts: sunxi: Prefer A31 bindings for IR
>   ARM: dts: sunxi: Prefer A31 bindings for IR
>   dt-bindings: media: sunxi-ir: Add A64 compatible
>   dt-bindings: media: sunxi-ir: Add H6 compatible
>   arm64: dts: allwinner: h6: Add IR receiver node
>   arm64: dts: allwinner: h6: Enable IR on H6 boards
>   arm64: defconfig: Enable IR SUNXI option
>
> Igors Makejevs (1):
>   arm64: dts: allwinner: a64: Add IR node
>
> Jernej Skrabec (1):
>   arm64: dts: allwinner: a64: Enable IR on Orange Pi Win
>
>  .../devicetree/bindings/media/sunxi-ir.txt    | 11 ++-
>  arch/arm/boot/dts/sun6i-a31.dtsi              |  2 +-
>  arch/arm/boot/dts/sun8i-a83t.dtsi             |  2 +-
>  arch/arm/boot/dts/sun9i-a80.dtsi              |  2 +-
>  arch/arm/boot/dts/sunxi-h3-h5.dtsi            |  2 +-
>  .../dts/allwinner/sun50i-a64-orangepi-win.dts |  4 +
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 18 ++++
>  .../dts/allwinner/sun50i-h6-beelink-gs1.dts   |  4 +
>  .../dts/allwinner/sun50i-h6-orangepi.dtsi     |  4 +
>  .../boot/dts/allwinner/sun50i-h6-pine-h64.dts |  4 +
>  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  | 19 ++++
>  arch/arm64/configs/defconfig                  |  1 +
>  drivers/media/rc/sunxi-cir.c                  | 88 ++++++++++++++-----
>  13 files changed, 135 insertions(+), 26 deletions(-)
>
> --
> 2.20.1
>
