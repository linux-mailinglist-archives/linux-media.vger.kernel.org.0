Return-Path: <linux-media+bounces-61571-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOEyJ+2CBWo5XwIAu9opvQ
	(envelope-from <linux-media+bounces-61571-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 10:08:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1841853F13B
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 10:08:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6FDB13023300
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 08:08:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C0783D8127;
	Thu, 14 May 2026 08:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="q5rnDq8B"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15083ACA45;
	Thu, 14 May 2026 08:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778746089; cv=none; b=R2IObLbIzvDMwoH3IKn5oO7zrkInP2CWHux5I6uDaez8W5uLtRzPk7RAvZk4HMeEGFs9MBT1r4b/SCYq0d+wFiFykP2zr9GXf9ORaW9Z95bXSZt7BjXFq3DAm7h+pp6Nv326lDb+kTm7kdM9R9UuWQD1w8qLsNODDDQgSUZGNCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778746089; c=relaxed/simple;
	bh=zJNsMkJ2ty0GYDUrfIoi5RJxH0EnwZSB2q4rfVWFeV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qlORtS6csonHzj1W7JjeFHDrIcq3/b+9OhBXUoeecN9dWXC3FuRIEsxglpvzoo0wO8XfSEg1aFiggQ4o+oPelMyh4mDJ4fAp8ReXjeb9955z8VBbBN7A5QicnWdhI9FclgImTv1BQI3xoNEXcihZNTWJur4QzPXw/LPWIzKAgzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=q5rnDq8B; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2710B8E0;
	Thu, 14 May 2026 10:07:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778746077;
	bh=zJNsMkJ2ty0GYDUrfIoi5RJxH0EnwZSB2q4rfVWFeV4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q5rnDq8BWKXcgioIGMsjpRfhJxjdP/S38Cn0O2I25VPx3r3POlIc7a9kL6v4kjnAo
	 UlomWpAPCrF2edeB2m9hsiVvb1+RNIC7OrJnvzsKricVZPXi5IfUOgRlGZzL/M0kZk
	 JLbvE21kQMa+a8jLGD8KYvRc5Yg2Ngq7u16Shr6M=
Date: Thu, 14 May 2026 10:08:03 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Steve Longerbeam <slongerbeam@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/11] media: i2c: ov5640: fix error path in
 ov5640_set_mode
Message-ID: <agWCq1r5WFW06FMK@zed>
References: <20260501-ov5640_cleanup-v1-0-0869a7802a33@ideasonboard.com>
 <20260501-ov5640_cleanup-v1-4-0869a7802a33@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260501-ov5640_cleanup-v1-4-0869a7802a33@ideasonboard.com>
X-Rspamd-Queue-Id: 1841853F13B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61571-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,gmail.com,kernel.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,ideasonboard.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Fri, May 01, 2026 at 04:39:06PM +0100, Kieran Bingham wrote:
> During ov5640_set_mode if the call to set the pclk fails, we should
> correctly restore the state of the auto exposure
> and auto gain if they were modified on entry into the function.
>
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>


> ---
>  drivers/media/i2c/ov5640.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 0dc4f4272d05..244c341d0e77 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -2349,7 +2349,7 @@ static int ov5640_set_mode(struct ov5640_dev *sensor)
>  	else
>  		ret = ov5640_set_dvp_pclk(sensor);
>  	if (ret < 0)
> -		return 0;
> +		goto restore_auto_exp_gain;
>
>  	if ((dn_mode == SUBSAMPLING && orig_dn_mode == SCALING) ||
>  	    (dn_mode == SCALING && orig_dn_mode == SUBSAMPLING)) {
>
> --
> 2.52.0
>
>

