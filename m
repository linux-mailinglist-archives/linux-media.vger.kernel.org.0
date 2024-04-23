Return-Path: <linux-media+bounces-9940-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FA18AE827
	for <lists+linux-media@lfdr.de>; Tue, 23 Apr 2024 15:29:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1D5C2861F5
	for <lists+linux-media@lfdr.de>; Tue, 23 Apr 2024 13:29:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70491135A6B;
	Tue, 23 Apr 2024 13:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RS2TWQ1P"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27C96A03F
	for <linux-media@vger.kernel.org>; Tue, 23 Apr 2024 13:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713878970; cv=none; b=hHmviTWSYPY6Oh7wGqYQ7EktUM90Dwr85k8oPG4ql0WMW/MswqAlM0kalun6O77rhmoQX5pENlg8r0K5RlNLoN3zcDxMObiC6Sr/tCtHyLEr1UEwk5SpTvXhAoxDXD3bY/kInQT+Hu0N2kfREnSO8qE0T2HK/3+YWiHkC2hdea8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713878970; c=relaxed/simple;
	bh=i/KCUT/Tnn+e1Ye+MoVic2YJUWeRYCKMWpdPADEuv8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rsmGSQKbhqkkhWdgJSbDB4H3THbXMszZMlWpKfzyaXKYLHMS/Qd0rJfkTRSwxnJtLp2vswTFLNmyGrXbMcQgFo2EKNEgNaMv7bXFOxz+PyFowGnT3t3dYdnKhAhz96HARtS9lcBZ7qGdPei8pCwFdKXDPtsNnRpIUXrBRa4pj2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RS2TWQ1P; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713878970; x=1745414970;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=i/KCUT/Tnn+e1Ye+MoVic2YJUWeRYCKMWpdPADEuv8I=;
  b=RS2TWQ1P170DpDl4d7HZSbkmH3swbQpVzkQxrG32MHGaIoOeIK8KRosd
   6eAJGdrzAk+yzPY8aL4LZ/EUWjXLSV0hdiXY2z35pZ/x14p4PMGJEsgdL
   WsHoGPE9Coz4e9kpYxgJuEUg5mbcOV9rsw53c9Mg+DPmLV/9C2TX6iS5o
   57kwC6je/WUMd5vR43IbgBAiz/XuZme95fZT5LeJNUVDbE+NOlWfIOfu0
   Y25rHqodgw0QpSj+h4cgznfFp3PifaP5yhvyZ8ZMN2+WhlzDlDxzoRGHf
   9BNmU500Eg52ak/BQePKFOh1aglMIx3EBddlVStrRwKqGRaewHjKDtnGg
   A==;
X-CSE-ConnectionGUID: K+TYl6dVTNuXz7TZMHdlpQ==
X-CSE-MsgGUID: hAaRc15VSoWZ1Vw+TtU3/g==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="20879852"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="20879852"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 06:29:29 -0700
X-CSE-ConnectionGUID: KNmWMW1sRZSZ4hGOIhuS2w==
X-CSE-MsgGUID: VIp8tf2dT4S6hLGeU/TJpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="47651193"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 06:29:26 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 64B0611FCCF;
	Tue, 23 Apr 2024 16:29:23 +0300 (EEST)
Date: Tue, 23 Apr 2024 13:29:23 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v9 30/46] media: ccs: Add support for embedded data stream
Message-ID: <Zie3sxqZNRvxdPXN@kekkonen.localdomain>
References: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
 <20240416193319.778192-31-sakari.ailus@linux.intel.com>
 <20240420085949.GS6414@pendragon.ideasonboard.com>
 <Zieqk9uwEwDlFQhm@kekkonen.localdomain>
 <20240423125036.GC20623@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240423125036.GC20623@pendragon.ideasonboard.com>

Hi Laurent,

On Tue, Apr 23, 2024 at 03:50:36PM +0300, Laurent Pinchart wrote:
> > > > +		return ccs_get_format(subdev, sd_state, fmt);
> > > > +
> > > >  	mutex_lock(&sensor->mutex);
> > > 
> > > Is this needed, shouldn't the state lock be enough ?
> > 
> > Not while the access to the device's state is serialised using the driver's
> > own mutex. This changes two patches later though.
> 
> I realized that during the review, two patches later :-)

Yes, this was my expectation, too. ;)

> 
> > > >  
> > > > +	if (subdev == &sensor->src->sd && fmt->stream == CCS_STREAM_META) {
> > > > +		ccs_set_format_meta(subdev, sd_state, &fmt->format);
> > > > +
> > > > +		mutex_unlock(&sensor->mutex);
> > > > +
> > > > +		return 0;
> > > > +	}
> > > > +
> > > >  	if (fmt->pad == ssd->source_pad) {
> > > >  		int rval;
> > > >  
> > > >  		rval = ccs_set_format_source(subdev, sd_state, fmt);
> > > > +		if (sensor->embedded_start != sensor->embedded_end)
> > > 
> > > A ccs_sensor_has_embedded_data() (name bikeshedding allowed) inline
> > > helper could be nice to replace this manual check could be nice, as you
> > > do the same in many locations below.
> > 
> > Sounds good.
> > 
> > > > +			ccs_set_format_meta(subdev, sd_state, NULL);
> > > 
> > > This doesn't seem correct, you shouldn't set the metadata format on
> > > subdevs that are not the source subdev.
> > 
> > Good point. I'll add a check.
> > 
> > > A comment to explain how the metadata format is propagated would also be
> > > useful.
> > 
> > I'll add this to the documentation patch which actually could be better
> > after this patch, not before.
> 
> I meant comments in the source code, to make it easier to follow the
> code flow. Format propagation is error-prone, having comments explaining
> what the code does next to the code helps during review, and should also
> help during futher developments.

I'll add some here, too.

...

> > > > @@ -3109,6 +3407,14 @@ static const struct v4l2_subdev_pad_ops ccs_pad_ops = {
> > > >  	.set_fmt = ccs_set_format,
> > > >  	.get_selection = ccs_get_selection,
> > > >  	.set_selection = ccs_set_selection,
> > > > +};
> > > > +
> > > > +static const struct v4l2_subdev_pad_ops ccs_src_pad_ops = {
> > > > +	.enum_mbus_code = ccs_enum_mbus_code,
> > > > +	.get_fmt = ccs_get_format,
> > > 
> > > I'm surprised you need to implement .get_fmt(). The
> > > v4l2_subdev_get_fmt() helper should have been enough.
> > 
> > It should be possible to get rid of that now, too. I'll add a new patch for
> > this.

Now I remember why it's here. The controls affect the mbus code and
changing this is outside the scope for now (I'm not sure if someone would
complain about this changing).

Presumably such changes could be merged with the sensor API changes in
order to avoid several separate changes, so to be determined later on. The
same goes for this patch (post 6.10).

-- 
Regards,

Sakari Ailus

