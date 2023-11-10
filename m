Return-Path: <linux-media+bounces-80-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FD37E8638
	for <lists+linux-media@lfdr.de>; Sat, 11 Nov 2023 00:03:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 25BAF1F20EF5
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 23:03:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C0293C6B8;
	Fri, 10 Nov 2023 23:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D1Td34L+"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2263C6AB
	for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 23:03:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55DEBB0
	for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 15:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699657390; x=1731193390;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cDCGzYZgZfuBEiaUXZUJaMrbXG0YOTZLcKgbzY3muiE=;
  b=D1Td34L+MGsrPJqbH8eR3s3RJYoKKZlfbdO+xasZizxA5wPIuRiXdOAR
   h7n26CvBbwnXN0g5+8oIGus4WU+3fyzTaZ87bpVzPhzSx3mNnybNSdE/y
   O3og5neBvqfTSyVbrzhk8WkjNkO2odLFVwjyofGQcKjxzZg/KtnHxbTsv
   Q35Jna4hcUQ2T1yi2DAkyLPdI58WMBCADVBWs0sBgu0K0HjBstlwE5dJ4
   DX8Ge+VX0zrZfPB9evjf5eNqD/MQ9ZWHnB4/5BNf+83WsM+X+fsct6H3P
   5NNo839sSwgFBtNdd5iAVWaSbAsXgD0Zj9qNSTg2FEuhIVyFSLfGZw8hy
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="390049996"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="390049996"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 15:03:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="1011050272"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="1011050272"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 15:03:08 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id CAAE911FC11;
	Sat, 11 Nov 2023 01:03:05 +0200 (EET)
Date: Fri, 10 Nov 2023 23:03:05 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hdegoede@redhat.com
Subject: Re: [PATCH 6/6] media: ccs: Use V4L2 CCI for accessing sensor
 registers
Message-ID: <ZU62qfayygFQPJMz@kekkonen.localdomain>
References: <20231110094705.1367083-1-sakari.ailus@linux.intel.com>
 <20231110094705.1367083-7-sakari.ailus@linux.intel.com>
 <20231110152115.GF21167@pendragon.ideasonboard.com>
 <ZU6iu0Gd-MOm6tdn@kekkonen.localdomain>
 <20231110225335.GE7466@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231110225335.GE7466@pendragon.ideasonboard.com>

Hi Laurent,

On Sat, Nov 11, 2023 at 12:53:35AM +0200, Laurent Pinchart wrote:
> > > > @@ -3653,7 +3649,7 @@ static int ccs_module_init(void)
> > > >  			ccs_limit_offsets[l + 1].lim =
> > > >  				ALIGN(ccs_limit_offsets[l].lim +
> > > >  				      ccs_limits[i].size,
> > > > -				      ccs_reg_width(ccs_limits[i + 1].reg));
> > > > +				      max(CCI_REG_WIDTH_BYTES(ccs_limits[i + 1].reg), 1UL));
> > > 
> > > What's the reason for the max() here ?
> > 
> > The guardian entry of the ccs_limits array contains zero in the reg field,
> > as one would expect, and CCI_REG_WIDTH_BYTES() returns, as one would
> > expect, zero. And aligning by zero is generally shunned by experienced
> > kernel developers.
> > 
> > ccs_reg_width() used flags for 16- and 32-bit registers so a register that
> > had neither of the flags was considered an 8-bit one.
> 
> Could you instead process the sentinel outside of the loop ? It sounds
> less error-prone.

I'd need to make it a special case within the loop. I prefer to keep it
as-is. But I've added a comment on this there.

There's a check of the integrity of the data structure and that fails when
accessing the information if the last limit somehow gets mangled.

> > > >  int ccs_write_addr(struct ccs_sensor *sensor, u32 reg, u32 val)
> > > >  {
> > > > +	unsigned int retries = 10;
> > > 
> > > This is really not nice, but unrelated to this patch.

Some writes occasionally fail right after power-on (or reset) on some
sensors. This could be handled in power-on and one could hope it doesn't
happen (often) elsewhere. Outside the scope of this set though.

> > > 
> > > >  	int rval;
> > > >  
> > > >  	rval = ccs_call_quirk(sensor, reg_access, true, &reg, &val);
> > > > @@ -364,7 +218,12 @@ int ccs_write_addr(struct ccs_sensor *sensor, u32 reg, u32 val)
> > > >  	if (rval < 0)
> > > >  		return rval;
> > > 
> > > Here you test rval < 0, but below cci_write() will consider any positive
> > > value as an error too. There may not be an actual bug if the function
> > > call above doesn't return positive values, but it's error-prone
> > > nonetheless.
> > 
> > Good point. The quirk function is supposed to return either an error or
> > zero, but I'll assign it to zero here just in case.
> 
> You could also change the check to
> 
> 	if (rval)
> 		return rval;

I'd like to return either an error or 0 here, not a positive value. They
often are related, as you noted, to a bug.

-- 
Regards,

Sakari Ailus

