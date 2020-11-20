Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28E272BAA1B
	for <lists+linux-media@lfdr.de>; Fri, 20 Nov 2020 13:30:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727846AbgKTMa3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Nov 2020 07:30:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727801AbgKTMa2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Nov 2020 07:30:28 -0500
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CB0DC0613CF
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2020 04:30:27 -0800 (PST)
Received: by mail-ed1-x541.google.com with SMTP id l5so9304479edq.11
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2020 04:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ru0SuoGjv2PEKfnRsTE6otpU3SjtuTdth2pleweppKw=;
        b=OQmDrGg+g2cRjo2jfWESSgnob9ugQtq0oo01oJNrj8mUhJqeVyxPjNdejlzVJiVxql
         67KoRuqhGqcxQPMtBn4jPyC//ZtCtM+j6E26rZq1Hfttrlxyggk5LBCDA3TFNp1K3U72
         jzz5sJ6UCNLzP5BvffUBlEbUoShqcfDkwClLA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ru0SuoGjv2PEKfnRsTE6otpU3SjtuTdth2pleweppKw=;
        b=TPgWrXl797dqIhxtHCEUS3GM5adLIBlCsSdFAcasoRuJ6YFn4dnyxWmaVW5wHGpMhy
         9zVcofAuHn7WkKoy0Q6DE1+NJioA7XaGwdhzcwXrxWLZLlVuii1kk/WjdgJW4YvCSp/b
         dQRGj4LzhuOxuwwbEkbuliVWvxbeSn9lnPBAM4AlG+j4F+fEGFGuwMff5TaklgAD3Q+x
         dghaZEnOKNrUAkVWoUZ+RAdKUQJ94Rk6kvNu/ndn5hNLMFQxjOtOVl97S9OVfRGiTEB/
         j2O/PzZUR64TA8S1EHXgIooXPV3W2u3BtEtzzDxROupV0NjeImVoVqAeROzawuqbtSjS
         9QNQ==
X-Gm-Message-State: AOAM532j4HEbwK5wmDUqh5yRssN6dfd1bdvA8gP/1/qKbTIMAKL770Cb
        wxaRi3MGEz0BnKO4mJHn5TaA5yLrk2tnikNu
X-Google-Smtp-Source: ABdhPJyyW1tq8N//u6UY3d5zId/Urlt9gbYPyTetTDB6eSVa/yZVH3ndwjy3wKQc40mMyS4Geh//wA==
X-Received: by 2002:a05:6402:1d12:: with SMTP id dg18mr10620777edb.238.1605875425737;
        Fri, 20 Nov 2020 04:30:25 -0800 (PST)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id x25sm1011491edl.57.2020.11.20.04.30.25
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2020 04:30:25 -0800 (PST)
Received: by mail-ej1-f41.google.com with SMTP id bo9so6874472ejb.13
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2020 04:30:25 -0800 (PST)
X-Received: by 2002:adf:e54f:: with SMTP id z15mr15453017wrm.159.1605875004418;
 Fri, 20 Nov 2020 04:23:24 -0800 (PST)
MIME-Version: 1.0
References: <20201119144146.1045202-1-daniel.vetter@ffwll.ch>
 <20201119144146.1045202-10-daniel.vetter@ffwll.ch> <f1f3a1d8-d62a-6e93-afc1-87a8e51081e9@xs4all.nl>
 <e1f7d30b-2012-0249-66c7-cf9d7d6246ad@xs4all.nl> <CAKMK7uEzFAtr9yxjaxi-kiuZhb+hWT3q6E41OegJr+J2-zkT8w@mail.gmail.com>
 <9035555a-af6b-e2dd-dbad-41ca70235e21@xs4all.nl> <CAKMK7uFrXJh9jc5-v02A=JE8B3aThbYtTxFN-CGQUB=0TGmKgQ@mail.gmail.com>
 <d44c6518-bd9c-87e0-dce4-2b63890e0f7e@xs4all.nl>
In-Reply-To: <d44c6518-bd9c-87e0-dce4-2b63890e0f7e@xs4all.nl>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Fri, 20 Nov 2020 21:23:12 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DMTwUKE0B5L-WC5ehrrQVeRD_af+TG0FpYiPg0g=89Hg@mail.gmail.com>
Message-ID: <CAAFQd5DMTwUKE0B5L-WC5ehrrQVeRD_af+TG0FpYiPg0g=89Hg@mail.gmail.com>
Subject: Re: [PATCH v6 09/17] media/videbuf1|2: Mark follow_pfn usage as unsafe
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        KVM list <kvm@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Kees Cook <keescook@chromium.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>, Pawel Osciak <pawel@osciak.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Laurent Dufour <ldufour@linux.ibm.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Daniel Jordan <daniel.m.jordan@oracle.com>,
        Michel Lespinasse <walken@google.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Nov 20, 2020 at 9:08 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 20/11/2020 11:51, Daniel Vetter wrote:
> > On Fri, Nov 20, 2020 at 11:39 AM Hans Verkuil <hverkuil@xs4all.nl> wrot=
e:
> >>
> >> On 20/11/2020 10:18, Daniel Vetter wrote:
> >>> On Fri, Nov 20, 2020 at 9:28 AM Hans Verkuil <hverkuil@xs4all.nl> wro=
te:
> >>>>
> >>>> On 20/11/2020 09:06, Hans Verkuil wrote:
> >>>>> On 19/11/2020 15:41, Daniel Vetter wrote:
> >>>>>> The media model assumes that buffers are all preallocated, so that
> >>>>>> when a media pipeline is running we never miss a deadline because =
the
> >>>>>> buffers aren't allocated or available.
> >>>>>>
> >>>>>> This means we cannot fix the v4l follow_pfn usage through
> >>>>>> mmu_notifier, without breaking how this all works. The only real f=
ix
> >>>>>> is to deprecate userptr support for VM_IO | VM_PFNMAP mappings and
> >>>>>> tell everyone to cut over to dma-buf memory sharing for zerocopy.
> >>>>>>
> >>>>>> userptr for normal memory will keep working as-is, this only affec=
ts
> >>>>>> the zerocopy userptr usage enabled in 50ac952d2263 ("[media]
> >>>>>> videobuf2-dma-sg: Support io userptr operations on io memory").
> >>>>>>
> >>>>>> Acked-by: Tomasz Figa <tfiga@chromium.org>
> >>>>>
> >>>>> Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> >>>>
> >>>> Actually, cancel this Acked-by.
> >>>>
> >>>> So let me see if I understand this right: VM_IO | VM_PFNMAP mappings=
 can
> >>>> move around. There is a mmu_notifier that can be used to be notified=
 when
> >>>> that happens, but that can't be used with media buffers since those =
buffers
> >>>> must always be available and in the same place.
> >>>>
> >>>> So follow_pfn is replaced by unsafe_follow_pfn to signal that what i=
s attempted
> >>>> is unsafe and unreliable.
> >>>>
> >>>> If CONFIG_STRICT_FOLLOW_PFN is set, then unsafe_follow_pfn will fail=
, if it
> >>>> is unset, then it writes a warning to the kernel log but just contin=
ues while
> >>>> still unsafe.
> >>>>
> >>>> I am very much inclined to just drop VM_IO | VM_PFNMAP support in th=
e media
> >>>> subsystem. For vb2 there is a working alternative in the form of dma=
buf, and
> >>>> frankly for vb1 I don't care. If someone really needs this for a vb1=
 driver,
> >>>> then they can do the work to convert that driver to vb2.
> >>>>
> >>>> I've added Mauro to the CC list and I'll ping a few more people to s=
ee what
> >>>> they think, but in my opinion support for USERPTR + VM_IO | VM_PFNMA=
P
> >>>> should just be killed off.
> >>>>
> >>>> If others would like to keep it, then frame_vector.c needs a comment=
 before
> >>>> the 'while' explaining why the unsafe_follow_pfn is there and that u=
sing
> >>>> dmabuf is the proper alternative to use. That will make it easier fo=
r
> >>>> developers to figure out why they see a kernel warning and what to d=
o to
> >>>> fix it, rather than having to dig through the git history for the re=
ason.
> >>>
> >>> I'm happy to add a comment, but otherwise if you all want to ditch
> >>> this, can we do this as a follow up on top? There's quite a bit of
> >>> code that can be deleted and I'd like to not hold up this patch set
> >>> here on that - it's already a fairly sprawling pain touching about 7
> >>> different subsystems (ok only 6-ish now since the s390 patch landed).
> >>> For the comment, is the explanation next to unsafe_follow_pfn not goo=
d
> >>> enough?
> >>
> >> No, because that doesn't mention that you should use dma-buf as a repl=
acement.
> >> That's really the critical piece of information I'd like to see. That =
doesn't
> >> belong in unsafe_follow_pfn, it needs to be in frame_vector.c since it=
's
> >> vb2 specific.
> >
> > Ah makes sense, I'll add that.
> >
> >>>
> >>> So ... can I get you to un-cancel your ack?
> >>
> >> Hmm, I really would like to see support for this to be dropped complet=
ely.
> >>
> >> How about this: just replace follow_pfn() by -EINVAL instead of unsafe=
_follow_pfn().
> >>
> >> Add a TODO comment that this code now can be cleaned up a lot. Such a =
clean up patch
> >> can be added on top later, and actually that is something that I can d=
o once this
> >> series has landed.
> >>
> >> Regardless, frame_vector.c should mention dma-buf as a replacement in =
a comment
> >> since I don't want users who hit this issue to have to dig through git=
 logs
> >> to find that dma-buf is the right approach.
> >>
> >> BTW, nitpick: the subject line of this patch says 'videbuf' instead of=
 'videobuf'.
> >
> > Will fix to, and next round will have the additional -EINVAL on top.
> > Iirc Mauro was pretty clear that we can't just delete this, so I kinda
> > don't want to get stuck in this discussion with my patches :-)
>
> Ah, I found that discussion for the v2 of this series.
>
> Yes, add that on top and we can discuss whether to Ack that -EINVAL patch=
 or
> not.
>
> I don't see why we would want to continue supporting a broken model that =
is
> also a security risk, as I understand it.
>
> Tomasz, can you look at the discussion for this old RFC patch of mine:
>
> https://patchwork.linuxtv.org/project/linux-media/patch/20200221084531.57=
6156-9-hverkuil-cisco@xs4all.nl/
>
> Specifically, if we just drop support for follow_pfn(), would that cause
> problems for Chromium since that is apparently still using USERPTR for en=
coders?
>

Nope, we use regular page-backed user pointers and not IO/PFNMAP ones.

By the way, for any inter-device sharing we're using DMABUF. USERPTR
is left only in case of the data coming from the CPU, e.g. network.

> Regards,
>
>         Hans
>
> > -Daniel
> >
> >>
> >> Regards,
> >>
> >>         Hans
> >>
> >>>
> >>> Thanks, Daniel
> >>>
> >>>>
> >>>> Regards,
> >>>>
> >>>>         Hans
> >>>>
> >>>>>
> >>>>> Thanks!
> >>>>>
> >>>>>       Hans
> >>>>>
> >>>>>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> >>>>>> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> >>>>>> Cc: Kees Cook <keescook@chromium.org>
> >>>>>> Cc: Dan Williams <dan.j.williams@intel.com>
> >>>>>> Cc: Andrew Morton <akpm@linux-foundation.org>
> >>>>>> Cc: John Hubbard <jhubbard@nvidia.com>
> >>>>>> Cc: J=C3=A9r=C3=B4me Glisse <jglisse@redhat.com>
> >>>>>> Cc: Jan Kara <jack@suse.cz>
> >>>>>> Cc: Dan Williams <dan.j.williams@intel.com>
> >>>>>> Cc: linux-mm@kvack.org
> >>>>>> Cc: linux-arm-kernel@lists.infradead.org
> >>>>>> Cc: linux-samsung-soc@vger.kernel.org
> >>>>>> Cc: linux-media@vger.kernel.org
> >>>>>> Cc: Pawel Osciak <pawel@osciak.com>
> >>>>>> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> >>>>>> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> >>>>>> Cc: Tomasz Figa <tfiga@chromium.org>
> >>>>>> Cc: Laurent Dufour <ldufour@linux.ibm.com>
> >>>>>> Cc: Vlastimil Babka <vbabka@suse.cz>
> >>>>>> Cc: Daniel Jordan <daniel.m.jordan@oracle.com>
> >>>>>> Cc: Michel Lespinasse <walken@google.com>
> >>>>>> Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> >>>>>> --
> >>>>>> v3:
> >>>>>> - Reference the commit that enabled the zerocopy userptr use case =
to
> >>>>>>   make it abundandtly clear that this patch only affects that, and=
 not
> >>>>>>   normal memory userptr. The old commit message already explained =
that
> >>>>>>   normal memory userptr is unaffected, but I guess that was not cl=
ear
> >>>>>>   enough.
> >>>>>> ---
> >>>>>>  drivers/media/common/videobuf2/frame_vector.c | 2 +-
> >>>>>>  drivers/media/v4l2-core/videobuf-dma-contig.c | 2 +-
> >>>>>>  2 files changed, 2 insertions(+), 2 deletions(-)
> >>>>>>
> >>>>>> diff --git a/drivers/media/common/videobuf2/frame_vector.c b/drive=
rs/media/common/videobuf2/frame_vector.c
> >>>>>> index a0e65481a201..1a82ec13ea00 100644
> >>>>>> --- a/drivers/media/common/videobuf2/frame_vector.c
> >>>>>> +++ b/drivers/media/common/videobuf2/frame_vector.c
> >>>>>> @@ -70,7 +70,7 @@ int get_vaddr_frames(unsigned long start, unsign=
ed int nr_frames,
> >>>>>>                      break;
> >>>>>>
> >>>>>>              while (ret < nr_frames && start + PAGE_SIZE <=3D vma-=
>vm_end) {
> >>>>>> -                    err =3D follow_pfn(vma, start, &nums[ret]);
> >>>>>> +                    err =3D unsafe_follow_pfn(vma, start, &nums[r=
et]);
> >>>>>>                      if (err) {
> >>>>>>                              if (ret =3D=3D 0)
> >>>>>>                                      ret =3D err;
> >>>>>> diff --git a/drivers/media/v4l2-core/videobuf-dma-contig.c b/drive=
rs/media/v4l2-core/videobuf-dma-contig.c
> >>>>>> index 52312ce2ba05..821c4a76ab96 100644
> >>>>>> --- a/drivers/media/v4l2-core/videobuf-dma-contig.c
> >>>>>> +++ b/drivers/media/v4l2-core/videobuf-dma-contig.c
> >>>>>> @@ -183,7 +183,7 @@ static int videobuf_dma_contig_user_get(struct=
 videobuf_dma_contig_memory *mem,
> >>>>>>      user_address =3D untagged_baddr;
> >>>>>>
> >>>>>>      while (pages_done < (mem->size >> PAGE_SHIFT)) {
> >>>>>> -            ret =3D follow_pfn(vma, user_address, &this_pfn);
> >>>>>> +            ret =3D unsafe_follow_pfn(vma, user_address, &this_pf=
n);
> >>>>>>              if (ret)
> >>>>>>                      break;
> >>>>>>
> >>>>>>
> >>>>>
> >>>>
> >>>
> >>>
> >>
> >
> >
>
