Return-Path: <linux-media+bounces-52394-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAyEAMjBiWmXBwUAu9opvQ
	(envelope-from <linux-media+bounces-52394-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 12:15:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 631AF10E920
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 12:15:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 794BB3013795
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 11:15:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECDAF366832;
	Mon,  9 Feb 2026 11:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BPKD5a/E"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB4F18A6DB
	for <linux-media@vger.kernel.org>; Mon,  9 Feb 2026 11:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770635713; cv=none; b=laJE4YEv1nIpRVyt7G+RLcwsmpuN1+uvmKDFMRn11aSxvbhBJWGGtrXsjLYMGS7P9hKJX7UYLb4DkEDliZws9LXhGx53vYZQAZDJ8Nu5pmC+pK46G5WSiUtq8ptbV8ql167kdh6S1LSCyn6tpbQVEhPoN53NKRz9GFYRg4j1EVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770635713; c=relaxed/simple;
	bh=aT3gyXBqLQJ3apGsEgF2LwgAjQd7NfpbRWkpF/T87wE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=YD9J39Qs+YjgJGJG6umpJFg0mZaclFyZCAasaSKpIgoZxkntrivOIfN1jAFOA28m0+8tpV+VH+C+q4evblPCc99vF6FW9CdlOIl8G1LGpa/O91VhB4+QN73UjTJGaN8V4eGIMqSC3CM7o3nw0jUy0oMeTrirj2W50nX9KsIX0O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BPKD5a/E; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 60902454;
	Mon,  9 Feb 2026 12:14:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770635665;
	bh=aT3gyXBqLQJ3apGsEgF2LwgAjQd7NfpbRWkpF/T87wE=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=BPKD5a/EbcXB5YBnjw0VXm0yLVnhsYMQ1OGf6lRv+l71sqCo0v7/5eq6iCKgvyOaz
	 gRSH6mrFmFSPVymEBUlEhnFOl1dVjrHo77DjnvFFa64yTVFnyo66R4LjyP80ftwbYr
	 x5aGVcwgvRtdSWfxECzpTSPiJkpCoTaW0nlV4d54=
Message-ID: <65d13ba9-2f08-487b-8915-a35ab00081ae@ideasonboard.com>
Date: Mon, 9 Feb 2026 11:15:08 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] media: rzv2h-ivc: Fix concurrent buffer list access
To: =?UTF-8?Q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze@ideasonboard.com>,
 linux-media@vger.kernel.org
References: <20260206180540.3195294-1-barnabas.pocze@ideasonboard.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20260206180540.3195294-1-barnabas.pocze@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52394-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.scally@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email,ideasonboard.com:dkim,ideasonboard.com:mid]
X-Rspamd-Queue-Id: 631AF10E920
X-Rspamd-Action: no action

Morning Barnabás - thanks for the fix

On 06/02/2026 18:05, Barnabás Pőcze wrote:
> The list of buffers (`rzv2h_ivc::buffers.queue`) is protected by a spinlock
> (`rzv2h_ivc::buffers.lock`). However, in `rzv2h_ivc_transfer_buffer()`,
> which runs in a separate workqueue, the `list_del()` call is executed
> without holding the spinlock, which makes it possible for the list to be
> concurrently modified.
> 
> Fix that by removing from the list in the lock protected section.
> 
> Fixes: f0b3984d821b ("media: platform: Add Renesas Input Video Control block driver")
> Signed-off-by: Barnabás Pőcze <barnabas.pocze@ideasonboard.com>
> ---

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

>   .../media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c   | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
> index 799453250b85..b714c32f72d6 100644
> --- a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
> +++ b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
> @@ -152,12 +152,11 @@ static void rzv2h_ivc_transfer_buffer(struct work_struct *work)
>   	scoped_guard(spinlock_irqsave, &ivc->buffers.lock) {
>   		buf = list_first_entry_or_null(&ivc->buffers.queue,
>   					       struct rzv2h_ivc_buf, queue);
> -	}
> -
> -	if (!buf)
> -		return;
> +		if (!buf)
> +			return;
>   
> -	list_del(&buf->queue);
> +		list_del(&buf->queue);
> +	}
>   
>   	ivc->buffers.curr = buf;
>   	buf->addr = vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);


