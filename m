Return-Path: <linux-media+bounces-49366-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA5BCD6A69
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 17:22:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2D7B73038F4E
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 16:22:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C59332ED23;
	Mon, 22 Dec 2025 16:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h27/VkXN"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFBA1FE44A
	for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 16:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766420543; cv=none; b=tCj1OZLGC5v5u14ypQ4DEITtj32wZQRtKUDRtO66oU+pLioOVKYB+YBR4xMkWseJlfJI9LLqc0Rf8xLPXbJZNrjZAC7kw7kdcki72ZySaVNQhBJnL1ZPNo6pq5I1hDcAw4edOLR1oFV9nbTKQtMwH7nrIHK+kncMBeZh7y09rmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766420543; c=relaxed/simple;
	bh=F6pfTcfQQL0W8SKjwH1J/RFdjNG8sR04VIrKhB588xs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YfXeOpuciVwDR3lpxKBngDd+jqykz4VGQasgFEk/6/Z6uNV9Of2TySzYdyFr/RqEEp1reSA17F/zvgghr+d1GZe4wxsXu9cOj8zPiyqEb0MF7jPmlUnh0gRh859jS4mRTWN84X0LDHUGwwsvYqPFyFyEzrGYX8IKJgvIRrIN/wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h27/VkXN; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766420541; x=1797956541;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=F6pfTcfQQL0W8SKjwH1J/RFdjNG8sR04VIrKhB588xs=;
  b=h27/VkXNM9ljRa6RlhUth93z6DwWUNk78FwMGxU3t4es4KzuECJxBYiN
   7r83QA6AWxozKVKvSe3Sr77Xh3Qyk6CNHzyUskOJmSfrD9NWmqfVUqVV4
   SGfiJB6ICL8mwZd+0Gq1EOf7oqj7LQSVTlojrTnOnMJWWvvT3NnEvFZfD
   6WofSFDaB9fVIGk93S6YyYmWUe5zpoLeRXzgn8Y2Gunc6Zb52lcpb24EU
   XNxzo+iAm+EDGNy2nznY5uaRdyw+IkwhUXF75f6OFz78mafVGVNAZV9g1
   k8hb7hkUBuwXm0T0eFiRkulvALkL1Lb5kGI2+/eAIia8jdtyaFDPwp/QI
   w==;
X-CSE-ConnectionGUID: 7kwZFq9iTlel/o7TE4J0+Q==
X-CSE-MsgGUID: 1J155+zNQaG+6jgTG9LvNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="67269111"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="67269111"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 08:22:20 -0800
X-CSE-ConnectionGUID: LuESA6GvQA+3RmOZbXuIrA==
X-CSE-MsgGUID: afKwVPVLSQ+kCZuawhhQBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="204043124"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.232])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 08:22:19 -0800
Date: Mon, 22 Dec 2025 17:22:12 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, bingbu.cao@linux.intel.com, 
	tian.shu.qiu@intel.com, antti.laakso@linux.intel.com
Subject: Re: [PATCH 01/13] media: ipu6: Ensure stream_mutex is acquired when
 dealing with node list
Message-ID: <nvheuhadny3ta3bacuksl6osvpbg2lqbzgkgtyxampfrtm3jwi@6ogcv5zk2po4>
References: <20251219095829.2830843-1-sakari.ailus@linux.intel.com>
 <20251219095829.2830843-2-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219095829.2830843-2-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patches!

On Fri, Dec 19, 2025 at 11:58:17AM +0200, Sakari Ailus wrote:
> The ipu6 isys driver maintains the list of video buffer queues related to
> a stream (in ipu6 context streams on the same CSI-2 virtual channel) and
> this list is modified through VIDIOC_STREAMON and VIDIOC_STREAMOFF IOCTLs.
> Ensure the common mutex is acquired when accessing the linked list, i.e.
> the isys device context's stream_mutex.
> 
> Add a lockdep assert to ipu6_isys_get_buffer_list() and switch to guard()

while at it, would you want to switch to guard() for the stream->mutex
in the vb2_ops callbacks: start_streaming() and buf_queue(). It will
significantly improve the functions. Or maybe in a separate patch ?

--
Kind Regards
Mehdi Djait

