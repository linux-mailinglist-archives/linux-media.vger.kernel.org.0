Return-Path: <linux-media+bounces-53756-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2EdoBPvZoWlcwgQAu9opvQ
	(envelope-from <linux-media+bounces-53756-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 18:52:59 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC511BBA62
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 18:52:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 66691305DAA1
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 17:49:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EE183624C8;
	Fri, 27 Feb 2026 17:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="DVaKcqEr"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524BF361DBF;
	Fri, 27 Feb 2026 17:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772214577; cv=none; b=jF+gyTRoda7iLzDobVTQlxRByc/kGAaTh7WTolm3GoA1+6AkfKTW/q1ChYuXOMIcWqxkNIB+kwCc3KFZWEyG1HB4xFWFjYhqhcR5itl4FeUEBudEvAVCWCZAtGgfDlEDLm5WFDhMoQ0VgaSOyjHqmSVImk0ZbvtlpF2eT9sF+Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772214577; c=relaxed/simple;
	bh=SpE+cfNaP1TFrPzaUFYC0O9H8FoRYo0yR/OZFLjxALo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rc3Mk/h48myUzG7GW8RrbdGOVoqZvCUi2evegKP8vxkF23KNdsCdAJP2OAE5Zxu3zbrrpryU23yezYhczZsLi0DCN1QEhYgS10EXNIWkMbqN6UkwICtO1onmvjrHkeAJixBoCbarXQdbg4tU+lCMdCHYSeFAURaK8d6swbhz7ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=DVaKcqEr; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772214574;
	bh=SpE+cfNaP1TFrPzaUFYC0O9H8FoRYo0yR/OZFLjxALo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DVaKcqErMmK37/uJXaKthCMiluQqJM7uAJYCmJcrnFscZ4q+4KopoQJ+kelS7x7jw
	 3YaldOMsay/sDkvHIHQw6Iuqmw9XDH7+TMWuetAm5rW9kgUOntjSJE2nBUc85SDs81
	 0M88Z1csETPWYBba9DmoDjZReGL9fo7PGZRYiz6dJDQ4byM9jWuMTSyqdg6e/dBMYP
	 RpbzOwsS3E4AqG9TY+jcdS+m9Ha9taIcgFm8H084/xiGRq7zaKvANQEfCzgOOlvQlS
	 v62oXqNpUmHncmwHovx9ANNPB7XIxEo4rdRaFNSvqLqX/8KXty5Ccb72vCQAoXoRfb
	 yOGMqWMxIf7TQ==
Received: from [192.168.1.90] (unknown [86.123.23.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C587C17E03E5;
	Fri, 27 Feb 2026 18:49:33 +0100 (CET)
Message-ID: <86f4e4ee-cf49-4ebe-8cc6-0a9763ade36a@collabora.com>
Date: Fri, 27 Feb 2026 19:49:33 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] media: dt-bindings: rockchip,vdec: Add alternative
 reg-names order for RK35{76,88}
To: Conor Dooley <conor@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>, kernel@collabora.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>, linux-media@vger.kernel.org
References: <20260226-vdec-reg-order-rk3576-v4-0-b8d72dc75250@collabora.com>
 <20260226-vdec-reg-order-rk3576-v4-1-b8d72dc75250@collabora.com>
 <20260226-salute-threaten-a3eabb232396@spud>
 <429f3c7aa22eccffedbf8db6aa91bee3dd13814a.camel@collabora.com>
 <20260226-snide-foil-a05e1aa156a8@spud>
 <3d28c699e47f606bad46bb6447785badace37793.camel@collabora.com>
 <20260227-atonable-glamorous-920cfd832bc1@spud>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20260227-atonable-glamorous-920cfd832bc1@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53756-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian.ciocaltea@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:mid,collabora.com:dkim]
X-Rspamd-Queue-Id: 5FC511BBA62
X-Rspamd-Action: no action

On 2/27/26 7:18 PM, Conor Dooley wrote:
> On Thu, Feb 26, 2026 at 04:56:30PM -0500, Nicolas Dufresne wrote:
>> Le jeudi 26 février 2026 à 20:59 +0000, Conor Dooley a écrit :
>>> On Thu, Feb 26, 2026 at 02:45:11PM -0500, Nicolas Dufresne wrote:
>>>> Le jeudi 26 février 2026 à 18:43 +0000, Conor Dooley a écrit :
> 
>>>>> Deprecating the order also makes little sense to me, given that some of
>>>>> these devices only have one reg entry, which as far as I can tell from
>>>>> looking at the driver *is* the "function" region, so it can never be
>>>>> entirely deprecated.
>>>>
>>>> What I'd like to see, is a binding expression that behave like a set, not a
>>>> list, and leave the ordering open. As people keep repeating, there is nothing in
>>>> a binding that assist to define the right ordering (its not address or base
>>>> addres aware). That basically means, we can't as reviewer see that ordering is
>>>> going to imposing using a base address in the unit name (which is a convenience,
>>>> not a rule I suppose) that differ from the vendor documented base address.
>>>>
>>>> By explicitly removing the ordering in the binding, we create a strict rule that
>>>> driver should retrieve this by name, and never assume the ordering, which I
>>>> personally like.
>>>>
>>>> thoughts ?
>>>
>>> Yeah, you can do this, but to avoid potential breaks you have to do it
>>> from the start, not after the fact. Probably there's bindings that get
>>> acked every day that do do this. Even the retcon is okay to do when
>>> reg-names is mandated by the binding and the users use reg-names in my
>>> opinion.
>>
>> I think from the above analyses, since the usage only starts in rc1, we have
>> room for improving it knowing we aren't creating problem for anyone. Note that I
>> have no idea what the syntax is to "do this", and I doubt either Detlev or
>> Cristian have a clue.
> 
> I think this is the only bit that really still needs a reply, this can
> be solved by adding reg-names as "required" to the existing conditional
> portion of the binding. There's probably hundreds of examples if one
> does a search for "then:\n.*required:" to use a basis for the change
> here. Probably should be an independent change, since it is needed even
> without the re-order given the bug I brought up.

As mentioned in my previous reply, the actual problem is that the binding has
been already released, and I'm not sure we can change this without breaking the
ABI.

Regards,
Cristian


