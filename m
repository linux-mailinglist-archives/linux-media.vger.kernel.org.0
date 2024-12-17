Return-Path: <linux-media+bounces-23544-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBDD9F44E7
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 08:17:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D29191648CF
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 07:17:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28E32178362;
	Tue, 17 Dec 2024 07:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="da3ED54h"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0921214D708;
	Tue, 17 Dec 2024 07:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734419829; cv=none; b=berywiwkR8UTTxQB9uY/+SuFoZJC896wlC4MaJwgSWG/F7RiRIg6HnFTRDuJXi3sv5TQhO3wIla5xaIVAS0Lu6pcZIKwto3LnIOoi3Gqt4y1muHa2xugi4UZJGifcJlknacZmxSW+Rll3KoMNzgdYe4jTv/NAWOsg0hBn8UE9Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734419829; c=relaxed/simple;
	bh=rUmwxx4iwWz5DhvmixsJlzZDx6o4DDwIOgjmEOYVhp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CNxiRZLPLyNnKlxjf65p+TLjd1fef3N4XI3Mkl/aPxBqbKn0hu47sriK0JsUsbCm59szx+JJSWKf/wWI2fhdzbnl2EBtFVs5a1sEwm26EyJrW7S13kFJAnS1e387zbc4SGfEXpW8FhliScQa71ikK4Jxt41Cp4XvhHOxAmnGBLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=da3ED54h; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734419829; x=1765955829;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=rUmwxx4iwWz5DhvmixsJlzZDx6o4DDwIOgjmEOYVhp0=;
  b=da3ED54hrLakOfFb1QyLU9fkNK6mlIdckEIF+Rh/R4b++JHI47L4Y/IK
   B+ij1xDZiZ3QPSlRvz5bPMrRUjEjZL5dQp8TE1i2RT8p+UvZTt0vKNuGv
   BnCLjZPlBgVqJMOPtTFhJ8WUbeM56YjtzB2CstursqNE8VKzbdsi6c2xf
   8GYgr7BMz8dfqEJXWTjWb9N51yFHaOp24+ZQb9LleWdcWRZzGjvSx7pzQ
   OPrs/4qKA8CczyQrou7wAYe1zsA+QQe8IQT9DPnyoHmqFauFcMolbwVBt
   HRTYECZkuwxQVyvztuBqjUVdJygnrHanW6IjUgyg78VvQxkJfYwRsoQv3
   A==;
X-CSE-ConnectionGUID: YkzAOXUVQCGM7DyyU2Z3eg==
X-CSE-MsgGUID: avi9tWz+QWibHgO5mBoHIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="34709276"
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; 
   d="scan'208";a="34709276"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 23:17:08 -0800
X-CSE-ConnectionGUID: hhRybTlmS56eD/0lBSrOvg==
X-CSE-MsgGUID: wBpgyAz/S7W9TDEiU/lDSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; 
   d="scan'208";a="97486402"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 23:17:06 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 4E75111F775;
	Tue, 17 Dec 2024 09:17:02 +0200 (EET)
Date: Tue, 17 Dec 2024 07:17:02 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
Cc: Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Vincent Knecht <vincent.knecht@mailoo.org>
Subject: Re: [PATCH v3 07/12] media: i2c: imx214: Add vblank and hblank
 controls
Message-ID: <Z2ElblaV8OBh9ET8@kekkonen.localdomain>
References: <20241207-imx214-v3-0-ab60af7ee915@apitzsch.eu>
 <20241207-imx214-v3-7-ab60af7ee915@apitzsch.eu>
 <CAPybu_0Bdc03UrJNO42S1fBTvpuHUUExvkR1ont7VKdw2XBuKg@mail.gmail.com>
 <76b604796a819d30f5b1725fa9b50b96e01e3589.camel@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <76b604796a819d30f5b1725fa9b50b96e01e3589.camel@apitzsch.eu>

Hi André,

On Sun, Dec 15, 2024 at 11:35:41PM +0100, André Apitzsch wrote:
> > > @@ -626,9 +637,36 @@ static int imx214_set_format(struct
> > > v4l2_subdev *sd,
> > >         __crop->width = mode->width;
> > >         __crop->height = mode->height;
> > > 
> > > -       if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE)
> > > +       if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
> > > +               int exposure_max;
> > > +               int exposure_def;
> > > +               int hblank;
> > > +
> > >                 imx214->cur_mode = mode;
> > > 
> > > +               /* Update FPS limits */
> > nit: Update blank limits
> > > +               __v4l2_ctrl_modify_range(imx214->vblank,
> > > IMX214_VBLANK_MIN,
> > > +                                        IMX214_VTS_MAX - mode-
> > > >height, 2,
> > > +                                        mode->vts_def - mode-
> > > >height);
> > 
> > Is the handler->lock held when we call this function?
> 
> I'm not sure how to test this.

I'd say "yes" because the first patch sets the control handler lock to the
sub-device state lock.

-- 
Regards,

Sakari Ailus

