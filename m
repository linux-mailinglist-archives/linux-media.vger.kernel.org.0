Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F41D1494A92
	for <lists+linux-media@lfdr.de>; Thu, 20 Jan 2022 10:22:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241341AbiATJW4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jan 2022 04:22:56 -0500
Received: from mail-vk1-f181.google.com ([209.85.221.181]:39519 "EHLO
        mail-vk1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235634AbiATJWz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jan 2022 04:22:55 -0500
Received: by mail-vk1-f181.google.com with SMTP id n14so3191222vkk.6;
        Thu, 20 Jan 2022 01:22:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zVmtoqJWzdyF5qJGjk/lxiClkrenYWP64Dg/UiVX14Y=;
        b=0x9AKXHkWtngQTBJo2+8BZWACrnoko5br9MWaedyL2SNqsqXhNZ4g6C/+Ds0eiLdNk
         h2GTUCynRaPjhDS2qKYyVl2X6urpahBwCfrXVTc5OcIQSDs1NRP9j61l/yskpcrsq9SD
         LXHtFy/kn5ZCdpAdPRMhFqWC3sicSjW10K1Nyr4Sd52KYO4UBZuoW4FYi0FnKvgsCUwI
         j1MmcN/WAjcEMWiHcxOFRWSfTlJKsuDKhvZ7o0TcupW1+WE6f1snQPa+iJk6mxpf4nq2
         xXmYRccpXdhmHK2PqoYBsdS+Q/vYqzEbsW0Tm27MR0LboQR6Ecq3i6Wj+rI/nZfT/hbu
         TcCw==
X-Gm-Message-State: AOAM533bZy9bdBBFlRS1sQR0++dQ8jvTjPo0+VVCstZ9LEUbJYy24iLF
        7a+eFbFDqSekrcApfsaLDT0UTe1ecTB7Mw==
X-Google-Smtp-Source: ABdhPJzPyiuuM2IJcfcLjckz6grH3VkNaO44hQSCBby3Tr/XJlCAN1FrALbcyy5md1Dn2SA+gkA8rg==
X-Received: by 2002:a1f:fcc9:: with SMTP id a192mr14690065vki.1.1642670574814;
        Thu, 20 Jan 2022 01:22:54 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id bj23sm449669vkb.23.2022.01.20.01.22.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jan 2022 01:22:54 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id n15so8134750uaq.5;
        Thu, 20 Jan 2022 01:22:54 -0800 (PST)
X-Received: by 2002:a67:e055:: with SMTP id n21mr311837vsl.57.1642670573960;
 Thu, 20 Jan 2022 01:22:53 -0800 (PST)
MIME-Version: 1.0
References: <20211216163439.139579-1-jacopo+renesas@jmondi.org> <20211216163439.139579-6-jacopo+renesas@jmondi.org>
In-Reply-To: <20211216163439.139579-6-jacopo+renesas@jmondi.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 20 Jan 2022 10:22:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWT=ayU7KmmckY0sCK5UGc34YXUo5ihGT1f5FJ2gq=JLA@mail.gmail.com>
Message-ID: <CAMuHMdWT=ayU7KmmckY0sCK5UGc34YXUo5ihGT1f5FJ2gq=JLA@mail.gmail.com>
Subject: Re: [PATCH v8 5/7] arm64: dts: renesas: eagle: Enable MAX9286
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo, Kieran,

On Thu, Dec 16, 2021 at 5:34 PM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> From: Kieran Bingham <kieran.bingham@ideasonboard.com>
>
> Enable the MAX9286 GMSL deserializer on the Eagle-V3M board.
>
> Connected cameras should be defined in a device-tree overlay or included
> after these definitions.
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> @@ -6,6 +6,8 @@
>   * Copyright (C) 2017 Cogent Embedded, Inc.
>   */
>
> +#include <dt-bindings/gpio/gpio.h>

Already included below.

> +
>  /dts-v1/;
>  #include "r8a77970.dtsi"
>  #include <dt-bindings/gpio/gpio.h>

> @@ -278,6 +285,103 @@ &rwdt {
>         status = "okay";
>  };
>
> +&csi40 {

Moving up...

> +       status = "okay";
> +
> +       ports {
> +               port@0 {
> +                       csi40_in: endpoint {
> +                               clock-lanes = <0>;
> +                               data-lanes = <1 2 3 4>;
> +                               remote-endpoint = <&max9286_out0>;
> +                       };
> +               };
> +       };
> +};
> +
> +&i2c3 {

Moving up...

> +       pinctrl-0 = <&i2c3_pins>;
> +       pinctrl-names = "default";
> +
> +       status = "okay";
> +       clock-frequency = <400000>;
> +
> +       gmsl0: gmsl-deserializer@48 {
> +               compatible = "maxim,max9286";
> +               reg = <0x48>;
> +
> +               maxim,gpio-poc = <0 GPIO_ACTIVE_LOW>;
> +               enable-gpios = <&io_expander 0 GPIO_ACTIVE_HIGH>;
> +
> +               ports {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +
> +                       port@0 {
> +                               reg = <0>;
> +                       };
> +
> +                       port@1 {
> +                               reg = <1>;
> +                       };
> +
> +                       port@2 {
> +                               reg = <2>;
> +                       };
> +
> +                       port@3 {
> +                               reg = <3>;
> +                       };
> +
> +                       port@4 {
> +                               reg = <4>;
> +                               max9286_out0: endpoint {
> +                                       clock-lanes = <0>;
> +                                       data-lanes = <1 2 3 4>;
> +                                       remote-endpoint = <&csi40_in>;
> +                               };
> +                       };
> +               };
> +
> +               i2c-mux {

Should we move i2c-mux before ports, too?

> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +
> +                       i2c@0 {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               reg = <0>;
> +
> +                               status = "disabled";
> +                       };
> +
> +                       i2c@1 {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               reg = <1>;
> +
> +                               status = "disabled";
> +                       };
> +
> +                       i2c@2 {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               reg = <2>;
> +
> +                               status = "disabled";
> +                       };
> +
> +                       i2c@3 {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               reg = <3>;
> +
> +                               status = "disabled";
> +                       };
> +               };
> +       };
> +};
> +

I can fix all of these while applying.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
