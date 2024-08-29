Return-Path: <linux-media+bounces-17132-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 88383964517
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 14:47:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 23A1CB270ED
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 12:47:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DFA21B1439;
	Thu, 29 Aug 2024 12:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YFQNDcYs"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6DC1B142E;
	Thu, 29 Aug 2024 12:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724935182; cv=none; b=X/OAB6ruS9qdLg+EZZxGiDz7fW2UObedz9QNHZ6+W4ky5zt2v37dY/zEsKYo4tia15dI3gJWfBnAbhQGevhb7z/DrAkoxG9GxqzEXIb90xoHN0zHRWml71SaY64aYN8g0qPfyjpv7x/XovA/7XjwWztXUyW2M7tYm1QpX9d0iMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724935182; c=relaxed/simple;
	bh=ansrGg2gRw5S54Bj6yl3JQ3JRLuEDaTk9+RDLMKVcek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gNz2yCMkIyngD9UoVj6AY4PCXbz7BhDpyj7iEigB8xQin8vDv43QZ7WFAL8hX8gNJrq+Ux7AE5qQJva2l5a0lYPYB9hFYM13kfnj4MizLydh1Lq2gpTC/Asvamzd0YkYCi9k2Xah4/SM691qwwbnvoSIU+AxTStyf7PiozcC0K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YFQNDcYs; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724935181; x=1756471181;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ansrGg2gRw5S54Bj6yl3JQ3JRLuEDaTk9+RDLMKVcek=;
  b=YFQNDcYsC28Mvqv8OcNuVGuO/woigtSOLyoVBZTGYuNvMTX64wfzh7xc
   0G3CQxdTvEybt0kkkwJmfx2qj38+pijyQ5bUsVnl1dV9CxfMDJlw0uZNM
   xIrIbWPIrBhy2vne4n0FpJGJfsXsngxtELOhM2fgpLebS5KQtcbcIy9d0
   lqQ9xbUOmsGQx4cGNQNUinLs+JDStCF5GuAwAKCex/Z1Mbt0+Pgiuabw7
   +Gw4knlbI3SnQqqMrioiwHdMiPcyas2vL5e7xk5ipvmlSYGGzrAZZ19MN
   u1eRAUABnIfaelju+oZ6WF9Q4CSZqqQ8YM7HmuV/FVXnUmoVXCkKAX/Sf
   w==;
X-CSE-ConnectionGUID: bQ3wkMBqTKmrwh87m82y7A==
X-CSE-MsgGUID: nXvzeLfSQ+yzf3yvPI/jIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="23475560"
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; 
   d="scan'208";a="23475560"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2024 05:39:41 -0700
X-CSE-ConnectionGUID: /O3uFiTWRtCKYZvmPuL/vA==
X-CSE-MsgGUID: 2d/wuqYtT628Lf0Z3Nvmmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; 
   d="scan'208";a="67945625"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2024 05:39:39 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 0896511F843;
	Thu, 29 Aug 2024 15:39:36 +0300 (EEST)
Date: Thu, 29 Aug 2024 12:39:35 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Benjamin Bara <bbara93@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Benjamin Bara <benjamin.bara@skidata.com>
Subject: Re: [PATCH v2 1/2] media: i2c: imx290: Check for availability in
 probe()
Message-ID: <ZtBsB1iqm4PhbfnH@kekkonen.localdomain>
References: <20240828-imx290-avail-v2-0-bd320ac8e8fa@skidata.com>
 <20240828-imx290-avail-v2-1-bd320ac8e8fa@skidata.com>
 <ZtAdvtkjr0XNbvmu@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZtAdvtkjr0XNbvmu@kekkonen.localdomain>

On Thu, Aug 29, 2024 at 07:05:34AM +0000, Sakari Ailus wrote:
> the next time. I'll wrap the line this time.

Based on the other review comments I'll wait for v2.

Thanks.

-- 
Sakari Ailus

