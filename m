Return-Path: <linux-media+bounces-14227-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB20919FF2
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 09:04:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC3371F2A15A
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 07:04:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4196646450;
	Thu, 27 Jun 2024 07:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XXPa5Jm0"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8994317C
	for <linux-media@vger.kernel.org>; Thu, 27 Jun 2024 07:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719471855; cv=none; b=MGi+5N+66c+2cjvJt2dQfQoVvrApHSeS4tsZafgswIlMV+osVjG9wrThIE0SbsTETBddjIGNlKC1m02+4MnMgwBlV5mSIccjUexXGwp+rqd2HEyqwQZSGAPORQNFUE7A4zRtKpyzHkcj9J9zxDF5HVKiLWo1Xj8ezm064psu7Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719471855; c=relaxed/simple;
	bh=UNOp+9OuOUIgaULYC/u3mc/UT9+kLl+aPiNawfaMlos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hx9g3c1dO6QZ5/R5XetnYgB7Jtye5w6ipC9vuxHm/Wr4nJoAklnaNmXzRMFvjMU3PfrLkczh/f3NgzhfL8XEVHPiEBcwWeKlQCryRq5PlePUtZy4DT4rcdK2T6iw70vSqqTSJot2/n0HaS82E1rQSdU2dh+Svnm0klXKkV8/GJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XXPa5Jm0; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719471853; x=1751007853;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UNOp+9OuOUIgaULYC/u3mc/UT9+kLl+aPiNawfaMlos=;
  b=XXPa5Jm0eSFM1eJf0ACYzO3Id08bKNWfaNFowhwSDsXDeMQvUZ1CIS4F
   jWh6QucsfTXp1Wx/RIlKOtFJ39ci1pFuUfuVDYO1extojdKGdktf/MJYm
   874kNKub1I2QytLJRFVHnkP7sbs5Vk8qgRfDfI7M5JmbFSo4i8Zn73yC1
   lAuzJ9uB0jWo8FL3JMWtzn8ZHLbksUlt72XMJkpFS9NeSkKKBBmXtHws4
   U78gTxqSGuTBo9H48X3o+FEdKTYZN8GTEk4cvyMl2ieDhuypdrD35Aduz
   3/BPJJ40BFbP0GMmKgrDxqORoVdNUlfh2u56bhGD9Mb94eLv2owgjtRjR
   w==;
X-CSE-ConnectionGUID: qXKp8y0wR0W4+TCyVfcmTQ==
X-CSE-MsgGUID: nuzoycsxSTqd9p3ZqO266w==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="16804936"
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="scan'208";a="16804936"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 00:04:13 -0700
X-CSE-ConnectionGUID: nc2KlST5S/2Q4808059iYA==
X-CSE-MsgGUID: NFwG+VuyTk+EgLzlnZTgSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="scan'208";a="81827883"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 00:04:12 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 7CF2311F965;
	Thu, 27 Jun 2024 10:04:09 +0300 (EEST)
Date: Thu, 27 Jun 2024 07:04:09 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v4 01/26] Revert "[media] media: fix media devnode
 ioctl/syscall and unregister race"
Message-ID: <Zn0O6bEcStV86Fnb@kekkonen.localdomain>
References: <20240610100530.1107771-1-sakari.ailus@linux.intel.com>
 <20240610100530.1107771-2-sakari.ailus@linux.intel.com>
 <82710537-76e0-4715-b000-cf9df9cadfe8@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <82710537-76e0-4715-b000-cf9df9cadfe8@xs4all.nl>

Hi Hans,

On Thu, Jun 27, 2024 at 08:53:22AM +0200, Hans Verkuil wrote:
> On 10/06/2024 12:05, Sakari Ailus wrote:
> > This reverts commit 6f0dd24a084a ("[media] media: fix media devnode
> > ioctl/syscall and unregister race"). The commit was part of an original
> > patchset to avoid crashes when an unregistering device is in use.
> 
> Reverting all these old commits and then adding back some of the code that
> was removed is IMHO a bad idea.
> 
> I took patches 1-8 and just folded them all together, and the end result
> was *much* easier to review. And the resulting patch can be cleaned up a
> bit as there are some unnecessary changes included (e.g. a cec change).
> 
> With all the reverts and then reinstating code I also have little confidence
> in the quality of the code if you have to do a git bisect later and you
> end up in the middle of patches 1-8: it is far better to just do a single
> patch. Effectively it is embedding devnode in media_device, so just do
> that.

The reverts shouldn't really need a review as we're just reverting to an
earlier state of affairs in MC codebase. As you probably noticed, over the
first 8 patches there is little more than reverts while the rest are fixes
(as well as some preparation for what follows). So from review point of
view I do prefer the current state of the first 8 patches.

I'd like to have Laurent's opinion on this, too.

-- 
Kind regards,

Sakari Ailus

