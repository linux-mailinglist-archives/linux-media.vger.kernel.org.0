Return-Path: <linux-media+bounces-64527-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aZHcIOwQKmqYiAMAu9opvQ
	(envelope-from <linux-media+bounces-64527-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 03:35:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D508966DA6A
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 03:35:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=aVP0NQta;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64527-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64527-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 31A6030B5E21
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 01:35:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF6B2230264;
	Thu, 11 Jun 2026 01:35:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FAA2248B4
	for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 01:35:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781141735; cv=none; b=JlN1BvzMmC7xxOzhw9S97CJQFy9FjgdF09K9FNRZAm4wVU99h+FaF81fQzzbMh9JNA2MhLB5Dqjoc5ZJvbyFY2V1fWEoUzYgeKtKgZMTymoGzOlIZQQbdy8pJATyJHRquxag6yGE5wPthFVOrJ2CnxRW/uG1mDPhhwsfwr+06dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781141735; c=relaxed/simple;
	bh=Q3fv9vEqSXL3FLDwYu4gheLfzZFk+EzdIqzvZRTkTlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fujlLMXQBV+uPiQvzR2SkUN2mKtaddYrE1cFKU00FeZCMBOJi8v3xC1ZP5IGC/zeBbP+RtJAzPJaU7fd1eDkU062tbHit8PTObJgxxtvpn6UPuD6kO0YzMov4JRNaQRVZ7vpfAsLmLXI6jo/w6EgyN0qKEQ/fgNx79+7ZUTuyqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aVP0NQta; arc=none smtp.client-ip=198.175.65.20
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781141733; x=1812677733;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Q3fv9vEqSXL3FLDwYu4gheLfzZFk+EzdIqzvZRTkTlw=;
  b=aVP0NQtavDj4aGSs45ovWOIO7ST4qVEtOmjDarKE5n4kX57jQ9LYfJiR
   jcgY4fhTLsVgSXbPydA7btzxS1usZOVSgw2e97DceNj5PRkjKCoqc7ERt
   y29GgH9l8MZwyFC0EvzMpYDcTknJkdwj3tt9I2NQP7JjowEHlbrWNDE3W
   rCyXR/HSCO6jVb+EGtlbVYnFlpbQsSiSn+7i5PYl9/2xrwIgD8/mv/bn9
   VRMsCMXDnLT0ToAYQaetNLeUKeaCn6v3C64MQmr40dxCJk9OQ/ZymCyZW
   UBC+OzcFvlCvI7b/Samhti07Rnu7Dgq3hpXsr/lefo3ce9TxAJYqlbWJx
   Q==;
X-CSE-ConnectionGUID: 16RIx/MrSNuPgQweKgvBvg==
X-CSE-MsgGUID: jAgzMUwnSeubAu9pt2gtYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81692777"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="81692777"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 18:35:33 -0700
X-CSE-ConnectionGUID: e6PhgjCYThSIIXvFR4F0pw==
X-CSE-MsgGUID: AZvAZytvRDeEekxMGPBb3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="245455656"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 10 Jun 2026 18:35:31 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXUKN-00000000M7e-2vcm;
	Thu, 11 Jun 2026 01:35:27 +0000
Date: Thu, 11 Jun 2026 09:34:33 +0800
From: kernel test robot <lkp@intel.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	Jai Luthra <jai.luthra@ideasonboard.com>
Subject: Re: [PATCH v2] media: i2c: imx219: Fix PIXEL_RATE for special
 binning mode
Message-ID: <202606110952.Y6lTwJmm-lkp@intel.com>
References: <20260610-imx219-pixelrate-v2-1-45d1d201cd6b@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610-imx219-pixelrate-v2-1-45d1d201cd6b@ideasonboard.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64527-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:jai.luthra@ideasonboard.com,m:sakari.ailus@linux.intel.com,m:dave.stevenson@raspberrypi.com,m:mchehab@kernel.org,m:laurent.pinchart@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:oe-kbuild-all@lists.linux.dev,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,intel.com:dkim,intel.com:email,intel.com:mid,intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D508966DA6A

Hi Jai,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 254f49634ee16a731174d2ae34bc50bd5f45e731]

url:    https://github.com/intel-lab-lkp/linux/commits/Jai-Luthra/media-i2c-imx219-Fix-PIXEL_RATE-for-special-binning-mode/20260610-154526
base:   254f49634ee16a731174d2ae34bc50bd5f45e731
patch link:    https://lore.kernel.org/r/20260610-imx219-pixelrate-v2-1-45d1d201cd6b%40ideasonboard.com
patch subject: [PATCH v2] media: i2c: imx219: Fix PIXEL_RATE for special binning mode
config: sh-randconfig-002-20260611 (https://download.01.org/0day-ci/archive/20260611/202606110952.Y6lTwJmm-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260611/202606110952.Y6lTwJmm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606110952.Y6lTwJmm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/i2c/imx219.c: In function 'imx219_set_pad_format':
>> drivers/media/i2c/imx219.c:861:6: warning: variable 'prev_line_len' set but not used [-Wunused-but-set-variable]
     861 |  u32 prev_line_len;
         |      ^~~~~~~~~~~~~


vim +/prev_line_len +861 drivers/media/i2c/imx219.c

1283b3b8f82b90 Dave Stevenson   2020-01-20  851  
d03dfb7d4c5fae Laurent Pinchart 2023-09-24  852  static int imx219_set_pad_format(struct v4l2_subdev *sd,
bf313f998f7445 Laurent Pinchart 2023-09-24  853  				 struct v4l2_subdev_state *state,
d03dfb7d4c5fae Laurent Pinchart 2023-09-24  854  				 struct v4l2_subdev_format *fmt)
1283b3b8f82b90 Dave Stevenson   2020-01-20  855  {
d03dfb7d4c5fae Laurent Pinchart 2023-09-24  856  	struct imx219 *imx219 = to_imx219(sd);
d03dfb7d4c5fae Laurent Pinchart 2023-09-24  857  	const struct imx219_mode *mode;
d03dfb7d4c5fae Laurent Pinchart 2023-09-24  858  	struct v4l2_mbus_framefmt *format;
d03dfb7d4c5fae Laurent Pinchart 2023-09-24  859  	struct v4l2_rect *crop;
9ef6e4db152c34 Dave Stevenson   2025-10-17  860  	u8 bin_h, bin_v, binning;
cd5e2fd89923f1 Dave Stevenson   2025-02-04 @861  	u32 prev_line_len;
dff10c7044e877 Tarang Raval     2025-10-31  862  	int ret;
cd5e2fd89923f1 Dave Stevenson   2025-02-04  863  
cd5e2fd89923f1 Dave Stevenson   2025-02-04  864  	format = v4l2_subdev_state_get_format(state, 0);
cd5e2fd89923f1 Dave Stevenson   2025-02-04  865  	prev_line_len = format->width + imx219->hblank->val;
1283b3b8f82b90 Dave Stevenson   2020-01-20  866  
59b9548e50d2c5 Laurent Pinchart 2023-08-19  867  	/*
59b9548e50d2c5 Laurent Pinchart 2023-08-19  868  	 * Adjust the requested format to match the closest mode. The Bayer
59b9548e50d2c5 Laurent Pinchart 2023-08-19  869  	 * order varies with flips.
59b9548e50d2c5 Laurent Pinchart 2023-08-19  870  	 */
d03dfb7d4c5fae Laurent Pinchart 2023-09-24  871  	mode = v4l2_find_nearest_size(supported_modes,
d03dfb7d4c5fae Laurent Pinchart 2023-09-24  872  				      ARRAY_SIZE(supported_modes),
d03dfb7d4c5fae Laurent Pinchart 2023-09-24  873  				      width, height,
d03dfb7d4c5fae Laurent Pinchart 2023-09-24  874  				      fmt->format.width, fmt->format.height);
1283b3b8f82b90 Dave Stevenson   2020-01-20  875  
59b9548e50d2c5 Laurent Pinchart 2023-08-19  876  	fmt->format.code = imx219_get_format_code(imx219, fmt->format.code);
59b9548e50d2c5 Laurent Pinchart 2023-08-19  877  	fmt->format.width = mode->width;
59b9548e50d2c5 Laurent Pinchart 2023-08-19  878  	fmt->format.height = mode->height;
59b9548e50d2c5 Laurent Pinchart 2023-08-19  879  	fmt->format.field = V4L2_FIELD_NONE;
59b9548e50d2c5 Laurent Pinchart 2023-08-19  880  	fmt->format.colorspace = V4L2_COLORSPACE_RAW;
59b9548e50d2c5 Laurent Pinchart 2023-08-19  881  	fmt->format.ycbcr_enc = V4L2_YCBCR_ENC_601;
59b9548e50d2c5 Laurent Pinchart 2023-08-19  882  	fmt->format.quantization = V4L2_QUANTIZATION_FULL_RANGE;
59b9548e50d2c5 Laurent Pinchart 2023-08-19  883  	fmt->format.xfer_func = V4L2_XFER_FUNC_NONE;
59b9548e50d2c5 Laurent Pinchart 2023-08-19  884  
d03dfb7d4c5fae Laurent Pinchart 2023-09-24  885  	*format = fmt->format;
0af46fbc333d1a Laurent Pinchart 2023-09-24  886  
0af46fbc333d1a Laurent Pinchart 2023-09-24  887  	/*
0af46fbc333d1a Laurent Pinchart 2023-09-24  888  	 * Use binning to maximize the crop rectangle size, and centre it in the
0af46fbc333d1a Laurent Pinchart 2023-09-24  889  	 * sensor.
0af46fbc333d1a Laurent Pinchart 2023-09-24  890  	 */
0af46fbc333d1a Laurent Pinchart 2023-09-24  891  	bin_h = min(IMX219_PIXEL_ARRAY_WIDTH / format->width, 2U);
0af46fbc333d1a Laurent Pinchart 2023-09-24  892  	bin_v = min(IMX219_PIXEL_ARRAY_HEIGHT / format->height, 2U);
0af46fbc333d1a Laurent Pinchart 2023-09-24  893  
9ef6e4db152c34 Dave Stevenson   2025-10-17  894  	/* Ensure bin_h and bin_v are same to avoid 1:2 or 2:1 stretching */
9ef6e4db152c34 Dave Stevenson   2025-10-17  895  	binning = min(bin_h, bin_v);
9ef6e4db152c34 Dave Stevenson   2025-10-17  896  
bc0e8d91feec72 Sakari Ailus     2023-10-13  897  	crop = v4l2_subdev_state_get_crop(state, 0);
9ef6e4db152c34 Dave Stevenson   2025-10-17  898  	crop->width = format->width * binning;
9ef6e4db152c34 Dave Stevenson   2025-10-17  899  	crop->height = format->height * binning;
0af46fbc333d1a Laurent Pinchart 2023-09-24  900  	crop->left = (IMX219_NATIVE_WIDTH - crop->width) / 2;
0af46fbc333d1a Laurent Pinchart 2023-09-24  901  	crop->top = (IMX219_NATIVE_HEIGHT - crop->height) / 2;
d03dfb7d4c5fae Laurent Pinchart 2023-09-24  902  
d03dfb7d4c5fae Laurent Pinchart 2023-09-24  903  	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
3116df4d761558 Jai Luthra       2026-06-10  904  		int exposure_max, exposure_def;
3116df4d761558 Jai Luthra       2026-06-10  905  		int llp_min, hblank, hblank_max;
3116df4d761558 Jai Luthra       2026-06-10  906  		u32 fll_factor = imx219_get_fll_factor(state);
ef202378ccdd23 Laurent Pinchart 2023-09-24  907  
3116df4d761558 Jai Luthra       2026-06-10  908  		/*
3116df4d761558 Jai Luthra       2026-06-10  909  		 * Update VBLANK range and default value to match the mode.
3116df4d761558 Jai Luthra       2026-06-10  910  		 * Also fix the step-size to fll_factor, as we halve the values
3116df4d761558 Jai Luthra       2026-06-10  911  		 * before writing to the register when special binning is used.
3116df4d761558 Jai Luthra       2026-06-10  912  		 */
dff10c7044e877 Tarang Raval     2025-10-31  913  		ret = __v4l2_ctrl_modify_range(imx219->vblank, IMX219_VBLANK_MIN,
3116df4d761558 Jai Luthra       2026-06-10  914  					       IMX219_FLL_MAX - mode->height,
3116df4d761558 Jai Luthra       2026-06-10  915  					       fll_factor, mode->fll_def -
3116df4d761558 Jai Luthra       2026-06-10  916  					       mode->height);
dff10c7044e877 Tarang Raval     2025-10-31  917  		if (ret)
dff10c7044e877 Tarang Raval     2025-10-31  918  			return ret;
dff10c7044e877 Tarang Raval     2025-10-31  919  
dff10c7044e877 Tarang Raval     2025-10-31  920  		ret = __v4l2_ctrl_s_ctrl(imx219->vblank,
04f78503f99ae7 Jai Luthra       2025-02-04  921  					 mode->fll_def - mode->height);
dff10c7044e877 Tarang Raval     2025-10-31  922  		if (ret)
dff10c7044e877 Tarang Raval     2025-10-31  923  			return ret;
dff10c7044e877 Tarang Raval     2025-10-31  924  
d03dfb7d4c5fae Laurent Pinchart 2023-09-24  925  		/* Update max exposure while meeting expected vblanking */
9a9ba098e7ba6b Tarang Raval     2025-10-31  926  		exposure_max = mode->fll_def - IMX219_EXPOSURE_OFFSET;
d03dfb7d4c5fae Laurent Pinchart 2023-09-24  927  		exposure_def = (exposure_max < IMX219_EXPOSURE_DEFAULT) ?
d03dfb7d4c5fae Laurent Pinchart 2023-09-24  928  				exposure_max : IMX219_EXPOSURE_DEFAULT;
dff10c7044e877 Tarang Raval     2025-10-31  929  		ret = __v4l2_ctrl_modify_range(imx219->exposure,
d03dfb7d4c5fae Laurent Pinchart 2023-09-24  930  					       imx219->exposure->minimum,
dff10c7044e877 Tarang Raval     2025-10-31  931  					       exposure_max,
dff10c7044e877 Tarang Raval     2025-10-31  932  					       imx219->exposure->step,
d03dfb7d4c5fae Laurent Pinchart 2023-09-24  933  					       exposure_def);
dff10c7044e877 Tarang Raval     2025-10-31  934  		if (ret)
dff10c7044e877 Tarang Raval     2025-10-31  935  			return ret;
5de9a5165fa71e Jai Luthra       2025-02-21  936  
5de9a5165fa71e Jai Luthra       2025-02-21  937  		/*
3116df4d761558 Jai Luthra       2026-06-10  938  		 * With special analog binning the default minimum line length
3116df4d761558 Jai Luthra       2026-06-10  939  		 * of 3448 can cause artefacts with RAW10 formats, possibly
3116df4d761558 Jai Luthra       2026-06-10  940  		 * because the sensor is averaging 4 pixels in the analogue
3116df4d761558 Jai Luthra       2026-06-10  941  		 * domain as opposed to just 2, but we don't know for sure.
3116df4d761558 Jai Luthra       2026-06-10  942  		 *
3116df4d761558 Jai Luthra       2026-06-10  943  		 * The datasheet is lacking on this topic but experimental
3116df4d761558 Jai Luthra       2026-06-10  944  		 * results and some vendor tables point to using a higher
3116df4d761558 Jai Luthra       2026-06-10  945  		 * minimum of 3560, which fixes the issue.
5de9a5165fa71e Jai Luthra       2025-02-21  946  		 */
5de9a5165fa71e Jai Luthra       2025-02-21  947  		imx219_get_binning(state, &bin_h, &bin_v);
5de9a5165fa71e Jai Luthra       2025-02-21  948  		llp_min = (bin_h & bin_v) == IMX219_BINNING_X2_ANALOG ?
5de9a5165fa71e Jai Luthra       2025-02-21  949  				  IMX219_BINNED_LLP_MIN : IMX219_LLP_MIN;
3116df4d761558 Jai Luthra       2026-06-10  950  
3116df4d761558 Jai Luthra       2026-06-10  951  		hblank = (llp_min / fll_factor) - mode->width;
3116df4d761558 Jai Luthra       2026-06-10  952  		hblank_max = (IMX219_LLP_MAX / fll_factor) - mode->width;
3116df4d761558 Jai Luthra       2026-06-10  953  		ret = __v4l2_ctrl_modify_range(imx219->hblank, hblank,
3116df4d761558 Jai Luthra       2026-06-10  954  					       hblank_max, 1, hblank);
dff10c7044e877 Tarang Raval     2025-10-31  955  		if (ret)
dff10c7044e877 Tarang Raval     2025-10-31  956  			return ret;
3116df4d761558 Jai Luthra       2026-06-10  957  
d03dfb7d4c5fae Laurent Pinchart 2023-09-24  958  		/*
3116df4d761558 Jai Luthra       2026-06-10  959  		 * Update HBLANK to default value.
d03dfb7d4c5fae Laurent Pinchart 2023-09-24  960  		 */
dff10c7044e877 Tarang Raval     2025-10-31  961  		ret = __v4l2_ctrl_s_ctrl(imx219->hblank, hblank);
dff10c7044e877 Tarang Raval     2025-10-31  962  		if (ret)
dff10c7044e877 Tarang Raval     2025-10-31  963  			return ret;
1283b3b8f82b90 Dave Stevenson   2020-01-20  964  	}
1283b3b8f82b90 Dave Stevenson   2020-01-20  965  
d03dfb7d4c5fae Laurent Pinchart 2023-09-24  966  	return 0;
1283b3b8f82b90 Dave Stevenson   2020-01-20  967  }
1283b3b8f82b90 Dave Stevenson   2020-01-20  968  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

