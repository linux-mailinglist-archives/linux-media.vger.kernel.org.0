Return-Path: <linux-media+bounces-15539-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 044BA940B25
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 10:18:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC5F51F236E4
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 08:18:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD9FC1922FD;
	Tue, 30 Jul 2024 08:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LbEaj2IQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217BC190070;
	Tue, 30 Jul 2024 08:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722327482; cv=none; b=Wbk+EYOUdAX43RDjDYTMMZn4CQqCxio+nDB59hZXDbTypZHUJV3mEClXDyNzMbldzE3QVE9D16XiFFrvBMKiiErsR2LQx/g4plnX60i1cCaF7q4k4mQ0ZA/tf6+nu9ZdK1SaMIf+s8NG9brG5e57pL4GxUOb2M66k0iq2Gphzfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722327482; c=relaxed/simple;
	bh=/wx00LB1UDOPlkDIDGa4ZHNot3BGGu04+K/hGqymoJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QRcoFojR9icMBFnev0xGQplnvZL2SaNbGJzKgdm8XRqfSHKK/Kn3Ky1DuaUs/RAiBE2MZQazM2/1JII+Ww7VkV17OuMwCEYuHc7hFC2LMAQYiDnhehkjAsvts/G4CsVAYGgAHvhuiUVFOn3XqjqXz+S/ZtvOQ+f0C/eKcn0j8E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LbEaj2IQ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722327481; x=1753863481;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/wx00LB1UDOPlkDIDGa4ZHNot3BGGu04+K/hGqymoJg=;
  b=LbEaj2IQDTNd3dF/GI8FAhZuT6JmsfC0qG6ObIO7pz1m6qfXX6ik8krs
   FO0uZvRjd1eJCcd3Oq5HhY/LHGvIQzBIPcAjyqe1s9EzuUeF9e5HUdm2V
   SbZLi6qpIgjDZa+zePDqiQZDE4ubkyKEljOME/s4TZwbziuwy/Eu7EtED
   RHvDUPtxStB1dMAzX782HKoNCGQDUn9qoFhVVTOR89aoD/pIOgxLQNT5Q
   f1qdhdxtoViHq7BM6WRW4vKPZIfO/wDw/+bhHAbR0cg58cFpODzYXISK8
   WF3Y2oAMCX+4PX/qmm59dKl4MkDmd4t4eNo/GsuV8OE7mVPV80Xpdi6OS
   g==;
X-CSE-ConnectionGUID: R8saw8X8T1Swsxu6sm9a7Q==
X-CSE-MsgGUID: zOSAelpxSyCvEQGKfCjZYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="30754258"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="30754258"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2024 01:17:58 -0700
X-CSE-ConnectionGUID: VtPKXJ9gQD2hoF9u0c4R3g==
X-CSE-MsgGUID: OPhiJOPwSc2r6cEDmEymTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="77495042"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2024 01:17:56 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 6742611F811;
	Tue, 30 Jul 2024 11:17:53 +0300 (EEST)
Date: Tue, 30 Jul 2024 08:17:53 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Umang Jain <umang.jain@ideasonboard.com>, linux-media@vger.kernel.org,
	stable@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v2 2/2] media: imx335: Fix reset-gpio handling
Message-ID: <ZqihsXM_6yNlTAuB@kekkonen.localdomain>
References: <20240729110437.199428-1-umang.jain@ideasonboard.com>
 <20240729110437.199428-3-umang.jain@ideasonboard.com>
 <20240729111315.GI2320@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240729111315.GI2320@pendragon.ideasonboard.com>

On Mon, Jul 29, 2024 at 02:13:15PM +0300, Laurent Pinchart wrote:
> > @@ -1171,7 +1171,7 @@ static int imx335_power_on(struct device *dev)
> >  	usleep_range(500, 550); /* Tlow */
> >  
> >  	/* Set XCLR */
> 
> I would replace this with
> 
> 	/* Deassert the reset (XCLR) signal. */
> 
> or something similar.

On my behalf the comment could be removed as well, it's not informative.

-- 
Sakari Ailus

