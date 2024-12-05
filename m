Return-Path: <linux-media+bounces-22693-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C49279E522E
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 11:26:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B8032165278
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 10:26:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB40F1D63C4;
	Thu,  5 Dec 2024 09:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nFHZ22q7"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED72E1D5ACD
	for <linux-media@vger.kernel.org>; Thu,  5 Dec 2024 09:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733392252; cv=none; b=HG8Y5/pZMPXCnLRCJrQW2pil28s2neOVImB/l1UQiFuM9Q49tg8kb4FBxJVds1Vmbj2BAnV4XpJS9ZYPhzHvv3zP9+KLahIDMU6HaIQhaaxSJB49gnMzi8Y+e8KUZaTQn55YTkPCeE2s24K9Owjtomi7cVETO+oruqTD5/V6nsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733392252; c=relaxed/simple;
	bh=po6z1CMdNGbuCZnUjj23vNUbf0dJGWRpKy+D9qzRy6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IslsGuO0wzl9ThaqNpKhyDl0GYHRJB6uDxbNwlrEemjupxJtFwI7M19ClMZQgI2CPUbcdxIjD3yqCClt92ierwZZVVU7toPqt6lCsy6vQXYstmgqsq+pnFkp6iKLylMrNwCvtoufvV7eexkdAxDsy6dX0ZifyzPm9SjAdWuVkck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nFHZ22q7; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733392251; x=1764928251;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=po6z1CMdNGbuCZnUjj23vNUbf0dJGWRpKy+D9qzRy6Y=;
  b=nFHZ22q7yZK2Psp0jcXjPYNpS03K4cncNA+iSNd42j7kCWgsENDYe3T/
   FnMdn7iaEfq6Y/QhEoK78wNAGoDniDy60l+Wh0ATOOOB83/ie04jIL5QQ
   zOdFyIcz0tcASfOwgJm7yphNyFwiekwhTDa0dm7RR4q93bEgD9zSrqDE+
   Ja5zPpcfPi9WLZ+xeXJjRk2zvdkXUYErAJUwpROxXO8GOrIL8vUpdbqyc
   65qyJeYiLbM9ajlE9KZbiPgkaufXC3yFcerRAVMSGGmPVEIyYSs4h3kBe
   w7iNdGjXfEvKznX04WOFC35WwUhBvoSIR8L3FRAqQkSwJcOb4zCJVum2a
   w==;
X-CSE-ConnectionGUID: NDu7c0aYQ7qHAniu4b80wg==
X-CSE-MsgGUID: D5pxXxdLT0GT/ic99WSg+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="45074925"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="45074925"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 01:50:46 -0800
X-CSE-ConnectionGUID: +Tlu9w1/T/maJ1ysRE7PeA==
X-CSE-MsgGUID: LnCvtB5QT+K4lpGHObHRIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="93936994"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 01:50:43 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id DB16011F775;
	Thu,  5 Dec 2024 11:50:39 +0200 (EET)
Date: Thu, 5 Dec 2024 09:50:39 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [v3,00/15] media: i2c: ds90ub9xx: Misc fixes and improvements
Message-ID: <Z1F3b4_U264hRxI0@kekkonen.localdomain>
References: <20241204-ub9xx-fixes-v3-0-a933c109b323@ideasonboard.com>
 <67505692.920a0220.1e4a28.5c89@mx.google.com>
 <dce7f8d3-f682-448a-982b-3890f223bedf@ideasonboard.com>
 <Z1FvOiiNbl7jrqil@kekkonen.localdomain>
 <CANiDSCt173zrs2pWEWXNYpVwzmi67cyPQTuYDcpiKMLwoAPifA@mail.gmail.com>
 <d44c87d2-c550-414c-b993-c74fc8acc804@ideasonboard.com>
 <CANiDSCs0=SPP=u_O-5UAzJ0U_u9qBvLpk2B-+SVjyZfCwd5hnw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiDSCs0=SPP=u_O-5UAzJ0U_u9qBvLpk2B-+SVjyZfCwd5hnw@mail.gmail.com>

Hi Ricardo,

On Thu, Dec 05, 2024 at 10:46:31AM +0100, Ricardo Ribalda wrote:
> Sorry for the inconvenience

Thank you for your invaluable work on it.

-- 
Sakari Ailus

