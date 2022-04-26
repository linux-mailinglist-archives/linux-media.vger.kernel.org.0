Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28B1C50F2CE
	for <lists+linux-media@lfdr.de>; Tue, 26 Apr 2022 09:40:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344171AbiDZHnG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Apr 2022 03:43:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344179AbiDZHm4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Apr 2022 03:42:56 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4CE1135671
        for <linux-media@vger.kernel.org>; Tue, 26 Apr 2022 00:39:47 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id k29-20020a056830243d00b006040caa0988so12508909ots.6
        for <linux-media@vger.kernel.org>; Tue, 26 Apr 2022 00:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JwyicQ1EZbhkEoCjc0hbWIesHTbrCBp19hDfJseo+HA=;
        b=DPjhTV/HULgZtMDEaftFP2qvtPyQamNLNReviY6O82ZZFowzhk8maY7iefA9pL0o7G
         RIj6xu6foCieM7KicxW54CSqwWGooHfFVdYwP2zDNPYLRGTp27JCc0Z4V6qvAoz7SwzK
         PUFDC9lDvHB/KscGJpgre30a6rlouIC3eS8Es=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JwyicQ1EZbhkEoCjc0hbWIesHTbrCBp19hDfJseo+HA=;
        b=F5ob6Qfd6k80F8YwnsflWv73ymP0ZKTIwCrpWlSPW9isQVGXduFK1z83Dl5yqfEFJn
         J+rM5ImLS7lbrfNrcDUWhe2jwJuwFJCv4ZAN2626QFpUQ5c0gnYs29RS+nUJwk6k8HEm
         91/Ya9o/aaY2Z2Z0NLQDFrXAVK56JT0QI+O0sxhZfy9mLkxB8lGTvqNRxhANo+mnqZNc
         l69xJICh2icviOpOnHhNeXVA3OXUdxqQH6ox10ZviWthReMhE540gaDitYd9+PxSHuf9
         KXJeZI1DPEdJy7avF0BQNXk2SrTs8ae8N+0i90wtrrWJkxUdAntZLD+24OligTEMXnVr
         brbg==
X-Gm-Message-State: AOAM530jK0kqB/01t6QttGnDYolfpOPE4Teuepo3HIAy8GaOpR6qsROV
        4eM0B0YAu57cmubiBZ6T/zQsZXl3fjUy950F
X-Google-Smtp-Source: ABdhPJxKqMvPGCk51eb426R7rN+/ojOgnZCiHyUmjSCw8f3uYybYpW5FAJ8TJZOohhFLfgUoA4M+5A==
X-Received: by 2002:a9d:6d99:0:b0:605:67e2:229b with SMTP id x25-20020a9d6d99000000b0060567e2229bmr7856342otp.13.1650958786820;
        Tue, 26 Apr 2022 00:39:46 -0700 (PDT)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com. [209.85.167.175])
        by smtp.gmail.com with ESMTPSA id t3-20020a056870048300b000e686d1389fsm551068oam.57.2022.04.26.00.39.45
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Apr 2022 00:39:45 -0700 (PDT)
Received: by mail-oi1-f175.google.com with SMTP id v65so15074618oig.10
        for <linux-media@vger.kernel.org>; Tue, 26 Apr 2022 00:39:45 -0700 (PDT)
X-Received: by 2002:a05:6808:e88:b0:2fa:72da:55d4 with SMTP id
 k8-20020a0568080e8800b002fa72da55d4mr14283271oil.66.1650958785126; Tue, 26
 Apr 2022 00:39:45 -0700 (PDT)
MIME-Version: 1.0
References: <Ymbw52EF+Pcvkclz@pendragon.ideasonboard.com> <20220425210104.31964-1-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20220425210104.31964-1-laurent.pinchart@ideasonboard.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Tue, 26 Apr 2022 09:39:34 +0200
X-Gmail-Original-Message-ID: <CANiDSCvzwcTG6Qacobqekwf8uo9wBxRPJnHvud5Se3PHDKXDOg@mail.gmail.com>
Message-ID: <CANiDSCvzwcTG6Qacobqekwf8uo9wBxRPJnHvud5Se3PHDKXDOg@mail.gmail.com>
Subject: Re: [PATCH v4.1 18/21] media: rkisp1: debug: Update max register name length
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

Thanks for the change


On Mon, 25 Apr 2022 at 23:01, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Update the maximum register name length to match all the registers being
> printed. This helps getting a consistent alignment of register dumps
> when concatenating multiple debugfs files.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> Changes since v4:
>
> - Replace dynamic per-file register length with global maximum length
> ---
>  .../media/platform/rockchip/rkisp1/rkisp1-debug.c    | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
> index 2c226f20f525..e76dc2b164b6 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
> @@ -11,8 +11,10 @@
>  #include <linux/debugfs.h>
>  #include <linux/delay.h>
>  #include <linux/device.h>
> +#include <linux/minmax.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/seq_file.h>
> +#include <linux/string.h>
>
>  #include "rkisp1-common.h"
>  #include "rkisp1-regs.h"
> @@ -28,10 +30,14 @@ struct rkisp1_debug_register {
>         RKISP1_CIF_##name, RKISP1_CIF_##name##_SHD, #name \
>  }
>
> +/* Keep this up-to-date when adding new registers. */
> +#define RKISP1_MAX_REG_LENGTH          21
> +
>  static int rkisp1_debug_dump_regs(struct rkisp1_device *rkisp1,
>                                   struct seq_file *m, unsigned int offset,
>                                   const struct rkisp1_debug_register *regs)
>  {
> +       const int width = RKISP1_MAX_REG_LENGTH;
>         u32 val, shd;
>         int ret;
>
> @@ -39,15 +45,15 @@ static int rkisp1_debug_dump_regs(struct rkisp1_device *rkisp1,
>         if (ret <= 0)
>                 return ret ? : -ENODATA;
>
> -       for ( ; regs->name; ++regs) {
> +       for (; regs->name; ++regs) {
>                 val = rkisp1_read(rkisp1, offset + regs->reg);
>
>                 if (regs->shd) {
>                         shd = rkisp1_read(rkisp1, offset + regs->shd);
> -                       seq_printf(m, "%14s: 0x%08x/0x%08x\n", regs->name,
> +                       seq_printf(m, "%*s: 0x%08x/0x%08x\n", width, regs->name,
>                                    val, shd);
>                 } else {
> -                       seq_printf(m, "%14s: 0x%08x\n", regs->name, val);
> +                       seq_printf(m, "%*s: 0x%08x\n", width, regs->name, val);
>                 }
>         }
>
> --
> Regards,
>
> Laurent Pinchart
>


-- 
Ricardo Ribalda
