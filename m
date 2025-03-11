Return-Path: <linux-media+bounces-27998-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CC3A5BAA8
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 09:17:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2736B7A2C3D
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 08:16:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC29122257B;
	Tue, 11 Mar 2025 08:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OvO60z/6"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2DE41EB5FD
	for <linux-media@vger.kernel.org>; Tue, 11 Mar 2025 08:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741681036; cv=none; b=S/HCloy9jZcbHLZ5OYvZipuUyytOE/J7YLnB3fSVsIACWkEs1eddBDu5YwZGD3ffjMAFZOUjIMbXFiWkW9aHI0pcD8uzoSNeJOYih5E8iazKAfUif+fqw4B0G/wL+2rCjTfpbmfprpdBmP11Ms7rSAJw9xJZ9pksjzRSfDrJYsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741681036; c=relaxed/simple;
	bh=TFETlldXk1aQ8WolgI+g9LssUu47RFQ93dBd1hC2OtY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pNVUVfonA9b03omlOrIYDObqXEZ5PlJL9yPK3GYjqEsp/zp6JolhYZcbcLaZuc0FTpd0ih8MtTDtBwOSLETmaI28NmFCQ4DsPrSefzRKQF2afauD40r6vrs6H4+gtVZltJEGVmbyOKXglfFX7HKLyuXChmmb/eEW4bCqZ8/6/rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OvO60z/6; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741681035; x=1773217035;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TFETlldXk1aQ8WolgI+g9LssUu47RFQ93dBd1hC2OtY=;
  b=OvO60z/6tT5uQsdC5jt8uLqrjv8QupqG1I+8Gq5nvZZgjUZgkHvZMGmG
   uYVlt4/756M/Vu7Y/cn8zA+x4Oh0vIl+ix79L7mmWr3PgvR7tjrl7nmPf
   7xzIMf0k9omFJs2nUuHS4pbg6F7kal99/B4Nv8qN3Y51jI15bKg6SURs2
   IcCbTeEfLye1v/jh8Ytgg9afabi0M7Hl+gomVBmn9lzkZfyu1pYolV6c9
   Bwx3wyqOU8s4XAOqkqkwU2UzFulyGyZmd5TRIjCfz7Q/cCBlizv5GQWFK
   x3wwD/mzrWi/ao76J0WGdkc09Yw2Gw4BOqqpO/f5D3O/XRfPUWmDPWfsx
   A==;
X-CSE-ConnectionGUID: OaVQLsbESn6+NpmHn1rcqw==
X-CSE-MsgGUID: 1wGaqs3ZRUmQD94PX2uaeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="41955660"
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; 
   d="scan'208";a="41955660"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 01:17:14 -0700
X-CSE-ConnectionGUID: wrkYINVnRJ6RoZXJ5rvSWg==
X-CSE-MsgGUID: RglVV4zMSaiNJE1h/vmASQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; 
   d="scan'208";a="151205503"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 01:17:13 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id EB65411F7F0;
	Tue, 11 Mar 2025 10:17:09 +0200 (EET)
Date: Tue, 11 Mar 2025 08:17:09 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hao Yao <hao.yao@intel.com>
Cc: Arec Kao <arec.kao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>
Subject: Re: [PATCH 2/2] media: i2c: ov13b10: Support 2 lane mode
Message-ID: <Z8_xhcfqWs27GZee@kekkonen.localdomain>
References: <20250307093130.1103961-1-hao.yao@intel.com>
 <20250307093130.1103961-2-hao.yao@intel.com>
 <Z8q_xpTIs1UsN0l9@kekkonen.localdomain>
 <f24a1543-9a8f-4e42-8cf7-40644f6d706d@intel.com>
 <Z86RSEg3BL0uiWlX@kekkonen.localdomain>
 <b1dd819b-89f0-4962-907b-29eaadd58ae3@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1dd819b-89f0-4962-907b-29eaadd58ae3@intel.com>

Hi Hao,

On Tue, Mar 11, 2025 at 02:42:57PM +0800, Hao Yao wrote:
> Hi Sakari,
> 
> On 2025/3/10 15:14, Sakari Ailus wrote:
> > Hi Hao,
> > 
> > On Mon, Mar 10, 2025 at 12:06:04PM +0800, Hao Yao wrote:
> > > > > @@ -1459,12 +1539,25 @@ static int ov13b10_check_hwcfg(struct device *dev)
> > > > >    	if (ret)
> > > > >    		return ret;
> > > > > -	if (bus_cfg.bus.mipi_csi2.num_data_lanes != OV13B10_DATA_LANES) {
> > > > > +	dlane = bus_cfg.bus.mipi_csi2.num_data_lanes;
> > > > > +	if (dlane != OV13B10_4_DATA_LANES && dlane != OV13B10_2_DATA_LANES) {
> > > > >    		dev_err(dev, "number of CSI2 data lanes %d is not supported",
> > > > > -			bus_cfg.bus.mipi_csi2.num_data_lanes);
> > > > > +			dlane);
> > > > >    		ret = -EINVAL;
> > > > >    		goto out_err;
> > > > >    	}
> > > > > +	ov13b->data_lanes = dlane;
> > > > > +	ov13b->supported_modes = supported_4_lanes_modes;
> > > > > +	ov13b->supported_modes_num = ARRAY_SIZE(supported_4_lanes_modes);
> > > > > +	if (dlane == OV13B10_2_DATA_LANES) {
> > > > > +		ov13b->supported_modes = supported_2_lanes_modes;
> > > > > +		ov13b->supported_modes_num =
> > > > > +			ARRAY_SIZE(supported_2_lanes_modes);
> > > > 
> > > > How about using switch() here?
> > > 
> > > How about:
> > > 	ov13b->data_lanes = bus_cfg.bus.mipi_csi2.num_data_lanes;
> > > 	switch (ov13b->data_lanes) {
> > > 	case OV13B10_4_DATA_LANES:
> > > 		ov13b->supported_modes = supported_4_lanes_modes;
> > > 		ov13b->supported_modes_num =
> > > 			ARRAY_SIZE(supported_4_lanes_modes);
> > > 		break;
> > > 
> > > 	case OV13B10_2_DATA_LANES:
> > > 		ov13b->supported_modes = supported_2_lanes_modes;
> > > 		ov13b->supported_modes_num =
> > > 			ARRAY_SIZE(supported_2_lanes_modes);
> > > 		break;
> > > 
> > > 	default:
> > > 		dev_err(dev, "number of CSI2 data lanes %d is not supported",
> > > 			ov13b->data_lanes);
> > > 		ret = -EINVAL;
> > > 		goto out_err;
> > > 	}
> > 
> > Looks good to me. I'd do the assignment to ov13b->data_lanes after checking
> > the value though.
> > 
> 
> Thank you, I will prepare v2 later.
> BTW, do you have any suggestions on patch 1/2 ?

That looks good to me.

-- 
Sakari Ailus

