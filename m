Return-Path: <linux-media+bounces-56207-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HZfKMyaumnaZQIAu9opvQ
	(envelope-from <linux-media+bounces-56207-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 13:30:04 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9FF2BB7C6
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 13:30:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A73831743A2
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 12:25:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3FD73D6660;
	Wed, 18 Mar 2026 12:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Nc1vrRJX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C422839F164
	for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 12:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773836744; cv=none; b=YhwoEOmB/wOapfZshq2ya4LE8t1c+Yv4H79J7H9f94jzvbP1GIrX/eVXPpdV9rOc/jix8IRm8w/baRY18BfHigQHqFHOQzB47uRT1HNEWkWGXbvie//5MlF57CpdT+TSDUUOeWcnJZzEfLK12OYe2+2kByTQutWzvn6uuLyssX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773836744; c=relaxed/simple;
	bh=tNcB6GwduquJMlSdaX8j4GeKZOrZxC2WymXY0QkiiiQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TccoLresYJCdGnIFL7+fS38sWkAk7Wm1Bgtqw8ohorU6bR2vWkdKJlbW06+HeGc547ODg0bUPxZFvMKHm9qKVKCseW8+1RZyOq9JhLgFWMsuUF+XbQOsQ11vwzqNmi65O/7pNBIMlIwi1rCR8CSkOjvlanc3Wy1m7FLGGvRHJ/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Nc1vrRJX; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-48539bda3dcso71258205e9.2
        for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 05:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773836739; x=1774441539; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UlJezP5+/1fujrnKlE3SL7R1CpkwMMIibiFc+CCvrMk=;
        b=Nc1vrRJXMJJ10Km2mXixbzcjif5HpTbHrkuXp7l7sX4/hV7863E5msjaau4lEpN0EA
         CokH69rcqVer92lJeJ53gysRm7tZrCAn3uOOLhbDV/BR570rD5FNTfHdhCitP5S2YP8Z
         qDZf3aOeiI0DuLlxC5viTdgFr7zNARrEQAWL3ymb8jpALEYbLHV2gaW2flqj4OoY9pBQ
         cAF35YvNcboky8esA72gYW0PqPic2RjPq3xwiUVowH6eGSa8skibpMmLAhXN4idp3VZu
         obv8CQspTqSakXi7NKzwdAENds+6znAUNtIPNv0g55v5n1MBTu8yAXMu83R99YhKBRLo
         yExw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773836739; x=1774441539;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UlJezP5+/1fujrnKlE3SL7R1CpkwMMIibiFc+CCvrMk=;
        b=cuP7UOK/XBR7HYR7qUmqn3syRu0pRGM8FHWIOcDaeZANFQph7reZKm4jPJ/hdQpyuf
         yS+Njv0EkC1tzwV+UgNt9cYFbxMTkc05VTAJMqAoJjdGc8HxqMQzMQ427RroZ5qt6p8d
         rqgQJB8i0o9ImituLd/XgIUyzItAFZcimvJtku+95qipPBtTxKjndrQebBuLzNU5/Y61
         zgT7s9cS1wZ0DEjAPRJ8hGg6iX2zH2mfQOBB/3najXuTeli3LSW9q28ij6Dn3UWdCcgH
         0ZfB80J2WeVU4UxXBHFl3SusUXm0MfImvCEq4sI+lIebNDFTagJrSsbij5PLtbNe4smD
         NWHw==
X-Forwarded-Encrypted: i=1; AJvYcCV5nfHqrBdd5IbBQPp+VkmFpvQGD7Q8L3sztbUaiCT3sCCycTW2xuR+WmTNJeUiAr/+Fk9I/gKRr201qA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwA0m/05mPYNxXRUEPKu8iV9YRkSuKLMkDLINLgpHuIs0eyGd+3
	XALAKWgob9Sxo9K45DaeXujtAuBukwLEOwHMoWu/Cqbtfj/hvUdyHVU4iNa79CSmLrT8kgQ7MzR
	1bceLyHJiwGGkxIT3kQ==
X-Received: from wmfu16.prod.google.com ([2002:a05:600c:1390:b0:483:7f25:eadd])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6d97:b0:46e:4e6d:79f4 with SMTP id 5b1f17b1804b1-486f4460736mr35691675e9.15.1773836738625;
 Wed, 18 Mar 2026 05:25:38 -0700 (PDT)
Date: Wed, 18 Mar 2026 12:25:36 +0000
In-Reply-To: <20260317144825.2318-1-christian.koenig@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260317144825.2318-1-christian.koenig@amd.com>
Message-ID: <abqZwCJhPFeu7hAy@google.com>
Subject: Re: [PATCH] dma-buf/dma_fence: be more defensive in dma_fence_release
From: Alice Ryhl <aliceryhl@google.com>
To: "Christian =?utf-8?B?S8O2bmln?=" <ckoenig.leichtzumerken@gmail.com>
Cc: phasta@mailbox.org, boris.brezillon@collabora.com, gary@garyguo.net, 
	lossin@kernel.org, daniel.almeida@collabora.com, joelagnelf@nvidia.com, 
	sumit.semwal@linaro.org, dri-devel@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-56207-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[google.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,amd.com:email]
X-Rspamd-Queue-Id: 1A9FF2BB7C6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 03:48:25PM +0100, Christian K=C3=B6nig wrote:
> In case of a refcounting bug dma_fence_release() can be called before the
> fence was even signaled.
>=20
> Previously the dma_fence framework then force signaled the fence to make
> sure to unblock waiters, but that can potentially lead to random memory
> corruption when the DMA operation continues. So be more defensive here an=
d
> pick the lesser evil.
>=20
> Instead of force signaling the fence set an error code on the fence,
> re-initialize the refcount to something large and taint the kernel.
>=20
> This will leak memory and eventually can cause a deadlock when the fence
> is never signaled, but at least we won't run into an use after free or
> random memory corruption.
>=20
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/dma-fence.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index 1826ba73094c..8bf07685a053 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -593,14 +593,24 @@ void dma_fence_release(struct kref *kref)
>  		/*
>  		 * Failed to signal before release, likely a refcounting issue.
>  		 *
> -		 * This should never happen, but if it does make sure that we
> -		 * don't leave chains dangling. We set the error flag first
> -		 * so that the callbacks know this signal is due to an error.
> +		 * This should never happen, but if try to be defensive and take
> +		 * the lesser evil. Initialize the refcount to something large,
> +		 * but not so large that it can overflow.
> +		 *
> +		 * That will leak memory and could deadlock if the fence never
> +		 * signals, but at least it doesn't cause an use after free or
> +		 * random memory corruption.
> +		 *
> +		 * Also taint the kernel to note that it is rather unreliable to
> +		 * continue.
>  		 */
>  		dma_fence_lock_irqsave(fence, flags);
>  		fence->error =3D -EDEADLK;
> -		dma_fence_signal_locked(fence);
> +		refcount_set(&fence->refcount.refcount, INT_MAX);

It's much better to leave the refcount with a value of zero here. That
way, when the refcount is decremented next time, the usual underflow
detection checks will trigger.

You can still skip the kfree() to avoid use-after-free.

Alice

