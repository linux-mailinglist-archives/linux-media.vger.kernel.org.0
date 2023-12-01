Return-Path: <linux-media+bounces-1498-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 29EC88014E3
	for <lists+linux-media@lfdr.de>; Fri,  1 Dec 2023 22:00:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5619281C5A
	for <lists+linux-media@lfdr.de>; Fri,  1 Dec 2023 21:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91B6058ABF;
	Fri,  1 Dec 2023 21:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l//gh1dA"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7615E10E4;
	Fri,  1 Dec 2023 13:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701464442; x=1733000442;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jxSV6/arsYh72F6t/KHKVkr1kkn4oZ2SKA+HsLWZvlw=;
  b=l//gh1dAqMJejqzLdb/IV0lYu7in3bvP5adveHC34NcSi1/xzutq9UtN
   wIMSkkJW5zdgBKOuCv4iIr5A2kDFwnU8UaGxuNlsg1xuc2FrxHaeepjJ8
   YZB92GVeTQocuC7uwgaf+nQVzbrFE5FDqNnvsvODonFduCojBvkocDEJz
   poNCjgIaLGkSFfwOYvU7bruwkLHZdQ1WZyKurW3sbsikDrKdviZilAJkP
   HDt2X/Ik5pg1NcR9oCALBIjDTea6f25hhT2I7bXLgmdUxCRqPtOAMdoFG
   7Tv+CuUSh5uPe+NuTojUA5tsrCsIRFFteD35iCNYhc08MB3NyynS8i7bk
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="397440652"
X-IronPort-AV: E=Sophos;i="6.04,242,1695711600"; 
   d="scan'208";a="397440652"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2023 13:00:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="893301312"
X-IronPort-AV: E=Sophos;i="6.04,242,1695711600"; 
   d="scan'208";a="893301312"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2023 13:00:36 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 6269E11F915;
	Fri,  1 Dec 2023 23:00:33 +0200 (EET)
Date: Fri, 1 Dec 2023 21:00:33 +0000
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
	Gerald Loacker <gerald.loacker@wolfvision.net>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Daniel Scally <djrscally@gmail.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v14 3/3] media: i2c: Add support for alvium camera
Message-ID: <ZWpJcS7aJmnRm1CB@kekkonen.localdomain>
References: <20231124093011.2095073-1-tomm.merciai@gmail.com>
 <20231124093011.2095073-4-tomm.merciai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231124093011.2095073-4-tomm.merciai@gmail.com>

Hi Tommaso,

A few more comments below...

On Fri, Nov 24, 2023 at 10:30:07AM +0100, Tommaso Merciai wrote:

...

> +static int alvium_get_bcrm_vers(struct alvium_dev *alvium)
> +{
> +	struct device *dev = &alvium->i2c_client->dev;
> +	struct alvium_bcrm_vers *v;
> +	u64 val;
> +	int ret;
> +
> +	ret = alvium_read(alvium, REG_BCRM_VERSION_R, &val, NULL);
> +	if (ret)
> +		return ret;
> +
> +	v = (struct alvium_bcrm_vers *)&val;

You're still reading the entire struct using a single read. :-( This won't
work on a BE machine as while the struct fields are in the same memory
locations, the respective data in a single 64-bit value is not.

> +
> +	dev_info(dev, "bcrm version: %u.%u\n", v->minor, v->major);
> +
> +	return 0;
> +}
> +
> +static int alvium_get_fw_version(struct alvium_dev *alvium)
> +{
> +	struct device *dev = &alvium->i2c_client->dev;
> +	struct alvium_fw_vers *fw_v;
> +	u64 val;
> +	int ret;
> +
> +	ret = alvium_read(alvium, REG_BCRM_DEVICE_FIRMWARE_VERSION_R, &val, NULL);
> +	if (ret)
> +		return ret;
> +
> +	fw_v = (struct alvium_fw_vers *)&val;

Same here.

> +
> +	dev_info(dev, "fw version: %u.%u.%u.%u\n", fw_v->special, fw_v->major,
> +		 fw_v->minor, fw_v->patch);
> +
> +	return 0;
> +}
> +
> +static int alvium_get_bcrm_addr(struct alvium_dev *alvium)
> +{
> +	u64 val;
> +	int ret;
> +
> +	ret = alvium_read(alvium, REG_BCRM_REG_ADDR_R, &val, NULL);
> +	if (ret)
> +		return ret;
> +
> +	alvium->bcrm_addr = val;
> +
> +	return 0;
> +}

...

> +static int alvium_setup_mipi_fmt(struct alvium_dev *alvium)
> +{
> +	unsigned int avail_fmt_cnt = 0;
> +	unsigned int fmt = 0;
> +	size_t sz = 0;
> +
> +	alvium->alvium_csi2_fmt = NULL;

This seems to be unnnecessary: the field is assigned below without using it
(obviously).

> +
> +	/* calculate fmt array size */
> +	for (fmt = 0; fmt < ALVIUM_NUM_SUPP_MIPI_DATA_FMT; fmt++) {
> +		if (!alvium->is_mipi_fmt_avail[alvium_csi2_fmts[fmt].fmt_av_bit])
> +			continue;
> +
> +		if ((!alvium_csi2_fmts[fmt].is_raw) ||
> +		    (alvium->is_bay_avail[alvium_csi2_fmts[fmt].bay_av_bit]))
> +			sz++;
> +	}
> +
> +	/* init alvium_csi2_fmt array */
> +	alvium->alvium_csi2_fmt_n = sz;
> +	alvium->alvium_csi2_fmt =
> +		kmalloc_array(sz, sizeof(struct alvium_pixfmt), GFP_KERNEL);
> +	if (!alvium->alvium_csi2_fmt)
> +		return -ENOMEM;
> +
> +	/* Create the alvium_csi2 fmt array from formats available */
> +	for (fmt = 0; fmt < ALVIUM_NUM_SUPP_MIPI_DATA_FMT; fmt++) {
> +		if (!alvium->is_mipi_fmt_avail[alvium_csi2_fmts[fmt].fmt_av_bit])
> +			continue;
> +
> +		if ((!alvium_csi2_fmts[fmt].is_raw) ||
> +		    (alvium->is_bay_avail[alvium_csi2_fmts[fmt].bay_av_bit])) {
> +			alvium->alvium_csi2_fmt[avail_fmt_cnt] = alvium_csi2_fmts[fmt];
> +			avail_fmt_cnt++;
> +		}
> +	}
> +
> +	return 0;
> +}

...

> +static const struct alvium_pixfmt *
> +alvium_code_to_pixfmt(struct alvium_dev *alvium, u32 code)
> +{
> +	const struct alvium_pixfmt *formats = alvium->alvium_csi2_fmt;

I'd use alvium->alvium_csi2_fmt and not add a local variable. Up to you.

> +	unsigned int i;
> +
> +	for (i = 0; formats[i].code; ++i)
> +		if (formats[i].code == code)
> +			return &formats[i];
> +
> +	return &formats[0];
> +}
> +
> +static int alvium_set_mode(struct alvium_dev *alvium,
> +			   struct v4l2_subdev_state *state)
> +{
> +	struct v4l2_mbus_framefmt *fmt;
> +	struct v4l2_rect *crop;
> +	int ret;
> +
> +	crop = v4l2_subdev_state_get_crop(state, 0);
> +	fmt = v4l2_subdev_state_get_format(state, 0);
> +
> +	v4l_bound_align_image(&fmt->width, alvium->img_min_width,
> +			      alvium->img_max_width, 0,
> +			      &fmt->height, alvium->img_min_height,
> +			      alvium->img_max_height, 0, 0);
> +
> +	/* alvium don't accept negative crop left/top */
> +	crop->left = clamp((u32)max(0, crop->left), alvium->min_offx,
> +			   (u32)(alvium->img_max_width - fmt->width));
> +	crop->top = clamp((u32)max(0, crop->top), alvium->min_offy,
> +			  (u32)(alvium->img_max_height - fmt->height));
> +
> +	ret = alvium_set_img_width(alvium, fmt->width);
> +	if (ret)
> +		return ret;
> +
> +	ret = alvium_set_img_height(alvium, fmt->height);
> +	if (ret)
> +		return ret;
> +
> +	ret = alvium_set_img_offx(alvium, crop->left);
> +	if (ret)
> +		return ret;
> +
> +	ret = alvium_set_img_offy(alvium, crop->top);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}

-- 
Kind regards,

Sakari Ailus

