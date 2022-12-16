Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC6C064E9DA
	for <lists+linux-media@lfdr.de>; Fri, 16 Dec 2022 11:59:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230063AbiLPK75 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Dec 2022 05:59:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230371AbiLPK7t (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Dec 2022 05:59:49 -0500
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9447554F7
        for <linux-media@vger.kernel.org>; Fri, 16 Dec 2022 02:59:45 -0800 (PST)
Received: by mail-oi1-x236.google.com with SMTP id e205so1602157oif.11
        for <linux-media@vger.kernel.org>; Fri, 16 Dec 2022 02:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=C/X5f1b3Jd5E8SVV/ERglFPxZyk8fr+L/PokTEbRk3Y=;
        b=zKSRWyyH6dbufGau63jnR/+AbZ1uw0rc6CbAIWPGoncNBLYiur5SDIGqtBkYsDWvx/
         kJLpQHLtJCXyySVVExoj7nuey6U7BRo3gBi/Atr4BcTzfbl8AWOYmGIoh8IjDgnTTjF2
         IIQ6qdi2HqSnB3oOFMqdsQ1q1LUR3yluo/zEkXXhRdm8I5kyprIdXVlFpYqD0U50HkIb
         ORaPFYpMYu4AqdnDcRy1PHM6omb65tyZTeYv9PdAmXByJXpcG3K4AT2Ztury9QwBqIZA
         GUapTjDiFx8rt6U6sLRTBz69KYCTQEj2XpJGRSioOHl1D7EnociSSR1FxtE8wDh+N6kY
         o3wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C/X5f1b3Jd5E8SVV/ERglFPxZyk8fr+L/PokTEbRk3Y=;
        b=LYfmoPgIz3+6AOrF5GmofIobuJGyXVhG0rxj2XWsg908DYamfj0ICmGOvD+z1F79vj
         0V1ZWYD6fiqq1ytB4ySwB1MTdV/7mXtujJ7xyXMeBTqoL2mjlotTN3uY+5EeOXEXtN9H
         Y77cAtaAjCMAU1z+CjoCJFYfTkOqfFlqcjGptRVZPWpUMUcb/arJn36J8VUrQROcIimG
         0XgXpPEwEylIkQ61tXXEKJT2U0nk9y40dwyvDVqiRuCGhceq2p0vdJ+jneZDqIqwaNGj
         5I6TaspydmXN51DOwirg7AiLq/YM8bYph4CiyGb2XBparZrx997D/w1Oi55BoSp2DodN
         dHUQ==
X-Gm-Message-State: ANoB5plQi8l2W/Do+B/COdzWZrAKt8ZKYXIFqoXnc8zytd4KkGb2sZKZ
        Pl1ONoJtTspARVwVTJpIzoA3xzO2BdpEe9mv/N8xVw==
X-Google-Smtp-Source: AA0mqf7lqofw6GNI3Y6Di93mOEjknDpnuUaSQ7N5EQdUyvuNwrTkHlh788t0GM2DeGmmxZm+wcAF6BNG+4L4vwEYLDE=
X-Received: by 2002:a05:6808:1b2b:b0:35e:5a1b:825c with SMTP id
 bx43-20020a0568081b2b00b0035e5a1b825cmr615149oib.155.1671188385246; Fri, 16
 Dec 2022 02:59:45 -0800 (PST)
MIME-Version: 1.0
References: <20221215162905.3960806-1-arnd@kernel.org>
In-Reply-To: <20221215162905.3960806-1-arnd@kernel.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Fri, 16 Dec 2022 11:59:34 +0100
Message-ID: <CAG3jFyun2NhHT_mQjrRvt44Adk_O7UqE49YQNm4_G8wZ5JOskA@mail.gmail.com>
Subject: Re: [PATCH] media: camss: csiphy-3ph: avoid undefined behavior
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Todor Tomov <todor.too@gmail.com>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Arnd Bergmann <arnd@arndb.de>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jonathan Marek <jonathan@marek.ca>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 15 Dec 2022 at 17:29, Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> Marking a case of the switch statement as unreachable means the
> compiler treats it as undefined behavior, which is then caught by
> an objtool warning:
>
> drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.o: warning: objtool: csiphy_lanes_enable() falls through to next function csiphy_lanes_disable()
>
> Instead of simply continuing execution at a random place of the
> driver, print a warning and return from to the caller, which
> makes it possible to understand what happens and avoids the
> warning.
>
> Fixes: 53655d2a0ff2 ("media: camss: csiphy-3ph: add support for SM8250 CSI DPHY")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index 451a4c9b3d30..04baa80494c6 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -429,7 +429,8 @@ static void csiphy_gen2_config_lanes(struct csiphy_device *csiphy,
>                 array_size = ARRAY_SIZE(lane_regs_sm8250[0]);
>                 break;
>         default:
> -               unreachable();
> +               WARN(1, "unknown cspi version\n");
> +               return;
>         }
>
>         for (l = 0; l < 5; l++) {
> --
> 2.35.1
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
