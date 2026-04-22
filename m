Return-Path: <linux-media+bounces-59281-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Q8BTN7xv6GmvKQIAu9opvQ
	(envelope-from <linux-media+bounces-59281-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 08:50:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DAC544298F
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 08:50:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 129F43017F98
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 06:46:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A63903368AE;
	Wed, 22 Apr 2026 06:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZaUmdagN"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2BD3126CA;
	Wed, 22 Apr 2026 06:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776840409; cv=none; b=TR7re/cMCpRvweqwX1KD9LuEiqqvDP0qJCPBCcyTXp6b19VoKW+Q80i+NTLzR6pLZkq+niHqGV+9CWI6bZjoonvO/ELDAZrCSPu1gVbg2LpfHMsWBCyy5wIOkmPyuiRnUltNDOue6M4NkvQJyySvUzvot32VmCQWDxhy3PoMN+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776840409; c=relaxed/simple;
	bh=53vAvHSFNAJPfOTM55ot6q9DLz5k9NHWrKl122HxiBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mXTRUfBaK7uqJRy9MOLGnsf0IoZt1hm6iysMkEt9XJFR5MdELoxJzJnft5VfsUoja8AxL5riwcjZTUYBSlMpXxmBBZ1gQt/6U2adegBb0O7IqsYEDJkCTidT6q71e5bMkphESVTcnkE5ybjUdVgLIqPjNcunpE1sNIcLQU9pXO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZaUmdagN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1067C324;
	Wed, 22 Apr 2026 08:45:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776840307;
	bh=53vAvHSFNAJPfOTM55ot6q9DLz5k9NHWrKl122HxiBg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZaUmdagN0pEQWwTpl5v1uzotrukPJc8o1Yj2LrGrU/0xRA++68DoC2zzjH48CQUzn
	 NRpFHXvkiHbhvremxupGWuNlqXkOqXbFd5ntDZ0pQM9zl3Cu6Y4TfSO398VBI/tAcF
	 wKAUCKMHwXn4AHXh1RJ+puLVEFwau/t1YAG9KnC8=
Date: Wed, 22 Apr 2026 08:46:41 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Shuhao Fu <sfual@cse.ust.hk>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: rzg2l-cru: serialize state transitions with qlock
Message-ID: <aehugR1f3gDGyIJE@zed>
References: <20260421060307.GA2522920@chcpu16>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260421060307.GA2522920@chcpu16>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59281-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ust.hk:email,ideasonboard.com:dkim,linuxtv.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4DAC544298F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello Shuhao Fu

On Tue, Apr 21, 2026 at 02:03:07PM +0800, Shuhao Fu wrote:
> struct rzg2l_cru_dev.state is documented as protected by qlock, and the
> IRQ path already reads and updates it under that lock. However,
> rzg2l_cru_stop_streaming() writes STOPPING and
> rzg2l_cru_start_streaming_vq() writes STARTING without taking qlock.
>
> That lets process-context stream control race with rzg2l_cru_irq().
> If the IRQ handler misses a concurrent STOPPING update, it can continue
> normal frame completion and slot refill after streamoff has begun. A
> similar race around STARTING can make the IRQ path observe the wrong
> phase during startup synchronization.
>
> Fix both state transitions by serializing the writes with qlock, while
> still keeping rzg2l_cru_set_stream() outside the locked region.

Thanks, but I would rather complete my series that removes 'state'
completely:
https://patchwork.linuxtv.org/project/linux-media/list/?series=23674

Thanks
  j

>
> Fixes: 07fc05bd0a79 ("media: platform: Add Renesas RZ/G2L CRU driver")
> Signed-off-by: Shuhao Fu <sfual@cse.ust.hk>
> ---
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 162e2ace693184..434754fd155a8e 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -560,7 +560,11 @@ pipe_line_stop:
>
>  static void rzg2l_cru_stop_streaming(struct rzg2l_cru_dev *cru)
>  {
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&cru->qlock, flags);
>  	cru->state = RZG2L_CRU_DMA_STOPPING;
> +	spin_unlock_irqrestore(&cru->qlock, flags);
>
>  	rzg2l_cru_set_stream(cru, 0);
>  }
> @@ -749,6 +753,7 @@ irqreturn_t rzg3e_cru_irq(int irq, void *data)
>  static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count)
>  {
>  	struct rzg2l_cru_dev *cru = vb2_get_drv_priv(vq);
> +	unsigned long flags;
>  	int ret;
>
>  	ret = pm_runtime_resume_and_get(cru->dev);
> @@ -791,7 +796,9 @@ static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count
>  		goto out;
>  	}
>
> +	spin_lock_irqsave(&cru->qlock, flags);
>  	cru->state = RZG2L_CRU_DMA_STARTING;
> +	spin_unlock_irqrestore(&cru->qlock, flags);
>  	dev_dbg(cru->dev, "Starting to capture\n");
>  	return 0;
>
> --
> 2.25.1
>

