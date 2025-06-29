Return-Path: <linux-media+bounces-36236-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D27AED520
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 09:06:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 855A1168F82
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 07:06:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D88F0218E96;
	Mon, 30 Jun 2025 07:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m/DjEl+j"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDFA118DF89
	for <linux-media@vger.kernel.org>; Mon, 30 Jun 2025 07:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751267195; cv=none; b=hQrENRM55qh1NIPBp11WaNDvq4R8REyYAJvxX3NmUB/vyHx9dNDKIuGoJAlSiEBtOxxLaZsfB07F9hysaPfW/VBa5t70Z3cOUNn3cPKaNmdRs8GIX177zJQabHd6Hj0CXxpPRCcYMn7vUQpU2QoFtMRXiwJhMA3NG7TK7tCT6fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751267195; c=relaxed/simple;
	bh=vQd9XX9cBPWPZvFvnLgJAV+xJ9bxW9v2vL3Y2h73boM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l5MgIzvNWZmAIQBcCV5WEpl0ZdpnuC1nzhFNt/ktEJpNXcWaavVii8uS5rZTRnn8RslW4oAOm/kBsJGeia5GQ4ZdQi5Hs4PwASS9ZY7f78bYj9020bHR15o4J/iPdeb/a8hl8ao54eaiaJKgkn0uSDrJL9w9J4kUjosR5i7x0HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m/DjEl+j; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751267194; x=1782803194;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=vQd9XX9cBPWPZvFvnLgJAV+xJ9bxW9v2vL3Y2h73boM=;
  b=m/DjEl+jYAmIpv9VGY1qU0n1rKTvSdKCBmBkkbZ28RP7Ikw/RLFUSR73
   ysWijphT1SNgRbJqCIJjixg6OHI5fcuq3dFuKunSnxlSlSgeHm0ipX4J0
   gvhtjLnJ2gygMj2Xw9wq/kl+CYN44q49dR8fUwWJn9qp/qCh+B0hv7ww9
   4oxecBMuxW4Ygl1Q5IGjSVQTb/cPo827Wh8Uie+aI161m6+BLY7hXNeOx
   bkXgbCkjT4cCoCm8RPj+wYoJum9ptSnA70DQdd67xiWmtFNySNehLYcNP
   LjN5L7x9ZQX0Uq8ZBfdGk9/jCvew/4tnw1ShPd8MbvzziEqZCeAnb3zTn
   w==;
X-CSE-ConnectionGUID: H5cCYgjtQriYfCk0kJw3tw==
X-CSE-MsgGUID: qsfY2xguS66ON2rMner4Mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="52600132"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="52600132"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 00:06:31 -0700
X-CSE-ConnectionGUID: 9edI52p+Qf2kjhXTUUr1Nw==
X-CSE-MsgGUID: Mdu4gReLT5GFUgCmYZOOCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="177046701"
Received: from agladkov-desk.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.57])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 00:06:29 -0700
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id 8EEA0443F1;
	Mon, 30 Jun 2025 10:06:27 +0300 (EEST)
Message-ID: <c388880c-f20d-404b-8deb-4813f44c7690@linux.intel.com>
Date: Sun, 29 Jun 2025 12:11:28 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] media: Documentation: Add documentation for media
 jobs
Content-Language: en-US
To: Daniel Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, jacopo.mondi@ideasonboard.com
References: <20250624-media-jobs-v2-0-8e649b069a96@ideasonboard.com>
 <20250624-media-jobs-v2-3-8e649b069a96@ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
In-Reply-To: <20250624-media-jobs-v2-3-8e649b069a96@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Daniel,

On 6/24/25 10:59, Daniel Scally wrote:
> +   struct isp {
> +
> +       ...;
> +
> +       struct {
> +           struct list_head pending;
> +	   struct list_head processing;
> +       } buffers;
> +   }
> +
> +   static bool isp_driver_job_ready(void *data)
> +   {
> +       struct isp *isp = data;
> +
> +       /*
> +        * Do we have a buffer queued ready to accept the ISP's output data?
> +        */
> +       if (list_empty(isp->buffers.pending))
> +           return false;
> +
> +       return true;
> +   }
> +
> +   static void isp_driver_job_queue(void *data)
> +   {
> +       struct isp *isp = data;
> +       struct buf *buf;
> +
> +       /*
> +        * We need to "consume" the buffer so that it's not also considered as
> +        * meeting this dependency for the next attempt to queue a job
> +        */
> +       buf = list_first_entry(&isp->buffers.pending, struct buf, list);
> +       list_move_tail(&buf->list, isp->buffers.processing);
> +   }
> +
> +   static void isp_driver_job_abort(void *data)
> +   {
> +       struct isp *isp = data;
> +       struct buf *buf;
> +
> +       /*
> +        * If a queued job is cancelled then we need to return the dependency to
> +        * its original state, which in this example means returning it to the
> +        * pending queue.
> +        */
> +       buf = list_first_entry(&isp->buffers.pending, struct buf, list);
> +       list_move_tail(&buf->list, isp->buffers.pending);
> +   }
> +
> +   static struct media_job_contributor_ops isp_media_job_contributor_ops = {
> +       .add_steps = isp_driver_job_add_steps
> +       .ready = isp_driver_job_ready,
> +       .queue = isp_driver_job_queue,
> +       .abort = isp_driver_job_abort,
> +   }

The media jobs framework has data structures that span over multiple 
sub-devices, each of which provide their of UAPI etc. Does a driver need 
to serialise access to some parts of this or is it all taken care of in 
the framework?

This would be good to be documented at least.

-- 
Kind regards,

Sakari Ailus

