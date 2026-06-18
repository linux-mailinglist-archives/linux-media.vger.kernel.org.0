Return-Path: <linux-media+bounces-65180-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rZoEHIzTM2quGwYAu9opvQ
	(envelope-from <linux-media+bounces-65180-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 13:16:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC9D69FB0E
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 13:16:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=gnS++W1r;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65180-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-65180-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A42223012552
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 11:16:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B5A63DC84E;
	Thu, 18 Jun 2026 11:16:26 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B3C35B631
	for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 11:16:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781781386; cv=none; b=QRBWgVwf9rT4z5C19WSwH8j4vsmd8rZNesovE8EOAXvjG4OC8Orn/aiCFzghGchxb/gi50LB/uFcXgs6ja9ip6Fc8kybFzy0HVni5pdMeOQ1ScecaDLtRthEM6lcC1sRRWokOqmawH0dscfTlSKaLnD1gD9NeS+c1m9v5i7sXTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781781386; c=relaxed/simple;
	bh=UfN/y2NwLDXPmTnfDWAijYsQrldHraFSPZea2WCNPZs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=gbuSVTEWTwMEk4EHg+c2DtQ5v+Nfwku3wsO7npvli29la1CpotrtzK8f2q4aX+hCrcOlg2XsgWMjS7S3YaUAR6cZsSndWTzV3UtiSEfjO8SzNo7Ja1hlXMhi0eQ8GFJTi1rSuYrIuGYitipyTDGe/AdVvmS2JEg968AqrG1VEYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gnS++W1r; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68F401F000E9
	for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 11:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781781384;
	bh=zSZvNm25lhspEyMw9WznSY/E4ESTtRy9EHF5T2WNyyo=;
	h=Date:From:Subject:To:References:In-Reply-To;
	b=gnS++W1rrDdDXzhcf/ircDZDY0fzUII/U7Rm3jgFLQwSen3TFg7ICCGzUe3Wii0YE
	 BQGD2bKAol6Tom1xc+HQmiAOwnVxcc7lsUGa8eRt/8HOFaTEIsdrGW7e0xOwBr+ynN
	 w8AzMBVzpYoCQe0ab1OO5d5+RBXEv0dlI67iogva00utb1Je7txEDaKeKepuouG95I
	 nHn4nlITGpGcKh2YI7qygni0wPR2Kj7Vis/DZHZDBXo75gSIF6dEmy9nSUtZ0X5n52
	 g/kwvPiK0la9OaCg1/XQlHXPiViJYYmTyr/9Y805HDFZBwJLmWKySJ9CDHL/fcX7TS
	 0pV3J0OM8HjzA==
Message-ID: <186b19c9-e9f0-42e1-8c40-c594022acd5a@kernel.org>
Date: Thu, 18 Jun 2026 13:16:22 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH] media: cec: extron-da-hd-4k-plus: add sanity check
To: Linux Media Mailing List <linux-media@vger.kernel.org>
References: <362ab4a1-6591-4715-ad1e-956a65ec322c@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <362ab4a1-6591-4715-ad1e-956a65ec322c@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_ONE(0.00)[1];
	TAGGED_FROM(0.00)[bounces-65180-lists,linux-media=lfdr.de,cisco];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2FC9D69FB0E

On 18/06/2026 13:03, Hans Verkuil wrote:
> Add check to prevent overflowing msg.msg[] in case the incoming data
> is malformed.
> 
> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>

Fixes: 056f2821b631 ("media: cec: extron-da-hd-4k-plus: add the Extron DA HD 4K Plus CEC driver")
Cc: stable@vger.kernel.org

Regards,

	Hans

> ---
> diff --git a/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c b/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
> index 3381d86096a1..3c6ce6f3d93e 100644
> --- a/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
> +++ b/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
> @@ -657,7 +657,8 @@ static void extron_process_received(struct extron_port *port, const char *data)
>  	if (!port || port->disconnected)
>  		return;
> 
> -	if (len < 5 || (len - 2) % 3 || data[len - 2] != '*')
> +	if (len < 5 || ((len - 2) / 3 > sizeof(msg.msg)) ||
> +	    (len - 2) % 3 || data[len - 2] != '*')
>  		goto malformed;
> 
>  	while (*data != '*') {
> 


