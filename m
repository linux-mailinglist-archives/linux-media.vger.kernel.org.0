Return-Path: <linux-media+bounces-38169-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CAFEB0C3A0
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 13:49:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C350F3AAB70
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 11:49:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42D562D3754;
	Mon, 21 Jul 2025 11:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AEsuE/+y"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411582BE034;
	Mon, 21 Jul 2025 11:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753098546; cv=none; b=OmSP9S2d70EIXbZtHjr8eTo+WNR6Rru5YZq+A6Sy4XjeLjr9IRSz+2qW3hphA3mTJHiW+V/eGISJKH99VaAENGOMd2L18XacHZy2KOyHtk51dCw/0MyCPle1pKpJlVjN4RUwfDzQewhmbdr8HzusS/7nznRIWYdXAi2qF8uCjpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753098546; c=relaxed/simple;
	bh=1USdMMY/Dt/apuRlYWAJH3O/Cgl8c0BbbIsXoxHC+dI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oRwcWuJPCYRodBQeIgyQ7xFixC+RC5hgohvLYC++z+DUfAMrvf0cUf5eHt/wtf9P/gcsBtZ14QAssnFXCt9J/+E0pEmjXp/YI+Y3DK5foYPQHyjRb5/u/osdUkBcUNVmhnTWRfp3K+j9K99SSK1xdrV5PdBg7JHJzPl691oxxlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AEsuE/+y; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753098545; x=1784634545;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1USdMMY/Dt/apuRlYWAJH3O/Cgl8c0BbbIsXoxHC+dI=;
  b=AEsuE/+yu7Xq15WP23VKbeATL4pd1brdrK7gVifI1L/1tP5tRHoy58Ky
   gfK0wrAZ0Dk1yJBZSAvWwdmp/GcKFsusradgZvpLI0ZQLiKCp1ukQcRu2
   +2klVVBhOA/l4udaubgJs4CLw+DVC5XA+iTBt8bxDkW9Co0kN5IchdM3l
   smOYVPyWy8fQr0vARXh/ajJP92FWm+fNhDlwpA3aTPdEOIHHbysN2gcnT
   x+7vMqTum9Wfc0k/waSPKUo/jIXiQcb+cMkm/v+PXOFjVIWPK0w2W1BwF
   5EijLadxvINteR83MUXnCciUuMaLYftzVwzzdhoJ0fT30FUTMRGVueg3+
   Q==;
X-CSE-ConnectionGUID: J9DizsDUT86o5KfT/tmLLQ==
X-CSE-MsgGUID: sCwVmAMkRLyAXTBYzD/K6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11498"; a="66658697"
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; 
   d="scan'208";a="66658697"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 04:49:05 -0700
X-CSE-ConnectionGUID: dKMeJe5pRzKtObbPfE5X+w==
X-CSE-MsgGUID: 5Wx/00ziQcy5MG7/QHr0Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; 
   d="scan'208";a="189771909"
Received: from johunt-mobl9.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.75])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 04:48:35 -0700
Received: from svinhufvud (localhost [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTPS id 53E0E41826;
	Mon, 21 Jul 2025 14:48:32 +0300 (EEST)
Date: Mon, 21 Jul 2025 14:48:30 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] media: i2c: Add OmniVision OV6211 image sensor driver
Message-ID: <aH4pDtoBuQYZgyZS@svinhufvud>
References: <20250717124001.108486-1-vladimir.zapolskiy@linaro.org>
 <20250717124001.108486-3-vladimir.zapolskiy@linaro.org>
 <175276139540.560048.14744394485094549778@ping.linuxembedded.co.uk>
 <CAPY8ntCiKFFdfepqW0ms_0dhCtJJCwJoT=bxmJ5i0K254i6fkA@mail.gmail.com>
 <7bb16a20-166a-477d-a103-a00fe83ecb66@linaro.org>
 <6w5vwjdhs2mbidaadzkkwx32rr6fkfqgrjlvbu7kvcre34rmn2@qifmnxaertxo>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6w5vwjdhs2mbidaadzkkwx32rr6fkfqgrjlvbu7kvcre34rmn2@qifmnxaertxo>

Hi Mehdi, Vladimir,

On Mon, Jul 21, 2025 at 12:38:28PM +0200, Mehdi Djait wrote:
> It has already been reviewed but yes still not in the media tree.
> Too late for 6.17 but it will be in the media tree soon.

I'll send a PR including that once we have next rc1 in the media tree.

> 
> > 2. the only needed change to get support of the new helper is to replace
> > the single line of devm_clk_get_optional() with devm_v4l2_sensor_clk_get(),
> > no more than that,
> > 
> 
> Correct.
> 
> > 3. the internal complexity of devm_v4l2_sensor_clk_get() seems excessive
> > right over here, what's worse I can not test devm_v4l2_sensor_clk_get()
> > in this driver on any ACPI platform...
> > 
> 
> You don't need to test it on a ACPI-based platform to use the helper, if
> it works for your DT-based platform that's enough.

Agreed.

-- 
Kind regards,

Sakari Ailus

