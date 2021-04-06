Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17A0035552C
	for <lists+linux-media@lfdr.de>; Tue,  6 Apr 2021 15:31:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344482AbhDFNby (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Apr 2021 09:31:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230160AbhDFNbx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Apr 2021 09:31:53 -0400
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44D37C06174A
        for <linux-media@vger.kernel.org>; Tue,  6 Apr 2021 06:31:46 -0700 (PDT)
Received: by mail-io1-xd2f.google.com with SMTP id k25so8639292iob.6
        for <linux-media@vger.kernel.org>; Tue, 06 Apr 2021 06:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pgBs9vFap+oiKJhkKZppwE1JvnSPzSzBvVGbV5q3jMo=;
        b=BH90D5rjrPdXmQsM+OOU9c6VSkGQJ83lZ1SAXc5fAmi+ixM0BiSmrNLHYMBs6+mlo1
         Iin12qPKCEcei++hQvebDFk5z9vZIEPXK/rhCA3gBcGnFLHT+jNlPP+leAr2Iz9BTDdG
         D3z/knJsCd01bXf8OqiCW4HK7xNva5JsTFHJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pgBs9vFap+oiKJhkKZppwE1JvnSPzSzBvVGbV5q3jMo=;
        b=ciNhy4NuylDOTE49Y5MndvNcuEX19gdxzJNcuZ7d57e0zvN5uHGXVgCO0eFpUNEQuq
         YkUuQqnOA6ZKRL741hvRm7c4LPSqL7j3MTbyhL4z5RHWT/wYC4s2lLMmqUVJFgrksXC9
         2AW7TArP/K9UXdM4EpFdvdu91DbtBW7aLU4Cx9JeHd7Wv3EDfAqxIMxiQNn2y9XJYhte
         30QMzZzBPx1hr3J7VaBMjtUpJYktEXHpwRTn2wIPczBz1hrcaC2LaZrSek5aHK8Vxy9F
         ExYJPhgRuVXtm8GIchvjRX2V5Tt22UoKj69OuwcCyT2tRNJjeOr4STE+Al5ech/g+brW
         5b5g==
X-Gm-Message-State: AOAM533GicDYjgCYRbrAu1nbeORxqmZkVUwhJMBy8qul9teKXNpFTPKT
        AoctbC92/25NtQ83wmU0Pynn/b5t1fJTcA==
X-Google-Smtp-Source: ABdhPJzC6xgTT2h9dz6Qq01VI/PIMpM/uniOsm3Nr9ztCssRt5DDFywuM1yqH7F71Gyz3yJnYB1OoQ==
X-Received: by 2002:a6b:b7cd:: with SMTP id h196mr23393411iof.59.1617715905455;
        Tue, 06 Apr 2021 06:31:45 -0700 (PDT)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com. [209.85.166.175])
        by smtp.gmail.com with ESMTPSA id s16sm13728882ioe.44.2021.04.06.06.31.44
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Apr 2021 06:31:44 -0700 (PDT)
Received: by mail-il1-f175.google.com with SMTP id c15so4267841ilj.1
        for <linux-media@vger.kernel.org>; Tue, 06 Apr 2021 06:31:44 -0700 (PDT)
X-Received: by 2002:a05:6e02:1a87:: with SMTP id k7mr22308400ilv.69.1617715903981;
 Tue, 06 Apr 2021 06:31:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210309205108.997166-1-ribalda@chromium.org>
In-Reply-To: <20210309205108.997166-1-ribalda@chromium.org>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Tue, 6 Apr 2021 15:31:33 +0200
X-Gmail-Original-Message-ID: <CANiDSCs0j-FzRkza1PSb9o-=L2yQ5xTNWxtFNC6pgNG0hZcMAw@mail.gmail.com>
Message-ID: <CANiDSCs0j-FzRkza1PSb9o-=L2yQ5xTNWxtFNC6pgNG0hZcMAw@mail.gmail.com>
Subject: Re: [PATCH 1/2] lib/scatterlist: Fix NULL pointer deference
To:     Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc:     stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi

Friendly ping?

On Tue, Mar 9, 2021 at 9:51 PM Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> When sg_alloc_table_from_pages is called with n_pages = 0, we write in a
> non-allocated page. Fix it by checking early the error condition.
>
> [    7.666801] BUG: kernel NULL pointer dereference, address: 0000000000000010
> [    7.667487] #PF: supervisor read access in kernel mode
> [    7.667970] #PF: error_code(0x0000) - not-present page
> [    7.668448] PGD 0 P4D 0
> [    7.668690] Oops: 0000 [#1] SMP NOPTI
> [    7.669037] CPU: 0 PID: 184 Comm: modprobe Not tainted 5.11.0+ #2
> [    7.669606] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.14.0-2 04/01/2014
> [    7.670378] RIP: 0010:__sg_alloc_table_from_pages+0x2c5/0x4a0
> [    7.670924] Code: c9 01 48 c7 40 08 00 00 00 00 48 89 08 8b 47 0c 41 8d 44 00 ff 89 47 0c 48 81 fa 00 f0 ff ff 0f 87 d4 01 00 00 49 8b 16 89 d8 <4a> 8b 74 fd 00 4c 89 d1 44 29 f8 c1 e0 0c 44 29 d8 4c 39 d0 48 0f
> [    7.672643] RSP: 0018:ffffba1e8028fb30 EFLAGS: 00010287
> [    7.673133] RAX: 0000000000000001 RBX: 0000000000000001 RCX: 0000000000000002
> [    7.673791] RDX: 0000000000000002 RSI: ffffffffada6d0ba RDI: ffff9afe01fff820
> [    7.674448] RBP: 0000000000000010 R08: 0000000000000001 R09: 0000000000000001
> [    7.675100] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
> [    7.675754] R13: 00000000fffff000 R14: ffff9afe01fff800 R15: 0000000000000000
> [    7.676409] FS:  00007fb0f448f540(0000) GS:ffff9afe07a00000(0000) knlGS:0000000000000000
> [    7.677151] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    7.677681] CR2: 0000000000000010 CR3: 0000000002184001 CR4: 0000000000370ef0
> [    7.678342] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [    7.679019] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> [    7.680349] Call Trace:
> [    7.680605]  ? device_add+0x146/0x810
> [    7.681021]  sg_alloc_table_from_pages+0x11/0x30
> [    7.681511]  vb2_dma_sg_alloc+0x162/0x280 [videobuf2_dma_sg]
>
> Cc: stable@vger.kernel.org
> Fixes: efc42bc98058 ("scatterlist: add sg_alloc_table_from_pages function")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  lib/scatterlist.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/lib/scatterlist.c b/lib/scatterlist.c
> index a59778946404..1e83b6a3d930 100644
> --- a/lib/scatterlist.c
> +++ b/lib/scatterlist.c
> @@ -435,6 +435,9 @@ struct scatterlist *__sg_alloc_table_from_pages(struct sg_table *sgt,
>         unsigned int added_nents = 0;
>         struct scatterlist *s = prv;
>
> +       if (n_pages == 0)
> +               return ERR_PTR(-EINVAL);
> +
>         /*
>          * The algorithm below requires max_segment to be aligned to PAGE_SIZE
>          * otherwise it can overshoot.
> --
> 2.30.1.766.gb4fecdf3b7-goog
>


-- 
Ricardo Ribalda
