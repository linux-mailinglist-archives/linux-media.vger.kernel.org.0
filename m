Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E1682D20FC
	for <lists+linux-media@lfdr.de>; Tue,  8 Dec 2020 03:41:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727866AbgLHCkt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Dec 2020 21:40:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727075AbgLHCks (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Dec 2020 21:40:48 -0500
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0E6CC061749;
        Mon,  7 Dec 2020 18:40:08 -0800 (PST)
Received: by mail-qt1-x844.google.com with SMTP id u21so11035985qtw.11;
        Mon, 07 Dec 2020 18:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JY14U8S62/FWXFTqIYq8u7QrCXxJofc9nJgVqZeSkFc=;
        b=nQmn7fAPmH9tazVlHIrlKmVuehOaj2oDM8avnT77YOd4Fn0Pjf9jpg47UVqPQQnt5B
         Jr0gFbSAmUKhfmhrfVfUzq1dMMlICeXjcBShehFjOPwwnM156HxMHugJKCoMIwbpkBZu
         7BpMichxgtUuktYqaYvBPIYldxMJCwfbLUR98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JY14U8S62/FWXFTqIYq8u7QrCXxJofc9nJgVqZeSkFc=;
        b=SzsAaDKvH4w8A9jLZy7EgA/Rp+Ruy+nqT+uMgKLBNvR46h6wdM/+6OgTpkFpyj0ydW
         smJc2iYBaRobMIf7E/YkMJLp7B44NYxquCsRJXgXVCqa9S2ks2jDOdmkzYwBRAq1sjZe
         L8ULV6vRYFuW/Hpkm/8ooNbhPP0FUouok4rnveujy4xweKSh99u/cUY4mnuqefYcnqdT
         jYfGBqBxkj74H/ut8e6FTPAaPpKqLs4ij5BDXOvao6m4mg8GJsLZwIDeAvECpgbmGFLm
         OJpjOT+jDUgRQA6BvUXiVb3ds1AJ6+m7b+tWVLHOA9+K3R1/ilFhbmFZtL+eZO4zfoSc
         1Jxg==
X-Gm-Message-State: AOAM533AD7WtenWXgiztrDiTpECHaBtgPueNpEHJjcrJaqY8d+GAiDPV
        H2TkgCU0qm8UHh46pHbYvz7ojGMDZU6QXg9DZN0=
X-Google-Smtp-Source: ABdhPJyDbHNixeBukE5aPiglwr8vok7aJbSl6NlxqkJDSsm2S3NFATjBBkwB3FAEVtYFHvMfrSyk6o27aydT32p/XHU=
X-Received: by 2002:aed:2d65:: with SMTP id h92mr10793058qtd.263.1607395207466;
 Mon, 07 Dec 2020 18:40:07 -0800 (PST)
MIME-Version: 1.0
References: <20201207164240.15436-1-jae.hyun.yoo@linux.intel.com> <20201207164240.15436-3-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20201207164240.15436-3-jae.hyun.yoo@linux.intel.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Tue, 8 Dec 2020 02:39:55 +0000
Message-ID: <CACPK8Xd3dz1WLGNGqMiAZxhMEeGHbkPtvO2rYQ36Kbj=Uvy-jA@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: aspeed: fix clock handling logic
To:     Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc:     Andrew Jeffery <andrew@aj.id.au>,
        Eddie James <eajames@linux.ibm.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-clk@vger.kernel.org, linux-media@vger.kernel.org,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 7 Dec 2020 at 16:33, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>
> Video engine uses eclk and vclk for its clock sources and its reset
> control is coupled with eclk so the current clock enabling sequence works
> like below.
>
>  Enable eclk
>  De-assert Video Engine reset
>  10ms delay
>  Enable vclk

This is the case after " clk: ast2600: fix reset settings for eclk and
vclk" is applied, correct? Without that patch applied the reset
sequence is correct by accident for the 2600, but it will be wrong for
the 2500?

> It introduces improper reset on the Video Engine hardware and eventually
> the hardware generates unexpected DMA memory transfers that can corrupt
> memory region in random and sporadic patterns. This issue is observed
> very rarely on some specific AST2500 SoCs but it causes a critical
> kernel panic with making a various shape of signature so it's extremely
> hard to debug.

I wasn't sure what you meant by "various shape of signature". Can you
elaborate, and/or share with us some examples of the signature?

> Moreover, the issue is observed even when the video
> engine is not actively used because udevd turns on the video engine
> hardware for a short time to make a query in every boot.
>
> To fix this issue, this commit changes the clock handling logic to make
> the reset de-assertion triggered after enabling both eclk and vclk. Also,
> it adds clk_unprepare call for a case when probe fails.
>
> Fixes: d2b4387f3bdf ("media: platform: Add Aspeed Video Engine driver")
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>

The code change looks correct and should be applied to stable.

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/media/platform/aspeed-video.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> index c46a79eace98..db072ff2df70 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -514,8 +514,8 @@ static void aspeed_video_off(struct aspeed_video *video)
>         aspeed_video_write(video, VE_INTERRUPT_STATUS, 0xffffffff);
>
>         /* Turn off the relevant clocks */
> -       clk_disable(video->vclk);
>         clk_disable(video->eclk);
> +       clk_disable(video->vclk);
>
>         clear_bit(VIDEO_CLOCKS_ON, &video->flags);
>  }
> @@ -526,8 +526,8 @@ static void aspeed_video_on(struct aspeed_video *video)
>                 return;
>
>         /* Turn on the relevant clocks */
> -       clk_enable(video->eclk);
>         clk_enable(video->vclk);
> +       clk_enable(video->eclk);
>
>         set_bit(VIDEO_CLOCKS_ON, &video->flags);
>  }
> @@ -1719,8 +1719,11 @@ static int aspeed_video_probe(struct platform_device *pdev)
>                 return rc;
>
>         rc = aspeed_video_setup_video(video);
> -       if (rc)
> +       if (rc) {
> +               clk_unprepare(video->vclk);
> +               clk_unprepare(video->eclk);
>                 return rc;
> +       }
>
>         return 0;
>  }
> --
> 2.17.1
>
