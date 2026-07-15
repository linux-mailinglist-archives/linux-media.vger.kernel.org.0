Return-Path: <linux-media+bounces-67674-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tgsTMLJ7V2pKPAEAu9opvQ
	(envelope-from <linux-media+bounces-67674-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 14:23:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 165E075E0C1
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 14:23:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="d/XhZDEL";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67674-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67674-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C86B3037146
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 12:18:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CB9D466B65;
	Wed, 15 Jul 2026 12:18:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306E144CF56
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 12:18:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784117919; cv=none; b=qeliCLUKXJAOFuA8sRxf8Co4GQTPJmszBgHPY/RvgxGo/hAJdvGAyEYaViaUMuG8fbPZQfWojjKSlwZSQOHSr9aweeQXBl07ZU76fs12kZGFQD2l+kI8pGyR3NNrswWNVtN1MscemZumPePbcy+b3e2DYdJh8QyCEsZGMWzp9/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784117919; c=relaxed/simple;
	bh=8SMxHniGvH3F9gapcJIJ7vD8e+g7j6h+jDPJdGl6vjA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=abFuIHV9E878d8wr9lT4KxpwNRELvMXDFkapN/pihcT7NcdnIRwLIRpQYcpBI5xDgj/nwqiZ9pEHBkRhJwLsCx2OH03q21b+RZoa92AbVYFM+nd0aQ0sDUvBzx/naJWEM2i5uRr4eCFaWHSQ8wLBsIMR5Siiy7IK56W1mp21Zfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d/XhZDEL; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0B2D1F000E9;
	Wed, 15 Jul 2026 12:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784117917;
	bh=9DzK/diYnT/8CUW1x7TmJ8bg+5OvqK4cwlz/d/t0rYA=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=d/XhZDELyEWZQK7LpzZqC/8TUUs0+/4E+2/+9xIfTrCN/1DM8zwqCGaaay/DMs2oP
	 J3F3oBBR/i7d6T5czX+3vbWO8tnTMoNXa2qfSSiDkIdDEAK7Vo2tFbD6E6Y7cBJiyf
	 QgHNRcTNbYdqnnrgDiuRlCPKmMCe/6BLZId7qMs7LZFJ5VC6P4FehxGfjOAJSJmQx8
	 bwQaIBX9NjYXKM9bmeD/tv5Upxxj7CgyhDVgf+RqHiHrL9cXVoHJXQyh431XfhMmh4
	 KGS0wXgKRSE/rFO65f6e3NUUiyJOZLOFMSnOyJWqhjrIR1GxZxFvdHcuFAecQCTPyD
	 FLAnHLaxxFR3Q==
Message-ID: <471e276f-7ab8-4e49-bf1f-ae0f6b504a90@kernel.org>
Date: Wed, 15 Jul 2026 14:18:35 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH] media: cx231xx: fix si2157 inversion for Hauppauge
 WinTV-HVR-935C
To: Brad Love <brad@nextdimension.cc>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 Dimitris Kerasiotis <dkerasiotis@gmail.com>
References: <20260709211918.958471-1-dkerasiotis@gmail.com>
Content-Language: en-US, nl
In-Reply-To: <20260709211918.958471-1-dkerasiotis@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67674-lists,linux-media=lfdr.de,cisco];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:brad@nextdimension.cc,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:dkerasiotis@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 165E075E0C1

Brad,

Can you review this patch? I'm not sure if this 'inversion = false' is valid for just
one specific model, or if it is valid for all 935C models.

I'm hoping you have some info about that, or are perhaps able to test this with a
935C.

Regards,

	Hans

On 09/07/2026 23:19, Dimitris Kerasiotis wrote:
> On the Hauppauge WinTV-HVR-935C (USB ID 2040:b151) the si2157 tuner
> is configured with inversion = true. On at least some hardware
> revisions (tested: Hauppauge model 111519, rev G2I6) this is wrong:
> tuner and demod probe successfully, firmware loads (si2157 patch
> 3.0.5, si2168 B 4.0.25), signal strength is reported correctly and
> the Si2168 briefly reports FE_HAS_SIGNAL | FE_HAS_CARRIER, but it
> never achieves lock on any DVB-T mux, on any frequency, regardless
> of signal quality (tested down to -48 dBm, C/N 38 dB). The same
> unit works under the vendor's Windows driver.
> 
> Setting inversion = false results in immediate lock (FE_HAS_LOCK,
> postBER 0) and a successful scan of all eight DVB-T muxes receivable
> in Attica, Greece. This matches the configuration already used for
> the Evromedia Full Hybrid Full HD, which uses the same
> cx231xx + si2168 + si2157 chip combination.
> 
> Tested on kernels 6.1 and 6.12 with identical results.
> 
> Signed-off-by: Dimitris Kerasiotis <dkerasiotis@gmail.com>
> ---
>  drivers/media/usb/cx231xx/cx231xx-dvb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/cx231xx/cx231xx-dvb.c b/drivers/media/usb/cx231xx/cx231xx-dvb.c
> index 472a4405a..a5486bcca 100644
> --- a/drivers/media/usb/cx231xx/cx231xx-dvb.c
> +++ b/drivers/media/usb/cx231xx/cx231xx-dvb.c
> @@ -1014,7 +1014,7 @@ static int dvb_init(struct cx231xx *dev)
>  		si2157_config.mdev = dev->media_dev;
>  #endif
>  		si2157_config.if_port = 1;
> -		si2157_config.inversion = true;
> +		si2157_config.inversion = false;
>  
>  		/* perform probe/init/attach */
>  		client = dvb_module_probe("si2157", NULL, tuner_i2c,


