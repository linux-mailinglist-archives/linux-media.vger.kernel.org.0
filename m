Return-Path: <linux-media+bounces-55793-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGQdG9SStGkNqgAAu9opvQ
	(envelope-from <linux-media+bounces-55793-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 23:42:28 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE72928A82C
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 23:42:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E7BFD316F5E6
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 22:42:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB2D43CCFDB;
	Fri, 13 Mar 2026 22:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="G2Dh79Vf"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5A5379ECF;
	Fri, 13 Mar 2026 22:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773441738; cv=none; b=S3wdNDTfHX4vmED2pBQS2/xsFFRJGPpe66AOn7cEcjnCLKJ/CAH05MiipjRZNKlb9xUEzBaAYWK+g1Sl/TbiEK+XpV1jQdj5vPnwmu0kW746YGABOh19XJ3ZEst69wmGeMuF+94ZxkPpyfPO764FydwtyiXkpOmKipVjYd5DPIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773441738; c=relaxed/simple;
	bh=5InzcSUoOrhkFI/i5tvE6ofAlYn5PMDb2vWX57GyUv0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jY0RlUgZTxdbVFps/7Zii5Da2xYVArc6ZVQi2nYfq6f2WjeMuOAFySOlLAdj5aDRZry6eSXrJHUIlIbNSF+D1BQHd5oqEE4NdcDRUk5GGgC2Oj1svUlvR8Z4m6c3SATIDY/kLplqUZeoYi05oR2mq7FRfPe8krm55tTLheeyqD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=G2Dh79Vf; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 06855F52;
	Fri, 13 Mar 2026 23:41:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773441665;
	bh=5InzcSUoOrhkFI/i5tvE6ofAlYn5PMDb2vWX57GyUv0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=G2Dh79VfKwlL//tSSmznZ6OLGF9WSTRahKerPg2DJsjTzuwT/2gn+RCFhKOnohsZM
	 C0VNdk8XXmV9ZXP79awbGOEY7cEEg6EEWWRvo+NeWGb6BLGzTBJucv4g5BHslUYRvo
	 vhe1MAAe1NBEuCZNQvNH46Z/wvfVL8dzBiqmXnw4=
Message-ID: <092e12ac-d743-4db4-812a-0d8751535fad@ideasonboard.com>
Date: Fri, 13 Mar 2026 22:42:11 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] media: rzv2h-ivc: Replace workqueue with direct
 function call
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 =?UTF-8?Q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
References: <20260313-mali-ivc-fixes-v7-0-v1-0-cb0714cd1279@ideasonboard.com>
 <20260313-mali-ivc-fixes-v7-0-v1-7-cb0714cd1279@ideasonboard.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20260313-mali-ivc-fixes-v7-0-v1-7-cb0714cd1279@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55793-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.scally@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Queue-Id: CE72928A82C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jacopo

On 13/03/2026 11:14, Jacopo Mondi wrote:
> From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> 
> Scheduling of work items with an async workqueue opens the door to
> potential races between multiple instances of a work item.
> 
> While the frame transfer function is now protected agains races, using a
> workqueue doesn't provide much benefit considering the limited cost of
> creating a job transfer.
> 
> Replace usage of the work queue with direct function calls.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> ---

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

>   .../platform/renesas/rzv2h-ivc/rzv2h-ivc-dev.c      |  2 +-
>   .../platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c    | 21 +++++++--------------
>   .../media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h    |  3 +--
>   3 files changed, 9 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-dev.c b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-dev.c
> index e9857eb5b51a..355842abb24b 100644
> --- a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-dev.c
> +++ b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-dev.c
> @@ -119,7 +119,7 @@ static irqreturn_t rzv2h_ivc_isr(int irq, void *context)
>   	 * The second interrupt indicates that the post-frame transfer VBLANK
>   	 * has completed, we can now schedule a new frame transfer, if any.
>   	 */
> -	queue_work(ivc->buffers.async_wq, &ivc->buffers.work);
> +	rzv2h_ivc_transfer_buffer(ivc);
>   
>   	return IRQ_HANDLED;
>   }
> diff --git a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
> index 3580a57738a6..b167f1bab7ef 100644
> --- a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
> +++ b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
> @@ -143,13 +143,11 @@ void rzv2h_ivc_buffer_done(struct rzv2h_ivc *ivc)
>   	vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
>   }
>   
> -static void rzv2h_ivc_transfer_buffer(struct work_struct *work)
> +void rzv2h_ivc_transfer_buffer(struct rzv2h_ivc *ivc)
>   {
> -	struct rzv2h_ivc *ivc = container_of(work, struct rzv2h_ivc,
> -					     buffers.work);
>   	struct rzv2h_ivc_buf *buf;
>   
> -	guard(spinlock_irqsave)(&ivc->spinlock);
> +	lockdep_assert_held(&ivc->spinlock);
>   
>   	if (ivc->vvalid_ifp)
>   		return;
> @@ -204,7 +202,7 @@ static void rzv2h_ivc_buf_queue(struct vb2_buffer *vb)
>   
>   	scoped_guard(spinlock_irq, &ivc->spinlock) {
>   		if (vb2_is_streaming(vb->vb2_queue))
> -			queue_work(ivc->buffers.async_wq, &ivc->buffers.work);
> +			rzv2h_ivc_transfer_buffer(ivc);
>   	}
>   }
>   
> @@ -282,7 +280,9 @@ static int rzv2h_ivc_start_streaming(struct vb2_queue *q, unsigned int count)
>   
>   	rzv2h_ivc_format_configure(ivc);
>   
> -	queue_work(ivc->buffers.async_wq, &ivc->buffers.work);
> +	scoped_guard(spinlock_irq, &ivc->spinlock) {
> +		rzv2h_ivc_transfer_buffer(ivc);
> +	}
>   
>   	return 0;
>   
> @@ -449,11 +449,6 @@ int rzv2h_ivc_init_vdev(struct rzv2h_ivc *ivc, struct v4l2_device *v4l2_dev)
>   
>   	spin_lock_init(&ivc->buffers.lock);
>   	INIT_LIST_HEAD(&ivc->buffers.queue);
> -	INIT_WORK(&ivc->buffers.work, rzv2h_ivc_transfer_buffer);
> -
> -	ivc->buffers.async_wq = alloc_workqueue("rzv2h-ivc", 0, 0);
> -	if (!ivc->buffers.async_wq)
> -		return -EINVAL;
>   
>   	/* Initialise vb2 queue */
>   	vb2q = &ivc->vdev.vb2q;
> @@ -471,7 +466,7 @@ int rzv2h_ivc_init_vdev(struct rzv2h_ivc *ivc, struct v4l2_device *v4l2_dev)
>   	ret = vb2_queue_init(vb2q);
>   	if (ret) {
>   		dev_err(ivc->dev, "vb2 queue init failed\n");
> -		goto err_destroy_workqueue;
> +		return ret;
>   	}
>   
>   	/* Initialise Video Device */
> @@ -520,8 +515,6 @@ int rzv2h_ivc_init_vdev(struct rzv2h_ivc *ivc, struct v4l2_device *v4l2_dev)
>   	media_entity_cleanup(&vdev->entity);
>   err_release_vb2q:
>   	vb2_queue_release(vb2q);
> -err_destroy_workqueue:
> -	destroy_workqueue(ivc->buffers.async_wq);
>   
>   	return ret;
>   }
> diff --git a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h
> index 049f223200e3..6f644ba796a9 100644
> --- a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h
> +++ b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h
> @@ -104,8 +104,6 @@ struct rzv2h_ivc {
>   	struct {
>   		/* Spinlock to guard buffer queue */
>   		spinlock_t lock;
> -		struct workqueue_struct *async_wq;
> -		struct work_struct work;
>   		struct list_head queue;
>   		struct rzv2h_ivc_buf *curr;
>   		unsigned int sequence;
> @@ -130,3 +128,4 @@ void rzv2h_ivc_deinit_subdevice(struct rzv2h_ivc *ivc);
>   void rzv2h_ivc_write(struct rzv2h_ivc *ivc, u32 addr, u32 val);
>   void rzv2h_ivc_update_bits(struct rzv2h_ivc *ivc, unsigned int addr,
>   			   u32 mask, u32 val);
> +void rzv2h_ivc_transfer_buffer(struct rzv2h_ivc *ivc);
> 


