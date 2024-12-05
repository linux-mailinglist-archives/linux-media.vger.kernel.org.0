Return-Path: <linux-media+bounces-22669-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7B49E4FCD
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 09:34:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF377169240
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 08:34:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50FC21D358F;
	Thu,  5 Dec 2024 08:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MCtL/T6w"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6E2189B94;
	Thu,  5 Dec 2024 08:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733387663; cv=none; b=k48Z/J/l+g4YMl1uQmHlmxnlnIKSO/0PalhRUzql0WwSDQIJ4c4TPbXmPA8B8rKwlaxYJBGpNMARk6ZMEaEkVhQ6FRA4OTEi3f1VZLGDJe05kNmLgiWtNDKmM+4ZJFZsOxRi83W/JofmejMnHPcIAlj3MRdCfzq0T5CKJVMNhU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733387663; c=relaxed/simple;
	bh=EY0obaopMZMzqQ44IfEwB99P3NrMQjgCL7nvQGy/XYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E11ZxX1zk5nZbEHpf8rWFej8U3hOXqLm7HoVUVd5aGqbpr9cotIhW4Aq8jykXsWyRdJL+8t7YYqi8G1DkylFBv74e3Qa0WXy/5bQCd5ySxD9bg4ZsG2F2Nx84BM1R8Pi58fMKD6FpFNWjDBar/OobjPn+IcedhPkaoK/BgFyEeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MCtL/T6w; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733387662; x=1764923662;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EY0obaopMZMzqQ44IfEwB99P3NrMQjgCL7nvQGy/XYU=;
  b=MCtL/T6w8kflVNyDAKOiCN32qFUW78XHyvBQaARMrmNJF4aRCPVivIpu
   B0XN/Mb70BzMLOtAo/JpChG039CI4exZ6AYuv91FVn/WyiXAqMhHtb2Zr
   mlopyvuaOBfOzmf7gVW7g4oHpoGA3mWNzheNG33iX//NU2cRTd865uKV4
   Wxzo/DTxsXWEtlZ0hleBrNRr6lheMP3hEo2hZiwzCFx73OWdUiR+CcGkl
   cHyLrEZFGpWX5Z0TBEMSJ2oKTDCpx9dZ5m6jxQ9xSg7ucswuxIUC2BZOK
   eAhU4yQDblPBgyE0NnRsxij1VW7JuzjIibV2ssYU2XB3bjoDxV0v6AG5g
   w==;
X-CSE-ConnectionGUID: PgQS5snWRhuZyUuYnFj4oA==
X-CSE-MsgGUID: t5QgG+L5QZCwIk4dyuCGyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33603300"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="33603300"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 00:34:20 -0800
X-CSE-ConnectionGUID: QUufLjZISheV8XyqE+hlBw==
X-CSE-MsgGUID: 0YilZhPjR9aYrv4Y+1pOOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="98991331"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 00:34:18 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tJ7JQ-000000041oZ-0RFM;
	Thu, 05 Dec 2024 10:34:16 +0200
Date: Thu, 5 Dec 2024 10:34:15 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 14/15] media: i2c: ds90ub953: Add error handling for
 i2c reads/writes
Message-ID: <Z1FlhxLSu5d73YWA@smile.fi.intel.com>
References: <20241204-ub9xx-fixes-v3-0-a933c109b323@ideasonboard.com>
 <20241204-ub9xx-fixes-v3-14-a933c109b323@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204-ub9xx-fixes-v3-14-a933c109b323@ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Dec 04, 2024 at 01:05:28PM +0200, Tomi Valkeinen wrote:
> Add error handling for i2c reads/writes in various places.

...and this one?

-- 
With Best Regards,
Andy Shevchenko



