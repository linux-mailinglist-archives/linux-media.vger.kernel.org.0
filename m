Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC81648B92E
	for <lists+linux-media@lfdr.de>; Tue, 11 Jan 2022 22:07:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236945AbiAKVHj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jan 2022 16:07:39 -0500
Received: from mga09.intel.com ([134.134.136.24]:25544 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236786AbiAKVHi (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jan 2022 16:07:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641935258; x=1673471258;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zFugx5/4jLXWw3YBL8TR0LI59P7ZoKNGdxOANdPqQqU=;
  b=GWjwhy9I8hJ/ruGngbwmU7eNysNpZHZraWHgVEfOR5iPALULVKTBN95F
   E3/a/6Nl+/xh1yHXvJBafepjv8LQbvO8F2jr4qeGVRTj9nsIwagSMo1ID
   mCNq12ieezB41KCpg5lMA2/Aae0n5oTmO1pNsp/lSQ4SPzhIdMc9hGLki
   3hutjaCMiznWfbW2TnmB42Dnqi+ql+shU8oqgFs8RostvCT/hKmaWM8Q4
   NaZSGr5w43hvBollfcPC+/+8np8/dWXYOsSc/dGcB1VKSQ7gSLxS5GTIa
   5ZeO6qOCsZX2k7ddyg2C7b6w5Z8MJQoIXdtxN8LSRFfD2w1ziLiItJ++F
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10224"; a="243381613"
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; 
   d="scan'208";a="243381613"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2022 13:07:37 -0800
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; 
   d="scan'208";a="558482874"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2022 13:07:36 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 0E2052017F;
        Tue, 11 Jan 2022 23:07:34 +0200 (EET)
Date:   Tue, 11 Jan 2022 23:07:34 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-media@vger.kernel.org, hverkuil@xs4all.nl
Subject: Re: [PATCH 1/1] v4l: Avoid unaligned access warnings when printing
 4cc modifiers
Message-ID: <Yd3xlmc9/cO8hGDo@paasikivi.fi.intel.com>
References: <20220110224656.266536-1-sakari.ailus@linux.intel.com>
 <CAKwvOdnfX1DzgkzCPY7N4LiJDJTGxsKNQbRMmmkt7o5z5O-W9w@mail.gmail.com>
 <Yd1gNZR4rr36ivZV@paasikivi.fi.intel.com>
 <Yd13pim2nuelGjRq@smile.fi.intel.com>
 <CAKwvOdmmN99L1ZpPQ4fHiKH3BF=651_P6YKsJq7rs38mVrCdfA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdmmN99L1ZpPQ4fHiKH3BF=651_P6YKsJq7rs38mVrCdfA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nick, Andy,

On Tue, Jan 11, 2022 at 12:48:45PM -0800, Nick Desaulniers wrote:
> On Tue, Jan 11, 2022 at 4:28 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Tue, Jan 11, 2022 at 12:47:17PM +0200, Sakari Ailus wrote:
> > > Hi Nick,
> > >
> > > On Mon, Jan 10, 2022 at 03:11:18PM -0800, Nick Desaulniers wrote:
> > > > On Mon, Jan 10, 2022 at 2:48 PM Sakari Ailus
> > > > <sakari.ailus@linux.intel.com> wrote:
> > > > >
> > > > > Pointers V4L2 pixelformat and dataformat fields in a few packed structs
> > > > > are directly passed to printk family of functions.
> > > >
> > > > I would rephrase the below statement...
> > > >
> > > > > This could result in an
> > > > > unaligned access albeit no such possibility appears to exist at the
> > > > > moment i.e. this clang warning appears to be a false positive.
> > > >
> > > > ...to:
> > > >
> > > > warning: taking address of packed member 'pixelformat' of class or
> > > > structure 'v4l2_pix_format_mplane' may result in an unaligned pointer
> > > > value [-Waddress-of-packed-member]
> > > >
> > > > The warning is correct; because `struct v4l2_pix_format_mplane` is
> > > > __packed, it's members also have __aligned(1).  Taking the address of
> > > > such members results in the use of underaligned pointers which is UB
> > > > and may be caught by UBSAN or fault on architectures without unaligned
> > > > loads should the struct instance happen to be allocated without any
> > > > natural alignment.
> > >
> > > Wouldn't that be the case only if the __packed attribute resulted in a
> > > different memory layout than not having that attribute?
> > >
> > > All these fields are aligned by 4 so I don't see how this could be an
> > > actual problem.
> >
> > packed means two things and developers often forgot about the second one:
> > - the gaps between members in the data structures are removed
> > - the instance of the data object may be on unaligned address
> 
> Well put; the second is something that surprised me yesterday.  I'd
> like to say I'd forgotten, but I'm not sure I ever really knew that in
> the first place...marking a struct as being packed seems like
> shorthand for marking all of the members as having alignment of 1,
> which makes sense since natural alignment requirements are what
> prevent structure packing in the first place.

I don't disagree with __packed allowing this but it is not the case here.
The fields clang warns about are always aligned by 4. In other words, this
warning is a false positive.

-- 
Kind regards,

Sakari Ailus
