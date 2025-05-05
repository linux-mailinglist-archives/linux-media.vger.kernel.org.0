Return-Path: <linux-media+bounces-31692-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1551EAA8E8F
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 10:52:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6FE3C3B7FD7
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 08:52:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2227D1F63E1;
	Mon,  5 May 2025 08:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cwfq+2N7"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11DDB1F4627;
	Mon,  5 May 2025 08:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746435131; cv=none; b=tqUVHOKNv3e4wQxzSVhtMyEIcO8D8n+RaTdV7MSZ+uoBk9JZ2kwWzTMLomoiie6zejWKXsWDOsz2Tk6RBhuZq5wP0sHkFcV7qAKjXQn/CYDDQ3yXkzPqjIy6l8PETPVxdixKLrASiz8FVA+nubWd/Bzby097cSOZQVJ1pS17DWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746435131; c=relaxed/simple;
	bh=sRyvKd/x3rURSS5MtVL5UNdIIah+rT5ivMHfIBKBAAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ACWXkPaXC1UwPSwDJmJDmbrDJMhBRWlLvjB80exhxigzu4UvjL7vWWZXsd4h7s6Bh63srYr0vVjT6eyt2KNSlF/hrqQyaEfgjOxMVfJ3+jfrnhSi00pfCjelyHsUM3bR9U4w3BEGNac7bc8Sjw99OO84kUG76a/GVM3lHcN6gns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cwfq+2N7; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746435131; x=1777971131;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=sRyvKd/x3rURSS5MtVL5UNdIIah+rT5ivMHfIBKBAAI=;
  b=Cwfq+2N7fZKi9PNcx0ZA2BK4R4Cnum0kHdmTWzWYKVrYV8g/GNz5g1QK
   qlihAmKYOxEVCwLZJ3EENgBCtWollEvLDLg01mgph3NxBEEyLjWEgBMoC
   E6urAFNs+w+UzLOxAv8qKhlfm4b4TsyjGqlJF51uCAuCqpQp123fhmTt0
   ihK07gQz1AFhMX0CJoItKQ50HUCIfyHQSXEp+qGy6yhwDPtjWwMdoE0S8
   WQsv27zvSrfVeXjzgMVIHM7/AZGiNMTCYr0uKNEoyUhyDxz2ahxRcVw97
   Yy245Qd66AYR/lMBYOYyRvmnBIqjP8paZAcLkcTPyVm3+UrWFBNI79ndL
   A==;
X-CSE-ConnectionGUID: hHv4mGtLSJatJRu5SjhZYA==
X-CSE-MsgGUID: CiIi7q/KTvmUgVd/6w+2xQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11423"; a="65438676"
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="65438676"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 01:52:09 -0700
X-CSE-ConnectionGUID: 6U1OZ9bSTFWsnSeHOJaWBQ==
X-CSE-MsgGUID: tSAhYBgAQSyQeNz/NC1xkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="139983910"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.252])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 01:52:06 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 7C9CD1205CF;
	Mon,  5 May 2025 10:24:36 +0300 (EEST)
Date: Mon, 5 May 2025 07:24:36 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Sylvain Petinot <sylvain.petinot@foss.st.com>
Cc: benjamin.mugnier@foss.st.com, mchehab@kernel.org, robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	tomm.merciai@gmail.com
Subject: Re: [PATCH v6 2/2] media: i2c: Add driver for ST VD56G3 camera sensor
Message-ID: <aBhntPR4Wbnz3oJo@kekkonen.localdomain>
References: <20250427193050.23088-1-sylvain.petinot@foss.st.com>
 <20250427193050.23088-3-sylvain.petinot@foss.st.com>
 <aBCosy0h83UMNvSI@kekkonen.localdomain>
 <f496004b-8301-4f7b-85cc-f2f82bc94060@foss.st.com>
 <aBPzucFjWvN8crSs@kekkonen.localdomain>
 <4c8a1359-e7e3-4e1c-a159-e761ed749712@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4c8a1359-e7e3-4e1c-a159-e761ed749712@foss.st.com>

Hi Sylvain,

On Fri, May 02, 2025 at 09:39:27PM +0200, Sylvain Petinot wrote:
> Hi Sakari,
> 
> Le 02/05/2025 à 00:20, Sakari Ailus a écrit :
> > Hi Sylvain,
> > 
> > On Wed, Apr 30, 2025 at 04:19:14PM +0200, Sylvain Petinot wrote:
> > > > > +static int vd56g3_subdev_init(struct vd56g3 *sensor)
> > > > > +{
> > > > > +	int ret;
> > > > > +
> > > > > +	/* Init remaining sub device ops */
> > > > > +	sensor->sd.internal_ops = &vd56g3_internal_ops;
> > > > > +	sensor->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> > > > > +	sensor->sd.entity.ops = &vd56g3_subdev_entity_ops;
> > > > > +
> > > > > +	/* Init source pad */
> > > > > +	sensor->pad.flags = MEDIA_PAD_FL_SOURCE;
> > > > > +	sensor->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> > > > > +	ret = media_entity_pads_init(&sensor->sd.entity, 1, &sensor->pad);
> > > > > +	if (ret) {
> > > > > +		dev_err(sensor->dev, "Failed to init media entity : %d", ret);
> > > > > +		return ret;
> > > > > +	}
> > > > > +
> > > > > +	/* Init controls */
> > > > > +	ret = vd56g3_init_controls(sensor);
> > > > > +	if (ret) {
> > > > > +		dev_err(sensor->dev, "Controls initialization failed %d", ret);
> > > > > +		goto err_media;
> > > > > +	}
> > > > > +
> > > > > +	/* Init vd56g3 struct : default resolution + raw8 */
> > > > > +	sensor->sd.state_lock = sensor->ctrl_handler.lock;
> > > > > +	ret = v4l2_subdev_init_finalize(&sensor->sd);
> > > > > +	if (ret) {
> > > > > +		dev_err(sensor->dev, "subdev init error: %d", ret);
> > > > > +		goto err_ctrls;
> > > > > +	}
> > > > > +
> > > > > +	return vd56g3_update_controls(sensor);
> > > > 
> > > > You're not holding the control handler's lock in the above call.
> > > 
> > > If your comment is related to the fact that 'vd56g3_update_controls() can
> > > fail and that we do not free control handler not cleanup media entity, it's
> > > fixed in V7.
> > 
> > It's not. The access to the control handler is serialised by a mutex and
> > you're not holding that mutex whilst calling vd56g3_update_controls() here.
> > The same issue exists in accessing sub-device state.
> > 
> 
> I'm sorry, I missed that ...
> That should be better with something like :
> 
> 	state = v4l2_subdev_lock_and_get_active_state(&sensor->sd);
> 	ret = vd56g3_update_controls(sensor);
> 	v4l2_subdev_unlock_state(state);

Correct.

> 
> I'll prepare and push a V8.

Thanks!

-- 
Regards,

Sakari Ailus

