Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CFB81555E
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2019 23:21:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726520AbfEFVVo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 May 2019 17:21:44 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:43436 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726190AbfEFVVo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 May 2019 17:21:44 -0400
Received: by mail-wr1-f65.google.com with SMTP id r4so3874331wro.10
        for <linux-media@vger.kernel.org>; Mon, 06 May 2019 14:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=lXD1mb7om2S9zSCUA/jiD1ctEPtzNRTTy8VLPu0OfRw=;
        b=syVX4TyaME689Dw0tKkFGY20rbG610lj0Rm3K5LktJGE7T/+ESMSmSKsIzfDeuosYU
         q977j/7wfPIUfgZpvosU2dQCPwMGBMcUFhI3KthhCkWenXn7L5bv+OkfL+q0Rmgg6bVo
         Az56nLuZgVpdVx+OSbHG0m/syw8nFZNuNxWQxz4WLW1O4eipAz7hqdqlMhrzbLaMsEtl
         oL+b+s4YXyJLMhURD2YkNKHaPucKed91SuoprlxHxtOlcbCTIEsLaXDkZKiOW9/aBXnJ
         /yV4vvCOPfv0r56ZdraB6Q10oawDAh43GHsuCx4PSDJdOsbOAp19h9lQtk0iXJNUX4mg
         E6bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=lXD1mb7om2S9zSCUA/jiD1ctEPtzNRTTy8VLPu0OfRw=;
        b=AiWIq0x0QQrLBw1WlTiwX91aiUgdMuCsuKROqyVQRC551nQCAKjDEie12OIaSX25KW
         6L3jPhHAyx9U1zrIUCaqshyhJvu5OaGbUnxpz3vcLf4v50voSJGPGn3jg5T+SVIICSO2
         SzIYJAqn2TFQymCQa13pqZYgCyeYTG9KQhQELHAZfeXcfo67wsPMqyu0/Q3oNJmuX561
         l7wGfirvKzc0kPhgYFKc1tGHi/I1ckRocygMjsHyatHdSXEt4pUq/vjEdKNgCi2slJp3
         vxD3umbR56q1K8VPrTbNEU6emI5P2fytkEthL4fbxk2YfY0nhLKKbaCHjdPuX0vSd3zm
         5IRA==
X-Gm-Message-State: APjAAAXOI2cpQztfBEHslvENaloN8k4QwiTy0xAs65e4pLe89HPI5iJr
        Kp9P4j6g+3vV0E+1LY+dOrUKUw==
X-Google-Smtp-Source: APXvYqxvtkFmVw9sccOwXJvJqiWW6aZLJWCZFpwJpRBZ4wEHIWyOMEc1v8PxFZSE0AUQ33UqZz112w==
X-Received: by 2002:a5d:464f:: with SMTP id j15mr1750213wrs.265.1557177702531;
        Mon, 06 May 2019 14:21:42 -0700 (PDT)
Received: from arch-late (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id 10sm13794829wmn.4.2019.05.06.14.21.41
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 May 2019 14:21:41 -0700 (PDT)
References: <20190504144027.31920-1-festevam@gmail.com> <20190504144027.31920-6-festevam@gmail.com>
User-agent: mu4e 1.2.0; emacs 27.0.50
From:   Rui Miguel Silva <rui.silva@linaro.org>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     hverkuil-cisco@xs4all.nl, slongerbeam@gmail.com,
        p.zabel@pengutronix.de, linux-media@vger.kernel.org,
        sebastien.szymanski@armadeus.com, otavio@ossystems.com.br,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/8] media: dt-bindings: imx7-csi: Document a single CSI clock
In-reply-to: <20190504144027.31920-6-festevam@gmail.com>
Date:   Mon, 06 May 2019 22:21:40 +0100
Message-ID: <m3ef5b5lej.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Oi Fabio,
On Sat 04 May 2019 at 15:40, Fabio Estevam wrote:
> As per the i.MX7D Reference Manual only the MCLK is used for
> the CSI block, so only document this single clock.
>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

You missed to add a cover-letter to the series, but I have tested
it and reviewed on top of Steve series [0] and everything looks good.

Thanks for fixes.

For the all series:
Tested-by: Rui Miguel Silva <rmfrfs@gmail.com>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>

---
Cheers,
	Rui

[0]: https://lore.kernel.org/linux-media/20190503224326.21039-1-slongerbeam@gmail.com/

> ---
>  Documentation/devicetree/bindings/media/imx7-csi.txt | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/media/imx7-csi.txt b/Documentation/devicetree/bindings/media/imx7-csi.txt
> index 3c07bc676bc3..443aef07356e 100644
> --- a/Documentation/devicetree/bindings/media/imx7-csi.txt
> +++ b/Documentation/devicetree/bindings/media/imx7-csi.txt
> @@ -14,8 +14,7 @@ Required properties:
>  - interrupts    : should contain CSI interrupt;
>  - clocks        : list of clock specifiers, see
>          Documentation/devicetree/bindings/clock/clock-bindings.txt for details;
> -- clock-names   : must contain "axi", "mclk" and "dcic" entries, matching
> -                 entries in the clock property;
> +- clock-names   : must contain "mclk";
>  
>  The device node shall contain one 'port' child node with one child 'endpoint'
>  node, according to the bindings defined in:
> @@ -32,10 +31,8 @@ example:
>                          compatible = "fsl,imx7-csi";
>                          reg = <0x30710000 0x10000>;
>                          interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> -                        clocks = <&clks IMX7D_CLK_DUMMY>,
> -                                        <&clks IMX7D_CSI_MCLK_ROOT_CLK>,
> -                                        <&clks IMX7D_CLK_DUMMY>;
> -                        clock-names = "axi", "mclk", "dcic";
> +                        clocks = <&clks IMX7D_CSI_MCLK_ROOT_CLK>;
> +                        clock-names = "mclk";
>  
>                          port {
>                                  csi_from_csi_mux: endpoint {

