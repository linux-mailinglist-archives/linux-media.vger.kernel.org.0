Return-Path: <linux-media+bounces-57307-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMhsN+bHxmm8OQUAu9opvQ
	(envelope-from <linux-media+bounces-57307-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 19:09:42 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A38D348D21
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 19:09:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C503C30E0938
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 18:07:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09C4C33D6E3;
	Fri, 27 Mar 2026 18:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="O6w1FNIF"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD202D7DC4;
	Fri, 27 Mar 2026 18:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774634817; cv=none; b=sqwrGfmCH3mnxi3ZtG7LyA9QyC2Uxtuxwsrr950jsMjNhyH4C88vlN9SyrsMmBc9rbMlj4EpAnpOEi77nNWPJL65c+vt7kpzPGdI5z3l6H05e3Bwtdc/yVJTxNWh64nUF2oxRlOH6ZxuH5UdEHByIedQIyO3cs/MfrYIa05Pa9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774634817; c=relaxed/simple;
	bh=xQYrBqJ+bxWqCjw5RpGcp7/le/nNMkHmBSlehzr7NXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lu5SdB4qAqPLTg2LAe4Bi7YXPn5D4IztCL4vkuFxKP9vtXSghpgAx98s33RbKCWBtsQOv846ng4VShBmukODkr2w+O/YKItbJbjLvY82BmCqLzABqE7r2a3mfCg3jkf7gOxWIjgkx44gT+f49VSpFFkHXrs3ipSJrMD5WcRuA/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=O6w1FNIF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 711551C4C;
	Fri, 27 Mar 2026 19:05:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774634734;
	bh=xQYrBqJ+bxWqCjw5RpGcp7/le/nNMkHmBSlehzr7NXI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O6w1FNIFbh0fyodqbyNCIfie5II5rrTbFzdJB35pufj4/L+wOc1z5W3pRoubeq9VI
	 MEYqE8Zzh54ZjkD0dyzc0ztaSccLUYcc4P82xytaztVZ4VMzYvPNxSE54PkjUvri46
	 3V/5yWLO/CMIbEqnWQNfEXfgRwRlbS4+RRBaZzbQ=
Date: Fri, 27 Mar 2026 20:06:52 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Paul Cercueil <paul@crapouillou.net>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: v4l2-common: Always register clock with
 device-specific name
Message-ID: <20260327180652.GE3026673@killaraus.ideasonboard.com>
References: <20260327175212.443987-1-paul@crapouillou.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260327175212.443987-1-paul@crapouillou.net>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57307-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,crapouillou.net:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,killaraus.ideasonboard.com:mid]
X-Rspamd-Queue-Id: 5A38D348D21
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 06:52:12PM +0100, Paul Cercueil wrote:
> If we need to register a dummy fixed-frequency clock, always register it
> using a device-specific name.
> 
> This supports the use case where a system has two of the same sensor,
> meaning two instances of the same driver, which previously both tried
> (and failed) to create a clock with the same name.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  drivers/media/v4l2-core/v4l2-common.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> index 554c591e1113..5f3295c3122a 100644
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
> +	clk_id = kasprintf(GFP_KERNEL, "clk-%s", dev_name(dev));

This will now fail if the same device needs to register two clocks. You
need to include the id in the name. Maybe something like

	clk_id = kasprintf(GFP_KERNEL, "clk-%s-%s", dev_name(dev), id);

> +	if (!clk_id)
> +		return ERR_PTR(-ENOMEM);
>  
> -	clk_hw = devm_clk_hw_register_fixed_rate(dev, id, NULL, 0, rate);
> +	clk_hw = devm_clk_hw_register_fixed_rate(dev, clk_id, NULL, 0, rate);
>  	if (IS_ERR(clk_hw))
>  		return ERR_CAST(clk_hw);
>  

-- 
Regards,

Laurent Pinchart

