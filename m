Return-Path: <linux-media+bounces-9404-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 402B28A559F
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 16:53:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 71FEE1C20C8D
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 14:53:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27EEC71B4F;
	Mon, 15 Apr 2024 14:53:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3DF94C618
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 14:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713192813; cv=none; b=rnJqL6cm8fssqmDMb5jfdB2ClkjuI38yDfzYx0QFSqE3eh/UsGPIcSP/W9zh+l2Eetf8tI/okRglfIEVH9wN5qq04tuolNcvAebjtRz/zIpwdMbVSPb8sznVwndWtuaT+uKnYhFZG0GqJYuTD9+43n7YoUUKXT3Ddk8FUAIkW2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713192813; c=relaxed/simple;
	bh=cnpBn7mo+Uj/dwSeexcbPN0wiCaVtBWcgLH0M7WB2b8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W6lkw/4gfnJiGQvNwFUM/BrzjFt+nXMDIT/JCxFf9L2X6Xo2aY/+STQPw0x+UgaXOXb6ywuK8W8fpq4etpIbrDvxLa30Fea1l2WmcNGW0R0KYsAKd7/IX0Cr22HurZVdZwdn6rmqnZgtxKnkVi4vBTHkytFqQwBkaOfJd9qCn6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: cR0J5y/7SoOWZD3HRed8Ng==
X-CSE-MsgGUID: d9walC4pSZCbqPxgDl6HlA==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8694688"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="8694688"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 07:53:32 -0700
X-CSE-ConnectionGUID: 4CI1hVX5TtaFpkZm1fdI3Q==
X-CSE-MsgGUID: 8oG5k8lEQLKsMsgtSnJCCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="22522064"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 07:53:30 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1rwNi2-00000004RDX-1Pmy;
	Mon, 15 Apr 2024 17:53:26 +0300
Date: Mon, 15 Apr 2024 17:53:26 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>,
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 14/23] media: atomisp: Drop custom flash support
Message-ID: <Zh0_Zt_65yp8Dp9g@smile.fi.intel.com>
References: <20240415120220.219480-1-hdegoede@redhat.com>
 <20240415120220.219480-15-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240415120220.219480-15-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Apr 15, 2024 at 02:02:11PM +0200, Hans de Goede wrote:
> Remove the custom flash handling from the atomisp driver. There are only
> very few Bay Trail / Cherry Trail devices with flash and if those will

"only very few" sounds to me as an oxymoron. "only few" or "very few" —
I believe you meant the former.

> ever get supported then this should be done through the new standard
> include/linux/led-class-flash.h APIs instead of with atomisp specific
> custom APIs.


-- 
With Best Regards,
Andy Shevchenko



