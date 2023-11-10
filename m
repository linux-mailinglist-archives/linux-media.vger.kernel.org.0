Return-Path: <linux-media+bounces-75-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD387E8503
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 22:21:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 028AA1C20AA9
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 21:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F60E3C08E;
	Fri, 10 Nov 2023 21:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IdjySuLv"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C153B28F
	for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 21:21:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBDA393
	for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 13:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699651276; x=1731187276;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OG9SAi6xSCv/xLJF/daXtKsblNWSXB4MXLERJQt+shI=;
  b=IdjySuLvB9TfYfmut0ZmI/EIuUMfkMeQC362G07doqYD5QYlfjFUO+Km
   qoesSvhFpbS00bkwpGWmXA+nKLjwZNvums7QR7J0LyinAOt+zjigyZYkm
   GQ366yA2tLmGYGNYdA9tfuNkfQKS/CbxmIIKXww5XG/TUa71rMveyncCh
   wXOoohS5AWWvoloBp5l/4Ajuorm7KbqwiWfeMZS9XelTYSLPV1KiFy9RU
   9YUujkH1ls/rzlTOkTnZk6E8FGhjro4jXXfYFGv9pKkOA7e2gWKa/LnnG
   WyOAY7+9cHjhnA41MAO7fe+lCoAabxMLSa8d+9dpH4lUwEwY5isI1FupS
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="389094000"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="389094000"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 13:21:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="740248081"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="740248081"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 13:21:14 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 0601611F894;
	Fri, 10 Nov 2023 23:21:12 +0200 (EET)
Date: Fri, 10 Nov 2023 21:21:12 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hdegoede@redhat.com
Subject: Re: [PATCH 2/6] media: v4l: cci: Add driver-private bit definitions
Message-ID: <ZU6eyDHigbeznsGL@kekkonen.localdomain>
References: <20231110094705.1367083-1-sakari.ailus@linux.intel.com>
 <20231110094705.1367083-3-sakari.ailus@linux.intel.com>
 <20231110144407.GA21167@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231110144407.GA21167@pendragon.ideasonboard.com>

Hi Laurent,

On Fri, Nov 10, 2023 at 04:44:07PM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Fri, Nov 10, 2023 at 11:47:01AM +0200, Sakari Ailus wrote:
> > Provide a few bits for drivers to store private information on register
> > definitions.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  include/media/v4l2-cci.h | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/include/media/v4l2-cci.h b/include/media/v4l2-cci.h
> > index f2c2962e936b..b4ce0a46092c 100644
> > --- a/include/media/v4l2-cci.h
> > +++ b/include/media/v4l2-cci.h
> > @@ -33,6 +33,12 @@ struct cci_reg_sequence {
> >  #define CCI_REG_ADDR_MASK		GENMASK(15, 0)
> >  #define CCI_REG_WIDTH_SHIFT		16
> >  #define CCI_REG_WIDTH_MASK		GENMASK(19, 16)
> > +/*
> > + * Private CCI register flags, for the use of drivers.
> > + */
> > +#define CCI_REG_FLAG_PRIVATE_START	28U
> 
> Could we name this CCI_REG_PRIVATE_SHIFT, like we do for WIDTH ?
> 
> > +#define CCI_REG_FLAG_PRIVATE_END	31U
> > +#define CCI_REG_PRIVATE_MASK		GENMASK(CCI_REG_FLAG_PRIVATE_END, CCI_REG_FLAG_PRIVATE_START)
> 
> CCI_REG_FLAG_PRIVATE_END isn't used in the rest of the series, so I
> would just write
> 
> #define CCI_REG_PRIVATE_MASK		GENMASK(31, 28)
> 
> for consistency.

Thank you for the thorough review. ;-)

I was actually thinking of adding BUILD_BUG_ON() for that. Or add
CCI_REG_FLAG_PRIVATE_BITS --- it's a bit nicer to test against. Although I
can't imagine a reason right now why we'd want to reduce the number of
these bits.

I'm fine with just changing the mask to use numbers though, with an added
comment on checking all users if reducing the number. Huh.

> 
> >  
> >  #define CCI_REG8(x)			((1 << CCI_REG_WIDTH_SHIFT) | (x))
> >  #define CCI_REG16(x)			((2 << CCI_REG_WIDTH_SHIFT) | (x))
> 

-- 
Regards,

Sakari Ailus

