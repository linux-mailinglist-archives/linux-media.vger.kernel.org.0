Return-Path: <linux-media+bounces-57552-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPR7NYEsymkA6AUAu9opvQ
	(envelope-from <linux-media+bounces-57552-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 09:55:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1DE356BDC
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 09:55:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 95ED8304A143
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 07:50:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D2BA3A7F75;
	Mon, 30 Mar 2026 07:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="l8Rftvs+"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689D323183B;
	Mon, 30 Mar 2026 07:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774857037; cv=none; b=B6wl4mkLKjUvK0SRm6CATZNIy2QGxyDXWwnsnbjIiYkU2EnZj8jk4a/PmdWaIWgKufuj0Pi58oXzsKMR4Y0dWLw6Vmx2RNrLxstoKS3soergsBHlQT5O0Qqz7Fpu4ISrsXpQaFPzrQDLbdQ9yocCw48BOo3XX2qabPRYzFOEJHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774857037; c=relaxed/simple;
	bh=r6tj4wjTcXuf34OsWonOEaYIh+C+DzYKxkZwDt53BG8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WMDdWxN3Qb7XFNpqwoEt+4FLR5646guO2CIRunMe43aDmRHp6G107TUGAAumjG0DLfM0qlbeUbY82Ky235hD/nB8u6IvwMF3cw4XvJ3xysdL8All2MJpfl2A8TfoVqxixZMRv1uKOXU9BPeeTX/DRIqLxreKhdvsJE7hr0V02Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=l8Rftvs+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 92B5920FF;
	Mon, 30 Mar 2026 09:49:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774856951;
	bh=r6tj4wjTcXuf34OsWonOEaYIh+C+DzYKxkZwDt53BG8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=l8Rftvs+UODMSV/R/G6vvRNnlBa5hXGlT6PedFdIU5NqkZbU1tSevAw1KTOQMud4r
	 N6i2PTVyWEIW8BFHHGVFObayGihe3J0bDD28cgTS/wCV/ka+eBSz5D2BEfj7IIGN5P
	 zMapbzgGbQWwok/1KSWvjo2CLu+pmCiKHwEdeFPc=
Message-ID: <ac8a85b0-c538-44e6-ac38-23c4953cfb4c@ideasonboard.com>
Date: Mon, 30 Mar 2026 08:50:28 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/14] media: rzg2l-cru: Do not use irqsave when not
 needed
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: =?UTF-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
References: <20260327-b4-cru-rework-v1-0-3b7d0430f538@ideasonboard.com>
 <20260327-b4-cru-rework-v1-6-3b7d0430f538@ideasonboard.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20260327-b4-cru-rework-v1-6-3b7d0430f538@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57552-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[protonmail.com,bp.renesas.com,vger.kernel.org,ideasonboard.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.scally@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas,cisco];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Queue-Id: 3D1DE356BDC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 27/03/2026 17:10, Jacopo Mondi wrote:
> From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> 
> The return_unused_buffers() and rzg2l_cru_buffer_queue() functions
> are never called from an interrupt context, hence they do not need to
> use the irqsave version of the spinlock primitives.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> ---

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

>   drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 43b1d35fb963..2e94788c3a13 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -113,7 +113,7 @@ static void return_unused_buffers(struct rzg2l_cru_dev *cru,
>   	struct rzg2l_cru_buffer *buf, *node;
>   	unsigned int i;
>   
> -	guard(spinlock_irqsave)(&cru->qlock);
> +	guard(spinlock_irq)(&cru->qlock);
>   
>   	for (i = 0; i < cru->num_buf; i++) {
>   		if (cru->queue_buf[i]) {
> @@ -166,7 +166,7 @@ static void rzg2l_cru_buffer_queue(struct vb2_buffer *vb)
>   	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
>   	struct rzg2l_cru_dev *cru = vb2_get_drv_priv(vb->vb2_queue);
>   
> -	guard(spinlock_irqsave)(&cru->qlock);
> +	guard(spinlock_irq)(&cru->qlock);
>   	list_add_tail(to_buf_list(vbuf), &cru->buf_list);
>   }
>   
> 


