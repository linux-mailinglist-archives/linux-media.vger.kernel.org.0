Return-Path: <linux-media+bounces-62203-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIQCLvZTDWr9wAUAu9opvQ
	(envelope-from <linux-media+bounces-62203-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 08:25:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3970A5881F2
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 08:25:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5C0873010BB2
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 06:25:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B25D7374737;
	Wed, 20 May 2026 06:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PRI+GIPo"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D76027CB02;
	Wed, 20 May 2026 06:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779258336; cv=none; b=D0WQAeXveLO4A2rwUANkP26wwgssI9vwdWBVy6IjV6FPedlAd85etm562if2cK6W12rwNC0f7dsf7AJjj/TYH5WE1nxdg8JtIgr88fPY8/lcO7TEpn5/AOpWOz7PtfGRzy5Eltd1X/v6ksG7yhc7d88V/ZKv2Muf4TCEQ8ILd0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779258336; c=relaxed/simple;
	bh=fl5GvyBknC8NjQZKIqVSX1M5iySNft/etucU1YnztVw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Fokf6Tr+aMVqNUa7RDWuU9A2R4w1LQK0cx0BSH910kJjWDsuSAD+rCruaa7azX+ZlbBPBB5nYAXCJh/wd/T7GTsirkHYbzzcNOAPX1qBuNHWYJOcHgQdQNbrrFAHOkggewLX04NMxnVjVnf8caNVYOJAB1CeySoCPwGb/tg/Bus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PRI+GIPo; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A09F01F000E9;
	Wed, 20 May 2026 06:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779258334;
	bh=/1uAQpAEAqN7Pf61eEDXBzLLkXXbY78D1+3lOWxzSsY=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=PRI+GIPo+U/bqfsV6FVMJbC7aq+bukz1nEJonR6JIH+nmxOX6e3ukmPiVN82+28qe
	 ViBnLViBGu8zpwwvQW/ghv2vM5a+R8jKImYznvQag10fHsiBns4MJdiU6etCJK9lQz
	 9NJE6GPrGHqdleBN8Cjv+UXZkzfE/KFJ79KKeuUrDGs2EIFEbMWKL6j2uvubu05o1V
	 EEOaxNYwqHtp/8Be9oib06KVY7IR6pSz61q/M615j996PgVwq8SzYI4HaJp+CB+zBg
	 2kYGjOStqicGS8hCKe2IYx7OhPYiOH2RSYP8Zfrfq4Xbchz2MYSKJzOBCuiOQc+WHf
	 c5ictepNP6dFA==
Message-ID: <3c427dde-54c5-4a63-bcab-dd0079593ba1@kernel.org>
Date: Wed, 20 May 2026 08:25:31 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH] media: rtl2832_sdr: free DMA stream buffers before
 clearing udev on remove
To: Valery Borovsky <vebohr@gmail.com>, mchehab@kernel.org, crope@iki.fi,
 linux-media@vger.kernel.org
Cc: stable@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260513055745.146998-1-vebohr@gmail.com>
Content-Language: en-US, nl
In-Reply-To: <20260513055745.146998-1-vebohr@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,iki.fi,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62203-lists,linux-media=lfdr.de,cisco];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 3970A5881F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 13/05/2026 07:57, Valery Borovsky wrote:
> rtl2832_sdr_remove() runs on USB disconnect and immediately clears
> dev->udev to NULL before any pending streaming teardown can run. When
> the user-space application later closes its file descriptor, vb2 calls
> rtl2832_sdr_stop_streaming() which in turn calls
> rtl2832_sdr_free_stream_bufs(). That helper releases each coherent
> buffer with:
> 
>     usb_free_coherent(dev->udev, dev->buf_size,
>                       dev->buf_list[dev->buf_num],
>                       dev->dma_addr[dev->buf_num]);
> 
> usb_free_coherent() returns immediately when its dev argument is NULL,
> so every DMA stream buffer that was live at disconnect is silently
> leaked. The URBs allocated in rtl2832_sdr_alloc_urbs() outlive the
> device for the same reason.
> 
> Tear down the streaming state in rtl2832_sdr_remove() while dev->udev
> is still valid: call rtl2832_sdr_kill_urbs(), rtl2832_sdr_free_urbs()
> and rtl2832_sdr_free_stream_bufs() before zeroing dev->udev. The
> helpers are idempotent (they clear urbs_submitted, urbs_initialized
> and the URB_BUF flag), so the subsequent stop_streaming() path from
> the vb2 release sequence becomes a safe no-op.
> 
> Issue identified by automated review of the INV-003 series at
> https://sashiko.dev/
> 
> Fixes: 771138920eaf ("[media] rtl2832_sdr: Realtek RTL2832 SDR driver module")
> Cc: stable@vger.kernel.org
> Signed-off-by: Valery Borovsky <vebohr@gmail.com>
> ---
>  drivers/media/dvb-frontends/rtl2832_sdr.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/media/dvb-frontends/rtl2832_sdr.c b/drivers/media/dvb-frontends/rtl2832_sdr.c
> index 422d1a7b5456..817d91faa598 100644
> --- a/drivers/media/dvb-frontends/rtl2832_sdr.c
> +++ b/drivers/media/dvb-frontends/rtl2832_sdr.c
> @@ -1470,6 +1470,14 @@ static void rtl2832_sdr_remove(struct platform_device *pdev)
>  
>  	mutex_lock(&dev->vb_queue_lock);
>  	mutex_lock(&dev->v4l2_lock);
> +	/*
> +	 * Release URBs and coherent DMA stream buffers while dev->udev
> +	 * is still valid; once it is cleared, usb_free_coherent() silently
> +	 * returns and any later stop_streaming() leaks the DMA memory.
> +	 */
> +	rtl2832_sdr_kill_urbs(dev);
> +	rtl2832_sdr_free_urbs(dev);
> +	rtl2832_sdr_free_stream_bufs(dev);
>  	/* No need to keep the urbs around after disconnection */
>  	dev->udev = NULL;
>  	v4l2_device_disconnect(&dev->v4l2_dev);

This isn't the right solution.

What needs to happen is that the video_unregister_device(&dev->vdev);
calls is replaced by vb2_video_unregister_device(&dev->vdev); and that
that line is moved up to before dev->udev = NULL.

vb2_video_unregister_device ensures that all streaming stops at once,
so it calls stop_streaming which will free all streaming resources.

You were on the right track, but it's not quite the right solution.

Regards,

	Hans

