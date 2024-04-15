Return-Path: <linux-media+bounces-9406-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED96E8A55C8
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 16:59:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8DB021F22FA5
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 14:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 673B1757E4;
	Mon, 15 Apr 2024 14:59:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FF874E37
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 14:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713193150; cv=none; b=AKt2PxixeCDiE67TXHqy/IH9yCVdXVBsuTsE7fruLHttB23nFKWRZnqh1YZ+hhQxE7Hq7NWNbqc8y6bqS1ek/nDkLNDPMg6fs2559Rp/kegXE2WIsTGb2h95XaoCXvL0nIfaFJEXffDVAi/0Ec8JxlOfGHHlgKsK4l7UK6hVUuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713193150; c=relaxed/simple;
	bh=9BEfL0/R2EKlaqpP1DN0nA6JucN40DYPWmMjubPPF/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gj5lxYJgzo0AMvUHzWjlotiDsU2YSRQliFHAnuhZ5cwKHcIyin9lbf1g4P3lX3Zcu6OejCp2IzulYxRhNHJe4Vp4+gj1muNc764eJscXTRFGIMUSzYlPAGE7aJGAnNwTbWElgjaH1BJI2lXBCtbkmBOdzw/ReU6r0Tn1DVfrjjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: mslUPdhcSTSl26eBtqV3wg==
X-CSE-MsgGUID: mWb14wRIQDqlTxl0iWKdWg==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="26045006"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="26045006"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 07:58:53 -0700
X-CSE-ConnectionGUID: lTm7UWagS7+q1masA5MenA==
X-CSE-MsgGUID: 8PneIB4JRzSwfOCRpssCKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="22035635"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 07:58:50 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1rwNnD-00000004RHa-3GtP;
	Mon, 15 Apr 2024 17:58:47 +0300
Date: Mon, 15 Apr 2024 17:58:47 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>,
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 00/23] media: atomisp: Further media-controller related
 fixes + dead code removal
Message-ID: <Zh1Ap3Zqp2Lj9xww@smile.fi.intel.com>
References: <20240415120220.219480-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240415120220.219480-1-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Apr 15, 2024 at 02:01:57PM +0200, Hans de Goede wrote:
> Hi all,
> 
> This patch-set contains a couple of atomisp driver fixes for issues which
> I found while working on a libcamera pipeline handler for the atomisp
> (and thus controlling the atomisp driver in a more media-controller centric
> fashion).
> 
> Patches 1-8 are more or less prep work for fixing an ABBA deadlock in
> atomisp_link_setup() in patch 9.
> 
> Diving into the code for this made my hands itch to remove of bunch of
> atomisp custom internal APIs for things like flash support, so the rest
> of the series is just removing a whole bunch of dead / unwanted code.
> 
> This series is also available here:
> https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp
> 
> I'll do a forced push there addressing any review-comments + adding
> tags before adding a signed-tag for a pull-request to Mauro for this.

Thank you for doing this nice cleanup!

For non-commented,
Reviewed-by: Andy Shevchenko <andy@kernel.org>
otherwise feel free to add it, if you agree on the suggested improvements.

-- 
With Best Regards,
Andy Shevchenko



