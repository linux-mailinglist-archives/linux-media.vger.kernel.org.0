Return-Path: <linux-media+bounces-61980-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJRMD6sFC2rd/QQAu9opvQ
	(envelope-from <linux-media+bounces-61980-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 14:27:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1F056C9DF
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 14:27:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 595C7307BFD9
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 12:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E6693FF1A5;
	Mon, 18 May 2026 12:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dc/e2DvP"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415F03FF1CA;
	Mon, 18 May 2026 12:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779106515; cv=none; b=Jg4kX14PnSjtYGgNlT3r1EmZczGXJlJu5i7BO77irHAFkBsb82nCGPpgqfNRO7FBq8Y68sGFKI8iZFfZQTREV3AR/SOWCYjCsbrWp9/eZb1g3AU44ufUXSXbDTZjY344T6xBlYmbJnrhXtth+EkkZ9CCq9tMK1ctouN1AOgdd+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779106515; c=relaxed/simple;
	bh=2HVervgvMNY5n3viqEx3IGFKAzg8w3ucqWbg/iYzyR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S4eWTb7hCii/VrVpKvAWt1j2wLi5WuUcL3MbTwluWeJEOWZROqeBwJcRE1zXni0J/dIJXRaegybZbFe/jxob5LRyu6+OBplwG+hCO2VKh+w/tWBUOgvaWBq+JvqpssYZyHMP8RcAlZTS7aPi24SWUUvKSPhEOSqs3qhgQkR39kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dc/e2DvP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (unknown [IPv6:2a01:cb1d:8f2:800:42d6:38fa:3bdf:70df])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3C4F578E;
	Mon, 18 May 2026 14:15:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1779106500;
	bh=2HVervgvMNY5n3viqEx3IGFKAzg8w3ucqWbg/iYzyR4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dc/e2DvPe15tr1gMJX3PWROLhQ/zKc3zbnG1fYku/UK2w2sJJb5R1Nss2Dy3kIP7L
	 QUnX97dhOD08t0OjB9obeeeKBLDY/NvawNnAngZZPIrx4ak9hyMsV6qK050qQ/nJ+q
	 VDDaaQ5fU/YcrEplCw3O8CSG6dU9UVs2qTyw/SBk=
Date: Mon, 18 May 2026 14:15:11 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arash Golgol <arash.golgol@gmail.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [PATCH 00/16] media: sun6i-csi/isp MC-centric support and
 cleanups
Message-ID: <20260518121511.GD21216@killaraus.ideasonboard.com>
References: <20260518102451.417971-1-paulk@sys-base.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260518102451.417971-1-paulk@sys-base.io>
X-Rspamd-Queue-Id: 3C1F056C9DF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61980-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,lists.linux.dev,kernel.org,gmail.com,sholland.org,linuxfoundation.org,collabora.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Mon, May 18, 2026 at 12:24:35PM +0200, Paul Kocialkowski wrote:
> This series first introduces some fixes and new formats to v4l2 format
> info, one of which we need for the sun6i-csi driver. Support for
> MC-centric format enumeration is then added, along with cleanups and
> improvements for both the sun6i-csi and sun6i-isp drivers.
> 
> The first 4 patches are already reviewed and ready to go and are
> included here as a reminder that this series depends on them.

Patch 04/16 has no R-b tag.

> Arash Golgol (4):
>   media: sun6i-csi: bridge: Use V4L2 subdev active state
>   media: sun6i-csi: capture: Implement vidioc_enum_framesizes
>   media: sun6i-mipi-csi2: Use V4L2 subdev active state
>   media: sun8i-a83t-mipi-csi2: Use V4L2 subdev active state
> 
> Paul Kocialkowski (12):
>   media: v4l2-common: Fix NV15_4L4 format info block height
>   media: v4l2-common: Add missing tiled format info block sizes
>   media: v4l2-common: Add NV12_16L16 pixel format to v4l2 format info
>   media: v4l2-common: Add NV12_32L32 pixel format to v4l2 format info
>   media: sun6i-csi: Split format validation to a dedicated helper
>   media: sun6i-csi: Add support for MC-centric format enumeration
>   media: sun6i-csi: Tidy up and unify coding style
>   media: sun6i-mipi-csi2: Fix parenthesis alignment
>   media: sun6i-isp: Add dummy params link_validate implementation
>   media: sun6i-isp: Use V4L2 subdev active state
>   media: sun6i-isp: Add support for MC-centric format enumeration
>   media: sun6i-isp: Add support for frame size enumeration
> 
>  .../sunxi/sun6i-csi/sun6i_csi_bridge.c        | 153 +++++++---------
>  .../sunxi/sun6i-csi/sun6i_csi_bridge.h        |   9 -
>  .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 168 +++++++++++++-----
>  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   | 107 ++++++-----
>  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h   |   2 -
>  .../sun8i_a83t_mipi_csi2.c                    | 113 ++++++------
>  .../sun8i_a83t_mipi_csi2.h                    |   2 -
>  drivers/media/v4l2-core/v4l2-common.c         |  12 +-
>  .../media/sunxi/sun6i-isp/sun6i_isp_capture.c |  47 ++++-
>  .../media/sunxi/sun6i-isp/sun6i_isp_params.c  |  37 +++-
>  .../media/sunxi/sun6i-isp/sun6i_isp_params.h  |   4 +-
>  .../media/sunxi/sun6i-isp/sun6i_isp_proc.c    | 117 ++++++------
>  .../media/sunxi/sun6i-isp/sun6i_isp_proc.h    |   7 -
>  13 files changed, 437 insertions(+), 341 deletions(-)

-- 
Regards,

Laurent Pinchart

