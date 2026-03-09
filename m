Return-Path: <linux-media+bounces-54944-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALoPIkm2rmkSHwIAu9opvQ
	(envelope-from <linux-media+bounces-54944-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 13:00:09 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 881C9238547
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 13:00:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4F445302C16F
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2026 11:56:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A49439C625;
	Mon,  9 Mar 2026 11:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MCGt4xto"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A7F355F3A
	for <linux-media@vger.kernel.org>; Mon,  9 Mar 2026 11:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773057390; cv=none; b=hJ0LSt+ZjViqTNThPLxYMD1PmuZNb4bOxVkfkjuCv25rjmizR3HV4ahhu8C/bPDyBB+7WuyltIXsRiX6kDYoEfDBprifI9gKW6DlrJHovJa0arHUdvmfQbsJ961Vj8oennaxqurSCqSSAOqrzS8REu4ABDCEB1HrBEHc6AOVCMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773057390; c=relaxed/simple;
	bh=SI59CN6FPnVYjZTIcQYH0Cihdph76q3dfe9c7NFce60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rbo7hUHbS0yZ07lH6qEwnSVmtpII14R7MasrUYrXQuHY7Dk/p09BagLI2WqWgIGEQl5hOCT4QyRzl6F+9ccIPJXxCU9v3sMpxkDaCt9fhlWUwFufuIEBJjSkQyLQH47K0XFuP3opvlDSWOLZk8gan14HpebyEUz1u3VYLxLcIcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MCGt4xto; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773057389; x=1804593389;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SI59CN6FPnVYjZTIcQYH0Cihdph76q3dfe9c7NFce60=;
  b=MCGt4xtowP2UjWaYriJmq3R3s2GkAHDA65qE+sxFz+7M1Pxka8FNI4Oa
   cU1sbyedjGyL6uDBc/EsBJVfMGTY0Gk1+DxcB5AkcJFpvUK3bLz4HbjoX
   8iw9ki+JmIzvZl9KVYO1C8+siUcKu2NUGyBY4LYD24H6K6UIFOY0Mtk7+
   5Pn5G1Fx07o69YqTZK4zaRZDxYktEl6YBZ9DN0En7gxNHGzVZsDKC2SiS
   XGvvVU44VyPwyZSODf4o/XfLKcDjvrOM3bed6BCstkvaGzmVvuB8ql22q
   BFG3pOgpv5on9KDH2lGHwq7lYb5r81eQXPNa+BSxBJosPzVAIo8KMINsK
   w==;
X-CSE-ConnectionGUID: MvU5Q5eHQ7m4pu4GnwH6qQ==
X-CSE-MsgGUID: 14Eu5H4CQfqdPw+lxz6W/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="73097939"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="73097939"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 04:55:22 -0700
X-CSE-ConnectionGUID: Rr32ojdORSCQ97fgIywMAw==
X-CSE-MsgGUID: 7rvbLIHEQ/GO23KDQV3RbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="219710208"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.148])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 04:55:21 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id BA607121D1F;
	Mon, 09 Mar 2026 13:55:51 +0200 (EET)
Date: Mon, 9 Mar 2026 13:55:51 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>, Shawn Tu <shawnx.tu@intel.com>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH 6/6] media: i2c: og01a1b: Add support of 8-bit media bus
 format
Message-ID: <aa61R5mcCE1zu125@kekkonen.localdomain>
References: <20260226133739.4050870-1-vladimir.zapolskiy@linaro.org>
 <20260226133739.4050870-7-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226133739.4050870-7-vladimir.zapolskiy@linaro.org>
X-Rspamd-Queue-Id: 881C9238547
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54944-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.995];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,intel.com:dkim,kekkonen.localdomain:mid]
X-Rspamd-Action: no action

Hi Vladimir,

Thanks for the set.

On Thu, Feb 26, 2026 at 03:37:39PM +0200, Vladimir Zapolskiy wrote:
> @@ -627,6 +632,14 @@ static int og01a1b_enable_streams(struct v4l2_subdev *sd,
>  		return ret;
>  	}
>  
> +	ret = cci_write(og01a1b->regmap, CCI_REG8(0x3662),
> +			(og01a1b->code == MEDIA_BUS_FMT_Y10_1X10 ? 0x4 : 0x6),

Does this configuration have a human-readable name? It'd be nice to use
that instead of a plain numerical value.

> +			NULL);
> +	if (ret) {
> +		dev_err(og01a1b->dev, "failed to set output format: %d\n", ret);
> +		return ret;
> +	}
> +
>  	ret = __v4l2_ctrl_handler_setup(og01a1b->sd.ctrl_handler);
>  	if (ret)
>  		goto error;

-- 
Regards,

Sakari Ailus

