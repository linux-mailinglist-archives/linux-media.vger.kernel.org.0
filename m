Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB5B53595E8
	for <lists+linux-media@lfdr.de>; Fri,  9 Apr 2021 08:56:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233335AbhDIG4O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Apr 2021 02:56:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231540AbhDIG4M (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Apr 2021 02:56:12 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2148C061760
        for <linux-media@vger.kernel.org>; Thu,  8 Apr 2021 23:55:59 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id b4so8035627lfi.6
        for <linux-media@vger.kernel.org>; Thu, 08 Apr 2021 23:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wO+lF3IfRHW1CPr0KDMDy+ZwUfGnCkz2VoaMP2WdfwM=;
        b=XvBFZigO6sHp3nfYgU6GkYJzru8p1a5IIa5Rg8jkEVritBKV2ejV/ofneAuVodZLv1
         wugd142zRFmN3G8q5ErysvaEcdiGRu2tshH150DWvmUYypjNot+rgrKtgDaJgTwsIkJG
         i4ZEOjJ+fnvPehOOGi2n2VLh0L9mOUWA0LBSBJXhM2AxOaBB5X6esAcGM9lMjWDeUcEV
         0QT25tYe+b1N4IeGXhJqDeTjUCOqXVHKq3MFU+hzus+snFbhUHzE7XiWpiwzAmZv+ves
         gggo6vrSvEo5xkLQ31PThaeIwWZyRSpu81ppovtP+jDBL6uZmTNGvN1cwMv+Mhz/Kfw1
         TlrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wO+lF3IfRHW1CPr0KDMDy+ZwUfGnCkz2VoaMP2WdfwM=;
        b=hHVwoBZUmfr3MToCtx6GRCKLi9qfXvRrKUW4CzOA9lXQUks8x3GaLLw6JxPwGPASVO
         KALBHjKP0EQk0Kc00bXuL/pmS2QTPzVpmcH7wWHNUOKXGPkiDGFCDizXrl93x6dyCoSf
         s79lb2BwtGIobZf5eVEgvXhZRcGJ6gnqtifvbUveRb4XJLuD5B/GddHR4CX0VJsxkw+i
         RrPaur4VpHEDQBu83jRnY+6Kt9WW8oNMloB8iYMPAkITzeYYwVmCXoY+Ciq9p31LRLya
         1+hwjWM0xh4mNtXWjZCKJ9CCN/AtUVOqhEk0LiBVpfhgBraa71kPsW760yRiJN3IsZ8A
         ExbQ==
X-Gm-Message-State: AOAM533SjGIiDjtuG6uxF5MiQvjqC/HZZhrWLIQJmkOkSH4vexZ/U7oK
        ukXYWR5o77Y1eMRrjTCdmVxaEHPWWYHuOJxN2Og=
X-Google-Smtp-Source: ABdhPJz5sjenoNiLSk/wuLBYEXYGgp7vhiqwl/YchWRDojHWLHx60M94NfcmMhepFisatX6q7p/CT09RpRI8/LmNFU4=
X-Received: by 2002:a19:5513:: with SMTP id n19mr4188887lfe.313.1617951358280;
 Thu, 08 Apr 2021 23:55:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210408084407.21828-1-sean@mess.org>
In-Reply-To: <20210408084407.21828-1-sean@mess.org>
From:   Michael Zimmermann <sigmaepsilon92@gmail.com>
Date:   Fri, 9 Apr 2021 08:55:47 +0200
Message-ID: <CAN9vWDLeqTjykCQmtb5WWKYTt9tQjOW1d6SYUiS8HLAkcCgVTw@mail.gmail.com>
Subject: Re: [PATCH] media: ite-cir: probe of ITE8708 on ASUS PN50 fails
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org, Nikolaos Beredimas <beredim@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I tested this on 5.11.11.zen1-1 (from arch linux) and it works:
ite_cir: Auto-detected model: ITE8708 CIR transceiver
ite_cir: Using model: ITE8708 CIR transceiver
ite_cir: TX-capable: 1
ite_cir: Sample period (ns): 8680
ite_cir: TX carrier frequency (Hz): 38000
ite_cir: TX duty cycle (%): 33
ite_cir: RX low carrier frequency (Hz): 0
ite_cir: RX high carrier frequency (Hz): 0

Thanks :)

On Thu, Apr 8, 2021 at 10:44 AM Sean Young <sean@mess.org> wrote:
>
> The Asus PN50 has 16 byte io region for the ITE8708 in its DSDT, which
> causes the probe fail. So, accept larger regions.
>
> Link: https://www.spinics.net/lists/linux-media/msg177725.html
> Cc: Nikolaos Beredimas <beredim@gmail.com>
> Reported-by: Michael Zimmermann <sigmaepsilon92@gmail.com>
> Signed-off-by: Sean Young <sean@mess.org>
> ---
>  drivers/media/rc/ite-cir.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/rc/ite-cir.c b/drivers/media/rc/ite-cir.c
> index 9388774df9d7..5bc23e8c6d91 100644
> --- a/drivers/media/rc/ite-cir.c
> +++ b/drivers/media/rc/ite-cir.c
> @@ -1333,7 +1333,7 @@ static int ite_probe(struct pnp_dev *pdev, const struct pnp_device_id
>
>         /* validate pnp resources */
>         if (!pnp_port_valid(pdev, io_rsrc_no) ||
> -           pnp_port_len(pdev, io_rsrc_no) != dev_desc->io_region_size) {
> +           pnp_port_len(pdev, io_rsrc_no) < dev_desc->io_region_size) {
>                 dev_err(&pdev->dev, "IR PNP Port not valid!\n");
>                 goto exit_free_dev_rdev;
>         }
> --
> 2.30.2
>
