Return-Path: <linux-media+bounces-18312-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B6297A170
	for <lists+linux-media@lfdr.de>; Mon, 16 Sep 2024 14:07:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9081D1C23316
	for <lists+linux-media@lfdr.de>; Mon, 16 Sep 2024 12:07:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1493E15852F;
	Mon, 16 Sep 2024 12:06:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67264156880
	for <linux-media@vger.kernel.org>; Mon, 16 Sep 2024 12:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726488409; cv=none; b=pEWTJHmkoG8/WW+3SxtRrUPd3QRzCrzicalf2NiFQ3qqp0+xrPzgmsygxFGBjZ9hTMv6YCL/lP3dqWqpiknUjhwknilgHGj6Fu9FFfIXqHwhthk5JVLjyk4T/E16GwVVsOamjXhqqqT0sNTm/Leb36Be9DToqmoed256zU9qn0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726488409; c=relaxed/simple;
	bh=7POhNxCQ4XdoW0vQ66XxqZtSnrvKLQemwkkMGpdm+1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FXRMs6YCcdug9s76P7LAQche5TS/hUdKgvMymJy91QOZ/ZQyleIo+Q2xitu5UbHsAFFXacXoMpvmF3vZjnUx1HORSQkKAFK17bw0epS50CsrlYkLpBu9D8fh0hBZSfkYGxwfublZlR6XyGZ2uxStP4iOrVXVjnibePz+cpo+osY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: UOkfQsfnT3SazRkajCbxew==
X-CSE-MsgGUID: 0wzbBr2dReWAJjdJ/7y3bg==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="25404630"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="25404630"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 05:06:48 -0700
X-CSE-ConnectionGUID: YT3+vxX/SOON5doqgSWRug==
X-CSE-MsgGUID: IGRf0UJUTamZxyPynjDb1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="68797785"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 05:06:46 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1sqAV9-00000009RxS-2AU4;
	Mon, 16 Sep 2024 15:06:43 +0300
Date: Mon, 16 Sep 2024 15:06:43 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: Re: [PATCH] media: atomisp: Remove unused libmsrlisthelper
Message-ID: <ZugfU9wa2vF0zJT-@smile.fi.intel.com>
References: <20240916091512.81859-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240916091512.81859-1-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Sep 16, 2024 at 11:15:11AM +0200, Hans de Goede wrote:
> Since commit 3a81c7660f80 ("media: staging: atomisp: Remove IMX sensor
> support") the libmsrlisthelper code is no longer used, remove it.

Unconditionally like such a patch!
Reviewed-by: Andy Shevchenko <andy@kernel.org>

-- 
With Best Regards,
Andy Shevchenko



