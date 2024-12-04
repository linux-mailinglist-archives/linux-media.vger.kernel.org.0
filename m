Return-Path: <linux-media+bounces-22628-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCECC9E3DF9
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 16:16:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F0DE3B29C55
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 14:24:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42C2D1FECCF;
	Wed,  4 Dec 2024 14:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ktBsUAiF"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296831FC7EC
	for <linux-media@vger.kernel.org>; Wed,  4 Dec 2024 14:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733322278; cv=none; b=pVk/67/LYabyb9gLfcq1X5FBfZxwAT2m4CsqU9pgg/EUAvzvkkVffSGhaX1t2P2/Ogum7lwSRcw565aKWTn1V+5pJvEwaWFFFNN7VpmNFgtsPDT0JXl6c/rt/CLHMkSW2zX12McIpokFJNKouKj76GRAmEaq+RfJ9eAMR6CkZmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733322278; c=relaxed/simple;
	bh=9WLiGk6gL84X6HtyzbDhvmFiQ5Ezx+GB3f9g4J0Lj6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XHFEbSpyg9I7H2W3Q+Hx5F9uTzepqFavpOT6eTqYKn2X6hlmKCqazRL0pEY5PeyVF0U3FzsalighMDqbfB8ckLi8YsiuYaNAPD4yif3Bwc93z2PYxkXQc8qqpLhsNhNxX7kxtW8S8wrBNLGrIZggDEmxzu15DL29N4+aSwrXB3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ktBsUAiF; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733322278; x=1764858278;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9WLiGk6gL84X6HtyzbDhvmFiQ5Ezx+GB3f9g4J0Lj6o=;
  b=ktBsUAiFOlbCVt+BgGZ/tXyqdfIU4fghCI4qyh4l6UFT7yE8sWrtPDWz
   ALaXBkS4uFrDBEawGIQQ2/JJpmtEgx1+dDwazPKJtzEJLMyZsbo79grqv
   TSyIMWHd3oCIJl/AnlBP7QSc8d1tBV46vLScdUU0daIfoAUAaoQ0weDTr
   wCDA28YNwWilUnjl31gNGOrxHNui2ptOiwHsRbbIPrGX5Hwfw6IlYLNHH
   pCp2N3BnL7UC98PG6DrYsJDRseLKRhl11iaLH9wr4e+pwB7fTOMdg2eaV
   0k7fZJQZs/ZZj4Buf+EEUMK88CjhaRQ4IleDHGNEQplUR1T/0Eqe2T6Y2
   g==;
X-CSE-ConnectionGUID: olL85uRaTheqFhG7O5Ewgg==
X-CSE-MsgGUID: WwCb/j0gTDS4joxGlkx0tQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="51007611"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="51007611"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 06:24:37 -0800
X-CSE-ConnectionGUID: I9v9QyqySb+DUJve5QUdGA==
X-CSE-MsgGUID: INC2VzOkSPGfgg9/7MpPZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="98763873"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 06:24:31 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 983EA11F89A;
	Wed,  4 Dec 2024 16:24:27 +0200 (EET)
Date: Wed, 4 Dec 2024 14:24:27 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Mikhail Rudenko <mike.rudenko@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	"Wang, Hongju" <hongju.wang@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: Re: [RFC v3 7/9] media: uapi: Add V4L2_CID_BINNING control for
 binning configuration
Message-ID: <Z1BmG-9NBLxM1kc7@kekkonen.localdomain>
References: <20241129095142.87196-1-sakari.ailus@linux.intel.com>
 <20241129095142.87196-8-sakari.ailus@linux.intel.com>
 <hkfnqpaukvvffbr3g5ybgy6xgqio4ohdtns72jytk242epykva@c4o5wmtxbeas>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <hkfnqpaukvvffbr3g5ybgy6xgqio4ohdtns72jytk242epykva@c4o5wmtxbeas>

Hi Jacopo,

On Wed, Dec 04, 2024 at 12:33:28PM +0100, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Fri, Nov 29, 2024 at 11:51:40AM +0200, Sakari Ailus wrote:
> > Add V4L2_CID_BINNING control for configuting binning and enumerating a
> > camera sensor's binning capabilities. The control combines horizontal and
> > vertical binning into a single control as the two are generally related.
> >
> > New drivers should use this control to configure binning.
> 
> I thought the idea was to post-pone this (and the following 2 patches)
> to when controls will be able to be tested without changing the device
> configuration, to properly support TRY_FORMAT, and before that time
> work with selection rectangles and let the drivers select the
> "correct" binning/scaling factors deduced from the
> TGT_CROP-to-TGT_COMPOSE ratio on (pad, stream) 1/0

As I wrote on the cover letter, some of the patches in the set will likely
be postponed. Most likely this will mean the binning and sub-sampling
control patches. I still wanted to include them so we'd give some view on
how this would look like once we have control values in sub-device state.

-- 
Kind regards,

Sakari Ailus

