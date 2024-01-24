Return-Path: <linux-media+bounces-4137-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D052383A784
	for <lists+linux-media@lfdr.de>; Wed, 24 Jan 2024 12:10:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 42EB01F22D31
	for <lists+linux-media@lfdr.de>; Wed, 24 Jan 2024 11:10:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B16C01AACF;
	Wed, 24 Jan 2024 11:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GHIop+St"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FC71AAB1
	for <linux-media@vger.kernel.org>; Wed, 24 Jan 2024 11:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706094616; cv=none; b=pAAJ602C4/Yp5kEx/0LD+bxqMuAV8jytrWloTXEQi4ovfLkcvtm/I9f4ArMAkgnP/M3ngf84vo7Vv6jSq5gL8cB93x7zzKBUcpu9hbl12rP2C6M8fQMnXfWs4d9UqaukabG0nGuqb0sUVn67R+Rax6brPpr/KO8kWrQD24P39vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706094616; c=relaxed/simple;
	bh=cIy9R8DWvw4ExY1ogJVhq7QnDF0PHmzqcwxcwrGqlbc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QmzWG/fQrhI+4PPbB5r7268yVy5i++0avmFbt024KapN5i2FHvFgtIJb0LCT9XVGzxItoaudtUMy2zf3y6JmRwj37gauR1b9Y4Tx9Ep8VhTsYxzXfbnam0ubvUV5WIELQugQawJV17TYhvrwwGh3mYRHU7xv2xOsustGIvFzvs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GHIop+St; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706094615; x=1737630615;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=cIy9R8DWvw4ExY1ogJVhq7QnDF0PHmzqcwxcwrGqlbc=;
  b=GHIop+SttN6n9sD8yge9fgChLSnlnM6RzIWvKnaxn3j4TohcTEykPRbg
   IRCJyRMEiJoCfMcXpZwe1gY7lQI+Os83mloj3xwDNWrISF8ndX3Mw6kMK
   E06b2v4aVLZhbmcZ0KSbE3+lZHIjd3AJg2XPn79TkLQAp9nvNhNfAbxdN
   tfecosHFDdsFGCrzaPfRxiAZZd8CPppDhHo9Sk+hDvMmObqy/bjPoJKN0
   ZxZVthRXmJMFrGJ+thJU2ZCMar+XJ1zwVGbHa+9yWFXsWFX73EDezuYAs
   MDu3Q3FMmrduS6XDLpfLmMcI4RJQF02ciQxHCxl7Xo5kwZt5hb47eKaUc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="709515"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="709515"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 03:10:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="28350537"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 03:10:13 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 42DFD11FAD4;
	Wed, 24 Jan 2024 13:10:09 +0200 (EET)
Date: Wed, 24 Jan 2024 11:10:09 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tomasz Figa <tfiga@chromium.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	"Chen, Jason Z" <jason.z.chen@intel.com>,
	bingbu.cao@linux.intel.com, linux-media@vger.kernel.org,
	andy.yeh@intel.com, qingwu.zhang@intel.com
Subject: Re: [PATCH v5] media: ov08x40: Reduce start streaming time
Message-ID: <ZbDwEVkkaINibMoT@kekkonen.localdomain>
References: <20240124033154.834344-1-jason.z.chen@intel.com>
 <20240124071837.GA3976836@google.com>
 <CAAFQd5BjBgTWNW4M5NPseLxm0aFzjhrF-q=jLth2eXM+5RM09g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAFQd5BjBgTWNW4M5NPseLxm0aFzjhrF-q=jLth2eXM+5RM09g@mail.gmail.com>

On Wed, Jan 24, 2024 at 04:27:51PM +0900, Tomasz Figa wrote:
> On Wed, Jan 24, 2024 at 4:18 PM Sergey Senozhatsky
> <senozhatsky@chromium.org> wrote:
> >
> > On (24/01/24 11:31), Chen, Jason Z wrote:
> > [..]
> > >  /* Write registers up to 4 at a time */
> > >  static int ov08x40_write_reg(struct ov08x40 *ov08x,
> > >                            u16 reg, u32 len, u32 __val)
> > > @@ -2936,6 +1827,19 @@ static int ov08x40_start_streaming(struct ov08x40 *ov08x)
> > >               return ret;
> > >       }
> > >
> > > +     /* Use i2c burst to write register on full size registers */
> > > +     if (ov08x->cur_mode->exposure_shift == 1) {
> > > +             ret = ov08x40_burst_fill_regs(ov08x, OV08X40_REG_XTALK_FIRST_A,
> > > +                                           OV08X40_REG_XTALK_LAST_A, 0x75);
> > > +             ret = ov08x40_burst_fill_regs(ov08x, OV08X40_REG_XTALK_FIRST_B,
> > > +                                           OV08X40_REG_XTALK_LAST_B, 0x75);
> >
> > If we have to be pedantic then second ov08x40_burst_fill_regs()
> > overwrites whatever first ov08x40_burst_fill_regs() returns.
> >
> > But it's unlikely to be a real problem.
> 
> Hmm, good point. I guess in theory we could have a situation when the
> first write fails and the second succeeds and no error is returned
> ultimately... I guess I'll leave the final call on this one to Sakari,
> as the maintainer. :)

It's a bug, isn't it?

-- 
Sakari Ailus

