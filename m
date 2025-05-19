Return-Path: <linux-media+bounces-32760-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7321ABBC07
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 13:10:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D48AC189C4F0
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 11:10:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EC27274FED;
	Mon, 19 May 2025 11:09:47 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93301269AFD
	for <linux-media@vger.kernel.org>; Mon, 19 May 2025 11:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747652987; cv=none; b=V2/CAcZMHg3J8npeUpMSLZzgR0l0zfvZ5w8elGEg7lKeVkEui/uAS06mkumhP/Gf1e+TIp8CQsKWvi9CKsVbPVrLOw6v9M9Sa9986u+G19GmibNClhUmGXk7J4lIGFZs+rv83wXGbrB73QvT/QkhEVKq24b6CjVN6oohCj37V2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747652987; c=relaxed/simple;
	bh=0GTrluo9pSiVwiaHOxZqAPC8AXPUCY639K9l/g6tCzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sr9UCLGzbaEs592+2auURM+lt2YC/QhvIw4FnNGuDE/B4s3KEPC95WKRyPuyRfMnwPu07r6ToV2K2TTP+gELtHUWNvRH1fSMcq9oheROX5qU2mO/bZVFoGiuyysaihP4Bm5dtQilnFL2z2y9qvp2vMcmv59pE3hiq5w2TvqUsRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: iSrrJfpBS0my7IN5Bb4shQ==
X-CSE-MsgGUID: e8+13XoLTtqT6OuCEBUnzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="49529868"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="49529868"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 04:09:45 -0700
X-CSE-ConnectionGUID: SWnwxUDCQxWfJzsNJyH/YQ==
X-CSE-MsgGUID: j89EuJqPS/m+s8Dg8X/DLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="140229995"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 04:09:44 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andy@kernel.org>)
	id 1uGyNJ-000000030sI-0KHd;
	Mon, 19 May 2025 14:09:41 +0300
Date: Mon, 19 May 2025 14:09:40 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 04/23] media: atomisp: gc0310: Switch to CCI register
 access helpers
Message-ID: <aCsRdHCBcxqN4LnV@smile.fi.intel.com>
References: <20250517114106.43494-1-hdegoede@redhat.com>
 <20250517114106.43494-5-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517114106.43494-5-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sat, May 17, 2025 at 01:40:47PM +0200, Hans de Goede wrote:
> Switch the GC0310 driver over to the CCI register access helpers.
> 
> While at it also add a _REG prefix to all register address defines
> to make clear they are register addresses and group register value
> defines together with the address definition.

...

> -#define GC0310_RESET_RELATED			0xFE
> +#define GC0310_RESET_RELATED_REG		CCI_REG8(0xfe)

Old style: CAPITAL
New style: small

...

> +#define GC0310_AGC_ADJ_REG			CCI_REG8(0x48)


> +#define GC0310_V_CROP_START_REG			CCI_REG16(0x0B)
> +#define GC0310_H_OUTSIZE_REG			CCI_REG16(0x0F)
> +#define GC0310_V_OUTSIZE_REG			CCI_REG16(0x0D)

But can we be consistent with the style all over?

...

> -	dev_dbg(&client->dev, "sensor ID = 0x%x\n", ret);
> +	dev_dbg(&client->dev, "sensor ID = 0x%llx\n", val);

Perhaps %#llx?

-- 
With Best Regards,
Andy Shevchenko



