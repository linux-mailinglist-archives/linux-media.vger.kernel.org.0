Return-Path: <linux-media+bounces-67672-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Bu20Ejh5V2pQOwEAu9opvQ
	(envelope-from <linux-media+bounces-67672-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 14:12:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 966DE75DF64
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 14:12:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=KrL4Nu0Z;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67672-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67672-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BDFE030E16B2
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 12:05:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F63844E038;
	Wed, 15 Jul 2026 12:05:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724D744683F;
	Wed, 15 Jul 2026 12:05:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784117134; cv=none; b=YcV1Fy9p1JlQtudzkTNSIaScNhgVk1seOI9lnsQ0Os2DxjQtpuXkRrX/uUCOMsXSFJpf0fUqgyA7O+T2/621aobgkLldxxDqri3uJjUx7G4f5i7SnCWL9JD/Ryxq62l5QnVhZaakjNSG1TMstyjgEZtlI5g6QEqGi4tumZZl5dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784117134; c=relaxed/simple;
	bh=/o9HHiIx25qtbVnRGNIjpvHThwdiY52KohOEBMTOyh4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=UxN/Q/8EsaFxeG5D01qibzYW8C/NawD81et/xjGxYYLs8BtzHnbEQnYchzG0LG69dFl0o4qlRce/AjXevyBsMk5urSu03N8BlDQS9nh2LLaqWRYe2dXyfS54BPUZFJ2QDI7ws2iErp4E/UbcgXTGdeFgnCi9YTda04O8Xw4n3Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KrL4Nu0Z; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54B821F000E9;
	Wed, 15 Jul 2026 12:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784117130;
	bh=BHXExEiZmLjwi+6XKjqKp6tsYaAW/OyGLT7X7SWVf7k=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=KrL4Nu0Z8NJsmASVxgM1QYil+oSkPN2zPHyFGGp/jw+gtmdVNC5NRjYEW1YABieP3
	 LC87TOerR+2VweSx78st931kOY4SM1zXUxJQNjzZDIWykzYSuyX4z2EEnbew/qPyu8
	 lFf8u0O9JSw4jBfEkgKNqLlGRf3DgwKJiDo9G6xL/7cEmbthYS6fL+/ngISHuPM12u
	 YPGLyzCI3xmAWTMdwZwq7oR1uyRbAtOCg8o6Bw2vR473YFOAp3PdW/tYoy9V88M2VS
	 WgLLawbIFGEdRLqtQrsUG2MRkB5nPvIic46nMztm3WIoDpklHIdM1cgZyuevdJ3c7t
	 dQ8bpPUSCU+8Q==
Message-ID: <e1d89b6f-3887-42cd-b303-629c197b1e09@kernel.org>
Date: Wed, 15 Jul 2026 14:05:27 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: hverkuil+cisco@kernel.org
Subject: Re: [PATCH v2 1/2] media: s2255: Rename CamelCase goto labels to
 snake_case
To: Johan Hovold <johan@kernel.org>, Lei Huang <huanglei814@163.com>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, Lei Huang <huanglei@kylinos.cn>
References: <20260715092947.772768-1-huanglei814@163.com>
 <aldaUlUq8bGDsJgT@hovoldconsulting.com>
Content-Language: en-US, nl
In-Reply-To: <aldaUlUq8bGDsJgT@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:johan@kernel.org,m:huanglei814@163.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:huanglei@kylinos.cn,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,163.com];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-67672-lists,linux-media=lfdr.de,cisco];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,kylinos.cn:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 966DE75DF64

On 15/07/2026 12:00, Johan Hovold wrote:
> On Wed, Jul 15, 2026 at 05:29:46PM +0800, Lei Huang wrote:
>> From: Lei Huang <huanglei@kylinos.cn>
>>
>> Rename the error-path goto labels in s2255_probe() from CamelCase to
>> snake_case to comply with the Linux kernel coding style:
>>
>>   errorBOARDINIT -> err_boardinit
>>   errorFWMARKER  -> err_fwmarker
>>   errorREQFW     -> err_reqfw
>>   errorFWDATA2   -> err_fwdata2
>>   errorFWURB     -> err_fwurb
>>   errorEP        -> err_ep
>>   errorUDEV      -> err_udev
>>   errorFWDATA1   -> err_fwdata1
>>
>> No functional changes; all label definitions and goto references are
>> updated consistently.
>>
>> Signed-off-by: Lei Huang <huanglei@kylinos.cn>
> 
> This looks ok, but the fix should go before the cleanup (e.g. to
> facilitate backporting).

I'll just take the v1 patch and Lei Huang can make a cleanup patch on
top of that. It is nice to get rid of the camelCase labels.

Regards,

	Hans

> 
> Also, always include a changelog (in a coverletter) when updating a
> series.
> 
> Johan
> 


