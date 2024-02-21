Return-Path: <linux-media+bounces-5544-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BEA85D61C
	for <lists+linux-media@lfdr.de>; Wed, 21 Feb 2024 11:55:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED71A1F241D6
	for <lists+linux-media@lfdr.de>; Wed, 21 Feb 2024 10:55:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03CE93D974;
	Wed, 21 Feb 2024 10:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FyybqgMk"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216334C62
	for <linux-media@vger.kernel.org>; Wed, 21 Feb 2024 10:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708512926; cv=none; b=QoPhYP14jEouJP3iYE3OyHasBEPAFsBwO8ksVo8nFw81rK1ZpnN/zjPxlZDvjyqHiBa54XNN7JMCoSNtMPebRHM66UCZs6NWf6FlPvA7Mi1KrYKofslvvR7DyGYPfWIQJvWx4lZyO4CbYFcdfTr1ThMcnepriCsK56VpKk/kcBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708512926; c=relaxed/simple;
	bh=fxx/YV8qUB36GXBwCaqg0tntuU7mFDzUWgMHKdTIlqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GG7Nc7SESi5Bcu8MPTH7I3/ljnGP/LcNtb0KOh0h5wEeKDgiAT0FtHC/SXhiJ6truY9sZER6XDxBLMV30esdftcc2LrX13PJhcKvVij3USY8AZPC56agEQFmt+9K9zzt9PcxA5yS7OxH9AKJv2Ftnmi338q96GKNgsMZXnmLK6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FyybqgMk; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708512925; x=1740048925;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fxx/YV8qUB36GXBwCaqg0tntuU7mFDzUWgMHKdTIlqk=;
  b=FyybqgMke3G0nqcWkJc7kGrbR5oyUS0lL0gVyphaKCedcnui3dqWAMi7
   ByRrXYR1U+lhMPj/1y1LmUilyTaXXlXJZ2Wv4DOiqy4P2qyqXZSIjzHAO
   Xt+m7U5E1JRZa5ZV5Y6uT/Z23UoU1hb9f7sKfkSqqaOJni19qJmoI7C3n
   aBLqbFg9aEIIp2DlsWe2HF9iU02e7ue1WAsOs5bHnkQT9jz8fRSIcltk1
   dVFl825tauTj2C/9C65wbMoW51KYKGAWdp11RmhoqQuvBahrv3in6HAys
   FO/JdAUZCJP0QjWT4t/lgDtb89Zd2ec2Ud5M7wowy4z4kcUsc+hub5ENF
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="13785979"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="13785979"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 02:55:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="5460160"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 02:55:24 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 08B7B11F855;
	Wed, 21 Feb 2024 12:55:21 +0200 (EET)
Date: Wed, 21 Feb 2024 10:55:21 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 23/29] media: vimc: Release resources on media device
 release
Message-ID: <ZdXWmYq2Zs6Ivoj3@kekkonen.localdomain>
References: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
 <20231220103713.113386-24-sakari.ailus@linux.intel.com>
 <5f37ef41-151e-4320-8921-06e32a936818@xs4all.nl>
 <20240207143805.GT23702@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240207143805.GT23702@pendragon.ideasonboard.com>

Hi Laurent,

On Wed, Feb 07, 2024 at 04:38:05PM +0200, Laurent Pinchart wrote:
> On Mon, Feb 05, 2024 at 04:02:24PM +0100, Hans Verkuil wrote:
> > On 20/12/2023 11:37, Sakari Ailus wrote:
> > > Release all the resources when the media device is related, moving away
> 
> s/related/released/
> 
> > > form the struct v4l2_device used for that purpose.
> > 
> > form -> from
> 
> Please explain *why* in the commit message.

Just to show how the media device release callback is used. I'll add that
to the commit message.

-- 
Regards,

Sakari Ailus

