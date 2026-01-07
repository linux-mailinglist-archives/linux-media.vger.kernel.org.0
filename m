Return-Path: <linux-media+bounces-50177-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7012DD00472
	for <lists+linux-media@lfdr.de>; Wed, 07 Jan 2026 23:08:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 682C330640F3
	for <lists+linux-media@lfdr.de>; Wed,  7 Jan 2026 22:06:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 125752F7445;
	Wed,  7 Jan 2026 22:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fuqFCbHU"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792F5277C9A;
	Wed,  7 Jan 2026 22:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767823617; cv=none; b=OD3hgrjPTokImTJlWC3GIIdkXtpOCqZbPy5MwxZVScVZ7BsUbgH80YJ5u8Iq3iYAEazbg3VN72RdLHj7MUS3H4bDYg+Aptt8OX2vBbodGYFRlLSfNbHiq+2N/zI1Sn49Zm+ZGy7ek/fHZ7cCdOPbWD0le80TeOwsydPZh2AORW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767823617; c=relaxed/simple;
	bh=UadDQpXth2y08Ep29A4mQN6A1BcwKvCecGr4DwD/CGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ftTKuG3rWmRw/gCX/uS2x8AiugFju+wRLhwKhd6+iHLSmMp1WHA4WDcrRLGdcmbAM8xPC9QLk+EL/MWA5hqjtcyrenqg0jOQImUd5eRUnGhOdFOa19pRAr2zQBj3NXn0gDT9PdR1iPVv6/pb0/2MJ6jUt1HYI6tu29nAx40X5zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fuqFCbHU; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767823616; x=1799359616;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UadDQpXth2y08Ep29A4mQN6A1BcwKvCecGr4DwD/CGQ=;
  b=fuqFCbHUFM0OY0GqjrrA96JqXjLC7m2yH/dSb+oPoK+xJyF2/NgovzGj
   DuGhG5Av/R0hhWDls2Ul+KLwNRyyjC+hFd9FlT10zuJMblkvc3F6x5UUh
   77MjElf2SGZOYePoBd/4zT3Ht9MhNPL4uz7g3mAMPV4gJEEE8CdgRUBOO
   lYOUnVZtebJf3SqxmpNxWMgYgKy9QOs3oR3wW8/AGxRJYU8tQrvKT2uvQ
   0e5frT1vXRvf+wQcIT/lPPANTMTMsV5VPGEcGahFbgyS17xOx2U+Wg4ky
   TxbozH5kDG27SM8p+ETQZ07hJaIknjq/KU8tv+3mTnCUjH13VcfUMmIF7
   Q==;
X-CSE-ConnectionGUID: /zWvaBF8ScG3wAj+e9zumQ==
X-CSE-MsgGUID: y3/joV3vTD+5KrEciaiLkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="72835494"
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; 
   d="scan'208";a="72835494"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 14:06:55 -0800
X-CSE-ConnectionGUID: i+VpkJMJQcWu7S8Hdgej2A==
X-CSE-MsgGUID: 5TvqWzfHQq2Zk5px1uV2TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; 
   d="scan'208";a="207884628"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.174])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 14:06:50 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 9D9F912074E;
	Thu, 08 Jan 2026 00:07:03 +0200 (EET)
Date: Thu, 8 Jan 2026 00:07:03 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
Cc: robh@kernel.org, krzk+dt@kernel.org,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Svyatoslav Ryhel <clamor95@gmail.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v9 2/2] media: i2c: add os05b10 image sensor driver
Message-ID: <aV7ZB40s7L2PdW21@kekkonen.localdomain>
References: <20260105093420.110973-1-himanshu.bhavani@siliconsignals.io>
 <20260105093420.110973-3-himanshu.bhavani@siliconsignals.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105093420.110973-3-himanshu.bhavani@siliconsignals.io>

Hi Himanshu,

Thanks for the update.

A few comments below... please post a patch on top.

On Mon, Jan 05, 2026 at 03:04:14PM +0530, Himanshu Bhavani wrote:

...

> +static int os05b10_disable_streams(struct v4l2_subdev *sd,
> +				   struct v4l2_subdev_state *state,
> +				   u32 pad, u64 streams_mask)
> +{
> +	struct os05b10 *os05b10 = to_os05b10(sd);
> +	int ret;
> +
> +	ret = cci_write(os05b10->cci, OS05B10_REG_CTRL_MODE,
> +			OS05B10_MODE_STANDBY, NULL);
> +	if (ret)
> +		dev_err(os05b10->dev, "failed to set stream off\n");
> +
> +	pm_runtime_put(os05b10->dev);
> +
> +	return ret;

I'd return 0 here: there's nothing the caller can really do about this.


...

> +static u64 os05b10_pixel_rate(struct os05b10 *os05b10,
> +			      const struct os05b10_mode *mode)
> +{
> +	u64 link_freq = link_frequencies[os05b10->link_freq_index];
> +	const unsigned int lanes = os05b10->data_lanes;
> +	u64 numerator = link_freq * 2 * lanes;
> +	unsigned int bpp = mode->bpp;
> +
> +	do_div(numerator, bpp);
> +
> +	dev_info(os05b10->dev,
> +		 "link_freq=%llu bpp=%u lanes=%u pixel_rate=%llu\n",
> +		 link_freq, bpp, lanes, numerator);

Use dev_dbg() if you print this at all. I wouldn't: it looks like a
development time leftover.

You can also make this more simple by using div_u64(). Also, there's no
really point for have a local variable for everything.

...

> +static int os05b10_probe(struct i2c_client *client)
> +{
> +	struct os05b10 *os05b10;
> +	unsigned int xclk_freq;
> +	unsigned int i;
> +	int ret;
> +
> +	os05b10 = devm_kzalloc(&client->dev, sizeof(*os05b10), GFP_KERNEL);
> +	if (!os05b10)
> +		return -ENOMEM;
> +
> +	os05b10->client = client;
> +	os05b10->dev = &client->dev;
> +
> +	v4l2_i2c_subdev_init(&os05b10->sd, client, &os05b10_subdev_ops);
> +
> +	os05b10->cci = devm_cci_regmap_init_i2c(client, 16);
> +	if (IS_ERR(os05b10->cci))
> +		return dev_err_probe(os05b10->dev, PTR_ERR(os05b10->cci),
> +				     "failed to initialize CCI\n");
> +
> +	os05b10->xclk = devm_v4l2_sensor_clk_get(os05b10->dev, NULL);
> +	if (IS_ERR(os05b10->xclk))
> +		return dev_err_probe(os05b10->dev, PTR_ERR(os05b10->xclk),
> +				     "failed to get xclk\n");
> +
> +	xclk_freq = clk_get_rate(os05b10->xclk);
> +	if (xclk_freq != OS05B10_XCLK_FREQ)
> +		return dev_err_probe(os05b10->dev, -EINVAL,
> +				     "xclk frequency not supported: %d Hz\n",
> +				     xclk_freq);
> +
> +	for (i = 0; i < ARRAY_SIZE(os05b10_supply_name); i++)

You could declare i here -- as unsigned int.

> +		os05b10->supplies[i].supply = os05b10_supply_name[i];
> +

-- 
Kind regards,

Sakari Ailus

