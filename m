Return-Path: <linux-media+bounces-56061-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAjdJwBKuWnG/QEAu9opvQ
	(envelope-from <linux-media+bounces-56061-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 13:33:04 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACA12A9F02
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 13:33:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A5852309F1FE
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 12:29:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD7FA3C3440;
	Tue, 17 Mar 2026 12:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qzfw1JFW"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D553C1990
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 12:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773750555; cv=none; b=ja/R25gO1aFxFRSHiuP8Rb99CN5/qAmL0c71VgO75Syshc4EQTZSD4Bk7Nu8ElkLIWVfOAUZaexBRGvzH1PhfH4Qj+YkC3BkAdis6+EIzOkpopMNUbvXNjVukv96F3vf6TIwk7CpI2yZ1i9ZItzQzj73ujPHM5Zjj/b1ERqp0r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773750555; c=relaxed/simple;
	bh=AR+0PGvrJmCpXv2YCKNNfMx4EEveklFrjjKqAQ1N6cw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=MGquEJoFmTTnx/F7N0sVLBl1iYuEvzLrS3PjTdongVZ3v/AEdXL6QzAGEEeUJD6I09GEwV/stDUAuqJN4jZXYbzDqI7YfaaF/fX5i5w8Q791h+h89KFLqXywBvRrk6TPWsXSGBRyHpjHXG2jTLxMSBKZ6CE6ialQ3Q2l0SiUX48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qzfw1JFW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10B95C4CEF7;
	Tue, 17 Mar 2026 12:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773750554;
	bh=AR+0PGvrJmCpXv2YCKNNfMx4EEveklFrjjKqAQ1N6cw=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=Qzfw1JFW2I31+kjsZ0QQ2ZJyxprQq2YqnmTbVAhRv7Try36NPRGCTHUaWeCRfkoaJ
	 3MBiAFwWfaEF/szazNBIQ6qW8mBb6KxE9ix9T+RW7oErBkkfTH2dBu5n1HAIfopo4I
	 KTPXEsguwDIJKi4yeLwBtypGsnwr4BVAp6FwkeyL1GqT1/c49dBcKO/j7SV5e6Vr0B
	 I4jR4xSg2SZxhzAr2s3h6260lgugNxj7qrL8aw8OcwAP+58yTJpI+QtoJQq+HmurPV
	 vTr6sihHvne++ARI6WATwtwrp69xD8xaJciCnV1oL6j5e8/NTk/WldBqNVvV8zIFaQ
	 RsUimF8qwDQcA==
Message-ID: <69b9593a-7af6-4ceb-9251-1b75af90ea66@kernel.org>
Date: Tue, 17 Mar 2026 13:29:12 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v2] [v4l-utils, v2] libdvbv5: modify T2 delivery system
 descriptor
To: MVallevand <mvallevand@gmail.com>
Cc: linux-media@vger.kernel.org, Martin Vallevand <r3o2c7fi@duck.com>
References: <20260102235048.1596-1-r3o2c7fi@duck.com>
 <f55fdcbf-797e-47fe-865e-27dad0c3545c@kernel.org>
 <CAKCNfLXWzYn5YnLwRi9FPV5n_r3vF-1G97H8N=ONMK8m1rAixQ@mail.gmail.com>
Content-Language: en-US, nl
In-Reply-To: <CAKCNfLXWzYn5YnLwRi9FPV5n_r3vF-1G97H8N=ONMK8m1rAixQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56061-lists,linux-media=lfdr.de,cisco];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,duck.com:email]
X-Rspamd-Queue-Id: 1ACA12A9F02
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 17/03/2026 12:45, MVallevand wrote:
> On Tue, Mar 17, 2026 at 7:08 AM Hans Verkuil <hverkuil+cisco@kernel.org> wrote:
>>
>> Hi Martin,
>>
>> Apologies for the delay. It's been busy and I haven't had the time to go
>> through all pending v4l-utils patches until today...
>>
>> On 03/01/2026 00:50, Martin Vallevand wrote:
>>> ETSI EN 300 468 6.4.4.3 specifies the frequency loop length in the T2
>>> delivery system descriptor in bytes but libdvbv5 populates  it as the
>>> number of frequencies in the descriptor.
>>>
>>> This change ensures that the byte length is correctly converted
>>> to the frequency count, preventing potential memory corruption
>>> and buffer overflows.
>>
>> I need a Signed-off-by line from you before I can merge this.
>>
>> Just reply with your Sob and I'll merge the patch, since it looks good
>> otherwise.
>>
>> Make sure you use the same email address in your Sob as your 'From' email,
>> they should match.
>>
>> Thank you!
>>
>>         Hans
>>
>>> ---
>>>  lib/libdvbv5/descriptors/desc_t2_delivery.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/lib/libdvbv5/descriptors/desc_t2_delivery.c b/lib/libdvbv5/descriptors/desc_t2_delivery.c
>>> index f88718d350db..5d245cc973c5 100644
>>> --- a/lib/libdvbv5/descriptors/desc_t2_delivery.c
>>> +++ b/lib/libdvbv5/descriptors/desc_t2_delivery.c
>>> @@ -76,7 +76,7 @@ int dvb_desc_t2_delivery_init(struct dvb_v5_fe_parms *parms,
>>>               p += sizeof(uint16_t);
>>>
>>>               if (d->tfs_flag) {
>>> -                     d->cell[d->num_cell].num_freqs = *p;
>>> +                     d->cell[d->num_cell].num_freqs = *p / sizeof(*d->centre_frequency);
>>>                       p++;
>>>               }
>>>               else
>>> --
>>> 2.50.1.windows.1
>>>
> 
> THank you Hans
> 
> “Signed-off-by: Martin Vallevand <r3o2c7fi@duck.com>

That's different from your gmail address as used in your From: header.

Can I use your gmail address instead in the Sob?

Regards,

	Hans

