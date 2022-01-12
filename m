Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D9A248C304
	for <lists+linux-media@lfdr.de>; Wed, 12 Jan 2022 12:21:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239699AbiALLVW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Jan 2022 06:21:22 -0500
Received: from mga11.intel.com ([192.55.52.93]:56505 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238953AbiALLVV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jan 2022 06:21:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641986481; x=1673522481;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=F0BLIE+tzd4Tbc75p5Ii5oL4I5Vl57Q3ivIPMfyyIQU=;
  b=JTZheXsgxtVeMCPRkI5wzjzzOGuiTbU8sxSveKJVD7Oja7VEdjrsu8Z2
   Bp29jTdWrdCuTyrzVhP45/cJew3ZKjuapkAgKGcN9+2rZfRURF6aQVFzw
   yoGzlB8wU/2Fy+d6U+s3f6FvBY0c+ZqnfvvUhP27DGgJV+3BjSjDyqu+t
   F3GeaS45Id7OgRIrPmQrf5hZplL2zKXxX/OL82mj+I0WM6FKyk2kCNJaY
   RFiYIJeb+wDHCIJ9OfNsd5ZHWxIXISkLH3kkzK0t8bCORzkG19WxPBO3L
   j4J9ZIWiiEhCgp87roRSbFr+17Z3BvKH1vXyJBp2EQIAXvK5tq2LPnG20
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10224"; a="241267101"
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; 
   d="scan'208";a="241267101"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2022 03:21:20 -0800
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; 
   d="scan'208";a="490707267"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2022 03:21:19 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id DD2542017F;
        Wed, 12 Jan 2022 13:21:16 +0200 (EET)
Date:   Wed, 12 Jan 2022 13:21:16 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 1/1] ov5648: Don't pack controls struct
Message-ID: <Yd65rCQpHFyh8nXt@paasikivi.fi.intel.com>
References: <20220110224831.266749-1-sakari.ailus@linux.intel.com>
 <Yd0/nL7iQityle6P@aptenodytes>
 <Yd1sOmFjJfsFHrT2@paasikivi.fi.intel.com>
 <Yd62+tGrH+ep7bAS@aptenodytes>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yd62+tGrH+ep7bAS@aptenodytes>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Paul,

On Wed, Jan 12, 2022 at 12:09:46PM +0100, Paul Kocialkowski wrote:
> Hi Sakari,
> 
> On Tue 11 Jan 22, 13:38, Sakari Ailus wrote:
> > Hi Paul,
> > 
> > On Tue, Jan 11, 2022 at 09:28:12AM +0100, Paul Kocialkowski wrote:
> > > Hi Sakari,
> > > 
> > > On Tue 11 Jan 22, 00:48, Sakari Ailus wrote:
> > > > Don't pack the driver specific struct containing control pointers. This
> > > > lead to potential alignment issues when working with the pointers.
> > > 
> > > Thanks for looking into the report and making this fix.
> > > 
> > > Honestly I was a bit puzzled because I explicitly added the __packed
> > > to avoid possible holes in the structures that could be problematic
> > > when using v4l2_ctrl_auto_cluster and I think the problem still stands.
> > > 
> > > I feel like solving both issues at once would require having the controls
> > > that belong in the same cluster declared as an array and not individual
> > > members of the struct.
> > > 
> > > What do you think?
> > 
> > No architecture used in Linux requires adding padding between two pointers
> > to my knowledge --- generally the alignment is at most the size of the
> > data: otherwise arrays would not work either. Therefore packing isn't
> > required.
> 
> I was under the impression that padding may happen in structures generally
> speaking. Are you saying that because it's pointers, there will most likely
> be no padding required?

Not really just pointers; the same goes for any data type.

> 
> Also there's a struct v4l2_ctrl_handler at the end of the struct
> (not a pointer), maybe that can somehow play a role too and introduce padding?

There could be padding added at the end of the struct. (But that depends on
what comes after the struct.)

> 
> My feeling was that there's no strong guarantee here, so packing the struct
> would be the safe thing to do. I also don't see how unaligned access can occur
> in the packed struct in that case (pointers should always offset to something
> properly aligned, shouldn't they?).

My understanding is this is a false positive warning from clang. Gcc does
not complain but I'm not sure it's capable of doing that either.

Of course it would be the best to fix clang but until that happens or we
change the code, we'll be permanent targets of these e-mails.

Still __packed isn't needed here.

-- 
Kind regards,

Sakari Ailus
