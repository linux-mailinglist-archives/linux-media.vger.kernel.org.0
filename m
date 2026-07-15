Return-Path: <linux-media+bounces-67630-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hC20KHBBV2rIIAEAu9opvQ
	(envelope-from <linux-media+bounces-67630-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 10:14:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAC475BC6F
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 10:14:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="PwZEzPm/";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67630-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67630-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9B99E3014294
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 08:14:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C27AA3C5DB8;
	Wed, 15 Jul 2026 08:14:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D483C9880;
	Wed, 15 Jul 2026 08:14:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784103250; cv=none; b=gPJ7x4YWmA99p3okD5WOYLrpaWUzZKyHsx5IpgdFiJ5VBm/jIkpuVhMHirX7bjWuct2oV7CN6rh6uIajkMPYebDOrAdGLny8OQJrJA9W3y4E7yQmOkyKqvPxVJVfXWQL2mLifh+3k/TNmUYmf7MX3jNmnA0APHoCnPmqEVgnXt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784103250; c=relaxed/simple;
	bh=qQ/xVvLJGYrrm7Z0qUSCTnS7ZyFLoa4WxXZQTCPmQ7U=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=F+sCo6FNwD5ldIM1Okj9hsmQrVm/Zv7BiJu9l5QMNP/VOJ6uTRPEePmv0Mh5ZGJ1iiKQMBVvGHgmhCPrlXfV2YuVtftGuMi7xTGxtlVPSmVSn7htiFu37Ta/1x8Bkbh6QUhAa1jTiRFh5peI1KrBFkyTXkW12jWnn/DPT4eKjac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PwZEzPm/; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 268431F000E9;
	Wed, 15 Jul 2026 08:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784103248;
	bh=rMmHpW/WUR/bosNEJKxuvYuEM+okoRuwMkzlwbtjFlU=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=PwZEzPm/9U/BTRwZkwCz8QyeS/Pzz42AjXaA2ykrifnw7Z2FiZorbfFAxg5khWk7N
	 5GWIqv4y3MN8wGeyAaA7qCEQ68jjfNfdQDDS5w7rf75qwvuyL/DVXsTpaCdDPWZF20
	 Jpw7Hurcain+v28pDAjOeyXMobNnQqhIkpEyk9oeltJv3OuXoCWBYkOVzeVcTKg9Mm
	 Tz0RP+Pu7Y7xjW3NpqhS4dG76lK2uXinlUhMfWrmSycEop/8V7v5uDqcnyB3DOyynL
	 gpyzq9WmieVR36IaFAl8bMb3Bb4rzUsWoqnUIirwf24KyLg9ClgXrTonieLeiDQUzd
	 5YI9jvs84JG2g==
Message-ID: <4a9b9842-8d51-4ddc-9b24-b69440091345@kernel.org>
Date: Wed, 15 Jul 2026 10:14:05 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH] media: av7110: refactor deeply nested PTS loops
To: =?UTF-8?Q?Andr=C3=A9_Moreira?= <andrem.33333@gmail.com>,
 mchehab@kernel.org, gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260620054654.122464-1-andrem.33333@gmail.com>
Content-Language: en-US, nl
In-Reply-To: <20260620054654.122464-1-andrem.33333@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrem.33333@gmail.com,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:andrem33333@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linuxfoundation.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-67630-lists,linux-media=lfdr.de,cisco];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EFAC475BC6F

On 20/06/2026 07:46, André Moreira wrote:
> Extract the deeply nested loops handling PTS flags in the MPEG-1
> block into a separate helper function `av7110_ipack_m1_pts()`.
> 
> This fixes a checkpatch warning regarding too many leading tabs and
> improves code readability without changing the underlying parser logic.
> 
> Signed-off-by: André Moreira <andrem.33333@gmail.com>
> ---
>  drivers/staging/media/av7110/av7110_ipack.c | 35 +++++++++++----------
>  1 file changed, 18 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/staging/media/av7110/av7110_ipack.c b/drivers/staging/media/av7110/av7110_ipack.c
> index 4be6e225f08e8..a3e69a737e97d 100644
> --- a/drivers/staging/media/av7110/av7110_ipack.c
> +++ b/drivers/staging/media/av7110/av7110_ipack.c
> @@ -136,6 +136,22 @@ static void write_ipack(struct ipack *p, const u8 *data, int count)
>  	}
>  }
>  
> +static int av7110_ipack_m1_pts(struct ipack *p, const u8 *buf,
> +			       int c, int count, int max_which)
> +{
> +	while (c < count && p->which < max_which) {
> +		if (p->which < 7)
> +			p->pts[p->which - 2] = buf[c];
> +
> +		write_ipack(p, buf + c, 1);
> +		c++;
> +		p->found++;
> +		p->which++;
> +		p->hlength++;
> +	}
> +	return c;
> +}
> +
>  int av7110_ipack_instant_repack(const u8 *buf, int count, struct ipack *p)
>  {
>  	int l;
> @@ -335,26 +351,11 @@ int av7110_ipack_instant_repack(const u8 *buf, int count, struct ipack *p)
>  				return count;
>  			if (p->which > 2) {
>  				if ((p->flag2 & PTS_DTS_FLAGS) == PTS_ONLY) {
> -					while (c < count && p->which < 7) {
> -						p->pts[p->which - 2] = buf[c];
> -						write_ipack(p, buf + c, 1);
> -						c++;
> -						p->found++;
> -						p->which++;
> -						p->hlength++;
> -					}
> +					c = av7110_ipack_m1_pts(p, buf, c, count, 7);
>  					if (c == count)
>  						return count;
>  				} else if ((p->flag2 & PTS_DTS_FLAGS) == PTS_DTS) {
> -					while (c < count && p->which < 12) {
> -						if (p->which < 7)
> -							p->pts[p->which - 2] = buf[c];
> -						write_ipack(p, buf + c, 1);
> -						c++;
> -						p->found++;
> -						p->which++;
> -						p->hlength++;
> -					}
> +					c = av7110_ipack_m1_pts(p, buf, c, count, 12);
>  					if (c == count)
>  						return count;
>  				}

Hmm, I think I'll just keep the code as-is. Creating a separate function for this makes
the repack function actually harder to understand.

Regards,

	Hans

