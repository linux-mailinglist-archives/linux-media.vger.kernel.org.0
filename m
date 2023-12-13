Return-Path: <linux-media+bounces-2221-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D2580EA88
	for <lists+linux-media@lfdr.de>; Tue, 12 Dec 2023 12:39:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 893041C20C8E
	for <lists+linux-media@lfdr.de>; Tue, 12 Dec 2023 11:38:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 747335D4BB;
	Tue, 12 Dec 2023 11:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tre39UJv"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF71DCD;
	Tue, 12 Dec 2023 03:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702381132; x=1733917132;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xq+1mQYTVGfv+QGVue4J7mfgzIK0WKvHLpOtJreygG8=;
  b=Tre39UJv/eOs7UxknITNZSQU3aTX47bGCeaOS058tF1kk0OXrrzKoBNQ
   TOBljpt61ssUfdsQv4L3z1EC73DZHovU7vAt/8pzsaNhGibUdhpyENk8D
   KaD3zZoTTeQV3tnwgVxpDFttfcRTvRp6p0pxtASYez6yhiCoGfrwC800k
   mJOIs23ogVHP0Ponu2HtTt1Fl+DVeGHljqeOG8XtIbYdt8Ey/md3pjqYi
   U0FE5Sb7/MGaGH+SrOwa7HdyVaiKHH/9kA5zSZ2pxC7a6/LNY74wosD2N
   G7D797ZQgSFAGN1/JZMQg0j+5gcgguGV5SG9swMA311XCx5tONlg5j8Pz
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="394541866"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; 
   d="scan'208";a="394541866"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 03:38:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="864179518"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; 
   d="scan'208";a="864179518"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 03:38:45 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id B04BF11F7E4;
	Tue, 12 Dec 2023 13:38:42 +0200 (EET)
Date: Tue, 12 Dec 2023 11:38:42 +0000
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
Message-ID: <ZXhGQuqTZogWTJ42@kekkonen.localdomain>
References: <20231204094719.190334-1-tomm.merciai@gmail.com>
 <20231204094719.190334-4-tomm.merciai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231204094719.190334-4-tomm.merciai@gmail.com>

Hi Tommaso,

On Mon, Dec 04, 2023 at 10:47:16AM +0100, Tommaso Merciai wrote:
> The Alvium camera is shipped with sensor + isp in the same housing.
> The camera can be equipped with one out of various sensor and abstract
> the user from this. Camera is connected via MIPI CSI-2.
> 
> Most of the camera module features are supported, with the main exception
> being fw update.
> 
> The driver provides all mandatory, optional and recommended V4L2 controls
> for maximum compatibility with libcamera
> 
> References:
>  - https://www.alliedvision.com/en/products/embedded-vision-solutions
> 
> Signed-off-by: Tommaso Merciai <tomm.merciai@gmail.com>

Could you run

	./scripts/checkpatch.pl --strict --max-line-length=80

and address the issues in a patch on top of this set?

Thanks.

-- 
Sakari Ailus

