Return-Path: <linux-media+bounces-62807-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EjV3F7HMFWoTcAcAu9opvQ
	(envelope-from <linux-media+bounces-62807-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 18:39:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BA51A5D9D81
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 18:39:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 19684309EBC0
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 16:07:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE8AB3AEF4F;
	Tue, 26 May 2026 16:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ER3Oz2zy"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A58E366542;
	Tue, 26 May 2026 16:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779811659; cv=none; b=qBVxWYYV0WSAAcVE7kdfQTjPyuIlKZDXWkvFc1lNFPSdytBbMJuP+4EU599iC/VdoF+mgIzYhE5u1nfw0zhue4auBu5KC2BWmd+/L8Y87AGSXpZtkGfjX+ZrWdugWpRdSpVAnFvP5t1qb/QQ9Bs2tDY7NndbRIshbX7ETwK/884=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779811659; c=relaxed/simple;
	bh=kb154U3+DNAckJiQFLM0klBHRdbqCz70jsGUNm6c/4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kpe9dcoBqx9g89TPxygpN42u1OjuSzck/pDJfqbYhk3IbeNrHCjVpwFh37GLPLIS0uk8d/ayM/RE+UXJO8TPxGR0qPzAHyX6ovCFNThmPb7tkHuEW24PVWMe+JtIfb7eeyFOUx2G+P3j8xa8OKcO2oGq8iJH1qaZb/6mipI8sX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ER3Oz2zy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (unknown [146.0.28.163])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C9760244;
	Tue, 26 May 2026 18:07:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1779811636;
	bh=kb154U3+DNAckJiQFLM0klBHRdbqCz70jsGUNm6c/4E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ER3Oz2zyqbb7hy6Ghc92nNMoizfTW/4npZP18Z5Mi9g8figadeln3y8KkaalgDwxw
	 WvrVjwGpaMwMAt5Kgl2MRZ09TNXSoGXAPmztl+2KNHuM4k7jqye1RQ0PpI+qVA3agC
	 i4TFeIju6J0czEh6q7PfgjqTcNbhzrbVOMAtnGD4=
Date: Tue, 26 May 2026 18:07:33 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Subject: Re: [PATCH] media: rcar-vin: Drop min_queued_buffers
Message-ID: <20260526160733.GA422575@killaraus.ideasonboard.com>
References: <20260504-rcar-vin-min-queued-buffs-v1-1-59d20ad5cd2d@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260504-rcar-vin-min-queued-buffs-v1-1-59d20ad5cd2d@ideasonboard.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[ragnatech.se,ideasonboard.com,kernel.org,glider.be,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-62807-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,killaraus.ideasonboard.com:mid]
X-Rspamd-Queue-Id: BA51A5D9D81
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jacopo,

Thank you for the patch.

On Mon, May 04, 2026 at 02:43:14PM +0200, Jacopo Mondi wrote:
> From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> 
> The R-Car VIN driver already uses a scratch buffer to sustain capture
> operations in absence of a frame buffer provided by userspace.
> 
> There is no reason to require 4 buffers queued at all times for the
> driver to operate. Drop min_queued_buffers from the VIN driver to allow
> single-frame capture operations.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> This allows to capture a single frame when the R-Car VIN is used
> to feed the R-Car ISP on R-Car V4H.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/media/platform/renesas/rcar-vin/rcar-dma.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> index f9af9177e02f..73cda0e2d45a 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> @@ -1494,7 +1494,6 @@ int rvin_dma_register(struct rvin_dev *vin, int irq)
>  	q->ops = &rvin_qops;
>  	q->mem_ops = &vb2_dma_contig_memops;
>  	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> -	q->min_queued_buffers = 4;
>  	q->dev = vin->dev;
>  
>  	ret = vb2_queue_init(q);
> 
> ---
> base-commit: d9c8c4adf23d17549c0ec9c85b99d85a0ee6cf18
> change-id: 20260504-rcar-vin-min-queued-buffs-31891f226fe6

-- 
Regards,

Laurent Pinchart

