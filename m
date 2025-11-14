Return-Path: <linux-media+bounces-47098-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id ED19AC5DD54
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 16:24:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 498DE35D5AD
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 14:50:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E24C328258;
	Fri, 14 Nov 2025 14:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L+rDBs7a"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBF8325738;
	Fri, 14 Nov 2025 14:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763131765; cv=none; b=d23GXq/YlfdCpY9SO6ex3JKfQcDBUyeO4Ccu/05AVHS0IoBWKjyoAi1e+M1HapVOJP/DYH0AYs5GOWHaiAa7ML4u/NFUnByRtaLM+2NjHQn1YHsj2fp0HOkzx49CzVFCjqS8RKUUOrV5DW3si8NeEEYg4T7PccBlIhriQHTyE9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763131765; c=relaxed/simple;
	bh=zzzDKvrqSISBzTJB9sBIHCzKA9T2rntBBfYNwPbniKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NVzLztHM+J/a1kRfWX9diRXAd2FLlghjHAkyl9BlhYOZ3oi2D+EAjWSbFB2dSWYSdQY56A5MZvH5P85UNNN0c/6rg5/VMplcVrlVP1svs+6KALQnXrGo5JPcFAXM+gTnH+RudQTMJLl0kTAPW+Gwx+103dY0K/JyCbLwmUM1wug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L+rDBs7a; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763131764; x=1794667764;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zzzDKvrqSISBzTJB9sBIHCzKA9T2rntBBfYNwPbniKE=;
  b=L+rDBs7aSFqTEISglQ6+I8IUctMqMJUZSPi7oA893xvP2KsEjVFhKH3I
   jP0+/SMYP67TXCSkG+pFpxVCt+5xaJA4U0Jam8XlYiXQMYMT/qRvLrmSj
   iR7pKXrarGzMsMACnC2aKQD1QVeFdONbMNox5eLZkDx26oIIUHMKPFY9W
   S3FCJZowejOx4D/sWzjNUs4fTsSze/Ss1dEN8BZ9GwQ5Xh6lIBm0zovkw
   jSlAQwRv+HVp3TFUg1HO9t+1ajJ0ENdg87Fq2XSsMtuhPioFKMwcWPjF7
   rjEcvuTp7i/sW8GCG0cz7FU6fXucArRViYezfOzIjsD0UlfHIHB9d/9Vp
   g==;
X-CSE-ConnectionGUID: zi1j5/uJR+aIABa1bPdUrQ==
X-CSE-MsgGUID: 8yOfaDTtRNKP3q9nJQTpGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="76687608"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; 
   d="scan'208";a="76687608"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 06:49:23 -0800
X-CSE-ConnectionGUID: G8e9kQE9T2+LJH1L+zE0gg==
X-CSE-MsgGUID: XktjOyHjQTSdrcKtNxk3Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; 
   d="scan'208";a="189636120"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.53])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 06:49:19 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 8C624121DDE;
	Fri, 14 Nov 2025 16:49:18 +0200 (EET)
Date: Fri, 14 Nov 2025 16:49:18 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Anthony.McGivern@arm.com,
	nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com,
	laurent.pinchart@ideasonboard.com,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v13 15/15] Documentation: mali-c55: Document the mali-c55
 parameter setting
Message-ID: <aRdBbn4cpdn_7H0v@kekkonen.localdomain>
References: <20251111-c55-v13-0-3dc581355e3a@ideasonboard.com>
 <20251111-c55-v13-15-3dc581355e3a@ideasonboard.com>
 <2n4sn2aakwl7k2qvcefb7m2zzllytj7i4nup55xex2ggdngfkd@gwpxbpmlupko>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2n4sn2aakwl7k2qvcefb7m2zzllytj7i4nup55xex2ggdngfkd@gwpxbpmlupko>

Hi Jacopo,

On Thu, Nov 13, 2025 at 09:39:37AM +0100, Jacopo Mondi wrote:
> > +the data member with the blocks that need to be configured by the driver, but
> > +need not populate it with **all** the blocks, or indeed with any at all if there
> > +are no configuration changes to make. Populated blocks **must** be consecutive
> > +in the buffer. To assist both userspace and the driver in identifying the
> > +blocks each block-specific struct embeds :c:type:`v4l2_params_block_header` as
> > +its first member and userspace must populate the type member with a value from
> > +:c:type:`mali_c55_param_block_type`. Once the blocks have been populated
> > +into the data buffer, the combined size of all populated blocks shall be set in
> > +the data_size member of :c:type:`v4l2_params_buffer`. For example:
> > +
> > +.. code-block:: c
> > +
> > +	struct v4l2_params_buffer *params =
> > +		(struct v4l2_params_buffer *)buffer;
> > +
> > +	params->version = MALI_C55_PARAM_BUFFER_V1;
> > +	params->data_size = 0;
> > +
> > +	void *data = (void *)params->data;
> > +
> > +	struct mali_c55_params_awb_gains *gains =
> > +		(struct mali_c55_params_awb_gains *)data;
> > +
> > +	gains->header.type = MALI_C55_PARAM_BLOCK_AWB_GAINS;
> > +	gains->header.flags |= V4L2_PARAMS_FL_BLOCK_ENABLE;
> > +	gains->header.size = sizeof(struct mali_c55_params_awb_gains);
> > +
> > +	gains->gain00 = 256;
> > +	gains->gain00 = 256;
> > +	gains->gain00 = 256;
> > +	gains->gain00 = 256;
> > +
> > +	data += sizeof(struct mali_c55_params_awb_gains);
> > +	params->data_size += sizeof(struct mali_c55_params_awb_gains);
> > +
> > +	struct mali_c55_params_sensor_off_preshading *blc =
> > +		(struct mali_c55_params_sensor_off_preshading *)data;
> > +
> > +	blc->header.type = MALI_C55_PARAM_BLOCK_SENSOR_OFFS;
> > +	blc->header.flags |= V4L2_PARAMS_FL_BLOCK_ENABLE;
> > +	blc->header.size = sizeof(struct mali_c55_params_sensor_off_preshading);
> > +
> > +	blc->chan00 = 51200;
> > +	blc->chan01 = 51200;
> > +	blc->chan10 = 51200;
> > +	blc->chan11 = 51200;
> > +
> > +	params->total_size += sizeof(struct mali_c55_params_sensor_off_preshading);
> 
> s/total_size/data_size
> 
> And I've also updated it to use the v4l2-isp types
> 
> +.. code-block:: c
> +
> +       struct v4l2_isp_params_buffer *params =
> +               (struct v4l2_isp_params_buffer *)buffer;

What's the type of buffer here? If it's void, you can drop the cast.

> +
> +       params->version = MALI_C55_PARAM_BUFFER_V1;
> +       params->data_size = 0;
> +
> +       void *data = (void *)params->data;

No need for a cast here.

> +
> +       struct mali_c55_params_awb_gains *gains =
> +               (struct mali_c55_params_awb_gains *)data;

Ditto.

Unless, I guess, you use C++. :-)

> +
> +       gains->header.type = MALI_C55_PARAM_BLOCK_AWB_GAINS;
> +       gains->header.flags |= V4L2_ISP_PARAMS_FL_BLOCK_ENABLE;
> +       gains->header.size = sizeof(struct mali_c55_params_awb_gains);
> +
> +       gains->gain00 = 256;
> +       gains->gain00 = 256;
> +       gains->gain00 = 256;
> +       gains->gain00 = 256;
> +
> +       data += sizeof(struct mali_c55_params_awb_gains);

	data += sizeof(*gains);

?

> +       params->data_size += sizeof(struct mali_c55_params_awb_gains);

Ditto.

> +
> +       struct mali_c55_params_sensor_off_preshading *blc =
> +               (struct mali_c55_params_sensor_off_preshading *)data;
> +
> +       blc->header.type = MALI_C55_PARAM_BLOCK_SENSOR_OFFS;
> +       blc->header.flags |= V4L2_ISP_PARAMS_FL_BLOCK_ENABLE;
> +       blc->header.size = sizeof(struct mali_c55_params_sensor_off_preshading);
> +
> +       blc->chan00 = 51200;
> +       blc->chan01 = 51200;
> +       blc->chan10 = 51200;
> +       blc->chan11 = 51200;
> +
> +       params->data_size += sizeof(struct mali_c55_params_sensor_off_preshading);

	... += sizeof(*blc);

?

> 
> With your ack, I'll apply the following changes before sending the PR.
> 
> Thanks
>   j
> 
> > +
> >  Arm Mali-C55 uAPI data types
> >  ============================
> >
> >

-- 
Regards,

Sakari Ailus

