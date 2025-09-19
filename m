Return-Path: <linux-media+bounces-42739-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAD6B87FB3
	for <lists+linux-media@lfdr.de>; Fri, 19 Sep 2025 08:18:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E981F1C2070E
	for <lists+linux-media@lfdr.de>; Fri, 19 Sep 2025 06:18:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEB812874FB;
	Fri, 19 Sep 2025 06:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nAMmvPum"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A88278761;
	Fri, 19 Sep 2025 06:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758262693; cv=none; b=GLts3XySGhIOEBWkMreNATi+6aXiMWmae5BtZgsEsqcescag2g2/3WszgbVc0thEC7S7YTTTdHDn5iQ1GW0xsA1SpKtILbKu8XOhZOh00CqcF1ms3FeP5Q1KGuOyqN7yQv/kwHLOfS+hicsl0YEyLfOFFe19nkvLZUwLdSFjKqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758262693; c=relaxed/simple;
	bh=0/QC8YWC4+0v7OdKZoApTs030liBQ5uEFJmwWVZ6ut8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CoTDi4uLAc5VNUM/6aDX391njcw8U1vb3TtprmCvyCmHz1OhOl97xUvc+7/oFiEKC0G0bYiE6G9eoKO6v+RFZ9UN4Lv4DIqp7V2yJFQ0ADo7/wiv39QO3f/Jqt1cK9G6hIr9bmkf7sCuBaDccNwrYoQZR0HyiHNKrekOiPg+wUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nAMmvPum; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758262689; x=1789798689;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=0/QC8YWC4+0v7OdKZoApTs030liBQ5uEFJmwWVZ6ut8=;
  b=nAMmvPum4i0iuLru18px0zj79UgDQHPs6gOqjvOOhBMoaCSSaitTwBQ4
   yomNdbDvLSyeshY/19ZxN5i36oBYn7RB6kTUznOb2RC3z5D1otXi6oetL
   leF6XKKMA4fQIozm6QH44dUyqEm6pNVXyDTVj75BzIREsSs7H7zpUcqcr
   yH3QgUO3duREC2W5twwLB+EJvdUcAZmZHtgR/obqcFFzG/dQel9kvwNJE
   VE1TqIsnbMAiDTawe50UmVL/tp1vJx01VMXcrUhD8vmWbCgQpDp+a+cUS
   KTbvBGeBKGLn8BZmBAGmTNGQiSbSQjlKQFfAWWh6pYNt1ek7WXfaMUOSA
   Q==;
X-CSE-ConnectionGUID: LrOoh5HaQFelrZD0oE/hbg==
X-CSE-MsgGUID: 5eexzdSHS1CdcqZM67MQsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="71978628"
X-IronPort-AV: E=Sophos;i="6.18,277,1751266800"; 
   d="scan'208";a="71978628"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2025 23:18:08 -0700
X-CSE-ConnectionGUID: w9Myn/mvTEi4V2WfCcL8aQ==
X-CSE-MsgGUID: VA6/VX+CTgac/s8lyjtaLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,277,1751266800"; 
   d="scan'208";a="180013732"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.105])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2025 23:18:07 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 46E2211FC22;
	Fri, 19 Sep 2025 09:18:03 +0300 (EEST)
Date: Fri, 19 Sep 2025 09:18:03 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
Cc: Val Packett <val@packett.cool>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Daniel Scally <djrscally@gmail.com>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] media: i2c: dw9719: Fix power on/off sequence
Message-ID: <aMz1m2gM_fX_51Xo@kekkonen.localdomain>
References: <20250817-dw9719-v1-0-426f46c69a5a@apitzsch.eu>
 <20250817-dw9719-v1-7-426f46c69a5a@apitzsch.eu>
 <aKLZ39IzI_azrDIu@kekkonen.localdomain>
 <550f28a9aa82a28beb35fd3490dbe08928ba9eed.camel@apitzsch.eu>
 <fad5cb33-0e7c-499b-bad7-bbdacca8076a@packett.cool>
 <aMqI-lElZsWV-Hrl@kekkonen.localdomain>
 <048dd9a2d3257ddea4e4223b023bde9747469083.camel@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <048dd9a2d3257ddea4e4223b023bde9747469083.camel@apitzsch.eu>

On Thu, Sep 18, 2025 at 11:31:18PM +0200, André Apitzsch wrote:
> Hi Sakari,
> 
> Am Mittwoch, dem 17.09.2025 um 13:10 +0300 schrieb Sakari Ailus:
> > Hi André, Val,
> > 
> > On Tue, Sep 16, 2025 at 05:08:44PM -0300, Val Packett wrote:
> > > 
> > > On 9/15/25 5:48 PM, André Apitzsch wrote:
> > > > Hi Sakari,
> > > > 
> > > > @Val, please see below.
> > > > 
> > > > Am Montag, dem 18.08.2025 um 07:44 +0000 schrieb Sakari Ailus:
> > > > > Hi André,
> > > > > 
> > > > > On Sun, Aug 17, 2025 at 07:09:26PM +0200, André Apitzsch via B4
> > > > > Relay wrote:
> > > > > >   	u64 val;
> > > > > >   	int ret;
> > > > > >   	int err;
> > > > > > @@ -109,13 +116,15 @@ static int dw9719_power_up(struct
> > > > > > dw9719_device *dw9719, bool detect)
> > > > > >   	if (ret)
> > > > > >   		return ret;
> > > > > > -	/* Jiggle SCL pin to wake up device */
> > > > > > -	reg_pwr = (dw9719->model == DW9718S) ? DW9718S_PD :
> > > > > > DW9719_CONTROL;
> > > > > > -	cci_write(dw9719->regmap, reg_pwr, DW9719_SHUTDOWN,
> > > > > > &ret);
> > > > > > -	fsleep(100);
> > > > > > +	/*
> > > > > > +	 * Need 100us to transition from SHUTDOWN to
> > > > > > STANDBY.
> > > > > > +	 * Jiggle the SCL pin to wake up the device (even
> > > > > > when the
> > > > > > regulator
> > > > > > +	 * is shared) and wait double the time to be sure,
> > > > > > then
> > > > > > retry the write.
> > > > > Why double? Isn't the datasheet correct when it comes to the
> > > > > power-on sequence?
> > > > > 
> > > > I haven't noticed any problems during power-up of DW9761.
> > > > However, according to the commit message, there seems be an issue
> > > > with DW9718S. But I don't own the device and cannot test it.
> > > > 
> > > > Maybe Val can provided some additional information.
> > > 
> > > I haven't had access to the datasheet for the DW9718S, so this was
> > > all deduced experimentally. By "to be sure" I meant that I
> > > literally raised the timeout "just in case", not based on actual
> > > issues.
> > > 
> > > The actually important change was expecting the failure on the
> > > write and not erroring out.
> > 
> > Ack.
> > 
> > André: could you add this information to the comment as well?
> 
> Could you clarify which information.

What you now have in the commit message. It's relevant for the driver.

-- 
Sakari Ailus

