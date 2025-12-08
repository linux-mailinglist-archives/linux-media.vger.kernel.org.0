Return-Path: <linux-media+bounces-48395-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD4ECACFFA
	for <lists+linux-media@lfdr.de>; Mon, 08 Dec 2025 12:28:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 504DD304E555
	for <lists+linux-media@lfdr.de>; Mon,  8 Dec 2025 11:27:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D01E9313537;
	Mon,  8 Dec 2025 11:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BAKr1EA1"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E3D3B8D7E;
	Mon,  8 Dec 2025 11:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765193221; cv=none; b=CLpplVhHnoyKhVxqwZemii8V9cjAkGhIxs0+UEVMbERkhylgOf+f7htvTZXCGsEujL9QiojllKlU0g/N8MoDXR3bS0KX8Lk0rC7Km+mNTRnuXaCTuYtHmEFoKhxLMnzr+w6iYY412mGrQD0fDzYgZ1Xj0Txo35eFFQgLpysFWcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765193221; c=relaxed/simple;
	bh=8TK0z9g2TG4c9mm0ptsGqYfvqmJs4L0BChHEIzmR0g4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qJsAbIlBV1jGmGClei57OkDUp26ooCOyllqeTsT05A7QFWmPJOck/IxQX0ElPVdpQFGg2iQi7qupXQRKygMrDPOzbsZ0/hn6uTXxAE3iymJWVjBv+0LLggojzKNhWuPVUk8ExWLYeLjKfyh2XTcpOtZ2nv1ocb5KMgiUYJqYCbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BAKr1EA1; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765193220; x=1796729220;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8TK0z9g2TG4c9mm0ptsGqYfvqmJs4L0BChHEIzmR0g4=;
  b=BAKr1EA1zIBUy41tJE2+8K+3g/B4V2tQhlGAYX7H2epxsWe43SeE7+Xl
   Nhc3uMyanvX7IA/8D27RcY5Y1arUUA4ox3J+C4ownF7W4ZkHTxRpI9BdM
   rceUFGGELYfhRErgUfL2SpK8CJ1DMbr/urpEqS+lJzDFcaYnHsUkN6F1Z
   OFuz9QZwccQZj0ss+mxTA+E5lh5lHzbGJawFx55EEilf9iNwPPiR8R4mE
   XRzNqkJfd+cFrU3Q8RmcD74sW+ohdyOBQNAlFIROru67C4oafB2bhbYnY
   JZBiZII3qIF/3rsQ2BuTucNiX7FXpsPT9T1BUbzvmBvCNTls59sf0ivfU
   g==;
X-CSE-ConnectionGUID: hsQf6QQLRKGaTft2ZRi9nw==
X-CSE-MsgGUID: zd/2XjpjS6Gi15uvjW3mCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67062394"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="67062394"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 03:26:59 -0800
X-CSE-ConnectionGUID: qWuj+ijiSyKcLpgvip9zNA==
X-CSE-MsgGUID: nGnpMCE7QMutp4ZR1cPf4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="194967023"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.255])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 03:26:57 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 6E0C71207CE;
	Mon, 08 Dec 2025 13:27:03 +0200 (EET)
Date: Mon, 8 Dec 2025 13:27:03 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hao Yao <hao.yao@intel.com>
Cc: platform-driver-x86@vger.kernel.org, johannes.goede@oss.qualcomm.com,
	dan.scally@ideasonboard.com, ilpo.jarvinen@linux.intel.com,
	bingbu.cao@intel.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] platform/x86: int3472: Use actual clock frequency for
 DSM method
Message-ID: <aTa2B3p-6PmJR6DZ@kekkonen.localdomain>
References: <20251208035122.2147678-1-hao.yao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251208035122.2147678-1-hao.yao@intel.com>

Hi Hao,

On Mon, Dec 08, 2025 at 11:51:14AM +0800, Hao Yao wrote:
> The third argument (args[2]) to the _DSM method was hardcoded to 1,
> which corresponds to 19.2MHz. However, this argument should reflect
> the actual clock frequency from the sensor's ACPI data.
> 
> According to the DSM specification:
> - 1 = 19.2MHz
> - 3 = 24MHz
> 
> Read the frequency from clk->frequency and set the DSM argument
> accordingly, with 19.2MHz as the default for unsupported frequencies.
> 
> This ensures the sensor receives the correct clock frequency as
> specified in its ACPI configuration.
> 
> Signed-off-by: Hao Yao <hao.yao@intel.com>

Thanks for the update.

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Kind regards,

Sakari Ailus

