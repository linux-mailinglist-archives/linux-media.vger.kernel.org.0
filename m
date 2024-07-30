Return-Path: <linux-media+bounces-15540-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73EB5940B8B
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 10:28:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A55351C23434
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 08:28:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C22DA19ADA4;
	Tue, 30 Jul 2024 08:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B3FEoQJ7"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B18A194C8A;
	Tue, 30 Jul 2024 08:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722327901; cv=none; b=nt+8XNWRmMjrObXM1E1TbR2t57IN6gNnJzJvkrdkcyg50KGeqo+y+GLXY68nDY9mu6gGaUFZ1RnnP3f2eqIHC4Dn+PKcc2K9rb8+JzrT2Cb44VTkUaHzf+0sBVIz8oXMQgAOiE72eUlxAtXRl8tMkvuUk82hJLB6tNR81wC8/KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722327901; c=relaxed/simple;
	bh=3qC6W9FW48cV0VFz5lrWHh7WKfGts00F2ln5gY2CJ6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gNZXpjLSWYYWfg8IufZiSs1akZfUPk8LboSTspauIObz6fV9X6I9y9bxT3euaUgugJDas9UwMqUuJBvC7HxDOdCJFxY0REYP4QllxUAbo9FMSy4+xZUbSESmy9oDDmj4vLnFBntH6nIMo1nHqcJWHQ83v+tQvix2SRGeeFus328=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B3FEoQJ7; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722327899; x=1753863899;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3qC6W9FW48cV0VFz5lrWHh7WKfGts00F2ln5gY2CJ6o=;
  b=B3FEoQJ7JHpddv3x0Xwz8Oz1JwtkgDS99ylPUO6iaZ91RCZ5Kzi1lXL+
   JDZAFn6PTTs9u/H4UJbASJE3ndf40WVcq0SJbRKTMEJkEbe2DtQRDvuEt
   gOjwXGB2QWUOJeiomvmh9YeN8MFXONoRJ03pqZzAz7eLdwu3oTMx9N05s
   IVFrf7JVywYPoFEuoIsrgMFahNx1LhWz8xtw2+mm1ZXcQ5ELx71gIlnDK
   uvdrPv3ju79yhftmzh7xE84zZmpAfT16OHHgv287OIbGbQ5ap2Lgh8IKC
   Eeh52l6r/TlZSdEuLNImS6QxESk11ikMteTDTKBJiCb8cGuZGoESg6Ee5
   A==;
X-CSE-ConnectionGUID: IsMMx/JYSfe1y3XHuVKHEw==
X-CSE-MsgGUID: vul82WgXQS+pwVj7bXpj7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="12785605"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="12785605"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2024 01:24:58 -0700
X-CSE-ConnectionGUID: 1vBdw10iQVCOWoYqCw6w5A==
X-CSE-MsgGUID: GY+qAnyzTRSrZJ8Cpf6zOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="59336062"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2024 01:24:57 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E171311F811;
	Tue, 30 Jul 2024 11:24:53 +0300 (EEST)
Date: Tue, 30 Jul 2024 08:24:53 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Umang Jain <umang.jain@ideasonboard.com>, linux-media@vger.kernel.org,
	stable@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 2/2] media: imx335: Fix reset-gpio handling
Message-ID: <ZqijVf68ZQuFGKhU@kekkonen.localdomain>
References: <20240729110437.199428-1-umang.jain@ideasonboard.com>
 <20240729110437.199428-3-umang.jain@ideasonboard.com>
 <ef05c39a-ad5c-4751-a758-f73a2d114823@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef05c39a-ad5c-4751-a758-f73a2d114823@kernel.org>

Hi Krzysztof,

On Mon, Jul 29, 2024 at 04:09:39PM +0200, Krzysztof Kozlowski wrote:
> On 29/07/2024 13:04, Umang Jain wrote:
> > Rectify the logical value of reset-gpio so that it is set to
> > 0 (disabled) during power-on and to 1 (enabled) during power-off.
> > 
> > Meanwhile at it, set the reset-gpio to GPIO_OUT_HIGH at initialization
> > time to make sure it starts off in reset.
> > 
> > Fixes: 45d19b5fb9ae ("media: i2c: Add imx335 camera sensor driver")
> > Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> > ---
> >  drivers/media/i2c/imx335.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> 
> This will break all the users, so no. At least not without mentioning
> ABI break and some sort of investigating how customers or users are
> affected.

I know the original authors aren't using the driver anymore and it took
quite a bit of time until others started to contribute to it so I suspect
the driver hasn't been in use for that long. There are no instances of the
device in the in-kernel DTS either.

Any DTS author should have also noticed the issue but of course there's a
risk someone could have just changed the polarity and not bothered to chech
what it was supposed to be.

I agree the commit message should be more vocal about the effects on
existing DTS.

-- 
Kind regards,

Sakari Ailus

