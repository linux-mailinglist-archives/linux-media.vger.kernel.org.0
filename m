Return-Path: <linux-media+bounces-37108-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB1AAFCB98
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 15:14:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D79471BC6C7A
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 13:13:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 944802E090A;
	Tue,  8 Jul 2025 13:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JzrSavXG"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC142DC354;
	Tue,  8 Jul 2025 13:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751980227; cv=none; b=czieyC7iB4isTQtiobBdOFGBlowu2TY5nqCdr2CZACbxi3vxBYZ33HyIIcTJCJAPER1OAms2HbWP8LDQffKXOaSzEOzgv2SczXpiq2G7TpeWoH+bsQhZD7angNeOOVtsJCS9jk/87EOAaMuz1WdxdtPLxRU3uNJhS9q28zKgm2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751980227; c=relaxed/simple;
	bh=k6wspq8Q25N45G/hBM0B8XndkE7Bw3MPt6gWVRpsJ/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YR1nftCF8GUlBnRTNy7y3pcZbj5bUcJgPfAbYR4sLZPE1Z961rBFgOgeYgSnT+6okMDWeG/FtVrY/eowOW+e6Oei62D6s2kiEgHZJlKMgf0YrSCSZlY6OyZffaWmRj3f3gnu1EZYR67c1CsF0mgnqUvQGuJS10m1gnJH/LkFClo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JzrSavXG; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751980225; x=1783516225;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=k6wspq8Q25N45G/hBM0B8XndkE7Bw3MPt6gWVRpsJ/w=;
  b=JzrSavXG/0FiTJIi0q4URD+HCmTPKdASqKmclO/lHJBxEJGrq9zuGZGp
   7BN1gTbVrkPoVOyJeOAo0m2UYV8AmdLUC92B7Hd88n0C635JYWkUPm7pm
   wxhv97dUg4fmIYYBOyrR7iQ1LsfV/f+3xoahDAtRZLXrjBZs4mhck/0fZ
   Yz2I+jWS4gXRUhVRuv3a4YRccZ//rH51qyB3GOe18/Ge6LZqI0w/MnXVr
   O+8QalrKL+eTocOzrAt++vnnP0j+dIbAEhR6qkCUMg2tdtFDOSXhmgAmL
   rUkRCJOP9VcXnlQNM5Svvtq5qNdCbZwpa3pHOLGshDA39ASKy6hRO1nnx
   A==;
X-CSE-ConnectionGUID: zDnXJynJT7uBTtlNrwY8jg==
X-CSE-MsgGUID: 0Y0oXFVLRLepau/PEmaOCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="41840965"
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; 
   d="scan'208";a="41840965"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 06:10:25 -0700
X-CSE-ConnectionGUID: IvMrp124R5G6d4G2PeTWrA==
X-CSE-MsgGUID: M9cP3xDXTGCjrd7w8Yr2DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; 
   d="scan'208";a="154903744"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 06:10:19 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uZ85P-0000000DZrj-2F8n;
	Tue, 08 Jul 2025 16:10:15 +0300
Date: Tue, 8 Jul 2025 16:10:15 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
Cc: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Hans de Goede <hansg@kernel.org>,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Matthias Fend <matthias.fend@emfend.at>,
	Arnd Bergmann <arnd@arndb.de>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] media: i2c: add ov2735 image sensor driver
Message-ID: <aG0Yt4bewAgqsYLd@smile.fi.intel.com>
References: <20250707150118.20536-1-hardevsinh.palaniya@siliconsignals.io>
 <20250707150118.20536-3-hardevsinh.palaniya@siliconsignals.io>
 <aGwuRP42mtFZmLT8@smile.fi.intel.com>
 <PN3P287MB351968C7B57C3C97D799D1E1FF4EA@PN3P287MB3519.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PN3P287MB351968C7B57C3C97D799D1E1FF4EA@PN3P287MB3519.INDP287.PROD.OUTLOOK.COM>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Jul 08, 2025 at 07:04:48AM +0000, Hardevsinh Palaniya wrote:
> > On Mon, Jul 07, 2025 at 08:31:06PM +0530, Hardevsinh Palaniya wrote:

...

> > > +static int ov2735_disable_streams(struct v4l2_subdev *sd,
> > > +                               struct v4l2_subdev_state *state, u32 pad,
> > > +                               u64 streams_mask)
> > > +{
> > > +     struct ov2735 *ov2735 = to_ov2735(sd);
> > > +     int ret = 0;
> > > +
> > > +     /* set stream off register */
> > > +     ret = cci_write(ov2735->cci, OV2735_REG_PAGE_SELECT, 0x01, NULL);
> > > +     ret |= cci_write(ov2735->cci, OV2735_REG_STREAM_CTRL, OV2735_STREAM_OFF, NULL);
> > 
> > Why not using the ret parameter? Same for other similar cases above and beyond.
> 
> I am not sure what you want to suggest here.
> 
> Do I need to check ret like this?
> 
> ret = cci_write(ov2735->cci, OV2735_REG_PAGE_SELECT, 0x01, NULL);
> if (ret) {
>     // error message
> }
> 
> ret = cci_write(ov2735->cci, OV2735_REG_STREAM_CTRL, OV2735_STREAM_OFF, NULL);
> if (ret) {
>     // error message
> }

No, this is the idea behind it, you check only when you need it.

-- 
With Best Regards,
Andy Shevchenko



