Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26DB76356C7
	for <lists+linux-media@lfdr.de>; Wed, 23 Nov 2022 10:34:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237753AbiKWJcQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Nov 2022 04:32:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237752AbiKWJbZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Nov 2022 04:31:25 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A04C38FE44
        for <linux-media@vger.kernel.org>; Wed, 23 Nov 2022 01:30:50 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id f18so41465321ejz.5
        for <linux-media@vger.kernel.org>; Wed, 23 Nov 2022 01:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k/P6HmngRm+KyT9/p0YBOvUT5RPDSJ3KZFWEC9yJwyg=;
        b=SEYF/QTgkO2KyNYiHEjRyucUFb+Ry9Ekx3DQApfopXV78YDBzf9VwXBQKgQJiCjU1x
         i9Ujwox9aEaL0s0ptkZ33/Eiv9tYtfXn/YlySaB4qMn6tMtPQ9g3j0KpDQKXZA10tmgT
         luHNcWnUrOP+rBqLFyPSotsOcnLRVK6vYN7CA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k/P6HmngRm+KyT9/p0YBOvUT5RPDSJ3KZFWEC9yJwyg=;
        b=HGkH2JWGE34B6tMrdf2ZnrtkA22N7H45pb+X0p0I3qznykj4ds2o5afp1LjuD3G0Of
         a9G9s81Eter9N5yBVCufC9zhMFrA49YZEA0RVDh87QbVYbK66Ynjz4j77gs613PDCR90
         4eRmQkb0wtFp5WgfCcQ1HkUc6erRWjdi8oh/GweFq9VfN0v2gNP7noBKmPlJLfVsOfwa
         32TkPDUprpRjyFzrIwmhdTrX83sWAADROc8Gh9l22CV0I71/ve64O6DHGrhnYndjzkaN
         LoixEwDE2F0sUpXf4Ic1xCGmlj9IX+OFrU/QUSPiXh4F5CuSBGr+Wol+ByhHVXhir7Mn
         KZeQ==
X-Gm-Message-State: ANoB5pnabG3ivX7EfPn5L4Q1U9uGWPsFE/YjGzuLVkgMkns3AMVpte6E
        zJhyC3WA94KWZuyDq7a1FyRb09WtRgC0JAMp24XAwSjWLLs=
X-Google-Smtp-Source: AA0mqf568pBwzED/LXK5vNiD3i8xo4oBiTQDcMA8vk117sCWXiDHnVcKEywyfB4Esfm/JhlCEhfPrQ2dAt8gaFHsgEk=
X-Received: by 2002:a17:907:2a53:b0:7a1:6786:4566 with SMTP id
 fe19-20020a1709072a5300b007a167864566mr11215974ejc.433.1669195849127; Wed, 23
 Nov 2022 01:30:49 -0800 (PST)
MIME-Version: 1.0
References: <20221122170801.842766-1-daniel.vetter@ffwll.ch>
 <Y30PDdsvHIJo5YHR@ziepe.ca> <CAKMK7uEccwYTNwDYQazmZvTfBFQOikZt5A6BmegweyO-inKYbQ@mail.gmail.com>
 <Y30Z4VxT7Wdoc1Lc@ziepe.ca> <CAKMK7uE=8eqyh9BKg_+7B1jjMi6K4wrmPyi9xeLVvVYFxBgF9g@mail.gmail.com>
 <Y30kK6dsssSLJVgp@ziepe.ca> <CAKMK7uFQQkG82PzuSTGQTnN3ZNps5N_4TjR5NRWo0LaJkEaNew@mail.gmail.com>
 <3d8607b4-973d-945d-c184-260157ade7c3@amd.com>
In-Reply-To: <3d8607b4-973d-945d-c184-260157ade7c3@amd.com>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Wed, 23 Nov 2022 10:30:37 +0100
Message-ID: <CAKMK7uHVGgGHTiXYOfseXXda2Ug992nYvhPsL+4z18ssqeHXHQ@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: Require VM_PFNMAP vma for mmap
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     Jason Gunthorpe <jgg@ziepe.ca>,
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

On Wed, 23 Nov 2022 at 10:06, Christian K=C3=B6nig <christian.koenig@amd.co=
m> wrote:
> Am 22.11.22 um 20:50 schrieb Daniel Vetter:
> > On Tue, 22 Nov 2022 at 20:34, Jason Gunthorpe <jgg@ziepe.ca> wrote:
> >> On Tue, Nov 22, 2022 at 08:29:05PM +0100, Daniel Vetter wrote:
> >>> You nuke all the ptes. Drivers that move have slightly more than a
> >>> bare struct file, they also have a struct address_space so that
> >>> invalidate_mapping_range() works.
> >> Okay, this is one of the ways that this can be made to work correctly,
> >> as long as you never allow GUP/GUP_fast to succeed on the PTEs. (this
> >> was the DAX mistake)
> > Hence this patch, to enforce that no dma-buf exporter gets this wrong.
> > Which some did, and then blamed bug reporters for the resulting splats
> > :-) One of the things we've reverted was the ttm huge pte support,
> > since that doesn't have the pmd_special flag (yet) and so would let
> > gup_fast through.
>
> The problem is not only gup, a lot of people seem to assume that when
> you are able to grab a reference to a page that the ptes pointing to
> that page can't change any more. And that's obviously incorrect.
>
> I witnessed tons of discussions about that already. Some customers even
> modified our code assuming that and then wondered why the heck they ran
> into data corruption.
>
> It's gotten so bad that I've even proposed intentionally mangling the
> page reference count on TTM allocated pages:
> https://patchwork.kernel.org/project/dri-devel/patch/20220927143529.13568=
9-1-christian.koenig@amd.com/

Yeah maybe something like this could be applied after we land this
patch here. Well maybe should have the same check in gem mmap code to
make sure no driver

> I think it would be better that instead of having special flags in the
> ptes and vmas that you can't follow them to a page structure we would
> add something to the page indicating that you can't grab a reference to
> it. But this might break some use cases as well.

Afaik the problem with that is that there's no free page bits left for
these debug checks. Plus the pte+vma flags are the flags to make this
clear already.
-Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
