Return-Path: <linux-media+bounces-56391-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCLXM/hxvGkPywIAu9opvQ
	(envelope-from <linux-media+bounces-56391-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 23:00:24 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B69B12D2D75
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 23:00:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EFF29302805E
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 21:59:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BDF640756E;
	Thu, 19 Mar 2026 21:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="obuvIyhk"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8CE4070FC;
	Thu, 19 Mar 2026 21:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773957566; cv=none; b=BfpSuyO55o1ea1usMOoqCzezBKubV/tV33R7dZxwwJEONcpo7ZhGHxzjFp6MelyO868GDdBg3c86MvG1FnnvaY2cmHrnvjmflhRA0yzKV5blIPzcu360dhvTYwvY6GxwjjUCPDzBiIMfsYF0WXT65x/hZE5FJAhiVYiwTiVJ/Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773957566; c=relaxed/simple;
	bh=aC0FGWPPla4uf7rNFOUmz6zWZ0rXHirwJjooLiRgQ7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AKdvfJXDaNv4FbEl+xvqSAkGa+gJhn6TebB9ELaIQfu/VpmzMrIcV4jOpKBnWIdk6gAGSwRZFDLwYHpkdvexv0GFvIcT4HhnRJr1crp/E1oowcH2g4GsANbm5PhXnoANbFQeOLDcxq84OAZrPmxw6/rwCuHCXw/WVWiVZUdvRxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=obuvIyhk; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 74D46838;
	Thu, 19 Mar 2026 22:58:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773957489;
	bh=aC0FGWPPla4uf7rNFOUmz6zWZ0rXHirwJjooLiRgQ7U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=obuvIyhkR0pIYx2XtVAcWsfn/dLXstgLlMwkLvZaKkdXaUb8ZnZLmZHN5F+GNL45R
	 8TcnOwEkgR0E+33XoDdrx2XINH9i1+GQNMY70QxlIYECP3W5Bg8uziNzR/OO2hNNvu
	 /9wCKqtvupxHZB6l26TnCMWJ04PfilA6Qct330m4=
Date: Thu, 19 Mar 2026 23:59:21 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Riedmueller <s.riedmueller@phytec.de>,
	Jacopo Mondi <jacopo@jmondi.org>, Christian Hemp <c.hemp@phytec.de>,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Alexi Birlinger <alexi.birlinger@nxp.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v2 2/2] media: nxp: imx8-isi: Prioritize pending buffers
 over discard buffers
Message-ID: <20260319215921.GC950375@killaraus.ideasonboard.com>
References: <20260312-isi_min_buffers-v2-0-d5ea1c79ad81@nxp.com>
 <20260312-isi_min_buffers-v2-2-d5ea1c79ad81@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260312-isi_min_buffers-v2-2-d5ea1c79ad81@nxp.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56391-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,nxp.com,pengutronix.de,gmail.com,phytec.de,jmondi.org,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.983];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[killaraus.ideasonboard.com:mid,ideasonboard.com:dkim,nxp.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B69B12D2D75
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Guoniu,

Thank you for the patch.

On Thu, Mar 12, 2026 at 11:12:35AM +0800, Guoniu Zhou wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
> 
> Change the buffer selection logic to use pending buffers first (up to the
> number available), and only use discard buffers to fill remaining slots
> when insufficient pending buffers are queued. Ensure user buffers are
> utilized as soon as possible, improving efficiency and reducing the number
> of discarded frames at stream start.

The commit message should explain *why* the change is good. How does
this improve the behaviour ?

I'll queue 1/2 in my tree already.

> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
> Changes in v2:
> - Replace "This ensures" with "ensure"
> - Put example from commit message to comment in driver suggested by Frank
>   https://lore.kernel.org/linux-media/20260311-isi_min_buffers-v1-0-c9299d6e8ae6@nxp.com/T/#m2774912ed31553ef1fdcc840bd6eae53a03ecccd
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> index 1be3a728f32f89338a75ddcc4e96e7501ed954e1..77ebff03323ace50ff039c8333d25a9c3dd44880 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> @@ -792,7 +792,14 @@ static void mxc_isi_video_queue_first_buffers(struct mxc_isi_video *video)
>  		struct mxc_isi_buffer *buf;
>  		struct list_head *list;
>  
> -		list = i < discard ? &video->out_discard : &video->out_pending;
> +		/*
> +		 * Queue buffers: prioritize pending buffers, then discard buffers
> +		 * For example:
> +		 * - 2 pending buffers: both slots use pending buffers
> +		 * - 1 pending buffer: first slot uses pending, second uses discard
> +		 * - 0 pending buffers: both slots use discard buffers
> +		 */
> +		list = (i < 2 - discard) ? &video->out_pending : &video->out_discard;
>  		buf = list_first_entry(list, struct mxc_isi_buffer, list);
>  
>  		mxc_isi_channel_set_outbuf(video->pipe, buf->dma_addrs, buf_id);
> 

-- 
Regards,

Laurent Pinchart

