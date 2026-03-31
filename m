Return-Path: <linux-media+bounces-57781-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCBpIsKny2nJJwYAu9opvQ
	(envelope-from <linux-media+bounces-57781-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 12:53:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 045B43685F8
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 12:53:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 86F5330D0627
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 10:45:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E46B03A5E9C;
	Tue, 31 Mar 2026 10:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="eYWVAXhz"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D891A6810;
	Tue, 31 Mar 2026 10:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774953951; cv=none; b=UR7eB+UylVXlGxfBrNkHWuj2yqtQCUIUFYBXqw0eHciq4XARQ7eMpq41p2NpcTNho79vj5WZmNoCLM636O5EvOs7YiahBl5MkDenGYjvlwddCeJGVRP1CZIDFKxiwl+6DLs6WxqQpoiq8V7O30be7SzHCXtLRgYf3WRMifyKJ+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774953951; c=relaxed/simple;
	bh=1h+KdxduMrLMImL6pHvaIcQziCTXT2flMBcvZXmsSvY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ctczqccRIpOefBh2pkMObhSyz02ElLUyOxRIpDQxVM8JnzX0EGCwdCQiRywCaNHr0qEgrFoarx2VpTP2H6X5vz77IkNyTMMNRtTkpWAKDj3ytPoYZO/hiU+YuNos0RrAG/GSZN+cP/wYTTGnG5WeFMy1jKJJVxA2E/dt/4JRtcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=eYWVAXhz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C789F10D4;
	Tue, 31 Mar 2026 12:44:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774953866;
	bh=1h+KdxduMrLMImL6pHvaIcQziCTXT2flMBcvZXmsSvY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eYWVAXhzE30TRopNotyLCPO8vgMxsuAFzqB84i7xq8qVLgUzTPOI4Dn1dke+G43Lx
	 E999iscwuGnLO9BoD99PB9ChZZCAswPuuhdKUn7V7T+D4HzqaJ9I03R5TB+o5SX7I1
	 bnBsvXZ50qFFpHc6oKSkq3PVjP97lSqrYIJ0awxI=
Message-ID: <4bd1ecdc-294b-4261-ae1f-1e8f1384bcd0@ideasonboard.com>
Date: Tue, 31 Mar 2026 11:45:45 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/15] media: rzg2l-cru: Remove debug printouts from
 irq
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: =?UTF-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260331-b4-cru-rework-v2-0-f94b238b35d4@ideasonboard.com>
 <20260331-b4-cru-rework-v2-14-f94b238b35d4@ideasonboard.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20260331-b4-cru-rework-v2-14-f94b238b35d4@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[protonmail.com,bp.renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-57781-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.scally@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas,cisco];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 045B43685F8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jacopo

On 31/03/2026 11:27, Jacopo Mondi wrote:
> Using dev_dbg() in irq handlers to debug per-frame events is marginally
> useful and possibly not the best idea, as using printk-based helpers
> introduce latencies that impact the drivers operations.
> 
> If any tracing/debugging has to be performed around frame events
> in interrupt handlers, the tracing subsystem offers better alternatives.
> 
> Drop dev_dgb() calls from the CRU interrupt handlers.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Yeah good idea:

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

> ---
>   drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 8 --------
>   1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 721057edca6b..e2073cc1afc6 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -627,9 +627,6 @@ irqreturn_t rzg2l_cru_irq(int irq, void *data)
>   		vb2_buffer_done(&cru->queue_buf[slot]->vb2_buf,
>   				VB2_BUF_STATE_DONE);
>   		cru->queue_buf[slot] = NULL;
> -	} else {
> -		/* Scratch buffer was used, dropping frame. */
> -		dev_dbg(cru->dev, "Dropping frame %u\n", cru->sequence);
>   	}
>   
>   	cru->sequence++;
> @@ -656,8 +653,6 @@ irqreturn_t rzg3e_cru_irq(int irq, void *data)
>   	slot = cru->active_slot;
>   	cru->active_slot = rzg2l_cru_slot_next(cru, cru->active_slot);
>   
> -	dev_dbg(cru->dev, "Current written slot: %d\n", slot);
> -
>   	/* Capture frame */
>   	if (cru->queue_buf[slot]) {
>   		struct vb2_v4l2_buffer *buf = cru->queue_buf[slot];
> @@ -667,9 +662,6 @@ irqreturn_t rzg3e_cru_irq(int irq, void *data)
>   		buf->vb2_buf.timestamp = ktime_get_ns();
>   		vb2_buffer_done(&buf->vb2_buf, VB2_BUF_STATE_DONE);
>   		cru->queue_buf[slot] = NULL;
> -	} else {
> -		/* Scratch buffer was used, dropping frame. */
> -		dev_dbg(cru->dev, "Dropping frame %u\n", cru->sequence);
>   	}
>   
>   	cru->sequence++;
> 


