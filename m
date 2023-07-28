Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11241766723
	for <lists+linux-media@lfdr.de>; Fri, 28 Jul 2023 10:31:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234869AbjG1IbL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jul 2023 04:31:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234659AbjG1Iak (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jul 2023 04:30:40 -0400
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C97C31FED
        for <linux-media@vger.kernel.org>; Fri, 28 Jul 2023 01:29:09 -0700 (PDT)
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-63d23473ed5so11237776d6.1
        for <linux-media@vger.kernel.org>; Fri, 28 Jul 2023 01:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690532948; x=1691137748;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s9onuw/s5NAwrbwcLE9q81RImhLX/fPjqMPrg03RdLg=;
        b=dZlvcBK+66v2GBUqqJZWE3e9xQB2zImy4i75DLQ3ll3JPqt7FF8tL14bvXsWPYvspm
         gqZD0bdbeUr9rw2CUG8DsbjWz0ZCU++tlVR2v7+Du+VntBL1AvH0hNIToN4ihwok4ivz
         ddnoRrm9VNK8udFZs4p1E34gpEERL/4+Zjgq0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690532948; x=1691137748;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s9onuw/s5NAwrbwcLE9q81RImhLX/fPjqMPrg03RdLg=;
        b=cbVu6G1FuvVTBLsP8FGLOEQLFptvXo4IfdJvOcr8oW7EjRwoV131BGFlgX5ENKQ6kg
         udx4aXrhxvnx4dVTWNfG/RExu6BUmuvUqXLhukg0xJhQtTjGRREpWEF91rVdF1qf3VtV
         xicdHt/C9Cc3PUqlBx+QhdqkOeDECFIngoXaHmAGrc5SuYiLac8SEu668JXakCA6tZRx
         p3yExL7w1lPfhBD+/NGLBUF+1fWN4XVmpmC/bd8VrHz1+j+R3kkwGF4uPwEMRXv0YHCy
         xZFrlxp0a6ThL4DzwpC1XFBaweQuo6YIwWs/pHGFENCR2cur7mYIxGGRytO6CM/JMvCy
         elLA==
X-Gm-Message-State: ABy/qLbeQZesnroCd2zPQLVHUse+czi4XjDuTKzOWubPqPfmle+ILbmO
        ncsK+Fl+R8grl1sPDp9YcXYYIIYXPun160N33ur2fCUs
X-Google-Smtp-Source: APBJJlGqcoI/POF9qeflANPDHhkDiqXqNoAL4teAYXsyh+dUNbIxb+6EqnhWaAEL+MECFBq3ICZ++A==
X-Received: by 2002:ad4:48c8:0:b0:630:1faa:a404 with SMTP id v8-20020ad448c8000000b006301faaa404mr1432904qvx.39.1690532948459;
        Fri, 28 Jul 2023 01:29:08 -0700 (PDT)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com. [209.85.160.174])
        by smtp.gmail.com with ESMTPSA id u1-20020a05620a120100b0076827ce13f6sm973808qkj.10.2023.07.28.01.29.07
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jul 2023 01:29:07 -0700 (PDT)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-406bd9ed61cso12057391cf.3
        for <linux-media@vger.kernel.org>; Fri, 28 Jul 2023 01:29:07 -0700 (PDT)
X-Received: by 2002:ac8:7c44:0:b0:403:cd14:8f with SMTP id o4-20020ac87c44000000b00403cd14008fmr2106914qtv.57.1690532947480;
 Fri, 28 Jul 2023 01:29:07 -0700 (PDT)
MIME-Version: 1.0
References: <a2ffa1cb-42db-a78a-8bd7-b0e422aade13@synaptics.com>
 <CAAFQd5AFJwreERs2Hn_A+3g51OLF6F0eWjx2+rgiZV=FR_61fA@mail.gmail.com>
 <20230728043347.GM955071@google.com> <20230728081824.GC28824@pendragon.ideasonboard.com>
In-Reply-To: <20230728081824.GC28824@pendragon.ideasonboard.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 28 Jul 2023 17:28:56 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BqDo41U05pmQ+eQvWa0YpJj2OTyKXDAFPwX2S5s5sqBg@mail.gmail.com>
Message-ID: <CAAFQd5BqDo41U05pmQ+eQvWa0YpJj2OTyKXDAFPwX2S5s5sqBg@mail.gmail.com>
Subject: Re: [RFC]: m2m dec reports the graphics memory requirement
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Hsia-Jun Li <Randy.Li@synaptics.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        ayaka <ayaka@soulik.info>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, Brian.Starkey@arm.com,
        boris.brezillon@collabora.com, frkoenig@chromium.org,
        hans.verkuil@cisco.com, hiroh@chromium.org,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Helen Koike <helen.koike@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jul 28, 2023 at 5:18=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Fri, Jul 28, 2023 at 01:33:47PM +0900, Sergey Senozhatsky wrote:
> > On (23/07/27 17:17), Tomasz Figa wrote:
> > > On Fri, Jun 30, 2023 at 7:47=E2=80=AFPM Hsia-Jun Li wrote:
> > > >
> > > > Hello All
> > > >
> > > > This RFC tries to address the following problems:
> > > >
> > > > 1. Application may request too many buffers, increasing pressure to
> > > > system's memory allocator(Thinking about running Android with 8K UH=
D
> > > > playback in a system with only 2 GiB memory available);
> > >
> > > Yeah, I think that's something that has to be addressed. It was also
> > > mentioned recently in the review of the DELETE_BUF series. I think we
> > > need some kind of accounting of the allocations to the processes, so
> > > that the per-process limits of memory usage could apply. Let me add
> > > +Sergey Senozhatsky who often crosses his path with kernel memory
> > > management.
> >
> > That's an interesting topic. The usual approach would be memcg: we
> > create a memory controller, set memory usage limit, then move tasks
> > under that controller. The last part is problematic, as it implies
> > a well-behaving user-space. I'm not aware of a simple way (or any
> > way for that matter) to "automatically enforce" memcg on a process
> > group.
> >
> > From what I can tell networking code attempts to "enforce" memcg on its
> > allocations, and hence has to manually charge memcg. For instance, take
> > a look at sock_reserve_memory() and corresponding mem_cgroup_charge_skm=
em()
> > call.
> >
> > So I wonder if we can take a closer look at what networking does and
> > do something similar in vb2.
>
> It's a long-standing issue that would be nice to solve indeed. I however
> wonder if we should do so in vb2, or instead invest our time and efforts
> in transitioning to DMA heaps and solving the memory accounting issue
> there.

Would we then provide some way to disable MMAP buffer support for
applications? Or you're thinking more about backing MMAP allocations
with DMA-buf heaps internally in the kernel?

Best regards,
Tomasz
