Return-Path: <linux-media+bounces-37176-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 46721AFE19A
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 09:49:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5297F563B47
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 07:49:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76662271454;
	Wed,  9 Jul 2025 07:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ob4N7d3L"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771CB5383;
	Wed,  9 Jul 2025 07:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752047342; cv=none; b=njo/5Z06r8Ls5dyjz5DAYSPBrpFei4vWVUlep2mYd837i9DcHwCxhh+3lW0fGlx+Jl9ij/UmhhNfLOxZIz2QvwnZBaxAlnE7pssoL3E0051wyPr/bHLsJmuX1b8OuKxB3iR2gY9EkLkR+Z5X5ZAlsoajrKFpn75XZBw3bcrxt54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752047342; c=relaxed/simple;
	bh=WRMhHclH5O35iO5pfaJHDaAmcLl9tKVsrWVCjPXRR7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e4U1U93KM+55RbiDv8zWZJLRtGmQAp5WsrTWphivvBzu1QvsgXFsZDVMwX/NPY6hH0Vly0GsFZ0FxsdW591dOVo9I9cN7S5EGw0HWSr69yWnYv7fXGEMz+g9CrbiTErpA0ZScpH/FK3SvZwCFmtiv5bh4ZfvGYHsiH8yCMOlklI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ob4N7d3L; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752047340; x=1783583340;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WRMhHclH5O35iO5pfaJHDaAmcLl9tKVsrWVCjPXRR7Y=;
  b=Ob4N7d3LGHGTYNAYE4gZ5fWGPVL0HhUxqe/skCiyInaI3JMxTfXueQuf
   y3Pjc56ya+1HmSuY+YEknBxA1tqcm7hvh11h/zfIkLETaiUZVn5xuHjhX
   9d9a26uWzngdlpBizxIYDndSL5O9p8t6HE4EhG4K3rlVIBzhItWvMzHtP
   Qz+tD50GOD2jg6NNvjgHqbmC4WCF9do/U/RaLDG+2hzgDPGNtsIhxVVIT
   TwZspmHULtvkaqX9bm6UTftWOyCudSNTLSXnwQaSlZeDiJCYoUcoK0ph0
   uZS8KMKgMxrm1+erruTFB9BzDLFWQ1hl21P8cnjhDpJnFxSynuI2V2LPh
   A==;
X-CSE-ConnectionGUID: Y63CYHKbQDuCGrZA953Ddg==
X-CSE-MsgGUID: ZdnapOpwTBW3i1gBeUT+Gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="79737369"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="79737369"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 00:48:58 -0700
X-CSE-ConnectionGUID: UOlIfrPeS1KiwFrzZpz5rA==
X-CSE-MsgGUID: 1ZzObxGHSGSUaSFqlEGliQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="161353265"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.157])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 00:48:56 -0700
Date: Wed, 9 Jul 2025 09:48:46 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	"laurent.pinchart" <laurent.pinchart@ideasonboard.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans de Goede <hdegoede@redhat.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: Kconfig: Select COMMON_CLK for ACPI-based
 systems
Message-ID: <72ujdqoreqdvzkuenq7y67yvr67ncjisr5nqvlgxqkihmjfqcq@fxedxajs2zwu>
References: <20250708161637.227111-1-mehdi.djait@linux.intel.com>
 <04c7c949-d0ac-43c0-91cb-7445cb44a036@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <04c7c949-d0ac-43c0-91cb-7445cb44a036@app.fastmail.com>

Hello Arnd,

Thank you for the review.

On Tue, Jul 08, 2025 at 06:28:12PM +0200, Arnd Bergmann wrote:
> On Tue, Jul 8, 2025, at 18:16, Mehdi Djait wrote:
> > ACPI-based systems are required to create and register a fixed rate clock
> > using the new v4l2 helper devm_v4l2_sensor_clk_get() that uses the
> > common clk framework.
> >
> > Ensure that COMMON_CLK is selected.
> >
> > Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
> 
> You should never 'select' another subsystem or a drvier from
> an unrelated subsystem.
> 
> What you want here instead is 'depends on COMMON_CLK'.

Ack.

I will change this in the v2.

--
Kind Regards
Mehdi Djait

