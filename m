Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C00AC2B6E6
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2019 15:48:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726476AbfE0NsJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 May 2019 09:48:09 -0400
Received: from vps.xff.cz ([195.181.215.36]:50564 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726191AbfE0NsI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 May 2019 09:48:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
        t=1558964885; bh=ustEk4EO9XCG6FHJLRsAPk5OCbRSi/9z1v7hcR+OOgc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=edC5Jqk9FcWLFnpa3bcokUCDAFQwsb+TpIDCCYGdhgfUh1W7oU5Bn2z9Q0GL+F8Kt
         42vTLM8E5qQffspMvcPk6PzjMvdtXIcbSRfGRYIdLtoGA+RizEVkzZa4TRt/L3mxxf
         AJPIdPH7zJyf/4FtMpBuLG2nnV9lRFhnELYl4BC8=
Date:   Mon, 27 May 2019 15:48:05 +0200
From:   =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To:     =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 00/10] Allwinner A64/H6 IR support
Message-ID: <20190527134805.j7t4ffstrnhdml47@core.my.home>
Mail-Followup-To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
References: <20190526222536.10917-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190526222536.10917-1-peron.clem@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Clément,

On Mon, May 27, 2019 at 12:25:26AM +0200, Clément Péron wrote:
> Hi,
> 
> A64 IR support series[1] pointed out that an A31 bindings should be
> introduced.
> 
> This series introduce the A31 compatible bindings, then switch it on
> the already existing board.
> 
> Finally introduce A64 and H6 support.

Does H6 support actually work? I don't see any driver changes and last time
I tried with the exact same bindings, I got RCU stalls shortly after boot.

Enabling/disabling ir node was enough to trigger/stop the RCU stalls on H6.

regards,
	o.

> Regards,
> Clément
> 
> [1] https://lore.kernel.org/patchwork/patch/1031390/#1221464
> 
> Changes since v1:
>  - Document reset lines as required since A31
>  - Explain the memory mapping difference in commit log
>  - Fix misspelling "Allwiner" to "Allwinner"
> 
> Clément Péron (8):
>   dt-bindings: media: sunxi-ir: add A31 compatible
>   media: rc: sunxi: Add A31 compatible
>   ARM: dts: sunxi: prefer A31 instead of A13 for ir
>   dt-bindings: media: sunxi-ir: Add A64 compatible
>   dt-bindings: media: sunxi-ir: Add H6 compatible
>   arm64: dts: allwinner: h6: Add IR receiver node
>   arm64: dts: allwinner: h6: Enable IR on H6 boards
>   arm64: defconfig: enable IR SUNXI option
> 
> Igors Makejevs (1):
>   arm64: dts: allwinner: a64: Add IR node
> 
> Jernej Skrabec (1):
>   arm64: dts: allwinner: a64: Enable IR on Orange Pi Win
> 
>  .../devicetree/bindings/media/sunxi-ir.txt    | 11 +++++++++--
>  arch/arm/boot/dts/sun6i-a31.dtsi              |  2 +-
>  arch/arm/boot/dts/sun8i-a83t.dtsi             |  2 +-
>  arch/arm/boot/dts/sun9i-a80.dtsi              |  2 +-
>  arch/arm/boot/dts/sunxi-h3-h5.dtsi            |  2 +-
>  .../dts/allwinner/sun50i-a64-orangepi-win.dts |  4 ++++
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 18 ++++++++++++++++++
>  .../dts/allwinner/sun50i-h6-beelink-gs1.dts   |  4 ++++
>  .../dts/allwinner/sun50i-h6-orangepi.dtsi     |  4 ++++
>  .../boot/dts/allwinner/sun50i-h6-pine-h64.dts |  4 ++++
>  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  | 19 +++++++++++++++++++
>  arch/arm64/configs/defconfig                  |  1 +
>  drivers/media/rc/sunxi-cir.c                  |  1 +
>  13 files changed, 68 insertions(+), 6 deletions(-)
> 
> -- 
> 2.20.1
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
