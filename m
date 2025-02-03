Return-Path: <linux-media+bounces-25553-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B69A25587
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 10:12:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA3271882A7E
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 09:12:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0D3B1FDA78;
	Mon,  3 Feb 2025 09:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kPAZ692D"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C735635966
	for <linux-media@vger.kernel.org>; Mon,  3 Feb 2025 09:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738573948; cv=none; b=LW8RUf4+lokg3mupb9aEiR3DT8e7ke0vKTjntPzKqDUNwPm9iihJ5Whk1xurX9vleSYYk0G1WJL7IaB+uBdjZNGxdNfNUi+Z3gIGtNWlv8+/TnvOzkAKuETBr/QZ94hs1Yvo+lOZk1OMvY4QYqQ3PeMxGslAfQI1Z1QoZteA234=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738573948; c=relaxed/simple;
	bh=Ue3h+X5DFlB57sONU5fPlFzpPX3qyPIVODTw+j4+EyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lMNppHE5sCI7l5pmhlMy56lHJ0oX2wVZLlkQ0/yuQhGgm9fYU0aRvSDsf4D692cofvYzJOXo4dO1X3JFaZ5CtVIQnERMbfwY3m2kP8nzIgutrhpE3s4pSzDj9BtIy+CMgC6NKLwCa7EcR8qE1//5kFPWHRNJNnUtPQv3II5rRIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kPAZ692D; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738573947; x=1770109947;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ue3h+X5DFlB57sONU5fPlFzpPX3qyPIVODTw+j4+EyQ=;
  b=kPAZ692DSVWcY2oayMYKgfBiFyf4kdWkkb12j+5ViWT3VqQCy9rKH669
   vFmpXNlO9nobQdjCkzfyPhA+WsSio70NodwgUAtPwk9bTYQF/1jBgzIMt
   RP/Unn/DHxQVYIsxNhaVdJnHFLIL9vOWTPzvkxoeNCIvIjKwG7ZXp3O+b
   A2509eaZkz/G4lPxpJL5dVzuyEWBhl6XDZ3uN7/9ytptV6YWsbigcoWrv
   75tOswO5L604LfXY8D3xr32zqGwlzI+sUEo+M0g/rI1kA0nilzrIwrmM9
   OT07Wya0NlTcJ/xgEtVvDUEz50W/wrEsRndMn6oc5dKtU4IrTbRrT71wV
   A==;
X-CSE-ConnectionGUID: 396ITHKbSFmKBq6TVV3MEQ==
X-CSE-MsgGUID: YKBJIK8bSnWJpQHBkMpcRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="38293712"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="38293712"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 01:12:26 -0800
X-CSE-ConnectionGUID: hsUkySvUSOybRHbhhiiXmw==
X-CSE-MsgGUID: otf7mTtKQdSqjx2UVnZSDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="115243051"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 01:12:20 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id D56CC11F9C3;
	Mon,  3 Feb 2025 11:12:16 +0200 (EET)
Date: Mon, 3 Feb 2025 09:12:16 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Yong Zhi <yong.zhi@intel.com>, Dan Scally <djrscally@gmail.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com, bingbu.cao@intel.com,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Benoit Parrot <bparrot@ti.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	"Duc-Long, Le" <duclong.linux@gmail.com>
Subject: Re: [PATCH v10 7/9] media: intel/ipu6: Obtain link frequency from
 the remote subdev pad
Message-ID: <Z6CIcA2i_msR0yAB@kekkonen.localdomain>
References: <20250120110157.152732-1-sakari.ailus@linux.intel.com>
 <20250120110157.152732-8-sakari.ailus@linux.intel.com>
 <031ee16a-7c0a-4e7e-81b5-f17ad543f790@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <031ee16a-7c0a-4e7e-81b5-f17ad543f790@ideasonboard.com>

Moi,

On Fri, Jan 31, 2025 at 06:24:44PM +0200, Tomi Valkeinen wrote:
> Hi,
> 
> On 20/01/2025 13:01, Sakari Ailus wrote:
> > Obtain the link frequency from the sub-device's pad instead of a control
> > handler. This allows obtaining it using the get_mbus_config() sub-device
> > pad op which is the only method supported by the IVSC driver.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >   drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 12 +++---------
> >   1 file changed, 3 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> > index 051898ce53f4..da8581a37e22 100644
> > --- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> > +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> > @@ -80,25 +80,19 @@ static const struct ipu6_csi2_error dphy_rx_errors[] = {
> >   s64 ipu6_isys_csi2_get_link_freq(struct ipu6_isys_csi2 *csi2)
> >   {
> >   	struct media_pad *src_pad;
> > -	struct v4l2_subdev *ext_sd;
> > -	struct device *dev;
> >   	if (!csi2)
> >   		return -EINVAL;
> > -	dev = &csi2->isys->adev->auxdev.dev;
> >   	src_pad = media_entity_remote_source_pad_unique(&csi2->asd.sd.entity);
> >   	if (IS_ERR(src_pad)) {
> > -		dev_err(dev, "can't get source pad of %s (%ld)\n",
> > +		dev_err(&csi2->isys->adev->auxdev.dev,
> 
> This looks like an extra change. I would have kept the "dev", but up to you.

I thought putting that into a local variable isn't worth it as there is
just a single user left.

> 
> > +			"can't get source pad of %s (%ld)\n",
> >   			csi2->asd.sd.name, PTR_ERR(src_pad));
> >   		return PTR_ERR(src_pad);
> >   	}
> > -	ext_sd = media_entity_to_v4l2_subdev(src_pad->entity);
> > -	if (WARN(!ext_sd, "Failed to get subdev for %s\n", csi2->asd.sd.name))
> > -		return -ENODEV;
> > -
> > -	return v4l2_get_link_freq(ext_sd->ctrl_handler, 0, 0);
> > +	return v4l2_get_link_freq(src_pad, 0, 0);
> >   }
> >   static int csi2_subscribe_event(struct v4l2_subdev *sd, struct v4l2_fh *fh,
> 
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Kiitos!

-- 
Terveisin,

Sakari Ailus

