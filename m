Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 464A2635984
	for <lists+linux-media@lfdr.de>; Wed, 23 Nov 2022 11:19:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236601AbiKWKTh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Nov 2022 05:19:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236540AbiKWKTK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Nov 2022 05:19:10 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EAFBA182
        for <linux-media@vger.kernel.org>; Wed, 23 Nov 2022 02:07:08 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id m22so41558153eji.10
        for <linux-media@vger.kernel.org>; Wed, 23 Nov 2022 02:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h+UdvofUGp6+nqq/FR8FcX4hvZmapqrFr41Q2JO7x4c=;
        b=TQ51N5ElxONDKI/zhDJ3pCgpfLjbZshPT3dmaV8oEwygDZ7SUkV43yilCvjo5DTHkM
         5vinp6v+ldQAo/Z6KGaY5xTUo3Lnhb4v5NMeNcJq5CXQqT+ExG+ICc1x7EqIpc/l8ZI+
         6kkzXHBS485z5Q3W1BWot8CJKckOO6+wlmPxY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h+UdvofUGp6+nqq/FR8FcX4hvZmapqrFr41Q2JO7x4c=;
        b=HBZRswjMycUpE+TwncYEYpB+BlwDtUefiuhL73tS219wlR1xz1/JxZu/1EERCCcxVm
         Dte4Gg4yp06gED6MRHvEFrSJmNnxsxQtYnqG1OZBnkID8fMREugc3seJn5zBSGYl4/5H
         pdRu3IHtufMKXXdlhPweO6ONGufPKovEN1uzlu1cLnuyNcDGCjMa9zarX3COLqQRDrc+
         3Nssnd0RUrI7fiWS6qRfJe3f7cVsQjcSutibNo1WHDmapMx6eWRycrsKCq+ZTkPAVom+
         89AldqFxMy86kLxzMPLqw8+11v7nTaS7/4qms/tJFVG1bCN5W/RUAVnsRpJPH4zr0tic
         dIVg==
X-Gm-Message-State: ANoB5pnCncoHVZ1nWq110dyZbcZR8+eHH111mfNOQK/lwWJbWlzhYF+/
        o31zqHAbQoVDkuWxxbamFvomQ/UowX5lMx0MKJRHBA==
X-Google-Smtp-Source: AA0mqf7tcZdPWNPPAaRZELTq9mvgZpMH+k/1GataSXqkuF2ePYeDW4qUMkJISiWe8P9mQTOVdyKvWgBCSqeQKGcAWaA=
X-Received: by 2002:a17:907:8197:b0:7b8:eae2:716a with SMTP id
 iy23-20020a170907819700b007b8eae2716amr4704467ejc.516.1669198026954; Wed, 23
 Nov 2022 02:07:06 -0800 (PST)
MIME-Version: 1.0
References: <20221122170801.842766-1-daniel.vetter@ffwll.ch>
 <Y30PDdsvHIJo5YHR@ziepe.ca> <CAKMK7uEccwYTNwDYQazmZvTfBFQOikZt5A6BmegweyO-inKYbQ@mail.gmail.com>
 <Y30Z4VxT7Wdoc1Lc@ziepe.ca> <CAKMK7uE=8eqyh9BKg_+7B1jjMi6K4wrmPyi9xeLVvVYFxBgF9g@mail.gmail.com>
 <Y30kK6dsssSLJVgp@ziepe.ca> <CAKMK7uFQQkG82PzuSTGQTnN3ZNps5N_4TjR5NRWo0LaJkEaNew@mail.gmail.com>
 <3d8607b4-973d-945d-c184-260157ade7c3@amd.com> <CAKMK7uHVGgGHTiXYOfseXXda2Ug992nYvhPsL+4z18ssqeHXHQ@mail.gmail.com>
 <b05e6091-4e07-1e32-773d-f603ac9ac98b@gmail.com>
In-Reply-To: <b05e6091-4e07-1e32-773d-f603ac9ac98b@gmail.com>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Wed, 23 Nov 2022 11:06:55 +0100
Message-ID: <CAKMK7uFjmzewqv3r4hL9hvLADwV536n2n6xbAWaUvmAcStr5KQ@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] Re: [PATCH] dma-buf: Require VM_PFNMAP vma for mmap
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Suren Baghdasaryan <surenb@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        John Stultz <john.stultz@linaro.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 23 Nov 2022 at 10:39, Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 23.11.22 um 10:30 schrieb Daniel Vetter:
> > On Wed, 23 Nov 2022 at 10:06, Christian K=C3=B6nig <christian.koenig@am=
d.com> wrote:
> >> Am 22.11.22 um 20:50 schrieb Daniel Vetter:
> >>> On Tue, 22 Nov 2022 at 20:34, Jason Gunthorpe <jgg@ziepe.ca> wrote:
> >>>> On Tue, Nov 22, 2022 at 08:29:05PM +0100, Daniel Vetter wrote:
> >>>>> You nuke all the ptes. Drivers that move have slightly more than a
> >>>>> bare struct file, they also have a struct address_space so that
> >>>>> invalidate_mapping_range() works.
> >>>> Okay, this is one of the ways that this can be made to work correctl=
y,
> >>>> as long as you never allow GUP/GUP_fast to succeed on the PTEs. (thi=
s
> >>>> was the DAX mistake)
> >>> Hence this patch, to enforce that no dma-buf exporter gets this wrong=
.
> >>> Which some did, and then blamed bug reporters for the resulting splat=
s
> >>> :-) One of the things we've reverted was the ttm huge pte support,
> >>> since that doesn't have the pmd_special flag (yet) and so would let
> >>> gup_fast through.
> >> The problem is not only gup, a lot of people seem to assume that when
> >> you are able to grab a reference to a page that the ptes pointing to
> >> that page can't change any more. And that's obviously incorrect.
> >>
> >> I witnessed tons of discussions about that already. Some customers eve=
n
> >> modified our code assuming that and then wondered why the heck they ra=
n
> >> into data corruption.
> >>
> >> It's gotten so bad that I've even proposed intentionally mangling the
> >> page reference count on TTM allocated pages:
> >> https://patchwork.kernel.org/project/dri-devel/patch/20220927143529.13=
5689-1-christian.koenig@amd.com/
> > Yeah maybe something like this could be applied after we land this
> > patch here.
>
> I think both should land ASAP. We don't have any other way than to
> clearly point out incorrect approaches if we want to prevent the
> resulting data corruption.
>
> > Well maybe should have the same check in gem mmap code to
> > make sure no driver
>
> Reads like the sentence is somehow cut of?

Yeah, just wanted to say that we need to make sure in as many places
as possible that VM_PFNMAP is set for bo mmaps.

> >> I think it would be better that instead of having special flags in the
> >> ptes and vmas that you can't follow them to a page structure we would
> >> add something to the page indicating that you can't grab a reference t=
o
> >> it. But this might break some use cases as well.
> > Afaik the problem with that is that there's no free page bits left for
> > these debug checks. Plus the pte+vma flags are the flags to make this
> > clear already.
>
> Maybe a GFP flag to set the page reference count to zero or something
> like this?

Hm yeah that might work. I'm not sure what it will all break though?
And we'd need to make sure that underflowing the page refcount dies in
a backtrace.
-Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
