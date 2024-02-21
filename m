Return-Path: <linux-media+bounces-5562-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CA785D876
	for <lists+linux-media@lfdr.de>; Wed, 21 Feb 2024 13:56:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57E921C22B76
	for <lists+linux-media@lfdr.de>; Wed, 21 Feb 2024 12:56:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E297869D21;
	Wed, 21 Feb 2024 12:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f+YhwHlI"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5716996A
	for <linux-media@vger.kernel.org>; Wed, 21 Feb 2024 12:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708520135; cv=none; b=SEfSwzdVoDZKI0sMiqd0UVUjsFd+pBkqX/Pef8d5lJYyVMpYYkeQX5uNVINn1zT1nH8kKZG22HPMAubONf32RPqkhBZpXwEW0i8Fu38v85EhgdvMXCTw/Xkfh0F+6VcLRoCnwKtkao8OxSmB7Kjn7KXfMXwDUf6ABaaVcBjmWJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708520135; c=relaxed/simple;
	bh=lPF26loLMbUavGykZKMJhUC56GyN7cblVBRvj9pB8fM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T+SeWx3yCvf/7vbc2fmidrSLGxvaMmBxCVmaqeGT6DaXJLc6ixEF4HNn57KFXVWBUo/pzsv+iJCCGG4YqcwX+Xn4nJxm+97R+bG/Yr1HuMCMfU9x64HTbLQUnEaWnK2EAUfKXP0twgTzTc9VrQjsB8dm1tmKQzY6VXnoZbziNTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f+YhwHlI; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708520132; x=1740056132;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lPF26loLMbUavGykZKMJhUC56GyN7cblVBRvj9pB8fM=;
  b=f+YhwHlId5CjDCDSiK6xg+GN8SY4v2BBbkeHbJhcrvYS46EpHbyV8EoS
   ZFW5i7E5SLf1Oi2/BF4MZZa0FyHqGhPmU70V/S+rRblgfpMtc8WpuKsMD
   eVG4+gGgwbNjwWAD2AUVclbFMD00fFD47s3QcCZsyVBMnbsgebxDbAAXP
   g/Uopkrx9hF5NcnPSTXN7addIPXfQYEWMgA303liEZhjhGV2wcrUz/POp
   5RyTtJr+zMIlB8fobUO89K6tqkafR+zLkd9ZOLJLt+v9wAMQMTmQ5Jx9c
   I6dgfYbjCg82WrsogriVPmvH15bvzXZ/rI0N+EGzYhtozlo3G2Kve4FW8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="6507804"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="6507804"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 04:55:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="5504780"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 04:55:30 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id C470F11F855;
	Wed, 21 Feb 2024 14:55:26 +0200 (EET)
Date: Wed, 21 Feb 2024 12:55:26 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v2 04/29] media: mc: utilize new cdev_device_add helper
 function
Message-ID: <ZdXyvv4fjvvBP7Pf@kekkonen.localdomain>
References: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
 <20231220103713.113386-5-sakari.ailus@linux.intel.com>
 <20240207093817.GF2827@pendragon.ideasonboard.com>
 <20240207095137.GD23702@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240207095137.GD23702@pendragon.ideasonboard.com>

Hi Laurent,

On Wed, Feb 07, 2024 at 11:51:37AM +0200, Laurent Pinchart wrote:
> On Wed, Feb 07, 2024 at 11:38:18AM +0200, Laurent Pinchart wrote:
> > Hi Sakari,
> > 
> > Thank you for the patch.
> > 
> > On Wed, Dec 20, 2023 at 12:36:48PM +0200, Sakari Ailus wrote:
> > > From: Logan Gunthorpe <logang@deltatee.com>
> > > 
> > > Replace the open coded registration of the cdev and dev with the
> > > new device_add_cdev() helper. The helper replaces a common pattern by
> > > taking the proper reference against the parent device and adding both
> > > the cdev and the device.
> > > 
> > > Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
> > > Acked-by: Hans Verkuil <hans.verkuil@cisco.com>
> > > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > 
> > This reapplies a commit you've reverted in 02/29 in this series. I
> > understand this is done to be able to apply the revert in 03/29 cleanly.
> > Given that those three patches are consecutive, wouldn't it be better to
> > squash 02/29, 03/29 and 04/29, with the commit message of 03/29 ?
> > Otherwise, I would at least drop the Acked-by and Reviewed-by tags in
> > the patches you reapply, as they've been reviewed in a different
> > context.
> > 
> > The same applies to patches 05/29, 06/29 and 07/29.
> 
> And especially to those patches actually. 06/29 has a single line change
> for the uvcvideo driver, the revert in 05/29 and re-revert in 07/29 seem
> overkill.

The revert can't be applied as-is otherwise but I'm fine merging them.

> 
> It would also be nice to expand the commit messages of 03/29 and 06/29
> to explain why the revert are needed.

I can add that. These are basically improvements in the code but depend on
commit a087ce704b80. Conceptually, it'd get quite difficult as what's
really needed here is to get back to an earlier state, this is not
development over the said commit.

I'll drop the acks.

-- 
Regards,

Sakari Ailus

