Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1C794D6040
	for <lists+linux-media@lfdr.de>; Fri, 11 Mar 2022 11:58:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348036AbiCKK7x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Mar 2022 05:59:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346129AbiCKK7w (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Mar 2022 05:59:52 -0500
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1ED411E3FC;
        Fri, 11 Mar 2022 02:58:49 -0800 (PST)
Received: by mail-qt1-f176.google.com with SMTP id s15so6958190qtk.10;
        Fri, 11 Mar 2022 02:58:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QUseOBvSYBTvPGWrHdKUHTlM0pbcTxDLN3nvBz0qd1Y=;
        b=FkMgJrgLQtmG2/staFySUTAO1VRvyuiMF+wETfpB/o21Nt/XOFcWXbSsrEWyMnImmM
         4bZOvUYHf/hzkHb/r/X4jqlMjdKSXuJAlYtb4Q3f0PfBlZX1M+g98JA5Y5/kecMb3zJ/
         IepSsIFYRNitmz8HVZ94CTm9LJX3Tp7j/H7zAaQhWnXuSaqn6iS8PGWtIQNlnx3k0kX2
         dP+fmzcPIR55H67lv2s5ONW2nqehYiT9hSnUmDA2ljU0Cwi77InyL/Dj/uUdZJ6CZ8Ok
         o5hli/Nv4bWoOUm1QivI/hbxJJ4g0KKPVNgPdfayzbB9Kwnu5RCbTMdQO6QtZSz6wQkS
         QoOQ==
X-Gm-Message-State: AOAM533z1+qg3m0Tj2lqvQ8Bq9y+KqwdLf5f9cpYF2LRFGqKSKYp4Wg/
        bskE21tOC+fas5mppvMjMngHv02hXKSt3Q==
X-Google-Smtp-Source: ABdhPJzj4THjwaT/JmNOAFrrFurPUKddJ/R4kWS+tVxIbRNLF7He/xyDgW9I78uc1MmDyVpjv4uEoQ==
X-Received: by 2002:ac8:5f4e:0:b0:2df:f369:1e2e with SMTP id y14-20020ac85f4e000000b002dff3691e2emr7581734qta.259.1646996328201;
        Fri, 11 Mar 2022 02:58:48 -0800 (PST)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id u21-20020ae9c015000000b0067d4b2e1050sm2724227qkk.55.2022.03.11.02.58.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Mar 2022 02:58:47 -0800 (PST)
Received: by mail-yb1-f169.google.com with SMTP id v130so16364689ybe.13;
        Fri, 11 Mar 2022 02:58:46 -0800 (PST)
X-Received: by 2002:a25:8486:0:b0:619:9fba:895e with SMTP id
 v6-20020a258486000000b006199fba895emr7522351ybk.342.1646996326598; Fri, 11
 Mar 2022 02:58:46 -0800 (PST)
MIME-Version: 1.0
References: <20220311103803.25239-1-biju.das.jz@bp.renesas.com> <20220311103803.25239-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220311103803.25239-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 11 Mar 2022 11:58:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVBt7vmKE7xeXoD+3ADLn90uvsn-=dv-_c41UWhTjzAaQ@mail.gmail.com>
Message-ID: <CAMuHMdVBt7vmKE7xeXoD+3ADLn90uvsn-=dv-_c41UWhTjzAaQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] media: vsp1: Add support to deassert/assert reset line
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Biju,

On Fri, Mar 11, 2022 at 11:38 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> As the resets DT property is mandatory, and is present in all .dtsi
> in mainline, add support to perform deassert/assert using reference
> counted reset handle.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
> v2->v3:
>  * Added Rb tag from Philipp
>  * If reset_control_deassert() failed, return ret directly.

Thanks for the update!

> --- a/drivers/media/platform/vsp1/vsp1_drv.c
> +++ b/drivers/media/platform/vsp1/vsp1_drv.c
> @@ -16,6 +16,7 @@
>  #include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/reset.h>
>  #include <linux/videodev2.h>
>
>  #include <media/rcar-fcp.h>
> @@ -569,6 +570,11 @@ static void vsp1_mask_all_interrupts(struct vsp1_device *vsp1)
>   */
>  int vsp1_device_get(struct vsp1_device *vsp1)
>  {
> +       int ret = reset_control_deassert(vsp1->rstc);
> +
> +       if (ret < 0)
> +               return ret;
> +
>         return pm_runtime_resume_and_get(vsp1->dev);

You've removed too much :-(
If pm_runtime_resume_and_get() fails, so still need to assert the reset
again.

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
