Return-Path: <linux-media+bounces-53422-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLUwBH1rn2lEbwQAu9opvQ
	(envelope-from <linux-media+bounces-53422-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 22:37:01 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CEC19DE4B
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 22:36:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2F8A33033FA3
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 21:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AF66314B77;
	Wed, 25 Feb 2026 21:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="PTPXdzaI"
X-Original-To: linux-media@vger.kernel.org
Received: from 013.lax.mailroute.net (013.lax.mailroute.net [199.89.1.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C86326B2CE
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 21:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772055398; cv=none; b=vEdLIL7L9C9MlgI3OekC/hzRfZZB76g/0ol1D7zo6ovmZcv6AfA0Qb7mZv3GuGKD7CsVsJM7phN52HB+Qt/afMSn8+SQeuy9R05Up9siqQirfGvj15NK0eTyVXjvT0oSVDEV/guHQp/LyXbn85m9eEeBVju29LdP+5mn7x3mE68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772055398; c=relaxed/simple;
	bh=12eqoTIqgzcY4Y06x+NEqszdyQ8W3r4IQnBQHKlilxs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K2Gbu7SRiNCo7dtn21dRrbclhj3tYRT2JI1Gd3LvqSZpe3cjFXrro/q2mebl2Axf9c+KDM7FayE5oiaclU1R3EW+0u7Qu/ZsOcy4w8C+S74Dci3HhxmZTVvnPNIg1KjdfMLRRNY2tG0v7xDkPcvOpZQG4riY8Y2uWDB+SO4NTC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=PTPXdzaI; arc=none smtp.client-ip=199.89.1.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4fLnwN4D6szlh1Vr;
	Wed, 25 Feb 2026 21:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1772055395; x=1774647396; bh=tvoeNWi7tmMmAc79NIW5W9Kp
	hTqd0vWyB0tCFdErVm0=; b=PTPXdzaI76Or2/s3VAD8YLD6FXzZijLp09CgQfct
	+oJqiFcUe7UqOPZP3E50A2Vniw1JEAbXgxIG5qMeN3SXdee/4MZo3ueLzaDTtQyg
	COKRs7Tw4MhdHJum0sac287SEEgCuuHTBwfZeuAFF2Fp2ML1nxqZUjxbknVFmleP
	FrxhQiyLn8Ct4xjOYuSbR2umt+wz9cV59iz3BfJdU1J1F9hrOrcaqwvzZcTtb/nB
	qQgdSUz/O8CmVKH4ghY3Xa8EJV3QeOnowXTBoB5xnQGNgvoVcoh53tNZ96dpcehZ
	IYxUbcm+Zp8HhXDh4uonz+Hx0msD0QnhNfvE3MU74kGNaA==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id 1-3uw6EUFkbA; Wed, 25 Feb 2026 21:36:35 +0000 (UTC)
Received: from [172.20.2.156] (unknown [4.28.11.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4fLnwL4tRLzlh1WF;
	Wed, 25 Feb 2026 21:36:34 +0000 (UTC)
Message-ID: <ac015b04-3506-4035-b732-f643a3cde4b0@acm.org>
Date: Wed, 25 Feb 2026 13:36:33 -0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/62] dma-buf: Handle all dma_resv_lock() errors
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Peter Zijlstra <peterz@infradead.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
References: <20260223214950.2153735-1-bvanassche@acm.org>
 <20260223214950.2153735-7-bvanassche@acm.org>
 <5d9daad3-a687-4116-99fc-b6c7d82fe5a9@amd.com>
 <975acbb3-a4d3-45a6-9aad-3682c46e8fd8@acm.org>
 <5e23a5f9-0eaa-419e-ada6-4389754075bc@amd.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <5e23a5f9-0eaa-419e-ada6-4389754075bc@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[acm.org,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[acm.org:s=mr01];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53422-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D8CEC19DE4B
X-Rspamd-Action: no action

On 2/25/26 12:16 AM, Christian K=C3=B6nig wrote:
> Would it help if we change the code like this?
>=20
>          ret =3D dma_resv_lock(&obj, &ctx);
> -       if (ret =3D=3D -EDEADLK)
> +       /* Only EDEADLK from the error injection is possible here */
> +       if (ret)
>                  dma_resv_lock_slow(&obj, &ctx);

Yes, the above is sufficient to suppress the Clang thread-safety warning
for dma_resv_lockdep(). Is a source code comment about EDEADLK preferred
or would the following perhaps also be acceptable?

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index bea3e9858aca..4d65dddbcbdf 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -790,8 +790,10 @@ static int __init dma_resv_lockdep(void)
         mmap_read_lock(mm);
         ww_acquire_init(&ctx, &reservation_ww_class);
         ret =3D dma_resv_lock(&obj, &ctx);
-       if (ret =3D=3D -EDEADLK)
+       if (ret) {
+               WARN_ON_ONCE(ret !=3D -EDEADLK);
                 dma_resv_lock_slow(&obj, &ctx);
+       }
         fs_reclaim_acquire(GFP_KERNEL);
         /* for unmap_mapping_range on trylocked buffer objects in=20
shrinkers */
         i_mmap_lock_write(&mapping);

Thanks,

Bart.

