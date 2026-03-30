Return-Path: <linux-media+bounces-57594-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BGnEklTymn27gUAu9opvQ
	(envelope-from <linux-media+bounces-57594-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 12:41:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9233598C8
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 12:41:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DAB7230172C8
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 10:38:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D24343BE622;
	Mon, 30 Mar 2026 10:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dTSzvTzk"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1193BE15E
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 10:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774867102; cv=none; b=HmQqA+Zc+apqzQePnDdQNcPM7wbbrv5qgiAk4/gSwKkLwfbGDt2kTF7YN6STwHeGkA4VfSUTq5Maa7iDN2D85bpMuNXYXBT8B1xdh5yzyTBIAI/2ys528l+2bMoUE2bZ+NZ0Anjz4f2r021D1TVPCZzB5IKVD148901o02OGUmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774867102; c=relaxed/simple;
	bh=3QmQRuICEKYBrt5Bb8Pn20XSlBKTKzSdRuZlTuuyw0U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lHDFLsV8He7G3r/1Tmn00pisPgvu+QdM6VLMf5N9YvCA+hMYkdYO7vHVvil+Sz7V4OdvGDSYcnVoXkINtuT56k9AwG7V7/aRQSAapR82v79jgX76OuZ3PZTYtjmOTPDLfAYslg9OkSCeq28aa3mUuLtf8Md/8UYZWfhfV9Qw63I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dTSzvTzk; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774867098; x=1806403098;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3QmQRuICEKYBrt5Bb8Pn20XSlBKTKzSdRuZlTuuyw0U=;
  b=dTSzvTzkMoJF+9cKsMCJdenj0lOcnDV0uLxwFD4x8X6ZEnLoyoZPDSH0
   Keezy1IHoamddfr/v89uapHrOuCByEUwqLZ2ZUx1nEsO+q5nptTRpcl05
   5+EbfKGdnBiaT2Y6LC8xkgVCGQqRKZpGoUo6BGHKvjXiNXzurnd9hX+yX
   J9dMqMgYDboxNPBIFdXXy3Svh1UMx09LyG4ttTCW+74bdp2Z0kljTPQ1/
   mm2XoxBJvTmh5TjKw37wIbhD3QL2Run/Nf+h6WhDLqb2tHRmBZW5Yb5jO
   YiAMOrTMQ+zC4zRCn1HGPK9LmRmrnxsAdkwoN68tCul/fowO6jD23z0k+
   w==;
X-CSE-ConnectionGUID: WA43BExxR76RQLHxlylxTw==
X-CSE-MsgGUID: kBWiMmpxTWemzFkochOlhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="79458705"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="79458705"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 03:38:17 -0700
X-CSE-ConnectionGUID: OLi0n7mOSeC9WGeYFxCHXg==
X-CSE-MsgGUID: 6zWwlRTITxmMPWVyNz7TOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="221620760"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.83])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 03:38:15 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id EC8AE11F83B;
	Mon, 30 Mar 2026 13:38:20 +0300 (EEST)
Date: Mon, 30 Mar 2026 13:38:20 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev, Kate Hsuan <hpa@redhat.com>, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [linuxtv-media-pending:next 165/183]
 drivers/media/i2c/t4ka3.c:577 t4ka3_enable_stream() warn:
 pm_runtime_get_sync() also returns 1 on success
Message-ID: <acpSnDp7qaIk9gDI@kekkonen.localdomain>
References: <acpCusUjXndiISEI@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acpCusUjXndiISEI@stanley.mountain>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-57594-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:dkim,intel.com:email,kekkonen.localdomain:mid,linuxtv.org:url]
X-Rspamd-Queue-Id: DD9233598C8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Dan,

Thanks for looking into this.

On Mon, Mar 30, 2026 at 12:30:34PM +0300, Dan Carpenter wrote:
> tree:   https://git.linuxtv.org/media-ci/media-pending.git next
> head:   4fbeef21f5387234111b5d52924e77757626faa5
> commit: fd55319692151de2b89c21356d1445bce364769b [165/183] media: Add t4ka3 camera sensor driver
> config: um-randconfig-r072-20260327 (https://download.01.org/0day-ci/archive/20260328/202603280011.CCbaQy6n-lkp@intel.com/config)
> compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
> rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
> smatch: v0.5.0-9004-gb810ac53
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Closes: https://lore.kernel.org/r/202603280011.CCbaQy6n-lkp@intel.com/
> 
> smatch warnings:
> drivers/media/i2c/t4ka3.c:577 t4ka3_enable_stream() warn: pm_runtime_get_sync() also returns 1 on success
> 
> vim +577 drivers/media/i2c/t4ka3.c
> 
> fd55319692151d Kate Hsuan 2026-03-25  558  static int t4ka3_enable_stream(struct v4l2_subdev *sd,
> fd55319692151d Kate Hsuan 2026-03-25  559  			       struct v4l2_subdev_state *state,
> fd55319692151d Kate Hsuan 2026-03-25  560  			       u32 pad, u64 streams_mask)
> fd55319692151d Kate Hsuan 2026-03-25  561  {
> fd55319692151d Kate Hsuan 2026-03-25  562  	struct t4ka3_data *sensor = to_t4ka3_sensor(sd);
> fd55319692151d Kate Hsuan 2026-03-25  563  	int ret;
> fd55319692151d Kate Hsuan 2026-03-25  564  
> fd55319692151d Kate Hsuan 2026-03-25  565  	ret = pm_runtime_get_sync(sensor->sd.dev);
> fd55319692151d Kate Hsuan 2026-03-25  566  	if (ret < 0) {
> 
> pm_runtime_get_sync can return either zero or one on success.
> (See the comments next to that function).  Probably use
> pm_runtime_resume_and_get() instead.

Sounds good.

> 
> fd55319692151d Kate Hsuan 2026-03-25  567  		dev_err(sensor->dev, "power-up err.\n");
> fd55319692151d Kate Hsuan 2026-03-25  568  		goto error_powerdown;
> fd55319692151d Kate Hsuan 2026-03-25  569  	}
> fd55319692151d Kate Hsuan 2026-03-25  570  
> fd55319692151d Kate Hsuan 2026-03-25  571  	cci_multi_reg_write(sensor->regmap, t4ka3_init_config,
> fd55319692151d Kate Hsuan 2026-03-25  572  			    ARRAY_SIZE(t4ka3_init_config), &ret);
> 
> If we pass 1 to cci_multi_reg_write() it is treated
> as an error and it returns immediately.

I'd make cci_multi_reg_write(), or rather all V4L2 CCI API to set positive
error values to zero. The documentation already says the functions return
"negative error codes or zero" but they don't quite work that way.

Just doing

	if (err)
		*err = min(*err, 0);

or merging that to the existing if () there would do the trick.

The documentation could be improved, too: @err documentation just says the
function errors out if @err is set (vs. it being a negative error code). I
think just checking for a negative value is sufficient.

I think the reason why it's like this is that there never was much thinking
how return values obtained elsewhere would interact with V4L2 CCI, which
by itself always returns zero or a negative error code, given originally 0
is passed as *err.

> 
> fd55319692151d Kate Hsuan 2026-03-25  573  	/* enable group hold */
> fd55319692151d Kate Hsuan 2026-03-25  574  	cci_write(sensor->regmap, T4KA3_REG_PARAM_HOLD, 1, &ret);
> fd55319692151d Kate Hsuan 2026-03-25  575  	cci_multi_reg_write(sensor->regmap, t4ka3_pre_mode_set_regs,
> fd55319692151d Kate Hsuan 2026-03-25  576  			    ARRAY_SIZE(t4ka3_pre_mode_set_regs), &ret);
> fd55319692151d Kate Hsuan 2026-03-25 @577  	if (ret)
> fd55319692151d Kate Hsuan 2026-03-25  578  		goto error_powerdown;
> 
> And we error out here with ret == 1.
> 
> fd55319692151d Kate Hsuan 2026-03-25  579  
> fd55319692151d Kate Hsuan 2026-03-25  580  	ret = t4ka3_set_mode(sensor, state);
> fd55319692151d Kate Hsuan 2026-03-25  581  	if (ret)
> fd55319692151d Kate Hsuan 2026-03-25  582  		goto error_powerdown;
> fd55319692151d Kate Hsuan 2026-03-25  583  
> fd55319692151d Kate Hsuan 2026-03-25  584  	ret = cci_multi_reg_write(sensor->regmap, t4ka3_post_mode_set_regs,
> fd55319692151d Kate Hsuan 2026-03-25  585  				  ARRAY_SIZE(t4ka3_post_mode_set_regs), NULL);
> fd55319692151d Kate Hsuan 2026-03-25  586  	if (ret)
> fd55319692151d Kate Hsuan 2026-03-25  587  		goto error_powerdown;
> fd55319692151d Kate Hsuan 2026-03-25  588  
> fd55319692151d Kate Hsuan 2026-03-25  589  	/* Restore value of all ctrls */
> fd55319692151d Kate Hsuan 2026-03-25  590  	ret = __v4l2_ctrl_handler_setup(&sensor->ctrls.handler);
> fd55319692151d Kate Hsuan 2026-03-25  591  	if (ret)
> fd55319692151d Kate Hsuan 2026-03-25  592  		goto error_powerdown;
> fd55319692151d Kate Hsuan 2026-03-25  593  
> fd55319692151d Kate Hsuan 2026-03-25  594  	/* disable group hold */
> fd55319692151d Kate Hsuan 2026-03-25  595  	cci_write(sensor->regmap, T4KA3_REG_PARAM_HOLD, 0, &ret);
> fd55319692151d Kate Hsuan 2026-03-25  596  	cci_write(sensor->regmap, T4KA3_REG_STREAM, 1, &ret);
> fd55319692151d Kate Hsuan 2026-03-25  597  	if (ret)
> fd55319692151d Kate Hsuan 2026-03-25  598  		goto error_powerdown;
> fd55319692151d Kate Hsuan 2026-03-25  599  
> fd55319692151d Kate Hsuan 2026-03-25  600  	sensor->streaming = 1;
> fd55319692151d Kate Hsuan 2026-03-25  601  
> fd55319692151d Kate Hsuan 2026-03-25  602  	return ret;
> fd55319692151d Kate Hsuan 2026-03-25  603  
> fd55319692151d Kate Hsuan 2026-03-25  604  error_powerdown:
> fd55319692151d Kate Hsuan 2026-03-25  605  	pm_runtime_put(sensor->sd.dev);
> fd55319692151d Kate Hsuan 2026-03-25  606  
> fd55319692151d Kate Hsuan 2026-03-25  607  	return ret;
> fd55319692151d Kate Hsuan 2026-03-25  608  }
> 

-- 
Kind regards,

Sakari Ailus

