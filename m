Return-Path: <linux-media+bounces-50601-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A80D1B073
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 20:25:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 97F6830376A1
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 19:25:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0468735CB66;
	Tue, 13 Jan 2026 19:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H9dsLTTL"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F58835CB87;
	Tue, 13 Jan 2026 19:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768332325; cv=none; b=i5v+a7yIauge0MXzmQ3AryI3QcCiEw/q3sGE9s5yyhCoPkDXre2HqZpfTlW0wvMZMo7If8tF/jv0ZRsOkTctJuSEqd62R9PzcpIQxItfAFcndUraliknFuw4Udq+N49Qbj7ldHg6OZwGx9mtpAioMdIT71SbNutaPn9kZzkhM0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768332325; c=relaxed/simple;
	bh=yCZgrq2gYyA9zE0wb2KLgXsq/Rqlgw0FrOGx53fXziE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=smPjW+xzjn/wAAZSRGJr3TD179jJMgKouENzfDPFvQeS1HS9zrL3c9IEvp5/ZhIODfeRBQqKa4VGVXog9OR0MSlkIVldA3DyevokEwhaReup2mRSUrhGa9TcxNvtABpxgnBW/ZqJTUGsiLgueT1A+YE2FyuPwtktfCpML2s4QUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H9dsLTTL; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768332323; x=1799868323;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yCZgrq2gYyA9zE0wb2KLgXsq/Rqlgw0FrOGx53fXziE=;
  b=H9dsLTTLnj5Z7WAEJe2J6h5UBPtMh3scpZQ8Yc+lWPF7WYK28RcpTWCG
   spnpP5WpL+O+kjKY7Z6VU7PNGpkwPtEGGBIBQ/ALL33OyyHGcH9PMDIeg
   zHzva0ioW9YKM8pc8imgS0Cc6X1JZLpAifQDrFP61k6EEDL0K1+ViZH8s
   VpR8qzhie3wgXR3T2S2wOyCarGF6JGNYYy6Ux4EBtxMSV3fcbKKcnCKr6
   FfSkCAvlE5ZhBshEG1V8f8nhnGk2wGeuuwK0Ngm4LYOU6ZL4vE7vebE8B
   KvyJrr5WK2J3BmwY3hxZWgWbvt5MsA1RoPuPu29m3VMNjEO63h2yRfJ4n
   w==;
X-CSE-ConnectionGUID: mTchf4MSRvWVziljjX9nPA==
X-CSE-MsgGUID: KYsj07I5R+O5aMzzScX4eA==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="80736989"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="80736989"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 11:25:23 -0800
X-CSE-ConnectionGUID: FVxHAmWTQN+R9F0Owfg4aw==
X-CSE-MsgGUID: vWjhIWe8SMGKp9mUgCbK4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="209516040"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.58])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 11:25:21 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id BE5C6121DBB;
	Tue, 13 Jan 2026 21:25:18 +0200 (EET)
Date: Tue, 13 Jan 2026 21:25:18 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: "jempty.liang" <imntjempty@163.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	dan.scally@ideasonboard.com, mchehab@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: mali-c55: Fix NULL dev stream alert for tpg
 sub-device
Message-ID: <aWacHjLKiG0fsymG@kekkonen.localdomain>
References: <20260113075722.143238-1-imntjempty@163.com>
 <aWYHPKMVFu_QC1Ow@zed>
 <aWYhGQcDVRDTyvxj@kekkonen.localdomain>
 <aWY8__K4nVs0bEWT@zed>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWY8__K4nVs0bEWT@zed>

Hi Jacopo,

On Tue, Jan 13, 2026 at 01:43:12PM +0100, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Tue, Jan 13, 2026 at 12:40:25PM +0200, Sakari Ailus wrote:
> > Hi Jacopo,
> >
> > On Tue, Jan 13, 2026 at 09:55:10AM +0100, Jacopo Mondi wrote:
> > > I wonder if v4l2_device_register_subdev() shouldn't WARN or if return
> > > an error if sd->dev is not initialized. Laurent, Sakari: opinions ?
> >
> > I might even return an error but I wonder what would break. Perhaps indeed
> > could start with a warning?
> 
> I would start with:
> 
> --- a/drivers/media/v4l2-core/v4l2-device.c
> +++ b/drivers/media/v4l2-core/v4l2-device.c
> @@ -117,6 +117,13 @@ int __v4l2_device_register_subdev(struct v4l2_device *v4l2_dev,
>         if (!v4l2_dev || !sd || sd->v4l2_dev || !sd->name[0])
>                 return -EINVAL;
> 
> +       /*
> +        * Initializing sd->dev is mandatory. Warn for now to give faulty
> +        * drivers a bit of time to update before actually returning an error.
> +        */
> +       WARN_ON(!sd->dev);
> +
>         /*
>          * The reason to acquire the module here is to avoid unloading
>          * a module of sub-device which is registered to a media
> 
> Would you like a patch ?

Please. :-)

-- 
Kind regards,

Sakari Ailus

