Return-Path: <linux-media+bounces-64377-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0E7zBBcZKWpaQgMAu9opvQ
	(envelope-from <linux-media+bounces-64377-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 09:58:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5512E666D80
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 09:58:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=ju3ZIN9H;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64377-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64377-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D6FF73144530
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 07:52:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6C09392C5A;
	Wed, 10 Jun 2026 07:52:39 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9429372670
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 07:52:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781077959; cv=none; b=mwvmaChK3WHuHqMRuo3mkITJVHOL6y2nx0eE4Xf/W/KV/s4VqIo2StI0nmehkcCoiU4VXyk1ng8ED4AIbR/NKd0HYl3ph2UBH2mclLopuoP5VOlN4SPUSXlzTfCVBzLjmDTojOByXOi6XNWNHa9qy9RFaNnhFPw7M1jOIxBtyKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781077959; c=relaxed/simple;
	bh=ap/Ryu+KjLToKs8iSceXNGYcif+i9DLU8OoiyrgjXCI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sxOD9y61RvNPjnXzMlmrhMWekzjj8814yJ7IWleutumDKTKIS0vh0YmlNWzd2EhKpArlu5ZVflamxDo8c4VdNVOAs/nJ+/fPav1tfsXiGGNxaKoqDao/9LyJsi9u0COz2AgySbSs0trQD0Gh3ry1lrzmB/TKIk1eUwV9DmC/czA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ju3ZIN9H; arc=none smtp.client-ip=213.167.242.64
Received: from [192.168.0.43] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6D39D1E6;
	Wed, 10 Jun 2026 09:52:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781077927;
	bh=ap/Ryu+KjLToKs8iSceXNGYcif+i9DLU8OoiyrgjXCI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ju3ZIN9HrItP9Kl1CyvOln7x+ohuy1GjTLUQ4dcmTJHY6mf3cDZn2shLntLzBeluQ
	 kpGExuag0+9XWTSXOWNGSn7i6noIewJ4kQOgQoCc6tctHxf1Ja6C8PwDtzav0+/sQk
	 gj2QdDpRW074/poTurdoZDiCS88tuYPlg/BTFiJE=
Message-ID: <6a599060-0e44-45d1-8387-30d355233ee3@ideasonboard.com>
Date: Wed, 10 Jun 2026 08:52:33 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: i2c: ov8865: Drop PM runtime reference if
 stream start fails
To: Jurison Murati <eng.juri@gmail.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
References: <20260609232255.13559-1-eng.juri@gmail.com>
 <20260609232255.13559-2-eng.juri@gmail.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20260609232255.13559-2-eng.juri@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64377-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:eng.juri@gmail.com,m:sakari.ailus@linux.intel.com,m:hansg@kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:engjuri@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com];
	FORGED_SENDER(0.00)[dan.scally@ideasonboard.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.scally@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5512E666D80

Hi Jurison

On 10/06/2026 00:22, Jurison Murati wrote:
> ov8865_s_stream() takes a runtime PM reference when enabling the
> stream, but returns without releasing it if ov8865_sw_standby()
> fails, leaving the reference unbalanced and the sensor powered
> indefinitely.
> 
> Signed-off-by: Jurison Murati <eng.juri@gmail.com>
> ---

Good spot, thanks:

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

> --- a/drivers/media/i2c/ov8865.c
> +++ b/drivers/media/i2c/ov8865.c
> @@ -2647,8 +2647,11 @@
>   	ret = ov8865_sw_standby(sensor, !enable);
>   	mutex_unlock(&sensor->mutex);
>   
> -	if (ret)
> +	if (ret) {
> +		if (enable)
> +			pm_runtime_put(sensor->dev);
>   		return ret;
> +	}
>   
>   	state->streaming = !!enable;
>   


