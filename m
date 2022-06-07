Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79F75530BA5
	for <lists+linux-media@lfdr.de>; Mon, 23 May 2022 11:03:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231663AbiEWIQv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 May 2022 04:16:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231579AbiEWIQt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 May 2022 04:16:49 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE1BE1E3F1
        for <linux-media@vger.kernel.org>; Mon, 23 May 2022 01:16:47 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id bo5so13018862pfb.4
        for <linux-media@vger.kernel.org>; Mon, 23 May 2022 01:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CbX182+PaKOS3rIhJvYoEDAxaskTGV2vPeWYBDL+1ZE=;
        b=VRzZPQ5+kiXiUBhYSi/ckGBBLwSCl7/KHNoeQHkiKVQhJDyOe6EXcnV6SnkuB+d5KD
         M9Pktzdujfo6HxMMEzR8Ew5K90a4cCfIGt1p7StJdxVtf4LBgJ72H9vIg1SoaED67Ywp
         pnwTMnK2uuCE/2qdlMpY93XH23/yc204UUheY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CbX182+PaKOS3rIhJvYoEDAxaskTGV2vPeWYBDL+1ZE=;
        b=imIiQKve5bPVwA5ixzZl0hveCwVm8ohK61OfdLgnvRAK7M/fdZs21/gM16sfX4WqUU
         ujKgSVWSy52H8x9x7b0iqqSg4bX60QtIY5B+AR3uQ2g0B8zTVmN+fHRkHwbQGZ+jfvVS
         qle/6Vh0yl6oleuLk5ertNyuzZzoOOU7R8ICznlr4i46aTIKC0t9DD7NGGc8dT1Cm8cy
         i/fzLWOulM98HQOVluNm6gmVK7S12nLHHuXKOR3evifNkXMy8EmFXJM+moVTe0fOoiVX
         I67+9uEfbj4kSwmyU+tHZeKlR/9tGDkI2z6RY3dLC07j+qFs/oEgX5jgcKsRz69jOxDL
         DwyA==
X-Gm-Message-State: AOAM531j+vsbfDfQYyHsyQnXMysQD9L0xGKLn2JW5qupG+nfR8Z+CSyu
        Ug/eN636F6iMx3UMAZ69Ydqw9M/okpGK2mZjXj6uJw==
X-Google-Smtp-Source: ABdhPJwilgWdd5JOmzHW3vHjkiIO7ussnrOgCJHTzOvtitXYdEIkzXfCANq8cU/hVXlu4lWW2lhCe+JaTKbnRHlY0ec=
X-Received: by 2002:a05:6a00:1897:b0:518:8bc7:9a82 with SMTP id
 x23-20020a056a00189700b005188bc79a82mr8698566pfh.26.1653293807216; Mon, 23
 May 2022 01:16:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220519075117.1003520-1-tommaso.merciai@amarulasolutions.com> <20220519075117.1003520-5-tommaso.merciai@amarulasolutions.com>
In-Reply-To: <20220519075117.1003520-5-tommaso.merciai@amarulasolutions.com>
From:   Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date:   Mon, 23 May 2022 10:16:36 +0200
Message-ID: <CAOf5uw=Wf0jM_rpY=eLs+phnwEH=5BxZdD-XoHTPdd9SFtGUsQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: rockchip: px30: use rk gpio naming
 convention into reset-gpios
To:     Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
Cc:     linuxfancy@googlegroups.com, linux-amarula@amarulasolutions.com,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi

On Thu, May 19, 2022 at 9:51 AM Tommaso Merciai
<tommaso.merciai@amarulasolutions.com> wrote:
>
> Use rk gpio naming convention into reset-gpios of ov5695 camera
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
> Tested-by: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
> ---
>  arch/arm64/boot/dts/rockchip/px30-evb.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/rockchip/px30-evb.dts b/arch/arm64/boot/dts/rockchip/px30-evb.dts
> index 0d05a1b098bc..07008d84434c 100644
> --- a/arch/arm64/boot/dts/rockchip/px30-evb.dts
> +++ b/arch/arm64/boot/dts/rockchip/px30-evb.dts
> @@ -450,8 +450,8 @@ ov5695: ov5695@36 {
>                 dvdd-supply = <&vcc1v5_dvp>;
>                 dovdd-supply = <&vcc1v8_dvp>;
>                 pinctrl-names = "default";
> -               reset-gpios = <&gpio2 14 GPIO_ACTIVE_LOW>;
>                 pinctrl-0 = <&cif_clkout_m0 &mipi_pdn>;
> +               reset-gpios = <&gpio2 RK_PB6 GPIO_ACTIVE_LOW>;
>

Reviewed-by: Michael Trimarchi <michael@amarulasolutions.com>

>                 port {
>                         ucam_out: endpoint {
> --
> 2.25.1
>


-- 
Michael Nazzareno Trimarchi
Co-Founder & Chief Executive Officer
M. +39 347 913 2170
michael@amarulasolutions.com
__________________________________

Amarula Solutions BV
Joop Geesinkweg 125, 1114 AB, Amsterdam, NL
T. +31 (0)85 111 9172
info@amarulasolutions.com
www.amarulasolutions.com
