Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 579AC4434CF
	for <lists+linux-media@lfdr.de>; Tue,  2 Nov 2021 18:49:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234594AbhKBRv7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Nov 2021 13:51:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231702AbhKBRv6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Nov 2021 13:51:58 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9197C061203
        for <linux-media@vger.kernel.org>; Tue,  2 Nov 2021 10:49:23 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id p17so112856pgj.2
        for <linux-media@vger.kernel.org>; Tue, 02 Nov 2021 10:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h2XMYdRoHkcbxUtG08wNlFVioW7CYEfulfjd5ISyyWQ=;
        b=cxLSS3VCTbis2Ob2NSBVE9NYblYr1jQPquNDa9CA1YUB29D0JPyWCwurlXrZMGtkYC
         Pnpi28bPCr7Zr6lHbPsfzveQKotrsKHnFs2jyhKFQCL6sAZhiAGmhOvU34wzy5TOrzIR
         WWJN2WWSXh+W9krYN1G4TA9SKm6FGF9FaqIcC8yuEyK32UbCSGLiNR7YwjwSeZ6/hARL
         WCbaelkUDowbBZ2lZ9iziaLZZDXVz4TBftzg1V1mlkcWvJu5UIAbitHXFUbpM818SdMh
         hyd2qwEgDZSI/KsDcAJfYx8B3BEE8VjAKklg4CM/NAhust7exfa5TXbSm/+xT2lu9+Zx
         Q7/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h2XMYdRoHkcbxUtG08wNlFVioW7CYEfulfjd5ISyyWQ=;
        b=Vg7oiWAtdphAbbX5HMbtbpZrllXx8EYWySzDavtsPUJh4RB3oNm+0Mb5BOs5gBerfw
         kQY5TTB0Xi0oYWhEohttPoofpHDGZpgjAktIjSksrg4WcNR+2QG0AGPIm2NX1/nSlKjV
         QP66G6GnRA7Od1nNARU38+UB4UVO5F8NVDnnY0tGr9OjM62OZbqGGZzuxCDJd2ph1fNr
         lsyvQurouOP0Ywz5RmZT/Ihz8g+8ehvaZHUKZRGqkRYRJOzi1dI4fUtCmilpoplHttG2
         RZy4GWJEz1Nl3lSHL4IEvSzDU6dqbv8QVtidPp1xGtifktDwTTxyDWcldP+4zGbkDtFH
         ypPA==
X-Gm-Message-State: AOAM533h2kgy4R/aKr6UZKEPKRr0X1IbRtd9roSzFcwDdYZF8Q9co6YJ
        OpCy+eIeLT/kyeSCxNUP2G2tW0HFonTkAGU0qk8kaQ==
X-Google-Smtp-Source: ABdhPJzVxWrf7mCpmmxcxmTe8z6GulID3HLvLl1PM2VnG1/iOdrAGZAFvhIJCSMNAScLDyIUyPM/uDSd9ZJ+xR6nlT0=
X-Received: by 2002:aa7:8149:0:b0:44c:916c:1fdb with SMTP id
 d9-20020aa78149000000b0044c916c1fdbmr38932748pfn.34.1635875363341; Tue, 02
 Nov 2021 10:49:23 -0700 (PDT)
MIME-Version: 1.0
References: <20211023203457.1217821-1-aford173@gmail.com> <20211023203457.1217821-6-aford173@gmail.com>
In-Reply-To: <20211023203457.1217821-6-aford173@gmail.com>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Tue, 2 Nov 2021 10:49:12 -0700
Message-ID: <CAJ+vNU3_mp786BWFmpJ_UAzZXhyy=xOJyUdP4sLGE7zMHmfVxg@mail.gmail.com>
Subject: Re: [RFC V2 5/5] arm64: dts: imx8mm-evk: Enable OV5640 Camera
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-media <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        cstevens@beaconembedded.com,
        Adam Ford-BE <aford@beaconembedded.com>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Device Tree Mailing List <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Oct 23, 2021 at 1:39 PM Adam Ford <aford173@gmail.com> wrote:
>
> The schematic shows support for a camera interface, and the NXP
> kernel shows it is an OV5640.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
> index e033d0257b5a..27217d30b8d8 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
> @@ -239,6 +239,10 @@ ldo6_reg: LDO6 {
>         };
>  };
>
> +&csi {
> +       status = "okay";
> +};
> +
>  &i2c2 {
>         clock-frequency = <400000>;
>         pinctrl-names = "default";
> @@ -287,6 +291,38 @@ pca6416: gpio@20 {
>                 gpio-controller;
>                 #gpio-cells = <2>;
>         };
> +
> +       camera@3c {
> +               compatible = "ovti,ov5640";
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pinctrl_ov5640>;
> +               reg = <0x3c>;
> +               clocks = <&clk IMX8MM_CLK_CLKO1>;
> +               clock-names = "xclk";
> +               assigned-clocks = <&clk IMX8MM_CLK_CLKO1>;
> +               assigned-clock-parents = <&clk IMX8MM_CLK_24M>;
> +               assigned-clock-rates = <24000000>;
> +               powerdown-gpios = <&gpio1 7 GPIO_ACTIVE_HIGH>;
> +               reset-gpios = <&gpio1 6 GPIO_ACTIVE_LOW>;
> +
> +               port {
> +                       /* MIPI CSI-2 bus endpoint */
> +                       ov5640_to_mipi_csi2: endpoint {
> +                               remote-endpoint = <&imx8mm_mipi_csi_in>;
> +                               clock-lanes = <0>;
> +                               data-lanes = <1 2>;
> +                       };
> +               };
> +       };

Adam,

On the imx8mm-evk the ov5640 is on i2c3

Tim
