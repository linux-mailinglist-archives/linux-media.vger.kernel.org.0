Return-Path: <linux-media+bounces-58042-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +IHaN9Ae0Glk3gYAu9opvQ
	(envelope-from <linux-media+bounces-58042-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Apr 2026 22:10:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A97398155
	for <lists+linux-media@lfdr.de>; Fri, 03 Apr 2026 22:10:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 751A03008323
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2026 20:10:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 388BD2D7DE1;
	Fri,  3 Apr 2026 20:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="GYzBL6Th"
X-Original-To: linux-media@vger.kernel.org
Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C3F3D5677
	for <linux-media@vger.kernel.org>; Fri,  3 Apr 2026 20:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775247050; cv=none; b=A6y+AcNmDI/WYRxQiiCAqEeiatVdbPmXj6kcQOWnqbftzCI5dIgg0Gx3WnJSNBW5LXixdvm19fCj0VQs9ez8ZlU8N4k6TnAksGGLbqFACnbJq6/u39kiTgmVGfcQOHLtJvHE7X0FgnAveFGmLLUqLvFTG38vd+kiihOTZe22HwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775247050; c=relaxed/simple;
	bh=IILKghfV+duAnEzh0YpUqBEoW+6oMDhP4uKBEB+4bKs=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=G4UIhQe9sXZinu3v5zgrybSRM+gRak8A67EAaFAFsIj8pV0Bgfx/867hAlMT2q+8/GWfs4ZaStGACdekbI2wNrID9uTqNT7gpHmdu5Ip8oWmdjRsqp522vwy6DYV+whBVUBMVVq/eWYLgT7zir4W/CEeE5xfWPOTx7RJeml1WaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=GYzBL6Th; arc=none smtp.client-ip=199.89.1.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4fnVGB5z6yz1XM6JX;
	Fri,  3 Apr 2026 20:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:content-language:references:from:from:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1775247040; x=1777839041; bh=IILKghfV+duAnEzh0YpUqBEo
	W+6oMDhP4uKBEB+4bKs=; b=GYzBL6ThlalWq90TBko5hp6xnfiSgIbZNoRFhwVI
	WYpJv+NSFcJqPKYHCyeOLM1+qBHvDSDg5nDd6H0PI8XlCY2dteuYhf3FjKSi5TyD
	HvyGLrtdRRmdr4WzR143sopFSFafGph026M8IZdTmnzVGW6GoTq/FLW0TukxsA4o
	XRw/pwjR91I0ViHj7EACohnBZsOeJHMVAKkFsgRFMKsv7Q0E0yh6cJtZmbNK0TyA
	7FVrXjw51b4KvhnX2vugxNAQLvACunnFRYPt5ipY6WGHwQNh3IbiZp9XyAxuQzGI
	r7Ht7OdXuR7yILJ4wYhiUhjpoCyIxU6J3PocoOvwsR8H7g==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id 78zBGARQNsIR; Fri,  3 Apr 2026 20:10:40 +0000 (UTC)
Received: from [192.168.50.14] (c-73-231-117-72.hsd1.ca.comcast.net [73.231.117.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4fnVG72PQDz1XM6JJ;
	Fri,  3 Apr 2026 20:10:38 +0000 (UTC)
Message-ID: <480c84a1-8711-44c9-b863-8b3f8e35d09f@acm.org>
Date: Fri, 3 Apr 2026 13:10:38 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dma-buf: Suppress a thread-safety complaint
From: Bart Van Assche <bvanassche@acm.org>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
 Marco Elver <elver@google.com>
References: <20260227165501.2062829-1-bvanassche@acm.org>
 <e1d95b76-7e7b-4dc3-a9a2-37f1d7f85988@amd.com>
 <5ca3bada-c52b-49ab-9078-cb64d69759e8@acm.org>
Content-Language: en-US
In-Reply-To: <5ca3bada-c52b-49ab-9078-cb64d69759e8@acm.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[acm.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[acm.org:s=mr01];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58042-lists,linux-media=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[acm.org:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bvanassche@acm.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 16A97398155
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/2/26 12:53 PM, Bart Van Assche wrote:
> On 3/2/26 1:06 AM, Christian K=C3=B6nig wrote:
>> On 2/27/26 17:55, Bart Van Assche wrote:
>>> Handle all possible dma_resv_lock() return values. This patch prepare=
s
>>> for enabling compile-time thread-safety analysis. This will cause the
>>> compiler to check whether all dma_resv_lock() return values are handl=
ed.
>>>
>>> Signed-off-by: Bart Van Assche <bvanassche@acm.org>
>>
>> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>>
>> Do you want to push that one upstream through the DMA-buf path or do
>> you want to upstream it through some other branch?
>
> The DMA-buf path please. Peter Zijlstra requested this as one can see h=
ere:
> https://lore.kernel.org/=20
> lkml/20260223220117.GT1282955@noisy.programming.kicks-ass.net/

(replying to my own email)

Is my understanding correct that this patch has not yet been queued? If=20
so, please let me know if I'm expected to repost this patch.

Thanks,

Bart.

