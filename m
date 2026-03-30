Return-Path: <linux-media+bounces-57661-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMD7L0Kkymmx+gUAu9opvQ
	(envelope-from <linux-media+bounces-57661-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 18:26:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6496835EBEA
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 18:26:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E7526301C15C
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 16:22:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDEF4377023;
	Mon, 30 Mar 2026 16:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="biNguAaK"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175B337757A;
	Mon, 30 Mar 2026 16:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774887718; cv=none; b=jnYLxlW4E17z29+Ejlq4SHj3Hf7uWrHc/GpmKFkiufkAQYepL2hjN0yMQZ7vsxccfZHDGEsj+z0V5NYHf3ZpJHGWkiLDpO2F42f2LYLPp0WwUVQLmqGxrS2fWo0GD/skUV2p7ckFoDSBSujI78Q4bKT6bNYc2iVkSeijMqMQZZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774887718; c=relaxed/simple;
	bh=J25dp5fqCTMyMUiggNLayWhV8QgJSdrjDMKsJOj/Vyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sEFP1ENW6DApxVBibassQ6tmsQO6/czmokYsTIqKVcv+v86MV7+Rt8uSJWOYJrP+8QrGag5qEv+dMGfOue76pwZ0QfNrlZfhJyiiFiSlOE/ZSlpfPucg3J9cFTh13rgpawVCz/05T5Pupv2JgWO9tElxCWkf5fuqY56NGFu9FSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=biNguAaK; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774887718; x=1806423718;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=J25dp5fqCTMyMUiggNLayWhV8QgJSdrjDMKsJOj/Vyc=;
  b=biNguAaK1kXtKcWBdHhJdxmc9mw0RQLZ0cOWPnt+d1fI43YPs76nYRnA
   BGoYclTDaJ1esyo3VjPfGBF2H3So9CRI0s5NYlT0046ZRlgLWrpgkD9Iu
   MHhj7W33bReAkId3/bcdzbgZiZtk48mgwbHRktdEoflv33BPZ40b1YbIz
   WYrxYHwEimf6kXBOmH169ZTd39fZhKoj//DilGvCVrW8WicxdCItnlY+K
   Xpyk3DYwqu13ERMGweR2DmcRgJE8Bly1V3y2DWpbhsR/WVvqRX6jgmhjN
   YOBtXo8x8mygV55bGsTFx2OeXqHG0+GUIrk6E1P62/Q9aZcRSadE5cS53
   Q==;
X-CSE-ConnectionGUID: yf95vQo1SCixpj7ckqVXyQ==
X-CSE-MsgGUID: BpFUW7EpRJezRJmcwGDw5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="76075195"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="76075195"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 09:21:57 -0700
X-CSE-ConnectionGUID: 2CmgFOPmSQ+ULB9Mke/Q6w==
X-CSE-MsgGUID: 0ghgG6bbQ0SlX6oyGHkWjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="225274026"
Received: from vpanait-mobl.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.177])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 09:21:55 -0700
Date: Mon, 30 Mar 2026 18:21:47 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Paul Cercueil <paul@crapouillou.net>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: v4l2-common: Always register clock with
 device-specific name
Message-ID: <acqilV_y6FxIgBbY@mdjait-mobl>
References: <20260327225750.607033-1-paul@crapouillou.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327225750.607033-1-paul@crapouillou.net>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57661-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mehdi.djait@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,crapouillou.net:email]
X-Rspamd-Queue-Id: 6496835EBEA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Paul,

Thank you for the patch!

On Fri, Mar 27, 2026 at 11:57:50PM +0100, Paul Cercueil wrote:
> If we need to register a dummy fixed-frequency clock, always register it
> using a device-specific name.
> 
> This supports the use case where a system has two of the same sensor,
> meaning two instances of the same driver, which previously both tried
> (and failed) to create a clock with the same name.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
> 
> Notes:
>     v2: include requested clock id in fixed clock name
> 
>  drivers/media/v4l2-core/v4l2-common.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> index 554c591e1113..f32263ba96c4 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -792,14 +792,11 @@ struct clk *__devm_v4l2_sensor_clk_get(struct device *dev, const char *id,
>  	if (ret)
>  		return ERR_PTR(ret == -EINVAL ? -EPROBE_DEFER : ret);
>  
> -	if (!id) {
> -		clk_id = kasprintf(GFP_KERNEL, "clk-%s", dev_name(dev));
> -		if (!clk_id)
> -			return ERR_PTR(-ENOMEM);
> -		id = clk_id;
> -	}
> +	clk_id = kasprintf(GFP_KERNEL, "clk-%s-%s", dev_name(dev), id);

How about this, for drivers calling this without id:

	if (id)
		clk_id = kasprintf(GFP_KERNEL, "clk-%s-%s", dev_name(dev), id);
	else
		clk_id = kasprintf(GFP_KERNEL, "clk-%s-%s", dev_name(dev));

	if (!clk_id)
		return ERR_PTR(-ENOMEM);
>  
> -	clk_hw = devm_clk_hw_register_fixed_rate(dev, id, NULL, 0, rate);
> +	clk_hw = devm_clk_hw_register_fixed_rate(dev, clk_id, NULL, 0, rate);
>  	if (IS_ERR(clk_hw))
>  		return ERR_CAST(clk_hw);

--
Kind Regards
Mehdi Djait

