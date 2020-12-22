Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E14FE2E057B
	for <lists+linux-media@lfdr.de>; Tue, 22 Dec 2020 05:49:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725820AbgLVEsb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Dec 2020 23:48:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725782AbgLVEsb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Dec 2020 23:48:31 -0500
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43700C0613D3;
        Mon, 21 Dec 2020 20:47:51 -0800 (PST)
Received: by mail-qk1-x732.google.com with SMTP id 143so10939236qke.10;
        Mon, 21 Dec 2020 20:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jhzT8c0zSzP0ywXe5TKHFtbJ3WCUgeB9D75CgQh7hjY=;
        b=VklhxX/oiWTdbSURqiK31rNW6JMHcT6Ep31a432CZZQM0IvJFJX2k1+IATEO2ePMz7
         xz/E+mLiY1Dm5reX4xJ1Xl+eVifZhfkDgdKLX1GnwL82vb5VwQxda/MUOU/imtaJDb21
         JewxqSqvO27q/0USJ6ebhXPsW8ZQM1bWtpoS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jhzT8c0zSzP0ywXe5TKHFtbJ3WCUgeB9D75CgQh7hjY=;
        b=g1DNrQLRMtkbBSUp3eeoGWVsGzg4u2qQrHHMKlnBSVBfY1FVuJgazqXrB8YxIq3goc
         Y3dUYEWJzy+E0j27+DWnTkspNCwSZ/4bBjnYLdJfMXYA8bM6S2hmj9USDWSA4OPTZvhm
         eV44ATd74WQfgyxlY7LoqgTw0dfVi7bRfLMw75jFZqYI2zcJjAoAl35IudP2KVkl80Nf
         cuwpiWNXlpFrptncA8YxJxZynFgyMpOPzxZn+ftl6GTd788ExRX8Q54xzSCpaJIPlGE5
         QXrqCIIitQ1t0dGKMc9Lw7lTSLROX9Y+ySdVc68gpsZdQ4ymCuIbaqqTX0ygx/+xwc2Q
         a61A==
X-Gm-Message-State: AOAM533xCAetD0k6OF188zQ8IsIdduhxRTmVGx3UaKGD4OVFr7vHueUF
        T33tupt8JrZZjYoyQUpjFcmPtzkAHntBxP6Q3ME=
X-Google-Smtp-Source: ABdhPJzD0mDzK0fUtV/9AAtwg4ua0v3wjsKGJfAQ/B8NgTaVsPevS7zOz/Ys2pLUkzNHs67W6zSSHmAlRj/2PPj9vaY=
X-Received: by 2002:a05:620a:4155:: with SMTP id k21mr20539624qko.55.1608612469458;
 Mon, 21 Dec 2020 20:47:49 -0800 (PST)
MIME-Version: 1.0
References: <20201215024542.18888-1-zev@bewilderbeest.net> <20201215024542.18888-3-zev@bewilderbeest.net>
In-Reply-To: <20201215024542.18888-3-zev@bewilderbeest.net>
From:   Joel Stanley <joel@jms.id.au>
Date:   Tue, 22 Dec 2020 04:47:37 +0000
Message-ID: <CACPK8XczCUgqOENABoDbc-qwbMxOh=1OUyBtuHSmDG_Zo571Wg@mail.gmail.com>
Subject: Re: [PATCH 2/3] aspeed-video: clear spurious interrupt bits unconditionally
To:     Zev Weiss <zev@bewilderbeest.net>
Cc:     Eddie James <eajames@linux.ibm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andrew Jeffery <andrew@aj.id.au>, linux-media@vger.kernel.org,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 15 Dec 2020 at 02:46, Zev Weiss <zev@bewilderbeest.net> wrote:
>
> Instead of testing and conditionally clearing them one by one, we can
> instead just unconditionally clear them all at once.
>
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>

I had a poke at the assembly and it looks like GCC is clearing the
bits unconditionally anyway, so removing the tests provides no change.

Combining them is a good further optimization.

Reviewed-by: Joel Stanley <joel@jms.id.au>

A question unrelated to this patch: Do you know why the driver doesn't
clear the status bits in the interrupt handler? I would expect it to
write the value of sts back to the register to ack the pending
interrupt.

> ---
>  drivers/media/platform/aspeed-video.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> index eb02043532e3..218aae3be809 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -558,6 +558,14 @@ static void aspeed_video_irq_res_change(struct aspeed_video *video, ulong delay)
>         schedule_delayed_work(&video->res_work, delay);
>  }
>
> +/*
> + * Interrupts that we don't use but have to explicitly ignore because the
> + * hardware asserts them even when they're disabled in the VE_INTERRUPT_CTRL
> + * register.
> + */
> +#define VE_SPURIOUS_IRQS \
> +       (VE_INTERRUPT_CAPTURE_COMPLETE | VE_INTERRUPT_FRAME_COMPLETE)
> +
>  static irqreturn_t aspeed_video_irq(int irq, void *arg)
>  {
>         struct aspeed_video *video = arg;
> @@ -630,15 +638,8 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
>                         aspeed_video_start_frame(video);
>         }
>
> -       /*
> -        * CAPTURE_COMPLETE and FRAME_COMPLETE interrupts come even when these
> -        * are disabled in the VE_INTERRUPT_CTRL register so clear them to
> -        * prevent unnecessary interrupt calls.
> -        */
> -       if (sts & VE_INTERRUPT_CAPTURE_COMPLETE)
> -               sts &= ~VE_INTERRUPT_CAPTURE_COMPLETE;
> -       if (sts & VE_INTERRUPT_FRAME_COMPLETE)
> -               sts &= ~VE_INTERRUPT_FRAME_COMPLETE;
> +       /* Squash known bogus interrupts */
> +       sts &= ~VE_SPURIOUS_IRQS;
>
>         if (sts)
>                 dev_err_ratelimited(video->dev, "unexpected interrupt asserted:"
> --
> 2.29.2
>
