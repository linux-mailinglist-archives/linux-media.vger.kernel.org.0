Return-Path: <linux-media+bounces-20289-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B1E9AFA57
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 08:50:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB6EE283AB3
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 06:50:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7347C1B0F24;
	Fri, 25 Oct 2024 06:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b81W4b39"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A2C18C009
	for <linux-media@vger.kernel.org>; Fri, 25 Oct 2024 06:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729838990; cv=none; b=q59kp7fqI0P5GsPoDCmA4bbkEsyFaUxsLHfRY6i6U6327fVbmZUpjbCCtedmo6Qgqp0ZgQ4ZBCTKvDb1c8NmRWunMHysmz/w0bp4DVELlJJNxeUUvdWEhTRwqp3iVNd6VqTuQLomK9ZC+sba0qgzzeqTuAZ9/GIeviCI+g6utNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729838990; c=relaxed/simple;
	bh=bgVyMsSmVSEGWK3+yajMbLw9KAyfRGpVGmXbXurIBF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tAogHuIv7mee3XALVSseqwA+Ng1HntjYz6Mgslkgp7pwAnOXKyAxC8LGat0g7ytEtQKecYBcSea+JsR0LoyT5IG11k2//fTorLXu0+et79RxwY/3kAOkrND05wB/n/FDuCOQMObe/sVZvQwpj2xruzLGiyJgidS+EHhKj4OVIq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b81W4b39; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729838988; x=1761374988;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bgVyMsSmVSEGWK3+yajMbLw9KAyfRGpVGmXbXurIBF8=;
  b=b81W4b39BxoBNbEyXbnO8TyDx7R9qGsHpm6g3XrLrko+yDfJCtjHA+MG
   6AFcmLIaHTlb1dULu5UWAQLRAJV+BgT08upRGChYjuHlf/OHgBsia3K5d
   MvlJlbbCbZPQFee08Rpzq37VNTkxE4A35oY336JhhRyL6gNkytfzaX7hr
   r2nKnZqjnhLF2e2on6BOXZoZOUD3dq9P+PPrBy/NwD7qLB4aWVRgLABuG
   cBbYxH3XD/o7q/Q11uwuH74GWfTzTU90kM8HlmOQy3uEaPtlvpnNVF8hI
   01hNcMRyw/dZQ4lZTQcegkje1TOrPN7Fp3rwt4DSoIb0UKberRtF1KY60
   g==;
X-CSE-ConnectionGUID: sURzIPqXSbqvPnGeqr/4pA==
X-CSE-MsgGUID: Dz/DA6EVRK+4AmPxjHHGDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="40117119"
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="40117119"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 23:49:48 -0700
X-CSE-ConnectionGUID: 7d+nKMwdQeqY9C11XMitoQ==
X-CSE-MsgGUID: QD3UYyWeRPegA7six6SwzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="81258377"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 23:49:45 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 239D211FA70;
	Fri, 25 Oct 2024 09:49:43 +0300 (EEST)
Date: Fri, 25 Oct 2024 06:49:43 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Dongcheng Yan <dongcheng.yan@intel.com>, linux-media@vger.kernel.org,
	laurent.pinchart@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
	jacopo.mondi@ideasonboard.com, daxing.li@intel.com,
	hao.yao@intel.com, dongcheng.yan@linux.intel.com
Subject: Re: [PATCH v3] media: i2c: add lt6911uxe hdmi bridge driver
Message-ID: <Zxs_hzuovpuitTYv@kekkonen.localdomain>
References: <20241017030831.3248879-1-dongcheng.yan@intel.com>
 <5b42e37a-810d-45e4-8552-c9299837a16a@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b42e37a-810d-45e4-8552-c9299837a16a@xs4all.nl>

Hi Hans,

On Wed, Oct 23, 2024 at 02:28:02PM +0200, Hans Verkuil wrote:
> Hi Dongcheng,
> 
> Since this is an HDMI receiver, you need to implement the DV Timings API.

"Must"? Why?

I don't know the tc358743 driver but it'd unlikely to work with current
CSI-2 RX drivers. They expect the LINK_FREQ control for instance, not the
DV timing API.
<URL:https://hverkuil.home.xs4all.nl/spec/driver-api/tx-rx.html#transmitter-receiver>

-- 
Regards,

Sakari Ailus

