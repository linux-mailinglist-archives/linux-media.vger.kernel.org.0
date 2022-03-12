Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7478B4D6DEB
	for <lists+linux-media@lfdr.de>; Sat, 12 Mar 2022 11:08:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231681AbiCLKJu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Mar 2022 05:09:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231656AbiCLKJs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Mar 2022 05:09:48 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFC7021F9D7
        for <linux-media@vger.kernel.org>; Sat, 12 Mar 2022 02:08:43 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id q11so9646729pln.11
        for <linux-media@vger.kernel.org>; Sat, 12 Mar 2022 02:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XBkUs4cDEh7cGme8nvi6DRoD473BuT/65cMNIANA6kg=;
        b=qqrFxDtNPmebmRhEKI/0NjR3h2txIrNZsbHIQyirapsMejHKtBJuUXpC4CuzUQzy+j
         7MBEHl7XyYnB/ef82iHhANzR+4q20BBxcogXCUYB0LsFC2JqEeoLpAOuJkSbCc7cu28A
         clAv2F2t2CE4+vkhZhB2HqFJT32fps1QI2s3zke/fEA4NnOQpHXhxyTrQkzQz40eghSK
         WXbOSfPutXZvev9BDgaJeOCbWG1zRmJc/ipd7eoJDrG0TSjsJ1uZqeGSArOyvOvXWJ6a
         bW333jvmpEJR0qMgLuTAXaqDnWSblgwpmeuc/diJcDQ6PfmJs13o33t1EYAUToYr1Ujj
         7y+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XBkUs4cDEh7cGme8nvi6DRoD473BuT/65cMNIANA6kg=;
        b=3kePSM3VAWtId/mMD401gtZtB2j3I6zccUk37uH8wWR0qzI9+Izam2hkyOW7Vw2Uh+
         ZG0WoUNf+j4HdjNbjcF5ns1TkDnwY73NFphtGEx13FHr4045odl6HCQGH1Wen00S45r8
         7uO0KpVE0v3yGMmf9heqiUG5O7bbPDQLOJAO4aRvFCdR7iFktGl14qeQUYlAOh4GNprc
         DA+ri7F/R2t7Ph5O4X/UdtaoZxkvsI4aOAoIp77SzMYHxW2jkmbK/0Q8A7f5GSD98rzC
         5OI6rOghUb+mfwwfPs1Fq+8iVtFbTq2cgoVfNL/lR7xysS435ZLC2cabw3oGSqQf1Gw8
         dW1Q==
X-Gm-Message-State: AOAM533tbZjkV9a1NUnA+wav6eHKQEX4RnNmi76grGYUrxOPPPIsyVQZ
        SKDGN82KjWKZGhc6r9VmpBYPRN0ToD++5s0TrlDSfQ==
X-Google-Smtp-Source: ABdhPJygr/AMMTAACupNOM2mgpqdZHpcr+uF0kJe3Q4pIdneeG8n+Deg6+8AbstBqDC3C6sQYMJcE3tkSaDCqZi08a8=
X-Received: by 2002:a17:90b:906:b0:1be:e765:882 with SMTP id
 bo6-20020a17090b090600b001bee7650882mr15235648pjb.152.1647079723285; Sat, 12
 Mar 2022 02:08:43 -0800 (PST)
MIME-Version: 1.0
References: <cover.1647006877.git.mchehab@kernel.org> <b1803d005b2f671d238fc8579882a493c173d1ef.1647006877.git.mchehab@kernel.org>
In-Reply-To: <b1803d005b2f671d238fc8579882a493c173d1ef.1647006877.git.mchehab@kernel.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Sat, 12 Mar 2022 11:08:32 +0100
Message-ID: <CAG3jFyvxb5Q+bYu4=SReSku9=LrGD2h_O10W40+0+XsHk1XLJQ@mail.gmail.com>
Subject: Re: [PATCH v2 38/38] drivers: media: platform: move some manufacturer entries
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Heiko Stuebner <heiko@sntech.de>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Maxime Ripard <mripard@kernel.org>,
        Ming Qian <ming.qian@nxp.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-sunxi@lists.linux.dev
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

On Fri, 11 Mar 2022 at 15:10, Mauro Carvalho Chehab <mchehab@kernel.org> wrote:
>
> As there are 4 manufacturer's directories with multiple sources
> (qcom, rockchip, sti and sunxi), move the sources from
> platform/Kconfig to their specific Konfig files.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH v2 00/38] at: https://lore.kernel.org/all/cover.1647006877.git.mchehab@kernel.org/
>
>  drivers/media/platform/Kconfig          | 13 +++----------
>  drivers/media/platform/qcom/Kconfig     |  3 +++
>  drivers/media/platform/rockchip/Kconfig |  3 +++
>  drivers/media/platform/sti/Kconfig      |  5 +++++
>  drivers/media/platform/sunxi/Kconfig    |  2 ++
>  5 files changed, 16 insertions(+), 10 deletions(-)
>  create mode 100644 drivers/media/platform/qcom/Kconfig
>  create mode 100644 drivers/media/platform/rockchip/Kconfig
>  create mode 100644 drivers/media/platform/sti/Kconfig
>
> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> index 527e9f08008b..a3ad25c6a56c 100644
> --- a/drivers/media/platform/Kconfig
> +++ b/drivers/media/platform/Kconfig
> @@ -85,23 +85,16 @@ source "drivers/media/platform/mtk-vpu/Kconfig"
>  source "drivers/media/platform/nxp/Kconfig"
>  source "drivers/media/platform/omap3isp/Kconfig"
>  source "drivers/media/platform/omap/Kconfig"
> -source "drivers/media/platform/qcom/camss/Kconfig"
> -source "drivers/media/platform/qcom/venus/Kconfig"
> +source "drivers/media/platform/qcom/Kconfig"
>  source "drivers/media/platform/renesas/Kconfig"
> -source "drivers/media/platform/rockchip/rga/Kconfig"
> -source "drivers/media/platform/rockchip/rkisp1/Kconfig"
> +source "drivers/media/platform/rockchip/Kconfig"
>  source "drivers/media/platform/s3c-camif/Kconfig"
>  source "drivers/media/platform/s5p-g2d/Kconfig"
>  source "drivers/media/platform/s5p-jpeg/Kconfig"
>  source "drivers/media/platform/s5p-mfc/Kconfig"
> -source "drivers/media/platform/sti/bdisp/Kconfig"
> -source "drivers/media/platform/sti/c8sectpfe/Kconfig"
> -source "drivers/media/platform/sti/delta/Kconfig"
> -source "drivers/media/platform/sti/hva/Kconfig"
> +source "drivers/media/platform/sti/Kconfig"
>  source "drivers/media/platform/stm32/Kconfig"
>  source "drivers/media/platform/sunxi/Kconfig"
> -source "drivers/media/platform/sunxi/sun8i-di/Kconfig"
> -source "drivers/media/platform/sunxi/sun8i-rotate/Kconfig"
>  source "drivers/media/platform/tegra/vde/Kconfig"
>  source "drivers/media/platform/ti-vpe/Kconfig"
>  source "drivers/media/platform/via/Kconfig"
> diff --git a/drivers/media/platform/qcom/Kconfig b/drivers/media/platform/qcom/Kconfig
> new file mode 100644
> index 000000000000..aa2428f641d3
> --- /dev/null
> +++ b/drivers/media/platform/qcom/Kconfig
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +source "drivers/media/platform/qcom/camss/Kconfig"
> +source "drivers/media/platform/qcom/venus/Kconfig"
> diff --git a/drivers/media/platform/rockchip/Kconfig b/drivers/media/platform/rockchip/Kconfig
> new file mode 100644
> index 000000000000..c7ba06388780
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/Kconfig
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +source "drivers/media/platform/rockchip/rga/Kconfig"
> +source "drivers/media/platform/rockchip/rkisp1/Kconfig"
> diff --git a/drivers/media/platform/sti/Kconfig b/drivers/media/platform/sti/Kconfig
> new file mode 100644
> index 000000000000..9fb5e78a92cf
> --- /dev/null
> +++ b/drivers/media/platform/sti/Kconfig
> @@ -0,0 +1,5 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +source "drivers/media/platform/sti/bdisp/Kconfig"
> +source "drivers/media/platform/sti/c8sectpfe/Kconfig"
> +source "drivers/media/platform/sti/delta/Kconfig"
> +source "drivers/media/platform/sti/hva/Kconfig"
> diff --git a/drivers/media/platform/sunxi/Kconfig b/drivers/media/platform/sunxi/Kconfig
> index 7151cc249afa..a10032215b08 100644
> --- a/drivers/media/platform/sunxi/Kconfig
> +++ b/drivers/media/platform/sunxi/Kconfig
> @@ -2,3 +2,5 @@
>
>  source "drivers/media/platform/sunxi/sun4i-csi/Kconfig"
>  source "drivers/media/platform/sunxi/sun6i-csi/Kconfig"
> +source "drivers/media/platform/sunxi/sun8i-di/Kconfig"
> +source "drivers/media/platform/sunxi/sun8i-rotate/Kconfig"
> --
> 2.35.1
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
