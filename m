Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7775A48B8D5
	for <lists+linux-media@lfdr.de>; Tue, 11 Jan 2022 21:49:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244392AbiAKUtA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jan 2022 15:49:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244133AbiAKUs7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jan 2022 15:48:59 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29DD6C06173F
        for <linux-media@vger.kernel.org>; Tue, 11 Jan 2022 12:48:59 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id g11so989725lfu.2
        for <linux-media@vger.kernel.org>; Tue, 11 Jan 2022 12:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=079ZFVvw+lGWIo6sMmJZn/8bQss9VpGTKiuk0sWD1mY=;
        b=JVHQZ3JCHsLhKKCctBmYe0wszYbF79M5+7XFfQXIMTB2uS+Un9fgP9c8OManspFj7h
         YNbZFVYJh3/IT6FuVLn90bDJbqI4e+dtHOzKko0CWG8yMfy/JqWvbcKJNEkw1rJxZvaw
         eDOsfbXxersLq+VfRqrRgslN9Dit9UBQCoSAyxXb/AzfQtMyOvzCCQzkKeQObayaga5w
         0qzFRuElrIcRw7LdCnh6DLo8YDHMnwsHZSrZyS9HLx4XpS2J6kkMYTx8/PLxxJ82Ny7Y
         dpeKYfAXAl/A4fHuX1aovTfPLWXMoeRmYtU54bi2fZvljdst7IqJncVxn0l45pSILlKM
         Jbzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=079ZFVvw+lGWIo6sMmJZn/8bQss9VpGTKiuk0sWD1mY=;
        b=pYV/ToSevefWUmbNbnjE48p2hBCs031MDHLWhHb5zWFm4xu+m8Mzhlc3kOdHNoJb9C
         eUJ9okRP/HFvj5bha84CZsPrxnwyD0BMxp9pTiUxC8LbhOqJcrFpPyy9blWlIBh/P7US
         FyPdtEXHNPMP0H9ZHAnkEATlkRzt3zkvSu7uRVAvlOiGwMymQLGsppbHXbS6//pm+wFS
         aRW1AusB6wupb0RZ9kMue4+y85N8N6USHlhGlL8lMDZrP9amkcp7uxCJkV5icpq03ucm
         y5kZx7zYmmvGZTdUTOvyypmNNH4k95XsjdjUNrZ1RnTpwtx5HVbNxWxNuT2e+cbiBp5b
         kuwA==
X-Gm-Message-State: AOAM530c9CCBCjREKPPq2DJVKUav5H6NNVKYAPmOyAs8Nz+Zfu0Qhlee
        kwBxmnVEX+PU0zflLCbvGhw1+T5X0h2VvH7+RQTOVwZkZLEKQA==
X-Google-Smtp-Source: ABdhPJweorughFOBOqBUe0FdULexXd6zYq/XbUrwQurYKpvKsJ7HIvce6gan7Ox8my2rerF/ZJEPzg/9+k5y5dfOWOU=
X-Received: by 2002:a05:6512:3baa:: with SMTP id g42mr4596131lfv.651.1641934137295;
 Tue, 11 Jan 2022 12:48:57 -0800 (PST)
MIME-Version: 1.0
References: <20220110224656.266536-1-sakari.ailus@linux.intel.com>
 <CAKwvOdnfX1DzgkzCPY7N4LiJDJTGxsKNQbRMmmkt7o5z5O-W9w@mail.gmail.com>
 <Yd1gNZR4rr36ivZV@paasikivi.fi.intel.com> <Yd13pim2nuelGjRq@smile.fi.intel.com>
In-Reply-To: <Yd13pim2nuelGjRq@smile.fi.intel.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 11 Jan 2022 12:48:45 -0800
Message-ID: <CAKwvOdmmN99L1ZpPQ4fHiKH3BF=651_P6YKsJq7rs38mVrCdfA@mail.gmail.com>
Subject: Re: [PATCH 1/1] v4l: Avoid unaligned access warnings when printing
 4cc modifiers
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jan 11, 2022 at 4:28 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Jan 11, 2022 at 12:47:17PM +0200, Sakari Ailus wrote:
> > Hi Nick,
> >
> > On Mon, Jan 10, 2022 at 03:11:18PM -0800, Nick Desaulniers wrote:
> > > On Mon, Jan 10, 2022 at 2:48 PM Sakari Ailus
> > > <sakari.ailus@linux.intel.com> wrote:
> > > >
> > > > Pointers V4L2 pixelformat and dataformat fields in a few packed structs
> > > > are directly passed to printk family of functions.
> > >
> > > I would rephrase the below statement...
> > >
> > > > This could result in an
> > > > unaligned access albeit no such possibility appears to exist at the
> > > > moment i.e. this clang warning appears to be a false positive.
> > >
> > > ...to:
> > >
> > > warning: taking address of packed member 'pixelformat' of class or
> > > structure 'v4l2_pix_format_mplane' may result in an unaligned pointer
> > > value [-Waddress-of-packed-member]
> > >
> > > The warning is correct; because `struct v4l2_pix_format_mplane` is
> > > __packed, it's members also have __aligned(1).  Taking the address of
> > > such members results in the use of underaligned pointers which is UB
> > > and may be caught by UBSAN or fault on architectures without unaligned
> > > loads should the struct instance happen to be allocated without any
> > > natural alignment.
> >
> > Wouldn't that be the case only if the __packed attribute resulted in a
> > different memory layout than not having that attribute?
> >
> > All these fields are aligned by 4 so I don't see how this could be an
> > actual problem.
>
> packed means two things and developers often forgot about the second one:
> - the gaps between members in the data structures are removed
> - the instance of the data object may be on unaligned address

Well put; the second is something that surprised me yesterday.  I'd
like to say I'd forgotten, but I'm not sure I ever really knew that in
the first place...marking a struct as being packed seems like
shorthand for marking all of the members as having alignment of 1,
which makes sense since natural alignment requirements are what
prevent structure packing in the first place.

`I think this case should demonstrate the second point:
https://godbolt.org/z/77P484e4o
-- 
Thanks,
~Nick Desaulniers
