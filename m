Return-Path: <linux-media+bounces-67342-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id t4PsLuwEUmpCLQMAu9opvQ
	(envelope-from <linux-media+bounces-67342-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 11 Jul 2026 10:55:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E65740F36
	for <lists+linux-media@lfdr.de>; Sat, 11 Jul 2026 10:55:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=LLIWSpAQ;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67342-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67342-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8B19730209F4
	for <lists+linux-media@lfdr.de>; Sat, 11 Jul 2026 08:54:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA6F638425D;
	Sat, 11 Jul 2026 08:54:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30CC376025;
	Sat, 11 Jul 2026 08:54:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783760094; cv=none; b=WeImNMr+qSri89K9+JjSIyxhtT3J+gucMYNJOGk1cj7MzsJPH9LdIzmuwc9ZdCMyEqvE2K97PYHjBQs4ouvEYAk6yKdIQXe+mN4TPJMjFMW4m+EBt6zZ7BW8Dfniu/Y71csSm/b2Zw4xeps8ZTgs4nezaHlbHjN8w/rgxF/m8Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783760094; c=relaxed/simple;
	bh=cX5aTS01jtO7YO5UrRU3P+VvfZgwSgg/bHZvl2pEuv8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ouPGmTv2OkDU/+7WBG4P2xPRveSLs/kJNagVxC0x5zYdWnNomKZ7DvDbpMqsyASKNul1OfRNWO9N5NcrABe1R/Otf0NpP8k5cDoH4CQvhUmz1VwlG1NpqDuEK2rlajUJf7QZUDHVABHw0NttWjtzFxXOUilTo/zhONhF1PDZVfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LLIWSpAQ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49D3A1F000E9;
	Sat, 11 Jul 2026 08:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783760092;
	bh=pe5Cxei5u92J5E0K6x3Pm26+rFU7OenKBJ6vpuESIuA=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=LLIWSpAQgdfdIvRIXfYo04Ast+ESTMKVFDOdDWKCLEQ8T7gaMZEn48eKfol4bwE61
	 T4jRXdpslPAzGjOthVkSqmZP9BoT4XSBk6d1tP6ikbSk9Eel/tOK0lRi8vcKJPVX2e
	 Mp5FZ1wdh/cueGMvEMyfK1CShkpefGPUPR+JEIAtyARi7cPoCIHknBpbzsYwVjFPwZ
	 n/gHoLXFyzCBXapaXVOmaDUmlXdPK6VgW9VU5lJ0gO1RZ/fg5nGGDd26i8Q7nmTFW4
	 6EZ90rmrt+bwi+NDkGGCiWWf7uapq+HK3fQeKUvBmx9ZB7WKVn2+wwJkWeSWfjY5/D
	 VjV4SStB0UANA==
Message-ID: <1cfd125b-7927-4a07-ade2-7520c938a69d@kernel.org>
Date: Sat, 11 Jul 2026 10:54:48 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH] media: vicodec: fix out-of-bounds write in FWHT encoder
To: Junrui Luo <moonafterrain@outlook.com>
Cc: Hans Verkuil <hverkuil@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Yuhao Jiang <danisjiang@gmail.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
References: <SYBPR01MB7881C44480F77338B6A93C61AF152@SYBPR01MB7881.ausprd01.prod.outlook.com>
 <7519968d-920e-455b-a27d-97a2f1d0615a@kernel.org>
 <E129DFAD-D5CC-45BC-BD87-0544A5A4C2C7@outlook.com>
Content-Language: en-US, nl
In-Reply-To: <E129DFAD-D5CC-45BC-BD87-0544A5A4C2C7@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-67342-lists,linux-media=lfdr.de,cisco];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[outlook.com];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:moonafterrain@outlook.com,m:hverkuil@kernel.org,m:mchehab@kernel.org,m:mchehab+samsung@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:danisjiang@gmail.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,samsung];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 12E65740F36

On 11/07/2026 08:29, Junrui Luo wrote:
> Hi Hans,
> 
> Thanks for the review.
> 
> On Fri, Jul 10, 2026 at 10:32:09AM +0200, Hans Verkuil wrote:
>> Actually, it's commit b40dc2bf3581 ("media: vicodec: add support for 4 new
>> RGB32 pixelformats") that introduced this.
>>
>> Please update the Fixes tag.
> 
> I traced this back a bit further. Commit 16ecf6dff97c ("media:
> vicodec: Add support for 4 planes formats") already added ARGB32 and
> ABGR32 as four-component formats. Would this be more appropriate?

Yes, you are right. That's when support for this was added.
Good catch.

> 
>>
>>> Reported-by: Yuhao Jiang <danisjiang@gmail.com>
>>
>> Where was that reported? Is there a URL to the that report?
> 
> It was reported to me privately by Yuhao, so there is no public URL.
> 
>>
>>> Cc: stable@vger.kernel.org
>>> Signed-off-by: Junrui Luo <moonafterrain@outlook.com>
>>> ---
>>>  drivers/media/test-drivers/vicodec/vicodec-core.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/media/test-drivers/vicodec/vicodec-core.c b/drivers/media/test-drivers/vicodec/vicodec-core.c
>>> index 318e8330f16a..3ff2d06742c2 100644
>>> --- a/drivers/media/test-drivers/vicodec/vicodec-core.c
>>> +++ b/drivers/media/test-drivers/vicodec/vicodec-core.c
>>> @@ -63,7 +63,7 @@ struct pixfmt_info {
>>>  };
>>>  
>>>  static const struct v4l2_fwht_pixfmt_info pixfmt_fwht = {
>>> -	V4L2_PIX_FMT_FWHT, 0, 3, 1, 1, 1, 1, 1, 0, 1
>>> +	V4L2_PIX_FMT_FWHT, 0, 4, 1, 1, 1, 1, 1, 0, 1
>>>  };
>>>  
>>>  static const struct v4l2_fwht_pixfmt_info pixfmt_stateless_fwht = {
>>
>> It should be changed here as well, otherwise the test-media regression script
>> in v4l-utils will fail.
> 
> I will update in v2.

Regards,

	Hans

