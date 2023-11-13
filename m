Return-Path: <linux-media+bounces-249-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D347E9DEB
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 14:56:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0FD0F1C20929
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 13:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98B9720B21;
	Mon, 13 Nov 2023 13:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RvAzyeGB"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C53C1CAB9
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 13:56:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BA1FD5C
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 05:56:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699883795; x=1731419795;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=201eLOAzJlOS4TJjAXfnrDpvvOtCxYJfVV5tUtz91YU=;
  b=RvAzyeGB4po/FCCfanLXhh5Blo5VCxf7AbiKXU4b/DTKuaVwkev7SJIr
   QUJMzLbyqCQsra4xHs9rb+3Hop5Dw50JTNNlcj9K7G3mq2hY2lAixLYGr
   /0qaLtyF/gjELLtBO9OrIb/osVjLjD/aERTjAdFEgB8DU+D2OTKujS5Hp
   F5wCxvUOzVmxXIuPZxLTbdbxRWqhkzNYywZeQpqeA+iQdUINTd7zqo7i6
   Sih4GIZgJ2DW3osqXNuamPFOgfy01YCbo4TMQfacef5WZtiU4dfDMExwk
   tNNK29mpRmGl5UUHxMs5kCJoj78/RC3JYRhwID1Kgez6KEKVgn7giRHCp
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="394334988"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="394334988"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 05:56:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="714232501"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="714232501"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 05:56:33 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 3F90311F7D1;
	Mon, 13 Nov 2023 15:56:31 +0200 (EET)
Date: Mon, 13 Nov 2023 13:56:31 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hdegoede@redhat.com
Subject: Re: [PATCH v2 2/6] media: v4l: cci: Add driver-private bit
 definitions
Message-ID: <ZVIrDw5x2VB06VlQ@kekkonen.localdomain>
References: <20231113134458.1423754-1-sakari.ailus@linux.intel.com>
 <20231113134458.1423754-3-sakari.ailus@linux.intel.com>
 <20231113135321.GE24338@pendragon.ideasonboard.com>
 <20231113135400.GF24338@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231113135400.GF24338@pendragon.ideasonboard.com>

Hi Laurent,

On Mon, Nov 13, 2023 at 03:54:00PM +0200, Laurent Pinchart wrote:
> On Mon, Nov 13, 2023 at 03:53:22PM +0200, Laurent Pinchart wrote:
> > On Mon, Nov 13, 2023 at 03:44:54PM +0200, Sakari Ailus wrote:
> > > Provide a few bits for drivers to store private information on register
> > > definitions.
> > > 
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> > > ---
> > >  include/media/v4l2-cci.h | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > > 
> > > diff --git a/include/media/v4l2-cci.h b/include/media/v4l2-cci.h
> > > index f2c2962e936b..ee469f03e440 100644
> > > --- a/include/media/v4l2-cci.h
> > > +++ b/include/media/v4l2-cci.h
> > > @@ -33,6 +33,11 @@ struct cci_reg_sequence {
> > >  #define CCI_REG_ADDR_MASK		GENMASK(15, 0)
> > >  #define CCI_REG_WIDTH_SHIFT		16
> > >  #define CCI_REG_WIDTH_MASK		GENMASK(19, 16)
> > 
> > Should these be unsigned too for consistency ?
> > 
> > > +/*
> > > + * Private CCI register flags, for the use of drivers.
> > > + */
> > > +#define CCI_REG_PRIVATE_SHIFT		28U
> > > +#define CCI_REG_PRIVATE_MASK		GENMASK(31U, CCI_REG_PRIVATE_SHIFT)
> 
> And actually, for consistency again, I would write
> 
> #define CCI_REG_PRIVATE_MASK		GENMASK(31U, 28U)

I would prefer to use the macro instead.

I can post a patch doing that for the older definitions, too.

It's not urgent though. I'll wait for the endianness patches to get merged.

-- 
Regards,

Sakari Ailus

