Return-Path: <linux-media+bounces-270-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C792A7EA0C7
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 17:00:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C3BF1F21A48
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 16:00:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FFA621A19;
	Mon, 13 Nov 2023 16:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TXIGJAlW"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8EE219F3
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 16:00:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24C6C10E0
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 08:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699891216; x=1731427216;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q2tYs8WFoFebzIw35zba8RGoWBLfSNGqsDV489rfqZ8=;
  b=TXIGJAlWoqXrHQ7d23grN9UcpPbcKlx+vTQ4RsZo4ltgA8ALn757dCOM
   KMkyGhoXwW2PoeCyFT74Ys3hoFDsfWslrZVLDFY1C5jPrpltsFleN7JMo
   hUVrimaLbAFUbw5SyNJh7jEqeT/emSrSwsM7Q+fUzk9H/mtAGxPwKaAtx
   1YMO45utaWfedw5lIBasXyxVkTKETM9JLRVJ2G7r+QPMUyuObcdD5nCkm
   oebEytIkwnH7lqHJUSgIa6ktFqgWiX59sjy+kR28m6G7l9ppzNjA/yzfL
   vbG4djipbT35a7wD302DvtViUYun75v1FyI9CktuAmq3hotpEXOuBrPRN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="421560470"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="421560470"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 08:00:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="830271611"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="830271611"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 08:00:14 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 136F5120BA7;
	Mon, 13 Nov 2023 18:00:12 +0200 (EET)
Date: Mon, 13 Nov 2023 16:00:12 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hdegoede@redhat.com
Subject: Re: [PATCH v2 5/6] media: ccs: Better separate CCS static data access
Message-ID: <ZVJIDNJ2j_HBwweJ@kekkonen.localdomain>
References: <20231113134458.1423754-1-sakari.ailus@linux.intel.com>
 <20231113134458.1423754-6-sakari.ailus@linux.intel.com>
 <20231113135710.GG24338@pendragon.ideasonboard.com>
 <ZVIt8Z_1FpxN2ooz@kekkonen.localdomain>
 <20231113141618.GA12711@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231113141618.GA12711@pendragon.ideasonboard.com>

On Mon, Nov 13, 2023 at 04:16:18PM +0200, Laurent Pinchart wrote:
> On Mon, Nov 13, 2023 at 02:08:49PM +0000, Sakari Ailus wrote:
> > On Mon, Nov 13, 2023 at 03:57:10PM +0200, Laurent Pinchart wrote:
> > > Hi Sakari,
> > > 
> > > Thank you for the patch.
> > > 
> > > On Mon, Nov 13, 2023 at 03:44:57PM +0200, Sakari Ailus wrote:
> > > > Separate CCS static data read-only register access in ccs-reg-access.c by
> > > > naming them differently.
> > > 
> > > "naming the access functions differently"
> > > 
> > > > The code in this file generally deals with reading and writing registers
> > > > where as static data (when it comes to ccs_static_read_only()) contains
> > > > the read-only register values but no hardware registers are accessed in
> > > > that case.
> > > > 
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > ---
> > > >  .../driver-api/media/drivers/ccs/mk-ccs-regs  |  2 +-
> > > >  drivers/media/i2c/ccs/ccs-reg-access.c        | 20 +++++++++----------
> > > >  2 files changed, 11 insertions(+), 11 deletions(-)
> > > > 
> > > > diff --git a/Documentation/driver-api/media/drivers/ccs/mk-ccs-regs b/Documentation/driver-api/media/drivers/ccs/mk-ccs-regs
> > > > index 01252ee6062b..3d3152b45821 100755
> > > > --- a/Documentation/driver-api/media/drivers/ccs/mk-ccs-regs
> > > > +++ b/Documentation/driver-api/media/drivers/ccs/mk-ccs-regs
> > > > @@ -136,7 +136,7 @@ if (! defined $kernel) {
> > > >  
> > > >  print $H "#define CCS_FL_FLOAT_IREAL	" . flag_str(\$flag, \$all_flags) . "\n";
> > > >  print $H "#define CCS_FL_IREAL		" . flag_str(\$flag, \$all_flags) . "\n";
> > > > -print $H "#define CCS_BUILD_BUG \
> > > > +print $H "#define CCS_BUILD_BUG \\
> > > 
> > > This doesn't seem related.
> > 
> > Oops. This was meant to go to the previous patch. I'll address this in
> > v3...
> > 
> > > 
> > > >  	BUILD_BUG_ON(~CCI_REG_PRIVATE_MASK & ($all_flags))\n"
> > > >      if defined $kernel;
> > > >  
> > > > diff --git a/drivers/media/i2c/ccs/ccs-reg-access.c b/drivers/media/i2c/ccs/ccs-reg-access.c
> > > > index 25993445f4fe..652d705a2ef5 100644
> > > > --- a/drivers/media/i2c/ccs/ccs-reg-access.c
> > > > +++ b/drivers/media/i2c/ccs/ccs-reg-access.c
> > > > @@ -197,8 +197,8 @@ static int __ccs_read_addr(struct ccs_sensor *sensor, u32 reg, u32 *val,
> > > >  	return 0;
> > > >  }
> > > >  
> > > > -static int __ccs_read_data(struct ccs_reg *regs, size_t num_regs,
> > > > -			   u32 reg, u32 *val)
> > > > +static int __ccs_static_read_only(struct ccs_reg *regs, size_t num_regs,
> > > 
> > > "static read only" sounds weird when interpreting "read" as a verb. And
> > > if "read" is not a verb, you're missing a verb :-) Maybe
> > > __ccs_read_state_data() would be a better name ? Same below.
> > 
> > Why state_data? I prefer to use terms used in the spec, not come up with
> > new ones.
> 
> Sorry, I mean __ccs_read_static_data(). I'm working on a patch related
> to V4L2 subdev state at the moment :-)
> 
> > There are also other blocks in static data beseides read-only register
> > values.
> > 
> > How about ccs_static_data_read_only_reg(), would that be more informative
> > in your opinion?
> 
> ccs_static_data_read_ro_reg() would work for me. I interpret
> ccs_static_data_read_only_reg() as "read just the register and nothing
> else".

ccs_static_data_read_ro_reg() seems reasonable, I'll use it in v3.

There will be more similarly named functions in the future.

-- 
Sakari Ailus

