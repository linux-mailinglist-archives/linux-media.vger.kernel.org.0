Return-Path: <linux-media+bounces-53423-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oIBIHoVwn2kDcAQAu9opvQ
	(envelope-from <linux-media+bounces-53423-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 22:58:29 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E82CE19E112
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 22:58:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EFA8A304277E
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 21:58:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C0793191CA;
	Wed, 25 Feb 2026 21:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="PkOT8fQh"
X-Original-To: linux-media@vger.kernel.org
Received: from 013.lax.mailroute.net (013.lax.mailroute.net [199.89.1.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0212EFDA1
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 21:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772056702; cv=none; b=goxSLjNNdwE8c2vacsTQkDfDfzTmOfDUd8K16yvHchM8Ge/6HBh3d5sE/WW48m2E+bfmj8uUTAuqIJ3TBwkcT3mwTyuJ0MC4lFuVYwqLQX3riAma1SiIe1KBzG+clWJI2phle7ozJsoN/Cu2yHTcKxW3Nt4rzDJjuPti5czxf64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772056702; c=relaxed/simple;
	bh=eQgQNtj8QhtdHIEjtpYQDnLhl4B9Dv5k9b7H2F5InzA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pPn+Efa+ucMeLdAg72ej2sZXtwsTuuEK+K5uic76vvubEuOp0shubFr1u/qRvUwKqEyHVA0l4FsAermP9ymhy6PQW2VrT5MmGQ+dKG2HzsH1FscnFpWgWBty7K9o80zOWQmdDVgSAZn4PLSPeGSinEuJqcuIFg3e9fYNtO1S6us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=PkOT8fQh; arc=none smtp.client-ip=199.89.1.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4fLpPS5ncVzlfdfX;
	Wed, 25 Feb 2026 21:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1772056699; x=1774648700; bh=ZjAqWcEvjOomPt3NqF76uAm6
	ROWInG489yOCNcu3AVo=; b=PkOT8fQhz7ZnYoPQAXoYuawP8G2UUEtVr39tcgVO
	kW3ANmssnaeQMJk5NefcNcvfm4xW98pCrz6Z4A58EUeKji+f6lAJnJ5jbGFUV4I4
	II2TLFETtkbQrv2cIamkLTceC2aaDNnTCw4kVRVhEUx4zIbS1OSUkiL2EDZnWFTn
	u06lbXFgxvpRQDdvAyg8agEEb3NWpCtYF/DwOZcX2ED7dcteTKG1lqANA63PWeA7
	WC5FsWjCVdgp15Rus7WBteGtJLNSB47KZ/SNaYAMJ3xv5RydvCkKGHAy7z/x4uYJ
	ldVqyVkVaYStcPRQqf7Kkg4IO1But048Elmy0Wl8v37/IA==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id LMUzZlRL2isk; Wed, 25 Feb 2026 21:58:19 +0000 (UTC)
Received: from [172.20.2.156] (unknown [4.28.11.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4fLpPQ6YwZzlfl6N;
	Wed, 25 Feb 2026 21:58:18 +0000 (UTC)
Message-ID: <5846b79c-77aa-41b5-945b-7e3cff29d18a@acm.org>
Date: Wed, 25 Feb 2026 13:58:18 -0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/62] dma-buf: Convert dma_buf_import_sync_file() to the
 early-return style
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Peter Zijlstra <peterz@infradead.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
References: <20260223214950.2153735-1-bvanassche@acm.org>
 <20260223214950.2153735-6-bvanassche@acm.org>
 <1405f2c3-ffde-4084-b27c-8b54988415a6@amd.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <1405f2c3-ffde-4084-b27c-8b54988415a6@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[acm.org,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[acm.org:s=mr01];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53423-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[acm.org:+];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bvanassche@acm.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,acm.org:mid,acm.org:dkim]
X-Rspamd-Queue-Id: E82CE19E112
X-Rspamd-Action: no action

On 2/23/26 11:56 PM, Christian K=C3=B6nig wrote:
> On 2/23/26 22:48, Bart Van Assche wrote:
>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>> index 11711874a325..1666133ac8b8 100644
>> --- a/drivers/dma-buf/dma-buf.c
>> +++ b/drivers/dma-buf/dma-buf.c
>> @@ -523,11 +523,13 @@ static long dma_buf_import_sync_file(struct dma_=
buf *dmabuf,
>>                  dma_resv_lock(dmabuf->resv, NULL);
>>
>>                  ret =3D dma_resv_reserve_fences(dmabuf->resv, num_fen=
ces);
>> -               if (!ret) {
>> -                       dma_fence_unwrap_for_each(f, &iter, fence)
>> -                               dma_resv_add_fence(dmabuf->resv, f, us=
age);
>> -               }
>> +               if (ret)
>> +                       goto unlock;
>> +
>> +               dma_fence_unwrap_for_each(f, &iter, fence)
>> +                       dma_resv_add_fence(dmabuf->resv, f, usage);
>=20
> Mhm, I don't see what this is good for?
>=20
> While this might look a little bit nicer we don't enforce this coding s=
tyle and it adds more loc.

Hi Christian,

I will drop this change.

Thanks,

Bart.

