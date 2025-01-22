Return-Path: <linux-media+bounces-25111-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C82F2A18E2B
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 10:18:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A59AD1888C64
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 09:18:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFD052046A2;
	Wed, 22 Jan 2025 09:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MLObjwh8"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B253F186A
	for <linux-media@vger.kernel.org>; Wed, 22 Jan 2025 09:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737537490; cv=none; b=o018vOxlfrlXxJKpkp+HZ1lYuhJ6T/kfOh3c3E0tmw0G4iv5dK/9UCIAMvTVCCJW+mBgekk0qWtgp59bB8GO7vZp4/tpMoDuc38G8N1xEY2K1YmrYesX4LhMlbZzIiSH8uMi0Je+Wz9X9TPTTs5G9XjLSgGnSuVyGAvZG9gOAIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737537490; c=relaxed/simple;
	bh=tk7qV2kW0eJ2D14zOEwXYGd+Ql6keBlwq+jpT1qkNf4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=axyffb6y7sLazHDh1ZZR2ZyFUnbE5J1f7sb+5xHyfztwi3bLlXopDqOJHuFOF4Gm8J/uAZvTrGS+HKFL1nlIQ819I/6cHBs7+D0Hzi4eK9SwRInpw1jOlQU3dmqWR24ArWEsgAyVKwg+fl7zNLI8NsyCkYK/mfz7Bp8HCAjK1uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MLObjwh8; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737537489; x=1769073489;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tk7qV2kW0eJ2D14zOEwXYGd+Ql6keBlwq+jpT1qkNf4=;
  b=MLObjwh8fFsMACqDR7lxHrhOD836PvS+vrO4WU+8qvDPB3/yMLDWVsRl
   ju8KPj/Jt5gWYKX4BCgDdQptzvZ6m5hbAzFKW7Jkll6nHeqL6p3J5WIwU
   iukMR4B//vJGYtNV7cJTTsAWifqtAXhzDR+JqzWbP/GbCAN5Ya3eZQmo7
   eR8g6jO9IIuRIk2ouICvth0d8nXbPx6iRyStS3HLi1lmKKjtzda40OTYH
   VzO2netLC1xsBeEc9/sA1WowhBXvXaaqDwRxSlrkW6wSU4jXial1/BOAS
   fCjUI2mwKBFZQC6S7i368d+m4A3pVv2vXASdvLYzju7hOSULu82dIh883
   A==;
X-CSE-ConnectionGUID: JM8ntG7OTE6TAcpfPcNCLw==
X-CSE-MsgGUID: jFMPsC5fSn+DHbaJgWQLyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="55398334"
X-IronPort-AV: E=Sophos;i="6.13,224,1732608000"; 
   d="scan'208";a="55398334"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 01:18:08 -0800
X-CSE-ConnectionGUID: yC1nPX/zTDeFLTGIdSbqLA==
X-CSE-MsgGUID: Wh1VXF23S0y8RM7hanOotA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111705857"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.246.8.237])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 01:18:05 -0800
Date: Wed, 22 Jan 2025 10:18:03 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, hao.yao@intel.com,
	mchehab@kernel.org, linux-media@vger.kernel.org,
	hdegoede@redhat.com, joachim.reichel@posteo.de,
	Ingvar Hagelund <ingvar@redpill-linpro.com>
Subject: Re: [PATCH v7] media: i2c: Add Omnivision OV02C10 sensor driver
Message-ID: <Z5C3y5e7wCo9Gujt@linux.intel.com>
References: <20250116232207.217402-1-heimir.sverrisson@gmail.com>
 <Z5CtMaPUlNs8xhBa@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5CtMaPUlNs8xhBa@kekkonen.localdomain>

Hi

On Wed, Jan 22, 2025 at 08:32:49AM +0000, Sakari Ailus wrote:
> > +	/* Check HW config */
> > +	ret = ov02c10_check_hwcfg(&client->dev, ov02c10);
> > +	if (ret) {
> > +		dev_err(&client->dev, "failed to check hwcfg: %d", ret);
> > +		return ret;
> > +	}
> > +
> > +	v4l2_i2c_subdev_init(&ov02c10->sd, client, &ov02c10_subdev_ops);
> > +	ov02c10_get_pm_resources(&client->dev);
> 
> Error handling is missing.

It is fine since we can work without pm/gpio's on setups where iVSC
control powering of the sensor. Maybe comment about that could be added.

Regards
Stanislaw

