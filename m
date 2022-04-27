Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 455775117FB
	for <lists+linux-media@lfdr.de>; Wed, 27 Apr 2022 14:47:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234670AbiD0Mtz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Apr 2022 08:49:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234583AbiD0Mtx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Apr 2022 08:49:53 -0400
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38576262;
        Wed, 27 Apr 2022 05:46:43 -0700 (PDT)
Received: by mail-qk1-f174.google.com with SMTP id i2so1135874qke.12;
        Wed, 27 Apr 2022 05:46:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IFGnZv7frqpXTuKMalYO9Z5uZwjv041x51qY8b3NphI=;
        b=RttUE8xBdn6tD6VntTpuimKWQnQhzRW8bdXEAvMrWJmFYqya46mJx1YHNWE7nW033b
         l/u23iQxRjKNUSTIoA5KuUi6X1g+/IK5Noj5Ui4wAcHqTluUNCuE4P+OCRUBiaKOpkyr
         HGKUwN+1vF+y+9IZ4gpzAL94pPQP40c0Dfxff023G+JAuD5rL06ctKNdFZe16beHvaQ2
         GgyI/LNGde/ueNaxh/YxBBPQjqCR5xD1QXbE0S/AcNzhT6D0TQGDxPMw/T2nZicCXjGX
         5FzTaCtLCEME2WFiGBpP0SNYLO928guK4v7AYKgDXD2PPosJ0HxJ3wpiI2ODKzGGzQNw
         ZREg==
X-Gm-Message-State: AOAM531CBPJtkmhrVw9OmLBsGXsf7jjyquChoqCXdNYOcOPnTUJsK7iq
        +Jbgg8aIMkdoMUCOo8pKh7bpYZtQVbBxCA==
X-Google-Smtp-Source: ABdhPJxoZktaHABy+Qy5rc/iXCz1UH9OXiveohQDGjE26LbAqj6pzZ9viRAqeVpEEvq9iLy3QBjn/Q==
X-Received: by 2002:a05:620a:25d1:b0:47e:b90:bf6c with SMTP id y17-20020a05620a25d100b0047e0b90bf6cmr15660877qko.538.1651063602172;
        Wed, 27 Apr 2022 05:46:42 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id j128-20020a37a086000000b0069f7c7d6517sm2110949qke.13.2022.04.27.05.46.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Apr 2022 05:46:41 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id y76so3181923ybe.1;
        Wed, 27 Apr 2022 05:46:41 -0700 (PDT)
X-Received: by 2002:a5b:24e:0:b0:63d:cba0:3d55 with SMTP id
 g14-20020a5b024e000000b0063dcba03d55mr25002206ybp.613.1651063601487; Wed, 27
 Apr 2022 05:46:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220419181757.63346-1-biju.das.jz@bp.renesas.com> <20220419181757.63346-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220419181757.63346-6-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 27 Apr 2022 14:46:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWnfZytmpMNSV4iNEAN+1ajkfE3f6=qoOM-kGbm3+rojA@mail.gmail.com>
Message-ID: <CAMuHMdWnfZytmpMNSV4iNEAN+1ajkfE3f6=qoOM-kGbm3+rojA@mail.gmail.com>
Subject: Re: [PATCH v8 5/5] media: renesas: vsp1: Add support for RZ/G2L VSPD
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Biju,

On Tue, Apr 19, 2022 at 8:18 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> The RZ/G2L VSPD provides a single VSPD instance. It has the following
> sub modules MAU, CTU, RPF, DPR, LUT, BRS, WPF and LIF.
>
> The VSPD block on RZ/G2L does not have a version register, so added a
> new compatible string "renesas,r9a07g044-vsp2" with a data pointer
> containingthe info structure. Also the reset line is shared with the
> DU module.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
> v7->v8:
>  * Split the patch for adding s/w version, feature bit and RZ/G2L support
>  * Added feature bit VSP1_HAS_NON_ZERO_LBA to device_info
>  * Added .soc for RZ/G2L
>  * Replaced the compatible "renesas,rzg2l-vsp2" -> "renesas,r9a07g044-vsp2"

Thanks for the update!

> --- a/drivers/media/platform/renesas/vsp1/vsp1_regs.h
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_regs.h
> @@ -767,6 +767,8 @@
>  #define VI6_IP_VERSION_MODEL_VSPDL_GEN3        (0x19 << 8)
>  #define VI6_IP_VERSION_MODEL_VSPBS_GEN3        (0x1a << 8)
>  #define VI6_IP_VERSION_MODEL_VSPD_V3U  (0x1c << 8)
> +/* RZ/G2L SoC's have no version register, So use 0x80 as the model version */

RZ/G2L SoCs

> +#define VI6_IP_VERSION_MODEL_VSPD_RZG2L        (0x80 << 8)
>
>  #define VI6_IP_VERSION_SOC_MASK                (0xff << 0)
>  #define VI6_IP_VERSION_SOC_H2          (0x01 << 0)
> @@ -780,6 +782,8 @@
>  #define VI6_IP_VERSION_SOC_M3N         (0x04 << 0)
>  #define VI6_IP_VERSION_SOC_E3          (0x04 << 0)
>  #define VI6_IP_VERSION_SOC_V3U         (0x05 << 0)
> +/* RZ/G2L SoC have no version register, So use 0x80 for SoC Identification */

RZ/G2L SoCs

> +#define VI6_IP_VERSION_SOC_RZG2L       (0x80 << 0)
>
>  #define VI6_IP_VERSION_VSP_SW          (0xfffe << 16) /* SW VSP version */

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
