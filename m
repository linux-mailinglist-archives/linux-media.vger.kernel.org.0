Return-Path: <linux-media+bounces-29217-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A89A78C8B
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 12:42:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4FDA17A5D5D
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 10:41:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE03A237165;
	Wed,  2 Apr 2025 10:42:42 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3AB236429;
	Wed,  2 Apr 2025 10:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743590562; cv=none; b=mTywLGATAQbexVOnE6ibQJQehjMFc29F09SiMSIdIVij6XsIIbtN2CR5wKumEomtlgaHGVmUts28II56+eFa492jcC+Jr7Wjruhkl8/UsT1JYouAGj2qnPcHEEjDB1hcKspjBw4l1v0/DSZpLGUkldyzUmjZvN5ksvCgESVmBGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743590562; c=relaxed/simple;
	bh=LjaWeROx0i4qgPrOG4F+1/nZAMJVS7oiPyYMR0jzip0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ouKw/6/g81SPql/L4MEY8F5C0O7gMyAI565VHnStLLPn8xbo+6+BKTUYsbsnLstZuhfBV6ufMZCVcmSvFIFyV7m25BeB3boweahUEUplBnMZLgSgcdfnfJ/K8P6u3rQk6QTXpJAyv6JefJqo5x8+fSboSDaqp2eM6ukvwuSw+4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: vH6Rz7xcTJmAmsYZbavzVA==
X-CSE-MsgGUID: ceGk+kIiSjyLJ12zL8yM3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="55140850"
X-IronPort-AV: E=Sophos;i="6.14,182,1736841600"; 
   d="scan'208";a="55140850"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 03:42:40 -0700
X-CSE-ConnectionGUID: DiH8qsdIT8y1PYnUBsiTFQ==
X-CSE-MsgGUID: Jp2djy6kTd+o8z4n6o33aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,182,1736841600"; 
   d="scan'208";a="126617611"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 03:42:38 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andy@kernel.org>)
	id 1tzvYJ-00000008ROM-0iiQ;
	Wed, 02 Apr 2025 13:42:35 +0300
Date: Wed, 2 Apr 2025 13:42:34 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 1/2] media: atomisp: Fix Wformat-truncation warning
Message-ID: <Z-0UmpbjvrKASXIu@smile.fi.intel.com>
References: <20250401-v614-v2-0-53024c4fcdc7@chromium.org>
 <20250401-v614-v2-1-53024c4fcdc7@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401-v614-v2-1-53024c4fcdc7@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Apr 01, 2025 at 02:17:54PM +0000, Ricardo Ribalda wrote:
> Gcc8 is convinced that we do not have enough space in dot_id_input_bin.
> Extend the variable 17 bytes which is just used for debugging.
> 
> drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c:1336:9: warning: '(pipe' directive output may be truncated writing 5 bytes into a region of size between 1 and 74 [-Wformat-truncation=]

Note, you may drop the drivers/staging/media/ as the driver is unique enough.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

...

You also want to send this patch separately since the AtomISP has its own
MAINTAINERS record (and there are patches in the queue there, IIRC).

-- 
With Best Regards,
Andy Shevchenko



