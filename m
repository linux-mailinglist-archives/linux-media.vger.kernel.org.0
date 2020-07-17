Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48F71224578
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 22:57:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726619AbgGQU5d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jul 2020 16:57:33 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:36942 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726492AbgGQU5d (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jul 2020 16:57:33 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4E96471D;
        Fri, 17 Jul 2020 22:57:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1595019450;
        bh=KrWW9UrE75AYkx5HCf9FQsCDNTM8G46KJkgzYPObyTU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KJFvMgCt3Pm8Yy2Pp2XLvmXwG+sjH8HnsG4U9jL7FSdeFf2hYv5iDmypEAFZIjjtg
         BhSbOhdfO2vM3+RjZs1gII40I5AuY2dZmkiK1l63rohy3P9Qyl/RRvU/9qUNkHOnkq
         xfOH3OSNqNsPlm28zcE29tu5W2uu5GdSP+VcRfp4=
Date:   Fri, 17 Jul 2020 23:57:22 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        slongerbeam@gmail.com, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        "moderated list:ARM/STM32 ARCHITECTURE" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH 08/13] dt-bindings: media: ov5640: Remove data-shift
Message-ID: <20200717205722.GJ5961@pendragon.ideasonboard.com>
References: <20200717132859.237120-1-jacopo+renesas@jmondi.org>
 <20200717132859.237120-9-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200717132859.237120-9-jacopo+renesas@jmondi.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

(CC'ing Sakari)

Thank you for the patch.

On Fri, Jul 17, 2020 at 03:28:54PM +0200, Jacopo Mondi wrote:
> The value of the data-shift property solely depend on the selected
> bus width and it's not freely configurable.
> 
> Remove it from the bindings document and update its users accordingly.

Hmmmm that's an interesting one. Sakari, what do you think ?

> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  Documentation/devicetree/bindings/media/i2c/ov5640.yaml | 9 ---------
>  arch/arm/boot/dts/stm32mp157c-ev1.dts                   | 1 -
>  2 files changed, 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ov5640.yaml b/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
> index 5e1662e848bd..ab700a1830aa 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
> @@ -92,12 +92,6 @@ properties:
>                parallel bus.
>              enum: [8, 10]
> 
> -          data-shift:
> -            description: |
> -              Shall be set to <2> for 8 bits parallel bus (lines 9:2 are used) or
> -              <0> for 10 bits parallel bus.
> -            enum: [0, 2]

Should you document in the description of bus-width that data-shift is
implied ?

> -
>            hsync-active:
>              enum: [0, 1]
> 
> @@ -115,7 +109,6 @@ properties:
>              then:
>                  properties:
>                    bus-width: false
> -                  data-shift: false
>                    hsync-active: false
>                    vsync-active: false
>                    pclk-sample: false
> @@ -135,7 +128,6 @@ properties:
>                  - remote-endpoint
>                  - bus-type
>                  - bus-width
> -                - data-shift
>                  - hsync-active
>                  - vsync-active
>                  - pclk-sample
> @@ -204,7 +196,6 @@ examples:
>                      remote-endpoint = <&parallel_from_ov5640>;
>                      bus-type = <5>;
>                      bus-width = <10>;
> -                    data-shift = <0>;
>                      hsync-active = <1>;
>                      vsync-active = <1>;
>                      pclk-sample = <1>;
> diff --git a/arch/arm/boot/dts/stm32mp157c-ev1.dts b/arch/arm/boot/dts/stm32mp157c-ev1.dts
> index 613ede73b65b..96f96202ca63 100644
> --- a/arch/arm/boot/dts/stm32mp157c-ev1.dts
> +++ b/arch/arm/boot/dts/stm32mp157c-ev1.dts
> @@ -192,7 +192,6 @@ ov5640_0: endpoint {
>  				remote-endpoint = <&dcmi_0>;
>  				bus-type = <5>;
>  				bus-width = <8>;
> -				data-shift = <2>; /* lines 9:2 are used */
>  				hsync-active = <0>;
>  				vsync-active = <0>;
>  				pclk-sample = <1>;

-- 
Regards,

Laurent Pinchart
