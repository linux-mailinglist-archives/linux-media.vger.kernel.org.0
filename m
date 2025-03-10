Return-Path: <linux-media+bounces-27919-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D49E9A58C8F
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 08:14:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27BB1188A5E4
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 07:15:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 511C81D61B9;
	Mon, 10 Mar 2025 07:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M5hhkPeC"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191041D5AB6
	for <linux-media@vger.kernel.org>; Mon, 10 Mar 2025 07:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741590862; cv=none; b=gTk3D36IkKJugmi1wkMb43DMoH09iEge3LXjXpoRclgfbE6BXEos+Zg3sQyCgmpUDLQFNp6iztjw+hhDZMCednizFj4ps3TkYGar/i1y3Acc+sJAiVBZJKkr7UZOvqMWrMyxlt0E3BBgg68Ay79ePwUd6+ELh3nNVyDbts+V5Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741590862; c=relaxed/simple;
	bh=v7cY//0lIjCAM/fb1whPmNmqnKRK/SAYD+4vWz6+HQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rz6jl8vEanTl4OeXM3tb1UeSGcstrWAMSLAn1RguldJYS3cXTECq8kTQJZqyvigi2fUDtSvm4YsGcrngF4/XKB8O7nNbzo2r/nCrxREZqMnnx5DyzloA1jlg5WeDpeVPIs9nAXSszAEfq0ksvJD0iYuVUym5cexoQ6UsbWwHovM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M5hhkPeC; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741590861; x=1773126861;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=v7cY//0lIjCAM/fb1whPmNmqnKRK/SAYD+4vWz6+HQM=;
  b=M5hhkPeC6+WsdWgWuxzZJFdoxb7IRF0WmrrXkZFWBEjE7No8IALCmfP/
   JL7m3//2wciuFFNNtaHWVAcg1mQqeobpr1iAseR3PPEz8AbZMmaK7aRsL
   XzEqPYmnAj7Z0wU75ZbYY3N/lNI7d6YeUCWK4mYYGitmdN9Ew4l1t/seQ
   7+vxqv0BhmeLiGAeZQ1Y179bW9CeVAAi7GIvb2KcE+AAmF5zt5q9LxAm3
   3dhuC3O7KpZ0E2MFkcCBH+46tm/pQrFG2naa3Rqb8bwBNNdxCVA3KFC3k
   on3mGz1X0jj5/x3XbCpDP6EJuwIoSQSDtpE979VI7FIT68gLZsspTozC8
   A==;
X-CSE-ConnectionGUID: xcIDB4psQiitpjv94ZP8uw==
X-CSE-MsgGUID: dALO12a1QXCL6pRJgntOMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="53198014"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="53198014"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 00:14:21 -0700
X-CSE-ConnectionGUID: qbJr6UPRSS2yMDxqFjzy6Q==
X-CSE-MsgGUID: XKRl7fGBRO2oREfon/pjlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="143115188"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 00:14:19 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 97C4E11F828;
	Mon, 10 Mar 2025 09:14:16 +0200 (EET)
Date: Mon, 10 Mar 2025 07:14:16 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hao Yao <hao.yao@intel.com>
Cc: Arec Kao <arec.kao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>
Subject: Re: [PATCH 2/2] media: i2c: ov13b10: Support 2 lane mode
Message-ID: <Z86RSEg3BL0uiWlX@kekkonen.localdomain>
References: <20250307093130.1103961-1-hao.yao@intel.com>
 <20250307093130.1103961-2-hao.yao@intel.com>
 <Z8q_xpTIs1UsN0l9@kekkonen.localdomain>
 <f24a1543-9a8f-4e42-8cf7-40644f6d706d@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f24a1543-9a8f-4e42-8cf7-40644f6d706d@intel.com>

Hi Hao,

On Mon, Mar 10, 2025 at 12:06:04PM +0800, Hao Yao wrote:
> > > @@ -1459,12 +1539,25 @@ static int ov13b10_check_hwcfg(struct device *dev)
> > >   	if (ret)
> > >   		return ret;
> > > -	if (bus_cfg.bus.mipi_csi2.num_data_lanes != OV13B10_DATA_LANES) {
> > > +	dlane = bus_cfg.bus.mipi_csi2.num_data_lanes;
> > > +	if (dlane != OV13B10_4_DATA_LANES && dlane != OV13B10_2_DATA_LANES) {
> > >   		dev_err(dev, "number of CSI2 data lanes %d is not supported",
> > > -			bus_cfg.bus.mipi_csi2.num_data_lanes);
> > > +			dlane);
> > >   		ret = -EINVAL;
> > >   		goto out_err;
> > >   	}
> > > +	ov13b->data_lanes = dlane;
> > > +	ov13b->supported_modes = supported_4_lanes_modes;
> > > +	ov13b->supported_modes_num = ARRAY_SIZE(supported_4_lanes_modes);
> > > +	if (dlane == OV13B10_2_DATA_LANES) {
> > > +		ov13b->supported_modes = supported_2_lanes_modes;
> > > +		ov13b->supported_modes_num =
> > > +			ARRAY_SIZE(supported_2_lanes_modes);
> > 
> > How about using switch() here?
> 
> How about:
> 	ov13b->data_lanes = bus_cfg.bus.mipi_csi2.num_data_lanes;
> 	switch (ov13b->data_lanes) {
> 	case OV13B10_4_DATA_LANES:
> 		ov13b->supported_modes = supported_4_lanes_modes;
> 		ov13b->supported_modes_num =
> 			ARRAY_SIZE(supported_4_lanes_modes);
> 		break;
> 
> 	case OV13B10_2_DATA_LANES:
> 		ov13b->supported_modes = supported_2_lanes_modes;
> 		ov13b->supported_modes_num =
> 			ARRAY_SIZE(supported_2_lanes_modes);
> 		break;
> 
> 	default:
> 		dev_err(dev, "number of CSI2 data lanes %d is not supported",
> 			ov13b->data_lanes);
> 		ret = -EINVAL;
> 		goto out_err;
> 	}

Looks good to me. I'd do the assignment to ov13b->data_lanes after checking
the value though.

-- 
Regards,

Sakari Ailus

