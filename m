Return-Path: <linux-media+bounces-63567-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QbItCjT5H2rjtQAAu9opvQ
	(envelope-from <linux-media+bounces-63567-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 11:51:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB40636517
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 11:51:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=zohomail header.b=M8bQZJTI;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63567-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63567-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=collabora.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8B6D2306B53F
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 09:51:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64D5B44102E;
	Wed,  3 Jun 2026 09:50:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A090E43E9E0;
	Wed,  3 Jun 2026 09:50:56 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780480257; cv=pass; b=Kf7zM74Mm/vTLWWr+JNwc2MxyPM/ts0Hc4iSq85RGDelMO7arcFltYFBK5ZBhVwrfiy7WAmSCtR8/0azVHFFFz/gEMG2jrTbtGi1CxCA1DCk0F+HfK3SXubrLsE7Yd8qCYCjXVMw6hMbA0LHEsktU95Yd0pWm4QBpT1HufJL3EE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780480257; c=relaxed/simple;
	bh=w4AfDoXiv9VdMXpFeKEIxZ0QyIhQvU0SD7NS0ngOMK4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GubxlKWpvssZ+VlhsFpcSuhceanvztgFddUESyxtBozEjPnauvsq0vFG4m1bDEsehCvkf8u1frx2Zdaz3s+M5zTCdVJz5jNU+bu+AtV2jF/SgwIEd/494Sun5BA1JaCcu3TtGDZpDj6eAKfsxhCemlUwFFjvOOf99XBjkk+bX3w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=michael.riesch@collabora.com header.b=M8bQZJTI; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal: i=1; a=rsa-sha256; t=1780480236; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MA70eK+bFGLjjVj+v3J16+vPsqLFjqfRRq7mvnEIWOvMlkieD5d9mLtry1r5V+9nJf2yFmyzIDTXD0HgG4Y8QTZaSj5ARaY3vbpOqw1JDj/x76uSHCtRlwC7MRsf+SIogXl17sWcGJIJjgqm7FiR4qUb17sa2uobOf0aWeaV8iQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1780480236; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=oyAmqc74tPeSqmdOneDeQhCxyrBsJsodvaoN1wzTpP0=; 
	b=B4/PTzPW//F7DZ1zrNRhqvzwlB4lAH++tCSKPcmsx0G4SB7KFMxca6kvt3bT1L3fioj1+dDDBjA4ft5ruMwtxgj63ssSjQ+4nrgBFbbMIFx5PvKEExGF6Hc4yKPhoporIodJyPmBa5sRG+way0t+MGWUG2zbxu5/AQRpT9jNlds=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1780480236;
	s=zohomail; d=collabora.com; i=michael.riesch@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=oyAmqc74tPeSqmdOneDeQhCxyrBsJsodvaoN1wzTpP0=;
	b=M8bQZJTIvUTA95lVuo8E4jz5bFadZ5tELZLhHVsPRc8PsAn9uQzw4jyx2/H11jCv
	JAKmCpYK3v0h5nzSpzLaob8pg5aAvYAUoWZwqZsCzW2Ruk/Frv4nsamb+aS124SB0sR
	IVEVk9Yyv4F3/NVXtTBWtqalgajlkNjnAzumY6Bg=
Received: by mx.zohomail.com with SMTPS id 1780480234850793.9722590953027;
	Wed, 3 Jun 2026 02:50:34 -0700 (PDT)
Message-ID: <a80c978f-65e8-436e-a3d6-74cf50b5ea6a@collabora.com>
Date: Wed, 3 Jun 2026 11:50:31 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: rockchip: rkcif: Fix error handling for
 media_entity_remote_source_pad_unique()
To: Chen Ni <nichen@iscas.ac.cn>, mehdi.djait@linux.intel.com
Cc: mchehab@kernel.org, heiko@sntech.de, hverkuil+cisco@kernel.org,
 gerald.loacker@wolfvision.net, bryan.odonoghue@linaro.org,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260522065548.2438545-1-nichen@iscas.ac.cn>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260522065548.2438545-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63567-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[michael.riesch@collabora.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:nichen@iscas.ac.cn,m:mehdi.djait@linux.intel.com,m:mchehab@kernel.org,m:heiko@sntech.de,m:hverkuil+cisco@kernel.org,m:gerald.loacker@wolfvision.net,m:bryan.odonoghue@linaro.org,m:linux-media@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.riesch@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,iscas.ac.cn:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8EB40636517

Hi Chen,

Thanks for the fix!

On 5/22/26 08:55, Chen Ni wrote:
> The media_entity_remote_source_pad_unique() function returns an error
> pointer on failure, not NULL. Fix the check to use IS_ERR() and return
> PTR_ERR() to correctly handle allocation failures.
> 
> Fixes: 501802e2ad51 ("media: rockchip: rkcif: add abstraction for dma blocks")
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>

Best regards,
Michael

> ---
>  drivers/media/platform/rockchip/rkcif/rkcif-stream.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> index 3130d420ad55..542aa877919d 100644
> --- a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> @@ -466,7 +466,7 @@ static int rkcif_stream_link_validate(struct media_link *link)
>  	struct rkcif_stream *stream = to_rkcif_stream(vdev);
>  	int ret = -EINVAL;
>  
> -	if (!media_entity_remote_source_pad_unique(link->sink->entity))
> +	if (IS_ERR(media_entity_remote_source_pad_unique(link->sink->entity)))
>  		return -ENOTCONN;
>  
>  	sd = media_entity_to_v4l2_subdev(link->source->entity);


