Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB26748ABAA
	for <lists+linux-media@lfdr.de>; Tue, 11 Jan 2022 11:47:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349341AbiAKKrW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jan 2022 05:47:22 -0500
Received: from mga03.intel.com ([134.134.136.65]:42244 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237719AbiAKKrV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jan 2022 05:47:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641898041; x=1673434041;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Of1OeOiopXZF3jY0xuMFS3B9PzaXhsKLmSXZRcOhBG0=;
  b=Eta9aVajNtVbfWEc9ciwhhg41/dk5BaKPmOCQxZz+i6Y/JA21fLTRKlu
   TJQwaUzGj0+Y/F+oVySbvmN4vCKNesJ6vtdUSlZyOkYAGnOwOyMWqtXtP
   w4Ip2FKs/U7FIbvHhmBt/TXPlCEElq3s6jZBYEol4hkJTXELSDmpPBtlP
   HN52oih+C9wQ+QYo03cdEWIP8sTTBpXiLWHDkVxT1q2ewAsU3Q1i46blF
   KwTsx3xTY9+wYJX9taVEqnIFc3rDxI7/4bubkaIV15zSkWMjlrFr2nzJB
   wQrpdqtAWE1zoPTaPujeSkxOdUNIxF1mMSPosVakUcmZcnwu1QFftaH1r
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10223"; a="243410969"
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; 
   d="scan'208";a="243410969"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2022 02:47:20 -0800
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; 
   d="scan'208";a="690955190"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2022 02:47:19 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 736A82017F;
        Tue, 11 Jan 2022 12:47:17 +0200 (EET)
Date:   Tue, 11 Jan 2022 12:47:17 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     linux-media@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        hverkuil@xs4all.nl
Subject: Re: [PATCH 1/1] v4l: Avoid unaligned access warnings when printing
 4cc modifiers
Message-ID: <Yd1gNZR4rr36ivZV@paasikivi.fi.intel.com>
References: <20220110224656.266536-1-sakari.ailus@linux.intel.com>
 <CAKwvOdnfX1DzgkzCPY7N4LiJDJTGxsKNQbRMmmkt7o5z5O-W9w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdnfX1DzgkzCPY7N4LiJDJTGxsKNQbRMmmkt7o5z5O-W9w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nick,

On Mon, Jan 10, 2022 at 03:11:18PM -0800, Nick Desaulniers wrote:
> On Mon, Jan 10, 2022 at 2:48 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> >
> > Pointers V4L2 pixelformat and dataformat fields in a few packed structs
> > are directly passed to printk family of functions.
> 
> I would rephrase the below statement...
> 
> > This could result in an
> > unaligned access albeit no such possibility appears to exist at the
> > moment i.e. this clang warning appears to be a false positive.
> 
> ...to:
> 
> warning: taking address of packed member 'pixelformat' of class or
> structure 'v4l2_pix_format_mplane' may result in an unaligned pointer
> value [-Waddress-of-packed-member]
> 
> The warning is correct; because `struct v4l2_pix_format_mplane` is
> __packed, it's members also have __aligned(1).  Taking the address of
> such members results in the use of underaligned pointers which is UB
> and may be caught by UBSAN or fault on architectures without unaligned
> loads should the struct instance happen to be allocated without any
> natural alignment.

Wouldn't that be the case only if the __packed attribute resulted in a
different memory layout than not having that attribute?

All these fields are aligned by 4 so I don't see how this could be an
actual problem.

> 
> >
> > Address the warning by copying the pixelformat or dataformat value to a
> > local variable first.
> >
> > Reported-by: kernel test robot <lkp@intel.com>
> > Fixes: e927e1e0f0dd ("v4l: ioctl: Use %p4cc printk modifier to print FourCC codes")
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> > Hi Andy, Nick,
> >
> > How about this one?
> >
> > I believe it does address the clang warning although I haven't tested it.
> 
> LGTM. Thanks Sakari and Andy for pursuing this. Just a minor nit on my
> side about the framing of this warning being a false positive; I don't
> think it is.  With that amended,
> 
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

Thanks!

-- 
Kind regards,

Sakari Ailus
