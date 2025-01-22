Return-Path: <linux-media+bounces-25113-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEF5A18E39
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 10:23:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 63EC716769F
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 09:23:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28E4D20FAAB;
	Wed, 22 Jan 2025 09:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ltpW3osk"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E05D20F099
	for <linux-media@vger.kernel.org>; Wed, 22 Jan 2025 09:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737537821; cv=none; b=bay1Ng7nktiJ9+NqLP8SGixdZdxOstUUIsosbnppu7bt1Fh5ElVA4tzYZ+2k1TQ9n2Wzotwuhx4i+qAw84YL/qPpody0d6sFKs2VmxkxhZq2eBYqyQPcs5Zm4L73HktTIahxI+5B9GZCtpX0nfo6dmwp5b2cYPyVP+xE/bAyXTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737537821; c=relaxed/simple;
	bh=ol87ROgrc9rRQykgczEPa+2QzmKDruunWW4GwfVrwUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BjAtq5MTATKG8b2kMeFqnlpVL5JhX1E605JqkK2Nbi7t7GCSDaTMZxuZGTIEPkgUYFaNQQgsGGfqKrVA0oHZyAgKGg3xyO1MZV9czSrvr2NdGjhunAPV4jwJWU+p0EFAderqxb8g8vYlsPi47k3C2NarwCDItu8eM/zQMgPUw6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ltpW3osk; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737537820; x=1769073820;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ol87ROgrc9rRQykgczEPa+2QzmKDruunWW4GwfVrwUE=;
  b=ltpW3osk4XwLx6kk/UIvwDD0Fg0aWIXovJvEQQ2oCZuyMveGrNx+LUuR
   axPD++g8Q6ZRLRpY/OoJo5b3q4bdFXXooANxAY8Hj9MP3PdDyA+W9IzvL
   NxjPDBQHhfTIUdbWQytDLFT5qW93DIkzFe/F05CW7ZGRjs6V180ou4Yl/
   3tCr9DbgtHVg+AmFRNco0uzPX/QmmjvKOxeSY97USxPbuAVi38gU0Rcoy
   c22LEbFQq5+3sdlIpxh6y5kfh//Ef2z2Qjf9d0+7YKrPiAKlS1eFq69Br
   m8OMMz6XjQ0mYydDNtvW86j6KtnCghB/cBLE+T9AWmxGqmZPW+ENxtxXP
   w==;
X-CSE-ConnectionGUID: PqacgHVZQFOjrVrPKPUz0w==
X-CSE-MsgGUID: 0/zXQCMDSqucv5371cPW6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="38137683"
X-IronPort-AV: E=Sophos;i="6.13,224,1732608000"; 
   d="scan'208";a="38137683"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 01:23:39 -0800
X-CSE-ConnectionGUID: 2Jk74iMoR4m+teiK0RR8uw==
X-CSE-MsgGUID: rB49HwOlSMC9HP9WBqQw/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,224,1732608000"; 
   d="scan'208";a="107008481"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 01:23:37 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 525B811F944;
	Wed, 22 Jan 2025 11:23:35 +0200 (EET)
Date: Wed, 22 Jan 2025 09:23:35 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Cc: Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, hao.yao@intel.com,
	mchehab@kernel.org, linux-media@vger.kernel.org,
	hdegoede@redhat.com, joachim.reichel@posteo.de,
	Ingvar Hagelund <ingvar@redpill-linpro.com>
Subject: Re: [PATCH v7] media: i2c: Add Omnivision OV02C10 sensor driver
Message-ID: <Z5C5F3F3cu2rMHhZ@kekkonen.localdomain>
References: <20250116232207.217402-1-heimir.sverrisson@gmail.com>
 <Z5CtMaPUlNs8xhBa@kekkonen.localdomain>
 <Z5C3y5e7wCo9Gujt@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5C3y5e7wCo9Gujt@linux.intel.com>

Hi Stanislaw,

On Wed, Jan 22, 2025 at 10:18:03AM +0100, Stanislaw Gruszka wrote:
> Hi
> 
> On Wed, Jan 22, 2025 at 08:32:49AM +0000, Sakari Ailus wrote:
> > > +	/* Check HW config */
> > > +	ret = ov02c10_check_hwcfg(&client->dev, ov02c10);
> > > +	if (ret) {
> > > +		dev_err(&client->dev, "failed to check hwcfg: %d", ret);
> > > +		return ret;
> > > +	}
> > > +
> > > +	v4l2_i2c_subdev_init(&ov02c10->sd, client, &ov02c10_subdev_ops);
> > > +	ov02c10_get_pm_resources(&client->dev);
> > 
> > Error handling is missing.
> 
> It is fine since we can work without pm/gpio's on setups where iVSC
> control powering of the sensor. Maybe comment about that could be added.

Right, but still on -EPROBE_DEFER you'll need to return that error.

Plain regulator_get() gives a dummy regulator if one isn't found so that
would appear to be a better fit for the driver.

-- 
Kind regards,

Sakari Ailus

