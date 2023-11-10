Return-Path: <linux-media+bounces-76-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B7F7E8505
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 22:22:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 747BD281191
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 21:22:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E150F3C68B;
	Fri, 10 Nov 2023 21:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ddeQi1Xb"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518A02230F
	for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 21:22:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BDBE4205
	for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 13:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699651319; x=1731187319;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aEAnPGsixwChxKXa3RV6N2o5Cylv5tOTUMV6mC8eL4g=;
  b=ddeQi1XbGKUagh0HjlttfIl436MX8ELClrQKXejzcQk8Ho5cd3c4PMg5
   rb1ThVxp0L6um86QNuonbzjZEzVuwh616OuffkCHF4+EqpCFVzblnFo2X
   xgRDqiba59BTXWjbIVRmdMwr/baNIMh+bFyMmqBW2uoRfDNpQufSDUnPJ
   wJ1Zbr1pTwKGC3/LNA2/zXsa6+RppXJTI8vzztyg6l9evSSKakgBTEu0x
   9CvbsA1I9L6CJhBQYBp5+v+YgcNdA+hC5vq+OLGmEh8bClXFYKaxPtWps
   +xYfJnGAfa6pra1LGgd2wOPPIuNfVFIwZCoSlAE5Tsb4I+TgJ0t+GsmqQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="476460397"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="476460397"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 13:21:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="757295589"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="757295589"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 13:21:57 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1EDF311F894;
	Fri, 10 Nov 2023 23:21:55 +0200 (EET)
Date: Fri, 10 Nov 2023 21:21:55 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH 3/6] media: v4l: cci: Add macros to obtain register width
Message-ID: <ZU6e834COZapfGaI@kekkonen.localdomain>
References: <20231110094705.1367083-1-sakari.ailus@linux.intel.com>
 <20231110094705.1367083-4-sakari.ailus@linux.intel.com>
 <553265e2-a57a-4f70-9254-f140348ed1e8@redhat.com>
 <ZU4RWhxbJyG-2lR2@kekkonen.localdomain>
 <20231110144445.GC21167@pendragon.ideasonboard.com>
 <20231110144924.GE21167@pendragon.ideasonboard.com>
 <17ef8a66-4463-44e4-9f2c-6313f91421dd@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17ef8a66-4463-44e4-9f2c-6313f91421dd@redhat.com>

Hi Hans,

On Fri, Nov 10, 2023 at 03:52:28PM +0100, Hans de Goede wrote:
> Hi,
> 
> On 11/10/23 15:49, Laurent Pinchart wrote:
> > On Fri, Nov 10, 2023 at 04:44:46PM +0200, Laurent Pinchart wrote:
> >> On Fri, Nov 10, 2023 at 11:17:46AM +0000, Sakari Ailus wrote:
> >>> On Fri, Nov 10, 2023 at 12:14:10PM +0100, Hans de Goede wrote:
> >>>> On 11/10/23 10:47, Sakari Ailus wrote:
> >>>>> Add CCI_REG_WIDTH() macro to obtain register width in bits and similarly,
> >>>>> CCI_REG_WIDTH_BYTES() to obtain it in bytes.
> >>>>>
> >>>>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> >>>>> ---
> >>>>>  include/media/v4l2-cci.h | 3 +++
> >>>>>  1 file changed, 3 insertions(+)
> >>>>>
> >>>>> diff --git a/include/media/v4l2-cci.h b/include/media/v4l2-cci.h
> >>>>> index b4ce0a46092c..80eaa7fdc606 100644
> >>>>> --- a/include/media/v4l2-cci.h
> >>>>> +++ b/include/media/v4l2-cci.h
> >>>>> @@ -40,6 +40,9 @@ struct cci_reg_sequence {
> >>>>>  #define CCI_REG_FLAG_PRIVATE_END	31U
> >>>>>  #define CCI_REG_PRIVATE_MASK		GENMASK(CCI_REG_FLAG_PRIVATE_END, CCI_REG_FLAG_PRIVATE_START)
> >>>>>  
> >>>>> +#define CCI_REG_WIDTH_BYTES(x)		(((x) & CCI_REG_WIDTH_MASK) >> CCI_REG_WIDTH_SHIFT)
> >>>>
> >>>> Please use FIELD_GET like v4l2-cci.c does:
> >>>>
> >>>> #define CCI_REG_WIDTH_BYTES(x)		FIELD_GET(CCI_REG_WIDTH_MASK, (x))
> >>>>
> >>>> With that fixed:
> >>>>
> >>>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> >>>>
> >>>> As for the patch 4 - 6, those are interesting patches but
> >>>> I'm afraid I don't have time to review them.
> >>>
> >>> No worries, I mainly included them to have a user for the newly added
> >>> features.
> >>>
> >>> I'll send v2 with FIELD_GET().
> >>
> >> With FIELD_GET(),
> >>
> >> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > Actually, how about using the new macro in v4l2-cci.c ?
> 
> I considered this too, but atm there are 2 FIELD_GET calls directly
> after one another, e.g. :
> 
>         len = FIELD_GET(CCI_REG_WIDTH_MASK, reg);
>         reg = FIELD_GET(CCI_REG_ADDR_MASK, reg);
> 
> Using the macro would make this look like this:
> 
>         len = CCI_REG_WIDTH_BYTES(reg);
>         reg = FIELD_GET(CCI_REG_ADDR_MASK, reg);
> 
> Which IMHO just make this harder to read. Now if we also add a CCI_REG_ADDR macro
> and use both, then using the macros would be fine ...

I like the idea. I'll add that for v2.

-- 
Regards,

Sakari Ailus

