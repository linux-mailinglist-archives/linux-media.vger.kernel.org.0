Return-Path: <linux-media+bounces-248-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B421F7E9DEA
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 14:55:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6ADDB280E32
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 13:55:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB1B920B22;
	Mon, 13 Nov 2023 13:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KxoTP2bb"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9F81DA5B
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 13:54:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DBC2D4D
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 05:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699883697; x=1731419697;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NHenjK/4bwroM0NATzodkCw062flAnS1an7zjoATBoQ=;
  b=KxoTP2bbDD/ixWjTMtMuc95y6cVCCYuZAmWN6+mxK+RPJvOvuCMYM8os
   RCP55TYceRLSvf2ch1We8GbcXfRf83R28Tevxb5lzDfMVSlkcgfRFNK62
   +gsWOmcfi4NQFAN+A18Vk+qGkPtMZnWQ2IKnpIw44pDcvrWfOy/nGVibV
   0xndb0w8UODu7qNLIvAnibLiLxy9fhCMtE9VGGUCmbEQo7rvnysfewdkU
   EGn/QpgFyqH0g1SS+jm1w6ePfj6REx3Qtc83AS3KNBaGRHLb6zY5oQ9Xp
   QBTAM2IrspqFgFoCc6ANmPznww8T3lzU7b7xZq0yhlV9WKCZ94haqAlr/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="394334872"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="394334872"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 05:54:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="714232243"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="714232243"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 05:54:55 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 25AB911F7D1;
	Mon, 13 Nov 2023 15:54:53 +0200 (EET)
Date: Mon, 13 Nov 2023 13:54:53 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hdegoede@redhat.com
Subject: Re: [PATCH v2 2/6] media: v4l: cci: Add driver-private bit
 definitions
Message-ID: <ZVIqreFIgnMPUtVW@kekkonen.localdomain>
References: <20231113134458.1423754-1-sakari.ailus@linux.intel.com>
 <20231113134458.1423754-3-sakari.ailus@linux.intel.com>
 <20231113135321.GE24338@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231113135321.GE24338@pendragon.ideasonboard.com>

Hi Laurent,

On Mon, Nov 13, 2023 at 03:53:21PM +0200, Laurent Pinchart wrote:
> On Mon, Nov 13, 2023 at 03:44:54PM +0200, Sakari Ailus wrote:
> > Provide a few bits for drivers to store private information on register
> > definitions.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> > ---
> >  include/media/v4l2-cci.h | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/include/media/v4l2-cci.h b/include/media/v4l2-cci.h
> > index f2c2962e936b..ee469f03e440 100644
> > --- a/include/media/v4l2-cci.h
> > +++ b/include/media/v4l2-cci.h
> > @@ -33,6 +33,11 @@ struct cci_reg_sequence {
> >  #define CCI_REG_ADDR_MASK		GENMASK(15, 0)
> >  #define CCI_REG_WIDTH_SHIFT		16
> >  #define CCI_REG_WIDTH_MASK		GENMASK(19, 16)
> 
> Should these be unsigned too for consistency ?

I recall someone else was working on a related patch so I decided to wait.

But yes, I agree.

> 
> > +/*
> > + * Private CCI register flags, for the use of drivers.
> > + */
> > +#define CCI_REG_PRIVATE_SHIFT		28U
> > +#define CCI_REG_PRIVATE_MASK		GENMASK(31U, CCI_REG_PRIVATE_SHIFT)
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks!

> 
> >  
> >  #define CCI_REG8(x)			((1 << CCI_REG_WIDTH_SHIFT) | (x))
> >  #define CCI_REG16(x)			((2 << CCI_REG_WIDTH_SHIFT) | (x))
> 

-- 
Regards,

Sakari Ailus

