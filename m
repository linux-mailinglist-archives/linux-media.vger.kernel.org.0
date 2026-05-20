Return-Path: <linux-media+bounces-62204-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HvKAD1XDWpuwQUAu9opvQ
	(envelope-from <linux-media+bounces-62204-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 08:39:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 712BE588441
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 08:39:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BC173307BDBB
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 06:35:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E6FA31352D;
	Wed, 20 May 2026 06:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nWxCjECE"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF8824E4A1;
	Wed, 20 May 2026 06:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779258903; cv=none; b=UKFjBBwJNuNNIuYkf4Ga+heOyPOVu9luV3m0CHqFaBbX3kpOAsrO8XA2WH4Y9YOHpicPaMDDTdx1eREl//Y8WBon7nY++TgBR/NoDLf/qAhvYpKK//Kfwu0M0Tu7E0mo1mabNNsR8ZeRCE9wbmr6Ss777/qwM0H92C8GEbA9BvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779258903; c=relaxed/simple;
	bh=jcOCONsx+VdOxYvIZe50Fp6qk+W/qkJujqYeZn8aSko=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=FwWQSHVNXEZZxqdzAhBnhbUNSWpzG6nVB2LaxGURYUvY8enJrMYEMznn68iPway9Ehb94xlKQuTrnsWEiC+a5ICWsNuD0Q1jkGr14Kty1zSx3yxjGL2y6E1Xo8zB9YhSFz0gZkRBW3O/GCAKOBrCgOSg9jVT0i6B3j/v/IFlLoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nWxCjECE; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 799341F000E9;
	Wed, 20 May 2026 06:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779258901;
	bh=eCPYd6/O9YjWG81fw1PetIq8TV8ng3RBlo98avIypBM=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=nWxCjECESXqC8Ivso2LmY0ltMZcLDKE1zj6SpVDnbpAFFjV9sT3U9zOhzrNJFgZLw
	 IdgQyss4hxrnpLCmVGqdtEyw8yViBigzU0C9cUt/Qidc9TR7M7Tcjc1Y322L6wMoiV
	 BXaim1lE2GQMjgpolzHr2alp6oQ4LuM9kze5el82Bf0feVbGaQ3ilmw19+cwdwq3uP
	 6zsV4eeGzPwtiL11vD87MSK2LKoRGvXh1euA29Z107wpI+HOiiD2c0MrGXeckJFlCn
	 SgzfhmHNToQMAL9BsE8UeVBIVPbujc//HUZX+rp9gC0qVYrcUO4ZgIUQO5eZ+rA3ky
	 a/As8rFV14S/w==
Message-ID: <936ca84b-3c4f-4415-8389-7d065cf18feb@kernel.org>
Date: Wed, 20 May 2026 08:34:58 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH] media: rtl2832_sdr: release URBs and stream buffers on
 start_streaming() failure
To: Valery Borovsky <vebohr@gmail.com>, mchehab@kernel.org, crope@iki.fi,
 linux-media@vger.kernel.org
Cc: stable@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260513055733.146905-1-vebohr@gmail.com>
Content-Language: en-US, nl
In-Reply-To: <20260513055733.146905-1-vebohr@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-62204-lists,linux-media=lfdr.de,cisco];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,gitlab.freedesktop.org:url]
X-Rspamd-Queue-Id: 712BE588441
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 13/05/2026 07:57, Valery Borovsky wrote:
> rtl2832_sdr_start_streaming() calls rtl2832_sdr_alloc_stream_bufs(),
> rtl2832_sdr_alloc_urbs() and rtl2832_sdr_submit_urbs() in sequence and
> shares a single err: label that only unlocks the mutex and returns.
> When alloc_urbs() succeeds but submit_urbs() fails, or when alloc_urbs()
> itself returns -ENOMEM after alloc_stream_bufs() has already succeeded,
> the URBs and/or the coherent DMA stream buffers stay allocated while
> streaming reports failure to vb2. Two latent defects follow on the next
> VIDIOC_STREAMON:
> 
> 1) rtl2832_sdr_alloc_stream_bufs() unconditionally resets dev->buf_num
>    to 0 and overwrites dev->buf_list[]/dev->dma_addr[], permanently
>    leaking the coherent DMA memory allocated by the previous attempt.
> 
> 2) rtl2832_sdr_alloc_urbs() never resets dev->urbs_initialized and only
>    increments it. After a second successful pass urbs_initialized can
>    exceed MAX_BULK_BUFS, so the subsequent rtl2832_sdr_free_urbs() walks
>    from urbs_initialized - 1 down to 0 and reads past the end of
>    dev->urb_list[], passing garbage pointers to usb_free_urb().
> 
> Mirror the teardown that stop_streaming() already performs: on the error
> path call rtl2832_sdr_free_urbs() and rtl2832_sdr_free_stream_bufs()
> before unlocking. Both helpers are idempotent (free_urbs kills and zeros
> urbs_initialized; free_stream_bufs is gated on URB_BUF and clears the
> buf_num counter), so partial-failure paths and the no-allocation paths
> remain safe.
> 
> Issue identified by automated review of the INV-003 series at
> https://sashiko.dev/
> 
> Fixes: 771138920eaf ("[media] rtl2832_sdr: Realtek RTL2832 SDR driver module")
> Cc: stable@vger.kernel.org
> Signed-off-by: Valery Borovsky <vebohr@gmail.com>
> ---
>  drivers/media/dvb-frontends/rtl2832_sdr.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/media/dvb-frontends/rtl2832_sdr.c b/drivers/media/dvb-frontends/rtl2832_sdr.c
> index 422d1a7b5456..efcef1317cf9 100644
> --- a/drivers/media/dvb-frontends/rtl2832_sdr.c
> +++ b/drivers/media/dvb-frontends/rtl2832_sdr.c
> @@ -900,7 +900,13 @@ static int rtl2832_sdr_start_streaming(struct vb2_queue *vq, unsigned int count)
>  	if (ret)
>  		goto err;
>  
> +	mutex_unlock(&dev->v4l2_lock);
> +
> +	return 0;
> +
>  err:
> +	rtl2832_sdr_free_urbs(dev);
> +	rtl2832_sdr_free_stream_bufs(dev);
>  	mutex_unlock(&dev->v4l2_lock);
>  
>  	return ret;

This patch no longer applies to the next branch of
https://gitlab.freedesktop.org/linux-media/media-committers/

Please rebase and repost.

Regards,

	Hans

