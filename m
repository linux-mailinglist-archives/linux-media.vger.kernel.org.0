Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9721258204
	for <lists+linux-media@lfdr.de>; Mon, 31 Aug 2020 21:45:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728126AbgHaTp0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Aug 2020 15:45:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726755AbgHaTpZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Aug 2020 15:45:25 -0400
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FC54C061573;
        Mon, 31 Aug 2020 12:45:24 -0700 (PDT)
Received: by mail-il1-x143.google.com with SMTP id t4so2245931iln.1;
        Mon, 31 Aug 2020 12:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SiCC3vSFECOoLKk8HXUNpN0y793n48CBmn3FARWOzDs=;
        b=kaL37+GufZQ9Q0nsJX223it4+gMw1R61naTIXKnLp6LGLDSlS93I6a6MywCs+S/FkV
         yLa/vG75sSE8P7VOgLEpQLvqPI4mQXlSEbjfdCPW2pJl95t6L7Zmd4DNcFDTYWvn7X9R
         MLaTgloCOmo5y4Z3v2XNI/puz4VOo9l9rxT8oNcP/C6kIgqgBQRzndna6ZHDjEhmhRfB
         ABhp09vQSibb8FKRnHZbotu8HXRHgwOX2FbX31ygs/RO8DCBV6KItmw/80cx8g5ZzCli
         Kk/CpPxiIwbWax927LBXQa/VEuAlrFKtv+akkfliRT302q5YF48yhVpOG0JvPuW8nd8M
         2huA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SiCC3vSFECOoLKk8HXUNpN0y793n48CBmn3FARWOzDs=;
        b=EJ7L7rPQc6WaDuU7B8w8onavYcRfjKDplMYvLYJUWJTlwo6OP6HXnrh61gyIF0/Xgh
         4KzCJGFKGgDVS1IsHaGBK6swyF5eWcxq9dTYhsDBt4+gRrva2UJQq/PC+G7OViZmUN9p
         ncoAuGhy6xMrFWzveqvAfqLM+va4dGxjYYntRS5a+6Y8fkT3ubuQtcM1qBNEQ1EaMAnj
         HK6xDs75F/SjNRNRTcdx4/yFK2e0kfR9eL5v+WUKsKwhlm1BbfGEzeqdX1fAxiPdDLSv
         oSGvJB2sCTp4qFI2xFr7jlATNg3E4xYB+CjsKd2bz7DtHIhvNBA8YVD0++ga8+fUrHOj
         761A==
X-Gm-Message-State: AOAM532dKbqMPjKWl7huMZD+6wISErooYiQ3jkrIbalt+0iHVcvdc9gM
        NbfCa196qt3moWN+5NHPzRfc9iHo657RALP8m/Q=
X-Google-Smtp-Source: ABdhPJwnyKamuh7ZIhI1Mp9YLjgG8lCjgT6loKTKlRY+cdh/zWCnwbnkqooKjEKgYBDsqtVmYCyJszTg+JQry7Ecb6s=
X-Received: by 2002:a92:5ad8:: with SMTP id b85mr2643547ilg.304.1598903123362;
 Mon, 31 Aug 2020 12:45:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200811205939.19550-1-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20200811205939.19550-1-laurent.pinchart+renesas@ideasonboard.com>
From:   Ramesh Shanmugasundaram <rashanmu@gmail.com>
Date:   Mon, 31 Aug 2020 20:44:46 +0100
Message-ID: <CAJWpUEe4VwOL_TQ1WwjG1WT17_GPFpNO+-h92dRfj0jW8pb5wg@mail.gmail.com>
Subject: Re: [PATCH 0/5] media: Fix asd dynamic allocation
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Chris Paterson <chris.paterson2@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thank you for the fix. Sorry about the late reply.

> This small patch series addresses a bug related to the usage of
> v4l2_async_notifier_add_subdev() that is widespread among drivers.
>
> The issue is explained in 1/4, which improves the documentation of the
> v4l2_async_notifier_add_subdev() function by stating explicitly that the
> asd argument needs to be allocated dynamically. Among the 13 drivers
> that use that function, only one gets it right.
>
> The rest of the patches fix the problem in several Renesas-related
> drivers, with an unrelated fwnode reference leak fix for the rcar-drif
> driver in 2/5 that made the v4l2_async_notifier_add_subdev() fix easier
> to implement in that driver.
>
> I'm lacking hardware to test 2/5 and 3/5. Ramesh, would you be able to
> test that ? What development board do you use to test the DRIF driver ?
> I don't see any DT integration upstream.

I'm afraid I may not be able to test it as I do not have the hardware.
I have copied Chris P if he can help out.

I have tested DRIF driver on a H3/M3 Salvator-X/S with a add-on board
from Maxim having two MAX2175 tuners (MAX2175 evaluation kit). This
add-on board was a prototype at that time. Hence, the DT updates were
maintained internally.

Thanks,
Ramesh

> I also haven't dug up my MAX9286 development kit to test 5/5. I would
> thus appreciate if someone could test it, but worst case I can do so
> myself.
>
> Laurent Pinchart (5):
>   media: v4l2-async: Document asd allocation requirements
>   media: rcar_drif: Fix fwnode reference leak when parsing DT
>   media: rcar_drif: Allocate v4l2_async_subdev dynamically
>   media: rcar-csi2: Allocate v4l2_async_subdev dynamically
>   media: i2c: max9286: Allocate v4l2_async_subdev dynamically
>
>  drivers/media/i2c/max9286.c                 | 38 +++++++++++----------
>  drivers/media/platform/rcar-vin/rcar-csi2.c | 24 ++++++-------
>  drivers/media/platform/rcar_drif.c          | 30 +++++-----------
>  include/media/v4l2-async.h                  |  5 +--
>  4 files changed, 42 insertions(+), 55 deletions(-)
>
> --
> Regards,
>
> Laurent Pinchart
>
