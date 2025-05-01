Return-Path: <linux-media+bounces-31545-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 227ECAA6620
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 00:20:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 09F80466C08
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 22:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B038264FA5;
	Thu,  1 May 2025 22:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bIrWVDoc"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E26257443;
	Thu,  1 May 2025 22:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746138049; cv=none; b=qLqgEoiOzgn57UwgJ6kxOVTPLG0Lctt9eSYNoMqrpa91+PJQoozor/gAhaLfb+6XcyMyYEV73Wn5Re/8SH+duJWeJZCIR4VsJqWzyLT1GiwN2o4crWRITK4RZ8pMMrgfQ0ZkQnkeEfv9u//dOA9a3ciAKzEuYccW8X/Id7UeAAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746138049; c=relaxed/simple;
	bh=1AmadBefipFkm2t5cTF5kth76uzgreH9cgyFcs5ft4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vlua1IiVt3RUNelmg60PDYipCNvBQpKhUVR5EmMGJasZUXHp/5eXeNaDOywaKQPaXADpTt7+rCuiLNcT45W/vGqhqaKez2D8nVSusNrECqd7yQdJ7NzwJTKsG5YVt2lUZl4+w3jOYNs8XMD67i604k/D7FHpTuq//euLK0wZFCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bIrWVDoc; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746138048; x=1777674048;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1AmadBefipFkm2t5cTF5kth76uzgreH9cgyFcs5ft4Y=;
  b=bIrWVDocpZXYNtpzbaQloe3nsKZPywYuzkV+wWVZaHQL92SKezUC/XXm
   zmJcDAuLL8ommcIEfv3vemBxVHRekoku/QwvZr33OnT7lMsq7twhW7l1l
   GJvSP5ZcFwTyVCZWYJ+7XK7zS9wCW/YQj9O5rqxigkyzuDTRQOwRuIZvx
   njzTkHmLXCR8IxNGj7s5pbCJBq+XK2/sKjQuYbFojCXD1V8F9gtk4qFMR
   +TGTeeGte35lrNaOFX4lE2/jrtJsrVpdBX9u4pQV1u7fr4w2ZN0dDqKdm
   LcCx/iJ1Fp2cM7/AzSxCzHp48muD0X75bMl+85WsD8AEe1qr8zh5n3vN5
   w==;
X-CSE-ConnectionGUID: eOUSpBb6Q2CxdBZn/waa/g==
X-CSE-MsgGUID: uAgs/a/zRJq+1xAFqpNw0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="59188991"
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="59188991"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 15:20:47 -0700
X-CSE-ConnectionGUID: dyUqDNu+Teuks2Ci5uxPQQ==
X-CSE-MsgGUID: YmC/jWunR1uDvH081srsMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="134441553"
Received: from ettammin-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.38])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 15:20:44 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id EC3471201E4;
	Fri,  2 May 2025 01:20:41 +0300 (EEST)
Date: Thu, 1 May 2025 22:20:41 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Sylvain Petinot <sylvain.petinot@foss.st.com>
Cc: benjamin.mugnier@foss.st.com, mchehab@kernel.org, robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	tomm.merciai@gmail.com
Subject: Re: [PATCH v6 2/2] media: i2c: Add driver for ST VD56G3 camera sensor
Message-ID: <aBPzucFjWvN8crSs@kekkonen.localdomain>
References: <20250427193050.23088-1-sylvain.petinot@foss.st.com>
 <20250427193050.23088-3-sylvain.petinot@foss.st.com>
 <aBCosy0h83UMNvSI@kekkonen.localdomain>
 <f496004b-8301-4f7b-85cc-f2f82bc94060@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f496004b-8301-4f7b-85cc-f2f82bc94060@foss.st.com>

Hi Sylvain,

On Wed, Apr 30, 2025 at 04:19:14PM +0200, Sylvain Petinot wrote:
> > > +static int vd56g3_subdev_init(struct vd56g3 *sensor)
> > > +{
> > > +	int ret;
> > > +
> > > +	/* Init remaining sub device ops */
> > > +	sensor->sd.internal_ops = &vd56g3_internal_ops;
> > > +	sensor->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> > > +	sensor->sd.entity.ops = &vd56g3_subdev_entity_ops;
> > > +
> > > +	/* Init source pad */
> > > +	sensor->pad.flags = MEDIA_PAD_FL_SOURCE;
> > > +	sensor->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> > > +	ret = media_entity_pads_init(&sensor->sd.entity, 1, &sensor->pad);
> > > +	if (ret) {
> > > +		dev_err(sensor->dev, "Failed to init media entity : %d", ret);
> > > +		return ret;
> > > +	}
> > > +
> > > +	/* Init controls */
> > > +	ret = vd56g3_init_controls(sensor);
> > > +	if (ret) {
> > > +		dev_err(sensor->dev, "Controls initialization failed %d", ret);
> > > +		goto err_media;
> > > +	}
> > > +
> > > +	/* Init vd56g3 struct : default resolution + raw8 */
> > > +	sensor->sd.state_lock = sensor->ctrl_handler.lock;
> > > +	ret = v4l2_subdev_init_finalize(&sensor->sd);
> > > +	if (ret) {
> > > +		dev_err(sensor->dev, "subdev init error: %d", ret);
> > > +		goto err_ctrls;
> > > +	}
> > > +
> > > +	return vd56g3_update_controls(sensor);
> > 
> > You're not holding the control handler's lock in the above call.
> 
> If your comment is related to the fact that 'vd56g3_update_controls() can
> fail and that we do not free control handler not cleanup media entity, it's
> fixed in V7.

It's not. The access to the control handler is serialised by a mutex and
you're not holding that mutex whilst calling vd56g3_update_controls() here.
The same issue exists in accessing sub-device state.

...

> > > +	ret = vd56g3_parse_dt(sensor);
> > > +	if (ret)
> > > +		return dev_err_probe(dev, ret, "Failed to parse Device Tree.");
> > 
> > No need for the trailing dot in these messages. Same elsewhere.
> 
> You're right, Fixed in V7.
> I took the opportunity to harmonize the error messages (Capital letter, no
> space before ':', no trailing dot, missing '\n').

Ack, sounds good!

-- 
Regards,

Sakari Ailus

