Return-Path: <linux-media+bounces-21144-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4589C1AAD
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 11:35:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CCA51C2649A
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 10:35:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1B3F1F7543;
	Fri,  8 Nov 2024 10:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g94rkRyl"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ADC01F708E;
	Fri,  8 Nov 2024 10:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731061809; cv=none; b=VANRh7rjjMGHEhdoX6qtQTw2kX9A7uT4/9NS7LIIsUEM9nlj1c1q09KeO5HOz2XplJNSfYRemZK0sZkEdsqmenDdjHRs1toETwhPTPcEGlAs+C2uqW/TwGZ6TAjci9htBhUu6l9dbSZGz6wXNSUiNjaA0DnAYeVG7dFCAh/9cy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731061809; c=relaxed/simple;
	bh=exoour9HkIUmKUOFuqOpinLp+c4RvsHfCcYu9I7gfgY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m8eG78JslpiDkI6yPNbefBcaNwcz6tbQaBmIfLN1GOEJq8+saF59cHo7JjBFTCq1eJoqFrFSs/DfRyNDROmrzPEyp5VoTnB7UNaoXn886jpLcra0pHg0pqD3DXXCGbyNQy8EzsbD7hlxMJPse8KUyzMdPLO1Yn3XieIktaS3hOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g94rkRyl; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731061808; x=1762597808;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=exoour9HkIUmKUOFuqOpinLp+c4RvsHfCcYu9I7gfgY=;
  b=g94rkRylidy6gsEYQrWk4eo+AXBF7H0zHfJnnMYRl67afV3OIeKYfVKm
   N/YeLhvdTS2ZmePAD68elKb+tKOBXlcekH0p545PrloAo28cS7/OG8Dcw
   15YD9cq2OWDtCQH2Kp76TzP5DSnbBaSMxfUNoVsoJq8/pTspKW4K0Tmjl
   mMufkdgFebdHlZL4BF/9KXcJe22IPHpSO8s2avwgrjTUImE6m0YZMhvbc
   5Dh1MCoo/OJMoSQspPP6eXk9Q5XXlPJfiW7Hz+/AnOuti1MKPK5ok8zN9
   c8ktpQ+X11WYaLyN1iyARM3vjB4Xi0S9OpnAxFXE8yHTAEyZJqK7O+Iux
   g==;
X-CSE-ConnectionGUID: 3idBldEJS/W2JZL5t894IA==
X-CSE-MsgGUID: +nnzR2SIRwSIKFkaLVa2dA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34631836"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="34631836"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 02:30:07 -0800
X-CSE-ConnectionGUID: RLR3K8oCSUKAGXaqe0IfJw==
X-CSE-MsgGUID: AKwtuo6kTUKc+9nKcE66jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; 
   d="scan'208";a="90035450"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 02:30:05 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 7600511F9BF;
	Fri,  8 Nov 2024 12:30:02 +0200 (EET)
Date: Fri, 8 Nov 2024 10:30:02 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] media: i2c: imx219: make HBLANK r/w to allow longer
 exposures
Message-ID: <Zy3oKnHBiGOq8Uoj@kekkonen.localdomain>
References: <20241029-imx219_fixes-v1-0-b45dc3658b4e@ideasonboard.com>
 <20241029-imx219_fixes-v1-2-b45dc3658b4e@ideasonboard.com>
 <ZySV3KKXSyIreRI4@kekkonen.localdomain>
 <CAPY8ntDF8W+xRBXbe=LYpg21LL7-svhCySTSJHRNiDzQs4Xw5Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPY8ntDF8W+xRBXbe=LYpg21LL7-svhCySTSJHRNiDzQs4Xw5Q@mail.gmail.com>

Hi Dave,

On Thu, Nov 07, 2024 at 12:43:52PM +0000, Dave Stevenson wrote:
> Hi Sakari
> 
> On Fri, 1 Nov 2024 at 08:48, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> >
> > Hi Jai,
> >
> > On Tue, Oct 29, 2024 at 02:27:36PM +0530, Jai Luthra wrote:
> > > From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > >
> > > The HBLANK control was read-only, and always configured such
> > > that the sensor HTS register was 3448. This limited the maximum
> > > exposure time that could be achieved to around 1.26 secs.
> > >
> > > Make HBLANK read/write so that the line time can be extended,
> > > and thereby allow longer exposures (and slower frame rates).
> > > Retain the overall HTS setting when changing modes rather than
> > > resetting it to a default.
> >
> > It looks like this changes horizontal blanking at least in some cases. Does
> > this also work as expected in binned modes, for instance?
> >
> > Many sensors have image quality related issues on untested albeit
> > functional line length values.
> >
> > So my question is: how has this been validated?
> 
> Validated by Sony, or others?
> I've tested a range of values in all modes and not observed any image
> quality issues.

Somehow at least. :-)

> 
> From previous discussions with Sony, they always provide their big
> spreadsheet of register values for the specific mode and frame rate
> requested. I don't think they even officially state that changing
> VTS/FRM_LENGTH_LINES to change the framerate is permitted.
> There are some Sony datasheets (eg imx258) that state "set to X. Any
> other value please confirm with Sony", but that isn't the case for the
> imx219 datasheet. I take that as it is permitted within the defined
> ranges.

I'm not that much concerned of vertical blanking, changing that within the
valid range has effects on the image itself very seldom. Horizontal
blanking is different though and this is what the patch makes changeable,
including a change in the default value. Of course there are big
differences between sensors here.

-- 
Kind regards,

Sakari Ailus

