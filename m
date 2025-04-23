Return-Path: <linux-media+bounces-30861-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1FEA9974C
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 19:59:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4DC3A1897C9D
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 17:59:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CFE028CF6F;
	Wed, 23 Apr 2025 17:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PriaEIDD"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550EA10957
	for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 17:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745431147; cv=none; b=FNlwiK5CTzz1RmMMWHWfw8etphmM/ddpeYIXhb9CQXWBb0o6UqzVKMv5/WWaDjFWqeyYx8h1yruTNIlTQQvEgT/+Rv9JrpAbWokV01hbTVFFf1mpk9xGYk1F8Jd00oOkkMKeN4dxvgzqwKRJRmnmAcxPZiFv5iUhxDx8eP0FUsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745431147; c=relaxed/simple;
	bh=GyxEz8tINkHzIx5UZsjpjQP9R6qJRI01yBSpv70UqrE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u394FuQjSBdktX267eIEGNMqguT4IrJ6NK+D5eZh0NVWVGC2U4LzdUumaydSHrwZZ71z7+L+6VVS2YGd1U/OTi11a6ib9Ke0tie/QIhKnRQ7qcNSTJfzwawVONk0JvXYjENHkUYSwnGcXeNa24sCkL30W1lGzo4/nHb6KnE+ssY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PriaEIDD; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745431147; x=1776967147;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GyxEz8tINkHzIx5UZsjpjQP9R6qJRI01yBSpv70UqrE=;
  b=PriaEIDDrlhzn9ngZkxC1LDtDtn2+CuTVDOxGPyD+5RwOPROTiIiR3MD
   gTU0uhushcwpQ5qw+XKk6hzsDMQhgs9PQN/vTLO27YQLNSNkpoIhZE835
   0QAPRlzBNZXDZ9LdZO8hAPZtJq6mpx5plg7cSWhGipMSDaKcT05Q+3aGa
   vXSkP0yTMlT8ldQXmK9YgX+ENV0poyoJCqxuW86rzC7s46lALXuqus1B8
   PLTkba1OTcUsLX79q37Oh4CZbjdUAnk5rX3olgao7k9c9rJHMrBjtgpY7
   WbaCxMTfLD+bWJhyW2cnzIUzNWL6KKhiv8Ee5JPmTtpWo1yODWKfv1/TE
   Q==;
X-CSE-ConnectionGUID: ULTiAii+TDCoRS4v0hsmXg==
X-CSE-MsgGUID: lCtpifXSTv6KkhYiUZ7Vpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="47137343"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="47137343"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 10:59:06 -0700
X-CSE-ConnectionGUID: TT86sE06QS+NN4MvGefshw==
X-CSE-MsgGUID: KsJzI+4ISCyc3XhocB07iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="132273628"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.114.139])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 10:59:04 -0700
Date: Wed, 23 Apr 2025 19:59:00 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hao Yao <hao.yao@intel.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Ingvar Hagelund <ingvar@redpill-linpro.com>
Subject: Re: [PATCH v11] media: i2c: Add Omnivision OV02C10 sensor driver
Message-ID: <aAkqZLGTQjoQ272c@linux.intel.com>
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
> 
> Tested-by: Ingvar Hagelund <ingvar@redpill-linpro.com> # Dell XPS 9340
> Tested-by: Heimir Thor Sverrisson <heimir.sverrisson@gmail.com> # Dell XPS 9440
> Signed-off-by: Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>
> Co-developed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Co-developed-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I can confirm the driver works on Dell XPS 13 9340 :-)

Tested-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com> # Dell XPS 9340


