Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A88F84C98D9
	for <lists+linux-media@lfdr.de>; Wed,  2 Mar 2022 00:10:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236539AbiCAXKk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Mar 2022 18:10:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234138AbiCAXKi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Mar 2022 18:10:38 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D775946B32
        for <linux-media@vger.kernel.org>; Tue,  1 Mar 2022 15:09:55 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id f37so29405584lfv.8
        for <linux-media@vger.kernel.org>; Tue, 01 Mar 2022 15:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ojIOUCrgcIak8ZCc1skMdXRKcTVmt9Elm/o+1+I6jGA=;
        b=fmg4LXx5HRB2mrrWsHndl76rC2chdk1sBRQyNWtz+o2V+K2vg9psF6vr/ppax24roG
         0IEY6nkgVM6qwn95jhK4YeupoNeTj8/flkbxBQUDmf863ReCVguQlY3gsMWixLyIz8Mx
         ewpCP9yjbapnom8xtoCAmNy70uRnweYHKzlsw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ojIOUCrgcIak8ZCc1skMdXRKcTVmt9Elm/o+1+I6jGA=;
        b=PS5JD2TsDHniPZBdHTWmymAjyoUiBwaHe03HkwMMTlpARheAgGd+czSM6RJBHd1z1J
         hA3WLGDYzpGeNYwmVou82mrH+PLFRWa7GwY/8lwvwxEuqbhj43jNpBKqL7ur7Q+WO41l
         sjl9+DpV63L2dodXHDFm7LtvzgLwLpPtZUyzqNA4AL9PucOJDLRZeirBCrWmLUyVxltx
         J6SZQtki1Fi8sf6IlVt/dzlTrNHg4H5yAzMDtdX6gQeUfJjc3UsO/vAI5JrM5JEC42dn
         DWV9BlKa7jsR6XGZtdLkW68czRrHq8ZV7IBfmd8OAxQjuI8tiryB+34tqAT1k66ryFPK
         hCsw==
X-Gm-Message-State: AOAM532TaMq4VCqZgtGqsbBvlO3D76e3gPLKJwIFo6MpJ2/QvVxTQ3MA
        ggdNQzxXFfsp7lMoWUR9y1FdGkViD9H3dPhDIrw=
X-Google-Smtp-Source: ABdhPJyLa2O/FQ/3i3ctWiYUapI1Cpz7XvGxbvZwhFHkElBuLtoMDqNqaX6lJZQUw/976zn6RxE6jg==
X-Received: by 2002:a05:6512:92b:b0:445:81a9:b9e0 with SMTP id f11-20020a056512092b00b0044581a9b9e0mr13330671lft.302.1646176194027;
        Tue, 01 Mar 2022 15:09:54 -0800 (PST)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id b3-20020ac25623000000b004435fb1f5basm1709968lff.78.2022.03.01.15.09.53
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Mar 2022 15:09:53 -0800 (PST)
Received: by mail-lj1-f175.google.com with SMTP id y24so4920751ljh.11
        for <linux-media@vger.kernel.org>; Tue, 01 Mar 2022 15:09:53 -0800 (PST)
X-Received: by 2002:a2e:924d:0:b0:246:370c:5618 with SMTP id
 v13-20020a2e924d000000b00246370c5618mr18436468ljg.358.1646175815802; Tue, 01
 Mar 2022 15:03:35 -0800 (PST)
MIME-Version: 1.0
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com> <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
 <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
 <282f0f8d-f491-26fc-6ae0-604b367a5a1a@amd.com> <b2d20961dbb7533f380827a7fcc313ff849875c1.camel@HansenPartnership.com>
 <7D0C2A5D-500E-4F38-AD0C-A76E132A390E@kernel.org> <73fa82a20910c06784be2352a655acc59e9942ea.camel@HansenPartnership.com>
 <CAHk-=wiT5HX6Kp0Qv4ZYK_rkq9t5fZ5zZ7vzvi6pub9kgp=72g@mail.gmail.com> <7dc860874d434d2288f36730d8ea3312@AcuMS.aculab.com>
In-Reply-To: <7dc860874d434d2288f36730d8ea3312@AcuMS.aculab.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 1 Mar 2022 15:03:19 -0800
X-Gmail-Original-Message-ID: <CAHk-=whKqg89zu4T95+ctY-hocR6kDArpo2qO14-kV40Ga7ufw@mail.gmail.com>
Message-ID: <CAHk-=whKqg89zu4T95+ctY-hocR6kDArpo2qO14-kV40Ga7ufw@mail.gmail.com>
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
To:     David Laight <David.Laight@aculab.com>
Cc:     James Bottomley <James.Bottomley@hansenpartnership.com>,
        linux-wireless <linux-wireless@vger.kernel.org>,
        "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        KVM list <kvm@vger.kernel.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
        "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Cristiano Giuffrida <c.giuffrida@vu.nl>,
        "Bos, H.J." <h.j.bos@vu.nl>,
        "linux1394-devel@lists.sourceforge.net" 
        <linux1394-devel@lists.sourceforge.net>,
        "drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>,
        linux-arch <linux-arch@vger.kernel.org>,
        CIFS <linux-cifs@vger.kernel.org>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        linux-scsi <linux-scsi@vger.kernel.org>,
        linux-rdma <linux-rdma@vger.kernel.org>,
        "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>,
        "kgdb-bugreport@lists.sourceforge.net" 
        <kgdb-bugreport@lists.sourceforge.net>,
        "bcm-kernel-feedback-list@broadcom.com" 
        <bcm-kernel-feedback-list@broadcom.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Arnd Bergman <arnd@arndb.de>,
        Linux PM <linux-pm@vger.kernel.org>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        dma <dmaengine@vger.kernel.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Jakob Koschel <jakobkoschel@gmail.com>,
        "v9fs-developer@lists.sourceforge.net" 
        <v9fs-developer@lists.sourceforge.net>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-sgx@vger.kernel.org" <linux-sgx@vger.kernel.org>,
        linux-block <linux-block@vger.kernel.org>,
        Netdev <netdev@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux F2FS Dev Mailing List 
        <linux-f2fs-devel@lists.sourceforge.net>,
        "tipc-discussion@lists.sourceforge.net" 
        <tipc-discussion@lists.sourceforge.net>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Mar 1, 2022 at 2:58 PM David Laight <David.Laight@aculab.com> wrote:
>
> Can it be resolved by making:
> #define list_entry_is_head(pos, head, member) ((pos) == NULL)
> and double-checking that it isn't used anywhere else (except in
> the list macros themselves).

Well, yes, except for the fact that then the name is entirely misleading...

And somebody possibly uses it together with list_first_entry() etc, so
it really is completely broken to mix that change with the list
traversal change.

             Linus

               Linus
