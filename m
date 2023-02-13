Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B672F694B8E
	for <lists+linux-media@lfdr.de>; Mon, 13 Feb 2023 16:46:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229628AbjBMPqP convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 13 Feb 2023 10:46:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229642AbjBMPqO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Feb 2023 10:46:14 -0500
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9707E1A655;
        Mon, 13 Feb 2023 07:45:49 -0800 (PST)
Received: by mail-qv1-f50.google.com with SMTP id q10so8554897qvt.10;
        Mon, 13 Feb 2023 07:45:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vs17Gjc5hNsyaDmAzTIflFAWHUB++Qcbtjc5Pc+FwPg=;
        b=sEwSrB5pLIW0KdOz5NXnNTlwaMJtjpMgMX7vM6BupJaMvG2pShX5WWv4j52BdA+TLV
         o2IuHgwOFkbA+/Lhwf+7CzdewX6G0oGqcYrTL8hhThy9pIcFP0yTGF+e21qnEfheh09R
         X0Udrh4A+K59Srlcx7MtFvSrg7O5iYsMLD6YgrAv1PxqSseYOhtPzjO+nghuj/sWn/Ma
         VKck5HH1y9htm9dHSQdrcJ+OPCvT3nbWKi5bFz3wQdOLiDqyEFkWIubBNBMU5ASAyg/Z
         ATNRI0GsTifLg3NDNaOB0UdWaDLp9k2Aec3zDHRGedXFe89EF1bmPCW1h373zKFiNKgS
         uo8A==
X-Gm-Message-State: AO0yUKU4Zc+41xpMxhhZGqkLvHu2HaVQkEz9dFG6wLCKsEt6Y3eLW9XG
        jYW/3W5/5AceucAKPl/2YzCdCG3AxmRkww==
X-Google-Smtp-Source: AK7set8JUZ5AV9W9qCMepI9v40VPlvrPdHeAgBe8o3NKbPu3vRQiDra4ZiB47veiWusPrT8LM+lFMQ==
X-Received: by 2002:ad4:5763:0:b0:56e:b21c:61e5 with SMTP id r3-20020ad45763000000b0056eb21c61e5mr7276548qvx.47.1676303130401;
        Mon, 13 Feb 2023 07:45:30 -0800 (PST)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id j190-20020a37b9c7000000b0073912c099cesm6903870qkf.73.2023.02.13.07.45.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 07:45:30 -0800 (PST)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-52bed2ce9bdso168254537b3.13;
        Mon, 13 Feb 2023 07:45:29 -0800 (PST)
X-Received: by 2002:a0d:e004:0:b0:52a:7505:84bc with SMTP id
 j4-20020a0de004000000b0052a750584bcmr2486918ywe.383.1676303129724; Mon, 13
 Feb 2023 07:45:29 -0800 (PST)
MIME-Version: 1.0
References: <20230211145310.3819989-1-niklas.soderlund+renesas@ragnatech.se> <20230211145310.3819989-4-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20230211145310.3819989-4-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 13 Feb 2023 16:45:18 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW4A9zx6SMFUZUz9EBCedRpiB3aJsXv+5V2ggx_09NbbQ@mail.gmail.com>
Message-ID: <CAMuHMdW4A9zx6SMFUZUz9EBCedRpiB3aJsXv+5V2ggx_09NbbQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: rcar-csi2: Add support for C-PHY on R-Car V4H
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Sat, Feb 11, 2023 at 4:06 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Add support for C-PHY on R-Car V4H. While the V4H supports both D-PHY
> and C-PHY this patch only adds support for the C-PHY mode due to lack of
> documentation and hardware to test on.
>
> The V4H is the first Gen4 device that is enabled in the rcar-csi2
> driver. There is much overlap with the Gen3 driver, the primary
> difference is in how the receiver is started. The V4H have a much larger
> register space and some addresses overlap with Gen3.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Thanks for your patch!

> --- a/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c

> @@ -1503,6 +1781,12 @@ static const struct rcar_csi2_info rcar_csi2_info_r8a779a0 = {
>         .support_dphy = true,
>  };
>
> +static const struct rcar_csi2_info rcar_csi2_info_r8a779g0 = {
> +       .start_receiver = rcsi2_start_receiver_v4h,

The description of "[PATCH 1/3] media: rcar-csi2: Prepare for Gen4
support" suggests you also need a different procedure for
.enter_standby()?  But perhaps not doing the procedure is just the right
thing to do?

> +       .use_isp = true,
> +       .support_cphy = true,
> +};
> +
>  static const struct of_device_id rcar_csi2_of_table[] = {
>         {
>                 .compatible = "renesas,r8a774a1-csi2",

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
