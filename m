Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F4792C3F88
	for <lists+linux-media@lfdr.de>; Wed, 25 Nov 2020 13:06:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728515AbgKYMFo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Nov 2020 07:05:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727409AbgKYMFo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Nov 2020 07:05:44 -0500
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB18DC0613D4
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2020 04:05:43 -0800 (PST)
Received: by mail-lf1-x141.google.com with SMTP id s30so2796697lfc.4
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2020 04:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jfM9INbtNZZQxsGw1u3dXyx0KliLBxfBqd+R8nYcOEc=;
        b=P7/2yaAhWqigwdnTYJaoPzfCY9gRNdldPUNM7wBdH2FPQU17ZE38fI7rYKJMLFQGYZ
         /zOh+dcsSsGnGh769r/xO0drN/AbjGc1h7q0OUaptMMJoo7u4drvmyrrEb5agc/FEBGg
         JdIT6v5oUzogbBVXSbPwS8jE7258jDplai+rzW+HfIRJ376S8Qq2zgx2119MOZ4gBaay
         fAaOTqHwC+5ZjvcuUgxAzRaFC0M064nd5QxjukrAxTH/YTF09+2m/2WXv1yBk05U2rip
         OVpuU8jD9vSU8Oovb2If7zvICGztb9qZV/X6AVlcfESkd5aScFvgm189cFJqiARUVnB3
         hHCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jfM9INbtNZZQxsGw1u3dXyx0KliLBxfBqd+R8nYcOEc=;
        b=rs/2C7RtZDTXA+2vyNSmcNSalF53XQDrl23c7ocH6c3ZHJXZTiyvdt/2Bksz09eIuf
         8sx4DIWnEkRFUu9Ic2YT6zSWCdm5Iys2mbmjRIFJrWXKebfPzyaTKu6IvqOYqVE1eS7l
         SybFEbZ9y8SoCVb7TdqULbrvBufSAZp8n1QVVtlsYBLfQulf3elLvsQ9iPWnBnubCtys
         L6IzlujkTJuZNmaz0d3/OUtyzUhhBlLi88DVSqf9oswwjHJJfKN63T9loRrctHbb6MiG
         hxGEUDcBEfis+UzDFloOIa0XvxEeklyAxT2M6Lk2ipWH8aYg6BMq+t3b8E1froThmIaS
         WIGA==
X-Gm-Message-State: AOAM532StZLBwpBX/7kgmierZ3o8i7XG1Lvh78z4U4rjKq/7PdT8H0rl
        HbwnqcXJ0Nx+WB7UvXNOpmqMVpEFAwXmLB12CYLKlCIOlH8=
X-Google-Smtp-Source: ABdhPJwBWRuhwtXxS5vVv21bE65qiEQPLPhpk0vucYdj0N1Vs1IemvNAo8VU4opo9s8xlkeoODC4vUcTsA7RMdeG4Hk=
X-Received: by 2002:a19:6759:: with SMTP id e25mr1277791lfj.25.1606305942200;
 Wed, 25 Nov 2020 04:05:42 -0800 (PST)
MIME-Version: 1.0
References: <20201120132907.25323-1-festevam@gmail.com> <87im9tzps6.fsf@mpe.ellerman.id.au>
In-Reply-To: <87im9tzps6.fsf@mpe.ellerman.id.au>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Wed, 25 Nov 2020 09:05:32 -0300
Message-ID: <CAOMZO5DupqPj3ir_sKa1jDL5ZMY+2A24YbK4SUcP3K3v58_nJw@mail.gmail.com>
Subject: Re: [PATCH] media: fsl-viu: Use the ioread/write32be() accessors
To:     Michael Ellerman <mpe@ellerman.id.au>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media <linux-media@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Michael,

On Wed, Nov 25, 2020 at 7:36 AM Michael Ellerman <mpe@ellerman.id.au> wrote:

> > -     out_be32(&vr->dma_inc, reg_val.dma_inc);
> > -     out_be32(&vr->picture_count, reg_val.picture_count);
> > -     out_be32(&vr->field_base_addr, reg_val.field_base_addr);
> > +     iowrite32be(reg_val.dma_inc, &vr->dma_inc);
> > +     iowrite32be(reg_val.picture_count, &vr->picture_count);
> > +     iowrite32be(reg_val.field_base_addr, &vr->picture_count);
>
> That last conversion is wrong.

Good catch, thanks! I have sent a v2.
