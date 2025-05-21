Return-Path: <linux-media+bounces-33018-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D180ABF3EB
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 14:14:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E73816AFF1
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 12:14:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CD36266B77;
	Wed, 21 May 2025 12:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aAZagPXE"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C13264FA6
	for <linux-media@vger.kernel.org>; Wed, 21 May 2025 12:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747829660; cv=none; b=YPSd5dDz3PO/TDlNtOp4NcY/unMKS2e38VZSWv6Yc7Rco59YZaVUUO26veD8SDbbMVvERQ6ewXo10kq1q2QaXgG/GEmHHSHt8vHHZ+LJr/h8929wo7thqkQoGO5Z9z+3CAYn2g3DqNPLADYJipw3sl+kkezfbzhOwd2Q0zluvP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747829660; c=relaxed/simple;
	bh=gTNj5oY74nbf/wF7bCZFcu0xFJhBfJvcw8eqi29huYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MZyWsq9UlB3Yp2CpyRlIIWGVdq0gEmitCKJ0YvsOmU+udGrqHPK5MLg11NUMMSAXJq6+BK1MA/elbXTogVTpC71uedpLQKPAT7X/2hI6JtOtQNLclxkOBBbKYJ0VMtYN9yUzmMcNNAotIU7L8VGIEl5a/s0nQGpgplNDdYPHCvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aAZagPXE; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747829659; x=1779365659;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gTNj5oY74nbf/wF7bCZFcu0xFJhBfJvcw8eqi29huYg=;
  b=aAZagPXELhHojtwnonyarofIBgMVYxvjreGVsZIIbMIhMP+R4ncr9p4L
   FIyFItDBGz0yFpIZ7KpF8KQznMany48AoIc89m8BxXjEKnOgRIrCeVjuY
   UM22VGCR9qd9o3lZMlaZcPZnZb7JZoB8yBDLCHkeHlxXb15IFZSKLS/++
   DDB2CcZgTpgyjDiYC3aGnxwdAgdXiAcPBrqDIptuhTUvhwuC1vRcnb74B
   kU9QBkJE/AaUMGBiMjd9PiPwQFUrpDulkaJ+87f8HePdpdEMEAc6uSJem
   5RsnsMxxxJ/cL0TyjCKRhRNBdUH9a89boHvhyQQq4Hj9Bxrdg8R/4JaYn
   A==;
X-CSE-ConnectionGUID: icDTARDMS3e6sK8kYsbHHg==
X-CSE-MsgGUID: qTfIcOomQkSGuM0s5VKVvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="60040060"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="60040060"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 05:14:19 -0700
X-CSE-ConnectionGUID: O8sW7k0qTxKPT8DUc43gTw==
X-CSE-MsgGUID: mv/zkygsStiWgadulz90ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="140568747"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.129])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 05:14:16 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 6AE3511F746;
	Wed, 21 May 2025 15:14:14 +0300 (EEST)
Date: Wed, 21 May 2025 12:14:14 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl
Subject: Re: [PATCH 1/1] media: v4l2-ctrls: Don't reset handler's error in
 v4l2_ctrl_handler_free()
Message-ID: <aC3Dlgu9OiYAhoPq@kekkonen.localdomain>
References: <20250508160852.1090549-1-sakari.ailus@linux.intel.com>
 <20250521120242.GJ12514@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521120242.GJ12514@pendragon.ideasonboard.com>

Hi Laurent,

On Wed, May 21, 2025 at 02:02:42PM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.

Thank you for the review!

> 
> On Thu, May 08, 2025 at 07:08:52PM +0300, Sakari Ailus wrote:
> > It's a common pattern in drivers to free the control handler's resources
> > and then return the handler's error code on drivers' error handling paths.
> > Alas, the v4l2_ctrl_handler_free() function also zeroes the error field,
> > effectively indicating successful return to the caller.
> > 
> > There's no apparent need to touch the error field while releasing the
> > control handler's resources and cleaning up stale pointers. Not touching
> > the handler's error field is a more certain way to address this problem
> > than changing all the users, in which case the pattern would be likely to
> > re-emerge in new drivers.
> > 
> > Do just that, don't touch the control handler's error field in
> > v4l2_ctrl_handler_free().
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> > Hi all,
> > 
> > This is currently affecting the following drivers:
> > 
> > 	drivers/media/i2c/imx334.c
> > 	drivers/media/i2c/imx335.c
> > 	drivers/media/i2c/imx412.c
> > 	drivers/media/i2c/ov2740.c
> > 	drivers/media/i2c/ov5675.c
> > 	drivers/media/i2c/ov9282.c
> > 	drivers/media/pci/tw68/tw68-core.c
> > 	drivers/media/platform/samsung/s5p-jpeg/jpeg-core.c
> > 	drivers/media/platform/samsung/s3c-camif/camif-capture.c
> > 	drivers/media/platform/verisilicon/hantro_drv.c
> > 	drivers/media/test-drivers/visl/visl-core.c
> > 
> > The fact that one of them is a test driver tells a lot. :-)
> > 
> > The patch is untested. If we agree to do this, the patch should probably
> > be cc'd to stable, too.
> > 
> > - Sakari
> > 
> >  drivers/media/v4l2-core/v4l2-ctrls-core.c | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> > index 90d25329661e..932aedc26049 100644
> > --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> > +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> > @@ -1661,7 +1661,6 @@ void v4l2_ctrl_handler_free(struct v4l2_ctrl_handler *hdl)
> >  	kvfree(hdl->buckets);
> >  	hdl->buckets = NULL;
> >  	hdl->cached = NULL;
> > -	hdl->error = 0;
> >  	mutex_unlock(hdl->lock);
> >  	mutex_destroy(&hdl->_lock);
> 
> The function could even return hdl->error, in which case drivers could
> do
> 
> 	if (handler->error)
> 		return v4l2_ctrl_handler_free(handler);
> 
> Up to you. The change is good either way.

I agree. But I'll add another patch for that. This one should be backported
whereas the return type change probably shouldn't.

-- 
Regards,

Sakari Ailus

