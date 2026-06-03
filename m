Return-Path: <linux-media+bounces-63670-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OszlNVCXIGoD5gAAu9opvQ
	(envelope-from <linux-media+bounces-63670-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 23:06:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FD063B4FA
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 23:06:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=d5S0ATk4;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63670-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63670-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0727E302BE3A
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 21:03:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBA7B48C8A1;
	Wed,  3 Jun 2026 21:03:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C6548C40B;
	Wed,  3 Jun 2026 21:03:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780520627; cv=none; b=X1DYPrMg50JwwiuHxh9Rl1oXGffMrcs40HctLIydiN3zA1OX2raj1PHGaTAcGFzvbFSUZK1dfnskyzlehlvknmDYbnJLguAI1OWkhjJXcjGQ/NHphALQ56WysyGKcm8+E8q3+oGGn48aMp2/2KpDY1G4q5QSFOUbmN386jKUHus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780520627; c=relaxed/simple;
	bh=Qh8JVJEqqOrKs/oC/ar18xvMh/aqtyyQ2AL7JAgDG3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qZDEV6aiIEA+01AX8wgtr5z3R/UfR3kt56J0FObKgq6SYjAGi7Hz6pVVrq7BcDULPaPR3AlwJuCu8Osfy08/O/i9wWn0Elw3UroCE5YaP4zTtEoofhCSyM6PNzCT18ufaOAfmSOTsemRUOKfh/h4ZPGrYzM2kAPUF4Dqa4TYppU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=d5S0ATk4; arc=none smtp.client-ip=213.167.242.64
Received: from killaraus.ideasonboard.com (85-76-49-85-nat.elisa-mobile.fi [85.76.49.85])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E5338929;
	Wed,  3 Jun 2026 23:03:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780520598;
	bh=Qh8JVJEqqOrKs/oC/ar18xvMh/aqtyyQ2AL7JAgDG3U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d5S0ATk4/AW12c/IG1wth1dAqMpoCs7HywhCu4s6MBvPjsyUlSJi4xtc3ptod6CDd
	 YMh8ni+VdV/VZIHNvcSlTJ0bVypU+mpmMDH7NtGe6hFYwpuw+VZHWc6pZtyonQn3wB
	 43iPT6mCF8uNAfsbiM74ODjPiQO3bVxyhVW2hb8I=
Date: Thu, 4 Jun 2026 00:03:39 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: linux-kernel@vger.kernel.org, hverkuil+cisco@kernel.org,
	Frank.Li@nxp.com, michael.riesch@collabora.com,
	linux-media@vger.kernel.org
Subject: Re: [PATCH 1/2] media: imx: imx8mq-mipi-csi2: Add myself as reviewer
 to imx8mq-mipi-csi2
Message-ID: <20260603210339.GB684535@killaraus.ideasonboard.com>
References: <20260603-dphy-params-extension-v1-0-22e0e1ed8bf2@kernel.org>
 <20260603-dphy-params-extension-v1-1-22e0e1ed8bf2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260603-dphy-params-extension-v1-1-22e0e1ed8bf2@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63670-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:linux-kernel@vger.kernel.org,m:hverkuil+cisco@kernel.org,m:Frank.Li@nxp.com,m:michael.riesch@collabora.com,m:linux-media@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[killaraus.ideasonboard.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,nxp.com:email,linux.dev:email,ideasonboard.com:dkim,ideasonboard.com:from_mime,ideasonboard.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 25FD063B4FA

Hi Bryan,

On Wed, Jun 03, 2026 at 12:15:40AM +0100, Bryan O'Donoghue wrote:
> At the media summit in Nice this year we discussed that cross reviewing
> from different people on LKML was lacking and desirable. Laurent suggested
> NXP/Qcom do some cross pollination.
> 
> Happy to read and review NXP stuff in that spirit.
> 
> Signed-off-by: Bryan O'Donoghue <bod@kernel.org>

Thank you for volunteering.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index efbf808063e50..8436428865aac 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16094,6 +16094,7 @@ M:	Frank Li <Frank.Li@nxp.com>
>  M:	Martin Kepplinger-Novakovic <martink@posteo.de>
>  R:	Rui Miguel Silva <rmfrfs@gmail.com>
>  R:	Purism Kernel Team <kernel@puri.sm>
> +R:	Bryan O'Donoghue <bod@kernel.org>
>  L:	imx@lists.linux.dev
>  L:	linux-media@vger.kernel.org
>  S:	Maintained

-- 
Regards,

Laurent Pinchart

