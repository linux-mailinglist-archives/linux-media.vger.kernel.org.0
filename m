Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D55303AAAF
	for <lists+linux-media@lfdr.de>; Sun,  9 Jun 2019 19:21:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731246AbfFIRUh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 9 Jun 2019 13:20:37 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:20540 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730139AbfFIRUg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 9 Jun 2019 13:20:36 -0400
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id x59HKQ00009606;
        Mon, 10 Jun 2019 02:20:26 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com x59HKQ00009606
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1560100827;
        bh=1ySK9wzh5EoMbwrJ8cJodwxCbTXiTLYsNbdKaL1fqtI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=GZ0tzeWlAtCiiyKxspCt0mUF0VDxbXBDzbXup66dIyNRwF29xHu6y3v0d8yGc7Vga
         BiKpv0OmeIeE0Y66CjkuCM+0BAPuHv1VpltpWJ4TF2i5DXqa1Pe+p7jpFy8qe6vWrH
         qBKhpSVH6QPz0zbLAxA1LLigJy1pWtotzKV1RzrmcBb7aDdctBwTyz4mnj31ujvRA1
         boAROXP/k2UEiz83ZrBY9a5jhxoBe8lagGWMj1GA2PXUweoWWtBmC9iCaWNUWsIsGk
         qq/MlfQvpU/KtLxzhFdbF+0aQq3JMcHX5lESVHkQegw3Bsmay3vomR7TkWbL8a/zpl
         M5zJ8+cvafWLg==
X-Nifty-SrcIP: [209.85.217.47]
Received: by mail-vs1-f47.google.com with SMTP id q64so4012902vsd.1;
        Sun, 09 Jun 2019 10:20:26 -0700 (PDT)
X-Gm-Message-State: APjAAAWd/57RmiEDymoUbAULTiOP+z18XgVSkE+NoyC2mDkH8V8D7OvI
        MMB7n8q/BCIbDLMW9NoM/M5tAN+KMD/oQpARyF0=
X-Google-Smtp-Source: APXvYqyVekfcVCyZGa1ldLjCcfToCDvlg8U4tDLhnKcPBhGAs7CzTNxomvXqVEzZuvlWy2C4qxXT+i4Fa5So7679jEA=
X-Received: by 2002:a67:cd1a:: with SMTP id u26mr14566333vsl.155.1560100825584;
 Sun, 09 Jun 2019 10:20:25 -0700 (PDT)
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
 <CAK7LNARsSFT1ncyRgWi_tga_7KC6ZwZOETXQ2GrO9PfeJgLxyQ@mail.gmail.com>
 <ba5ec856bce34eead8ba655b9bd6c54b002c40b5.camel@perches.com>
 <CAK7LNAToTXt71obf8NvOiuN5MnxHs+-dkCp_Midu9e6OaOqc4g@mail.gmail.com> <bd1ef99fc503fed492ad036f781963ca15a8596f.camel@perches.com>
In-Reply-To: <bd1ef99fc503fed492ad036f781963ca15a8596f.camel@perches.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Mon, 10 Jun 2019 02:19:49 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT3iKOX=0GxrB__m9haM=0L+MZQRq_OvFhW5N3iaaBAPA@mail.gmail.com>
Message-ID: <CAK7LNAT3iKOX=0GxrB__m9haM=0L+MZQRq_OvFhW5N3iaaBAPA@mail.gmail.com>
Subject: Re: [PATCH] media: do not use C++ style comments in uapi headers
To:     Joe Perches <joe@perches.com>
Cc:     Julia Lawall <julia.lawall@lip6.fr>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
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

On Sun, Jun 9, 2019 at 10:40 PM Joe Perches <joe@perches.com> wrote:
>
> On Sun, 2019-06-09 at 22:08 +0900, Masahiro Yamada wrote:
> > On Sun, Jun 9, 2019 at 8:57 PM Joe Perches <joe@perches.com> wrote:
> > > On Sun, 2019-06-09 at 16:14 +0900, Masahiro Yamada wrote:
> > > > Hi Joe,
> > > >
> > > > On Thu, Jun 6, 2019 at 2:06 AM Joe Perches <joe@perches.com> wrote:
> > > > > Perhaps a checkpatch change too:
> > > > >
> > > > > The first block updates unsigned only bitfields
> > > > > The second tests uapi definitions and suggests "__<kernel_types"
> > > >
> > > > Good.
> > > >
> > > > In addition,
> > > >
> > > > "warn if __u8, __u16, __u32, __u64 are used outside of uapi/"
> > > >
> > > > Lots of kernel-space headers use __u{8,16,32,64} instead of u{8,16,32,64}
> > > > just because developers often miss to understand when to use
> > > > the underscore-prefixed types.
> > >
> > > The problem there is that checkpatch can't know if the
> > > __<uapi_type> being used is for an actual uapi use or not.
> > >
> > > coccinelle could be much better at that.
> >
> > Why?
>
>
> Perhaps it's (somewhat) bad form to have a __uapi type in a
> structure, include that structure in a driver for something
> like a copy_to/from_user, and map the __<uapi_type> to a non
> underscore prefixed <kernel_type>

Linus Torvalds wrote 'sparse' to check this.

Any attempt to distinguish the address-space
by the presence of double-underscore-prefixes is pointless.
This is already checked by __kernel / __user.

It is absolutely correct to assign __u32 to u32, and vice versa.

If you think the following patch is wrong, please tell me why:


diff --git a/drivers/android/binder.c b/drivers/android/binder.c
index 748ac489ef7e..24c1b73d9fbd 100644
--- a/drivers/android/binder.c
+++ b/drivers/android/binder.c
@@ -1132,7 +1132,7 @@ static struct binder_node *binder_init_node_ilocked(
        struct binder_node *node;
        binder_uintptr_t ptr = fp ? fp->binder : 0;
        binder_uintptr_t cookie = fp ? fp->cookie : 0;
-       __u32 flags = fp ? fp->flags : 0;
+       u32 flags = fp ? fp->flags : 0;

        assert_spin_locked(&proc->inner_lock);

@@ -4918,7 +4918,7 @@ static int
binder_ioctl_get_node_info_for_ref(struct binder_proc *proc,
 {
        struct binder_node *node;
        struct binder_context *context = proc->context;
-       __u32 handle = info->handle;
+       u32 handle = info->handle;

        if (info->strong_count || info->weak_count || info->reserved1 ||
            info->reserved2 || info->reserved3) {




>
> For instance
>
> struct flat_binder_object in drivers/android/binder.c
>
> How is checkpatch supposed to know that __u32 flags is
> inappropriate?
>
>


-- 
Best Regards
Masahiro Yamada
