Return-Path: <linux-media+bounces-21835-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C40F49D5E09
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 12:29:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89EC2284C56
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 11:29:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80B431DDC2B;
	Fri, 22 Nov 2024 11:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eLbqg8Mg"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E62C158848
	for <linux-media@vger.kernel.org>; Fri, 22 Nov 2024 11:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732274976; cv=none; b=WLoiVnP+SY6d4Nz81jSHt1Geuf3hSbFKF48nEkFrTJJa0Y3yvjPqVVEBA+hX/TienjZJEGl7t8FjVcmSSsE9aOsKgOVq+VrlZPIWoHqTVMubyI1VByBv/uXh8EHFpL6KawsQHiG0lFUknqDvr9Auz5I5HkPkP+lEYcJBoiUfC5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732274976; c=relaxed/simple;
	bh=yJbyZeBxT+NNVL+ySJVu0mPpjwhzHor+Y7o+eK81oy8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WSFxyGCUIHEjKXEPvXI8d1LdQ9VJLxbZb/yi9ACAuouxNkytMlYkQmyGh7bybZwDpTWNku3FqnIoIR363luP0X4YzMaezZnGLNPsJI32F3DqbCeeNThzUkfqLzupjWXv1qh4OIZWEObbXxQmmNfSKCcxfhi41IbGyxvo7skiGkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eLbqg8Mg; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732274975; x=1763810975;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yJbyZeBxT+NNVL+ySJVu0mPpjwhzHor+Y7o+eK81oy8=;
  b=eLbqg8MgG5Aq6gBKnHRvwoiOPfa1l+4MF/2nC7OHsUXDmfR+GmQv225x
   rvRa/0DN3V6dMA2j1lBrtGpYk8vF7/m7ne+3RO+IjKDP8DWZS2e3Zm0du
   JmU5Q7NB8KOnR7gb+BVNAk/R/Ydb+sT23F7XjelAeEwpCNZUf+m+F6i6o
   9JCqeJoyp1QFUS2G72Xk3vNVj1M1NbSSSkbsZpBgRNoskhv60/Aljk55S
   xD91wiHXGcs59cJZUpmbd663U6v0Ip39nvprbywtxPonsgAbbNtHTu2gO
   XPEJOfJX3+EHIsBldNs+CZ7bCj7OgwZbXm7zUTMY9y8x955sXshUIQgE9
   g==;
X-CSE-ConnectionGUID: bF61H/byQ2W1fySA2y+nrw==
X-CSE-MsgGUID: /lyIRafFSjWZXe1ZHBWw2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="20016600"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="20016600"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 03:29:35 -0800
X-CSE-ConnectionGUID: M016M+9aTdeHJf+mZJXEOw==
X-CSE-MsgGUID: pieikteWS0SppBJqvjjaBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="90355251"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 03:29:27 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id DAFB71203D6;
	Fri, 22 Nov 2024 13:29:24 +0200 (EET)
Date: Fri, 22 Nov 2024 11:29:24 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>
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
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Subject: Re: [PATCH 4/8] media: Documentation: Add subdev configuration
 models, raw sensor model
Message-ID: <Z0BrFF4bF8GT0x0l@kekkonen.localdomain>
References: <20241122100633.8971-1-sakari.ailus@linux.intel.com>
 <20241122100633.8971-5-sakari.ailus@linux.intel.com>
 <zkutcofvbohwe46ua2jtpawo7avy65ze2n5u7si2lekes553oo@3xq2grunptcy>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <zkutcofvbohwe46ua2jtpawo7avy65ze2n5u7si2lekes553oo@3xq2grunptcy>

Hi Mehdi,

On Fri, Nov 22, 2024 at 12:05:18PM +0100, Mehdi Djait wrote:
> Hi Sakari,
> 
> 3 small details

Thanks, I'll address these in the next version.

This was meant to be RFC v2 btw., it's still a bit too early for merging I
think.

-- 
Sakari Ailus

