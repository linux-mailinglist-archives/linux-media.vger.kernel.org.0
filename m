Return-Path: <linux-media+bounces-2225-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1622E80EAC6
	for <lists+linux-media@lfdr.de>; Tue, 12 Dec 2023 12:48:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5710BB20D8B
	for <lists+linux-media@lfdr.de>; Tue, 12 Dec 2023 11:48:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 320C75DF0F;
	Tue, 12 Dec 2023 11:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vs6qoRqs"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B32F4D9;
	Tue, 12 Dec 2023 03:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702381682; x=1733917682;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=C88BH7kQ+Tml6p1PsEMogJ/FdONSdDo+cGr0kn35/6I=;
  b=Vs6qoRqsqx2OhVfUE+5KsGTRZLS9oCPIurfh0WGA58lWbzQhVC9SQeKL
   YIfBH7968IQOi8Ocs3xU90Tj0EPcDh0GrVsaIJVA8ohopj9yzBey7Sw30
   Mb7mTUEKpoYH55k7hQ9SnVmhedlPEBpy4lh0wcsGzXQyXeYBl1RHMrLtm
   07g1COQxi54wX85S9m+5a1lB48K+xUFtHxfXXwIP9osSmC1Y0PaL0IqCq
   jPdt5gkxsyDIjy0tjoGiLxW4FMPHqq1SppQarAwpTlskfwdK2IzsXDyvt
   mlLKgR7HwKYPfv9KCU9QpF4NefRMzfNV1TLY+nUpCDC6blWSo9SCzgOmz
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="1633771"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; 
   d="scan'208";a="1633771"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 03:48:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="896893666"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; 
   d="scan'208";a="896893666"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 03:47:55 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E4E4311F7E4;
	Tue, 12 Dec 2023 13:47:52 +0200 (EET)
Date: Tue, 12 Dec 2023 11:47:52 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tommaso Merciai <tomm.merciai@gmail.com>
Cc: laurent.pinchart@ideasonboard.com, martin.hecht@avnet.eu,
	michael.roeder@avnet.eu, linuxfancy@googlegroups.com,
	mhecht73@gmail.com, christophe.jaillet@wanadoo.fr,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Gerald Loacker <gerald.loacker@wolfvision.net>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Daniel Scally <djrscally@gmail.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v15 3/3] media: i2c: Add support for alvium camera
Message-ID: <ZXhIaB_NTDtSJmj5@kekkonen.localdomain>
References: <20231204094719.190334-1-tomm.merciai@gmail.com>
 <20231204094719.190334-4-tomm.merciai@gmail.com>
 <ZXhGQuqTZogWTJ42@kekkonen.localdomain>
 <ZXhHrhNQfn0uJMjk@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZXhHrhNQfn0uJMjk@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>

Hi Tommaso,

On Tue, Dec 12, 2023 at 12:44:46PM +0100, Tommaso Merciai wrote:
> Hi Sakari,
> 
> On Tue, Dec 12, 2023 at 11:38:42AM +0000, Sakari Ailus wrote:
> > Hi Tommaso,
> > 
> > On Mon, Dec 04, 2023 at 10:47:16AM +0100, Tommaso Merciai wrote:
> > > The Alvium camera is shipped with sensor + isp in the same housing.
> > > The camera can be equipped with one out of various sensor and abstract
> > > the user from this. Camera is connected via MIPI CSI-2.
> > > 
> > > Most of the camera module features are supported, with the main exception
> > > being fw update.
> > > 
> > > The driver provides all mandatory, optional and recommended V4L2 controls
> > > for maximum compatibility with libcamera
> > > 
> > > References:
> > >  - https://www.alliedvision.com/en/products/embedded-vision-solutions
> > > 
> > > Signed-off-by: Tommaso Merciai <tomm.merciai@gmail.com>
> > 
> > Could you run
> > 
> > 	./scripts/checkpatch.pl --strict --max-line-length=80
> > 
> > and address the issues in a patch on top of this set?
> > 
> 
> Yes ofc.
> You need also the following?
> 
> --- a/drivers/media/i2c/alvium-csi2.c
> +++ b/drivers/media/i2c/alvium-csi2.c
> @@ -2426,8 +2426,8 @@ static int alvium_probe(struct i2c_client *client)
>                 goto err_powerdown;
> 
>         if (!alvium_is_alive(alvium)) {
> -               dev_err_probe(dev, ret, "Device detection failed\n");
>                 ret = -ENODEV;
> +               dev_err_probe(dev, ret, "Device detection failed\n");
>                 goto err_powerdown;
>         }
> 
> Let me know. Thanks for your work.

Thank you, but I've already addressed that in my tree.

-- 
Sakari Ailus

