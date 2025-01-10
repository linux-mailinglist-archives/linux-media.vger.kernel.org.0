Return-Path: <linux-media+bounces-24607-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8643EA08E27
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 11:37:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 869641695FB
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 10:37:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 540AC20B208;
	Fri, 10 Jan 2025 10:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NZuiqyG2"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B0820A5FC;
	Fri, 10 Jan 2025 10:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736505461; cv=none; b=lWuP2hzZz5IFYepNnOPowsoPPtpM4XMninN704TeHeFc/kXU9Nwg1vjmCcJxm5ulFMHzGGVw+1EQ6JN5sxJFZ9AdykywYUoYDqi9rRocN1weZSzXB+vr25nf7HWDA4GeKhaGZM1TDtQSHXk5+TsL2Gp6wf3obJOuKBVMKKtCHis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736505461; c=relaxed/simple;
	bh=uJYOTl7B8MBckYkMtZtBQCm2Zvq1+VaHDB3X1GJcbn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=liGiXP9YEGHncNT82PXUzFajBJHtphHPJDh5NpU4X0xKJYQsaFWoSVKqrFVmS8toTaux9kXnZEfCxBmcJeqhEZwfluhXGNtSU6OUrUn9CZxbpky26fP0pF/95p5SgHyAnr+LR+5nAaCunJO784hNZBXdjgvrBVuLUzBgTsqCqNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NZuiqyG2; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736505460; x=1768041460;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uJYOTl7B8MBckYkMtZtBQCm2Zvq1+VaHDB3X1GJcbn4=;
  b=NZuiqyG2V6qwtsK/oJ5K7Z9IPkimbHoW3oWABYw+NDUst3H6hR7LrEBC
   X9S07t3GBuLIQjGCtQ/xqUTmaB9zzi4yyhzfMFmpvXDpa7xvrZ6JT3c9y
   2S16TMVg0Hg1xDePAuop83QNcioxVsl0TatOWVi9h1MlCamBYkB5UsyqJ
   nKYOhScC4/751oOIqOWgguF/oLQyjMdHOA0KKrFfF5AnHE1h5h0ra61su
   eY4vsVH+WG8m9Yr+MhSvUK31QrqGJvViKLcqTscJZvxB+Xg3+Ti4D2Gm4
   nN+E3aThfsy53sf9FoaBwJ91IXZ1dBFw3hTpx9a4ETJm6JTMJX+fbV49/
   g==;
X-CSE-ConnectionGUID: 8CpG1Q/0T6ajAhN4NGW8Lg==
X-CSE-MsgGUID: ubaWsqcjRuGtMZM+7lfPSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="54212357"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="54212357"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 02:37:39 -0800
X-CSE-ConnectionGUID: D5SBEckiSJWrOsnWZFDHbw==
X-CSE-MsgGUID: 41rOFE7bRNOq5/uQEhoMqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="104256826"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 02:37:34 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 604EB12049D;
	Fri, 10 Jan 2025 12:37:31 +0200 (EET)
Date: Fri, 10 Jan 2025 10:37:31 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Michael Riesch <michael.riesch@wolfvision.net>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Kever Yang <kever.yang@rock-chips.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Mehdi Djait <mehdi.djait@bootlin.com>,
	Gerald Loacker <gerald.loacker@wolfvision.net>
Subject: Re: [PATCH v2 4/6] media: rockchip: add a driver for the rockchip
 camera interface (cif)
Message-ID: <Z4D4a0GZ88sqc-rg@kekkonen.localdomain>
References: <20241217-v6-8-topic-rk3568-vicap-v2-0-b1d488fcc0d3@wolfvision.net>
 <20241217-v6-8-topic-rk3568-vicap-v2-4-b1d488fcc0d3@wolfvision.net>
 <Z3-f1SrrRjMnB-1C@kekkonen.localdomain>
 <561bef3e-2511-4741-9175-5c15239f9b1f@wolfvision.net>
 <Z4ACALOeioLroqmw@kekkonen.localdomain>
 <78fa589d-f9b6-41d8-bee5-766d0d1c3b17@wolfvision.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78fa589d-f9b6-41d8-bee5-766d0d1c3b17@wolfvision.net>

Hi Michael,

On Fri, Jan 10, 2025 at 10:12:29AM +0100, Michael Riesch wrote:
...
> >>>> +static int cif_stream_enum_framesizes(struct file *file, void *fh,
> >>>> +				      struct v4l2_frmsizeenum *fsize)
> >>>> +{
> >>>> +	struct cif_stream *stream = video_drvdata(file);
> >>>> +	struct v4l2_subdev_frame_size_enum fse = {
> >>>> +		.index = fsize->index,
> >>>> +		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
> >>>> +	};
> >>>> +	struct v4l2_subdev *sd = stream->remote->sd;
> >>>> +	const struct cif_output_fmt *fmt;
> >>>> +	int ret;
> >>>> +
> >>>> +	fmt = cif_stream_find_output_fmt(stream, fsize->pixel_format);
> >>>> +	if (!fmt)
> >>>> +		return -EINVAL;
> >>>> +
> >>>> +	fse.code = fmt->mbus_code;
> >>>> +
> >>>> +	ret = v4l2_subdev_call(sd, pad, enum_frame_size, NULL, &fse);
> >>>
> >>> You shouldn't get this information from the sensor driver but just convey
> >>> what this device supports.
> >>
> >> OK, but what does this device support? In principle, there is a
> >> continuous range of frame sizes up to a certain maximum size. But in
> >> practice, it depends on the subdevice as there is no scaler in the DVP
> >> path. Thus, every frame size but the one that the subdevice delivers
> >> will result in a broken stream?
> > 
> > Could you use CIF_MAX_WIDTH and CIF_MAX_HEIGHT?
> > 
> >>
> >> If this does not return the only possible frame size, is this callback
> >> useful at all?
> > 
> > In order not to configure an output size for the sensor that can't be
> > received by this block?
> 
> Right... Forgot about this case. This means user space needs to
> determine the possible frame sizes of each V4L2 device and subdevice in
> the pipeline and find a size that matches, right?

Correct.

Ideally this would be available on sub-device nodes, not video devices, but
I guess v4l2-compliance requires it on video devices.

> >> And would that apply to all the method and struct names in this driver
> >> or to the driver as well (location, file names)?
> >>
> >> The name has been discussed several times during the 13 iterations of
> >> the PX30 VIP series and I believe it changed from (cif//rkcif_) in
> >> downstream -> (vip//vip_) in Maximes work -> (cif/cif-/cif_) in Mehdis
> >> work, where the tuple is (driver directory/filename prefix/function and
> >> structs prefix).
> >>
> >> Hence I am a bit reluctant to change the naming convention yet again.
> >> That said, I'll be prepared to change it JUST ONE MORE TIME to any tuple
> >> you suggest -- but this really should be the end of the name bikeshedding.
> > 
> > I don't care about the internal naming but the global symbols. Using a
> > namespace is another option.
> > 
> 
> I would suggest the tuple (rkcif/rkcif-/rkcif_) then. This is in
> alignment with the Rockchip ISP driver (rkisp1/rkisp1-/rkisp1_).
> Unfortunately, the Rockchip RGA differs here (but with the tuple
> (rga/rga-/rga_) it uses the same prefix for everything at least).
> 
> There seems to be even less alignment when looking at other
> drivers/media/platform/ drivers, therefore I can only try to maximize
> the alignment within drivers/media/platform/rockchip/.
> 
> What do you think?

The rkcif prefix for anything global seems good to me.

-- 
Kind regards,

Sakari Ailus

