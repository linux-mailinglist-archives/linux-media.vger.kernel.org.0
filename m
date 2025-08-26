Return-Path: <linux-media+bounces-41070-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8057CB359B7
	for <lists+linux-media@lfdr.de>; Tue, 26 Aug 2025 12:00:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B5CE2A2F5B
	for <lists+linux-media@lfdr.de>; Tue, 26 Aug 2025 10:00:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B83A232143A;
	Tue, 26 Aug 2025 10:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oLE/5hxN"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09586296BD7;
	Tue, 26 Aug 2025 10:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756202431; cv=none; b=kU615aAwlY1//u0mBDEPamS9Q0eyQJIedYdQLYKk2RxL12pt3yJCATWVbQwwf1bp8EdqWBYoMFHDehujxXCcwADRjO2iM0IInLafNQOPDaEOtCkFQLiM2JQUt6h+nGz4WuAln/bC/CtMUhxM9g08Wqf45u6tj+tQavvg+bBvKMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756202431; c=relaxed/simple;
	bh=bfwDVBHz8PappMdmAikeOG04IzZySHLSw/GA5JMjPK8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JtuiN/8whPWkml8XJ9Cn3uN+dP6wf2Cx4TAbmF+PMDhd54BlIL6Yhtbt804KwK6n3R/q83YwbdpzMuHUu7LcR4aF3+vF3ncZZAw308in1N6M71TSeGdfoD9Q/a7lvQpA2iYuMX8MhuaoRXmPIQmrEuiRW/lMassW4hNkK7an58w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oLE/5hxN; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756202429; x=1787738429;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=bfwDVBHz8PappMdmAikeOG04IzZySHLSw/GA5JMjPK8=;
  b=oLE/5hxNuGeNRZ8WGTAXn+KeIDABQaZ/xIVodS2FY6XTO66yB0r1sh+4
   VUbpNjQexkaYqObRqsjq+ZIHIJHZ9dUX/pNMgCisgedSpcxS9vI/mNIbM
   OW4DXZTJKF9w5lsS3cLmLvnoK/smk/ufYnWWT4dhKHQOWVG1bq8bFp4Op
   oEWgKtykCa2If9gjGYb8Bbt8pSRFMGvDi/7teZ+7ZVzCv6sFLcEMYJBrH
   Tl4s6KFKdJZvtv3ZgbXb60qOQuE+tyzV+r3GduxNkZryjNvDzz00Ag0MI
   jl4GbL2rTBhbKOYraWRsokcto/RK9LiXmDM7IIoe5Kv7+2ANPa151xdZ2
   Q==;
X-CSE-ConnectionGUID: DUfqB403RlCMIDsx9K4HIw==
X-CSE-MsgGUID: x/2Ca0cjSvmmp8Rc/n3ULA==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="69530536"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="69530536"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2025 03:00:28 -0700
X-CSE-ConnectionGUID: l+y6IleFR+2ZGTevaw5e6Q==
X-CSE-MsgGUID: 8Y4cSfV0R9K9MqxgZJyufw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="169443566"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.170])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2025 03:00:27 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id DE35711F97F;
	Tue, 26 Aug 2025 13:00:23 +0300 (EEST)
Date: Tue, 26 Aug 2025 13:00:23 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Julien Massot <julien.massot@collabora.com>
Cc: kernel@collabora.com, Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: vgxy61: Report stream using frame descriptors
Message-ID: <aK2Ft4ODOF2EPgld@kekkonen.localdomain>
References: <20250704-vgxy61-frame-desc-v1-1-0e62b9c4e260@collabora.com>
 <aJ7N8tAqEp5KSTGN@kekkonen.localdomain>
 <442c8ed533e01af213c5fae2dad5ad317872d4d1.camel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <442c8ed533e01af213c5fae2dad5ad317872d4d1.camel@collabora.com>

Hi Julien,

On Tue, Aug 26, 2025 at 09:21:29AM +0200, Julien Massot wrote:
> Hi Sakari,
> 
> On Fri, 2025-08-15 at 06:04 +0000, Sakari Ailus wrote:
> > Hi Julien,
> > 
> > On Fri, Jul 04, 2025 at 11:28:24AM +0200, Julien Massot wrote:
> > > Add support for .get_frame_desc() to report CSI-2 virtual channel
> > > and data type information. This allows CSI-2 receivers to properly
> > > interpret the stream without inferring the data type from the pixel
> > > format.
> > > 
> > > Signed-off-by: Julien Massot <julien.massot@collabora.com>
> > > ---
> > >  drivers/media/i2c/vgxy61.c | 16 ++++++++++++++++
> > >  1 file changed, 16 insertions(+)
> > > 
> > > diff --git a/drivers/media/i2c/vgxy61.c b/drivers/media/i2c/vgxy61.c
> > > index
> > > 5b0479f3a3c0592be430cefe5a1ab9a76812ba84..44d6c8d8fbf8d6182e42d44e129b
> > > c45945ee0da5 100644
> > > --- a/drivers/media/i2c/vgxy61.c
> > > +++ b/drivers/media/i2c/vgxy61.c
> > > @@ -1181,6 +1181,21 @@ static int vgxy61_s_stream(struct v4l2_subdev
> > > *sd, int enable)
> > >  	return ret;
> > >  }
> > >  
> > > +static int vgxy61_get_frame_desc(struct v4l2_subdev *sd, unsigned int
> > > pad,
> > > +				 struct v4l2_mbus_frame_desc *fd)
> > > +{
> > > +	struct vgxy61_dev *sensor = to_vgxy61_dev(sd);
> > > +
> > > +	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
> > > +	fd->num_entries = 1;
> > > +	fd->entry[0].pixelcode = sensor->fmt.code;
> > > +	fd->entry[0].stream = 0;
> > > +	fd->entry[0].bus.csi2.vc = 0;
> > > +	fd->entry[0].bus.csi2.dt = get_data_type_by_code(sensor-
> > > >fmt.code);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >  static int vgxy61_set_fmt(struct v4l2_subdev *sd,
> > >  			  struct v4l2_subdev_state *sd_state,
> > >  			  struct v4l2_subdev_format *format)
> > > @@ -1402,6 +1417,7 @@ static const struct v4l2_subdev_pad_ops
> > > vgxy61_pad_ops = {
> > >  	.set_fmt = vgxy61_set_fmt,
> > >  	.get_selection = vgxy61_get_selection,
> > >  	.enum_frame_size = vgxy61_enum_frame_size,
> > > +	.get_frame_desc = vgxy61_get_frame_desc,
> > >  };
> > >  
> > >  static const struct v4l2_subdev_ops vgxy61_subdev_ops = {
> > > 
> > 
> > I guess this is correct as such, but does it provide any information
> > that
> > isn't already available? I.e. I wouldn't add it just for the sake of it.
> Perhaps, I missed something. Without the get_frame_desc the CSI receiver
> have to infers the datatype based on the pixel format.

I think we should have a function in the framework to do that. Oh, we
actually already do have the function, call_get_mbus_config(), it just
doesn't get the format yet. Currently receiver drivers handle this by
themselves but that doesn't scale very well.

> 
> I made this patch because some CSI receivers, such as the upcoming GMSL2
> framework are relying on the frame desc to update its routing table.
> So, it will only support sensors implementing the get_frame_desc function.

-- 
Regards,

Sakari Ailus

