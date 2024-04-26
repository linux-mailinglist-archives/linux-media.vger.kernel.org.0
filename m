Return-Path: <linux-media+bounces-10164-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9C38B3139
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 09:19:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B9AE1C2228A
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 07:19:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6493B13BC14;
	Fri, 26 Apr 2024 07:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d3TN97VQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F160713C3D1
	for <linux-media@vger.kernel.org>; Fri, 26 Apr 2024 07:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714115938; cv=none; b=lhTZtGQON0tfj0Um4VnEWBpXOtnexYjc92+vxWZf4VlIJ52dTR0f5ZPysKQudRpOj+6nQBVE1ft42iU2UIESGLvHifJDpLhfiI/STKhZEL+ATjP0iFju/XI/hhbHQJ0brlG/MwFw5SK9YVB8Vw3ON0XAFgWgN9IxZDrvZZH88LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714115938; c=relaxed/simple;
	bh=i51cUumCxHJyqnJWbx9khBBwewfTha1mDi7PYh0i/1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AnpXzNq9GAHgnYLHNMHYHOOezPQ9I0GiXzAGjYif6jWdKwYSbUCh6+PVKE1qXPcidqIpFbbeo+iw+qENOGiU0OT/QtN1wDe5TVbv5fiaKk9FwLtsiQ0ZIvKB0Tb3SNNe84vao5/s+mH/MSoWk8DhbXUTspaCP7VOanTWLQmdy2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d3TN97VQ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714115937; x=1745651937;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=i51cUumCxHJyqnJWbx9khBBwewfTha1mDi7PYh0i/1Q=;
  b=d3TN97VQjB/n8VPKSiyMdCgTTHYSmmLk+SSFM2ksJ/tg8UpwFyvsAUvg
   c3QLWcHVAlF6H1TECHZdkQbqjfvkE/hAOFLOs9W3/M/HJmI3PzWUN+ByP
   8K3YbYXuJ4uH/oSXUc6UFbtyi8HwBFlKraUarpfrZPwVH1WrOGaqkg9ai
   VYz3UObYwt/HGepGSCBpFGhOqvfsw3XU6AeG1Dc2gQINXrfLnACOGODeL
   JTirow3zTCbFhPyvWRbrXn2+14+/tObgRHxeEoe0M992iNcdZac3DhfRf
   jaNKsYGcy7RezL9FfOeWh2N3AhqT/ggYNiYG6zmXRyw+T2NdTm9YfLXbm
   w==;
X-CSE-ConnectionGUID: U3GrN9F4Rf+ZEqXuOC0npQ==
X-CSE-MsgGUID: zwRbY+SeTZeX2rbdQxui6w==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="12778749"
X-IronPort-AV: E=Sophos;i="6.07,231,1708416000"; 
   d="scan'208";a="12778749"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 00:18:55 -0700
X-CSE-ConnectionGUID: YNlyr8JWQGqZoXhInHiD4Q==
X-CSE-MsgGUID: +vcQWAUTQyeiu6oRVF5tuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,231,1708416000"; 
   d="scan'208";a="29991493"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 00:18:55 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 6DB7511F855;
	Fri, 26 Apr 2024 10:18:51 +0300 (EEST)
Date: Fri, 26 Apr 2024 07:18:51 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Wentong Wu <wentong.wu@intel.com>
Subject: Re: [PATCH 0/3] Use INTEGER64 type for MEI CSI LINK_FREQ control
Message-ID: <ZitVW9RehFpp8cDi@kekkonen.localdomain>
References: <20240220130339.543749-1-sakari.ailus@linux.intel.com>
 <87a038f6-2834-49fd-9afa-eeee355f6c5b@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a038f6-2834-49fd-9afa-eeee355f6c5b@xs4all.nl>

Hi Hans,

On Fri, Apr 26, 2024 at 09:12:32AM +0200, Hans Verkuil wrote:
> Hi Sakari,
> 
> On 20/02/2024 14:03, Sakari Ailus wrote:
> > Hi folks,
> > 
> > An integer menu isn't a useful control type for conveying the frequency
> > depending on an external device to the receiver. Instead, in the MEI CSI
> > driver, just obtain the link frequency from the upsteam sub-device and
> > pass it on to the receiver.
> > 
> > The v4l2_get_link_freq() is changed to add support for this and it's
> > documented as well.
> > 
> > Sakari Ailus (3):
> >   media: v4l: Support obtaining link frequency from INTEGER64 controls
> >   media: Documentation: v4l: LINK_FREQ can be an INTEGER64 control
> 
> I'm not sure if you can do this. This means userspace has to support two
> different types as well and query what to use. That's an ABI change.
> 
> >   media: ivsc: csi: Fix link frequency control behaviour
> 
> And this third patch marks the control as VOLATILE, which is wrong. It is a
> normal read-only control and you can just update the control's value in
> the driver whenever it needs changing.
> 
> I would comment in the patch itself, but for some reason I never got it.
> 
> I am dropping these three patches from the PR you sent.

Fair enough. The IVSC takes the frequency from the upstream sub-device so
it doesn't have a list of frequencies on its own. One alternative might be
to use always the highest frequency, assuming this can be found from the
upstream sub-device but I don't know whether this would actually work.

Do you know, Wentong?

The current state of using a static value is not an option.

-- 
Regards,

Sakari Ailus

