Return-Path: <linux-media+bounces-4596-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 821E9846B4B
	for <lists+linux-media@lfdr.de>; Fri,  2 Feb 2024 09:54:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C95D2882C9
	for <lists+linux-media@lfdr.de>; Fri,  2 Feb 2024 08:54:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99F8D604A7;
	Fri,  2 Feb 2024 08:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bAFwCoxc"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931065FDB1
	for <linux-media@vger.kernel.org>; Fri,  2 Feb 2024 08:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706864035; cv=none; b=n1HN4T6njIRUPHGcrOtt2XgP6+NLDfyw/9QWLkA1zfkkUmFZvr+XZbq8+15JHMsKneg7FTXt5xIsVOG2Z5ez9YMwNkZ/3STHubkLp/OIZEFHVV8IaMYsSi96XO4IcpBezUwldBbADCXMxLFvfLOq4JPVixujxv9BufXed03C8dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706864035; c=relaxed/simple;
	bh=NzgXuy8F6rNscu28DhnICfNxZOiLgcxdJhQIETdOx0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nWddvAdUQ8Vgx5ZwBPaQuII/rHRD7hTUuiVWX6z394p2GoODLFMDzLRETV5mIRQuGEfiUlrugqJb5dIDhEUwFfMlN2ivmtimK9EWv+ziM9bBqgkKVaFgEEOe4iJvHxdBVD117mBX2MPNf1Ob7iLoYe8u5MutDf2cnymo9vDMw6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bAFwCoxc; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706864034; x=1738400034;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NzgXuy8F6rNscu28DhnICfNxZOiLgcxdJhQIETdOx0s=;
  b=bAFwCoxcuaXYXHslF+1LQRPcPwFWtD2Hc81ExXKsm0C4819AL1dJSKSU
   ajkHd9TOjguQrlxE/wHu9KzYuUG+0udQJzYnwLcKuuUIl8wnWMss6V6z+
   LRllTjYEyRrHJWzVZMb5VzncHYbhm7849YdX6IM/ySGucZ/tdjhJf4Rdx
   GNobDpCvEHsVU3IljxJtKaalH8aCWg+uYD9GDqT9zkNquCVB7vieZNt3k
   7pNj8iXvDrzUwzpUA7oo8IRcMfcKNHr7/Fv1dqF7x5SK0OFYSIJ8hY/wm
   72k53avjUeOQmldwDyDD4FWNJjt8aYseg1k9pzKtQZA3/mdWn9nrF2kuo
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="11478665"
X-IronPort-AV: E=Sophos;i="6.05,237,1701158400"; 
   d="scan'208";a="11478665"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2024 00:53:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="823163484"
X-IronPort-AV: E=Sophos;i="6.05,237,1701158400"; 
   d="scan'208";a="823163484"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2024 00:53:52 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id DC80111FB1F;
	Fri,  2 Feb 2024 10:47:23 +0200 (EET)
Date: Fri, 2 Feb 2024 08:47:23 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH] media: v4l2-common.h: kerneldoc: correctly format return
 values
Message-ID: <ZbysG-sUu9jf3fwQ@kekkonen.localdomain>
References: <d38e25c0-a508-46d9-97cd-a50d31483c82@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d38e25c0-a508-46d9-97cd-a50d31483c82@xs4all.nl>

Hi Hans,

On Fri, Feb 02, 2024 at 09:25:44AM +0100, Hans Verkuil wrote:
> Building the kerneldoc resulted in two errors:
> 
> Documentation/media/driver-api/v4l2-common:6: ./include/media/v4l2-common.h:566: ERROR: Unexpected indentation.
> Documentation/media/driver-api/v4l2-common:6: ./include/media/v4l2-common.h:567: WARNING: Block quote ends without a blank line; unexpected unindent.
> 
> Format v4l2_link_freq_to_bitmap according to the kerneldoc standard.
> The v4l2_fill_pixfmt_mp function also had incorrect return value formatting,
> although that didn't report an error/warning, but it looked ugly in the
> generated documentation. So fix that one as well.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Fixes: a68e88e2cf9e ("media: v4l: Add a helper for setting up link-frequencies control")

I wrote a patch to address these as well but I think yours is better.

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Regards,

Sakari Ailus

