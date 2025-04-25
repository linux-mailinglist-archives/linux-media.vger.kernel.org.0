Return-Path: <linux-media+bounces-30986-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C088AA9BFD3
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 09:34:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D2C4F7A57CD
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 07:33:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2277522DF91;
	Fri, 25 Apr 2025 07:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XTGOQYlt"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE1310FD
	for <linux-media@vger.kernel.org>; Fri, 25 Apr 2025 07:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745566461; cv=none; b=Wfe7tS1NIKFg0VMNOMQ4Oyi2T2HZBg1oeE2zE5RHfYBceWXLKaITlAmntqF8ErLDSpa/0qDQ2CQM/U1zIc+OwI3d61NKNrj+CNKtUvcNd9ohPAN642m/j/7Cj1gW4s1bQDWTXJ+Ne94cJGI/fIYDyDsaRiQRq8JvISIiPasSh5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745566461; c=relaxed/simple;
	bh=7x20l4ww2mYkFhBtZGax+M2YDhkzionzDaReolC8Bac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XT9pdg4acHkxGZfj81ZVRT9WhBxnghYAdhFrdaoO07/qEzz1znx8Mv7+s/uxrSs6WXYGsLG89QZHh9VVpAJuwLMertuf5DUpwrmCzQlX/H8CJy47oqJVZytqQITLpR43HLMmE3em32dY5sdKHidfOxPntR7YGL2ieBHy3+vho4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XTGOQYlt; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745566460; x=1777102460;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7x20l4ww2mYkFhBtZGax+M2YDhkzionzDaReolC8Bac=;
  b=XTGOQYltz84814RYAK5NL2GPNXd34CVmquYcbEamoat6S+J3/b22OxR/
   ynnyHm7f/76J+PMAeja1KU62dA9NdaPQvR0kj2BK0xloFdxAxla2Cr377
   1UreSW/mKplMHqRVonZXMJuAs6E0F0Vot1ig25gbnsYSLcn0GBkxdN+3j
   2vawaZTJQtIUUfSxJGuwrNOcZlPElgB2zKeER6i/a9OnkIhFM8S3OL3NN
   qFx6o8XziNnm/2A446fVAGPxgxgFrYP/2kzNv/0cG9ss7SZo720CgCzCS
   JqzK+cdxuus7WQGwqRgwU6xmCPZlbFYlB0j0ILv0SuptUNgv1pGlXiNjq
   A==;
X-CSE-ConnectionGUID: /gXadD2iRMys78RagR+k8Q==
X-CSE-MsgGUID: 4cAM8l2+QeK8C4IKp3dEeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="47237242"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="47237242"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 00:34:16 -0700
X-CSE-ConnectionGUID: WiYye1LlS3uUYW0/Hcduxg==
X-CSE-MsgGUID: LZsHi+gfRXm2S80rlKKrLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="132580491"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 00:34:13 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 30C7E11FA28;
	Fri, 25 Apr 2025 10:34:11 +0300 (EEST)
Date: Fri, 25 Apr 2025 07:34:11 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Hao Yao <hao.yao@intel.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Ingvar Hagelund <ingvar@redpill-linpro.com>
Subject: Re: [PATCH v11] media: i2c: Add Omnivision OV02C10 sensor driver
Message-ID: <aAs689anIBXqRbyG@kekkonen.localdomain>
References: <20250327164927.30741-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327164927.30741-1-hdegoede@redhat.com>

On Thu, Mar 27, 2025 at 05:49:27PM +0100, Hans de Goede wrote:
> From: Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>
> 
> Add a new driver for the Omnivision OV02C10 camera sensor. This is based
> on the out of tree driver by Hao Yao <hao.yao@intel.com> from:
> https://github.com/intel/ipu6-drivers/blob/master/drivers/media/i2c/ov02c10.c
> 
> This has been tested on a Dell XPS 9440 together with the IPU6 isys CSI
> driver and the libcamera software ISP code.

Thanks, Hans!

I've also added the DT binding file to MAINTAINERS in this patch. I guess
that's fine.

-- 
Sakari Ailus

