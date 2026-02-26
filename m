Return-Path: <linux-media+bounces-53606-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6IAvDdGQoGllkwQAu9opvQ
	(envelope-from <linux-media+bounces-53606-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 19:28:33 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2A11AD9F7
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 19:28:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4DBA430C17F9
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 18:03:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3643535A3BC;
	Thu, 26 Feb 2026 18:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hUOJ+iBn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A124355F5B
	for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 18:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772129017; cv=pass; b=MIljrOwjZBP1yuW+AYpjk245JwICC4ev78/w7RpAJOP5UbQ7csGY3mOpn6MwJLkebyXHj0ItPGYzqUOf337Mc2zsSh66V1HoH0hj2irUx6/7mXn7mF+dENRg5Dsdk34DGzs/G3GDiaWanIErzHa/rxjWUlYbhEeaVQfaKMU7iGs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772129017; c=relaxed/simple;
	bh=/VdG3rC0gGwM5+sHi4tU9peTW/HaTVJcFc8R/yRCdTU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fe89V4IKeyO2D5r437g9AymrXMBCS80KHVJrnLUbTwSh8lHBeXLrfgcE1Ya2gEGstFO6efi7IvIDZumUo5NLPOyKwNErcXAdhLDzEw505pCfx3lFS+iybfSiarzDV/skcFIOId5ma4510Xg91aJRKd6S45cK3/mlUbLAKnpdpEs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hUOJ+iBn; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b8fb6ad3243so170730666b.1
        for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 10:03:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772129015; cv=none;
        d=google.com; s=arc-20240605;
        b=R4uRaIguO+Mnc3CN4TtACvJg3RnoyKD0uIPBRmLEk3mcObUCMxEvCul2JLS6HxkGAt
         sTaohC4MX0eARKSyK7WTOJX0zMcEGs5o6t/Fr90Awp7NO7oSnDRxsqGjO+AO9Lw57XdB
         xRTaL9Bq7a3QAYvRn6r4eDqmuZ4H63TFSwwxFGwzNGe/fdwWAbOX+ZcD5LQmNh9pnG9O
         chtIbIfw+9Cf3uVhCYOehqACGiLt19rXeOQTy0xwHZX/PJsTGLDPutyBRfJirtv6t4V3
         MpxYK7BrlYxGS77Xt8jVOc5MtvqMxq6zOi491UZTCt+O/Qb/zBRJaaEYmz3zJbIT6pxs
         QXiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9Qnm2oa0MVzHK3SlIdevV2oCNgF9I6YsjdLLXN+h7bs=;
        fh=CsRZW/Zfns1t977TbvmQbwR3fkeSgAaCdLg/YW9YNKw=;
        b=PbwpMy38I8ZGcqZsK12mt+ewGBKU/fKU5JA2CmjRCy/VvLih0aJA3mgHVDnaFXsVuk
         //YgxfjcxnyjWTVdx4w+/Gsnn0ETO21vj2CNbTKocNp9aUleb8VY1YkrGRN5KddoY7wa
         ZVQa/oEvbdNNRcsf22kJHq0kj5BMlm2rQjTW7iGiaN/Frtqg66l/bs2L75cJKqZywHD0
         U6zbQeN+xuFL+TLoi0ilMoszDEYO54TAXDLj2YeRkZdncl8rbGkDGZQCg0fT68rK0PV9
         Pzm+0zmuG5FVBOHtnrx2nmdPquujv8Z5E5vpycuwyAF3i3VJOmRwxYKZz68D5ELFR6hy
         LqlA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772129015; x=1772733815; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Qnm2oa0MVzHK3SlIdevV2oCNgF9I6YsjdLLXN+h7bs=;
        b=hUOJ+iBnx3F3Li1c2T6LFk2MM39CfivWAfQpxA85AEX0/Qj3i0lmUq+sGhsZh9rP7+
         qq+hWk9FUPoS4CfALMPbHrw8k/A/L50CCJtsEb/ywQH3lOfg0oCmkh6Ofv6/+fGKLGzs
         HAj8EuWOUTtQa2OGXpXh1+LzXecrWv04AvC09WGmqswQLZ5KjEYtomdHofGn11ZKsy/Z
         sJfhwOhXCIeyGSLbSOYHYOt8Ewx/KpPtci/6O3WN5suepsN06Wep4CbXCw8J62l73ZTa
         h7KEd29SPWTKsNt8mTehbw9EYZ4OosW2TTNCzbYkb8hdInlTf/3RVH36Fc1EvAknUYAs
         HxqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772129015; x=1772733815;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9Qnm2oa0MVzHK3SlIdevV2oCNgF9I6YsjdLLXN+h7bs=;
        b=fO2rfMneKX0qraDXmPk4w+vts53qTiq1MKxwHG7rcD9zkfjAPZrj9fQD/wE1WNYXWf
         Uy8mZrO75mCUBQ5ZydLWwrJ5rGAC/qnnePO0/2b/T791P5pujuLKtCtFsyXRy/IqyNyM
         uU5JnWZTHXzgoFxJq7A1ocB2PEGCQSuLuMlZ1x1VcwJqIX7Eu9tdh6q2dWiEkDdAovAe
         Z2UHZBFtEvOLcwdQEc0NdnV4lLfEjkdrBnhpbzEl6dqPNIBJ2CGDKGx13klNfk/Vc0en
         5496jQYTgynYH3zrHuaPDVoeEUWeCkYV2DuBwB1wlRVv31fFZy4YC27zk8oQyQuXDj4y
         HXUQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/NxLnmU+VpUdgYPKNQEPepsI3HcKCeHdPb0z43oM7viLIAi3NKeub6SeSTOxCYOcvATo/pK0l4tHfiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQT9c6QxyvA0S0ugCn3nD399T0a/qN9vDEBDdZhCleD4B12Jb1
	iFdDJU1zCcG+zzS1QSckCDjv7RHDAk+ovGkk46mXqTyq8UFqp+OVIFCHLjF/5sIZ6c6sU+ZDEyX
	YhW7dm2yivKoH3QdxtTekcUe8d6RB6fqQ6BO9bHk=
X-Gm-Gg: ATEYQzzhPu+gwfTEOG6RSHxl1SE9p8aaoY9HmfhgdOGRM2HPH59BPL0nL7cD0gTn1eg
	3jYLq1EAWe1EbN8tlaX5Y9urY97+wMgsWsVT9bfi3wzvnHjTdSBu+OcCYi7di8olHGaYv3E+rF0
	U250XSTfVLccFQayV+XsoUdOD1Jb5XR8JaNVfkjeSbixCJVJzZjhjRCYMWugw8lNrvHVT9AMmEd
	pqHuydVkk4yskH06YsZstCyq3dazWPUPBmJqVkEja0ITc5Lkz9Ky+QNm6Dp6z1/QLZq0UzH5/8W
	1Bynz7kDdcGc8dxkKF5f8Ai+8sRBuRKoXXd1
X-Received: by 2002:a17:906:eec7:b0:b87:d255:39ff with SMTP id
 a640c23a62f3a-b9081b37fe6mr1411724466b.32.1772129014224; Thu, 26 Feb 2026
 10:03:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225-dma-buf-heaps-as-modules-v1-0-2109225a090d@kernel.org>
 <CANDhNCqk9Uk4aXHhUsL4hR1GHNmWZnH3C9Np-A02wdi+J3D7tA@mail.gmail.com> <20260226-adaptable-vermilion-nautilus-0aa6f0@penduick>
In-Reply-To: <20260226-adaptable-vermilion-nautilus-0aa6f0@penduick>
From: John Stultz <jstultz@google.com>
Date: Thu, 26 Feb 2026 10:03:21 -0800
X-Gm-Features: AaiRm538ftOfa1UyUjDoV9Yd7b0SRwtnSHBghCEM_shajRcZSxbK21W611Pqdkc
Message-ID: <CANDhNCrpNU7QJgu+0CZRvdxLwKp8VNxZoG_zDo7qqxaE0mjoTw@mail.gmail.com>
Subject: Re: [PATCH 0/7] dma-buf: heaps: Turn heaps into modules
To: Maxime Ripard <mripard@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	"T.J. Mercier" <tjmercier@google.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53606-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jstultz@google.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[googlesource.com:url,mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4B2A11AD9F7
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 2:18=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
> On Wed, Feb 25, 2026 at 10:51:30AM -0800, John Stultz wrote:
> > So heaps-as-modules is common in the Android kernels, and was
> > attempted to be upstreamed long ago:
> >   https://lore.kernel.org/lkml/20191025234834.28214-1-john.stultz@linar=
o.org/
> >
> > And it got a fairly chilly reception, but maybe having the additional
> > optee heap (as well as other proposed heaps) might sway folks on this
> > now.
>
> I didn't know that Android was using heap as modules only, but I'd say
> that it's even more of a reason to upstream it then.
>
> > There is also the kref bits you might need (which Android still carries=
):
> >   https://lore.kernel.org/lkml/20200725032633.125006-1-john.stultz@lina=
ro.org/
>
> I'm curious about this one though. It looks like you add refcounting,
> but never really get the references anywhere. What was your intent, that
> on every allocation the buffer would get a reference to the heap so we
> avoid removing a heap with allocated buffers?

Oh, apologies I mixed this up. You can ignore that suggestion.

In Android, once folks were familiar with thinking about dma-buf
heaps, some (out of tree) drivers wanted to be able to internally
allocate from a given heap (somewhat of a hold-over from the old ION
drivers). So we have a convenience patch to provide that:
   https://android.googlesource.com/kernel/common/+/8e1ec97355ef9927e82ec18=
c98312bdcd80bf289%5E%21/

And since we return a dma_heap to the driver to allocate against:
  https://android.googlesource.com/kernel/common/+/fc1310ebf8fe25ea7b983400=
e6fa41f5a6d11966%5E%21/

The kref bit is to make sure we're doing proper reference counting on
that shared pointer.

This ended up getting bundled together along with the heaps-as-modules
changes in our out-of-tree changes, and I just confused its use here.

thanks
-john

