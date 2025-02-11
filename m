Return-Path: <linux-media+bounces-26007-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6922FA30F63
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 16:14:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97CA93A2506
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 15:14:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2829B253B6C;
	Tue, 11 Feb 2025 15:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jA6eaqUT"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E5B2512F1;
	Tue, 11 Feb 2025 15:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739286826; cv=none; b=K4289SYQaGCRkM3t73+MkovjDXxdsGWbNxJsQdrlRVA/x+VY8weAuHHiAIUjwrtT0BBnHa4xXYKKmAwnly6t8DNp2nfoW/pjBsK5OEd3/oz3eKRmhfyVhH1Q8kUBLSehUirYxMjeB3GQOlJgMwPqOMJxbNEVwANZkBTl9peRrpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739286826; c=relaxed/simple;
	bh=xylAchuR2cIHzidtaeBV3LQBinHKdr9a/tRrIgpY0BY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ihOWSxanrz/gUb7NKTgt7FOBwGOFAhSz5g7N7i/kVrJAaJPUCix2BixS3A8Bty1QBZ20BjSt4YLj7u6jAMZqAekZDXcdAAjBAzqq1X1+INw2uvNmclLOKnIpJ7SHy6m0wWLoEPJXMhHnZSJy4heSs3ujVLxj6mYNWRZcpdPwsBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jA6eaqUT; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739286825; x=1770822825;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=xylAchuR2cIHzidtaeBV3LQBinHKdr9a/tRrIgpY0BY=;
  b=jA6eaqUTEsSjBnPgfa8XXY4dM+VFPvBN2HuGOl1eIDrFqHE71MoFo8vH
   xCP3GP0OJfyCv76/mQvqs9sK6o/Z1hvRZX/+rsJ3DKT4YZ1O30njS2QHg
   uThzfQSHpx6Ag3F44TEAgFG3TrIeDKnP1bCYUD/CYyCmuIHs0yKZdzQ7p
   HtS0Il3pEQSVoHkdo7csaZAdgiP04xGC7uNzGubQkeFGJxciUtO4Pjm01
   x6cVvl1QltWe6InOKkWMS7Uw+ge8pRq0R/n0o9ybs/7guVEKsJHiJu5F2
   ehaHYl4O4rE6x3BQQxHOeR6M4zVZdVBeTU6pnkUPIez2LCW4xIOV2Ce4A
   g==;
X-CSE-ConnectionGUID: a73bcn9EQvK0StmX2wCfhg==
X-CSE-MsgGUID: qyoYGPrgT7G5cHGai9VQiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="51303596"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="51303596"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 07:13:44 -0800
X-CSE-ConnectionGUID: Lj/hSzQ8SNCg6FziJ3dkCw==
X-CSE-MsgGUID: zu6Y0bGxTwS3D0UlepAMmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="112506832"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 07:13:43 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1thrxD-0000000AXYX-1YuK;
	Tue, 11 Feb 2025 17:13:39 +0200
Date: Tue, 11 Feb 2025 17:13:39 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v7 0/3] int3472: Support GPIO con_id based on _HID
Message-ID: <Z6tpI_zUbpXEr8qr@smile.fi.intel.com>
References: <20250211072841.7713-1-sakari.ailus@linux.intel.com>
 <Z6shGGy2FPVc5mEK@smile.fi.intel.com>
 <64b617e1-bf52-442e-be56-71c76d973edd@redhat.com>
 <1938d858-6d66-69f8-5952-9cecf133f254@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1938d858-6d66-69f8-5952-9cecf133f254@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Feb 11, 2025 at 04:32:12PM +0200, Ilpo Järvinen wrote:
> On Tue, 11 Feb 2025, Hans de Goede wrote:

...

> Currently, these don't appear in lore for some reason (not in 
> patchwork)...

FWIW, lore seems down. DDoS on kernel.org? (I dunno)

> Sakari, could you please resend the series v7 so that it hopefully gets 
> picked up by lore and is easier for me to apply them using the normal 
> tools I've.

Usually lore picks them up when it restores. But it's up to you, of course,
how to proceed. Just my 2c.

-- 
With Best Regards,
Andy Shevchenko



