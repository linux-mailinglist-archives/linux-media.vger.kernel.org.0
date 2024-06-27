Return-Path: <linux-media+bounces-14239-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F7A91A510
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 13:26:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D26CD1F24131
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 11:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3C8F14A08E;
	Thu, 27 Jun 2024 11:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="al0/LmKD"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5A81487FF;
	Thu, 27 Jun 2024 11:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719487564; cv=none; b=bVypeJGTzycOM8yzb9SdD9vptLsKXE3gHwBlzEvOfkvTjflvaK4dLcSRgorDhM28qXCKVd3mScPR+VY79WXdpnT90vaLOla61hBf0p6DzwgCw5yODaJ6J6gNgKWTDWW5/LjwAgWy8VvCv+5v0OM6ypw8RSXkeUJhoPLKqiczIFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719487564; c=relaxed/simple;
	bh=baiPqPs3/Iq9ZzbQ7EO36Y/N0NPP8/8QjXTkbyX3mVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XjTldmClcJrcmLYCzAdQly56I+NF36d6RPim7OFjQN8bsQivIR7QcVaviFtifY3MenRLhhmfOLNWcM7EsN6vwc6t5PSV1m+kQQdB5lWv3dDx17nJk4J3mp0+nnnjQFJ6FBRZHQWl+gyKXS/WI1nQh10CLpMj3fJarT0FdNf2o9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=al0/LmKD; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719487563; x=1751023563;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=baiPqPs3/Iq9ZzbQ7EO36Y/N0NPP8/8QjXTkbyX3mVw=;
  b=al0/LmKDrfpdni4gGyuXFLmJj1tedXI0Dg2Zz3aAstBCv+UtWKyTkOy7
   NBIc4Ai15OiCOeN9dbOTSKYs4v0avXM05cFpQuVi0PasjYOzqEfMTWy48
   cuNdoIEYGfdCPk+kq5fIipW0eNrE/oj5AtVqWPuXOdFczBzUHtvAmBOds
   VcC2+aB/Rj6gfq0pO8tVEoGis5ZUkntkRBgbtwoT2mew917OqSTS3crFm
   VMtpBFRH/ypSyCzW9tvvvZ5Xc5+lcNyiCZVnBMB2kh9yRmnAWgh/OVTt5
   awZyHN7fG+leN3cz8Qqc9YDoJOgq+bV8xLx+wQ49N8thQFg0f7NTB+MYD
   g==;
X-CSE-ConnectionGUID: LU8/RzL8SQKHT435niIpFQ==
X-CSE-MsgGUID: afuRPxU/TZ+KOmieZZRWjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="34060935"
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; 
   d="scan'208";a="34060935"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 04:26:02 -0700
X-CSE-ConnectionGUID: Uw9447FYSVqqXGdO8N1WRg==
X-CSE-MsgGUID: 8Sy0b0wRTSuGWWkr005ZXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; 
   d="scan'208";a="45095644"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 04:25:59 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 7D44C11F9C0;
	Thu, 27 Jun 2024 14:25:56 +0300 (EEST)
Date: Thu, 27 Jun 2024 11:25:56 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Alain Volmat <alain.volmat@foss.st.com>,
	Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	stable@vger.kernel.org, linux-media@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: stm32: dcmipp: correct error handling in
 dcmipp_create_subdevs
Message-ID: <Zn1MRH--5ZWddOVQ@kekkonen.localdomain>
References: <20240624084123.3009122-1-alain.volmat@foss.st.com>
 <8587b6cd-2d04-4a2e-b298-e57c792332f1@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8587b6cd-2d04-4a2e-b298-e57c792332f1@xs4all.nl>

Hi Hans,

On Thu, Jun 27, 2024 at 01:17:55PM +0200, Hans Verkuil wrote:
> On 24/06/2024 10:41, Alain Volmat wrote:
> > Correct error handling within the dcmipp_create_subdevs by properly
> > decrementing the i counter when releasing the subdeves.
> > 
> > Fixes: 28e0f3772296 ("media: stm32-dcmipp: STM32 DCMIPP camera interface driver")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> > ---
> >  drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
> > index 4acc3b90d03a..4924ee36cfda 100644
> > --- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
> > +++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
> > @@ -202,7 +202,7 @@ static int dcmipp_create_subdevs(struct dcmipp_device *dcmipp)
> >  	return 0;
> >  
> >  err_init_entity:
> > -	while (i > 0)
> > +	while (i-- > 0)
> >  		dcmipp->pipe_cfg->ents[i - 1].release(dcmipp->entity[i - 1]);
> >  	return ret;
> >  }
> 
> I accidentally merged this one, but this patch isn't right.
> 
> After this change the [i - 1] indices should be changed to [i].
> If i == 1, then the while condition is true, but now i == 0 in the
> actual statement, so you access out-of-bounds values.

Right. I think the best way to fix this would be to just remove "- 1"
inside the array indices. One could think this as a different bug but of
course with an unpleasant side effect which you get after fixing the first
bug.

> 
> I decided to revert it, since it is better to just get stuck in the
> while loop, then to crash.
> 
> But a new patch is needed for this.

-- 
Regards,

Sakari Ailus

