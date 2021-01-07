Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C0A22ED188
	for <lists+linux-media@lfdr.de>; Thu,  7 Jan 2021 15:15:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728539AbhAGOPH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jan 2021 09:15:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728187AbhAGOPC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Jan 2021 09:15:02 -0500
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96F1AC0612F5
        for <linux-media@vger.kernel.org>; Thu,  7 Jan 2021 06:14:21 -0800 (PST)
Received: by mail-il1-x12a.google.com with SMTP id q1so6833745ilt.6
        for <linux-media@vger.kernel.org>; Thu, 07 Jan 2021 06:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5EKjm5VT/QdJn/B1BYcuiBIUG9oQpN1/AMx3O8ZLC64=;
        b=LF4UpleR6FsIZbyEpjiLbQPE887zOCnrGlHR7ccv+cu7FlMU1Yo0SbefHfeSAgdlMR
         Ldk5bvNrxJgg/hf9f0gZ+xMoDsCQ22tTW1nM1jLgelWwGVg4lSQdm+o+adk3MQZrjP26
         oyA4A0yU9yq7NCGzqcSM5ysirka/OI141IFrs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5EKjm5VT/QdJn/B1BYcuiBIUG9oQpN1/AMx3O8ZLC64=;
        b=KAyEt5QgHa9jpER2/tN/VuFrWX9u5ggenEBI7/9uZ2VvSjX1fMRR+cFheFICYQTbjZ
         QtenTuoV2R8WEpgpl9xhvnyEI//+a3g4UBa00TiDeHV+pGehZkIvSF/Icqx1YL/AFRUf
         dEHSxezoejjY4lHybmqqyyWYsB77VB9s9hIvScHlT/DhhIYWA/Qw5LhWtjPUetlu7fSx
         hLLDIp6i+3FWAAHtA9O9uAMkTUeFpNXruB9Dg6jIkAbW4SjVl/I81wRNiwAMgG1BSOpm
         Uh2MIlhQqPqOu6anFmXMvCCuYDwd1RoDtLYuC7GYKJfq4NymVzvXH+fu6yB5VckmUoqV
         Ddaw==
X-Gm-Message-State: AOAM531cj639IAKEbYbgvpwyNmEK7MhGE3v41Sf5oCmiqr6+0iTkryAL
        BrXgNqinwl/pc83jMv/g6ApghAJflruTmw==
X-Google-Smtp-Source: ABdhPJzZjuUJ8qIup4YsbLITygzOooF+Di6VKB0WEzJ1Yr46KndQZ/N9/W5Zwwr30rFXBlAzzbVdvA==
X-Received: by 2002:a92:9a42:: with SMTP id t63mr9308461ili.176.1610028860699;
        Thu, 07 Jan 2021 06:14:20 -0800 (PST)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com. [209.85.166.52])
        by smtp.gmail.com with ESMTPSA id h16sm4564639ile.6.2021.01.07.06.14.19
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Jan 2021 06:14:19 -0800 (PST)
Received: by mail-io1-f52.google.com with SMTP id p187so6251247iod.4
        for <linux-media@vger.kernel.org>; Thu, 07 Jan 2021 06:14:19 -0800 (PST)
X-Received: by 2002:a6b:cd02:: with SMTP id d2mr1461830iog.4.1610028858785;
 Thu, 07 Jan 2021 06:14:18 -0800 (PST)
MIME-Version: 1.0
References: <20201125221917.150463-1-ribalda@chromium.org> <20201130083410.GD32234@lst.de>
 <20201201033658.GE3723071@google.com> <20201201144916.GA14682@lst.de>
 <CAAFQd5BBEbmENrrZ-vMK9cKOap19XWmfcxwrxKfjWx-wEew8rg@mail.gmail.com>
 <20201208071320.GA1667627@google.com> <20201209111639.GB22806@lst.de>
In-Reply-To: <20201209111639.GB22806@lst.de>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Thu, 7 Jan 2021 15:14:08 +0100
X-Gmail-Original-Message-ID: <CANiDSCtsOdJUK3r_t8UNKhh7Px0ANNFJkuwM1fBgZ7wnVh0JFA@mail.gmail.com>
Message-ID: <CANiDSCtsOdJUK3r_t8UNKhh7Px0ANNFJkuwM1fBgZ7wnVh0JFA@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] media: uvcvideo: Use dma_alloc_noncontiguos API
To:     ". Christoph Hellwig" <hch@lst.de>
Cc:     Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
        Joerg Roedel <joro@8bytes.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sergey Senozhatsky <senozhatsky@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Christoph

Happy new year!

On Wed, Dec 9, 2020 at 12:16 PM . Christoph Hellwig <hch@lst.de> wrote:
>
> On Tue, Dec 08, 2020 at 04:13:20PM +0900, Sergey Senozhatsky wrote:
> > On (20/12/08 13:54), Tomasz Figa wrote:
> > >
> > > In any case, Sergey is going to share a preliminary patch on how the
> > > current API would be used in the V4L2 videobuf2 framework. That should
> > > give us more input on how such a helper could look.
> >
> > HUGE apologies for the previous screw up! I replied in the
> > gmail web-interface and that did not work out as expected
> > (at all, big times).
>
> Actually the previous mail was a mime multipart one, and the plain text
> version displayed just fine here.  My the gmail engineers finally learned
> something after all.
>
> > Another thing to notice is that the new API requires us to have two execution branches
> > in allocators - one for the current API; and one for the new API (if it's supported and
> > if user-space requested non-coherent allocation).
>
> So I think we do want these branches for coherent vs non-coherent as they
> have very different semantics and I do not think that hiding them under
> the same API helps people to understand those vastly different semantics.
>
> OTOH we should look into a fallback for DMA API instances that do not
> support the discontigous allocations.
>
> I think between your comments and those from Ricardo I have a good idea
> for a somewhat updated API.  I'll try to post something in the next days.

Did you have time to look into this?

No hurry, I just want to make sure that I didn't miss anything ;)

Best regards!



-- 
Ricardo Ribalda
