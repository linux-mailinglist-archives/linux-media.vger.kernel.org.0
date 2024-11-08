Return-Path: <linux-media+bounces-21140-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BD19C19C2
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 11:04:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DFA911F21B78
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 10:04:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34D901DF271;
	Fri,  8 Nov 2024 10:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hBGYQptc"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6E61D1506
	for <linux-media@vger.kernel.org>; Fri,  8 Nov 2024 10:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731060248; cv=none; b=V8d3iEfKo6apRGo0BC2MaizMG+13UwjTMTEFgi4GWog2tEBBN4KSwgiqoFACQsDGVauI0HjPNjjIPj/yphasr7SOFGXge+Wl134C7z4aaHDY1NGy0nQZ+wNbhyBx4iYc+XBZMhbIR1on2WGQU3UucMR37P9SLgt1iCdw/rOdi/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731060248; c=relaxed/simple;
	bh=p1N/I6jQyeLBCVvz6kwxpkTRQVQmfH3fqUa9UGMIZBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y4oBiVNHSSTB+r3iD7huIo08nMoNcaTzim5sGZP0exWIhtF4dj6IXEzxCQUi5Kvtly6lPVTloGd/UW2JDm9UOu5h1dVqQcBi+SP1BAmkUgFnQ5qiBRn/sscnIixCGAgMqWWAlNpGDarG0VhseGNar6kCpSWSUxtv3kdTzIvdRhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hBGYQptc; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731060247; x=1762596247;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=p1N/I6jQyeLBCVvz6kwxpkTRQVQmfH3fqUa9UGMIZBc=;
  b=hBGYQptcWdmBWaCxF6FKmDmpuyGg/b8PGX3QgRkaRY0a5q3KoqcrOk+Y
   gmmbyXZGp7Q+oaLBkzeJ9k9WNalkj0LbM5Nc0GhksbU35ZUz1/vDeS8FC
   ZcYPvgsH+vo+tJR4C8YdbZ7kraZE7WAoRu0OorRqJLM8SkuYRHNE0eASW
   AorRai+lxH4I1nDNlbFhn7NzN3f1eF0g8QZyYYPVQ2fse2gOgHLPXDlQR
   RfJPZAgRu7Hs6r8JKQAmpjUpvryXAhoDwG2S0cVQT0u6qUsQceRp+CHzR
   fMwRP/aE7Pcs/e+S7/rb9sXpPylLnPhhDy+pH2kUKi6LboOFVXOl1vlcv
   A==;
X-CSE-ConnectionGUID: D2n4DSawTkq5AiKSJLpdXA==
X-CSE-MsgGUID: bShm2+neRyKf9KSKwoXu5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="34876192"
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; 
   d="scan'208";a="34876192"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 02:04:07 -0800
X-CSE-ConnectionGUID: 2leKsDTdQce1eH6GTmjmQg==
X-CSE-MsgGUID: q7lq1I9RQcusn2M5i1Ahng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; 
   d="scan'208";a="85011551"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 02:04:06 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 924DF11F9BF;
	Fri,  8 Nov 2024 12:04:03 +0200 (EET)
Date: Fri, 8 Nov 2024 10:04:03 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCHv4] media: vicodec: add V4L2_CID_MIN_BUFFERS_FOR_* controls
Message-ID: <Zy3iExCeAw2rk2dS@kekkonen.localdomain>
References: <4d8762ba-2b72-485f-936c-1c9bd8a200e2@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4d8762ba-2b72-485f-936c-1c9bd8a200e2@xs4all.nl>

On Fri, Nov 08, 2024 at 09:44:46AM +0100, Hans Verkuil wrote:
> Stateful codecs must support the V4L2_CID_MIN_BUFFERS_FOR_OUTPUT
> and V4L2_CID_MIN_BUFFERS_FOR_CAPTURE controls. The vicodec driver
> was missing support for these controls. Add them.
> 
> Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus

