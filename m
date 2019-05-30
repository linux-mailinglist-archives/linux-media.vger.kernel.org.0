Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CCA32FBC2
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2019 14:55:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726285AbfE3MzJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 May 2019 08:55:09 -0400
Received: from gofer.mess.org ([88.97.38.141]:59129 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725919AbfE3MzJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 May 2019 08:55:09 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id B91936031C; Thu, 30 May 2019 13:55:06 +0100 (BST)
Date:   Thu, 30 May 2019 13:55:06 +0100
From:   Sean Young <sean@mess.org>
To:     =?iso-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v3 00/12] Allwinner A64/H6 IR support
Message-ID: <20190530125506.xnnk7tvruxnhqh6a@gofer.mess.org>
References: <20190528161440.27172-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190528161440.27172-1-peron.clem@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, May 28, 2019 at 06:14:28PM +0200, Clément Péron wrote:
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
> I didn't enable the IR on other H6 boards as Ondrej reported an issue
> on his board[2].

For the whole series:

Acked-by: Sean Young <sean@mess.org>

> 
> Regards,
> Clément
> 
> [1] https://lore.kernel.org/patchwork/patch/1031390/#1221464
> [2] https://lkml.org/lkml/2019/5/27/321
> 
> Changes since v2:
>  - Disable IR for other H6 boards
>  - Split DTS patch for H3/H5
>  - Introduce IR quirks
> 
> Changes since v1:
>  - Document reset lines as required since A31
>  - Explain the memory mapping difference in commit log
>  - Fix misspelling "Allwiner" to "Allwinner"
> 
> Clément Péron (10):
>   dt-bindings: media: sunxi-ir: add A31 compatible
>   media: rc: Introduce sunxi_ir_quirks
>   media: rc: sunxi: Add A31 compatible
>   ARM: dts: sunxi: Prefer A31 bindings for IR
>   ARM: dts: sunxi: Prefer A31 bindings for IR
>   dt-bindings: media: sunxi-ir: Add A64 compatible
>   dt-bindings: media: sunxi-ir: Add H6 compatible
>   arm64: dts: allwinner: h6: Add IR receiver node
>   arm64: dts: allwinner: h6: Enable IR on Beelink GS1
>   arm64: defconfig: enable IR SUNXI option
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
>  .../dts/allwinner/sun50i-a64-orangepi-win.dts |  4 ++
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 18 +++++
>  .../dts/allwinner/sun50i-h6-beelink-gs1.dts   |  4 ++
>  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  | 19 +++++
>  arch/arm64/configs/defconfig                  |  1 +
>  drivers/media/rc/sunxi-cir.c                  | 70 +++++++++++++++----
>  11 files changed, 115 insertions(+), 20 deletions(-)
> 
> -- 
> 2.20.1
