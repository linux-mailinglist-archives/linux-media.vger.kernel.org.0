Return-Path: <linux-media+bounces-66028-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IwGhM+/oQmptHwoAu9opvQ
	(envelope-from <linux-media+bounces-66028-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 23:51:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 632F26DEF27
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 23:51:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=GYYFaxkg;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66028-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66028-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5209A300D1F5
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 21:51:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00F493CB2F0;
	Mon, 29 Jun 2026 21:51:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D53438910F;
	Mon, 29 Jun 2026 21:51:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782769896; cv=none; b=aFbio0j3EdD1DjXHlSicf4jBOOo4pzA+XQ8li5XU2anmeobpyYQEe6heDAOOlTUw5Rh38gVq8kn+ov3JXjr9oUSjoCBlosRHfM6WrjRjo1/f2vCnqCq7x7m10VzrFKlAnKmt2bfZnOvtF40W6dAn5onU5p05ett4YbbtfOiXY2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782769896; c=relaxed/simple;
	bh=FAyRkPdWspc0os9f6iza0cvGpYN2CZQVB7/B+xWqfo8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rwj37sUkIUN1v9+9k3ETKJa2xE6YAoSyHZnXttbdkNJrUy6Z5rmb6uT6pu3DteXCyDvZLoZdrm6C3M7o3Q07iTzTvKQipyNBM2zogBjLoOqmxbX7FLyeAWrPDw8TJc1FvN8lKJrYDTKGOEIJ6L1mRcmNHlEtou2Yka4LZGv4WGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GYYFaxkg; arc=none smtp.client-ip=213.167.242.64
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DF5C01044;
	Mon, 29 Jun 2026 23:50:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782769850;
	bh=FAyRkPdWspc0os9f6iza0cvGpYN2CZQVB7/B+xWqfo8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GYYFaxkgHWTocJjYQ/BnCnX23z1HLIJbbRsd7UhTtPAzp9lSkzZHZJVEReyWd+obZ
	 3x4HXE8THN7dgZr4rUICG+o9gsjLbo08uSh16lKuTEk8Cfk3IVeMFBQ7L8TbxDN48H
	 10rPXufS99aJTxPUzhqU44D0ghyreGbeCBeO/aqw=
Date: Tue, 30 Jun 2026 00:51:32 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank.Li@oss.nxp.com
Cc: bod@kernel.org, mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	hverkuil+cisco@kernel.org, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 1/1] media: qcom: camss: Add Frank Li as reviewer
Message-ID: <20260629215132.GM3054459@killaraus.ideasonboard.com>
References: <20260629214618.2523099-1-Frank.Li@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260629214618.2523099-1-Frank.Li@oss.nxp.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66028-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Frank.Li@oss.nxp.com,m:bod@kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hverkuil+cisco@kernel.org,m:Frank.Li@nxp.com,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,nxp.com:email,killaraus.ideasonboard.com:mid,ideasonboard.com:dkim,ideasonboard.com:from_mime,linaro.org:email,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 632F26DEF27

On Mon, Jun 29, 2026 at 05:46:18PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> During the 2026 Media Summit in Nice, a discussion highlighted the lack of
> cross-reviewing between maintainers and contributors from different
> subsystems. Laurent suggested encouraging collaboration between the NXP
> and Qualcomm media communities through cross-reviewing.
> 
> Add Frank Li as a reviewer for the Qualcomm CAMSS driver to foster broader
> review coverage and knowledge sharing across platforms.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 34b8dff9bd69b..361a4f447277c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22114,6 +22114,7 @@ QUALCOMM CAMERA SUBSYSTEM DRIVER
>  M:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>  R:	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>  R:	Loic Poulain <loic.poulain@oss.qualcomm.com>
> +R:	Frank Li <Frank.Li@kernel.org>

Thank you for volunteering. I'm not a maintainer for this driver so I
won't provide an acked-by tag, but I welcome this patch being merged.

>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/admin-guide/media/qcom_camss.rst

-- 
Regards,

Laurent Pinchart

