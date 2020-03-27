Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F6DF195673
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2020 12:34:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726742AbgC0Lez (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Mar 2020 07:34:55 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:39618 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726360AbgC0Ley (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Mar 2020 07:34:54 -0400
Received: by mail-ed1-f65.google.com with SMTP id a43so10633075edf.6
        for <linux-media@vger.kernel.org>; Fri, 27 Mar 2020 04:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+HBDIdNbauUzWWpYygi2C8elHABQwqvtXozjKK9jHI8=;
        b=g9mIfMvDXBJf9IKXU+ep7HNuIrcACmkCAlfPqrOeebATZu/zp+1kFgDcYwIlwtarnT
         uGHcciMeUHiOiCf9zVFQo8SK+++7ueQJZcS0YbeFeq49y5a+IbMjk7Bhnm8v5+wj16ow
         nSVG6bfxiVbsBcMTQ9hRdH+zTtM7PL50EsVYs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+HBDIdNbauUzWWpYygi2C8elHABQwqvtXozjKK9jHI8=;
        b=cCpsKTGbqnBtmHUMrlIF3Ebhnz8q+O0vuX0ZeBk4aPO+WQusL1s+hS3rNUgBxT6v83
         tewXELpdeuTmf986/XX4ux64yCT/agGwFaRI7e4fWK4EdlWTZwnV1tCiKjRLg6QLJPTQ
         aJ84KJTkqnkpWkhr4gexT+l0qdYRDO6p0YbNskfuAbauNwWBNDXY7ZNOTi0xCHWbdida
         41Zy8GfarYPE9cQLHujpSsOy4tCnu2GfS+WvumII76WjUV2tmW96BxWC7jzoZ80HviyF
         Rqde4N1UxGOKNA/2eqjcXrxRfHGPiooV+ZccpECpLtRRihFaAGb2+IK56rr/mamVo7I5
         wWRQ==
X-Gm-Message-State: ANhLgQ0+shvq6TJ9RvKBuD0bkuH25oSalWpBTWdOERDybtrjg1sQc327
        xsTEaYtpAw27tvMaxuDZyVVssipuYrc7VQ==
X-Google-Smtp-Source: ADFU+vudhwRzzCFkVdObyUZCWkukVLPhs8EaOKutiYkDu03uNOoVR0AmE/C5Eh/h/iByXcZ0z9Rorg==
X-Received: by 2002:a17:906:18a1:: with SMTP id c1mr11714210ejf.344.1585308892082;
        Fri, 27 Mar 2020 04:34:52 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id h22sm640372edw.34.2020.03.27.04.34.51
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2020 04:34:51 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id i7so5686874edq.3
        for <linux-media@vger.kernel.org>; Fri, 27 Mar 2020 04:34:51 -0700 (PDT)
X-Received: by 2002:adf:f0c5:: with SMTP id x5mr14731096wro.415.1585308473751;
 Fri, 27 Mar 2020 04:27:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200302041213.27662-1-senozhatsky@chromium.org>
 <20200302041213.27662-5-senozhatsky@chromium.org> <6e4fc7f9-0068-92ff-77d7-9c77c047f3db@collabora.com>
 <20200324023909.GA201720@google.com> <1187a3f660b092d8a9d5437445155edfc0744a4f.camel@collabora.com>
 <20200325023248.GA241329@google.com>
In-Reply-To: <20200325023248.GA241329@google.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 27 Mar 2020 12:27:41 +0100
X-Gmail-Original-Message-ID: <CAAFQd5BhDLcKHR1aO2U5Lf6EBhoqtBJbg6LzWDQd7XkDJ1YUaw@mail.gmail.com>
Message-ID: <CAAFQd5BhDLcKHR1aO2U5Lf6EBhoqtBJbg6LzWDQd7XkDJ1YUaw@mail.gmail.com>
Subject: Re: [PATCHv4 04/11] videobuf2: add queue memory consistency parameter
To:     Sergey Senozhatsky <senozhatsky@chromium.org>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pawel Osciak <posciak@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        nicolas.dufresne@collabora.co.uk
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Mar 25, 2020 at 3:32 AM Sergey Senozhatsky
<senozhatsky@chromium.org> wrote:
>
> On (20/03/24 07:17), Ezequiel Garcia wrote:
> [..]
> > > > > +static void set_queue_consistency(struct vb2_queue *q, bool consistent_mem)
> > > > > +{
> > > > > +       if (!vb2_queue_allows_cache_hints(q))
> > > > > +               return;
> > > > > +
> > > > > +       if (consistent_mem)
> > > > > +               q->dma_attrs &= ~DMA_ATTR_NON_CONSISTENT;
> > > > > +       else
> > > > > +               q->dma_attrs |= DMA_ATTR_NON_CONSISTENT;
> > > > > +}
> > > > > +
> > > > >   int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
> > > > > -               unsigned int *count)
> > > > > +               bool consistent_mem, unsigned int *count)
> > > > You extended the vb2_core_reqbufs accepting a new boolean that
> > > > is decided according to the setting of the V4L2_FLAG_MEMORY_NON_CONSISTENT
> > > > but in the future some other flags might be added, and so I think it
> > > > is better to replace the boolean with a u32 consisting of all the flags.
> > >
> > > Don't have any objections. Can change the `bool' to `u32'.
> > >
> >
> > or maybe an enum instead? That would help get a cleaner
> > interface.
>
> Hmm, interesting.
>
> The flags in question can be from different, unrelated groups
> (types), controlling various parts of the stack. Not necessarily
> all of them are memory_consistency related. We can, for instance,
> pass some additional flags to underlying memory allocators (contig,
> sg), etc.
>
> E.g.
>
>         enum MEMORY_ATTR {
>                 MEM_NON_CONSISTENT,
>                 ...
>         };
>
>         enum VMALLOC_ALLOCATOR_ATTR {
>                 DO_A_BARREL_ROLL,
>                 ...
>         };
>
>         enum DMA_SG_ALLOCATOR_ATTR {
>                 WRITEBACK_TO_TAPE_DEVICE,
>                 ...
>         };
>
>         enum DMA_CONTIG_ALLOCATOR_ATTR {
>                 PREFER_HTTPS,
>                 ...
>         };
>
> and so on. We maybe can keep all of those in one enum (umm, what should
> be the name?), and then either make sure that all of them are proper powers
> of two
>
>         enum AUX_FLAGS {
>                 MEM_NON_CONSISTENT              = (1 << 0),
>                 DO_A_BARREL_ROLL                = (1 << 1),
>                 WRITEBACK_TO_TAPE_DEVICE        = (1 << 2),
>                 PREFER_HTTPS                    = (1 << 3),
>         };
>
> or
>         enum AUX_FLAGS {
>                 MEM_NON_CONSISTENT              = 0,
>                 DO_A_BARREL_ROLL,
>                 WRITEBACK_TO_TAPE_DEVICE,
>                 PREFER_HTTPS,
>         };
>
> and make sure that those are not flags, but bits.
> IOW, if (flags & BIT(MEM_NON_CONSISTENT)).
>
>
> What do others think?

My feeling is that there it's a bit of an abuse of the language
construct. Enum is expected to be an enumeration type, where the value
is always one and only one of the defined values at the same time.
Making a bitwise OR of several values makes the resulting value
outside of the enum specification.

AFAICT, the typical approach in the kernel is to just have a block of
#define statements to define the flags and have the flag names
prefixed with some consistent prefix, e.g. VB2_QUEUE_FLAG_. The flags
itself would be defined using BIT() so they can be used directly in
the bitwise arithmetics.

Best regards,
Tomasz
