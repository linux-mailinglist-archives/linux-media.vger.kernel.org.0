Return-Path: <linux-media+bounces-42658-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7B7B7F46C
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 15:29:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D38473ACD94
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 10:10:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D370134DCF3;
	Wed, 17 Sep 2025 10:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k14ze+iu"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5BA299949;
	Wed, 17 Sep 2025 10:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758103810; cv=none; b=FQIvQ+grOMpHR1+2YGbqYH9bkOfT+xKK1rAsgv7IOC53BaknYDhq6Mi5fD9F/Haf0sntLivdAJkP5/XznG6mLB2YC+hQdE9wGgC1vjMq1r0EIVqGe8PclLfuoBG4s8UU1sAQyE5xzg/shqomdNx76ovX1m/XBdaIl0bgTYo2eL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758103810; c=relaxed/simple;
	bh=2BpR/sbRSS7JegXJBjXVzWbl6vChgq/HKCHbYvwrI7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rKbwJT9et+dd9t8CF4HGZGH7jGH2SOxMH7uuV0ib8SS7BLvlTyhMZJNaM4xK547IO5qisQmrKZTIZcJN8gkjSkeOU5t75KTj7cPp+0SQacAwcFSr1eFdm7RB9aQZFrCdd/WbqnZq3owwkbrNDCIKcrrm5bij7aSCgNrCQJP3xEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k14ze+iu; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758103809; x=1789639809;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=2BpR/sbRSS7JegXJBjXVzWbl6vChgq/HKCHbYvwrI7U=;
  b=k14ze+iumj9o32ZKto+4r/sdLeBwGsc5kCaQGVl6Oq0gWTGoL6zaU7qS
   rimwdpfYE21h14DkUedkQahaDQlGwoll26pNVxASR/jW4mufpIPPC2IOs
   TXwr01K1N9IP2iv+1JPH8yRBYHV5qPaCX3xzPI9z1RJhoD7R/Mg8YwvwT
   wchFpjeo8XkNjrxpzRZFFbH5rngAZBIlCxkBUFMstSjsn5l5x+y6AnC0Y
   2XgtLFAilhuoqSGktjmia9v3ShoPaClRfHrgcTddW2lvQOvPSVv+2VYi8
   52ODjq4soVdyn39BgmRZa+YR7k5GXVSrQXRcNEgocxKD5KuvLEM5DPnC7
   w==;
X-CSE-ConnectionGUID: 2ppPnF1nRRK1bOab9oygBQ==
X-CSE-MsgGUID: DV8LeAXhQAmpfFZOEBN6Cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="60273889"
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; 
   d="scan'208";a="60273889"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 03:10:08 -0700
X-CSE-ConnectionGUID: C+/Qdhs4RR+Xg+pgupSnIw==
X-CSE-MsgGUID: 2vCrjiHCSjOEzB3SgWbGbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; 
   d="scan'208";a="175980728"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.41])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 03:10:04 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 6911511FC22;
	Wed, 17 Sep 2025 13:10:02 +0300 (EEST)
Date: Wed, 17 Sep 2025 13:10:02 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Val Packett <val@packett.cool>
Cc: =?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Daniel Scally <djrscally@gmail.com>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] media: i2c: dw9719: Fix power on/off sequence
Message-ID: <aMqI-lElZsWV-Hrl@kekkonen.localdomain>
References: <20250817-dw9719-v1-0-426f46c69a5a@apitzsch.eu>
 <20250817-dw9719-v1-7-426f46c69a5a@apitzsch.eu>
 <aKLZ39IzI_azrDIu@kekkonen.localdomain>
 <550f28a9aa82a28beb35fd3490dbe08928ba9eed.camel@apitzsch.eu>
 <fad5cb33-0e7c-499b-bad7-bbdacca8076a@packett.cool>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fad5cb33-0e7c-499b-bad7-bbdacca8076a@packett.cool>

Hi André, Val,

On Tue, Sep 16, 2025 at 05:08:44PM -0300, Val Packett wrote:
> 
> On 9/15/25 5:48 PM, André Apitzsch wrote:
> > Hi Sakari,
> > 
> > @Val, please see below.
> > 
> > Am Montag, dem 18.08.2025 um 07:44 +0000 schrieb Sakari Ailus:
> > > Hi André,
> > > 
> > > On Sun, Aug 17, 2025 at 07:09:26PM +0200, André Apitzsch via B4 Relay
> > > wrote:
> > > >   	u64 val;
> > > >   	int ret;
> > > >   	int err;
> > > > @@ -109,13 +116,15 @@ static int dw9719_power_up(struct
> > > > dw9719_device *dw9719, bool detect)
> > > >   	if (ret)
> > > >   		return ret;
> > > > -	/* Jiggle SCL pin to wake up device */
> > > > -	reg_pwr = (dw9719->model == DW9718S) ? DW9718S_PD :
> > > > DW9719_CONTROL;
> > > > -	cci_write(dw9719->regmap, reg_pwr, DW9719_SHUTDOWN, &ret);
> > > > -	fsleep(100);
> > > > +	/*
> > > > +	 * Need 100us to transition from SHUTDOWN to STANDBY.
> > > > +	 * Jiggle the SCL pin to wake up the device (even when the
> > > > regulator
> > > > +	 * is shared) and wait double the time to be sure, then
> > > > retry the write.
> > > Why double? Isn't the datasheet correct when it comes to the power-on
> > > sequence?
> > > 
> > I haven't noticed any problems during power-up of DW9761. However,
> > according to the commit message, there seems be an issue with DW9718S.
> > But I don't own the device and cannot test it.
> > 
> > Maybe Val can provided some additional information.
> 
> I haven't had access to the datasheet for the DW9718S, so this was all
> deduced experimentally. By "to be sure" I meant that I literally raised the
> timeout "just in case", not based on actual issues.
> 
> The actually important change was expecting the failure on the write and not
> erroring out.

Ack.

André: could you add this information to the comment as well?

-- 
Kind regards,

Sakari Ailus

