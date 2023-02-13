Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D278694B6C
	for <lists+linux-media@lfdr.de>; Mon, 13 Feb 2023 16:41:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230072AbjBMPlh convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 13 Feb 2023 10:41:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229711AbjBMPlg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Feb 2023 10:41:36 -0500
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D7E2193C7;
        Mon, 13 Feb 2023 07:41:35 -0800 (PST)
Received: by mail-qt1-f181.google.com with SMTP id c2so14146521qtw.5;
        Mon, 13 Feb 2023 07:41:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QAXl0un9Q75Hp5vYsfngXt1vjexWRaO3bIl6QHN6dhQ=;
        b=CtyBNAPb/aVzyzJE9QIIQRPo/5li9D13/vs2W2u37S8gz07GtnY0Bg1I73+hwwEbnP
         98ERlnrmTh4YKGzn8brT3sEm60oSLAUEC69LQhZGOK59FbDqT4NHKHtI3aMnqARi8BGk
         hVT0N5W4bfd55dHo1sk0su1f9Izfo9caxYHbIvJQ4gc3qSTgDnMeuM+XRjOhm6hUYP/z
         HfdyRq1KhYMSe+HMGAs/k5Uuyswo+unIGAHaLlRsoI7Oxr89fRpX/dLbBMmPeXd28xRq
         Ek1yTAqmm6FyrgrcTEwz65PSwtIpzP0fjnijYRXmy5/PRx/3Zn+dr6fgxi2mAsvZAU2I
         UrdA==
X-Gm-Message-State: AO0yUKUbhzVvmXwUU8DVjskwyplrxMAsDAECPPthin63URnbbqIfnUWy
        /TGzzDqlRMBRbjScFcfmVfLk+HLLcB3jfw==
X-Google-Smtp-Source: AK7set/lH2B1Onh4YsXSAFn2tupnap8TM0NQ9baIKg3kl8ForQaB0jD9M6PXNV4c0uUXKzf++LS82w==
X-Received: by 2002:a05:622a:14ca:b0:3b6:3260:fa1d with SMTP id u10-20020a05622a14ca00b003b63260fa1dmr46855795qtx.45.1676302894526;
        Mon, 13 Feb 2023 07:41:34 -0800 (PST)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id n68-20020a374047000000b0073b4a55a2d1sm1112198qka.124.2023.02.13.07.41.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 07:41:34 -0800 (PST)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-52bed2ce9bdso168095727b3.13;
        Mon, 13 Feb 2023 07:41:34 -0800 (PST)
X-Received: by 2002:a0d:f846:0:b0:4fc:962d:7dc1 with SMTP id
 i67-20020a0df846000000b004fc962d7dc1mr2312501ywf.301.1676302893846; Mon, 13
 Feb 2023 07:41:33 -0800 (PST)
MIME-Version: 1.0
References: <20230211145310.3819989-1-niklas.soderlund+renesas@ragnatech.se> <20230211145310.3819989-2-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20230211145310.3819989-2-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 13 Feb 2023 16:41:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXrBmWzkwm-m2uiNzZn4cXm=_T0pYD6Sp+1WfWMgbuZgw@mail.gmail.com>
Message-ID: <CAMuHMdXrBmWzkwm-m2uiNzZn4cXm=_T0pYD6Sp+1WfWMgbuZgw@mail.gmail.com>
Subject: Re: [PATCH 1/3] media: rcar-csi2: Prepare for Gen4 support
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Sat, Feb 11, 2023 at 4:05 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Prepare the driver for supporting R-Car Gen4. The starting of the
> receiver and how to enter standby differs between Gen3 and Gen4,
> create function pointers in the device info structure to control the
> different behavior.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Thanks for your patch!

> --- a/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c

> @@ -1416,11 +1441,15 @@ static const struct rcar_csi2_info rcar_csi2_info_r8a77980 = {
>  static const struct rcar_csi2_info rcar_csi2_info_r8a77990 = {
>         .init_phtw = rcsi2_init_phtw_v3m_e3,
>         .phy_post_init = rcsi2_phy_post_init_v3m_e3,
> +       .start_receiver = rcsi2_start_receiver_gen3,
> +       .enter_standby = rcsi2_enter_standby_gen3,
>         .num_channels = 2,
>  };
>
>  static const struct rcar_csi2_info rcar_csi2_info_r8a779a0 = {
>         .init_phtw = rcsi2_init_phtw_v3u,
> +       .start_receiver = rcsi2_start_receiver_gen3,
> +       .enter_standby = rcsi2_enter_standby_gen3,

This part means R-Car V3U is still treated like other R-Car Gen3 SoCs,
not like R-Car Gen4.  Just double-checking if that is intentional?

>         .hsfreqrange = hsfreqrange_v3u,
>         .csi0clkfreqrange = 0x20,
>         .clear_ulps = true,

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
