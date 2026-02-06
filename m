Return-Path: <linux-media+bounces-52273-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLSHB+E1hWlf+AMAu9opvQ
	(envelope-from <linux-media+bounces-52273-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 01:29:21 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC6BF8A1A
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 01:29:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C5600301F7B4
	for <lists+linux-media@lfdr.de>; Fri,  6 Feb 2026 00:29:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5DC921ABAA;
	Fri,  6 Feb 2026 00:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JLdz+UAm"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153001DF963;
	Fri,  6 Feb 2026 00:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770337754; cv=none; b=RawGOnLc3zgDFI+7kQWWjqD6ECW3UXi7Ld9NYH6cu8DeFqiyk/WJFuLkOEx0cO3vziEFiUItG1Z9Ks4SmehSm5boDmbmMzQ5Vlv4FZIGHGITC5tQG+/1svULzvwizJ6bbPoedA13gzUYK8zXa8Lu31iL/8tiwFHfYMafllWADzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770337754; c=relaxed/simple;
	bh=CC+SfZLx5g1lXxlDGq9BgjDqqjVtUTE8BdJ9PT3TbFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C+j10khosKHNu5UPqOVg0hZHyNOn2QiduRLowLQCRDK9weyIYq9Z6owx7t47WjAJ47j987JnKGgqttLZgz6pk5nW+zjn52s7bI3nbIHVHTyGEHFPu1411hmOS5ck2141w8VAabeZxH0IVvfLsS2DZYc+FJLT5lQJbHYQjQ/MqHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JLdz+UAm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 248632E0;
	Fri,  6 Feb 2026 01:28:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770337709;
	bh=CC+SfZLx5g1lXxlDGq9BgjDqqjVtUTE8BdJ9PT3TbFw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JLdz+UAmhv6XS1xaWsrBmbUr8zlcJzEMzIS95Og4Vule26DAGGHPPfD9HWJpuGUn2
	 y+zJigsSQtwxI7DwbN5xE5UvQoImj68AcKvWh/Z6c0t5Vr21Rlne9oDN3ZLwc55kLX
	 2FzbGinQAptzazFhQkSm/TH2kR7K8ePolTHjaV7o=
Date: Fri, 6 Feb 2026 02:29:10 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: linux-media@vger.kernel.org, dafna@fastmail.com, mchehab@kernel.org,
	heiko@sntech.de, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] media: rkisp1: Treat 8 bus width and 16 bus width
 formats the same
Message-ID: <20260206002910.GE1376807@killaraus.ideasonboard.com>
References: <20260205103207.4020959-1-isaac.scott@ideasonboard.com>
 <20260205103207.4020959-3-isaac.scott@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260205103207.4020959-3-isaac.scott@ideasonboard.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,fastmail.com,kernel.org,sntech.de,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-52273-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,ideasonboard.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8BC6BF8A1A
X-Rspamd-Action: no action

On Thu, Feb 05, 2026 at 10:32:07AM +0000, Isaac Scott wrote:
> As MIPI CSI is a serial interface, we should be able to use a bit depth
> of 16 in the same way as 8 bit depth. Add a fallthrough case to ensure
> we don't reject 16 bit depth formats.

I think the change is right, but the commit message isn't.

The driver already lists YUV 1X16 formats as supported on the ISP sink
pad in the rkisp1_formats array. Those formats report a bus width of 16,
and they are used by the CSI-2 receivers for YUV formats. However, the
rkisp1_config_isp() function doesn't support the 16-bit bus width, and
returns an error. It needs to be fixed to enable YUV capture. You could
check the git history to see if this got broken at some point (in which
case a Fixes: tag would be nice), or if it has never worked.

The 16 bits per pixel YUV formats use 8 bits per component, so they are
handled by the ISP input as 8-bit format. That's why you can use
RKISP1_CIF_ISP_ACQ_PROP_IN_SEL_8B_ZERO, as for the 8-bit bus width.

With an updated commit message this patch should be good.

> Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> ---
>  drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> index 21bfa0edbaf1..0fc1ca7f97a0 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> @@ -261,6 +261,7 @@ static int rkisp1_config_isp(struct rkisp1_isp *isp,
>  
>  		switch (sink_fmt->bus_width) {
>  		case 8:
> +		case 16:
>  			acq_prop |= RKISP1_CIF_ISP_ACQ_PROP_IN_SEL_8B_ZERO;
>  			break;
>  		case 10:

-- 
Regards,

Laurent Pinchart

