Return-Path: <linux-media+bounces-66134-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kGxDKrEHRGoNngoAu9opvQ
	(envelope-from <linux-media+bounces-66134-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 20:15:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCCE6E7234
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 20:15:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b="Vo8dwj/J";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66134-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66134-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 502D730425A7
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 18:14:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E110E3E075C;
	Tue, 30 Jun 2026 18:14:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062C7344D85
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 18:14:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782843244; cv=none; b=sWoUVU2zoJ6GSys1RK4bJOpHOGlJjgjK8TqboOPAFQpgr/+Ruw7I/bhp+BKuQGvuZCWmXvOVAvrNbtrjnlURww0o4qiG34aGr587X9Y+7TBKg3JTp9xGdFwg9F6uuh4BhSOR6+6t8Zk9SUGwwDCyjGkrjgXBd3J8o5pIxbcl2aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782843244; c=relaxed/simple;
	bh=oqaSnnXYZjSIYsGOsnZ5ExcS1FQ6XlZbscZyq8fVyfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sDjYJoLvK8Aw2HRWc7Ukwv6+eerOovHcbgcp1YyAeEu5yrr5rdSF1EJ/679qfyGGW/0+ZOcMHBBuG1bduDPtHhzymMyYh8mcxf4cDkmClkY03ma07e09JB6b4yNYH+xXOvH90VjT+RYAnlfyJEelmzYM/iGA6NQ8RYqIGyj+7mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Vo8dwj/J; arc=none smtp.client-ip=91.218.175.172
Date: Tue, 30 Jun 2026 20:13:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782843231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v5AZdLeo3uI0i+gBOxkvCjAN56VCiTSwOQL2+ob71TQ=;
	b=Vo8dwj/JOu5hhPzOjkfgTellBxOoSmDT59R5ScsLPX1SHaWQLyqh2ZwC2Ujh2V2nxoTZv5
	yw3zOJ8Z/B8yRJzRQAv2Bdj1r7Uk6OpPKyLoTCvTB8g2QJ8xSEGf4FEW2jaCNFBaDDLHfO
	fw+uoi96CONzIr9mGUyW5/m/jHUi+pY=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] media: i2c: isl7998x: inline
 i2c_check_functionality check
Message-ID: <akQHVh9EaQbY6SU9@linux.dev>
References: <20260602223441.1087427-3-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602223441.1087427-3-thorsten.blum@linux.dev>
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:m.tretter@pengutronix.de,m:kernel@pengutronix.de,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[thorsten.blum@linux.dev,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-66134-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thorsten.blum@linux.dev,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linux.dev:dkim,linux.dev:email,linux.dev:mid,linux.dev:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,pengutronix.de:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ECCCE6E7234

Gentle ping?

On Wed, Jun 03, 2026 at 12:34:43AM +0200, Thorsten Blum wrote:
> Inline the i2c_check_functionality() check, since the function returns a
> boolean status rather than an error code.
> 
> Reviewed-by: Michael Tretter <m.tretter@pengutronix.de>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  drivers/media/i2c/isl7998x.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/isl7998x.c b/drivers/media/i2c/isl7998x.c
> index a77538d2343c..8244d4296a02 100644
> --- a/drivers/media/i2c/isl7998x.c
> +++ b/drivers/media/i2c/isl7998x.c
> @@ -1460,8 +1460,7 @@ static int isl7998x_probe(struct i2c_client *client)
>  	int nr_inputs;
>  	int ret;
>  
> -	ret = i2c_check_functionality(adapter, I2C_FUNC_SMBUS_WORD_DATA);
> -	if (!ret) {
> +	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_WORD_DATA)) {
>  		dev_warn(&adapter->dev,
>  			 "I2C-Adapter doesn't support I2C_FUNC_SMBUS_WORD\n");
>  		return -EIO;

