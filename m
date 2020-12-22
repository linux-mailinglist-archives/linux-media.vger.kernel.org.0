Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46DCB2E0566
	for <lists+linux-media@lfdr.de>; Tue, 22 Dec 2020 05:36:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725957AbgLVEfU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Dec 2020 23:35:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725945AbgLVEfT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Dec 2020 23:35:19 -0500
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 685A2C0613D3;
        Mon, 21 Dec 2020 20:34:39 -0800 (PST)
Received: by mail-qk1-x734.google.com with SMTP id 19so10935848qkm.8;
        Mon, 21 Dec 2020 20:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PmY1Zbvh4P5fvr7vf3dYvsRt7lpuDqOG99f8cRvMW2Y=;
        b=GrKyju7r5Q55J4AEUPA+SDTGZg+Q0Rl8bpjFEOY7Wf1W7lvAh+3vJzCVrUF51b8DOJ
         zMZtths6IEkGwaO9na4a4ouDj76WbiJDCdRm8q61C6r1Ubxb+5iNB2coHyViB+Gvs14J
         KggaDh8uAa9rgGhcc9pFidYBFp8jRHg8c2wBg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PmY1Zbvh4P5fvr7vf3dYvsRt7lpuDqOG99f8cRvMW2Y=;
        b=e+k2tE3pxKVC/8eNONFrh2kLFIXshFKJF05fGwj/4+/J5k+0c3OnJ4wZIjoKHrQ5PD
         XDf/JGhbaEVOzXO6Fb6zdlCYc/QkOj4mM2I/uRLFIE9G3S7yTN6Hp7+iCFKNeBcXlRwW
         Le6RIycOXQyH0Eqm1lNZm/DoYAqNIwCbAEYnk+q0vZP6msAWh+JtD9My5rc/IP8Ismxa
         0XO2Rz926+kAdEb4iuI9nA7hZt1vyEVud0QSwpJxKNClYeKVpUyAkfpTDLJR6YEolpBa
         86dehc5giCDS8WmoPXbfW7mCeM4vx/8+rlxbhfK3TADaaKOvuQFNafWJdqJ7WQUcvMES
         lWmQ==
X-Gm-Message-State: AOAM530Xpoj4jOquPd+JmWREFWgGSR8UeFdwH1I2JllGxW1S0f7QgdGE
        ufmobPparrqJWEpPyRWjUMKG9jV4bHlVyuN7VNI=
X-Google-Smtp-Source: ABdhPJwphoIU/ETccJ0+oBIrWPt5ewRHb2AZGa28DlUbwZupNShcyclpTxbkFNL6J4Za9zG8/A4dFQpfPCoTBgNIOyA=
X-Received: by 2002:a05:620a:4155:: with SMTP id k21mr20507246qko.55.1608611678607;
 Mon, 21 Dec 2020 20:34:38 -0800 (PST)
MIME-Version: 1.0
References: <20201215024542.18888-1-zev@bewilderbeest.net> <20201215024542.18888-2-zev@bewilderbeest.net>
In-Reply-To: <20201215024542.18888-2-zev@bewilderbeest.net>
From:   Joel Stanley <joel@jms.id.au>
Date:   Tue, 22 Dec 2020 04:34:26 +0000
Message-ID: <CACPK8XfPCjBbjM2V1oiD=di6MD6ewJs0NFewA0=kZfx_eL29gQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] aspeed-video: add error message for unhandled interrupts
To:     Zev Weiss <zev@bewilderbeest.net>,
        Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
        Ryan Chen <ryan_chen@aspeedtech.com>
Cc:     Eddie James <eajames@linux.ibm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andrew Jeffery <andrew@aj.id.au>, linux-media@vger.kernel.org,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 15 Dec 2020 at 02:46, Zev Weiss <zev@bewilderbeest.net> wrote:
>
> This device seems to have a propensity for asserting interrupts that
> aren't enabled -- in addition to the CAPTURE_COMPLETE and FRAME_COMPLETE
> interrupts squashed in commit 65d270acb2d662c3346793663ac3a759eb4491b8,
> COMP_READY has also been observed.  Adding a message diagnosing what
> happened in the event of unhandled interrupt status bits should
> hopefully make the debugging process simpler for any others that pop up
> in the future.

Ryan, is this a known issue with the video engine hardware?

>
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> ---
>  drivers/media/platform/aspeed-video.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> index 7d98db1d9b52..eb02043532e3 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -562,6 +562,7 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
>  {
>         struct aspeed_video *video = arg;
>         u32 sts = aspeed_video_read(video, VE_INTERRUPT_STATUS);
> +       u32 orig_sts = sts;
>
>         /*
>          * Resolution changed or signal was lost; reset the engine and
> @@ -639,6 +640,10 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
>         if (sts & VE_INTERRUPT_FRAME_COMPLETE)
>                 sts &= ~VE_INTERRUPT_FRAME_COMPLETE;
>
> +       if (sts)
> +               dev_err_ratelimited(video->dev, "unexpected interrupt asserted:"
> +                                   " sts=%08x, orig_sts=%08x", sts, orig_sts);

Do you want to do this before clearing the FRAME and CAPTURE bits?

> +
>         return sts ? IRQ_NONE : IRQ_HANDLED;
>  }
>
> --
> 2.29.2
>
