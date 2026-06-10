Return-Path: <linux-media+bounces-64518-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Zq/KI3bHKWq6dAMAu9opvQ
	(envelope-from <linux-media+bounces-64518-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 22:22:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A5266CBF8
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 22:22:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=DPU4A6A8;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64518-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64518-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D29D930E0D42
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 20:21:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AF5147AF6C;
	Wed, 10 Jun 2026 20:21:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D899376481;
	Wed, 10 Jun 2026 20:21:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781122889; cv=none; b=us1/JqmFGGzYFsXljtQKXfmkoqwR3B538GoKT0YshfgmLwHUGv3u89WZ+UWac3dJ8aAlFwOeX6GN9PaysdP4ef+tfONgBedFcAJNNisKuhsO/zPUkomru3AM5+HP2pJmlmcgyZBua5JNiJh+M/XV9aA0Huk0ouSV+H71Sa8K4pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781122889; c=relaxed/simple;
	bh=C0hgwPpvRDLcB4otJ+c/gq+EAXdaLhyN2qcfmP8/X1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iAhHlo2z33HIsN/3yklhh1gHfM+sYl+mVn33+yPOuGcZeq3cwIH9oLoaerEJUgl4M8kcOdNXtpunhOEpb99CClRW2Fk4mg9Zuum+ZGjm2oX5rDDGDsh3R4IdOIoe09TZL9EVuxotSxLjmaAL5zI3nDTuFrPuWm8zd5ObZOrgmYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DPU4A6A8; arc=none smtp.client-ip=213.167.242.64
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8EF74D0;
	Wed, 10 Jun 2026 22:20:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781122856;
	bh=C0hgwPpvRDLcB4otJ+c/gq+EAXdaLhyN2qcfmP8/X1s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DPU4A6A8MhqxgpICYEnSO9Posr6LRrhrGs7bOspqe1IVCyqIr4bphjSJ/4SrOI/kZ
	 SW7nf1Sl4yfZ3jleOYqJvPl2PA22nMVED6RqZTuEpCZ3Prvy/AoOtHsu3i54W2qYuB
	 cCa7Lz1DfW942CsDqCXqkVJkMH+JInar3sAI25/I=
Date: Wed, 10 Jun 2026 23:21:24 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Xiaolei Wang <xiaolei.wang@windriver.com>,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/3] media: rzg2l-cru: Remove unused kerneldoc description
Message-ID: <20260610202124.GB1384932@killaraus.ideasonboard.com>
References: <20260610-media-ci-7-2-v1-0-3c61a482a44e@chromium.org>
 <20260610-media-ci-7-2-v1-2-3c61a482a44e@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260610-media-ci-7-2-v1-2-3c61a482a44e@chromium.org>
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
	TAGGED_FROM(0.00)[bounces-64518-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ribalda@chromium.org,m:dave.stevenson@raspberrypi.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:xiaolei.wang@windriver.com,m:tarang.raval@siliconsignals.io,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:jacopo.mondi@ideasonboard.com,m:dan.scally@ideasonboard.com,m:hverkuil+cisco@kernel.org,m:mchehab+huawei@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jacopo.mondi+renesas@ideasonboard.com,m:linux-renesas-soc@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
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
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco,huawei,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:from_mime,killaraus.ideasonboard.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E0A5266CBF8

On Wed, Jun 10, 2026 at 04:20:07PM +0000, Ricardo Ribalda wrote:
> The variable has been previously removed but not its kerneldoc.
> 
> Also remove the leftover reference to state in the description of qlock.
> 
> This patch fixes the following warning:
> 
> Warning: drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h:164
> Excess struct member 'state' description in 'rzg2l_cru_dev'
> 
> Fixes: 85d8820d4869 ("media: rzg2l-cru: Remove the 'state' variable")

Does it mean that this patch was merged without going through CI ? Is
there something we need to improve in the process ?

> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> index 5bf334e173d2..b426bc7898bf 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> @@ -116,11 +116,9 @@ struct rzg2l_cru_info {
>   * @scratch_phys:	physical address of the scratch buffer
>   *
>   * @qlock:		protects @queue_buf, @buf_list, @sequence
> - *			@state
>   * @queue_buf:		Keeps track of buffers given to HW slot
>   * @buf_list:		list of queued buffers
>   * @sequence:		V4L2 buffers sequence number
> - * @state:		keeps track of operation state
>   *
>   * @format:		active V4L2 pixel format
>   */
> 

-- 
Regards,

Laurent Pinchart

