Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B1AC3A41C
	for <lists+linux-media@lfdr.de>; Sun,  9 Jun 2019 09:15:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727857AbfFIHPC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 9 Jun 2019 03:15:02 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:47451 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726480AbfFIHPB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 9 Jun 2019 03:15:01 -0400
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id x597EoCA007060;
        Sun, 9 Jun 2019 16:14:50 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com x597EoCA007060
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1560064491;
        bh=koGfY6G7pzR5wea35jEhPfB4k36cqfiIOGXZGu0RjJo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=fqirKY+2gLNxTRv5kBH7wBqEjQRbmUeQlUtjzniC96y/Aox7AKtOb4KC6eLO95+JL
         Nf+5iE5dUJ05THf7aNB7LUs7SgayPaRNd/fs1E9PSBKrKwVAdoYaYFwGkLDhO2z3TO
         68AcCzpG5QiEwl/olYdvz5qLi4OQ07uecEhnZZ4zUklZXhMtVELMhZirANMInyGp1g
         Sqft+IG9jLTQtiW8V9SdrWsOTF3rjhXQsteJx74A6FzdGCRx4hptAaEYN35a0YtU0M
         dkBN1FajHw3DljGPxMFgROaGpNsuG6EpyyFROk7jAmLqyvdtpL9KZ/4wVVm9k3pfAS
         bL+PpyecibYZQ==
X-Nifty-SrcIP: [209.85.222.53]
Received: by mail-ua1-f53.google.com with SMTP id v18so2006272uad.12;
        Sun, 09 Jun 2019 00:14:50 -0700 (PDT)
X-Gm-Message-State: APjAAAUX1Rtbwo+74Zna2tEwfhG8xxvNA67EMjfpX8/Blf2gCqtmthFc
        jR9gBaqoVakMHxEM39iuLaenwa+fqJ3oLx2nk2M=
X-Google-Smtp-Source: APXvYqyryZhaLhtFPJQdqZj/9v77HrZO3uWu0dDn2RY1fJhH8cijdhI3QmNfCZsiuuzzSOHIMYXvGZSJeFuymyzr+p8=
X-Received: by 2002:ab0:234e:: with SMTP id h14mr5695508uao.25.1560064489796;
 Sun, 09 Jun 2019 00:14:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190604111334.22182-1-yamada.masahiro@socionext.com>
 <8cf48e20064eabdfe150795365e6ca6f36032e9f.camel@perches.com>
 <CAK8P3a1oDfNF_T+NCoPsXkJAY2x4_uCWSwrDXHi7dDSaMqfnfA@mail.gmail.com>
 <CAK7LNAS0Ph2Z6x0-UPSkJUC31NvPi09BmFrve+YJcXMrop-BGA@mail.gmail.com>
 <20190604134213.GA26263@kroah.com> <CAK7LNARyqW3q6_46e-aYjmF8c0jUNDLdyB28zNaBEXqTV+5QSA@mail.gmail.com>
 <CAK8P3a0bz8XYJOsmND2=CT_oTDmGMJGaRo9+QMroEhpekSMEaQ@mail.gmail.com>
 <CAK7LNARU+uT0aUBh5niwEafL8+Ok7=sOZYukptpDH1w7Cii3hQ@mail.gmail.com>
 <20190605051040.GA22760@kroah.com> <b70cf8c1f901ea09abbdb22dd28244b18fd1a39d.camel@perches.com>
 <20190605071413.779bd821@coco.lan> <a798561d24c486d31063a7994d8630c859df00e9.camel@perches.com>
In-Reply-To: <a798561d24c486d31063a7994d8630c859df00e9.camel@perches.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Sun, 9 Jun 2019 16:14:13 +0900
X-Gmail-Original-Message-ID: <CAK7LNARsSFT1ncyRgWi_tga_7KC6ZwZOETXQ2GrO9PfeJgLxyQ@mail.gmail.com>
Message-ID: <CAK7LNARsSFT1ncyRgWi_tga_7KC6ZwZOETXQ2GrO9PfeJgLxyQ@mail.gmail.com>
Subject: Re: [PATCH] media: do not use C++ style comments in uapi headers
To:     Joe Perches <joe@perches.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Randy Dunlap <rdunlap@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Joe,

On Thu, Jun 6, 2019 at 2:06 AM Joe Perches <joe@perches.com> wrote:
> Perhaps a checkpatch change too:
>
> The first block updates unsigned only bitfields
> The second tests uapi definitions and suggests "__<kernel_types"

Good.

In addition,

"warn if __u8, __u16, __u32, __u64 are used outside of uapi/"

Lots of kernel-space headers use __u{8,16,32,64} instead of u{8,16,32,64}
just because developers often miss to understand when to use
the underscore-prefixed types.

-- 
Best Regards
Masahiro Yamada
