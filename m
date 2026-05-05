Return-Path: <linux-media+bounces-60413-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BUXKnHu+WlqFQMAu9opvQ
	(envelope-from <linux-media+bounces-60413-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 15:19:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 078A04CE548
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 15:19:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 02FC430BE7B8
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 13:14:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0DF247CC73;
	Tue,  5 May 2026 13:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SjrBkTLI"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27464779BB;
	Tue,  5 May 2026 13:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777986861; cv=none; b=pokLe3M12ap8yL/DP+a/79WP7ZD3ladT60HgEHJ8IkOHPgBmsObW/rFJUUSOTWiDY6bBhCYbn09ZZw6er9fUD/lPntq5bd96h6JEpY2hgJ2p62EJOxH1MMMuzGrl4wCKGLgeg+zTgAFhDXsWWA5GRsecXBpav+8j93+lHn8YrQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777986861; c=relaxed/simple;
	bh=QSFnhkYMf4aPlt7sNwDFTweYgnEzSwkxwd7q4fFh8Gw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FWMCCpeC+Y1SAe/b0Ol0CukzeTRmLZM0hWS98GKQ+wyXkqwNmHyoYep91EGp2w10cIwAIvsUfGPBQ1BR1oHeWSZTI0WRSfBR12DjIuyZ5mvCMc65X/g6zaknqiyxMtv480BalhlbspaEfDhJkAkU+jLKy+oyll+TN73WW6fv/VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SjrBkTLI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E638AC2BCB4;
	Tue,  5 May 2026 13:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777986860;
	bh=QSFnhkYMf4aPlt7sNwDFTweYgnEzSwkxwd7q4fFh8Gw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SjrBkTLI7MwSZHVqUwceO0lnHA91JQP+LV0rpn4YQe/Dh7WnZuFcETvjbZ1odM7G+
	 yoIE9VgDH1dWesEMoOMk04cOQXn77aYZTDoplGng3h3uAQ2dqdfgkSp+sUusFkjwVj
	 +vFN+UuehVBQMT8UDqzy5RCLNp0zr/t4q/P29S7wW5FaLIe9r1YBAB7uWsVya6CDaU
	 OD7a+Aj1FZm1evwgar8elg2JfTS/whrqfGnGq6K8PASbd537RE3hy/QtzTteMSxHUw
	 t/Q0eBJ0nn2nir8GIrvqgPUKoM9sCYQtjevBUf0kB7mZQorzwIyktx8oUf+23B4iI3
	 Dy/rjFt53wvkA==
Message-ID: <d5f15e0c-b406-4940-81e0-3c957086ba77@kernel.org>
Date: Tue, 5 May 2026 15:14:17 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: pvrusb2: fix disconnect and teardown races
To: Sangyun Kim <sangyun.kim@snu.ac.kr>, Mike Isely <isely@pobox.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>, Edward Adam Davis <eadavis@qq.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260420060621.1627352-1-sangyun.kim@snu.ac.kr>
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Content-Language: en-US
In-Reply-To: <20260420060621.1627352-1-sangyun.kim@snu.ac.kr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 078A04CE548
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60413-lists,linux-media=lfdr.de,cisco];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[snu.ac.kr,pobox.com,kernel.org,qq.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,snu.ac.kr:email]

On 4/20/26 08:06, Sangyun Kim wrote:
> pvr2_context_disconnect() queues a notification to the pvrusb2-context
> kthread before it stores mp->disconnect_flag:
> 
>     pvr2_hdw_disconnect(mp->hdw);
>     if (!pvr2_context_shutok())
>         pvr2_context_notify(mp);
>     mp->disconnect_flag = !0;
> 
> The context thread only destroys a context when disconnect_flag is set
> and mc_first is NULL. If the notification wakes the thread before the
> flag store becomes visible, the thread dequeues the context, runs
> pvr2_context_check() with disconnect_flag still observed as 0, decides
> that the destroy condition is not met yet, and goes back to sleep.
> Nothing wakes the thread again once the flag is finally stored, so the
> context stays on the global exist list forever and
> pvr2_context_global_done() blocks module unload. commit 0a0b79ea55de
> ("media: pvrusb2: fix uaf in pvr2_context_set_notify") made this
> liveness failure easier to hit by moving the notify earlier in the
> disconnect path.
> 
> The same teardown sequence still contains a use-after-free.
> pvr2_context_exit() inspects disconnect_flag after releasing mp->mutex
> and may then call pvr2_context_notify(mp) after the context thread has
> already freed the object via pvr2_context_destroy()/kfree(). The hdw
> completion callback registered through pvr2_hdw_initialize() can race
> the same way. Reordering the disconnect path alone closes the unload
> hang, but it still leaves late notifiers able to touch freed memory.
> 
> Fix both problems together:
> 
> - Split pvr2_context_set_notify() into a locked helper
>   (pvr2_context_set_notify_locked()) and a wrapper that acquires
>   pvr2_context_mutex. This lets callers update several pieces of
>   related state inside a single critical section without relocking.
> 
> - In pvr2_context_disconnect(), set disconnect_flag and enqueue the
>   thread notification under pvr2_context_mutex. The context thread
>   manipulates the notify list under the same mutex, so when it observes
>   the queued entry it is guaranteed to observe disconnect_flag = 1 as
>   well and the destroy condition evaluates correctly. This eliminates
>   the original notify-before-flag liveness hole.
> 
> - Add a per-context refcount_t. pvr2_context_create() initialises it to
>   1 (creator reference). pvr2_channel_init() and pvr2_channel_done()
>   take and drop a reference around each channel's lifetime.
>   pvr2_context_disconnect() takes a temporary reference across its body
>   so the context cannot be freed while disconnect is still touching it.
>   pvr2_context_destroy() no longer calls kfree() directly; it drops its
>   reference via pvr2_context_put(), and whichever caller drops the last
>   reference performs the actual kfree. This keeps the object alive
>   until disconnect and the final channel teardown finish, regardless of
>   how the context thread, channel close, and USB disconnect paths
>   interleave.
> 
> - Add a destroying_flag that pvr2_context_destroy() sets under
>   pvr2_context_mutex before unlinking the context from the notify and
>   exist lists. pvr2_context_set_notify_locked() refuses to re-enqueue a
>   context whose destroying_flag is set, so a late notifier arriving
>   after destroy has started cannot resurrect the context on the notify
>   list. The dequeue path (fl == 0) still proceeds unconditionally
>   because destroy itself must be able to remove any still-queued entry.
> 
> - Update pvr2_context_exit() to enqueue through
>   pvr2_context_set_notify_locked() after releasing mp->mutex. The
>   caller (channel close or disconnect) always holds a reference, so the
>   object is stable across the mp->mutex / pvr2_context_mutex hand-off
>   and a concurrent destroy cannot free it under us. If destroy has
>   already won the race, destroying_flag short-circuits the enqueue into
>   a no-op.
> 
> Lock ordering: pvr2_context_mutex is only acquired after mp->mutex is
> released; no path holds pvr2_context_mutex while acquiring mp->mutex,
> so no AB/BA deadlock is introduced. wake_up() on
> pvr2_context_sync_data is moved outside pvr2_context_mutex in every
> path that grew a new locked section, matching the existing style.

Huge commit log, weird patch. All the hallmarks of AI slop.

Rejected.

Regards,

	Hans

> 
> Fixes: 0a0b79ea55de ("media: pvrusb2: fix uaf in pvr2_context_set_notify")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sangyun Kim <sangyun.kim@snu.ac.kr>
> ---
>  drivers/media/usb/pvrusb2/pvrusb2-context.c | 56 ++++++++++++++++++---
>  drivers/media/usb/pvrusb2/pvrusb2-context.h |  3 ++
>  2 files changed, 51 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/usb/pvrusb2/pvrusb2-context.c b/drivers/media/usb/pvrusb2/pvrusb2-context.c
> index 93f5da65ead9..fb9bdbf5c886 100644
> --- a/drivers/media/usb/pvrusb2/pvrusb2-context.c
> +++ b/drivers/media/usb/pvrusb2/pvrusb2-context.c
> @@ -27,11 +27,19 @@ static int pvr2_context_cleaned_flag;
>  static struct task_struct *pvr2_context_thread_ptr;
>  
>  
> -static void pvr2_context_set_notify(struct pvr2_context *mp, int fl)
> +static void pvr2_context_put(struct pvr2_context *mp)
> +{
> +	if (refcount_dec_and_test(&mp->refcount))
> +		kfree(mp);
> +}
> +
> +static int pvr2_context_set_notify_locked(struct pvr2_context *mp, int fl)
>  {
>  	int signal_flag = 0;
> -	mutex_lock(&pvr2_context_mutex);
> +
>  	if (fl) {
> +		if (mp->destroying_flag)
> +			return 0;
>  		if (!mp->notify_flag) {
>  			signal_flag = (pvr2_context_notify_first == NULL);
>  			mp->notify_prev = pvr2_context_notify_last;
> @@ -59,6 +67,15 @@ static void pvr2_context_set_notify(struct pvr2_context *mp, int fl)
>  			}
>  		}
>  	}
> +	return signal_flag;
> +}
> +
> +static void pvr2_context_set_notify(struct pvr2_context *mp, int fl)
> +{
> +	int signal_flag = 0;
> +
> +	mutex_lock(&pvr2_context_mutex);
> +	signal_flag = pvr2_context_set_notify_locked(mp, fl);
>  	mutex_unlock(&pvr2_context_mutex);
>  	if (signal_flag) wake_up(&pvr2_context_sync_data);
>  }
> @@ -66,10 +83,13 @@ static void pvr2_context_set_notify(struct pvr2_context *mp, int fl)
>  
>  static void pvr2_context_destroy(struct pvr2_context *mp)
>  {
> +	int signal_flag = 0;
> +
>  	pvr2_trace(PVR2_TRACE_CTXT,"pvr2_context %p (destroy)",mp);
>  	pvr2_hdw_destroy(mp->hdw);
> -	pvr2_context_set_notify(mp, 0);
>  	mutex_lock(&pvr2_context_mutex);
> +	mp->destroying_flag = !0;
> +	pvr2_context_set_notify_locked(mp, 0);
>  	if (mp->exist_next) {
>  		mp->exist_next->exist_prev = mp->exist_prev;
>  	} else {
> @@ -83,10 +103,12 @@ static void pvr2_context_destroy(struct pvr2_context *mp)
>  	if (!pvr2_context_exist_first) {
>  		/* Trigger wakeup on control thread in case it is waiting
>  		   for an exit condition. */
> -		wake_up(&pvr2_context_sync_data);
> +		signal_flag = !0;
>  	}
>  	mutex_unlock(&pvr2_context_mutex);
> -	kfree(mp);
> +	if (signal_flag)
> +		wake_up(&pvr2_context_sync_data);
> +	pvr2_context_put(mp);
>  }
>  
>  
> @@ -209,6 +231,7 @@ struct pvr2_context *pvr2_context_create(
>  	pvr2_trace(PVR2_TRACE_CTXT,"pvr2_context %p (create)",mp);
>  	mp->setup_func = setup_func;
>  	mutex_init(&mp->mutex);
> +	refcount_set(&mp->refcount, 1);
>  	mutex_lock(&pvr2_context_mutex);
>  	mp->exist_prev = pvr2_context_exist_last;
>  	mp->exist_next = NULL;
> @@ -256,25 +279,41 @@ static void pvr2_context_enter(struct pvr2_context *mp)
>  static void pvr2_context_exit(struct pvr2_context *mp)
>  {
>  	int destroy_flag = 0;
> +	int signal_flag = 0;
>  	if (!(mp->mc_first || !mp->disconnect_flag)) {
>  		destroy_flag = !0;
>  	}
>  	mutex_unlock(&mp->mutex);
> -	if (destroy_flag) pvr2_context_notify(mp);
> +	if (destroy_flag) {
> +		mutex_lock(&pvr2_context_mutex);
> +		signal_flag = pvr2_context_set_notify_locked(mp, !0);
> +		mutex_unlock(&pvr2_context_mutex);
> +		if (signal_flag)
> +			wake_up(&pvr2_context_sync_data);
> +	}
>  }
>  
>  
>  void pvr2_context_disconnect(struct pvr2_context *mp)
>  {
> +	int signal_flag = 0;
> +
> +	refcount_inc(&mp->refcount);
>  	pvr2_hdw_disconnect(mp->hdw);
> -	if (!pvr2_context_shutok())
> -		pvr2_context_notify(mp);
> +	mutex_lock(&pvr2_context_mutex);
>  	mp->disconnect_flag = !0;
> +	if (!pvr2_context_shutok())
> +		signal_flag = pvr2_context_set_notify_locked(mp, !0);
> +	mutex_unlock(&pvr2_context_mutex);
> +	if (signal_flag)
> +		wake_up(&pvr2_context_sync_data);
> +	pvr2_context_put(mp);
>  }
>  
>  
>  void pvr2_channel_init(struct pvr2_channel *cp,struct pvr2_context *mp)
>  {
> +	refcount_inc(&mp->refcount);
>  	pvr2_context_enter(mp);
>  	cp->hdw = mp->hdw;
>  	cp->mc_head = mp;
> @@ -318,6 +357,7 @@ void pvr2_channel_done(struct pvr2_channel *cp)
>  	}
>  	cp->hdw = NULL;
>  	pvr2_context_exit(mp);
> +	pvr2_context_put(mp);
>  }
>  
>  
> diff --git a/drivers/media/usb/pvrusb2/pvrusb2-context.h b/drivers/media/usb/pvrusb2/pvrusb2-context.h
> index 5840b2ce8f1e..4e06530eccb8 100644
> --- a/drivers/media/usb/pvrusb2/pvrusb2-context.h
> +++ b/drivers/media/usb/pvrusb2/pvrusb2-context.h
> @@ -7,6 +7,7 @@
>  #define __PVRUSB2_CONTEXT_H
>  
>  #include <linux/mutex.h>
> +#include <linux/refcount.h>
>  #include <linux/usb.h>
>  #include <linux/workqueue.h>
>  
> @@ -33,9 +34,11 @@ struct pvr2_context {
>  	struct pvr2_hdw *hdw;
>  	struct pvr2_context_stream video_stream;
>  	struct mutex mutex;
> +	refcount_t refcount;
>  	int notify_flag;
>  	int initialized_flag;
>  	int disconnect_flag;
> +	int destroying_flag;
>  
>  	/* Called after pvr2_context initialization is complete */
>  	void (*setup_func)(struct pvr2_context *);


