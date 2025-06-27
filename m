Return-Path: <linux-media+bounces-36072-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0022DAEB176
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 10:40:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50029567B7B
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 08:39:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE775246781;
	Fri, 27 Jun 2025 08:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mkm8oHDd"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB71423BCF3;
	Fri, 27 Jun 2025 08:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751013613; cv=none; b=h4r8I92zA7yTUXE3qQTJ/28f52BGMbFJbFcZHN0EIF6u3sQgzlQ/+0rqMyTogvMlbW+7I+aP81oXuP3un5FuS7JXRcarMCRo84/PcJLfBNG8xMsbiGfFwSKn18TFbCs1oDgaF2AzJLjExkLGDvrErfTqa84qKQEul9tSM16nv6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751013613; c=relaxed/simple;
	bh=ZXQv8A7rE1QeYVvPDBbpi00YbXrCjpG5YanCEs6oU/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kut6FRDKU7IJndhQ5Nl4mmxWOJQwCo+2PdjH4NVLd7uFhrvyfqeRU/vJi+4eKSmCFx70yFh5jm3IQ9cg7wOOkFf6Le8gkEBI1FY4DVVBONcLIThhME2dBzWZfXXeJTWKu9eyuRIqQqtk9uc3zAaJxWlCR9LVEBYk7NSE+jQif/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mkm8oHDd; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751013612; x=1782549612;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZXQv8A7rE1QeYVvPDBbpi00YbXrCjpG5YanCEs6oU/8=;
  b=Mkm8oHDdkkxCIu0XUVQ9JEGshJjUlYtxy1sw8KcC/8baj4TlcSt80KHs
   RDPatHb2fn5H3yQWDQ+Yodr3Bxs2rxPE1GcALnLxopl+gaO9XEK5THmw4
   5Bc5fEZZb2bBGtpSiMJutIshgGpfJQJDYpEckMsgDKW49OAdUGSnX2Ynp
   77XrUi7NWsEC/8PjeamDz4ow5NanP/07pl3klz0rV8/8DJCAMM8Ik6p73
   t6L3wGZeCoGDKeNlTx7N1gt7Z1Ve0wCYE51L6PwGRA3ukXbUZl8sJIWPb
   Q0qBMwGqUt6xhlbNcEh34J97xOEYIzZgOzZJ4RwPtmWjGrorC0kvPJiuW
   A==;
X-CSE-ConnectionGUID: XExKbENwS36/LXfNWxX2Xg==
X-CSE-MsgGUID: r+IeyydqQ1mLlC/ukr/B5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="57107019"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="57107019"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 01:40:11 -0700
X-CSE-ConnectionGUID: nREfy643TraafLx5LJBAQg==
X-CSE-MsgGUID: gmVUi71YTj6P31cJV3iiKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="153246976"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 01:40:08 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uV4cu-0000000AQas-3Itq;
	Fri, 27 Jun 2025 11:40:04 +0300
Date: Fri, 27 Jun 2025 11:40:04 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: andy@kernel.org, hdegoede@redhat.com, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	skhan@linuxfoundation.com, dan.carpenter@linaro.org,
	Hans de Goede <hansg@kernel.org>
Subject: Re: [PATCH v4] staging: media: atomisp: remove debug sysfs
 attributes active_bo and free_bo
Message-ID: <aF5Y5MurVIn1mUk1@smile.fi.intel.com>
References: <20250627072939.21447-1-abdelrahmanfekry375@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627072939.21447-1-abdelrahmanfekry375@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Jun 27, 2025 at 10:29:39AM +0300, Abdelrahman Fekry wrote:
> The sysfs attributes active_bo and free_bo expose internal buffer
> state used only for debugging purposes. These are not part of
> any standard kernel ABI, and need to be removed before this
> driver may be moved out of drivers/staging.
> 
> - Remove active_bo and free_bo attributes
> - Remove group registration calls form hmm_init() and hmm_cleanup()

...

>  	/* free dummy memory first */
>  	hmm_free(dummy_ptr);
>  	dummy_ptr = 0;
> -
>  	hmm_bo_device_exit(&bo_device);
>  	hmm_initialized = false;

Stray change.

-- 
With Best Regards,
Andy Shevchenko



