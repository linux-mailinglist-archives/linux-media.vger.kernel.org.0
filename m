Return-Path: <linux-media+bounces-63671-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FnVqHIeXIGoP5gAAu9opvQ
	(envelope-from <linux-media+bounces-63671-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 23:07:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A15E963B505
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 23:07:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=oWOK80f5;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63671-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63671-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 05CFC305046A
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 21:04:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEDDF48BD3B;
	Wed,  3 Jun 2026 21:04:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC02B23D7F0;
	Wed,  3 Jun 2026 21:04:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780520680; cv=none; b=CDt9v0Farjaf1BOfAnXKbzTbda09zXNRWgqyqS+HzB+oMsqAuaKF3Q3duhuZi3yquvTrnrZcFXvFPcHFbWiojUnpwoITQibIwvo8MO8J+WBA4RYZ7+pTySs2b985wBNteZKmoBliHRO5R11AhzIX3vXQII46njV5pVxa0jWQwhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780520680; c=relaxed/simple;
	bh=OnNyCBgT+yDrGAYf51n7QOQdt0xmFxcCPDHToaSqYQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o4+A+V55espNHi8QyZu6n6533Gc8A35q+8XNYPtQOhkilambj3tYSR2sTcaXlEuNRehI3VhZuF5DUH4FFMakCZHIgotB825FVf53/SAq7YeBSc3ZyVjn/qAZFuNyJwdCtD0FuQ3yKiweJ+M5YiwI6hdsWkCjbn0GcXtTs7IJSQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oWOK80f5; arc=none smtp.client-ip=213.167.242.64
Received: from killaraus.ideasonboard.com (85-76-49-85-nat.elisa-mobile.fi [85.76.49.85])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 532D4929;
	Wed,  3 Jun 2026 23:04:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780520653;
	bh=OnNyCBgT+yDrGAYf51n7QOQdt0xmFxcCPDHToaSqYQ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oWOK80f5NVk42AyHYBdVv6HxnThMV9nDTFe4Lz8x9TJIgcQx39gEwPG4Wba21/ZIq
	 OpZfxOfNncbFlxxA0m/NY4DVHvFtlhsLyyoVYSoKOU2tvFlORXXLAiZC4q4z/AFRPr
	 2KO9cDdTjYtgi60kAjVTT4fZ0jAz1fSZ2fv31CDs=
Date: Thu, 4 Jun 2026 00:04:35 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: linux-kernel@vger.kernel.org, hverkuil+cisco@kernel.org,
	Frank.Li@nxp.com, michael.riesch@collabora.com,
	linux-media@vger.kernel.org
Subject: Re: [PATCH 2/2] media: rockchip: dw-mipi-csi2rx: Add myself to the
 reviewers list
Message-ID: <20260603210435.GG684535@killaraus.ideasonboard.com>
References: <20260603-dphy-params-extension-v1-0-22e0e1ed8bf2@kernel.org>
 <20260603-dphy-params-extension-v1-2-22e0e1ed8bf2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260603-dphy-params-extension-v1-2-22e0e1ed8bf2@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-63671-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:email,vger.kernel.org:from_smtp,killaraus.ideasonboard.com:mid,ideasonboard.com:dkim,ideasonboard.com:from_mime,ideasonboard.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A15E963B505

Hi Bryan,

On Wed, Jun 03, 2026 at 12:15:41AM +0100, Bryan O'Donoghue wrote:
> As a cross pollination activity between Qcom and others add myself to the
> Rockchip list. We discussed @ Nice making reviews more formal because
> frankly we can get gummed up in not reviewing. Add myself +R here in that
> light.
> 
> Signed-off-by: Bryan O'Donoghue <bod@kernel.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8436428865aac..25e3f2cfcbf2b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25934,6 +25934,7 @@ F:	include/linux/soc/amd/isp4_misc.h
>  
>  SYNOPSYS DESIGNWARE MIPI CSI-2 RECEIVER DRIVER
>  M:	Michael Riesch <michael.riesch@collabora.com>
> +R:	Bryan O'Donoghue <bod@kernel.org>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml

-- 
Regards,

Laurent Pinchart

