Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6134748B9C0
	for <lists+linux-media@lfdr.de>; Tue, 11 Jan 2022 22:36:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245384AbiAKVg2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jan 2022 16:36:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245365AbiAKVg1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jan 2022 16:36:27 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73D67C06173F
        for <linux-media@vger.kernel.org>; Tue, 11 Jan 2022 13:36:27 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id x6so1310456lfa.5
        for <linux-media@vger.kernel.org>; Tue, 11 Jan 2022 13:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bX/dmlzvH6apeFSnn3kOLBFpYEkOI5lmh95FYGIza1c=;
        b=VpVGnFAzrrLXKJIKsneqtMq5rB0ZD0uhHqF7Oq3froV81OCcuSqSFxTHGDVipncRhX
         BoWR4yGf09+moKmHa4uRM+B6WOT47ewhkn0DazxjW6XZhmqm2eJJR7TaJnbYjYKRCMSu
         OYlnqAfVap6FquwuFLRVsOWRQYLw9iSojg9cTJwFUIhSXeDWq9cpKqXoO77nOQcP9ytO
         d187SN+yJ7atqVIRdvknSlSVjmIk6ZHUZdJeCPDZ7qy3h08TdJJgz9z9xfZ9RioOLx7z
         GMAg0AoqtTYFLtBQx00xVqOv8G+l9nBLUtt5CQStm/nL62kJb1aVcL3mDqsfvCDQmIDn
         ZWow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bX/dmlzvH6apeFSnn3kOLBFpYEkOI5lmh95FYGIza1c=;
        b=yASq4kZbbWFc2DEaZWtXmKrxMiISiGE+RI/CNSP6COKB7OQ5YMmsuQG1pKb8Y41SHJ
         OLxuWSLvNm758WBf7f39BVGupiieWlsarBzT434myd9AZmEdaNnG8n5pBfOp0SAlT/b6
         bInVZKiWorm0GIJdYw2NenDMkpJeTroHX6SvZIxFhmw3bVg+i5DDb2PyvEG4LIHqED3o
         vWCj5uf/U221hvxZ3TvrkbEqkiL5Z2aKh77wkPtUr0dYDIQiRoaCaLAHC1REunf61dLy
         VSGo5dmDoeKzOMZn826Bp9aUvsBoAG17+FoaQBPjw24oVcnOSp0nITOK+TkIz1TgOSqn
         6zZg==
X-Gm-Message-State: AOAM532pqWK9y4cMHfFZCpxX5d+tLOh3PtV7B25F2I2pYc2cZjQYQR3j
        pRHyHkWqt2/durTdoNxu68x3JbJ0/kprXJhRBVLZsQ==
X-Google-Smtp-Source: ABdhPJzbD0DSDuKs/zHknRoIzOAANypqzJeo6JCrmP9N/TrLTfPxyIa/lfSDGUtQVcZeKeDaqxcCUYI/w/mnbQPhVB8=
X-Received: by 2002:a05:6512:1506:: with SMTP id bq6mr4856659lfb.444.1641936985630;
 Tue, 11 Jan 2022 13:36:25 -0800 (PST)
MIME-Version: 1.0
References: <20220110224656.266536-1-sakari.ailus@linux.intel.com>
 <CAKwvOdnfX1DzgkzCPY7N4LiJDJTGxsKNQbRMmmkt7o5z5O-W9w@mail.gmail.com>
 <Yd1gNZR4rr36ivZV@paasikivi.fi.intel.com> <Yd13pim2nuelGjRq@smile.fi.intel.com>
 <CAKwvOdmmN99L1ZpPQ4fHiKH3BF=651_P6YKsJq7rs38mVrCdfA@mail.gmail.com> <Yd3xlmc9/cO8hGDo@paasikivi.fi.intel.com>
In-Reply-To: <Yd3xlmc9/cO8hGDo@paasikivi.fi.intel.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 11 Jan 2022 13:36:14 -0800
Message-ID: <CAKwvOd=-_sig49r6UUNEYNLQ_CdMHs5rsrWmxweczB0eJ+tNqg@mail.gmail.com>
Subject: Re: [PATCH 1/1] v4l: Avoid unaligned access warnings when printing
 4cc modifiers
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-media@vger.kernel.org, hverkuil@xs4all.nl
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jan 11, 2022 at 1:07 PM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Nick, Andy,
>
> On Tue, Jan 11, 2022 at 12:48:45PM -0800, Nick Desaulniers wrote:
> > On Tue, Jan 11, 2022 at 4:28 AM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > On Tue, Jan 11, 2022 at 12:47:17PM +0200, Sakari Ailus wrote:
> > > > Hi Nick,
> > > >
> > > > On Mon, Jan 10, 2022 at 03:11:18PM -0800, Nick Desaulniers wrote:
> > > > > On Mon, Jan 10, 2022 at 2:48 PM Sakari Ailus
> > > > > <sakari.ailus@linux.intel.com> wrote:
> > > > > >
> > > > > > Pointers V4L2 pixelformat and dataformat fields in a few packed structs
> > > > > > are directly passed to printk family of functions.
> > > > >
> > > > > I would rephrase the below statement...
> > > > >
> > > > > > This could result in an
> > > > > > unaligned access albeit no such possibility appears to exist at the
> > > > > > moment i.e. this clang warning appears to be a false positive.
> > > > >
> > > > > ...to:
> > > > >
> > > > > warning: taking address of packed member 'pixelformat' of class or
> > > > > structure 'v4l2_pix_format_mplane' may result in an unaligned pointer
> > > > > value [-Waddress-of-packed-member]
> > > > >
> > > > > The warning is correct; because `struct v4l2_pix_format_mplane` is
> > > > > __packed, it's members also have __aligned(1).  Taking the address of
> > > > > such members results in the use of underaligned pointers which is UB
> > > > > and may be caught by UBSAN or fault on architectures without unaligned
> > > > > loads should the struct instance happen to be allocated without any
> > > > > natural alignment.
> > > >
> > > > Wouldn't that be the case only if the __packed attribute resulted in a
> > > > different memory layout than not having that attribute?
> > > >
> > > > All these fields are aligned by 4 so I don't see how this could be an
> > > > actual problem.
> > >
> > > packed means two things and developers often forgot about the second one:
> > > - the gaps between members in the data structures are removed
> > > - the instance of the data object may be on unaligned address
> >
> > Well put; the second is something that surprised me yesterday.  I'd
> > like to say I'd forgotten, but I'm not sure I ever really knew that in
> > the first place...marking a struct as being packed seems like
> > shorthand for marking all of the members as having alignment of 1,
> > which makes sense since natural alignment requirements are what
> > prevent structure packing in the first place.
>
> I don't disagree with __packed allowing this but it is not the case here.
> The fields clang warns about are always aligned by 4. In other words, this
> warning is a false positive.

The member `pixelformat` has a natural alignment of 4, but due to
being a member of a packed struct, it now has an alignment of 1.
-- 
Thanks,
~Nick Desaulniers
