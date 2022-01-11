Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B04D48AB07
	for <lists+linux-media@lfdr.de>; Tue, 11 Jan 2022 11:09:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348324AbiAKKJO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jan 2022 05:09:14 -0500
Received: from mga07.intel.com ([134.134.136.100]:28936 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237384AbiAKKJO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jan 2022 05:09:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641895754; x=1673431754;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mm9lVFvRELv89E3e5Oa9C0YgAjSQS+ErIvfkr22LQPg=;
  b=htNW3FBOD0NHMwiBF6t699u3/QtDVNbg+4SO7fL1SH3484WzVx9IBl7K
   1F1vBzjwmFbuQ1jezabul7svEAkELHGPMuwv+KNyOpX05646q9RQ1YISM
   AacDFMoQZ8G+P/VuF9gn3DuKxMVv+36KeDqYl2qNamv2Yg98i0e8gFOgW
   W2YF0uSsxVFE2J8axQ4DbYwiwTuSMIx0VIRaDs/9XmqYfEauR6vpAO50s
   Fg36DNrd4v/LUq1JoaGHjCGPMYDfjflFABrzyRMdyRdGFdiCDXd9G1TpS
   kQ5/kwG3YZ/ECzSQDNgeOnfe2jtHp835Se6wUW2Y8QXasCaS8FVY1lh2L
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10223"; a="306802583"
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; 
   d="scan'208";a="306802583"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2022 02:09:13 -0800
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; 
   d="scan'208";a="515042873"
Received: from smile.fi.intel.com ([10.237.72.61])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2022 02:09:11 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1n7E4M-009BUO-6i;
        Tue, 11 Jan 2022 12:07:58 +0200
Date:   Tue, 11 Jan 2022 12:07:57 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, hverkuil@xs4all.nl
Subject: Re: [PATCH 1/1] v4l: Avoid unaligned access warnings when printing
 4cc modifiers
Message-ID: <Yd1W/cQ1G4/HpFMi@smile.fi.intel.com>
References: <20220110224656.266536-1-sakari.ailus@linux.intel.com>
 <CAKwvOdnfX1DzgkzCPY7N4LiJDJTGxsKNQbRMmmkt7o5z5O-W9w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdnfX1DzgkzCPY7N4LiJDJTGxsKNQbRMmmkt7o5z5O-W9w@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

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
> The warning is correct;

Exactly. I'm going to repeat that in the comment to my patch.

> because `struct v4l2_pix_format_mplane` is
> __packed, it's members also have __aligned(1).  Taking the address of
> such members results in the use of underaligned pointers which is UB
> and may be caught by UBSAN or fault on architectures without unaligned
> loads should the struct instance happen to be allocated without any
> natural alignment.

-- 
With Best Regards,
Andy Shevchenko


