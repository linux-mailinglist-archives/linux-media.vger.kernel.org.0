Return-Path: <linux-media+bounces-8144-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FFB890CC0
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 22:56:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 491E51F2615A
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 21:56:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69C4F13AD04;
	Thu, 28 Mar 2024 21:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gH1ahNyJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3900E651B2
	for <linux-media@vger.kernel.org>; Thu, 28 Mar 2024 21:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711662955; cv=none; b=fxZZpQR1Yz0d9s9TDISaCS2WTIB6R/jqynlWAyh08w5faPeHYpfH/7/w42ESeYGge9lNyCCMcIhPQhJi/rmXCfDxO9ZaO6DyAqOifSLWYO5LfEQejyZENMxd3pMegsirdz5cruFwa4hps2/PJRQoBKqSIIRoV/hj7ZQHzygwkw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711662955; c=relaxed/simple;
	bh=PwHGRnL5cG30j1XIt9nsj9CDXqBf3lvnNovbBS5RZHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kZ4tcH0vKxM5YLP3NDrKUN/0alSfYNougCzMdwOMQXnFmeWEY1JaPVqLO46+6Jlptire47phd8B63f7MndLiaR+kVQ/lOCqoFdVYZfiTGhscvfFJjZIY6ZiDCg0cnacSZoPUgOSuwxzxO7rwNGuvn38w92rsxaiAe2aHVP9WloY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gH1ahNyJ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711662954; x=1743198954;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PwHGRnL5cG30j1XIt9nsj9CDXqBf3lvnNovbBS5RZHg=;
  b=gH1ahNyJX7ECseK11+ZiRChXKiMy16mRbyn5AI3CJtOHh/OCjJ8Q/Irq
   0x2Hxo1ANPghs4fqXmdkxpI5baBVVkHgftQZ5XDvOEqS31fW9pzLIUKop
   SQ8NDtLuAslKfNMwLmEOF0r/9kAwyLW2CAb5RZaKGkr762Edt8xednmPC
   9ivvKdFgpKGDuhEBW7Jky2XCUTeKFDWkxSnFwE/nE4AcMpJplzveizydB
   UwgM7bz/htuvq9sEcAIIGD7Bw6AMSSQ48E4MPa8BjganUYhta6HHTh45M
   rcHWN2jvpKVAdAS9/BoSOEZo7pVn6HDLsQ/iocOWNueA4c41G8jdTu4Tz
   w==;
X-CSE-ConnectionGUID: YC8F795UTSutt7v/V0PP9A==
X-CSE-MsgGUID: B2L/9xk/QmSXBmMKaY0KYg==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="6681623"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="6681623"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 14:55:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="54242343"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 14:55:50 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 14E0D11F8B1;
	Thu, 28 Mar 2024 23:55:48 +0200 (EET)
Date: Thu, 28 Mar 2024 21:55:48 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: rmfrfs@gmail.com, hansg@kernel.org, linux-media@vger.kernel.org,
	laurent.pinchart@ideasonboard.com, Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH 1/2] media: ov2680: Allow probing if link-frequencies is
 absent
Message-ID: <ZgXnZKhhOdpD4beP@kekkonen.localdomain>
References: <20240328051320.2428125-1-festevam@gmail.com>
 <ZgUiP2WnaAWnJ207@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZgUiP2WnaAWnJ207@kekkonen.localdomain>

On Thu, Mar 28, 2024 at 07:54:41AM +0000, Sakari Ailus wrote:
> Hi Fabio,
> 
> On Thu, Mar 28, 2024 at 02:13:19AM -0300, Fabio Estevam wrote:
> > From: Fabio Estevam <festevam@denx.de>
> > 
> > Since commit 63b0cd30b78e ("media: ov2680: Add bus-cfg / endpoint
> > property verification") the ov2680 no longer probes on a imx7s-warp7:
> > 
> > ov2680 1-0036: error -EINVAL: supported link freq 330000000 not found
> > ov2680 1-0036: probe with driver ov2680 failed with error -2
> > 
> > As the 'link-frequencies' property is not mandatory, allow the probe
> > to succeed by skipping the link-frequency verification when the
> > property is absent.
> > 
> > Fixes: 63b0cd30b78e ("media: ov2680: Add bus-cfg / endpoint property verification")
> > Signed-off-by: Fabio Estevam <festevam@denx.de>
> > ---
> >  drivers/media/i2c/ov2680.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
> > index 39d321e2b7f9..f611ce3a749c 100644
> > --- a/drivers/media/i2c/ov2680.c
> > +++ b/drivers/media/i2c/ov2680.c
> > @@ -1123,6 +1123,9 @@ static int ov2680_parse_dt(struct ov2680_dev *sensor)
> >  		goto out_free_bus_cfg;
> >  	}
> >  
> > +	if (!bus_cfg.nr_of_link_frequencies)
> > +		return 0;
> > +
> 
> Thanks for the patch.
> 
> I'd still rather try to avoid going to this direction as these frequencies
> are hardware dependent. Add a new one to the driver and some boards may
> stop working properly. For details see
> <URL:https://hverkuil.home.xs4all.nl/spec/driver-api/camera-sensor.html#handling-clocks>.

While the above holds, on second thought, the driver has been around for
quite some time and indeed the added validation does break certain boards
(at least without adding the link frequencies there).

So I'm fine with the patch.

I think this should also be cc'd to stable.

> 
> >  	for (i = 0; i < bus_cfg.nr_of_link_frequencies; i++)
> >  		if (bus_cfg.link_frequencies[i] == sensor->link_freq[0])
> >  			break;
> 

-- 
Sakari Ailus

