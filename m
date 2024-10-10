Return-Path: <linux-media+bounces-19353-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 350769988B1
	for <lists+linux-media@lfdr.de>; Thu, 10 Oct 2024 16:04:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D56371F2834F
	for <lists+linux-media@lfdr.de>; Thu, 10 Oct 2024 14:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A5611C9EDD;
	Thu, 10 Oct 2024 14:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ANygyVig"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888AC1A264C;
	Thu, 10 Oct 2024 14:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728569054; cv=none; b=QxzIqshHPrsKxsGEhqBZPOD9ZmSC2c6WksPjw6SOYhPd737pJ4Fiq+orCWmvyVpfXqpU79FiqXQAP22W8gI2kZBvU/DN4XRd7//W2wElL4I0MjRS4I0qYkOEtVCCkFQ96qiYfRq4gUCeJWPkah0bzKjTw3IWabhpmq3Wc+x27QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728569054; c=relaxed/simple;
	bh=W2BJvnWqECUROFGUdQwhoOVO7J8ucf3LKzKXYU59GRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IkOmO2p8bQxlW2ifhEqN6JEmNhuJ+WLt5L2r+LqsHWyacZvRjBi7Pfw2I6VBiH3euckRMLiC7PY1Y9hiNZSqvmJQXIzo4a/JtEV8Kerc6RFumVGe/Ct6r74QLdTW8bK9n2Jr5AXrZ2c19lhgjs9QTiU4uOk4YtW/1RiYsGTV3H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ANygyVig; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728569054; x=1760105054;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=W2BJvnWqECUROFGUdQwhoOVO7J8ucf3LKzKXYU59GRw=;
  b=ANygyVigLCDcOJEMfn6k9zvvd5fYVvFtrjKeO4hMw4O1xnUQkuPTwAs4
   4DqOAc0xoHuSaiTIzlqTIkbLm1Cj4AefX74gYjFCNRl1BePK7dFIqcW2V
   JKT0mRdfGMlv1OULGWjOaZ6+SoMgeFw/DQ1XBDMfBcXfz1s7Nu3tnCVXR
   nMlYXyut0Lc9P1bGylEfBXyeZd9zQo7dSQcXf+cVCeAF9jtV6voslJKl1
   Fln+M/Y31VIaJbnvxWrWPrT9pVHiX5iCGUmm3krpG8lD9l61vX2gmjDce
   py9Sp9vl9dE4KIiSonY+bptOKOBtxFHnFhYHvxkBs6JH3fuKWWHPJC8ar
   Q==;
X-CSE-ConnectionGUID: XES3C/YQTei0+OE6wkqmXw==
X-CSE-MsgGUID: TpG9XX4MTtio0DhiRzDryA==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="27872596"
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; 
   d="scan'208";a="27872596"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 07:02:59 -0700
X-CSE-ConnectionGUID: QJFfAHIuTLyzw3ryxES2zQ==
X-CSE-MsgGUID: bGcLxQGOSoOynXOKE2w+Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; 
   d="scan'208";a="114069301"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 07:02:56 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sytkj-00000001YVh-1r3v;
	Thu, 10 Oct 2024 17:02:53 +0300
Date: Thu, 10 Oct 2024 17:02:53 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jai Luthra <jai.luthra@ideasonboard.com>
Subject: Re: [PATCH 01/13] media: i2c: ds90ub9x3: Fix extra
 fwnode_handle_put()
Message-ID: <ZwfejTUojOm4gOBt@smile.fi.intel.com>
References: <20241004-ub9xx-fixes-v1-0-e30a4633c786@ideasonboard.com>
 <20241004-ub9xx-fixes-v1-1-e30a4633c786@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004-ub9xx-fixes-v1-1-e30a4633c786@ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Oct 04, 2024 at 05:46:32PM +0300, Tomi Valkeinen wrote:
> The ub913 and ub953 drivers call fwnode_handle_put(priv->sd.fwnode) as
> part of their remove process, and if the driver is removed multiple
> times, eventually leads to put "overflow", possibly causing memory
> corruption or crash.
> 
> The fwnode_handle_put() is a leftover from commit 905f88ccebb1 ("media:
> i2c: ds90ub9x3: Fix sub-device matching"), which changed the code
> related to the sd.fwnode, but missed removing these fwnode_handle_puts.

fwnode_handle_put():s


-- 
With Best Regards,
Andy Shevchenko



