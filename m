Return-Path: <linux-media+bounces-35791-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E62BAE67BA
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 16:04:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 385BE163BC5
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 14:02:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF7902D1F40;
	Tue, 24 Jun 2025 14:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="koJCslDJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB62C2C15A3;
	Tue, 24 Jun 2025 14:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750773755; cv=none; b=XH84cxtvzW9HiBYmiJhMwrRReqnq2wlEwgU0F49GbeBHwJDIhJA5Wn0850wJRB6k9JxlrxLp3M1KIBsb/7ynf5FTLBPHiljbLa+LaWik2uJcf164iAc4Xy3vXmaXxvxkJy79x2iN4OjyMcQFLsbtfqpWuz74ampbA430baV4xlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750773755; c=relaxed/simple;
	bh=0jXyK2KxOnQeocRhBtX6DHW3qKYWO5X4okDglyyLHB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y/1ROr4d8zjKFxHjWxMX3jORCZzCr8blt3E8urAa5qCUtMAflauCtOEG1MVaytj4SWiAdbD0kYh27kZOobNIvnxlDSV2dnqia/O1+/5mAgaVKshsRwCtmsywdVR3GnC7hGTS2yagDToPCQwKJnmT4M7dW88gC2G/pwKn1XEvayk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=koJCslDJ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750773754; x=1782309754;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0jXyK2KxOnQeocRhBtX6DHW3qKYWO5X4okDglyyLHB8=;
  b=koJCslDJmlcRAPjki/8ose1liFShYwQgpK3Zv4fLOX1+g9xSnIL3m+Ha
   nQ10Tsh5YlIQhfcJ2kHTqLQhKV6geKyskR2YsdWf8i3jHVssjgX+yUTsm
   Q+efKHCHW8Ph1XDobIUj3t5HLtKFEV+9oYHwsshHVEbq6tQLJqK7s2pJH
   T3AzBol9ajdJSzBjZYAZpYO+r4ZhMN8wwJGDspmk/dTMJeFfDoH9veXo9
   giDZdZUU3MqJ+eHvSV33ONPI8jFSPPnleDYtRT+Lv11gTP0y+cS59BG0s
   f5dKeHdnaGnE1X2uV0rsvN5+VVKmhVfcqtu/XXdGNYLtdhnlvxkn+HsrS
   Q==;
X-CSE-ConnectionGUID: TBc57wgZQlCyUxid/jOwEQ==
X-CSE-MsgGUID: ceUnbQFNQf6i9qFXBqDKbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="52244676"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="52244676"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 07:02:33 -0700
X-CSE-ConnectionGUID: k3OOOs0DRSSQe+FZydan+w==
X-CSE-MsgGUID: pRhfOAVNSIq/gw/SKclo3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="157698101"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 07:02:32 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uU4EG-00000009UGl-0Yqs;
	Tue, 24 Jun 2025 17:02:28 +0300
Date: Tue, 24 Jun 2025 17:02:27 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [rft, PATCH v2 0/3] media: atomisp: replace math macros
Message-ID: <aFqv8-sSqA7yxnMo@smile.fi.intel.com>
References: <20250519155028.526453-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250519155028.526453-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, May 19, 2025 at 06:46:46PM +0300, Andy Shevchenko wrote:
> Kill unused definitions that may use custom macros from math_support.h
> and reduce usage of the latter and even kill some of them at the end
> of the series.
> 
> Please, apply only after tests that confirm everything is working
> as expected.

Hans, have you had any chance to test this?

-- 
With Best Regards,
Andy Shevchenko



