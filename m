Return-Path: <linux-media+bounces-51057-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 07697D3A9EF
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 14:09:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 786D03002B85
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 13:09:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E5CC364EBD;
	Mon, 19 Jan 2026 13:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wa4xa3OK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DBD35E536
	for <linux-media@vger.kernel.org>; Mon, 19 Jan 2026 13:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768828167; cv=pass; b=PoBDFRJJ0DGy7BLm7vlb+TA0pEufmgc6D5PcexF3QCTlj7ZhtpcZ4zf+k8/UmfrvN6I7+oNHID+01l9RbKYis9S3guOlP/TlKRk54IsvabVl7IH8Zld1eF6tZd7V/NkuZL6toQYy24Rb2IP9oKtA2akn4GY3+wvsnbZV4OeAAf4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768828167; c=relaxed/simple;
	bh=dq0JDh/8icBDBSEsY1eC6bpJ7R/xK2j7R0ikxEAxkoA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XOE/sQxsWIi231MUPnwh+YWbZOLakvoktRBHemQ4vH6JsvRXsrvZILc9NB4WAWjLHaSuU4oeP00gfkh3fRsn6co6YoG+qmY56Mq5JA6oRKOpqoAWRG8VClfJa8T8CfjazTFDmyCbyHshlxQ/Qx4UU1USABtfT3RDt4UIEkTgF5s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Wa4xa3OK; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b8010b8f078so715138166b.0
        for <linux-media@vger.kernel.org>; Mon, 19 Jan 2026 05:09:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768828165; cv=none;
        d=google.com; s=arc-20240605;
        b=k9HEGY5DrQM1qKoCCD7/mDaquBwotKRj4K9n8FB5wpLZEnwBJzv2fYZS40wFGydpyQ
         pAgwr+jTCmNIjmJJnohXrV/QVZfV08+RNv2MU2Z95OOwbBsQiPBRw+YQx1GF4yzcA9Pw
         vi55sQCbLFKdB4FnVyrysXsz5FKznKEuEFcgnmF6KkhXmBtWTEAQuC3hS+cU0Cj96ww7
         vw90tbOhx2rFhNwwpsz7Cl3trEEUTq8XMANyXgcnrYdr111jqZI2NRXiTjQqN26/+D18
         cQ4PnAgZwzE8JgmPpBiLRMHH5RsGAFmXljwtgIp3GZTtnMrIOmZuNQfFhrSCB0ejhYmm
         RJdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dq0JDh/8icBDBSEsY1eC6bpJ7R/xK2j7R0ikxEAxkoA=;
        fh=MjNAvjzNX4NpSpTg2c1pAaeow4m8SjV3LTNQUgIgeyI=;
        b=kKNoKz5FBvtwDHn7ov/ZXafmawHCSYFS10nyjyTTM22WeP0z+DpSb/oEDZAwPG87pt
         nI14iazKydyIuJFizjwrAdz5GSsr3tC1DrI2EFffM/XIIuSLpzIQ3Jw0KoXWX9oTQEGi
         loEC4zRK+7UXHE66wLILtx1Bk27BbuB/7v59KCKIPMayXE2pzSKPuWNs++H4J0fLsNlF
         Jj4GHdI5m6YAPAWxxTkeYuMe2ps4bkPq9IaiUG6M1SzXIeiC1YKrazNPzlQhCary3utv
         zDV4lSN6ifVOymGFxZGVn6QncDJWUpXH4bvLId7Dt9vMB4xDs8/rl51yC6WK2BV6Vn1r
         Xo/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768828165; x=1769432965; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dq0JDh/8icBDBSEsY1eC6bpJ7R/xK2j7R0ikxEAxkoA=;
        b=Wa4xa3OKrTyEhBg6BTPpYgNdI50ntmu3wTHMSM26qEDBIOnyJLzcMkxIkRzW0Wj5aY
         CVgUGFmm4khoebUvmq3zKEDsG/6PTgubuBVza7ED8qzWXfqc3qRGyavElWCy2MsXTjnW
         /eGxHRI34fOwR4wn8QZ4eLrnJmZYL53X1DrCFzky1QlhdTF7efOQpxfktecqsBl5TEah
         wNAGKbSeHi6bFDxfwaAtAa4qatpGM5Uj+T5pbnMbvItpNiICEHwm5uSqFHhoL0QEcZ1l
         3FgNlAUAgjxBAExBwWoLQ1jK7HSLUPZbLQskxiZKqvCVfKlz4HM1J/DOz+ZbWIYj1Lys
         2NWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768828165; x=1769432965;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dq0JDh/8icBDBSEsY1eC6bpJ7R/xK2j7R0ikxEAxkoA=;
        b=H3twR1TycKjpLfH8GRStePRM6K32IECPbT9DqaBoL/3v4/OcP5zJ0E+rOPOpmuRQch
         x3rOpd3GsTEoFstxXywcI5jF1eHbguPmxMKQqYtkrTADwaFQ37MTG9tbHVp3f25WBrlv
         N2pZvqAn05dyD2mq/JKBocCjLYHTDPPBqnK/2HnooR9m0FaiiAI9128n+60tG6saFCBF
         nyJHIjmTZDm+v3z/yA7/y31wEUcF2jepthU4Tsw0GdWdOQ4UEqlZIAD+bkJVBfPeHTXz
         49750a3/B6+p8y+vuZd3sHT+Cg0sK8ji9czWMKrbSXs/jDwGKPqIkynuVwUOlmiO+bw1
         m0iQ==
X-Forwarded-Encrypted: i=1; AJvYcCWatFpIECTdd0fGS5WBLDXIKBMTfy4XogknAWBMU4m1i3HXq3o2mllupoA2QCDGPFhQccjXjI0Cf65X4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSxxekftIVUnQpJugHybISPoFRncyJmHzT9MMbBy/WJ9RvwvwO
	YoaE1xUNh5e4PHukfenerCVARQsXIKQwGLv9n/2DYLwsriG+19ZJz9uvdJ0MoMsg0iZ8n6GD2p5
	BghNG2KNrktc+xDwIzPmzLInQq7dGZVsv/0M1vEdk8Q==
X-Gm-Gg: AY/fxX5CzuqK7yvyX6sqyupcnkxhy9esDDbGdPGPpQjdCaPW1GPQwrXi5btfYdNNYe5
	mNvRybdYyVK+z2JadiSNJ0GscTMZRAoRIkZLj89ytlqQcFs0WU2E8xeJpjIl0M7UAcpNfqBc+51
	TqhLkgdR7CbXGaJzqHNSFMxqsPiBnSIFbvndW0BJUTrWtQ3VLN52LotcY0rHH2OIxI4x/IvjNyA
	dKt8nr84aT7NrB4YGak4fPBc6ur2iXXaUptexJH8cxydnhT7sslfxYy8VPUseE6cMk9Zgd73y0H
	LHCqowpoQC9vP1EAnbRuJ9iwIfo=
X-Received: by 2002:a17:907:944c:b0:b87:324b:9ae1 with SMTP id
 a640c23a62f3a-b8796aee9ccmr1020227666b.40.1768828164660; Mon, 19 Jan 2026
 05:09:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260116-dmabuf-heap-system-memcg-v3-0-ecc6b62cc446@redhat.com>
 <20260116-dmabuf-heap-system-memcg-v3-2-ecc6b62cc446@redhat.com> <CABdmKX21XWwwOWZ969GT=DOu7_aofKR7E6+4iMggbELVM=zYAQ@mail.gmail.com>
In-Reply-To: <CABdmKX21XWwwOWZ969GT=DOu7_aofKR7E6+4iMggbELVM=zYAQ@mail.gmail.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Mon, 19 Jan 2026 18:39:13 +0530
X-Gm-Features: AZwV_QirK4eHvVLrlVMfEp91UoJml_vMBrWLaPQVZT2bzdXxn7wRhnkQb0VhLYo
Message-ID: <CAO_48GHqPj_OXd0V-k6YG837wHBKBpOCjRbMN-kbkF=nK+_s2w@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] dma-buf: system_heap: account for system heap
 allocation in memcg
To: "T.J. Mercier" <tjmercier@google.com>
Cc: Eric Chanudet <echanude@redhat.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Maxime Ripard <mripard@redhat.com>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Eric,

On Sat, 17 Jan 2026 at 04:07, T.J. Mercier <tjmercier@google.com> wrote:
>
> On Fri, Jan 16, 2026 at 12:06=E2=80=AFPM Eric Chanudet <echanude@redhat.c=
om> wrote:
> >
> > The system dma-buf heap lets userspace allocate buffers from the page
> > allocator. However, these allocations are not accounted for in memcg,
> > allowing processes to escape limits that may be configured.
> >
> > Pass __GFP_ACCOUNT for system heap allocations, based on the
> > dma_heap.mem_accounting parameter, to use memcg and account for them.
> >
> > Signed-off-by: Eric Chanudet <echanude@redhat.com>
>
> Reviewed-by: T.J. Mercier <tjmercier@google.com>

Thank you for the series; LGTM, I'll push it tonight to drm-misc-next.

Best,
Sumit.

