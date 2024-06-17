Return-Path: <linux-media+bounces-13428-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B0690AD36
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 13:43:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B667A1C22DA3
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 11:43:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17FCB194ADF;
	Mon, 17 Jun 2024 11:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QWhjhmSx"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBA21946BC
	for <linux-media@vger.kernel.org>; Mon, 17 Jun 2024 11:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718624586; cv=none; b=iaLKajN490ZqV9tdrOJrNtSCp2tVMixcs1YTXM7EMjsqHZ/6nB04Q+NLKV2erJgvBO96Ci7NGzU8XYAtkj1VF5mehCOrhfChxsKkqFHLR7u33xmZ2sWKDV/P/uCbok6BvT9+1eF3ovMNdX1cjhJCcFCI5gkXbR0pu3351s+yT0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718624586; c=relaxed/simple;
	bh=lG1QoZhTONN2b/XKo0m9Zr7roz+hU+ZiXTTD7nvFo5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qZHn8KFpljzUbb9HJNIpBhZj0VB/rAolzjy9O/6pWd5AC6WFuqC/K3PfH/++B6QwK+taSbBOu9N6Aui06d7XvBgXBPrF6VLm18Du/C0gbSMuSDcj18KtrQxE7oZaNuaomlVP4Y9WqBfAanhCw1IJt0RlvLaii7fEQYx+Z6uK3lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QWhjhmSx; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718624585; x=1750160585;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lG1QoZhTONN2b/XKo0m9Zr7roz+hU+ZiXTTD7nvFo5U=;
  b=QWhjhmSxbH0zK5OUlEHtC0L812GCXJVpJdpjI6ZN5Pl+L4TguxY+Bknd
   UDXCd7AaGq2RJk0s1aZpDL6FoqLzhDt1UJ+aAXPdaCOorCDGX2t7Jn/E/
   hStM/cLgfJSMM+uwGij7jdXM87myazRnnJHQPa3FHIXWFCfZMK7I75EXd
   /sow3raKZ9MneUoEFYtXQPYBQzvVIre04heK0sb92inQkotPExz/oxDzY
   rEGLcdDIxfz/OupPp56A3v8lA8A8RgudSBmRM79F5Hyol4BRVotm6O+oO
   pgneeUHT4mgGn5NByX3iKSEyMDtE5w7nRfrpGP05DcOJNSYklz8m5S5K/
   g==;
X-CSE-ConnectionGUID: pHL7ryxYRiKRfRU0Wx4ezA==
X-CSE-MsgGUID: 3XuNCQ5yQDyb0RIipNL4fA==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="26129055"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="26129055"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 04:43:04 -0700
X-CSE-ConnectionGUID: x0K2mjduSuGUHoDIj1BvuQ==
X-CSE-MsgGUID: o3SKXQUCTt6AKwYrfaQ2wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="78643146"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 04:43:03 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 2664811F7E1;
	Mon, 17 Jun 2024 14:43:00 +0300 (EEST)
Date: Mon, 17 Jun 2024 11:43:00 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v4 07/26] media: mc: Drop media_dev description from
 struct media_devnode
Message-ID: <ZnAhRIQeoAYDg9Do@kekkonen.localdomain>
References: <20240610100530.1107771-1-sakari.ailus@linux.intel.com>
 <20240610100530.1107771-8-sakari.ailus@linux.intel.com>
 <0b29048f-1e66-4cf6-a71d-45fbbbd3fb3d@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0b29048f-1e66-4cf6-a71d-45fbbbd3fb3d@xs4all.nl>

Hi Hans,

Thanks for the review.

On Mon, Jun 17, 2024 at 11:02:16AM +0200, Hans Verkuil wrote:
> This needs a proper commit log.

Oops. I thought this had been fixed already but I'll do that now.

I'll use:

The revert of patch "[media] media-device: dynamically allocate struct
media_devnode" did not remove the kerneldoc documentation of the field
media_dev in struct media_devnode. Do it now.

> 
> Specifically it should mention that due to the revert in patch 05/26
> the media_dev field was deleted, but that that revert didn't remove it
> from the kerneldoc comments.
> 
> I would also suggest that you move this patch to 06/26 so that it
> comes right after the 05/26 revert, since the two really belong together.

I agree.

> 
> With that, you can add my:
> 
> Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Thank you!

-- 
Kind regards,

Sakari Ailus

