Return-Path: <linux-media+bounces-67679-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YBKeLsaFV2rJWAAAu9opvQ
	(envelope-from <linux-media+bounces-67679-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 15:06:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC4075E752
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 15:06:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Um2WkpX7;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67679-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67679-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 208CF31478A6
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 13:00:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6062C481A8B;
	Wed, 15 Jul 2026 12:55:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F269E481650;
	Wed, 15 Jul 2026 12:55:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784120130; cv=none; b=Hm/2rUys3bZDVXO++EwqXQ+jUNraqloxP4O7Xhrn5JAOZcNnAUHz05ZWpZS/5AVmvTEuaBgU+p5Yu0uMaFOTN3o1yEq3MBKLdktfUneox7hOjdkzUjBR4CO4V2rPsf0AlD2wbW0kUs6dsU3fg2d648lu6lYAqGAL/PCLdzUttaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784120130; c=relaxed/simple;
	bh=MKKRhJQCSEH0rSQ63C12AZStA66dS0doVzbUM9ZCjXM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=UHb4Py975//t/xFVG/I0i8gUZeOWYCEnkncSRLCDqaR0vwNap6jNerrkpbvAxa0kepVQ+nv/5mMDHX/R+G3ye1GtIPUgWIdqmqCWq4xHs0t8Ajn800ahT1XjBf4AfTPbs50w8Rmrvt2wbSo756RXwgbTGkPGO0BALipAaLIfBXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Um2WkpX7; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5D381F000E9;
	Wed, 15 Jul 2026 12:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784120126;
	bh=oM5klqY7nrwsmiPoipQXjU8VknW3fb9h5IaB4V41/5I=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=Um2WkpX70CYmo8MQuDNWdziN4xZfY9He1Fl3+MFTxPOq/mrEiWS2Tznv1LpnP2HRz
	 GMjKW/CwPlq37OzpKsjUguRHK1khBZxcIPQfKWBWSeZagvj/2/9vMUC/wRQYaAO/Qs
	 3xGuMMsWQnDEnUaOxyalLY4v+zjAiNL+7sFDWduN0I4Kv8uQCwpeLWdeDwZnRRiKKn
	 yIufjqqcrYmXYnxt5L3TtHi+UkJin4SYvXdKk5p96HW/apghnEwRXmogGZgKi2+AEU
	 QIKZJII97A06bsZEowgU5el2cwkeRcGbUvUD5hloagR2uKaJ918dA0fECD2k7xvAY8
	 DmQNCl0BdURWw==
Message-ID: <801025b7-a3b8-4655-af49-f9bb65254170@kernel.org>
Date: Wed, 15 Jul 2026 14:55:23 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: hverkuil+cisco@kernel.org
Subject: Re: [PATCH v3] media: ti: vpe: quiesce overflow recovery before
 freeing streams
To: Fan Wu <fanwu01@zju.edu.cn>, y-abhilashchandra@ti.com
Cc: mchehab@kernel.org, bparrot@ti.com, dale@farnsworth.org,
 dagriego@biglakesoftware.com, sbellary@baylibre.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <246a3e47-02ac-46c1-b3cc-dfcf30c00065@ti.com>
 <20260713195622.2181593-1-fanwu01@zju.edu.cn>
Content-Language: en-US, nl
In-Reply-To: <20260713195622.2181593-1-fanwu01@zju.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:fanwu01@zju.edu.cn,m:y-abhilashchandra@ti.com,m:mchehab@kernel.org,m:bparrot@ti.com,m:dale@farnsworth.org,m:dagriego@biglakesoftware.com,m:sbellary@baylibre.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-67679-lists,linux-media=lfdr.de,cisco];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FORGED_SENDER(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3EC4075E752
X-Rspamd-Action: no action

On 13/07/2026 21:56, Fan Wu wrote:
> The VIP overflow recovery worker is armed from the hardirq handler when a
> FIFO overflow is detected, and the list-complete path looks the stream up
> through the VPDMA list private pointer. Both keep touching stream, port
> and device state; the recovery worker also resets the parser and VPDMA,
> repopulates the descriptor list, and re-enables the per-list IRQs.
> 
> vip_stop_streaming() masks and clears the per-list IRQs, but it neither
> synchronizes the hardirq handler nor disables recovery_work. An overflow
> IRQ that has already queued recovery_work, or a list-complete IRQ in
> flight when the stream is torn down, can therefore still dereference the
> stream after its resources are released: the descriptor list is freed by
> vip_release_stream() on file release, and the stream itself by
> free_stream() on unbind/remove.
> 
> Drain the recovery worker and the IRQ handler at both teardown points
> through a shared vip_quiesce_stream() helper, before any stream-owned
> resource is released. disable_work_sync() cancels pending recovery_work,
> drains a running instance, and raises its disable depth, so a subsequent
> schedule_work() issued by a racing IRQ handler is rejected at the
> workqueue scheduler: recovery_work cannot be requeued after
> disable_work_sync() takes effect. The worker may still re-enable the
> per-list IRQs before disable_work_sync() returns; disable_irqs() then
> masks those sources and synchronize_irq() waits for any in-flight handler
> that still dereferences stream state. recovery_work is created disabled
> and enabled in vip_start_streaming() before IRQs, pairing the enable with
> the teardown disable across the streaming lifecycle.
> 
> Return the released slot's value instead of the array base in
> vpdma_hwlist_release(), and clear the slot so subsequent list-complete
> lookups cannot recover the freed stream through the stale slot value.
> 
> This issue was found by an in-house static analysis tool and confirmed by
> manual code review.
> 
> Fixes: fc2873aa4a21 ("media: ti: vpe: Add the VIP driver")
> Assisted-by: Codex:gpt-5.6
> Signed-off-by: Fan Wu <fanwu01@zju.edu.cn>
> ---
> Changes in v3:
> - Replace the per-stream irq_rearm_allowed flag and the repeated IRQ
>   disable/synchronize_irq() in vip_quiesce_stream() with the workqueue
>   disable-depth API, as suggested by Yemike Abhilash Chandra.
>   disable_work_sync() cancels pending recovery_work, drains a running
>   instance, and blocks any future schedule_work() from a racing IRQ
>   handler at the scheduler; this also closes a window the v2 double-drain
>   left open, where its second IRQ drain (synchronize_irq) waited for the
>   in-flight handler but did not cancel the recovery_work it had requeued,
>   so that work could run after free.
> - Create recovery_work disabled and enable it in vip_start_streaming()
>   before IRQs.
> - In vip_stop_streaming(), quiesce before stopping the parser: a worker
>   drained by disable_work_sync() may re-enable the parser before exiting, so
>   stopping the parser first would be undone.
> 
> Changes in v2:
> - Drain the overflow recovery worker at both teardown points through a
>   shared vip_quiesce_stream() helper: vip_stop_streaming() (file release
>   path) and free_stream() (unbind/remove). v1 drained only in
>   free_stream().
> - Document how the issue was found and that the patch was prepared with
>   LLM assistance (Assisted-by trailer and body note).
> 
> Link: https://lore.kernel.org/r/20260708013738.110752-1-fanwu01@zju.edu.cn/
> ---
>  drivers/media/platform/ti/vpe/vip.c   | 37 ++++++++++++++++++++++++---
>  drivers/media/platform/ti/vpe/vpdma.c |  3 ++-
>  2 files changed, 35 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/ti/vpe/vip.c b/drivers/media/platform/ti/vpe/vip.c
> index cb0a5a07a3d4..30e9a85d4cf5 100644
> --- a/drivers/media/platform/ti/vpe/vip.c
> +++ b/drivers/media/platform/ti/vpe/vip.c
> @@ -814,6 +814,22 @@ static void clear_irqs(struct vip_dev *dev, int irq_num, int list_num)
>  	vpdma_clear_list_stat(dev->shared->vpdma, irq_num, dev->slice_id);
>  }
>  
> +/*
> + * Quiesce recovery work and per-list IRQs before releasing stream resources.
> + * disable_work_sync() prevents the overflow handler from requeueing recovery
> + * work. Mask and synchronize IRQs afterwards because a running worker may
> + * have re-enabled them before exiting.
> + */
> +static void vip_quiesce_stream(struct vip_stream *stream)
> +{
> +	struct vip_dev *dev = stream->port->dev;
> +
> +	disable_work_sync(&stream->recovery_work);
> +	disable_irqs(dev, dev->slice_id, stream->list_num);
> +	clear_irqs(dev, dev->slice_id, stream->list_num);
> +	synchronize_irq(dev->irq);
> +}
> +
>  static void populate_desc_list(struct vip_stream *stream)
>  {
>  	struct vip_port *port = stream->port;
> @@ -2428,6 +2444,7 @@ static int vip_start_streaming(struct vb2_queue *vq, unsigned int count)
>  		goto err;
>  
>  	stream->num_recovery = 0;
> +	enable_work(&stream->recovery_work);
>  
>  	clear_irqs(dev, dev->slice_id, stream->list_num);
>  	enable_irqs(dev, dev->slice_id, stream->list_num);
> @@ -2452,13 +2469,17 @@ static void vip_stop_streaming(struct vb2_queue *vq)
>  	struct vip_dev *dev = port->dev;
>  	int ret;
>  
> +	/*
> +	 * A running recovery worker may re-enable the parser, so quiesce it
> +	 * and its IRQ handler before stopping the parser or releasing the
> +	 * descriptor list.
> +	 */
> +	vip_quiesce_stream(stream);
> +
>  	vip_parser_stop_imm(port, true);
>  	vip_enable_parser(port, false);
>  	unset_fmt_params(stream);
>  
> -	disable_irqs(dev, dev->slice_id, stream->list_num);
> -	clear_irqs(dev, dev->slice_id, stream->list_num);
> -
>  	if (port->subdev) {
>  		ret = v4l2_subdev_call(port->subdev, video, s_stream, 0);
>  		if (ret)
> @@ -3074,6 +3095,8 @@ static int alloc_stream(struct vip_port *port, int stream_id, int vfl_type)
>  		goto do_free_hwlist;
>  
>  	INIT_WORK(&stream->recovery_work, vip_overflow_recovery_work);
> +	/* Start disabled; vip_start_streaming() enables it before IRQs. */
> +	disable_work(&stream->recovery_work);
>  
>  	INIT_LIST_HEAD(&stream->vidq);
>  
> @@ -3139,6 +3162,13 @@ static void free_stream(struct vip_stream *stream)
>  		return;
>  
>  	dev = stream->port->dev;
> +	/*
> +	 * Unpublish the stream and quiesce its IRQ handler and recovery worker
> +	 * before releasing stream-owned resources.
> +	 */
> +	stream->port->cap_streams[stream->stream_id] = NULL;
> +	vip_quiesce_stream(stream);

Shouldn't these two lines be swapped? It feels dangerous to set that pointer
to NULL while IRQ handlers might still be running.

I want to see a 'Tested-by' from someone before I accept this patch.

> +
>  	/* Free up the Drop queue */
>  	list_for_each_safe(pos, q, &stream->dropq) {
>  		buf = list_entry(pos,
> @@ -3150,7 +3180,6 @@ static void free_stream(struct vip_stream *stream)
>  
>  	video_unregister_device(stream->vfd);
>  	vpdma_hwlist_release(dev->shared->vpdma, stream->list_num);
> -	stream->port->cap_streams[stream->stream_id] = NULL;
>  	kfree(stream);
>  }
>  
> diff --git a/drivers/media/platform/ti/vpe/vpdma.c b/drivers/media/platform/ti/vpe/vpdma.c
> index 573aa83f62eb..f9f5b2f1ee1a 100644
> --- a/drivers/media/platform/ti/vpe/vpdma.c
> +++ b/drivers/media/platform/ti/vpe/vpdma.c
> @@ -988,7 +988,8 @@ void *vpdma_hwlist_release(struct vpdma_data *vpdma, int list_num)
>  
>  	spin_lock_irqsave(&vpdma->lock, flags);
>  	vpdma->hwlist_used[list_num] = false;
> -	priv = vpdma->hwlist_priv;
> +	priv = vpdma->hwlist_priv[list_num];
> +	vpdma->hwlist_priv[list_num] = NULL;

Hmm, the return pointer is not actually used anywhere. I'd rather turn this into a
void function.

I also don't think it is needed to set vpdma->hwlist_priv[list_num] to NULL. Although you
could use that as an alternative for hwlist_used and just drop hwlist_used.

In any case, this change has nothing to do with the other changes and so it should be
in a separate patch.

Regards,

	Hans

>  	spin_unlock_irqrestore(&vpdma->lock, flags);
>  
>  	return priv;


