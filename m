Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A03EB23BBD
	for <lists+linux-media@lfdr.de>; Mon, 20 May 2019 17:10:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388012AbfETPKH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 May 2019 11:10:07 -0400
Received: from vps.xff.cz ([195.181.215.36]:54942 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731033AbfETPKH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 May 2019 11:10:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
        t=1558365003; bh=8nCbuBb8AQYXYxa/0A6aE2P2rf6UNECJI6ZQ3RM4O4s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MRX9WqxNodPeHwXsP4QSCQe787L8IZiRWDj4v4DP7Lp8fp5wsoxbbq+5AkoHEN7fl
         /5/RfXuSI0p9l/ZB2m2yZUQ1ncOLA4igNcBYBKvIcskxHYbT/7wrVS/4eSU9mpCkX6
         TY7gnn18kr+fNhSYjct+LUD0IuX88Jl6/DISY0eU=
Date:   Mon, 20 May 2019 17:10:03 +0200
From:   =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To:     Chen-Yu Tsai <wens@kernel.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Yong Deng <yong.deng@magewell.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 0/3] ARM: sun8i: a83t: Support Camera Sensor Interface
 controller
Message-ID: <20190520151003.uklhhak5clxi5zpf@core.my.home>
Mail-Followup-To: Chen-Yu Tsai <wens@kernel.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Yong Deng <yong.deng@magewell.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
References: <20190520150637.23557-1-megous@megous.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190520150637.23557-1-megous@megous.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, May 20, 2019 at 05:06:34PM +0200, verejna wrote:
> From: Ondrej Jirman <megous@megous.com>
> 
> This is a re-send of Chen-Yu's A83T CSI patch series with review tags
> applied and removed address/size cells from csi_in port. Already applied
> patches from v1  were dropped.
> 
> The series is ready to be merged:
> 
>   Patch 1 and 2 via sunxi tree
>   Patch 3 via media tree

Sorry, wrong numbers. 2 is for media tree, 3 is for sunxi, 1 is a dt-bindings
patch, where I'm not sure.

thanks,
	Ondrej

> v2:
> - dropped address/size cells from csi_in port
> - added review tags
> 
> Please take a look and merge.
> 
> Thank you,
> 	Ondrej
> 
> --------------------------
> Original description:
> 
> Hi everyone,
> 
> This series adds support for the camera sensor interface controller
> found on the Allwinner A83T SoC. The controller is similar to the one
> found on  the H3, with the addition of a MIPI CSI-2 interface. However,
> this series only supports parallel and BT.656 interfaces, based on the
> existing driver.
> 
> Patch 1 adds an undocumented clock parent of the CSI MCLK. This was
> found after finding the default value to sometimes work and sometimes
> not, and then comparing against BSP code.
> 
> Patch 2 adds a compatible string for the A83T variant.
> 
> Patch 3 adds support for the A83T variant to the existing sun6i-csi
> driver.
> 
> Patch 4 adds a device node for the controller, as well as commonly
> used pin muxing options.
> 
> Patch 5 adds a pin muxing option for I2C1 on the PE pins, used in
> conjunction with the CSI pins.
> 
> Patch 6 provides an example usage of the CSI controller: the Bananapi M3
> with its camera module attached.
> 
> Please have a look.
> 
> Regards
> ChenYu
> 
> Chen-Yu Tsai (3):
>   dt-bindings: media: sun6i-csi: Add compatible string for A83T variant
>   media: sun6i: Support A83T variant
>   ARM: dts: sun8i: a83t: Add device node for CSI (Camera Sensor
>     Interface)
> 
>  .../devicetree/bindings/media/sun6i-csi.txt   |  1 +
>  arch/arm/boot/dts/sun8i-a83t.dtsi             | 29 +++++++++++++++++++
>  .../platform/sunxi/sun6i-csi/sun6i_csi.c      |  1 +
>  3 files changed, 31 insertions(+)
> 
> -- 
> 2.21.0
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
