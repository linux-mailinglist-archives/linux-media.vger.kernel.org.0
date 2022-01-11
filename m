Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07B8048AD9A
	for <lists+linux-media@lfdr.de>; Tue, 11 Jan 2022 13:28:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239930AbiAKM2e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jan 2022 07:28:34 -0500
Received: from mga03.intel.com ([134.134.136.65]:48811 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239846AbiAKM2e (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jan 2022 07:28:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641904114; x=1673440114;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tF0ggi96Itc/hDjk9VM4zasKGTuLQL6egPHigOPMXKc=;
  b=SeaKQMbIWKahKHP+Q6ZO2864YwRmuUuY6htpsv4YSfEL/P2fkWjb0chr
   qws1ZvspDDEKgI09NKaahaNyxck2CJPxNPoG0GreElFdWMoqm44JrVByq
   qrKe+rTzB9YF4Ugtowew9yixZwgQVqIWKuVQt7Q8jYtH97KoHcMRPzRU+
   PTNKBqaYXbdhB4Y9iVryp1kjaO1sHalCQl1ghSS09OQ/lIM6ZLEquG2ir
   3mW2ofykBXgfZWRNXXhWCLNxqnZ4lPd84tlVI2fbVd7Cahe5ZwxQvpKFA
   02aeQI81znNL3ks4ZNHmOVQvj8VLPvI803JZh+2pye6zndyLSlzrGZlxd
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10223"; a="243427551"
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; 
   d="scan'208";a="243427551"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2022 04:28:33 -0800
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; 
   d="scan'208";a="619811978"
Received: from smile.fi.intel.com ([10.237.72.61])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2022 04:28:32 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1n7GFC-009Dyp-OY;
        Tue, 11 Jan 2022 14:27:18 +0200
Date:   Tue, 11 Jan 2022 14:27:18 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        linux-media@vger.kernel.org, hverkuil@xs4all.nl
Subject: Re: [PATCH 1/1] v4l: Avoid unaligned access warnings when printing
 4cc modifiers
Message-ID: <Yd13pim2nuelGjRq@smile.fi.intel.com>
References: <20220110224656.266536-1-sakari.ailus@linux.intel.com>
 <CAKwvOdnfX1DzgkzCPY7N4LiJDJTGxsKNQbRMmmkt7o5z5O-W9w@mail.gmail.com>
 <Yd1gNZR4rr36ivZV@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yd1gNZR4rr36ivZV@paasikivi.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jan 11, 2022 at 12:47:17PM +0200, Sakari Ailus wrote:
> Hi Nick,
> 
> On Mon, Jan 10, 2022 at 03:11:18PM -0800, Nick Desaulniers wrote:
> > On Mon, Jan 10, 2022 at 2:48 PM Sakari Ailus
> > <sakari.ailus@linux.intel.com> wrote:
> > >
> > > Pointers V4L2 pixelformat and dataformat fields in a few packed structs
> > > are directly passed to printk family of functions.
> > 
> > I would rephrase the below statement...
> > 
> > > This could result in an
> > > unaligned access albeit no such possibility appears to exist at the
> > > moment i.e. this clang warning appears to be a false positive.
> > 
> > ...to:
> > 
> > warning: taking address of packed member 'pixelformat' of class or
> > structure 'v4l2_pix_format_mplane' may result in an unaligned pointer
> > value [-Waddress-of-packed-member]
> > 
> > The warning is correct; because `struct v4l2_pix_format_mplane` is
> > __packed, it's members also have __aligned(1).  Taking the address of
> > such members results in the use of underaligned pointers which is UB
> > and may be caught by UBSAN or fault on architectures without unaligned
> > loads should the struct instance happen to be allocated without any
> > natural alignment.
> 
> Wouldn't that be the case only if the __packed attribute resulted in a
> different memory layout than not having that attribute?
> 
> All these fields are aligned by 4 so I don't see how this could be an
> actual problem.

packed means two things and developers often forgot about the second one:
- the gaps between members in the data structures are removed
- the instance of the data object may be on unaligned address

Here is the second one which results in the warning.

That's why my patch against vsprintf as I explained in that thread.

-- 
With Best Regards,
Andy Shevchenko


