Return-Path: <linux-media+bounces-28014-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E33EA5BC94
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 10:46:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E524D3A68DF
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 09:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7D2E1EFFBB;
	Tue, 11 Mar 2025 09:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MnLaHEYA"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3181DE4CC;
	Tue, 11 Mar 2025 09:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741686400; cv=none; b=tdopS3Hl0snqzdmgwBGesl4U7R+48mSxqwUXwSNGAa0O9bJHQ/vmNKzN5P9pJ+vRvll4cQj6rkiA5mkZ6sylzp2UCtFL8pkIgm6Crry4ksDCPyHxqAdVsNnjz/DZOU1A/i056XPs9mptWMJD3rx24+tlWeW98mUasPJ6r8/TDTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741686400; c=relaxed/simple;
	bh=b1wG5aEm4jUY9AjL337oYXys81MYKzcODDs+/+d+EO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i7y5vYsxI78FjO9510YiZMkD9Z7sNmFgxfu3s4fOGlsMSlKRsJigLrt9//q5ST148UHfTGiR/J8AScTlvcs8ofEe0ghP4enu08oFIGTMqFpEmZXAiDcQDEsWHgzl8YuxEwpu7vnJEQQvKblplYc2zNqMKUh1tVH8HO2fF8SHF48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MnLaHEYA; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741686398; x=1773222398;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=b1wG5aEm4jUY9AjL337oYXys81MYKzcODDs+/+d+EO0=;
  b=MnLaHEYAfNQpoFX1cM3eKEIcQ+ovn5miNEogxGR2oKERbiexoibox+RB
   Rrx+9Q0M+AGmP4Ezy/jkIJPQTzjeb+5Ahp32tqHbbGvdwsTRUCQmgNXzV
   3vEpmfPP65hteo010J1pqQancfX4pMF9GjsMmWhZ2Id3l7+oPqV1xygo+
   ZWTnU/pLtKRwb+IODOBzFSePnAOy9EjY2WwP7isNP7N3Hc1pRku1mIsOm
   GOphk2QmOzHKOTLFBX3SXr1cWnLE0Flcy9cz1bKS8jRWmMomQ+mKkJqHi
   CldfJtLw+BjbQq1jhU0NhQ3vgGvVURTA2f5rmzhxtcruu0GH/4ZtLnSBh
   g==;
X-CSE-ConnectionGUID: MJFMC8u5QpeLZrtcJTff7Q==
X-CSE-MsgGUID: NK7DUqoPSWGD9dgAifPObQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="42842175"
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; 
   d="scan'208";a="42842175"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 02:46:38 -0700
X-CSE-ConnectionGUID: dusUJ33MQSuVoPjtWEqqLw==
X-CSE-MsgGUID: dWo2rMMoRTyZjmeaB7+NEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; 
   d="scan'208";a="125168279"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 02:46:34 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5796911F7F2;
	Tue, 11 Mar 2025 11:46:32 +0200 (EET)
Date: Tue, 11 Mar 2025 09:46:32 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Shravan.Chippa@microchip.com
Cc: laurent.pinchart@ideasonboard.com, tarang.raval@siliconsignals.io,
	kieran.bingham@ideasonboard.com, mchehab@kernel.org,
	hverkuil@xs4all.nl, umang.jain@ideasonboard.com,
	zhi.mao@mediatek.com, julien.massot@collabora.com,
	mike.rudenko@gmail.com, benjamin.mugnier@foss.st.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] media: i2c: imx334: Convert to CCI register access
 helpers
Message-ID: <Z9AGeIA-207RuGQ0@kekkonen.localdomain>
References: <20250310071751.151382-1-tarang.raval@siliconsignals.io>
 <20250310071751.151382-3-tarang.raval@siliconsignals.io>
 <PH0PR11MB5611A568DC879D4206FDE76681D12@PH0PR11MB5611.namprd11.prod.outlook.com>
 <20250311063849.GB29331@pendragon.ideasonboard.com>
 <PH0PR11MB5611257EF7BF21EA7617008881D12@PH0PR11MB5611.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PH0PR11MB5611257EF7BF21EA7617008881D12@PH0PR11MB5611.namprd11.prod.outlook.com>

Hi Shravan, Tarang,

On Tue, Mar 11, 2025 at 06:51:48AM +0000, Shravan.Chippa@microchip.com wrote:
> Hi Laurent,
> 
> > -----Original Message-----
> > From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Sent: Tuesday, March 11, 2025 12:09 PM
> > To: shravan Chippa - I35088 <Shravan.Chippa@microchip.com>
> > Cc: tarang.raval@siliconsignals.io; sakari.ailus@linux.intel.com;
> > kieran.bingham@ideasonboard.com; mchehab@kernel.org;
> > hverkuil@xs4all.nl; umang.jain@ideasonboard.com; zhi.mao@mediatek.com;
> > julien.massot@collabora.com; mike.rudenko@gmail.com;
> > benjamin.mugnier@foss.st.com; linux-media@vger.kernel.org; linux-
> > kernel@vger.kernel.org
> > Subject: Re: [PATCH 2/6] media: i2c: imx334: Convert to CCI register access
> > helpers
> > 
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the
> > content is safe
> > 
> > Hi Shravan,
> > 
> > On Tue, Mar 11, 2025 at 06:14:28AM +0000, Shravan.Chippa@microchip.com
> > wrote:
> > > Hi Tarang,
> > >
> > > Thanks for the patch series with CCI register access helpers on top of
> > > my patches I have tested (1080p,720p, 480p resolution only) and
> > > working on my board with small PLL changes to make it compatible with
> > > pfsoc board (mpfs-video-kit).
> > 
> > Could you please provide more information about what those PLL changes are
> > ?
> 
> Here is the change for mpfs-video-kit board.
> 
> diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
> index 375367314416..30470dbd1f3c 100644
> --- a/drivers/media/i2c/imx334.c
> +++ b/drivers/media/i2c/imx334.c
> @@ -236,9 +236,9 @@ static const struct cci_reg_sequence common_mode_regs[] = {
>         { IMX334_REG_XVS_XHS_OUTSEL, 0x20},
>         { IMX334_REG_XVS_XHS_DRV, 0x0f},
>         { IMX334_REG_BCWAIT_TIME, 0x3b},
> -       { IMX334_REG_CPWAIT_TIME, 0x2a},
> +       { IMX334_REG_CPWAIT_TIME, 0x29},

A patch converting the driver to use V4L2 CCI / human-readable register
names should not change the values written.

This change is exactly the same than your 2nd patch does. It'd be good to
understand why it is different and what is effect of that difference.

>         { IMX334_REG_INCKSEL1, 0x0129},
> -       { IMX334_REG_INCKSEL2, 0x06},
> +       { IMX334_REG_INCKSEL2, 0x0a},

This is a bigger change indeed.

>         { IMX334_REG_INCKSEL3, 0xa0},
>         { IMX334_REG_INCKSEL4, 0x7e},
>         { IMX334_REG_SYS_MODE, 0x02},

-- 
Regards,

Sakari Ailus

