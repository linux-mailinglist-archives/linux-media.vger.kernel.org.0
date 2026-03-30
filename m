Return-Path: <linux-media+bounces-57596-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBKyBEVYymn27gUAu9opvQ
	(envelope-from <linux-media+bounces-57596-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 13:02:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0406F359DC6
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 13:02:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 61CF1301E721
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 10:47:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79B2C3BFE50;
	Mon, 30 Mar 2026 10:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nBCnOySc"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7C3199EAD;
	Mon, 30 Mar 2026 10:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774867609; cv=none; b=H6F3ji2CL0r7B/Ka3bDoTwDeMPkG7mvRJZzI9+hXQEfU53GMdarKqwFpuIzltWixBr3gkCg3eo1OUBqNEHVSX4qlWmNV06xTPK5Cyw41xR7w55xr3YHuIxbZZH/UHezkTiTwHii4ZchLMLQcJB3v42VxJbC8ju42jd08g7RXDXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774867609; c=relaxed/simple;
	bh=IfLuRd6WK0NP79K39N3FZFdHua3GtggiRQm5XdkRClg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cgpgHMRWwkGvTtkh19y1YaLo0jchhgICCY4eNHa+wSS4SCieYVSO1SqVYJ6DeUfAAtZi/0EAwaojzQEtilBQCdkiRhBhP5YkbRoVrMznnSQ7erNF+X0wQ2FbqdPl6qlUiQ/7l8/Bsskl3eDZ9XI79Zz9gzjKbPw22zDq0ln3aRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nBCnOySc; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BE7F93DA;
	Mon, 30 Mar 2026 12:45:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774867523;
	bh=IfLuRd6WK0NP79K39N3FZFdHua3GtggiRQm5XdkRClg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nBCnOySc8JUXIMslxFvPaWNks7InqSj1vcnHqG+DU+ilBaORJWNJWVpFz1T+ObXE9
	 qilr15c+9Tvsdnor3GqTmoypffibaxS6ujazURUDsq8QDBgOF6e+Z5nK8wlMeHUknh
	 CeNY0JJD1yq2ZEAX6tVAce4vfnNhss/6DDzBURGI=
Message-ID: <a6e3ee8f-e292-41c2-990a-ab24df037980@ideasonboard.com>
Date: Mon, 30 Mar 2026 11:46:41 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/14] media: rz2gl-cru: Introduce a spinlock for hw
 operations
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
 <20260327-b4-cru-rework-v1-8-3b7d0430f538@ideasonboard.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20260327-b4-cru-rework-v1-8-3b7d0430f538@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57596-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Queue-Id: 0406F359DC6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jacopo

On 27/03/2026 17:10, Jacopo Mondi wrote:
> From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> 
> The CRU driver uses a single spinlock to protect the buffers queue and
> the hardware operations.
> 
> This single spinlock is held for the whole duration of the interrupt
> handler, causing all other driver's operations to freeze.
> 
> Under heavy system stress conditions with userspace not providing
> buffers fast enough, this causes loss of frames.
> 
> Prepare to re-work the driver locking by introducing (but not using yet)
> a new spinlock to protect the hardware registers programming.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> ---

Looks good:

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

>   drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h   | 10 +++++++---
>   drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c |  1 +
>   2 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> index 3a200db15730..b46696a0012b 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> @@ -109,7 +109,6 @@ struct rzg2l_cru_info {
>    * @v4l2_dev:		V4L2 device
>    * @num_buf:		Holds the current number of buffers enabled
>    * @svc_channel:	SVC0/1/2/3 to use for RZ/G3E
> - * @buf_addr:		Memory addresses where current video data is written.
>    * @notifier:		V4L2 asynchronous subdevs notifier
>    *
>    * @ip:			Image processing subdev info
> @@ -118,6 +117,10 @@ struct rzg2l_cru_info {
>    * @mdev_lock:		protects the count, notifier and csi members
>    * @pad:		media pad for the video device entity
>    *
> + * @hw_lock:		protects the slot counter, hardware programming of
> + *			slot addresses and the @buf_addr[] list
> + * @buf_addr:		Memory addresses where current video data is written
> + *
>    * @lock:		protects @queue
>    * @queue:		vb2 buffers queue
>    * @scratch:		cpu address for scratch buffer
> @@ -147,8 +150,6 @@ struct rzg2l_cru_dev {
>   	u8 num_buf;
>   
>   	u8 svc_channel;
> -	dma_addr_t buf_addr[RZG2L_CRU_HW_BUFFER_DEFAULT];
> -
>   	struct v4l2_async_notifier notifier;
>   
>   	struct rzg2l_cru_ip ip;
> @@ -157,6 +158,9 @@ struct rzg2l_cru_dev {
>   	struct mutex mdev_lock;
>   	struct media_pad pad;
>   
> +	spinlock_t hw_lock;
> +	dma_addr_t buf_addr[RZG2L_CRU_HW_BUFFER_DEFAULT];
> +
>   	struct mutex lock;
>   	struct vb2_queue queue;
>   	void *scratch;
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 27079c17a54c..a79b17e146bf 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -844,6 +844,7 @@ int rzg2l_cru_dma_register(struct rzg2l_cru_dev *cru)
>   	mutex_init(&cru->lock);
>   	INIT_LIST_HEAD(&cru->buf_list);
>   
> +	spin_lock_init(&cru->hw_lock);
>   	spin_lock_init(&cru->qlock);
>   
>   	cru->state = RZG2L_CRU_DMA_STOPPED;
> 


