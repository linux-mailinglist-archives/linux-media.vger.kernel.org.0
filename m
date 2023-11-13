Return-Path: <linux-media+bounces-283-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3947EA122
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 17:18:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 403E4B209A4
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 16:18:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D848A22334;
	Mon, 13 Nov 2023 16:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ws/ogLXv"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B08722318
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 16:18:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58CF110EC
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 08:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699892312; x=1731428312;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tKhEKNG3iCk3348FhnGZo7qfkRAsq7ivVd8XcqB2m7k=;
  b=Ws/ogLXv/YNWYjoSx0WZlZiQVYo3ocnXBpROoIe3bjHBl47tsMrr0hdg
   sae18Z//hxqCj07raTQkHqFQhVVgmrPBKa6F7792HeiiQ7urlNKn+H3c+
   vBznGuuW4VTyZn6P/57ampqUFzV7H37UU/t3H5AY/NVuQEqDfrKEVg9DQ
   OVVa8dVcPoEwO3JM+gGdT6G8KzhIY6dGgCN5GLA8h8ArOLF0A1vO9kUuN
   8E5IWDtn5XAPvp70VXpmkiDeCbGzPZdBaz0DzONsZbAKT3XPWdECQiE6a
   ijZisxuJLD9VYnErkSokE7SzWH+M/ZILBuQf52x+HJrnDttlYiavb0CcU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="393324693"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="393324693"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 08:18:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="887962420"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="887962420"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 08:18:30 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 28175120DDF;
	Mon, 13 Nov 2023 18:18:28 +0200 (EET)
Date: Mon, 13 Nov 2023 16:18:28 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hdegoede@redhat.com
Subject: Re: [PATCH v3 3/6] media: v4l: cci: Add macros to obtain register
 width and address
Message-ID: <ZVJMVDbuk64OzFvP@kekkonen.localdomain>
References: <20231113160601.1427972-1-sakari.ailus@linux.intel.com>
 <20231113160601.1427972-4-sakari.ailus@linux.intel.com>
 <20231113161138.GH24338@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231113161138.GH24338@pendragon.ideasonboard.com>

Hi Laurent,

On Mon, Nov 13, 2023 at 06:11:38PM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Mon, Nov 13, 2023 at 06:05:58PM +0200, Sakari Ailus wrote:
> > Add CCI_REG_WIDTH() macro to obtain register width in bits and similarly,
> > CCI_REG_WIDTH_BYTES() to obtain it in bytes.
> > 
> > Also add CCI_REG_ADDR() macro to obtain the address of a register.
> > 
> > Use both macros in v4l2-cci.c, too.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> 
> Please write per-patch changelogs. You would then have likely caught the
> issue below.

That forces the reviewer to read all the patches, I'm not convinced it
would have made any difference here.

> 
> > ---
> >  drivers/media/v4l2-core/v4l2-cci.c | 8 ++++----
> >  include/media/v4l2-cci.h           | 9 +++++++--
> >  2 files changed, 11 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-cci.c b/drivers/media/v4l2-core/v4l2-cci.c
> > index bc2dbec019b0..3179160abde3 100644
> > --- a/drivers/media/v4l2-core/v4l2-cci.c
> > +++ b/drivers/media/v4l2-core/v4l2-cci.c
> > @@ -25,8 +25,8 @@ int cci_read(struct regmap *map, u32 reg, u64 *val, int *err)
> >  	if (err && *err)
> >  		return *err;
> >  
> > -	len = FIELD_GET(CCI_REG_WIDTH_MASK, reg);
> > -	reg = FIELD_GET(CCI_REG_ADDR_MASK, reg);
> > +	len = CCI_REG_WIDTH_BYTES(reg);
> > +	reg = CCI_REG_ADDR(reg);
> >  
> >  	ret = regmap_bulk_read(map, reg, buf, len);
> >  	if (ret) {
> > @@ -75,8 +75,8 @@ int cci_write(struct regmap *map, u32 reg, u64 val, int *err)
> >  	if (err && *err)
> >  		return *err;
> >  
> > -	len = FIELD_GET(CCI_REG_WIDTH_MASK, reg);
> > -	reg = FIELD_GET(CCI_REG_ADDR_MASK, reg);
> > +	len = CCI_REG_WIDTH_BYTES(reg);
> > +	reg = CCI_REG_ADDR(reg);
> >  
> >  	switch (len) {
> >  	case 1:
> > diff --git a/include/media/v4l2-cci.h b/include/media/v4l2-cci.h
> > index ee469f03e440..50df3aa4af1d 100644
> > --- a/include/media/v4l2-cci.h
> > +++ b/include/media/v4l2-cci.h
> > @@ -7,6 +7,7 @@
> >  #ifndef _V4L2_CCI_H
> >  #define _V4L2_CCI_H
> >  
> > +#include <linux/bitfield.h>
> >  #include <linux/bits.h>
> >  #include <linux/types.h>
> >  
> > @@ -36,8 +37,12 @@ struct cci_reg_sequence {
> >  /*
> >   * Private CCI register flags, for the use of drivers.
> >   */
> > -#define CCI_REG_PRIVATE_SHIFT		28U
> > -#define CCI_REG_PRIVATE_MASK		GENMASK(31U, CCI_REG_PRIVATE_SHIFT)
> > +#define CCI_REG_PRIVATE_SHIFT		28
> > +#define CCI_REG_PRIVATE_MASK		GENMASK(31, CCI_REG_PRIVATE_SHIFT)
> 
> Was this meant to be in the previous patch ?

Yes. But this was actually there in v2 already, and missed in review. I'll
fix in v4.

> 
> > +
> > +#define CCI_REG_WIDTH_BYTES(x)		FIELD_GET(CCI_REG_WIDTH_MASK, x)
> > +#define CCI_REG_WIDTH(x)		(CCI_REG_WIDTH_BYTES(x) << 3)
> > +#define CCI_REG_ADDR(x)			FIELD_GET(CCI_REG_ADDR_MASK, x)
> >  
> >  #define CCI_REG8(x)			((1 << CCI_REG_WIDTH_SHIFT) | (x))
> >  #define CCI_REG16(x)			((2 << CCI_REG_WIDTH_SHIFT) | (x))
> 

-- 
Regards,

Sakari Ailus

