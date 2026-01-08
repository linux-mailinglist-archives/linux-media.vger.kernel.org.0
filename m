Return-Path: <linux-media+bounces-50232-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CD4D02F93
	for <lists+linux-media@lfdr.de>; Thu, 08 Jan 2026 14:22:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 746023029D09
	for <lists+linux-media@lfdr.de>; Thu,  8 Jan 2026 13:10:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B1D74CACD7;
	Thu,  8 Jan 2026 12:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T400Mshn"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF234A3A52
	for <linux-media@vger.kernel.org>; Thu,  8 Jan 2026 12:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767876307; cv=none; b=jKtQzx9Qi0Od5V5H8fyqtY8wvXoq+yYglS6GYtFiYp07lGRzaHvnhrKj/+WuTsdYO8SHoZW0tPAsmsf6dAQhoM0qoi5NJeqytuhGBwRQ9rNqrzcmC/RudAQ30fneRlTx2iIEellYEO4SKcYtnk4ll56h7AHfI0dsl5rrg+5GIuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767876307; c=relaxed/simple;
	bh=7rnMIEkyiWGM8o6AatHNlW3KCTzlwqLC92ukHKB7wRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hp+7MBmvRgooKXwqMJ5TqWjudX3m0y6bzNA96CV3lQiRuleVBu91XdJ2n4tWzp1tFkZj+ZHz4g7isv6J4tIOF96KXiDGHszzbtHFi0YcE5U4APX8MPs41d9hg4p+IwvVO7djq7tQmAV63xSdd9AJoKMdu2zG9yakR/El8+6N/GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T400Mshn; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767876304; x=1799412304;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7rnMIEkyiWGM8o6AatHNlW3KCTzlwqLC92ukHKB7wRs=;
  b=T400MshnHAmaUWoewJMKo8yqgaZEyGJfcqCs4PoJdd8nV3UpQlyY5u8P
   8rTKtINhaC/VdT503vn4JSWWv9lJ1Cxk3hrWL/G2ovkGoQNLtoddj99gy
   VbhoQBcjiJeWcDF778bHp/vhfGLFXYRas2qrnDbzAqkthIGdsIe89PSSL
   YrJoCPZ0QeK1V/RKsLY3tbdOGl7eYIjCZTmQ/CMjYlX6VONSCPFP57z0l
   NrMNy5RYkoyKFlEewCtAVGbhThlZ7tAjq6V/9QI8s8lpa1lRWeX/cSwDH
   BHDo/VcIjNP/beYwjkpXop3/G9bF/7clelC4flLzLPhW7tyeVSb7pm76u
   g==;
X-CSE-ConnectionGUID: +/quboB+QgyrFHMa+2txUg==
X-CSE-MsgGUID: DZT1BQAYR8S6CHabIWVzrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="94721335"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="94721335"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 04:45:02 -0800
X-CSE-ConnectionGUID: DSBQQFDlQ16iRRuYN6VOyg==
X-CSE-MsgGUID: lz4COTMwRNmKM+SCtaVRMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="202325726"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.248])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 04:45:01 -0800
Date: Thu, 8 Jan 2026 13:44:53 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, bingbu.cao@linux.intel.com, 
	tian.shu.qiu@intel.com, antti.laakso@linux.intel.com
Subject: Re: [PATCH v4 00/14] IPU6 driver cleanups and fixes
Message-ID: <32vfwz3gkwaiaerd77iimiq4fdgvmxexazrq4xzs6vjszrkcl5@sigkgip5xtk4>
References: <20260108081712.543704-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108081712.543704-1-sakari.ailus@linux.intel.com>

Hi Sakari,

On Thu, Jan 08, 2026 at 10:16:57AM +0200, Sakari Ailus wrote:
> Hello all,
> 
> This small set contains cleanups and fixes for the IPU6 driver. I'm
> preparing a larger set of improvements in the IPU6 driver on top of the
> metadata series (I'll post an update soonish) so consider this to be
> preparation for that.

[...]

> Sakari Ailus (14):
>   media: ipu6: Ensure stream_mutex is acquired when dealing with node
>     list
>   media: ipu6: Drop MMU hardware initialisation in probe()
>   media: ipu6: Remove redundant driver data checks
>   media: ipu6: Make symbols static
>   media: ipu6: Remove redundant streaming start via buffer queueing
>   media: ipu6: Don't check pipeline in stream_start
>   media: ipu6: Close firmware streams on streaming enable failure
>   media: ipu6: Always close firmware stream
>   media: ipu6: Drop error argument from ipu6_isys_stream_start()
>   media: ipu6: Obtain remote pad using media_pad_remote_pad_unique()
>   media: ipu6: Obtain unique source pad from remote sub-device
>   media: ipu6: Remove source_entity from struct ipu6_isys_stream
>   media: ipu6: Drop custom functions to obtain sd state information
>   media: ipu6: Always call video_device_pipeline_alloc_start()
> 
>  drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c |  2 +-
>  .../media/pci/intel/ipu6/ipu6-isys-queue.c    | 73 ++++++++-------
>  .../media/pci/intel/ipu6/ipu6-isys-queue.h    |  1 -
>  .../media/pci/intel/ipu6/ipu6-isys-subdev.c   | 36 --------
>  .../media/pci/intel/ipu6/ipu6-isys-subdev.h   |  4 -
>  .../media/pci/intel/ipu6/ipu6-isys-video.c    | 88 ++++++-------------
>  .../media/pci/intel/ipu6/ipu6-isys-video.h    |  6 +-
>  drivers/media/pci/intel/ipu6/ipu6-isys.c      | 21 +----
>  drivers/media/pci/intel/ipu6/ipu6-isys.h      |  2 -
>  9 files changed, 73 insertions(+), 160 deletions(-)

Thank you for the patches!

Tested-by: Mehdi Djait <mehdi.djait@linux.intel.com> # Dell XPS 9315
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

--
Kind Regards
Mehdi Djait

