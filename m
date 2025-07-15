Return-Path: <linux-media+bounces-37746-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 61440B053CE
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 09:55:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 499844E2845
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 07:53:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56F8C273D7C;
	Tue, 15 Jul 2025 07:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IgVvjAdH"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3BB27381E;
	Tue, 15 Jul 2025 07:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752566040; cv=none; b=DhE+SInD7Cj5CDgiMcJSGW9FLonq8X0FbxJ55de2Vv/DrKuZZ59a0eYOBmBDXVmF+eISSalOz/y13QDhgX3DSWBVJZ536z0zHRmm/zWtPRTxf27CpPC7KApXqdMf96UJSxdX0/6t/rpx3m2NVpde+4FYXPh6VmStobW5Oqx0XmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752566040; c=relaxed/simple;
	bh=H4m5oSC1nR2AarBZa1hl5JXW8yLzj74JwgaA7Evvw0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gmz63/vq7bo2/zJIuWsaET9IqtDOHNI8CbLAjXsaig0Zdn79v+FRFmKhX/MXIqVeBQPLQRaKib2wOprtZjGijUXF7svZw+UW/Uc6Ts+wbLgl2r1wKh9G/ppQNUJjrw40ztgNUZ9S31qtwazfI3AKwMERMFf+1Bc6y6l6YlGgRvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IgVvjAdH; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752566039; x=1784102039;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=H4m5oSC1nR2AarBZa1hl5JXW8yLzj74JwgaA7Evvw0I=;
  b=IgVvjAdHZMzme6XULwOz/IfDmLZ0g7B+HbHt302MAStWfZRBlcMYAdwX
   LSG2qG+MTXA4dpB0f8W6JU6WffBqR89fVH8MxGyR7VtkMAx5mY9eNe1WB
   ElBSrIcwQIbtmozk0FCxmDIcLY/bi6sNYfKii7yxqCE9JPV44UIS4fQQR
   5ZHb2xc/ezv/R5HMz5YuubHH3jKcpGwoWCHu5WtT3zRm7TLDHbCW5OZ/e
   RCoEYhhmXp577wAG44UY8wOf0YQZNK51O9qRaD9eEDhoEllSC6DAS5Cku
   hUw1o/hb20J5bEfdp8xUTCV1hwSTdwIya1rWQaTL43d+d9HVTGlio6+YA
   w==;
X-CSE-ConnectionGUID: dIea24HhQM6oNRk2LWprYQ==
X-CSE-MsgGUID: A2kykONaTrGSf714RVTJLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="58582310"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="58582310"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 00:53:58 -0700
X-CSE-ConnectionGUID: yDNdncTuSLWNm6oACd43GA==
X-CSE-MsgGUID: BIMPCaf0SzSxiLLpr+0Slg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="157247490"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 00:53:55 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ubaU4-0000000FaZK-0oqx;
	Tue, 15 Jul 2025 10:53:52 +0300
Date: Tue, 15 Jul 2025 10:53:51 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Martin Weidenauer <martin@weidenauer.cc>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	andy@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, ~lkcamp/patches@lists.sr.ht,
	koike@igalia.com
Subject: Re: [PATCH] staging: atomisp: isp: fix open brace on new line
Message-ID: <aHYJD4aJDOxZJmQT@smile.fi.intel.com>
References: <20250714153409.46085-1-martin@weidenauer.cc>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714153409.46085-1-martin@weidenauer.cc>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jul 14, 2025 at 05:34:09PM +0200, Martin Weidenauer wrote:
> Fix checkpatch error "ERROR: that open brace { should be on the previous line"
> in ia_css_dvs.host.c:277.

...


> Hi, I hope this should fix the indentation problems.

Missed versioning and changelog, but otherwise okay.
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



