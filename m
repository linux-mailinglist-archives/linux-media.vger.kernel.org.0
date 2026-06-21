Return-Path: <linux-media+bounces-65320-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NndBJXSDN2rYOQcAu9opvQ
	(envelope-from <linux-media+bounces-65320-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 21 Jun 2026 08:23:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1356AA4C0
	for <lists+linux-media@lfdr.de>; Sun, 21 Jun 2026 08:23:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=OEv39gUh;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65320-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65320-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B38130180BF
	for <lists+linux-media@lfdr.de>; Sun, 21 Jun 2026 06:23:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57B41259CB9;
	Sun, 21 Jun 2026 06:23:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09A019E97B;
	Sun, 21 Jun 2026 06:23:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782023010; cv=none; b=FWfnwyErEK0BFcx9mI5iVesO2pvsQ24/h9YpbFSZZZ6qxH/OFM7r5l7Zpp1WT7o5evV4beLlUJcZXFr4eKVkEwekkqEBOaAOYCFeSTCsl5Mffx6pqTKdO+V9CCcNUGOwo9KKW+yXEKvTZoKoFNFDLXGFrz/aC+pay8afTU728Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782023010; c=relaxed/simple;
	bh=dqbQaS8JHkfcainn8mFdBNAjyQZMNtAmIHyjHXZfdWw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VmbPdbsf8Q4egnroIE9uU1IM19UEEk688gsBBS1KGBKiUMmwRodwVxw1t0CTV6+qsYqzDd5ir16I1P7bjv8rDpJja9bAJDqZNzX2lZNUj6EyQLXvJeLGjBENBPOePnh1QzdR2368i/Fqc2xamr4uEkkUX2UM8uiyZXi7rdSXX68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OEv39gUh; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A878D1F000E9;
	Sun, 21 Jun 2026 06:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782023009;
	bh=66p2zsdJ3XAiW0tCluaw1wJ7aVs3hNtwp5VIJ4OwAEk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=OEv39gUh0wwTEaEudXpfa079k3vjv47w+cNAGbwGfNZPewqRIuVFKF4IbaAOj8WtP
	 1HS5gLjFF467uz41z9LiN1NsQcsDx774K9caVrDU/R+UtAClRQpg4YYAKA5VxLAI9r
	 Jwjj3LEK/I11x+Fq3cNYnRASH4BwU+eH3FB2uWOq3xqYzknsOkOn4qxy2cS7ZIZeJO
	 0hxLmYo9NfJz+ynUhfTwT2L8YBy18W+2KEnD5uur63uORyQfAlRGhL8pECbYEbG16N
	 psumJt7yfRFX2lPD6jh0X6C/0jMaW49NshMm71Ze4VetfZaKvMEyxlq3CDpzs4CGH0
	 wzDbY0BCUFRhA==
Message-ID: <dad6ba27-5fd1-4a52-ae0b-6e0db3a9d1eb@kernel.org>
Date: Sun, 21 Jun 2026 09:23:22 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/10] media: microchip-isc: disable histogram and flush
 AWB work on stop
To: Balakrishnan Sambath <balakrishnan.s@microchip.com>,
 Eugen Hristev <ehristev@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260616-balki-isc-prefix-fixes-v1-v1-0-b23677fc5ab6@microchip.com>
 <20260616-balki-isc-prefix-fixes-v1-v1-4-b23677fc5ab6@microchip.com>
Content-Language: en-US
From: Eugen Hristev <ehristev@kernel.org>
In-Reply-To: <20260616-balki-isc-prefix-fixes-v1-v1-4-b23677fc5ab6@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65320-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:balakrishnan.s@microchip.com,m:ehristev@kernel.org,m:mchehab@kernel.org,m:hverkuil@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[ehristev@kernel.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ehristev@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ED1356AA4C0

On 6/16/26 14:50, Balakrishnan Sambath wrote:
> isc_stop_streaming() masked the DMA done interrupt but left the
> histogram enabled, so a HISDONE that fired just before the stop could
> still queue isc_awb_work() after pm_runtime_put_sync() gated the clocks.
> isc_awb_work() reads the histogram registers in isc_hist_count() before
> taking its own PM reference, so the access faults on the suspended
> device.
> 
> Disable the histogram and flush the work before dropping the PM
> reference, mirroring the start_streaming error path.
> 

In here you reference some error path that you mirror, but you add it in
the next commit in which you say you mirror this exact commit :/
Circular mirroring of paths which initially did not exist.
I would squash this commit with the next one and show the facts as they
are : stop histogram and work queue in different stop/error scenarios,
no more mirroring.

Eugen

> Fixes: 91b4e487b0c6 ("media: microchip: add ISC driver as Microchip ISC")
> Cc: stable@vger.kernel.org
> Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
> ---
>  drivers/media/platform/microchip/microchip-isc-base.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/drivers/media/platform/microchip/microchip-isc-base.c
> index 3245dd7cb980..8f255a4c4e7a 100644
> --- a/drivers/media/platform/microchip/microchip-isc-base.c
> +++ b/drivers/media/platform/microchip/microchip-isc-base.c
> @@ -425,9 +425,13 @@ static void isc_stop_streaming(struct vb2_queue *vq)
>  	/* Disable DMA interrupt */
>  	regmap_write(isc->regmap, ISC_INTDIS, ISC_INT_DDONE);
>  
> +	isc_set_histogram(isc, false);
> +
>  	/* let a running IRQ handler finish before the clock is disabled */
>  	synchronize_irq(isc->irq);
>  
> +	cancel_work_sync(&isc->awb_work);
> +
>  	pm_runtime_put_sync(isc->dev);
>  
>  	/* Disable stream on the sub device */
> 


