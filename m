Return-Path: <linux-media+bounces-30987-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 03639A9BFF0
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 09:42:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0158B1BA5796
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 07:42:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A06B22FDF1;
	Fri, 25 Apr 2025 07:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QsjjtIO/"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D67122F776
	for <linux-media@vger.kernel.org>; Fri, 25 Apr 2025 07:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745566905; cv=none; b=ep2/tajVCiATRbcNf3H+SVk8cXShwZTo1Q9cS5bA6jdnnnxn+VNRrGWp4rTOb1D45tvFz5YFM222Iit0ESkI7ZQGsS6k6y+NYQDcBqTRaQLHsgNKZxhRH9wqOm6Du8kyKQnOsuFR5Kepk/fQoK+dKTheSUI8oD5raV3SbXwQvjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745566905; c=relaxed/simple;
	bh=onAeqK9oVAseyR7CTDrQYN1Qygmv55HaS2IYyv/g+Sg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rpt3bqfWjVlTAJmXkpbNT06PfrQPpkrcS37qQcFjBEC6J7e7cJpLvpM/lkjFibVu+5DLeqMSmRQL6ScCUjUVV7RgKGeInGwbwlJ8A2c7g/p58MREQeQ9F9mhCPOq6ZhZUn3BITxq4t/9wWxBpfOviv5c4V0iT3p5Ojve3cyI2sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QsjjtIO/; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745566904; x=1777102904;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=onAeqK9oVAseyR7CTDrQYN1Qygmv55HaS2IYyv/g+Sg=;
  b=QsjjtIO/Nbjh4JQK+sjziUTAxTOMbUfGujhDcMuBHDiqaWeClLrbGR9J
   OBD5n3/z8Qp2ysvGGoBZtumhNG28jo027XTzz2vB2w1sBGw8MiM6CWnZE
   vnd/ogMFMssdVCxAvUfImTy3eQ5Zfbet8RTrMfaGafgyBbGvMXhhU8U6a
   ZMy/y8xunxfPm8WRSUkJM+0uOGhKDY9inICDnqcjXjc9LHvsK9jlY4NlN
   wCbz7QGZOptVCICY+zHtTOGwQjKeiwUrL4FzRcdugiD7L/Lvzua2hM+NV
   d7f/DSA0KCgeQUzrJBDKtXtdbtaKfiD7Abxb+RUlZx4IJ0TxwWsHmZH/7
   A==;
X-CSE-ConnectionGUID: LVBvNcppQgaTgz9Y2A+q7g==
X-CSE-MsgGUID: bJyqCBGhQlOK/9ngTNOM0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="46454411"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="46454411"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 00:41:43 -0700
X-CSE-ConnectionGUID: 00ycLq2gSoWvv4LTYW3aNw==
X-CSE-MsgGUID: BJ3Ct0tvS82l9nSyBpclIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="132722241"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 00:41:40 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 6EC3D11FA28;
	Fri, 25 Apr 2025 10:41:37 +0300 (EEST)
Date: Fri, 25 Apr 2025 07:41:37 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Hao Yao <hao.yao@intel.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Ingvar Hagelund <ingvar@redpill-linpro.com>
Subject: Re: [PATCH v11] media: i2c: Add Omnivision OV02C10 sensor driver
Message-ID: <aAs8seKtD4DUJ7Zi@kekkonen.localdomain>
References: <20250327164927.30741-1-hdegoede@redhat.com>
 <aAs689anIBXqRbyG@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAs689anIBXqRbyG@kekkonen.localdomain>

On Fri, Apr 25, 2025 at 07:34:11AM +0000, Sakari Ailus wrote:
> On Thu, Mar 27, 2025 at 05:49:27PM +0100, Hans de Goede wrote:
> > From: Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>
> > 
> > Add a new driver for the Omnivision OV02C10 camera sensor. This is based
> > on the out of tree driver by Hao Yao <hao.yao@intel.com> from:
> > https://github.com/intel/ipu6-drivers/blob/master/drivers/media/i2c/ov02c10.c
> > 
> > This has been tested on a Dell XPS 9440 together with the IPU6 isys CSI
> > driver and the libcamera software ISP code.
> 
> Thanks, Hans!
> 
> I've also added the DT binding file to MAINTAINERS in this patch. I guess
> that's fine.

Ignore that. I just recalled why it wasn't there.

As the driver has a DT compatible string, now it'd be a good time to add
the device to bindings in
Documentation/devicetree/bindings/media/i2c/ovti,ov02e10.yaml .

Bryan?

-- 
Sakari Ailus

