Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4EBA35DBF6
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 11:57:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238926AbhDMJ45 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 05:56:57 -0400
Received: from mga02.intel.com ([134.134.136.20]:10836 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237595AbhDMJ4q (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 05:56:46 -0400
IronPort-SDR: bGfMJCE10t/OzNtHJoAafHvzc51piRHnY5xYWYiLfVhUKQPqB+zDKIR8AiuvVg3dTdQoNjmCx9
 BE+ET0gekyMw==
X-IronPort-AV: E=McAfee;i="6200,9189,9952"; a="181505174"
X-IronPort-AV: E=Sophos;i="5.82,219,1613462400"; 
   d="scan'208";a="181505174"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2021 02:56:26 -0700
IronPort-SDR: iaDTdlOYwaeA9p4vZouePjGF9f/FZnung/O5QEVXDkgmcycK5yateSs9xD7typ+Uv6xPnyvrJ9
 RNYLZaEMF61g==
X-IronPort-AV: E=Sophos;i="5.82,219,1613462400"; 
   d="scan'208";a="600297380"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2021 02:56:24 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id F2264203D0;
        Tue, 13 Apr 2021 12:56:21 +0300 (EEST)
Date:   Tue, 13 Apr 2021 12:56:21 +0300
From:   "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
To:     David Laight <David.Laight@ACULAB.COM>
Cc:     'Mitali Borkar' <mitaliborkar810@gmail.com>,
        "bingbu.cao@intel.com" <bingbu.cao@intel.com>,
        "tian.shu.qiu@intel.com" <tian.shu.qiu@intel.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "outreachy-kernel@googlegroups.com" 
        <outreachy-kernel@googlegroups.com>,
        "mitali_s@me.iitr.ac.in" <mitali_s@me.iitr.ac.in>
Subject: Re: [PATCH 2/6] staging: media: intel-ipu3: preferred
 __aligned(size) over __attribute__aligned(size)
Message-ID: <20210413095621.GQ3@paasikivi.fi.intel.com>
References: <cover.1618180659.git.mitaliborkar810@gmail.com>
 <f618f1fe2d13417ebed185da392fb48811593a9f.1618180660.git.mitaliborkar810@gmail.com>
 <277be5f4da82449aaf0a635b60ad0728@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <277be5f4da82449aaf0a635b60ad0728@AcuMS.aculab.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi David,

On Tue, Apr 13, 2021 at 07:40:12AM +0000, David Laight wrote:
> From: Mitali Borkar
> > Sent: 12 April 2021 00:09
> > 
> > This patch fixes the warning identified by checkpatch.pl by replacing
> > __attribute__aligned(size) with __aligned(size)
> > 
> > Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
> > ---
> >  .../staging/media/ipu3/include/intel-ipu3.h   | 74 +++++++++----------
> >  1 file changed, 37 insertions(+), 37 deletions(-)
> > 
> > diff --git a/drivers/staging/media/ipu3/include/intel-ipu3.h
> > b/drivers/staging/media/ipu3/include/intel-ipu3.h
> > index 589d5ccee3a7..d95ca9ebfafb 100644
> > --- a/drivers/staging/media/ipu3/include/intel-ipu3.h
> > +++ b/drivers/staging/media/ipu3/include/intel-ipu3.h
> > @@ -84,7 +84,7 @@ struct ipu3_uapi_grid_config {
> >   */
> >  struct ipu3_uapi_awb_raw_buffer {
> >  	__u8 meta_data[IPU3_UAPI_AWB_MAX_BUFFER_SIZE]
> > -		__attribute__((aligned(32)));
> > +		__aligned(32);
> >  } __packed;
> 
> WTF?
> 
> It either has 1-byte alignment because it is just __u8,
> 32-byte because of the aligned(32),
> or 1 byte because of the outer packed.
> 
> What alignment does this (and all the other) structures
> actually need?

32 as noted above. Here packed makes no difference though.

Some of these structs are used embedded in other structs or alone. I
haven't checked this one.

It's also possible to have __packed and __aligned() conflict (in which case
a decent compiler would give you a warning) --- which does not happen
currently AFAIK.

> 
> Specifying 'packed' isn't free.

It may be free if the packed alignment of the fields corresponds to
architecture's packing. Here __aligned() is used to satisfy
hardware alignment requirements and __packed is used to ensure the same
memory layout independently of ABI rules.

-- 
Regards,

Sakari Ailus
