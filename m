Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C465219F20D
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 11:06:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726736AbgDFJGm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 05:06:42 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:38244 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726622AbgDFJGm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Apr 2020 05:06:42 -0400
Received: by mail-qk1-f196.google.com with SMTP id h14so15386729qke.5
        for <linux-media@vger.kernel.org>; Mon, 06 Apr 2020 02:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Z2SgIJ3uNA8ESS3GWJt+ajz2D49yJfYvt9DUQ6L5nNs=;
        b=UmCrvNu/tThL1jebDlzRdaeuvw3UkTcZBsyfaD0HTtYYRBl5RnJtCSVhPqitUU5/Pv
         wtJbxi1dpT1C7mdUO9J9PFHVe5Zxp5ocnRr/2z1C7RX0JcnTEnfaNpNBBiTFgd2WDb/p
         IZ9P+zB8xhXbbkqLO2fSSgTZlQdGV7gLGtKfAc0OYterR/sAqg6ECUx366vTlPRZi6Tu
         X3vZ3v59XiNDJE++oGyrnyRD7dTjit2znsiDSevxLmm8kDrVthaIk2WCQxrAKk+SuZLJ
         QzCj/t70mKSYkw4sUOTYUIkYZhTDFpLMq5Ki0/+zyEY9KnzSb2wqjOn2QPky2TXqg2HA
         5lFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Z2SgIJ3uNA8ESS3GWJt+ajz2D49yJfYvt9DUQ6L5nNs=;
        b=K9yBYA5N2okmBNy1M5MCuP4t4kQ3Qi05+x9QaFcRkaHghjH2zEj0p95T/OWdtCJeoP
         2m3ZCBhtSmrrAdP/Df1GDVPvmPLv9HV8GhGycqxihBjk6Zkxucqm3fYpf9y8fdn68TNV
         Ml5Q/POQvAFGFhequnb9bXBtFj4b1kz6euNkBy2x2jq8/sYnWm9Kx6XNR/krYPsmbO5Z
         HzNSEKDnpkZe9JGWgMeY66q4kLBWfj9/DHPVNSmzwAVlhA1kNjyjT2Iudyki36E1pPlz
         jJJbojeo3PzvVpgp6PVhvuYUIPzCqPtog0HxFUm2gEHWV6nToisZHNNuif7Pv9Xf3DvT
         hs1w==
X-Gm-Message-State: AGi0PuYUOIIaT7TZk5dpg4z5SMbF3gYehlit6FRq8dE1Phf3JyjGGiEy
        +GCuqXiL1asLIBALxcP44gLJkS3DA+hjRpEur8I=
X-Google-Smtp-Source: APiQypImVrlLWz2bfYenQwdoW7t/pL6I06IFxPUByDjEr4sEPuYPMlx+dw1slQijA5yEzT7Z0iAbAy2IsMLKs2NEaHo=
X-Received: by 2002:a37:5903:: with SMTP id n3mr20797865qkb.332.1586164000572;
 Mon, 06 Apr 2020 02:06:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAKL8oB_qPGVXd3MCj=f1Lzh02ifGzYTS2YAD77s2MY2LAnc+1A@mail.gmail.com>
 <20190612150132.iemhbronjjaonpt2@gofer.mess.org> <CAKL8oB-KxsGxHAUac7sYBf-Gs4UkAPVkXg75LwwVbut9GkQ-sQ@mail.gmail.com>
 <20190613084926.bjxv2vdkp3qqpkuu@gofer.mess.org>
In-Reply-To: <20190613084926.bjxv2vdkp3qqpkuu@gofer.mess.org>
From:   Takashi Kanamaru <neuralassembly@gmail.com>
Date:   Mon, 6 Apr 2020 18:06:29 +0900
Message-ID: <CAKL8oB-_=07iOBUfiuD4sj_nuL2HURt_Ej4m9EFCL7yNzLYXjg@mail.gmail.com>
Subject: Re: [PATCH] media: rc: IR signal for Panasonic air conditioner too
 long sequences is too small
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dear Sean Young and all,

In the last year, a change of the value of LIRCBUF_SIZE
from 256 to 1024 was committed to the master branch at the time,
and the new value can be used in the kernel 5.3 or later.

https://github.com/torvalds/linux/commit/5c4c8b4a999019f19e770cb55cbacb89c9=
5897bd#diff-3b71f634ae88214ee31a1b6c90f7df5c

This change of LIRCBUF_SIZE was proposed
in order to treat long IR sequences of remote controllers
on Raspberry Pi.

However, Raspberry Pi now uses kernel 4.19,
so the new value cannot be used.

Can you backport the above commit
to the older kernels, i.e.,
4.19, 4.20, 5.0, 5.1, and 5.2?

Sincerely,

Takashi Kanamaru

2019=E5=B9=B46=E6=9C=8813=E6=97=A5(=E6=9C=A8) 17:49 Sean Young <sean@mess.o=
rg>:
>
> The IR signal to control the Panasonic ACXA75C00600 air conditioner has
> 439 pulse/spaces. Increase limit to make it possible to transmit signal.
>
> Reported-by: Takashi Kanamaru <neuralassembly@gmail.com>
> Signed-off-by: Sean Young <sean@mess.org>
> ---
>  drivers/media/rc/lirc_dev.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/rc/lirc_dev.c b/drivers/media/rc/lirc_dev.c
> index 10830605c734..f078f8a3aec8 100644
> --- a/drivers/media/rc/lirc_dev.c
> +++ b/drivers/media/rc/lirc_dev.c
> @@ -19,7 +19,7 @@
>  #include "rc-core-priv.h"
>  #include <uapi/linux/lirc.h>
>
> -#define LIRCBUF_SIZE   256
> +#define LIRCBUF_SIZE   1024
>
>  static dev_t lirc_base_dev;
>
> --
> 2.20.1
>
