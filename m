Return-Path: <linux-media+bounces-17594-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C23896BDC4
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 15:06:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 085F51F22331
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 13:06:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 136761DA604;
	Wed,  4 Sep 2024 13:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OgiEeODp"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368D2145FE8;
	Wed,  4 Sep 2024 13:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725455036; cv=none; b=usArwLd4bmBjpEh9w6d7unegUh4zpiS8MwYZTXuY1Rpv+XxfGdXH/fO+9dqAresyiZLUXMJx2eyajtz8jAC9ilipO3Ba5B6zAErjp03Lzcj5g2iYV154Yoc9PboYVmUUaZ3lOgA4CrsxaynY1PwiSi3UUJi5dLrfLE791oSF9Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725455036; c=relaxed/simple;
	bh=XYrv5Im3UF6Cr/OTer2kdUigx2ShsFKliFTySrse5yE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZO7VvNSMChIKEp0gMqaZ7zxY4ovuHfEUmc+QUuoab5BLkkBL+KYBW65QIadMKPNTvOQuKtvYy5e82Gw1kanUkEdV4z/hCHyLcamKwet8HAHdOXFkBDiGSCXQDC2HYHGjs7B7N17mQ3I2roP4jq0thhxKDSO64t7BxvZ9kb0En7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OgiEeODp; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725455035; x=1756991035;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XYrv5Im3UF6Cr/OTer2kdUigx2ShsFKliFTySrse5yE=;
  b=OgiEeODpq8vVJYiE0AZ9O8wpkhhkjgjSRATJgRyYCSmrcWQX1ePtC/LW
   1bKS0qEv6d4hp2E2XrxbPNE1zL+rfXjQGV38DTX1ZszGxCDIZ7YgsY/v3
   LtfTEQVg8tCA25SFgXxrcNYT1Z8w/kvjI1TcAsewWq4vsA2zwSJ+QiPEF
   sOf/RbNi6C2/Dw9i1Fbmi6RJ+/h7N4HCQnVgNbkZp2xy7DvG2tYspRAqD
   zarEJoqwFOy/gyC5X2pPuUHCYevL29yKSQDURWS54YGJKNDX0+MlaH5Wm
   FA9vO+CcfLTIKZQiDsZ0URAMaCTVLIX4LdsJgxeIFKV0wx3BVNZmr1hxK
   g==;
X-CSE-ConnectionGUID: B4NFVII1TPeS4PEKOID4pQ==
X-CSE-MsgGUID: iwjtueVwRzyNYy4zKLNjfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="35273048"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="35273048"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 06:03:54 -0700
X-CSE-ConnectionGUID: Epo/PiqbRLaNh/GBz78qiA==
X-CSE-MsgGUID: L2Mv48utTrKSjGXXZObmvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="65106445"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 06:03:53 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 3788011F811;
	Wed,  4 Sep 2024 16:03:50 +0300 (EEST)
Date: Wed, 4 Sep 2024 13:03:50 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tommaso Merciai <tomm.merciai@gmail.com>
Cc: linuxfancy@googlegroups.com, michael.roeder@avnet.eu,
	julien.massot@collabora.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] media: i2c: max96717: add test pattern ctrl
Message-ID: <ZthatrCgOKDwP7Ro@kekkonen.localdomain>
References: <20240627151806.3999400-1-tomm.merciai@gmail.com>
 <20240627151806.3999400-2-tomm.merciai@gmail.com>
 <Zs7HQxieYEVJ9-5X@kekkonen.localdomain>
 <ZthYYwNM9ggZzX/K@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <ZthaMIMJykFLrOKC@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZthaMIMJykFLrOKC@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>

Hi Tommaso,

On Wed, Sep 04, 2024 at 03:01:36PM +0200, Tommaso Merciai wrote:
> On Wed, Sep 04, 2024 at 02:53:55PM +0200, Tommaso Merciai wrote:
> > Hi Sakari,
> > Sorry for delay and thanks for reviewing this.

No problem.

> > 
> > On Wed, Aug 28, 2024 at 06:44:19AM +0000, Sakari Ailus wrote:
> > > >  	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
> > > 
> > > With controls, you should add the HAS_EVENTS flag.
> > > 
> > > I'll take this one as we're in rc5 already, please address these in a
> > > separate patch.
> > 
> > 
> > Will send a patch for this. 
> > I think we should fix that also into max96717 driver or I'm wrong?
> 
> max96714 sorry.

Yes, please.

-- 
Kind regards,

Sakari Ailus

